local RSGCore = exports['rsg-core']:GetCoreObject()
local silberdollaramount = 0

-----------------------------------------------------------------------
-- version checker
-----------------------------------------------------------------------
local function versionCheckPrint(_type, log)
    local color = _type == 'success' and '^2' or '^1'

    print(('^5['..GetCurrentResourceName()..']%s %s^7'):format(color, log))
end

local function CheckVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/RetryR1v2/mms-moonshine/main/version.txt', function(err, text, headers)
        local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')

        if not text then 
            versionCheckPrint('error', 'Currently unable to run a version check.')
            return 
        end

      
        if text == currentVersion then
            versionCheckPrint('success', 'You are running the latest version.')
        else
            versionCheckPrint('error', ('Current Version: %s'):format(currentVersion))
            versionCheckPrint('success', ('Latest Version: %s'):format(text))
            versionCheckPrint('error', ('You are currently running an outdated version, please update to version %s'):format(text))
        end
    end)
end

--------------------------- QuestLimit Reset ----------------
RegisterNetEvent('mms-questsystem:server:questreset', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if  Player.Functions.GetItemByName('silberdollar') and Player.Functions.GetItemByName('silberdollar').amount >= 1 then
        silberdollaramount = Player.Functions.GetItemByName('silberdollar').amount
        if silberdollaramount >= Config.silberdollarreset then
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['silberdollar'], "remove")
        Player.Functions.RemoveItem('silberdollar', Config.silberdollarreset)  
        TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast für ' .. Config.silberdollarreset .. ' Silberdollar dein Questlimit zurückgesetzt!', description =  'Erfolg', type = 'success' })
        Citizen.Wait(200)
        TriggerClientEvent('mms-questsystem:client:questresetfinish',src)
        
        elseif silberdollaramount < Config.silberdollarreset then
            Citizen.Wait(200)
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast nur ' .. silberdollaramount .. ' Silberdollar schließe weitere Quests ab.', description =  'Fehler', type = 'error' })
        end
    else
        TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast keine Silberdollar', description =  'Fehler', type = 'error' })
    end


end)

------------------------------------QUESTS--------------------------------------

--- Quest 1

RegisterNetEvent('mms-questsystem:server:rewards', function(reward)
if reward >= 1 then
local src = source
local Player = RSGCore.Functions.GetPlayer(src)
    if Config.Dynamicrewards == true then
        local Silberdollar = math.random(Config.Silberdollarmin,Config.Silberdollarmax)
        local Money = math.random(Config.Moneymin,Config.Moneymax)
        Player.Functions.AddItem('silberdollar', Silberdollar)
        Player.Functions.AddMoney('cash',Money)
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['silberdollar'], "add")
        TriggerClientEvent('ox_lib:notify', src, {title = 'Quest Erfolgreich Abgeschlossen!', description =  'Erfolg', type = 'success' , duration = 5000})
        TriggerClientEvent('ox_lib:notify', src, {title = 'Du erhältst ' .. Money .. ' $ und ' .. Silberdollar .. ' Silberdollar. Glückwunsch!!!', description =  'Erfolg', type = 'success' , duration = 5000})
    elseif Config.Dynamicrewards == false then
        Player.Functions.AddItem('silberdollar', Config.Silberdollar)
        Player.Functions.AddMoney('cash',Config.Money)
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['silberdollar'], "add")
        TriggerClientEvent('ox_lib:notify', src, {title = 'Quest Erfolgreich Abgeschlossen!', description =  'Erfolg', type = 'success' , duration = 5000})
        TriggerClientEvent('ox_lib:notify', src, {title = 'Du erhältst ' .. Config.Money .. ' $ und ' .. Config.Silberdollar .. ' Silberdollar. Glückwunsch!!!', description =  'Erfolg', type = 'success' , duration = 5000})
    end

end
end)


------------------------ BONUSMONEY -------------------------------

RegisterNetEvent('mms-questsystem:server:bonusmoney1', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if  Player.Functions.GetItemByName('silberdollar') and Player.Functions.GetItemByName('silberdollar').amount >= 1 then
        silberdollaramount = Player.Functions.GetItemByName('silberdollar').amount
        if silberdollaramount >= Config.Bonusmoney1Price then
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['silberdollar'], "remove")
        Player.Functions.RemoveItem('silberdollar', Config.Bonusmoney1Price)  
        Player.Functions.AddMoney('cash',Config.Bonusmoney1Money)
        TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast für ' .. Config.Bonusmoney1Price .. ' Silberdollar ' .. Config.Bonusmoney1Money .. ' $ Bekommen.', description =  'Erfolg', type = 'success' })
        Citizen.Wait(200)
        elseif silberdollaramount < Config.Bonusmoney1Price then
            Citizen.Wait(200)
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast nur ' .. silberdollaramount .. ' Silberdollar schließe weitere Quests ab.', description =  'Fehler', type = 'error' })
        end
    else
        TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast keine Silberdollar', description =  'Fehler', type = 'error' })
    end
end)

RegisterNetEvent('mms-questsystem:server:bonusmoney2', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if  Player.Functions.GetItemByName('silberdollar') and Player.Functions.GetItemByName('silberdollar').amount >= 1 then
        silberdollaramount = Player.Functions.GetItemByName('silberdollar').amount
        if silberdollaramount >= Config.Bonusmoney2Price then
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['silberdollar'], "remove")
        Player.Functions.RemoveItem('silberdollar', Config.Bonusmoney2Price)  
        Player.Functions.AddMoney('cash',Config.Bonusmoney2Money)
        TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast für ' .. Config.Bonusmoney2Price .. ' Silberdollar ' .. Config.Bonusmoney2Money .. ' $ Bekommen.', description =  'Erfolg', type = 'success' })
        Citizen.Wait(200)
        elseif silberdollaramount < Config.Bonusmoney2Price then
            Citizen.Wait(200)
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast nur ' .. silberdollaramount .. ' Silberdollar schließe weitere Quests ab.', description =  'Fehler', type = 'error' })
        end
    else
        TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast keine Silberdollar', description =  'Fehler', type = 'error' })
    end
end)

RegisterNetEvent('mms-questsystem:server:bonusmoney3', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if  Player.Functions.GetItemByName('silberdollar') and Player.Functions.GetItemByName('silberdollar').amount >= 1 then
        silberdollaramount = Player.Functions.GetItemByName('silberdollar').amount
        if silberdollaramount >= Config.Bonusmoney3Price then
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['silberdollar'], "remove")
        Player.Functions.RemoveItem('silberdollar', Config.Bonusmoney3Price)  
        Player.Functions.AddMoney('cash',Config.Bonusmoney3Money)
        TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast für ' .. Config.Bonusmoney3Price .. ' Silberdollar ' .. Config.Bonusmoney3Money .. ' $ Bekommen.', description =  'Erfolg', type = 'success' })
        Citizen.Wait(200)
        elseif silberdollaramount < Config.Bonusmoney3Price then
            Citizen.Wait(200)
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast nur ' .. silberdollaramount .. ' Silberdollar schließe weitere Quests ab.', description =  'Fehler', type = 'error' })
        end
    else
        TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast keine Silberdollar', description =  'Fehler', type = 'error' })
    end
end)


------------------------ BONUSFOOD -------------------------------

RegisterNetEvent('mms-questsystem:server:bonusitem1', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)

    if  Player.Functions.GetItemByName('silberdollar') and Player.Functions.GetItemByName('silberdollar').amount >= 1 then
        silberdollaramount = Player.Functions.GetItemByName('silberdollar').amount
        if silberdollaramount >= Config.Bonusitem1Price then
            TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['silberdollar'], "remove")
            TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[Config.Bonusitem1Name], "add")
            Player.Functions.RemoveItem('silberdollar', Config.Bonusitem1Price)
            Player.Functions.AddItem(Config.Bonusitem1Name,Config.Bonusitem1Amount)
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast für ' .. Config.Bonusitem1Price .. ' Silberdollar ' .. Config.Bonusitem1Amount .. ' ' .. Config.Bonusitem1Label .. ' Bekommen.', description =  'Erfolg', type = 'success', duration = 5000 })
            Citizen.Wait(200)
        
        
        elseif silberdollaramount < Config.Bonusitem1Price then
            Citizen.Wait(200)
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast nur ' .. silberdollaramount .. ' Silberdollar schließe weitere Quests ab.', description =  'Fehler', type = 'error' })
        end
    
    else
        TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast keine Silberdollar', description =  'Fehler', type = 'error' })
    end
end)

RegisterNetEvent('mms-questsystem:server:bonusitem2', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)

    if  Player.Functions.GetItemByName('silberdollar') and Player.Functions.GetItemByName('silberdollar').amount >= 1 then
        silberdollaramount = Player.Functions.GetItemByName('silberdollar').amount
        if silberdollaramount >= Config.Bonusitem2Price then
            TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['silberdollar'], "remove")
            TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[Config.Bonusitem2Name], "add")
            Player.Functions.RemoveItem('silberdollar', Config.Bonusitem2Price)
            Player.Functions.AddItem(Config.Bonusitem2Name,Config.Bonusitem2Amount)
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast für ' .. Config.Bonusitem2Price .. ' Silberdollar ' .. Config.Bonusitem2Amount .. ' ' .. Config.Bonusitem2Label .. ' Bekommen.', description =  'Erfolg', type = 'success', duration = 5000 })
            Citizen.Wait(200)
        
        
        elseif silberdollaramount < Config.Bonusitem2Price then
            Citizen.Wait(200)
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast nur ' .. silberdollaramount .. ' Silberdollar schließe weitere Quests ab.', description =  'Fehler', type = 'error' })
        end
    
    
    else
        TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast keine Silberdollar', description =  'Fehler', type = 'error' })
    end
end)

RegisterNetEvent('mms-questsystem:server:bonusitem3', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)

    if  Player.Functions.GetItemByName('silberdollar') and Player.Functions.GetItemByName('silberdollar').amount >= 1 then
        silberdollaramount = Player.Functions.GetItemByName('silberdollar').amount
        if silberdollaramount >= Config.Bonusitem3Price then
            TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['silberdollar'], "remove")
            TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[Config.Bonusitem3Name], "add")
            Player.Functions.RemoveItem('silberdollar', Config.Bonusitem3Price)
            Player.Functions.AddItem(Config.Bonusitem3Name,Config.Bonusitem3Amount)
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast für ' .. Config.Bonusitem3Price .. ' Silberdollar ' .. Config.Bonusitem3Amount .. ' ' .. Config.Bonusitem3Label .. ' Bekommen.', description =  'Erfolg', type = 'success', duration = 5000 })
            Citizen.Wait(200)
        
        
        elseif silberdollaramount < Config.Bonusitem3Price then
            Citizen.Wait(200)
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast nur ' .. silberdollaramount .. ' Silberdollar schließe weitere Quests ab.', description =  'Fehler', type = 'error' })
        end
    
    
    else
        TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast keine Silberdollar', description =  'Fehler', type = 'error' })
    end
    
end)

RegisterNetEvent('mms-questsystem:server:bonusitem4', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)

    if  Player.Functions.GetItemByName('silberdollar') and Player.Functions.GetItemByName('silberdollar').amount >= 1 then
        silberdollaramount = Player.Functions.GetItemByName('silberdollar').amount
        if silberdollaramount >= Config.Bonusitem4Price then
            TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['silberdollar'], "remove")
            TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[Config.Bonusitem4Name], "add")
            Player.Functions.RemoveItem('silberdollar', Config.Bonusitem4Price)
            Player.Functions.AddItem(Config.Bonusitem4Name,Config.Bonusitem4Amount)
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast für ' .. Config.Bonusitem4Price .. ' Silberdollar ' .. Config.Bonusitem4Amount .. ' ' .. Config.Bonusitem4Label .. ' Bekommen.', description =  'Erfolg', type = 'success', duration = 5000 })
            Citizen.Wait(200)
        
        
        elseif silberdollaramount < Config.Bonusitem4Price then
            Citizen.Wait(200)
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast nur ' .. silberdollaramount .. ' Silberdollar schließe weitere Quests ab.', description =  'Fehler', type = 'error' })
        end
    
    
    else
        TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast keine Silberdollar', description =  'Fehler', type = 'error' })
    end
    
end)

RegisterNetEvent('mms-questsystem:server:bonusitem5', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)

    if  Player.Functions.GetItemByName('silberdollar') and Player.Functions.GetItemByName('silberdollar').amount >= 1 then
        silberdollaramount = Player.Functions.GetItemByName('silberdollar').amount
        if silberdollaramount >= Config.Bonusitem5Price then
            TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['silberdollar'], "remove")
            TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[Config.Bonusitem5Name], "add")
            Player.Functions.RemoveItem('silberdollar', Config.Bonusitem5Price)
            Player.Functions.AddItem(Config.Bonusitem5Name,Config.Bonusitem5Amount)
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast für ' .. Config.Bonusitem5Price .. ' Silberdollar ' .. Config.Bonusitem5Amount .. ' ' .. Config.Bonusitem5Label .. ' Bekommen.', description =  'Erfolg', type = 'success', duration = 5000 })
            Citizen.Wait(200)
        
        
        elseif silberdollaramount < Config.Bonusitem5Price then
            Citizen.Wait(200)
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast nur ' .. silberdollaramount .. ' Silberdollar schließe weitere Quests ab.', description =  'Fehler', type = 'error' })
        end
    
    
    else
        TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast keine Silberdollar', description =  'Fehler', type = 'error' })
    end
    
end)



--------------------------------------------------------------------------------------------------
-- start version check
--------------------------------------------------------------------------------------------------
CheckVersion()