

ESX = nil 
Citizen.CreateThread(function()
    while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(10)
    end 
end)  


------
--job
------
local job = false
local job2 = false





-------------------------
--RECORRIDO DE MARIHUANA
-------------------------

Citizen.CreateThread(function()
    SpawnNPC('u_m_m_streetart_01', vector4( 2016.86, 4987.82, 41.1, 130.49))
     while true do
        local _sleep = 1000
        local _char = PlayerPedId()
        local _charPos = GetEntityCoords(_char)
            if #(_charPos - vector3( 2016.86, 4987.82, 41.1)) < 2 then
                _sleep = 0 
            if job == true or job2 == true then
                Create3D( vector3( 2016.86, 4987.82, 42.1), '~b~Ya estás en un trabajo, terminalo primero')
            else
                Create3D( vector3( 2016.86, 4987.82, 42.1), 'Pulsa ~r~[E]~w~ para empezar a trabajar')
                if IsControlJustPressed(0, 38) then
            ESX.Game.SpawnVehicle('mesa3', vector3(2008.56, 4986.53, 41.41), 221.69, function(veh)
            exports['LegacyFuel']:SetFuel(veh, 100)
            TaskWarpPedIntoVehicle(_char, veh, -1)
                end)
                blip = AddBlipForCoord(vector3(2195.99, 5607.07, 53.53))
                SetBlipRoute(blip, true)
                job = true  
            end
        end
    end
        if job == true then 
            if #(_charPos - vector3( 2195.99, 5607.07, 53.53)) < 2 then
                _sleep = 0 
                Create3D( vector3( 2195.99, 5607.07, 53.53), 'Pulsa ~r~[E]~w~ entregar la droga.')
                if IsControlJustPressed(0, 38) then
                TriggerServerEvent('esx_roy_drugs1:additems')
                RemoveBlip(blip)
                SetBlipRoute(blip, false)
                blip2 = AddBlipForCoord(vector3(2008.56, 4986.53, 41.41))
                SetBlipRoute(blip2, true)
                job = false
                job2 = true
                end
            end
        end
        if job2 == true then
                if #(_charPos - vector3(2008.56, 4986.53, 41.41)) < 2 then   
                    _sleep = 0 
                    Create3D( vector3(2008.56, 4986.53, 41.41), 'Pulsa ~r~[E]~w~ entregar el vehiculo.')   
                    if IsControlJustPressed(0, 38) then
                    DeleteVehicle(GetVehiclePedIsIn(_char))
                    RemoveBlip(blip2)
                    SetBlipRoute(blip2, false)
                    job = false
                    job2 = false
                    end
                end
           end
        Citizen.Wait(_Sleep)
    end
end)

-------------------------------
----RECORRIDO HEROINA
-------------------------------

Citizen.CreateThread(function()
    SpawnNPC('s_m_y_ammucity_01', vector4( 1546.49, 2166.5, 77.72, 88.83))
     while true do
        local _sleep = 1000
        local _char = PlayerPedId()
        local _charPos = GetEntityCoords(_char)
            if #(_charPos - vector3( 1546.49, 2166.5, 78.72)) < 2 then
                _sleep = 0 
            if job == true or job2 == true then
                Create3D( vector3( 1546.49, 2166.5, 78.72), '~b~Ya estás en un trabajo, terminalo primero')
            else
                Create3D( vector3( 1546.49, 2166.5, 78.72), 'Pulsa ~r~[E]~w~ para empezar a trabajar')
                if IsControlJustPressed(0, 38) then
            ESX.Game.SpawnVehicle('mesa3', vector3( 1540.62, 2167.91, 78.79), 51.47, function(veh)
            exports['LegacyFuel']:SetFuel(veh, 100)
            TaskWarpPedIntoVehicle(_char, veh, -1)
                end)
                blip = AddBlipForCoord(vector3( 808.06, 2180.72, 52.38))
                SetBlipRoute(blip, true)
                job = true  
            end
        end
    end
        if job == true then 
            if #(_charPos - vector3( 808.06, 2180.72, 52.38)) < 2 then
                _sleep = 0 
                Create3D( vector3( 808.06, 2180.72, 52.38), 'Pulsa ~r~[E]~w~ entregar la droga.')
                if IsControlJustPressed(0, 38) then
                TriggerServerEvent('esx_roy_drugs2:additems')
                RemoveBlip(blip)
                SetBlipRoute(blip, false)
                blip2 = AddBlipForCoord(vector3( 1540.62, 2167.91, 78.79))
                SetBlipRoute(blip2, true)
                job = false
                job2 = true
                end
            end
        end
        if job2 == true then
                if #(_charPos - vector3( 1540.62, 2167.91, 78.79)) < 2 then   
                    _sleep = 0 
                    Create3D( vector3( 1540.62, 2167.91, 78.79), 'Pulsa ~r~[E]~w~ entregar el vehiculo.')   
                    if IsControlJustPressed(0, 38) then
                    DeleteVehicle(GetVehiclePedIsIn(_char))
                    RemoveBlip(blip2)
                    SetBlipRoute(blip2, false)
                    job = false
                    job2 = false
                    end
                end
           end
        Citizen.Wait(_Sleep)
    end
end)
 



-----------------------
--PROCESO DE MARIHUANA
-----------------------
Citizen.CreateThread(function()
    SpawnNPC('s_m_y_doorman_01', vector4( 1754.07, -1649.21, 111.66, 277.9))
     while true do
        local _sleep = 1000
        local _char = PlayerPedId()
        local _charPos = GetEntityCoords(_char)
            if #(_charPos - vector3( 1754.07, -1649.21, 112.66)) < 2 then
                _sleep = 0 
                Create3D( vector3( 1754.07, -1649.21, 112.66), 'Pulsa ~r~[E]~w~ para procesar marihuana')
                if IsControlJustPressed(0, 38) then
                    exports['progressBars']:startUI(2700, 'Procesando marihuana...')
                    Citizen.Wait(2700)
                    TriggerServerEvent('esx_roy_drugs:processweed')
                end
            end
            Citizen.Wait(_sleep)
          end
      end)


------------
--PROCESO DE HEROINA
------------

Citizen.CreateThread(function()
    SpawnNPC('s_m_y_pestcont_01', vector4( -1824.85, -337.93, 48.15, 322.12))
     while true do
        local _sleep = 1000
        local _char = PlayerPedId()
        local _charPos = GetEntityCoords(_char)
            if #(_charPos - vector3( -1824.85, -337.93, 49.15)) < 2 then
                _sleep = 0 
                Create3D( vector3(  -1824.85, -337.93, 49.15), 'Pulsa ~r~[E]~w~ para procesar heroina')
                if IsControlJustPressed(0, 38) then
                    exports['progressBars']:startUI(2500, 'Procesando heroina...')
                    Citizen.Wait(2500)
                    TriggerServerEvent('esx_roy_drugs:processheroina')
                end
            end
            Citizen.Wait(_sleep)
          end
      end)




-----------------------
---NPC DE VENTA DE MARIHUANA
-----------------------
Citizen.CreateThread(function()
    SpawnNPC('s_m_m_autoshop_02', vector4( 1958.92, 4627.99, 40.06, 38.36))
     while true do
        local _sleep = 1000
        local _char = PlayerPedId()
        local _charPos = GetEntityCoords(_char)
            if #(_charPos - vector3( 1958.92, 4627.99, 41.06)) < 2 then
                _sleep = 0 
                Create3D( vector3( 1958.92, 4627.99, 41.06), 'Pulsa ~r~[E]~w~ para vender marihuana')
                if IsControlJustPressed(0, 38) then
                    exports['progressBars']:startUI(1700, 'Vendiendo marihuana...')
                    ExecuteCommand('e bringiton')
                    Citizen.Wait(1700)
                    TriggerServerEvent('esx_roy_drugs:removemarihuana')
                end
            end
            Citizen.Wait(_sleep)
          end
      end)


------------
--VENTA DE HEROINA
------------

Citizen.CreateThread(function()
    SpawnNPC('s_m_y_blackops_03', vector4( 155.7, 3131.44, 42.58, 237.73))
     while true do
        local _sleep = 1000
        local _char = PlayerPedId()
        local _charPos = GetEntityCoords(_char)
            if #(_charPos - vector3( 155.7, 3131.44, 43.58)) < 2 then
                _sleep = 0 
                Create3D( vector3(  155.7, 3131.44, 43.58), 'Pulsa ~r~[E]~w~ para vender heroina')
                if IsControlJustPressed(0, 38) then
                    exports['progressBars']:startUI(1700, 'Vendiendo heroina...')
                    ExecuteCommand('e type2')
                    Citizen.Wait(1700)
                    TriggerServerEvent('esx_roy_drugs:removeheroina')
                end
            end
            Citizen.Wait(_sleep)
          end
      end)



--------------------------
---FUNCIONES
--------------------------
Create3D = function(coords, texto)
    local x, y, z = table.unpack(coords)
    local onScreen,_x,_y=World3dToScreen2d(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)

        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropShadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(5)
        AddTextComponentString(texto)
        DrawText(_x,_y)
    end
end

SpawnNPC = function(modelo, x,y,z,h)
    hash = GetHashKey(modelo)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end
    crearNPC = CreatePed(5, hash, x,y,z,h, false, true)
    FreezeEntityPosition(crearNPC, true)
    SetEntityInvincible(crearNPC, true)
    SetBlockingOfNonTemporaryEvents(crearNPC, true)
    TaskStartScenarioInPlace(crearNPC, "WORLD_HUMAN_AA_SMOKE", 0, false)
end