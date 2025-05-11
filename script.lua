-- script
local TpTool
local Players = game:GetService("Players")
local IYMouse = Players.LocalPlayer:GetMouse()
local Prr = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local charr = game:GetService("Players").LocalPlayer.Character
local bolet = charr:FindFirstChildOfClass("Humanoid")
local Noclipping = nil
local toggleNoclip = false
local Clip
local function randomString()
    local length = math.random(17,45)
    local array = {}
    for i = 1, length do
        array[i] = string.char(math.random(32, 126))
    end
    return table.concat(array)
end

--// others + gui //
toggleNoclip = false
good = true
Noclipping = nil
local boolean2
local q_s = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
local charr = game:GetService("Players").LocalPlayer.Character
local RunService = game:GetService("RunService")
local bolet = charr:FindFirstChildOfClass("Humanoid")
local Prr = game:GetService("Players").LocalPlayer

--[[Invisibility Toggle
Você pode encontrar o conceito original aqui: 
https://v3rmillion.net/showthread.php?tid=544634
Este método clona o personagem localmente,
teletransporta o personagem real para um local seguro e, 
em seguida, define o personagem
]]
--Settings:
local LP = Players.LocalPlayer
local ScriptStarted = false
local Keybind = "E"
local Transparency = true
local NoClip = false
local Player = game:GetService("Players").LocalPlayer
local RealCharacter = Player.Character or Player.CharacterAdded:Wait()
local IsInvisible = false
RealCharacter.Archivable = true
local FakeCharacter = RealCharacter:Clone()
local Part
Part = Instance.new("Part", workspace)
Part.Anchored = true
Part.Size = Vector3.new(200, 1, 200)
Part.CFrame = CFrame.new(0, -500, 0)
Part.CanCollide = true
FakeCharacter.Parent = workspace
FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
for i, v in pairs(RealCharacter:GetChildren()) do
  if v:IsA("LocalScript") then
      local clone = v:Clone()
      clone.Disabled = true
      clone.Parent = FakeCharacter
  end
end
if Transparency then
  for i, v in pairs(FakeCharacter:GetDescendants()) do
      if v:IsA("BasePart") then
          v.Transparency = 0.9
      end
  end
end
local CanInvis = true
function RealCharacterDied()
    local Players = game:GetService("Players")
    local speaker = Players.LocalPlayer
  CanInvis = false
  RealCharacter:Destroy()
  RealCharacter = Player.Character
  CanInvis = true
  isinvisible = false
  FakeCharacter:Destroy()
  workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
  RealCharacter.Archivable = true
  FakeCharacter = RealCharacter:Clone()
  Part:Destroy()
  Part = Instance.new("Part", workspace)
  Part.Anchored = true
  Part.Size = Vector3.new(200, 1, 200)
  Part.CFrame = CFrame.new(9999, 9999, 9999)
  Part.CanCollide = true
  FakeCharacter.Parent = workspace
  FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
  for i, v in pairs(RealCharacter:GetChildren()) do
      if v:IsA("LocalScript") then
          local clone = v:Clone()
          clone.Disabled = true
          clone.Parent = FakeCharacter
      end
  end
  if Transparency then
      for i, v in pairs(FakeCharacter:GetDescendants()) do
          if v:IsA("BasePart") then
              v.Transparency = 0.7
          end
      end
  end
 RealCharacter.Humanoid.Died:Connect(function()
 RealCharacter:Destroy()
 FakeCharacter:Destroy()
 end)
 Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
end
RealCharacter.Humanoid.Died:Connect(function()
 RealCharacter:Destroy()
 FakeCharacter:Destroy()
 end)
Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
local PseudoAnchor
game:GetService "RunService".RenderStepped:Connect(
  function()
      if PseudoAnchor ~= nil then
          PseudoAnchor.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
      end
       if NoClip then
      FakeCharacter.Humanoid:ChangeState(11)
       end
  end
)
PseudoAnchor = FakeCharacter.HumanoidRootPart
local function Invisible()
    local Players = game:GetService("Players")
    local speaker = Players.LocalPlayer
  if IsInvisible == false then
      StoredCF = RealCharacter.HumanoidRootPart.CFrame
      RealCharacter.HumanoidRootPart.CFrame = FakeCharacter.HumanoidRootPart.CFrame
      for i = 1,5 do FakeCharacter.HumanoidRootPart.CFrame = StoredCF end
      RealCharacter.Humanoid:UnequipTools()
      Player.Character = FakeCharacter
      workspace.CurrentCamera.CameraSubject = FakeCharacter.Humanoid
      PseudoAnchor = RealCharacter.HumanoidRootPart
      for i, v in pairs(FakeCharacter:GetChildren()) do
          if v:IsA("LocalScript") then
              v.Disabled = false
          end
      end
      IsInvisible = true
  else
      StoredCF = FakeCharacter.HumanoidRootPart.CFrame
      FakeCharacter.HumanoidRootPart.CFrame = RealCharacter.HumanoidRootPart.CFrame
      for i = 1,5 do RealCharacter.HumanoidRootPart.CFrame = StoredCF end
      FakeCharacter.Humanoid:UnequipTools()
      Player.Character = RealCharacter
      workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
      PseudoAnchor = FakeCharacter.HumanoidRootPart
      for i, v in pairs(FakeCharacter:GetChildren()) do
          if v:IsA("LocalScript") then
              v.Disabled = true
          end
      end
      IsInvisible = false
  end
end
-- GUI + Input keybind
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.E then
        if botao and botao:IsA("TextButton") then
            botao:Activate()
        end
    end
end)
-- The rest of your GUI/button handling code goes here...
-- (Leave it exactly as you pasted before, no need to repeat unless you want edits there)
