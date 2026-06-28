display_message_level = 1

--- 
--- @param ingredient_original string
--- @param ingredient_replacement string
function replace_item_all_recipes(ingredient_original, ingredient_replacement, amount_multiplier)
    for _, recipe in pairs(data.raw.recipe) do  -- Looping all recipes
        local ingredient_index = match_ingredient_index(recipe, ingredient_original)
        local duplicate_index = match_ingredient_index(recipe, ingredient_replacement)
        if ingredient_index then
            local replacement_amount = get_ingredient_amount_multiplied(recipe, ingredient_index, amount_multiplier) 
            if ingredient_index and duplicate_index then
                logger(1, "Duplicate Replacing: " .. recipe.name)
                increment_ingredient_amount(recipe, duplicate_index, replacement_amount)
                remove_ingredient(recipe, ingredient_index)
            else
                logger(1, "Replacing:  " .. recipe.name)
                replace_ingredient(recipe, ingredient_index, ingredient_replacement, replacement_amount)
            end
        end
    end
end

--- Checks if ingredient_original is in given recipe.
--- @param recipe data.RecipeID
--- @param ingredient data.FluidID|data,ItemID
function match_ingredient_index(recipe, ingredient_name)
    if not recipe.ingredients then  -- If recipe has ingredients at all...
        logger(1, "Recipe does not have ingredients:" .. recipe.name)    
        return nil
    end

    for i, ingredient in pairs(recipe.ingredients) do -- Loop ingredients, searching for ingredient by name.
        if ingredient.name == ingredient_name then -- Recipe with replaced_item present
            logger(1, "Found: " .. ingredient.name)
            return i
        end
    end
end

function get_ingredient_amount_multiplied(recipe, ingredient_index, multiplier)
    return math.ceil(recipe.ingredients[ingredient_index].amount * multiplier)
end

function increment_ingredient_amount(recipe, ingredient_index, increment)
    recipe.ingredients[ingredient_index].amount = recipe.ingredients[ingredient_index].amount + increment
end

function remove_ingredient(recipe, ingredient_index)
    table.remove(recipe.ingredients, ingredient_index)
end

function replace_ingredient(recipe, ingredient_original_index, ingredient_replacement, ingredient_replacement_amount)
    recipe.ingredients[ingredient_original_index].name = ingredient_replacement 
    recipe.ingredients[ingredient_original_index].amount = ingredient_replacement_amount
end

--- @param message_level integer
--- @param message string
function logger (message_level, message)
    if message_level > display_message_level then
        log(message)
    end
end


-- Actual Processing

local replaced_item = "iron-stick"
local replacer_item = "iron-beam"
if mods["Krastorio2"] then
    replacer_item = "kr-iron-beam"
end
replace_item_all_recipes(replaced_item, replacer_item, 0.25)

data.raw.item[replaced_item].hidden = true
data.raw.recipe[replaced_item].hidden = true
data.raw.item[replaced_item].enabled = false
if mods["Krastorio2"] then
    data.raw.recipe["kr-iron-stick-from-iron-ore"].hidden = true
    data.raw.recipe["kr-iron-stick-from-enriched-iron"].hidden = true
    for i, ingredient in pairs(data.raw.recipe["medium-electric-pole"].ingredients) do
        if ingredient.name == "kr-iron-beam" then
            data.raw.recipe["medium-electric-pole"].ingredients[i].amount = 2
        end
    end
end



