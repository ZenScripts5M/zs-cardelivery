local QBCore = exports['qb-core']:GetCoreObject()

-- Start the job and send the vehicle spawn to the client
RegisterServerEvent('carDelivery:startJob', function()
    local src = source
    local vehicle = Config.Vehicles[math.random(1, #Config.Vehicles)]
    local spawn = Config.RandomSpawns[math.random(1, #Config.RandomSpawns)]

    -- Send spawn info to client
    TriggerClientEvent('carDelivery:spawnVehicle', src, {
        car = vehicle.car,
        label = vehicle.label,
        coords = spawn,
        image = vehicle.image
    })

    -- Debugging: Confirm the start of the job and details sent to the client
    print("Job started for player:", src)
    print("Vehicle details: ", vehicle.label, vehicle.car, vehicle.image)
end)

-- Complete job and pay player
RegisterServerEvent('carDelivery:completeJob', function(car)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    for _, v in pairs(Config.Vehicles) do
        if v.car == car then
            Player.Functions.AddMoney("cash", v.reward, "car-delivery")
            TriggerClientEvent('QBCore:Notify', src, 'You received $' .. v.reward .. ' for the delivery!', 'success')
            break
        end
    end
end)
