ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('gathering:giveItem')
AddEventHandler('gathering:giveItem', function(item, quantity)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        xPlayer.addInventoryItem(item, quantity)
        TriggerClientEvent('chat:addMessage', source, {
            color = {0, 255, 0},
            multiline = true,
            args = {"SERVER", "Primio si " .. quantity .. "x " .. item}
        })
    end
end)