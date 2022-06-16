require("BulbList")

if getActivatedMods():contains("GCT_API") then
  require("ItemTweak")
end

function SetBulbConditionMax()
  -- Get desired max condition value from Sandbox option/.ini and BulbList.lua
  local itemID = Bulbs
  local param = "ConditionMax"
  local value = SandboxVars.ImprovedLightBulbLongevity.LightBulbConditionMax

  -- Make sure the data exists, for each pair in table (itemID), tweak its condition
  if itemID ~= nil and value ~= nil then
    for k,v in pairs(itemID) do
      TweakItem(k, param, value)
    end
  end
  print("Light Bulb Max Condition: "..value)
end

Events.OnGameBoot.Add(SetBulbConditionMax)