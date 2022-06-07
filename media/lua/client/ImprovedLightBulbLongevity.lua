require("BulbList.lua")
require("ItemTweak.lua")

function ImprovedLightBulbLongevity.SetBulbConditionMax()
  -- Get desired max condition value from Sandbox option/.ini and BulbList.lua
  local itemID  = Bulbs {};
  local param  = "ConditionMax";
  local value = SandboxVars.ImprovedLightBulbLongevity.LightBulbConditionMax;

  -- make sure the data exists, for each pair in table (itemID), tweak its condition
  if itemID ~= nil then
    for k,v in pairs(itemID) do
      TweakItem(v, param, value)
    end
  end
  print("Light Bulb Max Condition: "..value)
end

Events.OnGameBoot.Add(ImprovedLightBulbLongevity.SetBulbConditionMax)