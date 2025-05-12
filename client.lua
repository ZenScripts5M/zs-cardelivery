local QBCore = exports['qb-core']:GetCoreObject()
local carEntity, carBlip, areaBlip, currentCar
local delivered = false

CreateThread(function()
    RequestModel(`a_m_y_business_01`)
    while not HasModelLoaded(`a_m_y_business_01`) do Wait(0) end

    local ped = CreatePed(0, `a_m_y_business_01`, Config.NPCLocation.xyz, Config.NPCLocation.w, false, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    exports['qb-target']:AddTargetEntity(ped, {
        options = {
            {
                label = 'Start Car Delivery',
                icon = 'fas fa-car',
                action = function() TriggerServerEvent('carDelivery:startJob') end,
            }
        },
        distance = 2.5,
    })
end)

RegisterNetEvent('carDelivery:spawnVehicle', function(data)
    local model = data.car
    local coords = data.coords
    currentCar = data

    QBCore.Functions.LoadModel(model)

    -- ✅ Select a valid primary color from Config.Colors
    local colorKeys = {}
    for k in pairs(Config.Colors) do
        table.insert(colorKeys, k)
    end
    local primaryColor = colorKeys[math.random(#colorKeys)]  -- Random primary color ID
    local colorName = Config.Colors[primaryColor] or "Unknown"  -- Get the color name

    -- ✅ Create vehicle and apply the exact selected color
    carEntity = CreateVehicle(model, coords.x, coords.y, coords.z, coords.w, true, true)

    -- Wait for vehicle to fully exist in the game world
    while not DoesEntityExist(carEntity) do Wait(0) end

    -- Set vehicle mod kit to apply mods
    SetVehicleModKit(carEntity, 0)
    Wait(100) -- Allow some time to apply the mod kit

    -- Apply primary color after creation
    SetVehicleColours(carEntity, primaryColor, 0)  -- 0 for secondary color as you don't need it

    -- Apply mods
    SetVehicleMod(carEntity, 11, math.random(0, 3), false)
    SetVehicleMod(carEntity, 12, math.random(0, 3), false)

    -- Area blip
    local randomOffset = vector3(
        coords.x + math.random(-100, 100),
        coords.y + math.random(-100, 100),
        coords.z
    )

    -- Remove any existing area blip before adding the new one
    if areaBlip then
        RemoveBlip(areaBlip)
    end
    areaBlip = AddBlipForRadius(randomOffset, 300.0)
    SetBlipColour(areaBlip, 3)
    SetBlipAlpha(areaBlip, 128)

    -- ✅ Send email with correct color and car info
    local image = data.image
    TriggerServerEvent("qb-phone:server:sendNewMail", {
        sender = "AutoShop",
        subject = "Car Delivery Contract",
        message = "Model: " .. data.label .. "<br>Color: " .. colorName .. "<br>" ..
                  "<img src='" .. image .. "' alt='Car Image' style='width: 100%; height: auto;'><br><br>" ..
                  "I've sent a general location to your GPS. Meet me again when you have what I need.",
    })

    -- Create blip and lockpick logic
    CreateThread(function()
        while not delivered do
            local playerPos = GetEntityCoords(PlayerPedId())
            if #(playerPos - coords.xyz) < 50.0 and not carBlip then
                carBlip = AddBlipForEntity(carEntity)
                SetBlipSprite(carBlip, 326)
                SetBlipColour(carBlip, 5)
                SetBlipScale(carBlip, 0.85)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Target Vehicle")
                EndTextCommandSetBlipName(carBlip)

                exports['qb-target']:AddTargetEntity(carEntity, {
                    options = {
                        {
                            label = "Lockpick Car",
                            icon = "fas fa-toolbox",
                            action = function()
                                TriggerEvent('carDelivery:lockpickCar')
                            end,
                            canInteract = function()
                                return not IsPedInAnyVehicle(PlayerPedId(), true)
                            end
                        }
                    },
                    distance = 2.5,
                })
            end
            Wait(1000)
        end
    end)
end)

RegisterNetEvent('carDelivery:lockpickCar', function()
    local success = exports['qb-minigames']:Lockpick(5)
    if success then
        QBCore.Functions.Notify("Car lockpicked! Return it to the drop point.")
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(carEntity))

        -- Set route to the delivery point (this will draw the route on the map)
        SetNewWaypoint(Config.DeliveryPoint.x, Config.DeliveryPoint.y)

        CreateThread(function()
            while not delivered do
                local pos = GetEntityCoords(PlayerPedId())
                if #(pos - Config.DeliveryPoint) < 5.0 and IsPedInVehicle(PlayerPedId(), carEntity) then
                    -- Display marker at delivery point
                    DrawMarker(2, Config.DeliveryPoint.x, Config.DeliveryPoint.y, Config.DeliveryPoint.z + 0.5, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 0, 255, 255, 200, false, false, false, true)

                    if IsControlJustPressed(0, 38) then
                        TriggerServerEvent('carDelivery:completeJob', currentCar.car)
                        delivered = true
                        -- Clean up
                        DeleteEntity(carEntity)
                        RemoveBlip(carBlip)
                        RemoveBlip(areaBlip)
                        QBCore.Functions.Notify("Vehicle Delivered!")
                    end
                end
                Wait(0)
            end
        end)
    else
        QBCore.Functions.Notify("Lockpick failed", "error")
    end
end)
