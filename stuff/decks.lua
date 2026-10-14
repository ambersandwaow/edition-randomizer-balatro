SMODS.Atlas{
    key = 'decks',
    path = 'decks.png',
    px = 71,
    py = 95,
}

SMODS.Back{
    key = 'edition',
    name = 'random_edition',
    discovered = true,
    pos = {x = 5, y = 2},
    loc_txt = {
        name = 'Random Edition Deck',
        text = {
            'Sets most cards to have',
            'a {C:green,E:1}random{} edition'
        }
    }
}
SMODS.Back{
    atlas = 'decks',
    discovered = true,
    key = 'enhancement',
    name = 'random_enhancement',
    pos = {x = 0, y = 0},
    loc_txt = {
        name = 'Random Enhancement Deck',
        text = {
            'Sets playing cards to have',
            'a {C:green,E:1}random{} enhancement'
        }
    }
}
SMODS.Back{
    key = 'random_seal',
    name = 'seal',
    atlas = 'decks',
    discovered = true,
    pos = {x = 1, y = 0},
    loc_txt = {
        name = 'Random Seal Deck',
        text = {
            'Sets most cards to have',
            'a {C:green,E:1}random{} seal'
        }
    }
}