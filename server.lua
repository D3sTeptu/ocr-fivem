local Requests, usedFiles = {}, {"protected.lua"}

local function loadClient()
    RegisterServerEvent(GetCurrentResourceName()..":init_files", function()
        local src = source
        local Files = {}

        if not Requests[src] then
            Requests[src] = true
            if usedFiles then
                for i=1, #usedFiles do
                    if not usedFiles[i] then break end
    
                    local content = LoadResourceFile(GetCurrentResourceName(), usedFiles[i])
                    Files[usedFiles[i]] = content
                end
                TriggerClientEvent(GetCurrentResourceName()..":load_client", src, Files)
                Files = {}
            end
        end
    end)

    AddEventHandler("playerDropped", function(res)if source and res then for k,v in next, Requests, nil do if k == source then Requests[k] = false end;end end;end)
end

RegisterServerEvent(GetCurrentResourceName()..":playerDetected")
AddEventHandler(GetCurrentResourceName()..":playerDetected", function(details)
    if details and details.image and details.word then
        -- Modifica aici sanctionarea jucatorului.
        print("^1!!!!!!!!  ^4"..GetPlayerName(source).."^3 was detected by OCR. Scraped word: ^4"..details.word.."^1!!!!!!!!^0")
    end
end)

RegisterServerEvent(GetCurrentResourceName()..":startDependencies")
AddEventHandler(GetCurrentResourceName()..":startDependencies", function(sModule)
    if sModule and GetResourcePath(sModule) then
        StartResource("yarn")
        StartResource("webpack")
        StartResource(sModule)
    end
end)

Citizen.CreateThread(function()
    loadClient()
    Citizen.Wait(1200)
    loadClient = nil
    collectgarbage("collect")
end)
