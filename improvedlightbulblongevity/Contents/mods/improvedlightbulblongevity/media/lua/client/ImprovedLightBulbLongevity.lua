require("BulbList.lua")

function SetBulbConditionMax()
  -- Get bulb lists
  if not BulbsList then BulbsList = Bulbs end
  if not BulbsColorList then BulbsColorList = BulbsColor end

  local param = "ConditionMax"
  local bulbs_condition = SandboxVars.ImprovedLightBulbLongevity.LightBulbs_ConditionMax
  local bulbscolor_condition = SandboxVars.ImprovedLightBulbLongevity.LightBulbsColor_ConditionMax
  local item

  -- If data exists and bulb condition isn't default or nil, fix each item's ConditionMax value
  if BulbsList ~= nil and (bulbs_condition ~= nil and bulbs_condition ~= 100) then
    for k,v in pairs(BulbsList) do
      item = ScriptManager.instance:getItem(v)
      if item ~= nil then
        item:DoParam(param.." = "..bulbs_condition)
        print(v.." MAX BULB CONDITION SET TO: "..bulbs_condition)
      end
    end
  end

  -- Do the same for colored light bulbs
  if BulbsColorList ~= nil and (bulbscolor_condition ~= nil and bulbscolor_condition ~= 10) then
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