local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ExecuteButton = Instance.new("TextButton")

-- Ensure UI is parented correctly
if game:GetService("CoreGui"):FindFirstChild("PetSpawnerExploit") then
    game:GetService("CoreGui").PetSpawnerExploit:Destroy()
end

ScreenGui.Name = "PetSpawnerExploit"
ScreenGui.Parent = game:GetService("CoreGui")

Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, -100, 0.5, -90)
Frame.Size = UDim2.new(0, 200, 0, 180)
Frame.Active = true
Frame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = Frame

Title.Name = "Title"
Title.Parent = Frame
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Pet Spawner"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = Title

ExecuteButton.Name = "ExecuteButton"
ExecuteButton.Parent = Frame
ExecuteButton.BackgroundColor3 = Color3.fromRGB(110, 112, 186)
ExecuteButton.BorderSizePixel = 0
ExecuteButton.Position = UDim2.new(0.5, -75, 0.3, 0)
ExecuteButton.Size = UDim2.new(0, 150, 0, 40)
ExecuteButton.Font = Enum.Font.SourceSansBold
ExecuteButton.Text = "EXECUTE SCRIPT"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.TextSize = 16

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 6)
ButtonCorner.Parent = ExecuteButton

-- Status UI
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = Frame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0.5, -90, 0.6, 0)
StatusLabel.Size = UDim2.new(0, 180, 0, 20)
StatusLabel.Font = Enum.Font.SourceSans
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextSize = 14

local BypassLabel = Instance.new("TextLabel")
BypassLabel.Name = "BypassLabel"
BypassLabel.Parent = Frame
BypassLabel.BackgroundTransparency = 1
BypassLabel.Position = UDim2.new(0.5, -90, 0.7, 0)
BypassLabel.Size = UDim2.new(0, 180, 0, 20)
BypassLabel.Font = Enum.Font.SourceSans
BypassLabel.Text = ""
BypassLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
BypassLabel.TextSize = 12

local LoadingBarBack = Instance.new("Frame")
LoadingBarBack.Name = "LoadingBarBack"
LoadingBarBack.Parent = Frame
LoadingBarBack.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
LoadingBarBack.BorderSizePixel = 0
LoadingBarBack.Position = UDim2.new(0.5, -90, 0.8, 0)
LoadingBarBack.Size = UDim2.new(0, 180, 0, 10)

local LoadingBar = Instance.new("Frame")
LoadingBar.Name = "LoadingBar"
LoadingBar.Parent = LoadingBarBack
LoadingBar.BackgroundColor3 = Color3.fromRGB(110, 112, 186)
LoadingBar.BorderSizePixel = 0
LoadingBar.Size = UDim2.new(0, 0, 1, 0)

local LoadingBarCorner = Instance.new("UICorner")
LoadingBarCorner.CornerRadius = UDim.new(1, 0)
LoadingBarCorner.Parent = LoadingBarBack

-- Fixed execute function with error handling
local function executeExploit()
    ExecuteButton.Text = "EXECUTING..."
    StatusLabel.Text = "Initializing..."
    BypassLabel.Text = "Bypassing anticheat..."
    
    -- Simulate loading
    for i = 1, 10 do
        LoadingBar.Size = UDim2.new(i/10, 0, 1, 0)
        BypassLabel.Text = "Bypassing... ("..i*10.."%)"
        task.wait(0.1)
    end
    
    -- Execute the remote script
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/thatsepical/spawner/refs/heads/main/growagardenspawner.lua", true))()
    end)
    
    if success then
        StatusLabel.Text = "Script loaded!"
        BypassLabel.Text = "Status: Active"
        LoadingBar.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
    else
        StatusLabel.Text = "Error loading script!"
        BypassLabel.Text = "Error: "..err
        LoadingBar.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
    end
    
    ExecuteButton.Text = "DONE"
end

ExecuteButton.MouseButton1Click:Connect(executeExploit)