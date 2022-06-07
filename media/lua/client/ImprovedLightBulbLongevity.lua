require("BulbList.lua")
require("ItemTweak.lua")

function ImprovedLightBulbLongevity.SetBulbConditionMax()
  -- Get desired max condition value from Sandbox option/.ini and BulbList.lua
  local itemID  = BulbIDs.Bulbs {};
  local param  = "ConditionMax";
  local value = SandboxVars.ImprovedLightBulbLongevity.LightBulbConditionMax;

  -- for each pair (bulb), tweak its condition
  for k,v in pairs(itemID) do
    for t,y in pairs(v) do
      TweakItem(v,t,y)
    end
  end

  print("Light Bulb Max Condition: "..value)
end

Events.OnGameBoot.Add(ImprovedLightBulbLongevity.SetBulbConditionMax)