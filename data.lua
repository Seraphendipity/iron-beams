if not mods["Krastorio2"] then
	data:extend({
		{
			type = "item",
			name = "iron-beam",
			icon = "__iron-beams__/graphics/icons/iron-beam.png",
			subgroup = "intermediate-product",
			order = "b[iron-beam]",
			stack_size = 100
		},
		{
			type = "recipe",
			name = "iron-beam",
			enabled = true,
			ingredients = {
				{type="item", name="iron-plate", amount=2}
			},
			results = {
				{type="item", name="iron-beam", amount=1}
			}
		}
	})
end