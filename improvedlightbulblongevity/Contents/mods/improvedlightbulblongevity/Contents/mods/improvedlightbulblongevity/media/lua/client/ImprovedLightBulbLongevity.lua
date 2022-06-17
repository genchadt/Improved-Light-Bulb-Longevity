require("BulbList.lua")

-- Initialize tables we'll need
if not BulbList then BulbList = {} end
if not BulbsColorList then BulbsColorList = {} end

function SetBulbConditionMax()
  -- Get bulb lists
  BulbsList = Bulbs
  BulbsColorList = BulbsColor

  local param = "ConditionMax"
  local bulbs_condition = SandboxVars.ImprovedLightBulbLongevity.LightBulbs_ConditionMax
  local bulbscolor_condition = SandboxVars.ImprovedLightBulbLongevity.LightBulbsColor_ConditionMax
  local item

  -- If data exists, fix each item's ConditionMax value
  if BulbList ~= nil and bulbscolor_condition ~= nil then
    for k,v in pairs(BulbsList) do
      item = ScriptManager.instance:getItem(v)
      if item ~= nil then
        item:DoParam(param.." = "..bulbs_condition)
        print(v.." MAX BULB CONDITION SET TO: "..bulbs_condition)
      end
    end
  end

  -- Do the same for colored light bulbs
  if BulbsColorList ~= nil and bulbscolor_condition ~= nil then
    for k,v in pairs(BulbsColorList) do
      item = ScriptManager.instance:getItem(v)
      if item ~= nil then
        item:DoParam(param.." = "..bulbscolor_condition)
        print(v.." MAX BULB CONDITION SET TO: "..bulbscolor_condition)
      end
    end
  end
end

Events.OnInitWorld.Add(SetBulbConditionMax)