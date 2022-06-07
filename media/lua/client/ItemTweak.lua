-- Code inspired by DarkSlayerEX's Item Tweaker API mod. It's a series of FOR IN loops
-- and his implementation helped me to better understand how they work

if not ItemTweak then ItemTweak = {} end
if not TweakItem then TweakItem = {} end
if not TweakItemValues then TweakItemValues = {} end

function ItemTweak.tweakItems()
    local item;
    -- for each key and value in the table TweakItemValues, do this
    for k,v in pairs(TweakItemValues) do
        -- for each key and value in the table
        for t,y in pairs(v) do
            item = ScriptManager.Instance:getItem();
            if item ~= nil then
                item.DoParam(t.." = "..y);
            end
        end
    end
end

-- Accept an item's name, property to be edited, and the desired value
-- Then, pass it into the TweakItemValues table
function TweakItem(itemName, itemProperty, propertyValue)
    if not TweakItemValues[itemName] then
        TweakItemValues[itemName] = {};
    end
end

Events.OnGameBoot.Add(ItemTweak.tweakItems)