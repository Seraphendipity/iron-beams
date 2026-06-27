local replaced_item = "iron-stick"
local replacer_item = "iron-beam"
if mods["Krastorio2"] then
    replacer_item = "kr-iron-beam"
end
local multiplier = 2 -- How much the recipe is adjusted



for _, recipe in pairs(data.raw.recipe) do  -- Looping all recipes
    if recipe.ingredients then  -- If recipe has ingredients at all...
        for i, ingredient in pairs(recipe.ingredients) do -- Loop ingredients, searching for ingredient by name.
            if ingredient.name == replaced_item then -- Recipe with replaced_item present
                log("Found iron-stick in recipe: " .. ingredient.name)
                for j, jingredient in pairs(recipe.ingredients) do -- Check if replacer_item exists in recipe already
                    log("--Double Loop: " .. ingredient.name .. ", J:" .. jingredient.name)
                    if jingredient.name == replacer_item then
                        log("----Found Duplicate: " .. ingredient.name)
                        jingredient.amount = jingredient.amount + math.ceil(ingredient.amount/multiplier)
                        table.remove(recipe.ingredients, i)
                    else
                        log("----Did not find duplicate, before name: " .. ingredient.name)
                        log("----Did not find duplicate, before amount: " .. ingredient.amount)
                        ingredient.name = replacer_item
                        ingredient.amount = math.ceil(ingredient.amount/multiplier) 
                        log("----Did not find duplicate, after name: " .. ingredient.name)
                        log("----Did not find duplicate, after amount: " .. ingredient.amount)
                    end
                end
            end
        end
    end
end
data.raw.item[replaced_item].hidden = true
data.raw.recipe[replaced_item].hidden = true
data.raw.item[replaced_item].enabled = false
if mods["Krastorio2"] then
    data.raw.recipe["kr-iron-stick-from-iron-ore"].hidden = true
    data.raw.recipe["kr-iron-stick-from-enriched-iron"].hidden = true
    for i, ingredient in pairs(data.raw.recipe["medium-electric-pole"].ingredients) do
        if ingredient == "kr-iron-beam" then
            data.raw.recipe["medium-electric-pole"].ingredients[i].amount = 2
        end
    end
end



