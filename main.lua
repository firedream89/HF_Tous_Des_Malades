
--Return table of { faction_id, faction_name, faction_reputation_level }
function Get_Reput()
    local faction_Info = {}
    for id = 1, #REPUT_SCANNED do
        local name, description, standingID, barMin, barMax, barValue = GetFactionInfoByID(REPUT_SCANNED[id])
        faction_Info[#faction_Info+1] = { REPUT_SCANNED[id], name, barValue }
    end
    return faction_Info
end

---Return table with t1 + t2 items
function TableConcat(t1,t2)
    local result = {}
    for i=1,#t1 do
        result[#result+1] = t1[i]
    end
    for i=1,#t2 do
        result[#result+1] = t2[i]
    end
    return result
end

---Return table of strings splitted by sep
function Split(inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end


---Get info remaining quest/kill
function Get_Remaining_Kill(faction_id, reput_faction)
    local result = ""
    if faction_id == BAIE_DU_BUTIN or faction_id == CABESTAN or faction_id == GADGETZAN or faction_id == LONG_GUET then --CARTEL
        if reput_faction >= REPUT_MAX_HONORED then
            result = math.ceil((REPUT_MAX - reput_faction) / REPUT_PIRATE_KILL).." pirates restant"
        else
            result = math.ceil((REPUT_MAX_HONORED - reput_faction) / REPUT_CARTEL_QUEST).." quetes restante"
        end
    
    elseif faction_id == VOILE_SANGLANTE then
        result = math.ceil((REPUT_MAX_HONORED+1 - reput_faction) / REPUT_CARTEL_KILL).." Gobelins restant"
    
    elseif faction_id == RAVENHOLD then
        if reput_faction < REPUT_MAX_HONORED then
            result = math.ceil((REPUT_MAX_HONORED - reput_faction) / REPUT_PIRATE_KILL).." Pirates restant"
        else
            result = math.ceil((REPUT_MAX - reput_faction) / REPUT_RAVENHOLD_QUEST).." Quetes restante"
        end
    
    elseif faction_id == SHEN_DRALAR then
        if SHEN_DRALAR_REQUIRE_QUEST_COMPETED then
            result = math.ceil((REPUT_MAX - reput_faction) / REPUT_SHEN_DRALAR_QUEST).." Quetes restante"
        else
            result = "Quete principale requise !"
        end

    elseif faction_id == FOIRE_DE_SOMBRELUNE then
        result = math.ceil((REPUT_MAX - reput_faction) / REPUT_FOIRE_EPIC_CARD).." Quetes restante"
    end
    return result
end

---@meta
---@param faction_id number
---@param type string | TYPE
---@param all boolean
---@return table?
---@return integer?
function Get_Faction_Items(faction_id, type, all)
    if type == nil then
        type = "Items"
    end
    if all == nil then
        all = true
    end

    local items_table = 1
    local items_quest = nil
    local items_quantity = nil
    local items_icon = nil
    if faction_id == BAIE_DU_BUTIN then
        items_quest = ITEMS_QUEST_BAIE_DU_BUTIN
        items_quantity = ITEM_QUANTITY_BAIE_DU_BUTIN
        items_icon = ICONS_BAIE_DU_BUTIN
    elseif faction_id == CABESTAN then
        items_quest = ITEMS_QUEST_CABESTAN
        items_quantity = ITEM_QUANTITY_CABESTAN
        items_icon = ICONS_CABESTAN
    elseif faction_id == LONG_GUET then
        items_quest = ITEMS_QUEST_LONG_GUET
        items_quantity = ITEM_QUANTITY_LONG_GUET
        items_icon = ICONS_LONG_GUET
    elseif faction_id == GADGETZAN then
        items_quest = ITEMS_QUEST_GADGETZAN
        items_quantity = ITEM_QUANTITY_GADGETZAN
        items_icon = ICONS_GADGETZAN
    elseif faction_id == RAVENHOLD then
        items_quest = ITEM_RAVENHOLD_QUEST
        items_quantity = RAVENHOLD_ITEM_MAX_QUANTITY
        items_icon = ICONS_RAVENHOLDT
    elseif faction_id == SHEN_DRALAR then
        if all then
            items_quest = { ITEM_FOCA_QUEST, ITEM_PROT_QUEST, ITEM_RAPI_QUEST }
            items_quantity = { SHEN_DRALAR_ITEM_FOCA_QUANTITY, SHEN_DRALAR_ITEM_PROT_QUANTITY, SHEN_DRALAR_ITEM_RAPI_QUANTITY }
            items_icon = { ICONS_FOCA, ICONS_PROT, ICONS_RAPI }
            items_table = 3
        else
            items_quest = ITEM_FOCA_QUEST
            items_quantity = SHEN_DRALAR_ITEM_FOCA_QUANTITY
            items_icon = ICONS_FOCA
        end
    elseif faction_id == FOIRE_DE_SOMBRELUNE then
        if all then
            items_quest = { SOMBRELUNE_ITEMS, SOMBRELUNE_EPIC_ITEMS }
            items_quantity = { SOMBRELUNE_ITEMS_QUANTITY, SOMBRELUNE_EPIC_ITEMS_QUANTITY }
            items_icon = { ICONS_ITEMS_SOMBRELUNE, ICONS_ITEMS_EPIC_SOMBRELUNE }
            items_table = 2
        else
            items_quest = SOMBRELUNE_EPIC_ITEMS
            items_quantity = SOMBRELUNE_EPIC_ITEMS_QUANTITY
            items_icon = ICONS_ITEMS_EPIC_SOMBRELUNE
        end
    end

    if items_quest ~= nil and items_table == 1 then
        items_quest = { items_quest }
        items_quantity = { items_quantity }
        items_icon = { items_icon }
    end

    if type == "Items" then
        return items_quest, items_table
    elseif type == "Items_quantity" then
        return items_quantity
    elseif type == "Icons" then
        return items_icon
    end
    return nil
end

function Get_Quests_Items_Color(faction_id, item)
    local items_id, items_table = Get_Faction_Items(faction_id, "Items", true)
    local items_quantity = Get_Faction_Items(faction_id, "Items_quantity", true)
    if items_id == nil or items_quantity == nil then
        return "|cffffffff"
    end

    local isOk = true
    if item ~= nil then
        if Sum_Item(faction_id, item) < items_quantity[1][item] then
            isOk = false
        end
    else
        for i = 1, #items_id do
            for i2 = 1, #items_id[i] do
                local nb_items = GetItemCount(items_id[i][i2], true)
                Add_Item(faction_id, i2, nb_items) --Update database
                if Sum_Item(faction_id, i) < items_quantity[i][i2] then
                    isOk = false
                end
            end
        end
    end
    
    if not isOk then
        return "|cffff0000"
    else
        return "|cff00ff00"
    end
end

function Get_Items_Number(faction_id)
    local items = {}
    local items_quest, items_table = Get_Faction_Items(faction_id, "Items", true)
    local items_quantity = Get_Faction_Items(faction_id, "Items_quantity", true)
    local items_icon = Get_Faction_Items(faction_id, "Icons", true)
    if items_quest == nil or items_quantity == nil or items_icon == nil then
        return items, 0
    end
    
    for i = 1, #items_quest do
        items[#items+1] = {}
        for i2 = 1, #items_quest[i] do
            local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture = GetItemInfo(items_quest[i][i2])
            if itemName == nil or itemTexture == nil then
                itemName = "n"
                itemTexture = "n"
            end
            if #items_icon ~= #items_quest then
                items_icon = items_quest
            end
            items[i][#items[i]+1] = { items_icon[i][i2], itemName, Sum_Item(faction_id, i2), items_quantity[i][i2] }
        end
    end
    return items, items_table
end

function Update()
    local result = {}
    local items_table = 1

    local list_result = {}
    local reput = Get_Reput()
    for id = 1, #reput do
        Completed(reput[id][1], reput[id][3]) --Test reput is completed
        if not Is_Completed(reput[id][1]) then
            local max = REPUT_MAX
            local multiplicateur = 1
            if reput[id][1] == VOILE_SANGLANTE then
                max = REPUT_MAX_HONORED
            elseif reput[id][1] == FOIRE_DE_SOMBRELUNE then
                multiplicateur = tonumber(Split(Get_Remaining_Kill(reput[id][1], reput[id][3]), " ")[1]*8)
            end
            list_result[#list_result+1] = { 1, Get_Quests_Items_Color(reput[id][1])..reput[id][2].." "..reput[id][3].."/"..max.."XP "..Get_Remaining_Kill(reput[id][1], reput[id][3]).."|r</p>" }
            result, items_table = Get_Items_Number(reput[id][1])
            local level = 2
            if result then
                for i = 1, items_table do
                    if reput[id][1] == FOIRE_DE_SOMBRELUNE then
                        level = 3
                        if i == 1 then
                            list_result[#list_result+1] = { 2, "Total plantes nb/total</p>" }
                        else
                            list_result[#list_result+1] = { 2, "Total plantes épique nb/total</p>" }
                        end
                    elseif reput[id][1] == SHEN_DRALAR then
                        level = 3
                        if i == 1 then
                            list_result[#list_result+1] = { 2, "Libram Focalisation</p>" }
                        elseif i == 2 then
                            list_result[#list_result+1] = { 2, "Libram Protection</p>" }
                        else
                            list_result[#list_result+1] = { 2, "Libram Rapidité</p>" }
                        end
                    end
                    for i2 = 1, #result[i] do
                        list_result[#list_result+1] = { level, "|TInterface/Icons/"..result[i][i2][1]..":15|t"..result[i][i2][2].." "..result[i][i2][3].."/"..result[i][i2][4]*multiplicateur.."</p>" }
                    end
                end
            end
        end
    end
    if Ui ~= nil then
        Ui:Update(list_result)
    end
    --Update_UI(list_result)
end

function Completed(faction_id, reputation)
    local reput_max = REPUT_MAX
    if faction_id == VOILE_SANGLANTE then
        reput_max = REPUT_MAX_HONORED
    end

    if reputation >= reput_max then
        Set_Completed(faction_id)
    end
end

--foire de sombrelune
--comptage dynamique items = sum items / total items quantity(suit * 15) -- OK

--Comptage total en tête  
--2, nb/Total plantes normal
-- 3, plante 1
-- 3, plante 2
--...
--2, nb/Total plantes épique
-- 3, plante 1

--idem pour shen'dralar