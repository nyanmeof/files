local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
--
local Player = Players.LocalPlayer
local ConfigFolder = "Nyan"
local ConfigFile = ConfigFolder .. "/" .. Player.Name .. ".json"

if Player.Name == 'Namnam2908' then
getgenv().Premium = true
end

if not isfolder(ConfigFolder) then
    makefolder(ConfigFolder)
end

if isfile(ConfigFile) then
    local Data = HttpService:JSONDecode(readfile(ConfigFile))
    for i,v in pairs(Data) do
        getgenv()[i] = v
    end
end

local function SaveConfig()
    local Data = {}

    for i,v in pairs(getgenv()) do
        if typeof(v) ~= "function" then
            Data[i] = v
        end
    end

    writefile(ConfigFile, HttpService:JSONEncode(Data))
end


local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Title = "Nyan" .. (getgenv().Premium and " [Premium]" or "")
local SubTitle = "discord.gg/E8ejhDJyF8"

local Window = Fluent:CreateWindow({
    Title = Title,
    SubTitle = SubTitle,
    TabWidth = 160,
    Size = UDim2.fromOffset(480, 360),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local UiOrders
if getgenv().OneClickUi then
    UiOrders = {"Status","Setting","Game-Server","One Click"}
else
    UiOrders = {"Main","Status","Local Player","Travel","Shop","Setting","Game-Server"}
end

local Tabs = {}

for _,TabName in pairs(UiOrders) do
    Tabs[TabName] = Window:AddTab({
        Title = TabName,
        Icon = ""
    })
end

-- game server 
Tabs["Game-Server"]:AddToggle("Disable3DRender", {
    Title = "Disable 3D Render",
    Description = "",
    Default = getgenv().WhiteScreen or false,
    Callback = function(state)
        if state then
        game:GetService("RunService"):Set3dRenderingEnabled(false)
        else
        game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
    end
})
-- anti afk
for _, v in pairs((getconnections or get_signal_cons)(game.Players.LocalPlayer.Idled)) do
    if v.Disable then
        v:Disable()
    elseif v.Disconnect then
        v:Disconnect()
    end
end
print('36')
local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.RightControl then
        Window:Minimize()
    end
end)

if game.CoreGui:FindFirstChild("jojo") then
    game.CoreGui.jojo:Destroy()
end

local g = Instance.new("ScreenGui")
g.Name = "jojo"
g.ResetOnSpawn = false
g.DisplayOrder = 999999
g.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
g.Parent = game.CoreGui

local b = Instance.new("ImageButton")
b.Parent = g
b.Size = UDim2.new(0,30,0,30)
b.Position = UDim2.new(0,20,0.5,0)
b.BackgroundTransparency = 1
b.Image = "rbxassetid://72077909883412"
b.ZIndex = 999

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(1,0)
corner.Parent = b

b.MouseButton1Click:Connect(function()
    Window:Minimize()
end)
