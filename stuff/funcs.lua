local config = BWA.config

function BWA.edition()
    if config.edition or G.GAME.selected_back.name == 'random_edition' then
        G.GAME.force_random_edition = true
        G.E_MANAGER:add_event(Event{
            delay = 2,
            blocking = false,
            func = function()
                for _,v in pairs(G.playing_cards) do
                    v:set_edition(pseudorandom_element(G.P_CENTER_POOLS.Edition).key, config.silent, config.silent)
                end
                for _,v in pairs(G.P_CENTER_POOLS.Edition) do
                    v.extra_cost = 0
                end
                return true
            end
        })
    else
        G.GAME.force_random_edition = false
    end
end

function BWA.enhancement()
    if config.enhancement or G.GAME.selected_back.name == 'random_enhancement' then
        G.GAME.force_random_enhancement = true
        G.E_MANAGER:add_event(Event{
            delay = 2,
            blocking = false,
            func = function()
                for _,v in pairs(G.playing_cards) do
                    v:set_ability(pseudorandom_element(G.P_CENTER_POOLS.Enhanced).key)
                end
                return true
            end
        })
    else
        G.GAME.force_random_enhancement = false
    end
end

function BWA.seal()
    if config.seal or G.GAME.selected_back.name == 'random_seal' then
        G.GAME.force_random_seal = true
        G.E_MANAGER:add_event(Event{
            delay = 2,
            blocking = false,
            func = function()
                for _,v in pairs(G.playing_cards) do
                    v:set_seal(pseudorandom_element(G.P_CENTER_POOLS.Seal).key, config.silent, config.silent)
                end
                return true
            end
        })
    else
        G.GAME.force_random_seal = false
    end
end

function BWA.get_shader()
    local tim = math.sin(G.TIMERS.REAL / 50)
    if tim <= 0.5 then
        if tim <= 0.25 then
            return 'negative'
        else
            return 'polychrome'
        end
    else
        if tim >= 0.75 then
            return 'holo'
        else
            return 'foil'
        end
    end
end