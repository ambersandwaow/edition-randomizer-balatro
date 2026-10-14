local config = BWA.config

local oldsmodscreatecard = SMODS.create_card
function SMODS.create_card(t)
    local ret = oldsmodscreatecard(t)
    if G.GAME.force_random_edition then
        ret.edition = nil
        ret:set_edition(pseudorandom_element(G.P_CENTER_POOLS.Edition).key)
    end
    if G.GAME.force_random_enhancement and ret.ability.set == 'Default' then
        ret:set_ability(pseudorandom_element(G.P_CENTER_POOLS.Enhanced).key)
    end
    if G.GAME.force_random_seal then
        ret:set_seal(pseudorandom_element(G.P_CENTER_POOLS.Seal).key)
    end
    return ret
end

local oldcreatecard = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    local ret = oldcreatecard(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    if G.GAME.force_random_edition then
        ret:set_edition(pseudorandom_element(G.P_CENTER_POOLS.Edition).key, config.silent, config.silent)
    end
    if G.GAME.force_random_enhancement and ret.ability.set == 'Default' then
        ret:set_ability(pseudorandom_element(G.P_CENTER_POOLS.Enhanced).key)
    end
    if G.GAME.force_random_seal then
        ret:set_seal(pseudorandom_element(G.P_CENTER_POOLS.Seal).key, config.silent, config.silent)
    end
    return ret
end

local oldcopycard = copy_card
function copy_card(other, new_card, card_scale, playing_card, strip_edition)
    local ret
    if G.GAME.force_random_edition then
        ret = oldcopycard(other, new_card, card_scale, playing_card, true)
        ret:set_edition(pseudorandom_element(G.P_CENTER_POOLS.Edition).key, true, true)
    else
        ret = oldcopycard(other, new_card, card_scale, playing_card, strip_edition)
    end
    if G.GAME.force_random_enhancement and other.ability.set == 'Default' then
        ret:set_ability(pseudorandom_element(G.P_CENTER_POOLS.Enhancement).key)
    end
    if G.GAME.force_random_seal then
        ret:set_seal(pseudorandom_element(G.P_CENTER_POOLS.Seal).key, true, true)
    end
    return ret
end

local oldcreateplayingcard = create_playing_card
function create_playing_card(card_init, area, skip_materialize, silent, colours, skip_emplace)
    local ret = oldcreateplayingcard(card_init, area, skip_materialize, silent, colours, skip_emplace)
    if G.GAME.force_random_edition and not ret.edition then
        ret:set_edition(pseudorandom_element(G.P_CENTER_POOLS.Edition).key, config.silent, config.silent)
    end
    if G.GAME.force_random_enhancement and not SMODS.get_enhancements(ret) then
        ret:set_ability(pseudorandom_element(G.P_CENTER_POOLS.Enhanced).key)
    end
    if G.GAME.force_random_seal then
        ret:set_seal(pseudorandom_element(G.P_CENTER_POOLS.Seal).key, config.silent, config.silent)
    end
    return ret
end

local oldbackapplytorun = Back.apply_to_run
function Back:apply_to_run(...)
    local ret = oldbackapplytorun(self)
    BWA.enhancement()
    BWA.edition()
    BWA.seal()
    return ret
end