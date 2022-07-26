require("BulbList.lua")

function SetBulbConditionMax()
  if not BulbsList then BulbsList = {} end

  BulbsList[Bulbs] = SandboxVars.ImprovedLightBulbLongevity.LightBulbs_ConditionMax
  BulbsList[BulbsColor] = SandboxVars.ImprovedLightBulbLongevity.LightBulbsColor_ConditionMax

  local parameterSet = "ConditionMax"

  if BulbsList ~= nil then
    for k,v in pairs(BulbsList) do
      for t,y in pairs(k) do
        local item = ScriptManager.instance:getItem(y)
        item:DoParam(parameterSet.." = "..v)
        print(y.." BULB MAX CONDITION SET TO: "..v)
      end
    end
  end
end

Events.OnInitWorld.Add(SetBulbConditionMax)