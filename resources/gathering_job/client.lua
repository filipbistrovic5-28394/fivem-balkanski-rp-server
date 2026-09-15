ESX = nil
local inGathering = false

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CheckPlayersInZone(zoneCoords, radius)
    local playersInZone = 0
    local players = GetActivePlayers()
    
    for _, player in ipairs(players) do
        local ped = GetPlayerPed(player)
        local pedCoords = GetEntityCoords(ped)
        local distance = #(pedCoords - zoneCoords)
        
        if distance < radius then
            playersInZone = playersInZone + 1
        end
    end
    
    return playersInZone
end

function HasPlayerWeapon()
    local ped = PlayerPedId()
    return GetSelectedPedWeapon(ped) ~= `WEAPON_UNARMED`
end

function StartGathering(zone)
    if inGathering then return end
    inGathering = true
    
    local ped = PlayerPedId()
    local playersInZone = CheckPlayersInZone(zone.coords, 5.0)
    
    if playersInZone < zone.requiredPlayers then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"SISTEM", "Nedostaje te " .. (zone.requiredPlayers - playersInZone) .. " igrač(a)!"}
        })
        inGathering = false
        return
    end
    
    if zone.weaponRequired and not HasPlayerWeapon() then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"SISTEM", "Trebam oružje za ovu akciju!"}
        })
        inGathering = false
        return
    end
    
    RequestAnimDict("combat@damage@rb_writhe")
    while not HasAnimDictLoaded("combat@damage@rb_writhe") do
        Citizen.Wait(100)
    end
    
    TaskPlayAnim(ped, "combat@damage@rb_writhe", "rb_writhe_loop", 8.0, -8.0, -1, 1, 0, false, false, false)
    
    TriggerEvent('chat:addMessage', {
        color = {0, 255, 0},
        multiline = true,
        args = {"SISTEM", "Skupljam " .. zone.name .. "..."}
    })
    
    Citizen.Wait(zone.duration)
    
    ClearPedTasks(ped)
    
    TriggerServerEvent('gathering:giveItem', zone.item, zone.reward)
    
    TriggerEvent('chat:addMessage', {
        color = {0, 255, 0},
        multiline = true,
        args = {"SISTEM", "Uspješno si prikupio " .. zone.name .. "!"}
    })
    
    inGathering = false
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        local playerCoords = GetEntityCoords(PlayerPedId())
        
        for _, zone in ipairs(Config.GatheringZones) do
            local distance = #(playerCoords - zone.coords)
            
            if distance < 100.0 then
                DrawMarker(
                    1,
                    zone.coords.x, zone.coords.y, zone.coords.z,
                    0.0, 0.0, 0.0,
                    0.0, 0.0, 0.0,
                    3.0, 3.0, 3.0,
                    zone.markerColor[1], zone.markerColor[2], zone.markerColor[3], zone.markerColor[4],
                    false, true, 2, false, nil, nil, false
                )
                
                if distance < 5.0 then
                    TriggerEvent('chat:addMessage', {
                        color = {0, 255, 0},
                        multiline = true,
                        args = {"MARKER", "Pritisnite E za " .. zone.name}
                    })
                    
                    if IsControlJustReleased(0, 38) then
                        StartGathering(zone)
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    for _, zone in ipairs(Config.GatheringZones) do
        if zone.blip then
            local blip = AddBlipForCoord(zone.coords.x, zone.coords.y, zone.coords.z)
            SetBlipAsNoLongerNeeded(blip)
            SetBlipRoute(blip)
        end
    end
end)