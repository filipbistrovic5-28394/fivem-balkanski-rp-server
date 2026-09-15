ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
    local blip = AddBlipForCoord(Config.PoliceStation.x, Config.PoliceStation.y, Config.PoliceStation.z)
    SetBlipAsNoLongerNeeded(blip)
    SetBlipRoute(blip)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        local playerCoords = GetEntityCoords(PlayerPedId())
        local distance = #(playerCoords - Config.PoliceStation)
        
        if distance < 30.0 then
            DrawMarker(
                1,
                Config.PoliceStation.x, Config.PoliceStation.y, Config.PoliceStation.z,
                0.0, 0.0, 0.0,
                0.0, 0.0, 0.0,
                3.0, 3.0, 3.0,
                0, 0, 255, 100,
                false, true, 2, false, nil, nil, false
            )
            
            if distance < 5.0 then
                TriggerEvent('chat:addMessage', {
                    color = {0, 0, 255},
                    multiline = true,
                    args = {"POLICIJA", "Pritisnite E za policijsku stanicu"}
                })
            end
        end
    end
end)