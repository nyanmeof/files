if game.PlaceId ~= 4520749081 then return end

local Player = game.Players.LocalPlayer
local Stats = Player.PlayerStats
local Character = Player.Character or Player.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")
local Head = Character:WaitForChild("Head")
local RS = game:GetService("ReplicatedStorage")
local QuestRemote = RS.Chest.Remotes.Functions.Quest
local SkillRemote = RS.Chest.Remotes.Functions.SkillAction

local Mon, NameQuest, NPC
local align = nil
local att = nil
local isFighting = false
local lastTeleportTime = 0

local function AddBodyVelocity()
    local head = Player.Character and Player.Character:FindFirstChild("Head")
    if head and not head:FindFirstChild("eltrul") then
        local ngu = Instance.new("BodyVelocity", head)
        ngu.Name = "eltrul"
        ngu.MaxForce = Vector3.new(0, math.huge, 0)
        ngu.Velocity = Vector3.new(0, 0, 0)
    end
end

local function CreateAlignOrientation()
    Character = Player.Character
    if not Character then return end
    HRP = Character:FindFirstChild("HumanoidRootPart")
    if not HRP then return end
    
    if align then align:Destroy() end
    if att then att:Destroy() end
    
    local hum = Character:FindFirstChild("Humanoid")
    if hum then
        hum.AutoRotate = false
    end
    
    att = Instance.new("Attachment")
    att.Parent = HRP
    
    align = Instance.new("AlignOrientation")
    align.Attachment0 = att
    align.Mode = Enum.OrientationAlignmentMode.OneAttachment
    align.RigidityEnabled = true
    align.MaxTorque = math.huge
    align.Responsiveness = 200
    align.Parent = HRP
    
    if isFighting then
        align.CFrame = CFrame.Angles(math.rad(-90), 0, 0)
    else
        align.CFrame = CFrame.Angles(0, 0, 0)
    end
end

local function FaceDown()
    if align then
        align.CFrame = CFrame.Angles(math.rad(-90), 0, 0)
    end
end

local function FaceNormal()
    if align then
        align.CFrame = CFrame.Angles(0, 0, 0)
    end
end

local function CaculateDistance(pos)
    if not HRP then return math.huge end
    return (HRP.Position - pos.Position).Magnitude
end

local function TP(cf)
    pcall(function()
        if CaculateDistance(cf) < 5 then return end
        HRP.CFrame = cf
        HRP.Velocity = Vector3.new(0, 0, 0)
    end)
end

local LevelMap = {
    {9, "Soldier [Lv. 1]", "Kill 4 Soldiers", "Starter Island Quest"},
    {19, "Clown Pirate [Lv. 10]", "Kill 5 Clown Pirates", "Starter Island Quest"},
    {29, "Smoky [Lv. 20]", "Kill 1 Smoky", "Starter Island Quest"},
    {49, "Tashi [Lv. 30]", "Kill 1 Tashi", "Starter Island Quest"},
    {74, "Clown Swordman [Lv. 50]", "Kill 6 Clown Swordman", "Pirate Island Quest"},
    {99, "The Clown [Lv. 75]", "Kill 1 The Clown", "Pirate Island Quest"},
    {119, "Commander [Lv. 100]", "Kill 4 Commander", "Soldier Town Quest"},
    {144, "Captain [Lv. 120]", "Kill 1 Captain", "Soldier Town Quest"},
    {179, "The Barbaric [Lv. 145]", "Kill 1 The Barbaric", "Soldier Town Quest"},
    {199, "Fighter Fishman [Lv. 180]", "Kill 4 Fighter Fishmans", "Shark Island Quest"},
    {229, "Karate Fishman [Lv. 200]", "Kill 1 Karate Fishman", "Shark Island Quest"},
    {249, "Shark Man [Lv. 230]", "Kill 1 Shark Man", "Shark Island Quest"},
    {299, "Trainer Chef [Lv. 250]", "Kill 4 Trainer Chef", "Chef Ship Quest"},
    {349, "Dark Leg [Lv. 300]", "Kill 1 Dark Leg", "Chef Ship Quest"},
    {399, "Dory [Lv. 350]", "Kill 1 Dory", "Chef Ship Quest"},
    {449, "Snow Soldier [Lv. 400]", "Kill 5 Snow Soldier", "Snow Island Quest"},
    {499, "King Snow [Lv. 450]", "Kill 1 King Snow", "Snow Island Quest"},
    {524, "Little Dear [Lv. 500]", "Kill 1 Little Dear", "Snow Island Quest"},
    {574, "Candle Man [Lv. 525]", "Kill 1 Candle Man", "Desert Island Quest"},
    {624, "Sand Bandit [Lv. 575]", "Kill 4 Sand Bandit", "Desert Island Quest"},
    {674, "Bomb Man [Lv. 625]", "Kill 1 Bomb Man", "Desert Island Quest"},
    {724, "Desert Marauder [Lv. 675]", "Kill 4 Desert Marauder", "Desert Island Quest"},
    {799, "King of Sand [Lv. 725]", "Kill 1 King of Sand", "Desert Island Quest"},
    {849, "Sky Soldier [Lv. 800]", "Kill 4 Sky Soldier", "Skyland Quest"},
    {899, "Ball Man [Lv. 850]", "Kill 1 Ball Man", "Skyland Quest"},
    {949, "Cloud Warrior [Lv. 900]", "Kill 4 Cloud Warrior", "Skyland Quest"},
    {999, "Rumble Man [Lv. 950]", "Kill 1 Rumble Man", "Skyland Quest"},
    {1049, "Elite Soldier [Lv. 1000]", "Kill 4 Elite Soldiers", "Bubbleland Quest"},
    {1099, "High-class Soldier [Lv. 1050]", "Kill 4 High-class Soldier", "Bubbleland Quest"},
    {1149, "Leader [Lv. 1100]", "Kill 1 Leader", "Bubbleland Quest"},
    {1199, "Pasta [Lv. 1150]", "Kill 1 Pasta", "Bubbleland Quest"},
    {1249, "Naval personnel [Lv. 1200]", "Kill 4 Naval personnel", "Lobby Island Quest"},
    {1299, "Wolf [Lv. 1250]", "Kill 1 Wolf", "Lobby Island Quest"},
    {1349, "Giraffe [Lv. 1300]", "Kill 1 Giraffe", "Lobby Island Quest"},
    {1399, "Nautical soldier [Lv. 1350]", "Kill 4 Nautical soldier", "Lobby Island Quest"},
    {1449, "Naval soldier [Lv. 1400]", "Kill 4 Naval soldier", "Lobby Island Quest"},
    {1499, "Leo [Lv. 1450]", "Kill 1 Leo", "Lobby Island Quest"},
    {1549, "Zombie [Lv. 1500]", "Kill 5 Zombies", "Zombie Island Quest"},
    {1599, "Elite Zombie [Lv. 1550]", "Kill 4 Elite Zombies", "Zombie Island Quest"},
    {1649, "Revenant [Lv. 1600]", "Kill 4 Revenant", "Zombie Island Quest"},
    {1699, "Shadow Master [Lv. 1650]", "Kill 1 Shadow Master", "Zombie Island Quest"},
    {1749, "New World Pirate [Lv. 1700]", "Kill 4 New World Pirates", "War Island Quest"},
    {1799, "Cutlass Pirate [Lv. 1750]", "Kill 4 Cutlass Pirates", "War Island Quest"},
    {1849, "Rear Admiral [Lv. 1800]", "Kill 4 Rear Admirals", "War Island Quest"},
    {1924, "True Karate Fishman [Lv. 1850]", "Kill 1 True Karate Fishman", "War Island Quest"},
    {1999, "Quake Woman [Lv. 1925]", "Kill 1 Quake Woman", "War Island Quest"},
    {2049, "Fishman [Lv. 2000]", "Kill 4 Fishmans", "Fishland Quest"},
    {2099, "Combat Fishman [Lv. 2050]", "Kill 1 Combat Fishman", "Fishland Quest"},
    {2149, "Sword Fishman [Lv. 2100]", "Kill 1 Sword Fishman", "Fishland Quest"},
    {2199, "Soldier Fishman [Lv. 2150]", "Kill 4 Soldier Fishman", "Fishland Quest"},
    {99999, "Seasoned Fishman [Lv. 2200]", "Kill 1 Seasoned Fishman", "Fishland Quest"},
}

local function UpdateQuest()
    local lvl = Stats.lvl.Value
    for _, data in ipairs(LevelMap) do
        if lvl <= data[1] then
            Mon = data[2]
            NameQuest = data[3]
            NPC = data[4]
            break
        end
    end
end

local function EquipWeapon()
    local weapon = Stats.FightingStyle.Value
    local bp = Player.Backpack
    if bp:FindFirstChild(weapon) then
        Character.Humanoid:EquipTool(bp[weapon])
    end
end

local function AutoAttack()
    pcall(function()
        SkillRemote:InvokeServer('FS_' .. Stats.FightingStyle.Value .. '_M1')
    end)
end

local DistanceAbove = 7

spawn(function()
    while wait(0.1) do
        if _G.AutoFarm then
            AutoAttack()
        end
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if Player.Character and Player.Character:FindFirstChild("Head") then
                AddBodyVelocity()
            end
        end)
    end
end)

Player.CharacterAdded:Connect(function(newChar)
    Character = newChar
    HRP = Character:WaitForChild("HumanoidRootPart")
    wait(0.5)
    AddBodyVelocity()
    CreateAlignOrientation()
end)

_G.AutoFarm = true

CreateAlignOrientation()

spawn(function()
    while wait() do
        if _G.AutoFarm then
            pcall(function()
                Character = Player.Character or Player.CharacterAdded:Wait()
                HRP = Character:FindFirstChild("HumanoidRootPart")
                if not HRP then return end
                
                if not align or not att then
                    CreateAlignOrientation()
                end
                
                UpdateQuest()
                
                if Player.CurrentQuest.Value ~= NameQuest then
                    QuestRemote:InvokeServer("take", NameQuest)
                    wait(0.5)
                end
                
                local targetMob = nil
                local shortestDist = math.huge
                
                local monstersFolder = workspace.Monster
                if monstersFolder then
                    local monFolder = monstersFolder:FindFirstChild("Mon")
                    if monFolder then
                        for _, v in ipairs(monFolder:GetChildren()) do
                            if v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                local hrp = v.HumanoidRootPart
                                if hrp and v.Humanoid.Health > 0 then
                                    local dist = (HRP.Position - hrp.Position).Magnitude
                                    if dist < shortestDist then
                                        shortestDist = dist
                                        targetMob = v
                                    end
                                end
                            end
                        end
                    end
                    
                    local bossFolder = monstersFolder:FindFirstChild("Boss")
                    if bossFolder then
                        for _, v in ipairs(bossFolder:GetChildren()) do
                            if v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                local hrp = v.HumanoidRootPart
                                if hrp and v.Humanoid.Health > 0 then
                                    local dist = (HRP.Position - hrp.Position).Magnitude
                                    if dist < shortestDist then
                                        shortestDist = dist
                                        targetMob = v
                                    end
                                end
                            end
                        end
                    end
                end
                
                if targetMob then
                    if not isFighting then
                        isFighting = true
                        FaceDown()
                    end
                    local mobHRP = targetMob.HumanoidRootPart
                    local abovePos = mobHRP.CFrame * CFrame.new(0, DistanceAbove, 0)
                    
                    -- Thêm delay 0.1 giây khi teleport
                    local currentTime = tick()
                    if currentTime - lastTeleportTime >= 0.1 then
                        TP(abovePos)
                        lastTeleportTime = currentTime
                    end
                    
                    EquipWeapon()
                else
                    if isFighting then
                        isFighting = false
                        FaceNormal()
                    end
                    local npcPart = workspace.AllNPC:FindFirstChild(NPC)
                    if npcPart then
                        TP(npcPart.CFrame * CFrame.new(0, 5, 0))
                        wait(1)
                    end
                end
            end)
        end
        wait(0.15)
    end
end)
