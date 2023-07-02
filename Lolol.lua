local Library = 
loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window_1 = Library:NewWindow("Deflect🙅")

local Tab1 = Window_1:NewSection("Main")

--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- getgenv().Toggle = true
getgenv().BallDirection = Vector3.new(999999, 999999, 999999)

local plr = game.Players.LocalPlayer
local ball = nil

function getBall()
while true do 
    if workspace:FindFirstChild("Ball") ~= nil then
       ball = workspace.Ball
    end
  end
end

task.spawn(getBall)

Tab1:CreateToggle("Auto Deflect", function(value)
_G.Y = value
while wait() do
      if _G.Y == false then break end
    game:GetService("RunService").Stepped:Wait()
     if (ball and ball:FindFirstChild("Main") and plr.Character ~= nil) then
        local distance = plr:DistanceFromCharacter(ball.Main.Position)
	plr.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.lookAt(plr.Character.HumanoidRootPart.Position, Vector3.new(ball.Main.Position.X, plr.Character.HumanoidRootPart.Position.Y, ball.Main.Position.Z))
          if (distance <= 17.8) then
            plr.Character:WaitForChild("Deflection").Remote:FireServer("Deflect", BallDirection)
          end
       end
    end
end)
--[[
Tab1:CreateToggle("Aimbot", function(value)
_G.Aimbot = value
    while wait() do
      if _G.Aimbot == false then break end
         plr.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.lookAt(plr.Character.HumanoidRootPart.Position, Vector3.new(ball.Main.Position.X, plr.Character.HumanoidRootPart.Position.Y, ball.Main.Position.Z))
    end
end)
]]
