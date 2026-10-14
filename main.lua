BWA = SMODS.current_mod
local config = BWA.config

local folder = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "stuff")
for _, file in ipairs(folder) do
    assert(SMODS.load_file("stuff/" .. file))()
end

BWA.config_tab = function()
    return{
        n = G.UIT.ROOT, config = {r = 0.1, minw = 8, minh = 6, align = "tm", padding = 0.2, colour = G.C.BLACK, emboss = 0.1}, nodes = {
            {n = G.UIT.R, config = {padding = 0}, nodes = {
                {n = G.UIT.C, config = {align = "cm"}, nodes = {
                    {n = G.UIT.R,  config = {align = "cm", padding = 0.01},  nodes = {
                        create_toggle({
                            label = 'Make all application sounds silent',
                            ref_table = config,
                            ref_value = 'silent'
                        }),
                        create_toggle({
                            label = 'Enable random editions on all decks',
                            ref_table = config,
                            ref_value = 'edition'
                        }),
                        create_toggle({
                            label = 'Enable random enhancements on all decks',
                            ref_table = config,
                            ref_value = 'enhancement'
                        }),
                        create_toggle({
                            label = 'Enable random seals on all decks',
                            ref_table = config,
                            ref_value = 'seal'
                        }),
                    }},
                }}
            }}
        }
    }
end