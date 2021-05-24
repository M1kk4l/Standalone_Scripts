RegisterServerEvent("SendDiscord")
AddEventHandler("SendDiscord", function(Navn, Grund)
    local src = source;
    local ids = ExtractIdentifiers(src);
    local playerIP = ids.ip;
    local playerSteam = ids.steam;
    local playerLicense = ids.license;
    local playerXbl = ids.xbl;
    local playerLive = ids.live;
    local playerDisc = ids.discord;
    local discord = ids.discord;
    PerformHttpRequest(Config.Webhook, function(o,p,q) end,'POST',json.encode(
        {
            username = "M1kk4l Report",
            embeds = {
                {              
                    title = "M1kk4l Report";
                    description = '**Report Navn:** '..Navn..'\n**Report Grund:** '..Grund..' \n**Reporterens Discord:** <@' ..discord:gsub('discord:', '')..'> \n **Reporterens Steam Id:** '..playerSteam..'';
                    color = 2031360;
                }
            }
        }), { ['Content-Type'] = 'application/json' })
end)

function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }
    
    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)

        --Convert it to a nice table.
        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end

    return identifiers
end