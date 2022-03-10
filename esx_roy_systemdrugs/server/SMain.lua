ESX = nil 

  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


print("Script Created by itsRoyal#7294")

-- Check resource name.
if GetCurrentResourceName() ~= "esx_roy_systemdrugs" then
    print("Error: Change the resource name to \"esx_roy_systemdrugs\" or it won't work!")
end

--AÑADIDA DE MARIHUANA
RegisterServerEvent('esx_roy_drugs1:additems')
AddEventHandler('esx_roy_drugs1:additems', function()
    local user = ESX.GetPlayerFromId(source)
  --  user.addBlackMoney(400)
   -- user.removeInventoryItem('crack', 3)
    user.addInventoryItem('weed', 16)
    --user.AddWeapon('WEAPON_PISTOL')
    TriggerClientEvent('esx:showNotification',source, 'Has entregado la droga, aquí tienes tu recompensa.')
end)


--AÑADIDA DE HEROINA
RegisterServerEvent('esx_roy_drugs2:additems')
AddEventHandler('esx_roy_drugs2:additems', function()
    local user = ESX.GetPlayerFromId(source)
  --  user.addBlackMoney(400)
  --  user.removeInventoryItem('crack', 3)
    user.addInventoryItem('heroina', 14)
    --user.AddWeapon('WEAPON_PISTOL')
    TriggerClientEvent('esx:showNotification',source, 'Has entregado la droga, aquí tienes tu recompensa.')
end)


-------------------------
----PROCESO DE MARIHUANA
-------------------------
RegisterServerEvent('esx_roy_drugs:processweed')
AddEventHandler('esx_roy_drugs:processweed', function()

    local user = ESX.GetPlayerFromId(source)


     local weed = user.getInventoryItem('weed')


    if weed.count > 0 then
      TriggerClientEvent('esx:showNotification',source, 'Has procesado la marihuana, ahora vendela.')
      user.removeInventoryItem('weed', 5)
      user.addInventoryItem('weedbag', 1) 
    else
    TriggerClientEvent('esx:showNotification',source, 'No intentes procesar cosas que no tienes...')

    end

end)


----------------------
----PROCESO DE HEROINA
----------------------
RegisterServerEvent('esx_roy_drugs:processheroina')
AddEventHandler('esx_roy_drugs:processheroina', function()

    local user = ESX.GetPlayerFromId(source)


     local heroina = user.getInventoryItem('heroina')


    if heroina.count > 0 then
      TriggerClientEvent('esx:showNotification',source, 'Has procesado la heroina, ahora vendela.')
      user.removeInventoryItem('heroina', 5)
      user.addInventoryItem('heroinabag', 1)
    else
    TriggerClientEvent('esx:showNotification',source, 'No intentes procesar cosas que no tienes...')

    end

end)






----------------------
----VENTA DE MARIHUANA
----------------------
RegisterServerEvent('esx_roy_drugs:removemarihuana')
AddEventHandler('esx_roy_drugs:removemarihuana', function()

    local user = ESX.GetPlayerFromId(source)


     local weedbag = user.getInventoryItem('weedbag')


    if weedbag.count > 0 then
      TriggerClientEvent('esx:showNotification',source, 'Has vendido Marihuana.')
      user.removeInventoryItem('weedbag', 1)
      user.addAccountMoney('black_money', 150) --tocar precio aqui
      sendToDiscord("", "El jugador con ID  "..source.." está vendiendo Marihuana")--webhook
    else
      TriggerClientEvent('esx:showNotification',source, 'No intentes vender cosas que no tienes...')

    end

end)

----------------------
----VENTA DE HEROINA
----------------------

RegisterServerEvent('esx_roy_drugs:removeheroina')
AddEventHandler('esx_roy_drugs:removeheroina', function()

    local user = ESX.GetPlayerFromId(source)


     local heroinabag = user.getInventoryItem('heroinabag')


    if heroinabag.count > 0 then
      TriggerClientEvent('esx:showNotification',source, 'Has vendido Heroina.')
      user.removeInventoryItem('heroinabag', 1)
      user.addAccountMoney('black_money', 125) --tocar precio aqui
      sendToDiscord("", "El jugador con ID  "..source.." está vendiendo Heroina") --webhook
    else
      TriggerClientEvent('esx:showNotification',source, 'No intentes vender cosas que no tienes...')

    end

end)




---------------
--Discord Log
---------------
function sendToDiscord(weebhook, msg)
    local discord = weebhook
    if discord~=nil then
        PerformHttpRequest(discord, function(a,b,c)end, "POST", json.encode({embeds={{title="Royal Logs",description=msg,color=10181046,}}}), {["Content-Type"]="application/json"})
    end
end