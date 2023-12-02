Config = {}


Config.questlimit = true   ----------- begrenzte Anzahl an Quests true Ja false Nein
Config.maxquests = 3  --------  Anzahl der Quests bevor man keine mehr bekommt 3 = du kannst 3 Quests machen

--Setup as many places as you want
Config.questgeber = {
    {
        lable = 'Valentine Questmanager',
        name = 'Questmanager Valentine',
        coords = vector3(-339.43, 796.68, 117.17),  --- Valentine
        showblip = true,
        blipName = 'Questmanager Valentine',
        blipSprite = 'blip_rc',
        blipScale = 4.5
    },
    {
        lable = 'Blackwater Questmanager',
        name = 'Questmanager Blackwater',
        coords = vector3(-817.72, -1261.65, 43.72),  --- Blackwater
        showblip = true,
        blipName = 'Questmanager Blackwater',
        blipSprite = 'blip_rc',
        blipScale = 4.5
    },
    {
        lable = 'Rhodes Questmanager',
        name = 'Questmanager Rhodes',
        coords = vector3(1286.19, -1288.44, 75.89),  --- Rhodes 
        showblip = true,
        blipName = 'Questmanager Rhodes',
        blipSprite = 'blip_rc',
        blipScale = 4.5
    },
    {
        lable = 'Armadillo Questmanager',
        name = 'Questmanager Armadillo',
        coords = vector3(-3726.81, -2624.95, -13.23),  --- Armadillo 
        showblip = true,
        blipName = 'Questmanager Armadillo',
        blipSprite = 'blip_rc',
        blipScale = 4.5
    },
    -- add more as required
}

Config.Questtime = 5000  ------!!!DO NOT TOUCH!!!-------

---------------Reward Settings---------------
Config.Dynamicrewards = true  --- Wenn true dann werden min - max Preise genommen WEnn False Wird nur der Noramle Preis genommen

Config.Silberdollar = 5
Config.Silberdollarmin = 5
Config.Silberdollarmax = 10

Config.Money = 5
Config.Moneymin = 5
Config.Moneymax = 10

Config.Blipname1 = 'Quest Makierung'
Config.Blipname2 = 'Quest Makierung'
Config.Blipname3 = 'Quest Makierung'

-------------SHOP SETTINGS ---------------------

---------------- Moneyshop

Config.PriceQuestreset = 150

Config.Bonusmoney1Price = 50         -- für 50 Silberdollar
Config.Bonusmoney1Money = 10          -- 10$ Bonus

Config.Bonusmoney2Price = 100        -- für 100 Silberdollar
Config.Bonusmoney2Money = 20          -- 20$ Bonus

Config.Bonusmoney3Price = 200         -- für 200 Silberdollar
Config.Bonusmoney3Money = 50          -- 50$ Bonus

---------------- Itemshop

Config.Bonusitem1Name = 'weapon_bow_improved'           -- Name of the Item from rsg-core/shared/items.lua  'bread'
Config.Bonusitem1Label = 'Erweiterter Bogen'          -- Name of the Item how you wanna name it example   'Brot'
Config.Bonusitem1Price = 100           -- Price of the item to buy (Silberdollar Price) example 100 Silberdollar
Config.Bonusitem1Amount = 1             -- How Many items you should get  example 1 = 1 Brot

Config.Bonusitem2Name = 'ammo_arrow'           -- Name of the Item from rsg-core/shared/items.lua  'bread'
Config.Bonusitem2Label = 'Pfeile'          -- Name of the Item how you wanna name it example   'Brot'
Config.Bonusitem2Price = 15           -- Price of the item to buy (Silberdollar Price) example 100 Silberdollar
Config.Bonusitem2Amount = 1             -- How Many items you should get  example 1 = 1 Brot

Config.Bonusitem3Name = 'goldpan'           -- Name of the Item from rsg-core/shared/items.lua  'bread'
Config.Bonusitem3Label = 'Goldpfanne'          -- Name of the Item how you wanna name it example   'Brot'
Config.Bonusitem3Price = 50           -- Price of the item to buy (Silberdollar Price) example 100 Silberdollar
Config.Bonusitem3Amount = 1             -- How Many items you should get  example 1 = 1 Brot

Config.Bonusitem4Name = 'schatzkarte'           -- Name of the Item from rsg-core/shared/items.lua  'bread'
Config.Bonusitem4Label = 'Schatzkarte'          -- Name of the Item how you wanna name it example   'Brot'
Config.Bonusitem4Price = 50           -- Price of the item to buy (Silberdollar Price) example 100 Silberdollar
Config.Bonusitem4Amount = 1             -- How Many items you should get  example 1 = 1 Brot

Config.Bonusitem5Name = 'lotterielos'           -- Name of the Item from rsg-core/shared/items.lua  'bread'
Config.Bonusitem5Label = 'Lotterie Los'          -- Name of the Item how you wanna name it example   'Brot'
Config.Bonusitem5Price = 50           -- Price of the item to buy (Silberdollar Price) example 100 Silberdollar
Config.Bonusitem5Amount = 1             -- How Many items you should get  example 1 = 1 Brot


------- Quest1

Config.Quest1Coords1 = vector3(-1293.38, 397.18, 95.28)
Config.Quest1Aufgabe1 = 'Plakat'
Config.Quest1Aufgabe1desc = 'Hänge Plakat auf!'

Config.Quest1Coords2 = vector3(1434.29, 356.45, 89.04)
Config.Quest1Aufgabe2 = 'Wasser'
Config.Quest1Aufgabe2desc = 'Hole Wasser aus dem Brunnen!'

Config.Quest1Coords3 = vector3(-254.05, 638.47, 118.66)
Config.Quest1Aufgabe3 = 'Fenster'
Config.Quest1Aufgabe3desc = 'Schaue aus dem Fenster!'

------- Quest 2

Config.Quest2Coords1 = vector3(217.28, 981.30, 190.65)
Config.Quest2Aufgabe1 = 'Holz'
Config.Quest2Aufgabe1desc = 'Hole Feuerholz!'

Config.Quest2Coords2 = vector3(772.17, 844.37, 118.98)
Config.Quest2Aufgabe2 = 'Schrank'
Config.Quest2Aufgabe2desc = 'Durchsuche Schrank!'

Config.Quest2Coords3 = vector3(1814.24, -53.00, 57.67)
Config.Quest2Aufgabe3 = 'Kutsche'
Config.Quest2Aufgabe3desc = 'Sieh nach der Kutsche!'

------- Quest 3

Config.Quest3Coords1 = vector3(-1090.05, -577.76, 82.46)
Config.Quest3Aufgabe1 = 'Koffer'
Config.Quest3Aufgabe1desc = 'Stehle Koffer!'

Config.Quest3Coords2 = vector3(-788.98, -1402.30, 43.58)
Config.Quest3Aufgabe2 = 'Waschen'
Config.Quest3Aufgabe2desc = 'Wasche deine Wäsche!'

Config.Quest3Coords3 = vector3(-1495.12, -793.47, 102.91)
Config.Quest3Aufgabe3 = 'Tisch'
Config.Quest3Aufgabe3desc = 'Wühle auf dem Tisch!'

------- Quest 4

Config.Quest4Coords1 = vector3(-3306.36, -2850.70, -5.91)
Config.Quest4Aufgabe1 = 'Grabstein'
Config.Quest4Aufgabe1desc = 'Schaue wer hier Liegt!'

Config.Quest4Coords2 = vector3(-2414.98, -2429.13, 60.97)
Config.Quest4Aufgabe2 = 'Eier'
Config.Quest4Aufgabe2desc = 'Schaue ob es Eier gibt!'

Config.Quest4Coords3 = vector3(-5230.14, -3468.29, -20.53)
Config.Quest4Aufgabe3 = 'Ticket'
Config.Quest4Aufgabe3desc = 'Kaufe Zugticket!'

------- Quest 5

Config.Quest5Coords1 = vector3(-5972.03, -3260.77, -21.52)
Config.Quest5Aufgabe1 = 'Feuer'
Config.Quest5Aufgabe1desc = 'Untersuche die Feuerstelle!'

Config.Quest5Coords2 = vector3(-2500.62, -1467.17, 147.62)
Config.Quest5Aufgabe2 = 'Kanu'
Config.Quest5Aufgabe2desc = 'Untersuche das Kanu!'

Config.Quest5Coords3 = vector3(-870.63, -1631.18, 68.23)
Config.Quest5Aufgabe3 = 'Fisch'
Config.Quest5Aufgabe3desc = 'Klaue einen Fisch aus dem Eimer!'

------- Quest 6

Config.Quest6Coords1 = vector3(2658.72, -938.77, 43.13)
Config.Quest6Aufgabe1 = 'Ernten'
Config.Quest6Aufgabe1desc = 'Ernte das Beet!'

Config.Quest6Coords2 = vector3(2036.64, -875.12, 42.32)
Config.Quest6Aufgabe2 = 'Orangen'
Config.Quest6Aufgabe2desc = 'Klaue einen Korb Orangen!'

Config.Quest6Coords3 = vector3(2540.61, 802.35, 76.43)
Config.Quest6Aufgabe3 = 'Axt'
Config.Quest6Aufgabe3desc = 'Klaue eine Blutverschmierte Axt!'

------- Quest 7

Config.Quest7Coords1 = vector3(1981.93, 1183.30, 171.11)
Config.Quest7Aufgabe1 = 'Kleidung'
Config.Quest7Aufgabe1desc = 'Hänge Wäsche ab!'

Config.Quest7Coords2 = vector3(744.68, 1818.34, 241.27)
Config.Quest7Aufgabe2 = 'Fenster'
Config.Quest7Aufgabe2desc = 'Schaue durch das Fenster!'

Config.Quest7Coords3 = vector3(-411.15, 1749.67, 219.35)
Config.Quest7Aufgabe3 = 'Truhe'
Config.Quest7Aufgabe3desc = 'Durchsuche die Truhe nach Schätzen!'

------- Quest 8

Config.Quest8Coords1 = vector3(-2223.28, 730.50, 123.29)
Config.Quest8Aufgabe1 = 'Stall'
Config.Quest8Aufgabe1desc = 'Miste den Stall aus!'

Config.Quest8Coords2 = vector3(-1823.97, 657.57, 132.22)
Config.Quest8Aufgabe2 = 'Beten'
Config.Quest8Aufgabe2desc = 'Bete für deinen Freund!'

Config.Quest8Coords3 = vector3(-1733.07, -81.12, 181.60)
Config.Quest8Aufgabe3 = 'Sack'
Config.Quest8Aufgabe3desc = 'Stehle einen Sack!'

------- Quest 9

Config.Quest9Coords1 = vector3(2092.26, -1816.19, 42.98)
Config.Quest9Aufgabe1 = 'Geschirr'
Config.Quest9Aufgabe1desc = 'Spüle dreckiges Geschirr!'

Config.Quest9Coords2 = vector3(1833.08, -1279.29, 43.39)
Config.Quest9Aufgabe2 = 'Tabak'
Config.Quest9Aufgabe2desc = 'Nehme getrockneten Tabak!'

Config.Quest9Coords3 = vector3(893.29, -1899.36, 45.25)
Config.Quest9Aufgabe3 = 'Huhn'
Config.Quest9Aufgabe3desc = 'Stehle ein Huhn!'

------- Quest 10

Config.Quest10Coords1 = vector3(2518.10, 2281.43, 177.40)
Config.Quest10Aufgabe1 = 'Maschine'
Config.Quest10Aufgabe1desc = 'Untersuche die Maschine!'

Config.Quest10Coords2 = vector3(1934.18, 1946.85, 263.06)
Config.Quest10Aufgabe2 = 'Waffenteile'
Config.Quest10Aufgabe2desc = 'Stehle die Waffenteile!'

Config.Quest10Coords3 = vector3(-157.35, 1495.07, 116.11)
Config.Quest10Aufgabe3 = 'Leiter'
Config.Quest10Aufgabe3desc = 'Stehle die Leiter!'