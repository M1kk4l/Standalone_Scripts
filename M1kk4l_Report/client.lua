RegisterNUICallback("Tekst", function(data)
    SetDisplay(false)

    Navn = data.Navn
    Grund = data.Grund

    print("Sendt til alle admins!")

    TriggerServerEvent("SendDiscord", Navn, Grund)
end)

RegisterNUICallback("lukreport", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("Fejl", function(data)
    Besked = data.Besked
    print(Besked)

    if Config.mythic_notify == true then
        exports['mythic_notify']:DoHudText('error', ''..Besked..'')
    end

    if Config.pNotify == true then
        TriggerEvent("pNotify:SendNotification",{text = ""..Besked.."",timeout = (5000),layout = "centerRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}}) 
    end
end)

RegisterCommand("report", function(source, args, rawCommandString)
    SetDisplay(true)
end)

RegisterNUICallback("luk", function(data)
    SetDisplay(false)
end)

function SetDisplay(bool)
    show = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

AddEventHandler("onResourceStop",function(resource)
    if resource == GetCurrentResourceName() then
        SetDisplay(false)
    end
end)
