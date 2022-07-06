--CHAT COMMAND
CMD_HIDE = "hide"
CMD_SHOW = "show"

--CARTEL
ITEM_QUANTITY = { 40, 4 }
REPUT_CARTEL_QUEST = 500
REPUT_PIRATE_KILL = 5
ITEMS_QUEST_CABESTAN = { 2589, 3371 }
ITEM_QUANTITY_CABESTAN = { 3360, 336 }
ITEM_QUANTITY_BAIE_DU_BUTIN = { 1680, 168 }
ITEM_QUANTITY_GADGETZAN = { 840, 84 }
ITEM_QUANTITY_LONG_GUET = { 420, 42 }
ITEMS_QUEST_BAIE_DU_BUTIN = { 4306, 2604 }
ITEMS_QUEST_GADGETZAN = { 4338, 3466 }
ITEMS_QUEST_LONG_GUET = { 14047, 3857 }
ICONS_BAIE_DU_BUTIN = { "inv_fabric_silk_01", "inv_potion_11" }
ICONS_CABESTAN = { "inv_fabric_linen_01", "inv_drink_06" }
ICONS_LONG_GUET = { "inv_fabric_purplefire_01", "inv_ore_tin_01" }
ICONS_GADGETZAN = { "inv_fabric_mageweave_01", "inv_misc_ammo_gunpowder_01" }
REPUT_CARTEL_KILL = 25

--RAVENHOLD
REPUT_RAVENHOLD_QUEST = 75
RAVENHOLD_ITEM_QUANTITY = { 5 }
RAVENHOLD_ITEM_MAX_QUANTITY = { 1405 }
ITEM_RAVENHOLD_QUEST = { 16885 }
ICONS_RAVENHOLDT = { "inv_box_03" }

--SHEN'DRALAR
REPUT_SHEN_DRALAR_QUEST = 500
SHEN_DRALAR_ITEM_FOCA_QUANTITY = { 1, 1, 4, 2 }
SHEN_DRALAR_ITEM_PROT_QUANTITY = { 1, 1, 2, 1 }
SHEN_DRALAR_ITEM_RAPI_QUANTITY = { 1, 1, 2, 2 }
ITEM_FOCA_QUEST = { 18333, 18335, 14344, 12753 }
ITEM_PROT_QUEST = { 18334, 18335, 14344, 12735 }
ITEM_RAPI_QUEST = { 18332, 18335, 14344, 12938 }
ITEMS_SHEN_DRALAR_QUEST = { 18332, 18333, 18334, 18335, 14344, 12753, 12735, 12938 }
SHEN_DRALAR_REQUIRE_QUEST_COMPETED = C_QuestLog.IsQuestFlaggedCompleted(7482)
ICONS_FOCA = { "inv_misc_book_04", "inv_misc_gem_02", "inv_enchant_shardbrilliantlarge", "inv_misc_shadowegg" }
ICONS_PROT = { "inv_misc_book_04", "inv_misc_gem_02", "inv_enchant_shardbrilliantlarge", "inv_misc_shadowegg" }
ICONS_RAPI = { "inv_misc_book_04", "inv_misc_gem_02", "inv_enchant_shardbrilliantlarge", "inv_misc_shadowegg" }

--FOIRE DE SOMBRELUNE
REPUT_FOIRE_CARD = 25
REPUT_FOIRE_EPIC_CARD = 250
FOIRE_CARD_SUIT_QUANTITY = 1
SOMBRELUNE_DECK = { 44148, 42922, 43039, 44185 } --mage, épée, voleur, démon
SOMBRELUNE_EPIC_DECK = { 19277, 19267, 19257, 19228 } --portail, élémentaire, seigneur de guerre, fauve
SOMBRELUNE_ITEMS = { 3819, 3358, 3357, 3356, 2453, 3820, 8845, 8839, 8846 } --dent de dragon, moustache de khadgar, vietérule, sang-royal, bruiseweed, stranglekelp, champignon fantome, aveuglette, gromsang
SOMBRELUNE_EPIC_ITEMS = { 13466, 13467, 13465 } --chagrinelle, chapeglace, sauge-argent des montagnes
SOMBRELUNE_ITEMS_QUANTITY = { 15, 15, 15, 15, 15, 15, 15, 15, 15 }
SOMBRELUNE_EPIC_ITEMS_QUANTITY = { 15, 15, 15 }
SOMBRELUNE_ITEMS_TITLE = ""
SOMBRELUNE_ITEMS_EPIC_TITLE = ""
ICONS_ITEMS_SOMBRELUNE = { "inv_misc_flower_03", "inv_misc_herb_08", "inv_misc_root_02", 
"inv_misc_herb_03", "inv_misc_herb_01", "inv_misc_herb_11", "inv_mushroom_08", "inv_misc_herb_14",
"inv_misc_herb_16" }
ICONS_ITEMS_EPIC_SOMBRELUNE = { "inv_misc_herb_plaguebloom", "inv_misc_herb_icecap", "inv_misc_herb_mountainsilversage" }

--FACTION ID
VOILE_SANGLANTE = 87
BAIE_DU_BUTIN = 21
CABESTAN = 470
LONG_GUET = 577
GADGETZAN = 369
FOIRE_DE_SOMBRELUNE = 909
RAVENHOLD = 349
SHEN_DRALAR = 809

--REPUTATION
REPUT_MIN = -42000
REPUT_MAX = 42000
REPUT_MAX_HONORED = 20999
REPUT_SCANNED = { 87, 21, 470, 577, 369, 909, 349, 809 } --Voile sanglante, Baie du butin, Cabestan, Long-guet, gadgetzan, Foire de sombrelune, Ravenhold, Shen'dralar
IS_CARTEL = { false, true, true, true, true, false, false, false }

--GLOBAL
IS_COMPLETED = { false, false, false, false, false, false, false, false }
STATES = { false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false }
TEXT_SIZE = 12
Y_SPACE = -15

---@meta
---@alias TYPE
---|"Items"
---|"Items_quantity"
---|"Icons"