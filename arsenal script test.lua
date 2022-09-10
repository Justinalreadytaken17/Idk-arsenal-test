local FOVCircle = Drawing.new("Circle")

FOVCircle.Position = Vector2(950, 500, 500)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Arsenal", "DarkTheme")

-- Tabs

local Combat = Window:NewTab("Combat")

local FOV = Combat:NewSection("FOV Circle")

local Visuals = Window:NewTab("Visuals")

local ESP = Visuals:NewSection("ESP")

-- Combat

local FOV_On_Off = FOV:NewToggle("FOV", "", function(toggled) 

    if toggled then

FOVCircle.Visible = true

    else

FOVCircle.Visible = false

    end

end)

local FOV_Thickness = FOV:NewSlider("Thickness", "", 100, 0, function(thickness)

FOVCircle.Thickness = thickness

 end)

 

local FOV_NumSlides = FOV:NewSlider("NumSlides", "", 500, 0, function(numslides)

FOVCircle.NumSlides = numslides

end)

local FOV_Filled = FOV:NewToggle("Filled", "", function(filled)

if filled then

FOVCircle.Filled = true

else

FOVCircle.Filled = false

end

end)

local FOV_Transparecy = FOV:NewSlider("Transparency", "", 1.0, 0.0, function(transparency)

FOVCircle.Transparecy = Transparecy

end)

local FOV_Radius = FOV:NewSlider("Radius", "", 500, 0, function(Radius)

FOVCircle.Radius = Radius

end)

local FOV_Color = FOV:NewColorPicker("FOV Color Picker", "", Color3.fromRGB(0,0,0), function(colour)

FOVCircle.Color = colour

end)

-- Visuals

local ESP_On_Off = ESP:NewToggle("ESP", "", function(toggled)

if toggled then

local lplr = game.Players.LocalPlayer

local camera = game:GetService("Workspace").CurrentCamera

local CurrentCamera = workspace.CurrentCamera

local worldToViewportPoint = CurrentCamera.worldToViewportPoint

local HeadOff = Vector3.new(0, 0.5, 0)

local LegOff = Vector3.new(0,3,0)

for i,v in pairs(game.Players:GetChildren()) do

    local BoxOutline = Drawing.new("Square")

    BoxOutline.Visible = false

    BoxOutline.Color = Color3.new(0,0,0)

    BoxOutline.Thickness = 3

    BoxOutline.Transparency = 1

    BoxOutline.Filled = false

    local Box = Drawing.new("Square")

    Box.Visible = false

    Box.Color = Color3.new(1,1,1)

    Box.Thickness = 1

    Box.Transparency = 1

    Box.Filled = false

    function boxesp()

        game:GetService("RunService").RenderStepped:Connect(function()

            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then

                local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                local RootPart = v.Character.HumanoidRootPart

                local Head = v.Character.Head

                local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)

                local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)

                local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)

                if onScreen then

                    BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)

                    BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)

                    BoxOutline.Visible = true

                    Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)

                    Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)

                    Box.Visible = true

                    if v.TeamColor == lplr.TeamColor then

                        BoxOutline.Visible = false

                        Box.Visible = false

                    else

                        BoxOutline.Visible = true

                        Box.Visible = true

                    end

                else

                    BoxOutline.Visible = false

                    Box.Visible = false

                end

            else

                BoxOutline.Visible = false

                Box.Visible = false

            end

        end)

    end

    coroutine.wrap(boxesp)()

end

game.Players.PlayerAdded:Connect(function(v)

    local BoxOutline = Drawing.new("Square")

    BoxOutline.Visible = false

    BoxOutline.Color = Color3.new(0,0,0)

    BoxOutline.Thickness = 3

    BoxOutline.Transparency = 1

    BoxOutline.Filled = false

    local Box = Drawing.new("Square")

    Box.Visible = false

    Box.Color = Color3.new(1,1,1)

    Box.Thickness = 1

    Box.Transparency = 1

    Box.Filled = false

    function boxesp()

        game:GetService("RunService").RenderStepped:Connect(function()

            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then

                local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                local RootPart = v.Character.HumanoidRootPart

                local Head = v.Character.Head

                local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)

                local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)

                local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)

                if onScreen then

                    BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)

                    BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)

                    BoxOutline.Visible = true

                    Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)

                    Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)

                    Box.Visible = true

                    if v.TeamColor == lplr.TeamColor then

                        BoxOutline.Visible = false

                        Box.Visible = false

                    else

                        BoxOutline.Visible = true

                        Box.Visible = true

                    end

                else

                    BoxOutline.Visible = false

                    Box.Visible = false

                end

            else

                BoxOutline.Visible = false

                Box.Visible = false

            end

        end)

    end

    coroutine.wrap(boxesp)()

end)




end

end)
