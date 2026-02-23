local WazureV1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/nyanmeof/files/refs/heads/main/fan_anh_vinhuchi.lua?raw=true"))()

local Notify = WazureV1:Notify({
    ["Title"] = "Alert",
    ["Content"] = "Loaded UI!",
    ["Logo"] = "rbxassetid://18271082015",
    ["Time"] = 0.5,
    ["Delay"] = 5
})

local WazureGui = WazureV1:Start({
    ["Name"] = "Sang",
    ["Logo Player"] = getgenv().uid and ("rbxassetid://" .. getgenv().uid) or "rbxassetid://89520197652800",
    ["Name Player"] = getgenv().name or "username",
    ["Tab Width"] = 120,
    ["Color"] = Color3.fromRGB(6, 141, 234),
    ["Custom Toggle"] = false,

    ["CloseCallBack"] = function()
        WazureV1:Notify({
            ["Title"] = "Sang",
            ["Content"] = "Closed UI!",
            ["Logo"] = "rbxassetid://18271082015",
            ["Time"] = 0.5,
            ["Delay"] = 5
        })
    end
})

local MainTab = WazureGui:MakeTab("Main")
local SubFarmTab = WazureGui:MakeTab("Sub Farming")

local Seperator = MainTab:MakeSeperator("Main")
local Label = MainTab:MakeLabel("This is a label")

local Button = MainTab:MakeButton("Button", {
    ["Title"] = "Button",
    ["Content"] = "This is a button",
    ["Logo"] = "rbxassetid://18271082015",
    ["Callback"] = function()
        print("Button Clicked!")
    end
})

local TextInput = MainTab:MakeTextInput("Text Input", {
    ["Title"] = "Webhook",
    ["Content"] = "Enter your webhook here",
    ["Callback"] = function(Value)
        print(Value)
    end
})

local Toggle = MainTab:MakeToggle("Toggle", {
    ["Title"] = "Toggle",
    ["Content"] = "This is a Toggle",
    ["Default"] = false,
    ["Callback"] = function(Value)
        print(Value)
    end
})

local ToggleSetting = Toggle:AddSetting()

local SettingToggle = ToggleSetting:Toggle("Setting Toggle", {
    ["Name"] = "Toggle",
    ["Default"] = false,
    ["Callback"] = function(Value)
        print(Value)
    end
})

local SliderSetting = ToggleSetting:Slider("Setting Slider", {
    ["Name"] = "Slider",
    ["Min"] = 0,
    ["Max"] = 100,
    ["Increment"] = 1,
    ["Default"] = 30,
    ["Callback"] = function(Value)
        print(Value)
    end
})

local Slider = MainTab:MakeSlider("Slider", {
    ["Title"] = "Slider",
    ["Content"] = "This is a Slider",
    ["Min"] = 0,
    ["Max"] = 100,
    ["Increment"] = 1,
    ["Default"] = 30,
    ["Callback"] = function(Value)
        print(Value)
    end
})

local Dropdown = MainTab:MakeDropdown("Dropdown", {
    ["Title"] = "Dropdown",
    ["Content"] = "This is a dropdown",
    ["Multi"] = false,
    ["Options"] = {"Option 1", "Option 2"},
    ["Default"] = {"Option 1"},
    ["Callback"] = function(Value)
        print(Value)
    end
})

local MultiDropdown = MainTab:MakeDropdown("Multi Dropdown", {
    ["Title"] = "Multi Dropdown",
    ["Content"] = "This is a multi dropdown",
    ["Multi"] = true,
    ["Options"] = {"Option 1", "Option 2"},
    ["Default"] = {"Option 1"},
    ["Callback"] = function(Value)
        print(Value)
    end
})
