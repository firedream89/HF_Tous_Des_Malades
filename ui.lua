UI = { ui = nil, Timer = C_Timer.NewTicker(15, Update) }

--Create UI Widget
function UI:Init(object)
    object = object or {}
    setmetatable(object, self)
    self.__index = self
    self.ui = CreateFrame("Frame", nil, UIParent)
    self.ui:SetPoint("TOPLEFT",0,0)
    self.ui:SetSize(300, 300)
    self.ui.frame = {}
    self.ui.frame_y = {}

    return self
end

---Create a UI child frame
function UI:Create_Html_Frame(parent)
    local HTML = CreateFrame('SimpleHTML', nil, parent);

    self.ui.frame[#self.ui.frame+1] = HTML

    HTML:SetPoint("TOPLEFT", 5, #self.ui.frame*-15)
    HTML:SetSize(400, 20)
    HTML:SetFont('Fonts\\FRIZQT__.TTF', 12);

    HTML:SetText("<html><body><p>NEW FRAME</p></body></html>")

    HTML:SetScript("OnMouseDown", Toggle)
    
    HTML.id = #self.ui.frame
    HTML.level = 2
    HTML.toggle = false
    HTML.expand = Get_UI_State(HTML.id)
    HTML.expandable = false
    HTML.children = {}
    HTML.parent = parent
    HTML.y = #self.ui.frame*-15

    return HTML
end

---Hide UI
function UI:Hide()
    self.ui:Hide()
    self.Timer:Cancel()
    Set_Ui_Show(false)
end

---Show UI
function UI:Show()
    self.ui:Show()
    if self.Timer ~= nil then
        self.Timer:Cancel()
    end
    self.Timer = C_Timer.NewTicker(15, Update)
    Set_Ui_Show(true)
end

---Set frame texture
function UI:Set_Texture(framePos, r, g, b, a)
    local texture = self.ui.frame[framePos].texture or self.ui.frame[framePos]:CreateTexture(nil,"BACKGROUND")
    texture:SetColorTexture(r,g,b,a)
    texture:SetSize(300,20)
    texture:SetPoint("TOPLEFT",0,0)
    
    self.ui.frame.texture = texture
end

---Update text on frame
function UI:Set_Text(framePos, text, size)
    size = size or 12
    local frame = self.ui.frame[framePos]

    frame:SetText("<html><body>"..text.."</body></html>")
    frame:SetFont('Fonts\\FRIZQT__.TTF', size);
end

---Get frame text
function UI:Get_Text(framePos)
    return self.ui.frame[framePos].text
end

---Set frame pos
function UI:Set_Point(framePos, level, y)
    y = y or framePos*-15
    self.ui.frame[framePos]:SetPoint("TOPLEFT", 5+10*level, y)
end

---return button plus/minus if necessary
function UI:Get_Expand_Button(framePos)
    local frame = self.ui.frame[framePos]
    if frame.expandable then
        if frame.expand then
            return "<p>|TInterface/Buttons/ui-minusbutton-up.blp:15|t", true
        else
            return "<p>|TInterface/Buttons/ui-plusbutton-up.blp:15|t", false
        end
    else
        return "<p>", false
    end
end

---Show/hide children frames
function UI:Toggle_Children(framePos, expand)
    if self.ui.frame[framePos].expandable then
        local frame = self.ui.frame[framePos]
        if expand == nil then
            expand = frame.expand
        end
        local y = frame.y
        local level = frame.level
        local childCount = 0

        for i2 = 1, #frame.children do
            if expand then
                frame.children[i2].hide = false
                frame.children[i2]:Show()
                frame.children[i2].y = y + Y_SPACE * i2
                self:Set_Point(framePos+i2, level+1, y + Y_SPACE * i2)
            else
                frame.children[i2].hide = true
                frame.children[i2]:Hide()
                frame.children[i2].y = y
                self:Set_Point(framePos+i2, level+1, y)
            end
            if frame.children[i2].expandable then
                if not expand then
                    childCount = childCount + self:Toggle_Children(framePos+i2+childCount, expand)
                end
            end
        end
        return #frame.children
    end
end

function UI:Reload()
end

--Updating UI                              Element 1        Element 2...
--                  with elements list { { level, text }, { level, text } }
---@param list table
function UI:Update(list)
    --Create frames from list count
    if #list > #Ui.ui.frame then
        for i = #self.ui.frame, #list-1 do
            self:Create_Html_Frame(self.ui)
        end

        --Setting up frames
        local last_level_frame = { 0, 0, 0, 0 }
        for i = 1, #list do
            local i2 = i+1
            if i+1 > #list then
                i2 = i-1
            end
            if list[i][1] < list[i2][1] then
                self.ui.frame[i].expandable = true
                if list[i][1] > 1 then
                    self.ui.frame[last_level_frame[list[i][1]-1]].children[#self.ui.frame[last_level_frame[list[i][1]-1]].children+1] = self.ui.frame[i]
                    self.ui.frame[i].parent = self.ui.frame[last_level_frame[list[i][1]-1]]
                end
                last_level_frame[list[i][1]] = i
            elseif list[i][1] == list[i2][1] then
                self.ui.frame[i].expandable = false
                last_level_frame[list[i][1]] = i
                if list[i][1] > 1 then
                    self.ui.frame[last_level_frame[list[i][1]-1]].children[#self.ui.frame[last_level_frame[list[i][1]-1]].children+1] = self.ui.frame[i]
                    self.ui.frame[i].parent = self.ui.frame[last_level_frame[list[i][1]-1]]
                end
            else
                self.ui.frame[i].expandable = false
                self.ui.frame[last_level_frame[list[i][1]-1]].children[#self.ui.frame[last_level_frame[list[i][1]-1]].children+1] = self.ui.frame[i]
                self.ui.frame[i].parent = self.ui.frame[last_level_frame[list[i][1]-1]]
            end

            self.ui.frame[i].level = list[i][1]
        end--[[
        for i=1, #self.ui.frame do
            if self.ui.frame[i].expandable then
                print("FRAME : ", i, "CHILDREN : ", #self.ui.frame[i].children)
            end
        end]]--
        if Get_Ui_Show() then
            Ui:Show()
        else
            Ui:Hide()
        end
    end

    --Reset y
    for i = 1, #self.ui.frame do
        self.ui.frame[i].y = 0
    end

    --Set pos, text and hiding frames
    for i = 1, #list do
        local frame = self.ui.frame
        local button = self:Get_Expand_Button(i)
        self:Set_Text(i, button..list[i][2], TEXT_SIZE-list[i][1])

        if frame[i].expandable and not frame[i].hide then
            if i > 1 then
                frame[i].y = frame[i-1].y + Y_SPACE
                self:Set_Point(i, list[i][1], frame[i-1].y + Y_SPACE)
            end
            self:Toggle_Children(i)
        else
            if frame[i].y == 0 and i > 1 then
                frame[i].y = frame[i-1].y + Y_SPACE
                self:Set_Point(i, list[i][1], frame[i-1].y + Y_SPACE)
            elseif i == 1 then
                frame[i].y = 0
                self:Set_Point(i, list[i][1], 0)
            end
        end
    end

    self.ui.data = list
end

---Update Show/hiding frame
function Toggle(self)
    if self.expandable then
        self.expand = not self.expand
        Set_UI_State(self.id, self.expand)
        Update()
    end
end


--New_Texture(UI.frame[2], 0, 0, 0, 10)


Ui = UI:Init(nil)