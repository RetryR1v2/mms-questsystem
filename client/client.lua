local RSGCore = exports['rsg-core']:GetCoreObject()
local player = PlayerPedId()
local id = PlayerId()
local life = GetEntityHealth(player)
local name = GetPlayerName(id)
local serverid = GetPlayerServerId(id)
local playerped = GetPlayerPed(id)
local activequest = 0
local questamount = 1
local aufgabe1 = 0
local aufgabe2 = 0
local aufgabe3 = 0
local prompts = 0

---------------------------------------------------------------------------------


-- Questgeber Prompt and Blip

Citizen.CreateThread(function()
    for questgeber,v in pairs(Config.questgeber) do
        exports['rsg-core']:createPrompt(v.name, v.coords, RSGCore.Shared.Keybinds['J'],  (' ') .. v.lable, {
            type = 'client',
            event = 'mms-questsystem:client:menu',
            args = {},
        })
        if v.showblip == true then
            local questgeber = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(questgeber, GetHashKey(v.blipSprite), true)
            SetBlipScale(questgeber, v.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, questgeber, v.blipName)
        end
    end
end)



-- Questgeber Menü

RegisterNetEvent('mms-questsystem:client:menu', function()
    lib.registerContext(
        {
            id = 'questgeber',
            title = ('Quest Menu'),
            position = 'top-right',
            options = {
                {
                    title = ('Quest Bekommen'),
                    description = ('Starte eine Quest'),
                    icon = 'fas fa-circle',
                    event = 'mms-questsystem:client:queststart',
                },
                {
                    title = ('Quest Info'),
                    description = ('Informationene zur Aktiven Quest'),
                    icon = 'fas fa-info',
                    event = 'mms-questsystem:client:questinfo',
                },
                {
                    title = ('Quest Abgeben'),
                    description = ('Gib die Quest ab und Bekomme eine Belohnung'),
                    icon = 'fas fa-check',
                    event = 'mms-questsystem:client:questende',
                },
                {
                    title = ('Quest Abbrechen'),
                    description = ('Breche die Aktuelle Quest ab'),
                    icon = 'fas fa-x',
                    event = 'mms-questsystem:client:questabort',
                },
                {
                    title = ('Silberdollar Shop'),
                    description = ('Öffne den Silberdollar Shop'),
                    icon = 'fas fa-shop',
                    event = 'mms-questsystem:client:shopmenu',
                },
            }
        }
    )
    lib.showContext('questgeber')
end)


RegisterNetEvent('mms-questsystem:client:queststart')
AddEventHandler('mms-questsystem:client:queststart', function(queststart)
    if Config.questlimit == true and activequest == 0 and questamount <= Config.maxquests then
        activequest = math.random(1,10)
        Getquest()
    elseif Config.questlimit == false and activequest == 0 then
        activequest = math.random(1,10)
        Getquest()
    elseif activequest >= 1 then
        RSGCore.Functions.Notify('Du hast bereits eine Aktive Quest', 'error')
    else
        RSGCore.Functions.Notify('Du hast Heute bereits ' .. Config.maxquests .. ' Aufgaben Erledigt.', 'error')
    end

end)

--------- Bekomme Quest

function Getquest()
    if activequest == 1 then
        RSGCore.Functions.Notify('Du hast eine Quest gestartet.', 'success')
        Citizen.Wait(200)
        prompts = 1
        Quest1()
    elseif activequest == 2 then
        RSGCore.Functions.Notify('Du hast eine Quest gestartet.', 'success')
        Citizen.Wait(200)
        prompts = 2
        Quest2()
    elseif activequest == 3 then
        RSGCore.Functions.Notify('Du hast eine Quest gestartet.', 'success')
        Citizen.Wait(200)
        prompts = 3
        Quest3()
    elseif activequest == 4 then
        RSGCore.Functions.Notify('Du hast eine Quest gestartet.', 'success')
        Citizen.Wait(200)
        prompts = 4
        Quest4()
    elseif activequest == 5 then
        RSGCore.Functions.Notify('Du hast eine Quest gestartet.', 'success')
        Citizen.Wait(200)
        prompts = 5
        Quest5()
    elseif activequest == 6 then
        RSGCore.Functions.Notify('Du hast eine Quest gestartet.', 'success')
        Citizen.Wait(200)
        prompts = 6
        Quest6()
    elseif activequest == 7 then
        RSGCore.Functions.Notify('Du hast eine Quest gestartet.', 'success')
        Citizen.Wait(200)
        prompts = 7
        Quest7()
    elseif activequest == 8 then
        RSGCore.Functions.Notify('Du hast eine Quest gestartet.', 'success')
        Citizen.Wait(200)
        prompts = 8
        Quest8()
    elseif activequest == 9 then
        RSGCore.Functions.Notify('Du hast eine Quest gestartet.', 'success')
        Citizen.Wait(200)
        prompts = 9
        Quest9()
    elseif activequest == 10 then
        RSGCore.Functions.Notify('Du hast eine Quest gestartet.', 'success')
        Citizen.Wait(200)
        prompts = 10
        Quest10()
    end
end
-------------------------------------------Quests----------------------------------------------

-- Quest 1
function Quest1()

    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest1Aufgabe1, Config.Quest1Coords1, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest1Aufgabe1desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe1',
        args = {},
    })
    
        blipaufgabe1 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest1Coords1)
        SetBlipSprite(blipaufgabe1, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe1, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe1, Config.Blipname1)
        SetBlipFlashes(blipaufgabe1, true)
        AllowSonarBlips(blipaufgabe1,true)


    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest1Aufgabe2, Config.Quest1Coords2, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest1Aufgabe2desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe2',
        args = {},
    })
        
        blipaufgabe2 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest1Coords2)
        SetBlipSprite(blipaufgabe2, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe2, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe2, Config.Blipname2)
        SetBlipFlashes(blipaufgabe2, true)
        AllowSonarBlips(blipaufgabe2,true)



    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest1Aufgabe3, Config.Quest1Coords3, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest1Aufgabe3desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe3',
        args = {},
    })
            
        blipaufgabe3 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest1Coords3)
        SetBlipSprite(blipaufgabe3, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe3, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe3, Config.Blipname3)
        SetBlipFlashes(blipaufgabe3, true)
        AllowSonarBlips(blipaufgabe3,true)

end

-- Quest 2
function Quest2()

    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest2Aufgabe1, Config.Quest2Coords1, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest2Aufgabe1desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe1',
        args = {},
    })
    
        blipaufgabe1 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest2Coords1)
        SetBlipSprite(blipaufgabe1, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe1, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe1, Config.Blipname1)
        SetBlipFlashes(blipaufgabe1, true)
        AllowSonarBlips(blipaufgabe1,true)


    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest2Aufgabe2, Config.Quest2Coords2, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest2Aufgabe2desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe2',
        args = {},
    })
        
        blipaufgabe2 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest2Coords2)
        SetBlipSprite(blipaufgabe2, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe2, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe2, Config.Blipname2)
        SetBlipFlashes(blipaufgabe2, true)
        AllowSonarBlips(blipaufgabe2,true)



    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest2Aufgabe3, Config.Quest2Coords3, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest2Aufgabe3desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe3',
        args = {},
    })
            
        blipaufgabe3 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest2Coords3)
        SetBlipSprite(blipaufgabe3, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe3, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe3, Config.Blipname3)
        SetBlipFlashes(blipaufgabe3, true)
        AllowSonarBlips(blipaufgabe3,true)

end

-- Quest 3
function Quest3()

    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest3Aufgabe1, Config.Quest3Coords1, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest3Aufgabe1desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe1',
        args = {},
    })
    
        blipaufgabe1 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest3Coords1)
        SetBlipSprite(blipaufgabe1, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe1, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe1, Config.Blipname1)
        SetBlipFlashes(blipaufgabe1, true)
        AllowSonarBlips(blipaufgabe1,true)


    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest3Aufgabe2, Config.Quest3Coords2, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest3Aufgabe2desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe2',
        args = {},
    })
        
        blipaufgabe2 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest3Coords2)
        SetBlipSprite(blipaufgabe2, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe2, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe2, Config.Blipname2)
        SetBlipFlashes(blipaufgabe2, true)
        AllowSonarBlips(blipaufgabe2,true)



    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest3Aufgabe3, Config.Quest3Coords3, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest3Aufgabe3desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe3',
        args = {},
    })
            
        blipaufgabe3 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest3Coords3)
        SetBlipSprite(blipaufgabe3, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe3, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe3, Config.Blipname3)
        SetBlipFlashes(blipaufgabe3, true)
        AllowSonarBlips(blipaufgabe3,true)

end

-- Quest 4
function Quest4()

    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest4Aufgabe1, Config.Quest4Coords1, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest4Aufgabe1desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe1',
        args = {},
    })
    
        blipaufgabe1 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest4Coords1)
        SetBlipSprite(blipaufgabe1, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe1, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe1, Config.Blipname1)
        SetBlipFlashes(blipaufgabe1, true)
        AllowSonarBlips(blipaufgabe1,true)


    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest4Aufgabe2, Config.Quest4Coords2, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest4Aufgabe2desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe2',
        args = {},
    })
        
        blipaufgabe2 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest4Coords2)
        SetBlipSprite(blipaufgabe2, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe2, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe2, Config.Blipname2)
        SetBlipFlashes(blipaufgabe2, true)
        AllowSonarBlips(blipaufgabe2,true)



    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest4Aufgabe3, Config.Quest4Coords3, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest4Aufgabe3desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe3',
        args = {},
    })
            
        blipaufgabe3 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest4Coords3)
        SetBlipSprite(blipaufgabe3, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe3, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe3, Config.Blipname3)
        SetBlipFlashes(blipaufgabe3, true)
        AllowSonarBlips(blipaufgabe3,true)

end

-- Quest 5
function Quest5()

    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest5Aufgabe1, Config.Quest5Coords1, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest5Aufgabe1desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe1',
        args = {},
    })
    
        blipaufgabe1 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest5Coords1)
        SetBlipSprite(blipaufgabe1, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe1, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe1, Config.Blipname1)
        SetBlipFlashes(blipaufgabe1, true)
        AllowSonarBlips(blipaufgabe1,true)


    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest5Aufgabe2, Config.Quest5Coords2, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest5Aufgabe2desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe2',
        args = {},
    })
        
        blipaufgabe2 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest5Coords2)
        SetBlipSprite(blipaufgabe2, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe2, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe2, Config.Blipname2)
        SetBlipFlashes(blipaufgabe2, true)
        AllowSonarBlips(blipaufgabe2,true)



    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest5Aufgabe3, Config.Quest5Coords3, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest5Aufgabe3desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe3',
        args = {},
    })
            
        blipaufgabe3 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest5Coords3)
        SetBlipSprite(blipaufgabe3, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe3, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe3, Config.Blipname3)
        SetBlipFlashes(blipaufgabe3, true)
        AllowSonarBlips(blipaufgabe3,true)

end

-- Quest 6
function Quest6()

    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest6Aufgabe1, Config.Quest6Coords1, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest6Aufgabe1desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe1',
        args = {},
    })
    
        blipaufgabe1 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest6Coords1)
        SetBlipSprite(blipaufgabe1, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe1, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe1, Config.Blipname1)
        SetBlipFlashes(blipaufgabe1, true)
        AllowSonarBlips(blipaufgabe1,true)


    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest6Aufgabe2, Config.Quest6Coords2, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest6Aufgabe2desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe2',
        args = {},
    })
        
        blipaufgabe2 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest6Coords2)
        SetBlipSprite(blipaufgabe2, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe2, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe2, Config.Blipname2)
        SetBlipFlashes(blipaufgabe2, true)
        AllowSonarBlips(blipaufgabe2,true)



    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest6Aufgabe3, Config.Quest6Coords3, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest6Aufgabe3desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe3',
        args = {},
    })
            
        blipaufgabe3 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest6Coords3)
        SetBlipSprite(blipaufgabe3, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe3, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe3, Config.Blipname3)
        SetBlipFlashes(blipaufgabe3, true)
        AllowSonarBlips(blipaufgabe3,true)

end

-- Quest 7
function Quest7()

    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest7Aufgabe1, Config.Quest7Coords1, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest7Aufgabe1desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe1',
        args = {},
    })
    
        blipaufgabe1 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest7Coords1)
        SetBlipSprite(blipaufgabe1, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe1, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe1, Config.Blipname1)
        SetBlipFlashes(blipaufgabe1, true)
        AllowSonarBlips(blipaufgabe1,true)


    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest7Aufgabe2, Config.Quest7Coords2, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest7Aufgabe2desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe2',
        args = {},
    })
        
        blipaufgabe2 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest7Coords2)
        SetBlipSprite(blipaufgabe2, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe2, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe2, Config.Blipname2)
        SetBlipFlashes(blipaufgabe2, true)
        AllowSonarBlips(blipaufgabe2,true)



    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest7Aufgabe3, Config.Quest7Coords3, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest7Aufgabe3desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe3',
        args = {},
    })
            
        blipaufgabe3 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest7Coords3)
        SetBlipSprite(blipaufgabe3, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe3, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe3, Config.Blipname3)
        SetBlipFlashes(blipaufgabe3, true)
        AllowSonarBlips(blipaufgabe3,true)

end

-- Quest 8
function Quest8()

    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest8Aufgabe1, Config.Quest8Coords1, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest8Aufgabe1desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe1',
        args = {},
    })
    
        blipaufgabe1 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest8Coords1)
        SetBlipSprite(blipaufgabe1, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe1, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe1, Config.Blipname1)
        SetBlipFlashes(blipaufgabe1, true)
        AllowSonarBlips(blipaufgabe1,true)


    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest8Aufgabe2, Config.Quest8Coords2, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest8Aufgabe2desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe2',
        args = {},
    })
        
        blipaufgabe2 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest8Coords2)
        SetBlipSprite(blipaufgabe2, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe2, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe2, Config.Blipname2)
        SetBlipFlashes(blipaufgabe2, true)
        AllowSonarBlips(blipaufgabe2,true)



    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest8Aufgabe3, Config.Quest8Coords3, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest8Aufgabe3desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe3',
        args = {},
    })
            
        blipaufgabe3 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest8Coords3)
        SetBlipSprite(blipaufgabe3, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe3, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe3, Config.Blipname3)
        SetBlipFlashes(blipaufgabe3, true)
        AllowSonarBlips(blipaufgabe3,true)

end

-- Quest 9
function Quest9()

    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest9Aufgabe1, Config.Quest9Coords1, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest9Aufgabe1desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe1',
        args = {},
    })
    
        blipaufgabe1 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest9Coords1)
        SetBlipSprite(blipaufgabe1, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe1, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe1, Config.Blipname1)
        SetBlipFlashes(blipaufgabe1, true)
        AllowSonarBlips(blipaufgabe1,true)


    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest9Aufgabe2, Config.Quest9Coords2, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest9Aufgabe2desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe2',
        args = {},
    })
        
        blipaufgabe2 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest9Coords2)
        SetBlipSprite(blipaufgabe2, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe2, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe2, Config.Blipname2)
        SetBlipFlashes(blipaufgabe2, true)
        AllowSonarBlips(blipaufgabe2,true)



    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest9Aufgabe3, Config.Quest9Coords3, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest9Aufgabe3desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe3',
        args = {},
    })
            
        blipaufgabe3 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest9Coords3)
        SetBlipSprite(blipaufgabe3, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe3, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe3, Config.Blipname3)
        SetBlipFlashes(blipaufgabe3, true)
        AllowSonarBlips(blipaufgabe3,true)

end

-- Quest 10
function Quest10()

    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest10Aufgabe1, Config.Quest10Coords1, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest10Aufgabe1desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe1',
        args = {},
    })
    
        blipaufgabe1 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest10Coords1)
        SetBlipSprite(blipaufgabe1, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe1, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe1, Config.Blipname1)
        SetBlipFlashes(blipaufgabe1, true)
        AllowSonarBlips(blipaufgabe1,true)


    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest10Aufgabe2, Config.Quest10Coords2, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest10Aufgabe2desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe2',
        args = {},
    })
        
        blipaufgabe2 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest10Coords2)
        SetBlipSprite(blipaufgabe2, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe2, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe2, Config.Blipname2)
        SetBlipFlashes(blipaufgabe2, true)
        AllowSonarBlips(blipaufgabe2,true)



    Citizen.Wait(500)
    exports['rsg-core']:createPrompt(Config.Quest10Aufgabe3, Config.Quest10Coords3, RSGCore.Shared.Keybinds['J'],  (' ') .. Config.Quest10Aufgabe3desc, {
        type = 'client',
        event = 'mms-questsystem:client:aufgabe3',
        args = {},
    })
            
        blipaufgabe3 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.Quest10Coords3)
        SetBlipSprite(blipaufgabe3, GetHashKey('blip_code_waypoint'), true)
        SetBlipScale(blipaufgabe3, 5.5)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipaufgabe3, Config.Blipname3)
        SetBlipFlashes(blipaufgabe3, true)
        AllowSonarBlips(blipaufgabe3,true)

end

----------------------------------- Aufgaben -----------------------------------------------------------------


RegisterNetEvent('mms-questsystem:client:aufgabe1')
AddEventHandler('mms-questsystem:client:aufgabe1', function()
    if aufgabe1 == 0 then
        CrouchAnim()
        RSGCore.Functions.Progressbar('Erfülle Aufgabe','Du erfüllst deine Aufgabe!',Config.Questtime, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
        end)
        RSGCore.Functions.Notify('Du hast diesen Teil der Quest erfolgreich abgeschlossen!.', 'success')
        if DoesBlipExist(blipaufgabe1) then
            RemoveBlip(blipaufgabe1)
        end
        aufgabe1 = 1
        if aufgabe1 == 1 and aufgabe2 == 1 and aufgabe3 == 1 then
            RSGCore.Functions.Notify('Du hast alle Aufgaben Abgeschlossen! Hole deine Belohnung!.', 'success')
        end
    elseif aufgabe1 == 1 then
        RSGCore.Functions.Notify('Diese aufgabe ist Bereits Erledigt.', 'info')
    end
end)

---- Aufgabe 2

RegisterNetEvent('mms-questsystem:client:aufgabe2')
AddEventHandler('mms-questsystem:client:aufgabe2', function()
    if aufgabe2 == 0 then
        CrouchAnim()
        RSGCore.Functions.Progressbar('Erfülle Aufgabe','Du erfüllst deine Aufgabe!',Config.Questtime, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
        end)
        RSGCore.Functions.Notify('Du hast diesen Teil der Quest erfolgreich abgeschlossen!.', 'success')
        if DoesBlipExist(blipaufgabe2) then
            RemoveBlip(blipaufgabe2)
        end
        aufgabe2 = 1
        if aufgabe1 == 1 and aufgabe2 == 1 and aufgabe3 == 1 then
            RSGCore.Functions.Notify('Du hast alle Aufgaben Abgeschlossen! Hole deine Belohnung!.', 'success')
        end
    elseif aufgabe2 == 1 then
        RSGCore.Functions.Notify('Diese aufgabe ist Bereits Erledigt.', 'info')
    end
end)

---- Aufgabe 3

RegisterNetEvent('mms-questsystem:client:aufgabe3')
AddEventHandler('mms-questsystem:client:aufgabe3', function()
    if aufgabe3 == 0 then
        CrouchAnim()
        RSGCore.Functions.Progressbar('Erfülle Aufgabe','Du erfüllst deine Aufgabe!',Config.Questtime, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
        end)
        RSGCore.Functions.Notify('Du hast diesen Teil der Quest erfolgreich abgeschlossen!.', 'success')
        if DoesBlipExist(blipaufgabe3) then
            RemoveBlip(blipaufgabe3)
        end
        aufgabe3 = 1
        if aufgabe1 == 1 and aufgabe2 == 1 and aufgabe3 == 1 then
            RSGCore.Functions.Notify('Du hast alle Aufgaben Abgeschlossen! Hole deine Belohnung!.', 'success')
        end
    elseif aufgabe3 == 1 then
        RSGCore.Functions.Notify('Diese aufgabe ist Bereits Erledigt.', 'info')
    end
end)

---------------------------------------------------------Questinfo----------------------------

RegisterNetEvent('mms-questsystem:client:questinfo')
AddEventHandler('mms-questsystem:client:questinfo', function(questinfo)
    if activequest == 0 then
        RSGCore.Functions.Notify('Du hast Aktuell keine Quest.', 'error')
    elseif activequest >= 1 then
        RSGCore.Functions.Notify('Erledige Aufgaben. Tip suche auf der Karte nach Quest Makierungen!', 'info')
    end

end)

------------------------------------------------ Questende -----------------------------------

RegisterNetEvent('mms-questsystem:client:questende')
AddEventHandler('mms-questsystem:client:questende', function()
    if activequest == 0 then
        RSGCore.Functions.Notify('Du hast Aktuell keine Quest!', 'error')
    elseif activequest >= 1 and aufgabe1 == 1 and aufgabe2 == 1 and aufgabe3 == 1 then
    DeletePrompts()
    reward = activequest
    aufgabe1 = 0
    aufgabe2 = 0
    aufgabe3 = 0
    activequest = 0
    questamount = questamount + 1
    TriggerServerEvent('mms-questsystem:server:rewards' , reward)
    elseif activequest >=1 and aufgabe1 == 0 then
        RSGCore.Functions.Notify('Du hast nicht alle Aufgaben erledigt!', 'error')
    end
end)

RegisterNetEvent('mms-questsystem:client:questabort')
AddEventHandler('mms-questsystem:client:questabort', function(questende)
    if activequest == 0 then
        RSGCore.Functions.Notify('Du hast Aktuell keine Quest.', 'error')
    elseif activequest >= 1 then
    RSGCore.Functions.Notify('Du brichst deine Aktuelle Quest ab!', 'error')
    activequest = 0
    aufgabe1 = 0
    aufgabe2 = 0
    aufgabe3 = 0
    DeletePrompts()
    if DoesBlipExist(blipaufgabe1) then
        RemoveBlip(blipaufgabe1)
    end
    if DoesBlipExist(blipaufgabe2) then
        RemoveBlip(blipaufgabe2)
    end
    if DoesBlipExist(blipaufgabe3) then
        RemoveBlip(blipaufgabe3)
    end
    end
end)


----------- QUESTSHOP ------------------

-- Questgeber Shop

RegisterNetEvent('mms-questsystem:client:shopmenu', function()
    lib.registerContext(
        {
            id = 'questshop',
            title = ('Silberdollar Shop'),
            position = 'top-right',
            options = {
                {
                    title = ('Geld'),
                    description = ('Silberdollar Shop für Geld'),
                    icon = 'fas fa-shop',
                    event = 'mms-questsystem:client:bonusmoney',
                },
                {
                    title = ('Gegenstände'),
                    description = ('Silberdollar Shop für Gegenstände'),
                    icon = 'fas fa-shop',
                    event = 'mms-questsystem:client:bonusitem',
                },
               {
                    title = ('Quest Limit Zurücksetzen'),
                    description = ('Setze für ' .. Config.PriceQuestreset .. ' Silberdollar Quest Limit zurück!'),
                    icon = 'fas fa-shop',
                    event = 'mms-questsystem:client:questreset',
                },
            }
        }
    )
    lib.showContext('questshop')
end)

------------------- MONEYSHOP -----------------------------------

RegisterNetEvent('mms-questsystem:client:bonusmoney', function()
    lib.registerContext(
        {
            id = 'moneyshop',
            title = ('Silberdollar Shop'),
            position = 'top-right',
            options = {
                {
                    title = ('Geld'),
                    description = ('Für ' .. Config.Bonusmoney1Price .. ' Silberdollar ' .. Config.Bonusmoney1Money .. ' $ Bekommen'),
                    icon = 'fas fa-shop',
                    event = 'mms-questsystem:client:bonusmoney1',
                },
                {
                    title = ('Geld'),
                    description = ('Für ' .. Config.Bonusmoney2Price .. ' Silberdollar ' .. Config.Bonusmoney2Money .. ' $ Bekommen'),
                    icon = 'fas fa-shop',
                    event = 'mms-questsystem:client:bonusmoney2',
                },
                {
                    title = ('Geld'),
                    description = ('Für ' .. Config.Bonusmoney3Price .. ' Silberdollar ' .. Config.Bonusmoney3Money .. ' $ Bekommen'),
                    icon = 'fas fa-shop',
                    event = 'mms-questsystem:client:bonusmoney3',
                },
            }
        }
    )
    lib.showContext('moneyshop')
end)

RegisterNetEvent('mms-questsystem:client:bonusmoney1')
AddEventHandler('mms-questsystem:client:bonusmoney1', function()
    Citizen.Wait(100)
    TriggerServerEvent('mms-questsystem:server:bonusmoney1')
end)

RegisterNetEvent('mms-questsystem:client:bonusmoney2')
AddEventHandler('mms-questsystem:client:bonusmoney2', function()
    Citizen.Wait(100)
    TriggerServerEvent('mms-questsystem:server:bonusmoney2')
end)

RegisterNetEvent('mms-questsystem:client:bonusmoney3')
AddEventHandler('mms-questsystem:client:bonusmoney3', function()
    Citizen.Wait(100)
    TriggerServerEvent('mms-questsystem:server:bonusmoney3')
end)

--------------------- FOOD SHOP --------------------------

RegisterNetEvent('mms-questsystem:client:bonusitem', function()
    lib.registerContext(
        {
            id = 'itemshop',
            title = ('Silberdollar Shop'),
            position = 'top-right',
            options = {
                {
                    title = (Config.Bonusitem1Label),
                    description = ('Für ' .. Config.Bonusitem1Price .. ' Silberdollar ' .. Config.Bonusitem1Label .. ' Bekommen'),
                    icon = 'fas fa-shop',
                    event = 'mms-questsystem:client:bonusitem1',
                },
                {
                    title = (Config.Bonusitem2Label),
                    description = ('Für ' .. Config.Bonusitem2Price .. ' Silberdollar ' .. Config.Bonusitem2Label .. ' Bekommen'),
                    icon = 'fas fa-shop',
                    event = 'mms-questsystem:client:bonusitem2',
                },
                {
                    title = (Config.Bonusitem3Label),
                    description = ('Für ' .. Config.Bonusitem3Price .. ' Silberdollar ' .. Config.Bonusitem3Label .. ' Bekommen'),
                    icon = 'fas fa-shop',
                    event = 'mms-questsystem:client:bonusitem3',
                },
                {
                    title = (Config.Bonusitem4Label),
                    description = ('Für ' .. Config.Bonusitem4Price .. ' Silberdollar ' .. Config.Bonusitem4Label .. ' Bekommen'),
                    icon = 'fas fa-shop',
                    event = 'mms-questsystem:client:bonusitem4',
                },
                {
                    title = (Config.Bonusitem5Label),
                    description = ('Für ' .. Config.Bonusitem5Price .. ' Silberdollar ' .. Config.Bonusitem5Label .. ' Bekommen'),
                    icon = 'fas fa-shop',
                    event = 'mms-questsystem:client:bonusitem5',
                },
            }
        }
    )
    lib.showContext('itemshop')
end)

RegisterNetEvent('mms-questsystem:client:bonusitem1')
AddEventHandler('mms-questsystem:client:bonusitem1', function()
    Citizen.Wait(100)
    TriggerServerEvent('mms-questsystem:server:bonusitem1')
end)

RegisterNetEvent('mms-questsystem:client:bonusitem2')
AddEventHandler('mms-questsystem:client:bonusitem2', function()
    Citizen.Wait(100)
    TriggerServerEvent('mms-questsystem:server:bonusitem2')
end)

RegisterNetEvent('mms-questsystem:client:bonusitem3')
AddEventHandler('mms-questsystem:client:bonusitem3', function()
    Citizen.Wait(100)
    TriggerServerEvent('mms-questsystem:server:bonusitem3')
end)


----------------- Utilities -----------------

------ Animation

function CrouchAnim()
    local dict = "script_rc@cldn@ig@rsc2_ig1_questionshopkeeper"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    TaskPlayAnim(ped, dict, "inspectfloor_player", 0.5, 8.0, -1, 1, 0, false, false, false)
end

------ DElte Prompts

function DeletePrompts()
    if  prompts == 1 then
        if aufgabe1 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest1Aufgabe1)
        end
        if aufgabe2 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest1Aufgabe2)
        end
        if aufgabe3 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest1Aufgabe3)
        end

    elseif prompts == 2 then
        if aufgabe1 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest2Aufgabe1)
        end
        if aufgabe2 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest2Aufgabe2)
        end
        if aufgabe3 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest2Aufgabe3)
        end

    elseif prompts == 3 then
        if aufgabe1 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest3Aufgabe1)
        end
        if aufgabe2 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest3Aufgabe2)
        end
        if aufgabe3 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest3Aufgabe3)
        end
  
    elseif prompts == 4 then
        if aufgabe1 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest4Aufgabe1)
        end
        if aufgabe2 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest4Aufgabe2)
        end
        if aufgabe3 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest4Aufgabe3)
        end

    elseif prompts == 5 then
        if aufgabe1 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest5Aufgabe1)
        end
        if aufgabe2 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest5Aufgabe2)
        end
        if aufgabe3 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest5Aufgabe3)
        end

    elseif prompts == 6 then
        if aufgabe1 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest6Aufgabe1)
        end
        if aufgabe2 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest6Aufgabe2)
        end
        if aufgabe3 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest6Aufgabe3)
        end

    elseif prompts == 7 then
        if aufgabe1 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest7Aufgabe1)
        end
        if aufgabe2 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest7Aufgabe2)
        end
        if aufgabe3 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest7Aufgabe3)
        end

    elseif prompts == 8 then
        if aufgabe1 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest8Aufgabe1)
        end
        if aufgabe2 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest8Aufgabe2)
        end
        if aufgabe3 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest8Aufgabe3)
        end

    elseif prompts == 9 then
        if aufgabe1 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest9Aufgabe1)
        end
        if aufgabe2 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest9Aufgabe2)
        end
        if aufgabe3 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest9Aufgabe3)
        end

    elseif prompts == 10 then
        if aufgabe1 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest10Aufgabe1)
        end
        if aufgabe2 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest10Aufgabe2)
        end
        if aufgabe3 == 0 then
        exports['rsg-core']:deletePrompt(Config.Quest10Aufgabe3)
        end
    end
end

----------- QUEST Limit Reset ---------- 
RegisterNetEvent('mms-questsystem:client:questreset')
AddEventHandler('mms-questsystem:client:questreset', function()
    if questamount > Config.maxquests then
        Citizen.Wait(100)
        TriggerServerEvent('mms-questsystem:server:questreset')
    else 
        RSGCore.Functions.Notify('Questlimit von ' .. Config.maxquests .. ' nicht erreicht mache Weitere Quests bevor du Zurücksetzen kannst.', 'success')
    end
end)

RegisterNetEvent('mms-questsystem:client:questresetfinish')
AddEventHandler('mms-questsystem:client:questresetfinish', function()
    Citizen.Wait(100)
    questamount = 1
    Citizen.Wait(100)
    RSGCore.Functions.Notify('Du hast das Questlimit zurückgesetzt und kannst nun Wieder ' .. Config.maxquests .. ' Quests machen!', 'success')
end)




------------ Questinfo

function Questinfo()
    if activequest == 1 then
        RSGCore.Functions.Notify('Deine Aktuelle Quest ist Bitte bringe mir.', 'success')
        Citizen.Wait(200)
        RSGCore.Functions.Notify(' ' .. Config.quest1anzahl1 .. ' ' .. Config.quest1item1 .. ' ' .. Config.quest1anzahl2 .. ' ' .. Config.quest1item2 .. ' ' .. Config.quest1anzahl3 .. ' ' .. Config.quest1item3 .. ' ', 'success')
    elseif activequest == 2 then
        RSGCore.Functions.Notify('Deine Aktuelle Quest ist Bitte bringe mir.', 'success')
        Citizen.Wait(200)
        RSGCore.Functions.Notify(' ' .. Config.quest2anzahl1 .. ' ' .. Config.quest2item1 .. ' ' .. Config.quest2anzahl2 .. ' ' .. Config.quest2item2 .. ' ' .. Config.quest2anzahl3 .. ' ' .. Config.quest2item3 .. ' ', 'success')
    elseif activequest == 3 then
        RSGCore.Functions.Notify('Deine Aktuelle Quest ist Bitte bringe mir.', 'success')
        Citizen.Wait(200)
        RSGCore.Functions.Notify(' ' .. Config.quest3anzahl1 .. ' ' .. Config.quest3item1 .. ' ' .. Config.quest3anzahl2 .. ' ' .. Config.quest3item2 .. ' ' .. Config.quest3anzahl3 .. ' ' .. Config.quest3item3 .. ' ', 'success')
    elseif activequest == 4 then
        RSGCore.Functions.Notify('Deine Aktuelle Quest ist Bitte bringe mir.', 'success')
        Citizen.Wait(200)
        RSGCore.Functions.Notify(' ' .. Config.quest4anzahl1 .. ' ' .. Config.quest4item1 .. ' ' .. Config.quest4anzahl2 .. ' ' .. Config.quest4item2 .. ' ' .. Config.quest4anzahl3 .. ' ' .. Config.quest4item3 .. ' ', 'success')
    elseif activequest == 5 then
        RSGCore.Functions.Notify('Deine Aktuelle Quest ist Bitte bringe mir.', 'success')
        Citizen.Wait(200)
        RSGCore.Functions.Notify(' ' .. Config.quest5anzahl1 .. ' ' .. Config.quest5item1 .. ' ' .. Config.quest5anzahl2 .. ' ' .. Config.quest5item2 .. ' ' .. Config.quest5anzahl3 .. ' ' .. Config.quest5item3 .. ' ', 'success')
    elseif activequest == 6 then
        RSGCore.Functions.Notify('Deine Aktuelle Quest ist Bitte bringe mir.', 'success')
        Citizen.Wait(200)
        RSGCore.Functions.Notify(' ' .. Config.quest6anzahl1 .. ' ' .. Config.quest6item1 .. ' ' .. Config.quest6anzahl2 .. ' ' .. Config.quest6item2 .. ' ' .. Config.quest6anzahl3 .. ' ' .. Config.quest6item3 .. ' ', 'success')
    elseif activequest == 7 then
        RSGCore.Functions.Notify('Deine Aktuelle Quest ist Bitte bringe mir.', 'success')
        Citizen.Wait(200)
        RSGCore.Functions.Notify(' ' .. Config.quest7anzahl1 .. ' ' .. Config.quest7item1 .. ' ' .. Config.quest7anzahl2 .. ' ' .. Config.quest7item2 .. ' ' .. Config.quest7anzahl3 .. ' ' .. Config.quest7item3 .. ' ', 'success')
    elseif activequest == 8 then
        RSGCore.Functions.Notify('Deine Aktuelle Quest ist Bitte bringe mir.', 'success')
        Citizen.Wait(200)
        RSGCore.Functions.Notify(' ' .. Config.quest8anzahl1 .. ' ' .. Config.quest8item1 .. ' ' .. Config.quest8anzahl2 .. ' ' .. Config.quest8item2 .. ' ' .. Config.quest8anzahl3 .. ' ' .. Config.quest8item3 .. ' ', 'success')
    elseif activequest == 9 then
        RSGCore.Functions.Notify('Deine Aktuelle Quest ist Bitte bringe mir.', 'success')
        Citizen.Wait(200)
        RSGCore.Functions.Notify(' ' .. Config.quest9anzahl1 .. ' ' .. Config.quest9item1 .. ' ' .. Config.quest9anzahl2 .. ' ' .. Config.quest9item2 .. ' ' .. Config.quest9anzahl3 .. ' ' .. Config.quest9item3 .. ' ', 'success')
    elseif activequest == 10 then
        RSGCore.Functions.Notify('Deine Aktuelle Quest ist Bitte bringe mir.', 'success')
        Citizen.Wait(200)
        RSGCore.Functions.Notify(' ' .. Config.quest10anzahl1 .. ' ' .. Config.quest10item1 .. ' ' .. Config.quest10anzahl2 .. ' ' .. Config.quest10item2 .. ' ' .. Config.quest10anzahl3 .. ' ' .. Config.quest10item3 .. ' ', 'success')
    end
end


RegisterNetEvent('mms-questsystem:client:failed1')
AddEventHandler('mms-questsystem:client:failed1', function(questinfo)
        activequest = 1
        Questinfo()
end)

RegisterNetEvent('mms-questsystem:client:failed2')
AddEventHandler('mms-questsystem:client:failed2', function(questinfo)
        activequest = 2
        Questinfo()
end)

RegisterNetEvent('mms-questsystem:client:failed3')
AddEventHandler('mms-questsystem:client:failed3', function(questinfo)
        activequest = 3
        Questinfo()
end)

RegisterNetEvent('mms-questsystem:client:failed4')
AddEventHandler('mms-questsystem:client:failed4', function(questinfo)
        activequest = 4
        Questinfo()
end)

RegisterNetEvent('mms-questsystem:client:failed5')
AddEventHandler('mms-questsystem:client:failed5', function(questinfo)
        activequest = 5
        Questinfo()
end)

RegisterNetEvent('mms-questsystem:client:failed6')
AddEventHandler('mms-questsystem:client:failed6', function(questinfo)
        activequest = 6
        Questinfo()
end)

RegisterNetEvent('mms-questsystem:client:failed7')
AddEventHandler('mms-questsystem:client:failed7', function(questinfo)
        activequest = 7
        Questinfo()
end)

RegisterNetEvent('mms-questsystem:client:failed8')
AddEventHandler('mms-questsystem:client:failed8', function(questinfo)
        activequest = 8
        Questinfo()
end)

RegisterNetEvent('mms-questsystem:client:failed9')
AddEventHandler('mms-questsystem:client:failed9', function(questinfo)
        activequest = 9
        Questinfo()
end)

RegisterNetEvent('mms-questsystem:client:failed10')
AddEventHandler('mms-questsystem:client:failed10', function(questinfo)
        activequest = 10
        Questinfo()
end)