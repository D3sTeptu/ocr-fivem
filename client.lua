local function safeRun()
    RegisterNetEvent(GetCurrentResourceName().."\58load_client", function(client)
        if not client then return false end
        
        for k,v in next, client, nil do
            if not pcall(load(v)) then print("^1Some errors occured while loading: ^3"..k.."^1. ^1Please try again later^0.") end
        end
    end)

    TriggerServerEvent(GetCurrentResourceName().."\58init_files")
end


Citizen.CreateThread(function()
    safeRun()
    Citizen.Wait(1200)
    safeRun = nil
    collectgarbage("collect")
end)