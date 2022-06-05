require("BulbList.lua")

function ImprovedLightBulbLongevity.SetBulbConditionMax()

  local option = SandboxVars.ImprovedLightBulbLongevity.LightBulbConditionMax -- Get value from SandboxVars

  local item = ScriptManager.instance:getItem(bulb) -- Load the bulb

  -- Set the max condition parameter here
  if item then
    item:DoParam("ConditionMax = "..option)
  end

  print("Light Bulb Max Condition: "..option)
end

Events.OnInitWorld.Add(ILL.SetBulbConditionMax)