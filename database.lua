function Get_Item(faction_id, item_number)
    if faction_id == BAIE_DU_BUTIN then
        if item_number == 1 then
            return TDMDB.baie_du_butin.item1
        elseif item_number == 2 then
            return TDMDB.baie_du_butin.item2
        end
    elseif faction_id == CABESTAN then
        if item_number == 1 then
            return TDMDB.cabestan.item1
        elseif item_number == 2 then
            return TDMDB.cabestan.item2
        end
    elseif faction_id == LONG_GUET then
        if item_number == 1 then
            return TDMDB.long_guet.item1
        elseif item_number == 2 then
            return TDMDB.long_guet.item2
        end
    elseif faction_id == GADGETZAN then
        if item_number == 1 then
            return TDMDB.gadgetzan.item1
        elseif item_number == 2 then
            return TDMDB.gadgetzan.item2
        end
    elseif faction_id == RAVENHOLD then
        if item_number == 1 then
            return TDMDB.ravenhold.item1
        end
    elseif faction_id == SHEN_DRALAR then
        if item_number == 1 then
            return TDMDB.shen_dralar.item1
        elseif item_number == 2 then
            return TDMDB.shen_dralar.item2
        elseif item_number == 3 then
            return TDMDB.shen_dralar.item3
        elseif item_number == 4 then
            return TDMDB.shen_dralar.item4
        elseif item_number == 5 then
            return TDMDB.shen_dralar.item5
        elseif item_number == 6 then
            return TDMDB.shen_dralar.item6
        elseif item_number == 7 then
            return TDMDB.shen_dralar.item7
        elseif item_number == 8 then
            return TDMDB.shen_dralar.item8
        end
    elseif faction_id == FOIRE_DE_SOMBRELUNE then
        if item_number == 1 then
            return TDMDB.foire_de_sombrelune.item1
        elseif item_number == 2 then
            return TDMDB.foire_de_sombrelune.item2
        elseif item_number == 3 then
            return TDMDB.foire_de_sombrelune.item3
        elseif item_number == 4 then
            return TDMDB.foire_de_sombrelune.item4
        elseif item_number == 5 then
            return TDMDB.foire_de_sombrelune.item5
        elseif item_number == 6 then
            return TDMDB.foire_de_sombrelune.item6
        elseif item_number == 7 then
            return TDMDB.foire_de_sombrelune.item7
        elseif item_number == 8 then
            return TDMDB.foire_de_sombrelune.item8
        elseif item_number == 9 then
            return TDMDB.foire_de_sombrelune.item9
        elseif item_number == 10 then
            return TDMDB.foire_de_sombrelune.item10
        elseif item_number == 11 then
            return TDMDB.foire_de_sombrelune.item11
        elseif item_number == 12 then
            return TDMDB.foire_de_sombrelune.item12
        end
    end
    return nil
end

function Set_Item(faction_id, item_number, item)
    if faction_id == BAIE_DU_BUTIN then
        if item_number == 1 then
            TDMDB.baie_du_butin.item1 = item
        elseif item_number == 2 then
            TDMDB.baie_du_butin.item2 = item
        end
    elseif faction_id == CABESTAN then
        if item_number == 1 then
            TDMDB.cabestan.item1 = item
        elseif item_number == 2 then
            TDMDB.cabestan.item2 = item
        end
    elseif faction_id == LONG_GUET then
        if item_number == 1 then
            TDMDB.long_guet.item1 = item
        elseif item_number == 2 then
            TDMDB.long_guet.item2 = item
        end
    elseif faction_id == GADGETZAN then
        if item_number == 1 then
            TDMDB.gadgetzan.item1 = item
        elseif item_number == 2 then
            TDMDB.gadgetzan.item2 = item
        end
    elseif faction_id == RAVENHOLD then
        if item_number == 1 then
            TDMDB.ravenhold.item1 = item
        end
    elseif faction_id == SHEN_DRALAR then
        if item_number == 1 then
            TDMDB.shen_dralar.item1 = item
        elseif item_number == 2 then
            TDMDB.shen_dralar.item2 = item
        elseif item_number == 3 then
            TDMDB.shen_dralar.item3 = item
        elseif item_number == 4 then
            TDMDB.shen_dralar.item4 = item
        elseif item_number == 5 then
            TDMDB.shen_dralar.item5 = item
        elseif item_number == 6 then
            TDMDB.shen_dralar.item6 = item
        elseif item_number == 7 then
            TDMDB.shen_dralar.item7 = item
        elseif item_number == 8 then
            TDMDB.shen_dralar.item8 = item
        end
    elseif faction_id == FOIRE_DE_SOMBRELUNE then
        if item_number == 1 then
            TDMDB.foire_de_sombrelune.item1 = item
        elseif item_number == 2 then
            TDMDB.foire_de_sombrelune.item2 = item
        elseif item_number == 3 then
            TDMDB.foire_de_sombrelune.item3 = item
        elseif item_number == 4 then
            TDMDB.foire_de_sombrelune.item4 = item
        elseif item_number == 5 then
            TDMDB.foire_de_sombrelune.item5 = item
        elseif item_number == 6 then
            TDMDB.foire_de_sombrelune.item6 = item
        elseif item_number == 7 then
            TDMDB.foire_de_sombrelune.item7 = item
        elseif item_number == 8 then
            TDMDB.foire_de_sombrelune.item8 = item
        elseif item_number == 9 then
            TDMDB.foire_de_sombrelune.item9 = item
        elseif item_number == 10 then
            TDMDB.foire_de_sombrelune.item10 = item
        elseif item_number == 11 then
            TDMDB.foire_de_sombrelune.item11 = item
        elseif item_number == 12 then
            TDMDB.foire_de_sombrelune.item12 = item
        end
    end
end

function Is_Completed(id_faction)
    if id_faction == BAIE_DU_BUTIN then
        return TDMDB.completed.baie_du_butin or false
    elseif id_faction == CABESTAN then
        return TDMDB.completed.cabestan or false
    elseif id_faction == LONG_GUET then
        return TDMDB.completed.long_guet or false
    elseif id_faction == GADGETZAN then
        return TDMDB.completed.gadgetzan or false
    elseif id_faction == VOILE_SANGLANTE then
        return TDMDB.completed.voile_sanglante or false
    elseif id_faction == RAVENHOLD then
        return TDMDB.completed.ravenhold or false
    elseif id_faction == SHEN_DRALAR then
        return TDMDB.completed.shen_dralar or false
    elseif id_faction == FOIRE_DE_SOMBRELUNE then
        return TDMDB.completed.foire_de_sombrelune or false
    else
        return false
    end
end

function Set_Completed(id_faction)
    if id_faction == BAIE_DU_BUTIN then
        TDMDB.completed.baie_du_butin = true
    elseif id_faction == CABESTAN then
        TDMDB.completed.cabestan = true
    elseif id_faction == LONG_GUET then
        TDMDB.completed.long_gue = true
    elseif id_faction == GADGETZAN then
        TDMDB.completed.gadgetzan = true
    elseif id_faction == VOILE_SANGLANTE then
        TDMDB.completed.voile_sanglante = true
    elseif id_faction == RAVENHOLD then
        TDMDB.completed.ravenhold = true
    elseif id_faction == SHEN_DRALAR then
        TDMDB.completed.shen_dralar = true
    elseif id_faction == FOIRE_DE_SOMBRELUNE then
        TDMDB.completed.foire_de_sombrelune = true
    end
end

function Sum_Item(faction_id, item_number)
    local item = Get_Item(faction_id, item_number)

    if item == nil then
        return -1
    end

    local result = 0
    for i = 1, #item do
        result = result + item[i][2]
    end
    return result
end

function Add_Item(faction_id, item_number, item_quantity)
    local item = Get_Item(faction_id, item_number)
    local found = false
    if item ~= nil and item ~= {}then
        for i = 1, #item do
            if item[i][1] == UnitGUID("player") then
                found = true
                if item[i][2] ~= item_quantity then
                    item[i][2] = item_quantity
                    break
                end
            end
        end
    else
        item = {}
    end
    if not found then
        local new = {UnitGUID("player"), item_quantity}
        item[#item+1] = new
    end
    Set_Item(faction_id,item_number, item)
end

function Set_UI_State(id, state)
    if id > #TDMDB.state then
        TDMDB.state[#TDMDB.state+1] = false
    end
    TDMDB.state[id] = state
end

function Get_UI_State(id)
    if id > #TDMDB.state then
        TDMDB.state[#TDMDB.state+1] = false
    end
    return TDMDB.state[id]
end