--this was taken and heavily modified from cryptid
SMODS.DrawStep{
    order = 5,
    key = 'deck_shader',
    conditions = {vortex = false, facing = 'back'},
    func = function(card)
		if card.params.sleeve_card or card.ability.set == "Sleeve" then
			return
		end
		local back = (card.ability.set == "Back" and card.config.center)
			or (card.params.viewed_back == true and G.GAME.viewed_back and G.GAME.viewed_back.effect.center)
			or (card.playing_card and G.GAME.selected_back_key)
		if back and back.key == 'b_bwaaa_edition' then
			card.children.back:draw_shader(BWA.get_shader(), nil, card.ARGS.send_to_shader, true)
		end
    end
}