
local coords = {
	['center'] = {x=219.98,y=-884.48,z=30.69},
	['sandy'] = {x=318.82,y=2622.06,z=44.47},
	['paleto'] = {x=106.38,y=6609.39,z=31.93},
	['pillbox'] = {x=295.25,y=-611.19,z=43.36},
	['centerclothes'] = {x=429.53,y=-803.025,z=29.49},
	['lufthavn'] = {x=-1027.65,y=-2493.39,z=13.85}
}

RegisterNetEvent('setDisplay:display')
AddEventHandler('setDisplay', function(value)
	SetNuiFocus(value,value)
  	SendNUIMessage({ showmenu = value })
end)


RegisterNUICallback("ButtonClick",function(data,cb)
	TriggerEvent('setDisplay', false)

    if data == 'lastpos' then
        local coordsMe = GetEntityCoords(PlayerPedId(), false)
        Teleport(coordsMe['x'], coordsMe['y'], coordsMe['z'],true)
    else
        Teleport(coords[data].x,coords[data].y,coords[data].z,true)
    end
end)

AddEventHandler("playerSpawned",function()
    DoScreenFadeOut(500)
    Wait(500)
    SetTimecycleModifier("hud_def_blur")
    
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -1355.93,-1487.78,520.75, 300.00,0.00,0.00, 100.00, false, 0)
    SetCamActive(cam, true)
    RenderScriptCams(1, 0, 750, 1, 1)
    TriggerEvent("pNotify:SendNotification",{text = "<center>Indlæser...</center>",type = "success",timeout = (7500),layout = "center",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    Wait(8000)
    DoScreenFadeIn(500)
    
    TriggerEvent('setDisplay', true)
end)

RegisterCommand('spawn', function()
    DoScreenFadeOut(500)
    Wait(500)
    SetTimecycleModifier("hud_def_blur")
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -1355.93,-1487.78,520.75, 300.00,0.00,0.00, 100.00, false, 0)
    SetCamActive(cam, true)
    RenderScriptCams(1, 0, 750, 1, 1)
    Wait(2000)
    DoScreenFadeIn(500)

    TriggerEvent('setDisplay', true)
end)

function Teleport(x,y,z,teleportPlayer)
    SetTimecycleModifier("default")

    if teleportPlayer then
        SetEntityCoords(PlayerPedId(), x,y,z, false)
    end

    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -1355.93,-1487.78,520.75, 300.00,0.00,0.00, 100.00, false, 0)
    PointCamAtCoord(cam2, x,y,z)
    SetCamActiveWithInterp(cam2, cam, 900, true, true)

    Wait(1000)

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", x,y,z+200, 300.00,0.00,0.00, 100.00, false, 0)
    PointCamAtCoord(cam, x,y,z+2)
    SetCamActiveWithInterp(cam, cam2, 3700, true, true)

    Wait(3700)

    PlaySoundFrontend(-1, "Zoom_Out", "DLC_HEIST_PLANNING_BOARD_SOUNDS", 1)
    RenderScriptCams(false, true, 500, true, true)
    PlaySoundFrontend(-1, "CAR_BIKE_WHOOSH", "MP_LOBBY_SOUNDS", 1)
    FreezeEntityPosition(GetPlayerPed(-1), false)

    Wait(500)

    SetCamActive(cam, false)
    DestroyCam(cam, true)
end