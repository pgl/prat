﻿---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2007  Prat Development Team
--
-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to:
--
-- Free Software Foundation, Inc., 
-- 51 Franklin Street, Fifth Floor, 
-- Boston, MA  02110-1301, USA.
--
--
-------------------------------------------------------------------------------
--[[
Name: PratCopyChat
Revision: $Revision: 81859 $
Author(s): Sylvanaar
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#CopyChat
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that allows you to copy text from the active chat window.
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 


local PRAT_MODULE = Prat:RequestModuleName("CopyChat")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
	["CopyChat"] = true,
	["Copy text from the active chat window."] = true,
	["Copy Text"] = true,
	["Copy all of the text in the selected chat frame into an edit box"] = true,
	["showbutton_name"] = "Copy Button",
	["showbutton_desc"] = "Show a button on the chatframe",
	["ChatFrame"] = true,
	[" Text"] = true,
	["Message From : %s"] = true,
	["Copy Text Format"] = true,
	["Should the copied text be plain, or formatted so you can see the colors."] = true,
	["Plain"] = true,
	["HTML"] = true,
	["BBCode"] = true
})

--L[LIB.NEWLOCALE](L, "deDE", function() return {
--	["CopyChat"] = "Chat Kopieren",
--	["Copy text from the active chat window."] = "Ein Modul das dich Text aus dem Chat kopieren l\195\164\195\159t.",
--	["Copy Text"] = "Kopieren",
--	["Copy all of the text in the selected chat frame into an edit box"] = "Kopiert den gesammten Text im ausgew\195\164hlten Chatfenster in das Editierfeld.",
--	["showbutton_name"] = "Kopieren Taste",
--	["showbutton_desc"] = "Zeige einen Taste auf dem Chatfenster.",
--	["showbutton_perframename"] = "Fenster %s  Taste",
--	["showbutton_perframedesc"] = "Zeige eine Taste auf dem %s ",
--} end)
--
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--	["CopyChat"] = "대화 복사",
--	["Copy text from the active chat window."] = "활성화된 대화창의 대화를 복사합니다.",
--	["Copy Text"] = "대화글 복사",
--	["Copy all of the text in the selected chat frame into an edit box"] = "입력창에 선택된 대화창의 모든 대화글을 복사합니다.",
--	["showbutton_name"] = "복사 버튼",
--	["showbutton_desc"] = "대화창에 복사 버튼을 표시합니다.",
--	["showbutton_perframename"] = "대화창%d 버튼",
--	["showbutton_perframedesc"] = "대화창%d에 버튼을 표시합니다.",
--	["ChatFrame"] = "대화창",
--	[" Text"] = " 글자",
--	["Message From : %s"] = "받은 메세지 : %s",
--	["Copy Text Format"] = "텍스트 형식 복사",
--	["Should the copied text be plain, or formatted so you can see the colors."] = "Should the copied text be plain, or formatted so you can see the colors.",
--	["Plain"] = "Plain",
--	["HTML"] = "HTML",
--	["BBCode"] = "BBCode"
--} end)
--
--L[LIB.NEWLOCALE](L, "frFR", function() return {
--	["CopyChat"] = "Copier un chat",
--	["Copy text from the active chat window."] = "Copier le texte depuis la fenêtre de chat active.",
--	["Copy Text"] = "Copier le texte",
--	["Copy all of the text in the selected chat frame into an edit box"] = "Copie tout le texte de la fenêtre sélectionner dans une boite d'édition.",
--	["showbutton_name"] = "Bouton Copier",
--	["showbutton_desc"] = "Affiche un bouton sur la fenêtre de chat.",
--	["showbutton_perframename"] = "Bouton de la fenêtre %s ",
--	["showbutton_perframedesc"] = "Affiche un bouton sur la fenêtre %s .",
--
--} end)
--
--L[LIB.NEWLOCALE](L, "esES", function() return {
--	["CopyChat"] = "Copiar Chat",
--	["Copy text from the active chat window."] = "Copia el texto de la ventana de chat activa",
--	["Copy Text"] = "Copiar Texto",
--	["Copy all of the text in the selected chat frame into an edit box"] = "Copia todo el texto de la ventana de chat seleccionada a una caja de edici\195\179n",
--	["showbutton_name"] = "Bot\195\179n de Copiar",
--	["showbutton_desc"] = "Muestra un bot\195\179n en la ventana de chat",
--	["showbutton_perframename"] = "Bot\195\179n en ventana %s ",
--	["showbutton_perframedesc"] = "Muestra un bot\195\179n en la ventana de %s ",
--
--} end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--	["CopyChat"] = "複製聊天訊息",
--	["Copy text from the active chat window."] = "從使用中的聊天視窗複製文字。",
--	["Copy Text"] = "複製文字",
--	["Copy all of the text in the selected chat frame into an edit box"] = "複製使用中的聊天視窗中所有的文字到彈出視窗的輸入框中。",
--	["showbutton_name"] = "複製按鈕",
--	["showbutton_desc"] = "切換是否在各個聊天視窗顯示複製按鈕。",
--	["showbutton_perframename"] = "聊天視窗%d複製按鈕",
--	["showbutton_perframedesc"] = "切換是否顯示複製按鈕。",
--	["ChatFrame"] = "聊天視窗",
--	[" Text"] = "的文字",
--	["Message From : %s"] = "訊息來自 : %s",
--	["Copy Text Format"] = "被複製訊息的格式",
--	["Should the copied text be plain, or formatted so you can see the colors."] = "被複製訊息的格式 (純文字/已格式化)。",
--	["Plain"] = "純文字",
--	["HTML"] = "HTML",
--	["BBCode"] = "BBCode"
--} end)
--
----Chinese Translation: 月色狼影@CWDG
----CWDG site: http://Cwowaddon.com
--L[LIB.NEWLOCALE](L, "zhCN", function() return {
--	["CopyChat"] = "复制聊天信息",
--	["Copy text from the active chat window."] = "从聊天窗复制文字",
--	["Copy Text"] = "复制文字",
--	["Copy all of the text in the selected chat frame into an edit box"] = "复制你在聊天窗口中所选取的文字到输入框中",
--	["showbutton_name"] = "复制按钮",
--	["showbutton_desc"] = "在聊天框体显示按钮",
--	["showbutton_perframename"] = "%s 按钮",
--	["showbutton_perframedesc"] = "在%s显示按钮.",
--	["ChatFrame"] = "聊天窗口",
--	[" Text"] = "的文字",
--	["Message From : %s"] = "消息来自 : %s",	
--
--} end)

local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0", "AceTimer-3.0")

Prat:SetModuleDefaults(module.name, {
	profile = {
		on  = true,
		showbutton = {["*"] = true},
		copyformat = "plain"
	}
} )

Prat:SetModuleOptions(module.name, {
    name = L["CopyChat"],
    desc = L["Copy text from the active chat window."],
    type = "group",
    args = {
		showbutton = {
			name = L["showbutton_name"],
			desc = L["showbutton_desc"],
	        type = "multiselect",
			values = Prat.HookedFrameList,
			get = "GetSubValue",
			set = "SetSubValue"
		},
        copy = {
            name = L["Copy Text"],
            desc = L["Copy all of the text in the selected chat frame into an edit box"],
            type = "execute",
            order = 190,
            func = "MenuScrape"
        },
        copyformat = {
            name = L["Copy Text Format"],
            desc = L["Should the copied text be plain, or formatted so you can see the colors."],
            type = "select",
            order = 195,
		    get = "GetValue", 
		    set = "SetValue",
            values = { ["plain"] = L["Plain"], ["bbcode"] = L["BBCode"] },
        },

    }
})

function module:MenuScrape()
	self:ScrapeChatFrame(SELECTED_CHAT_FRAME) 
	HideDropDownMenu(1)
end


Prat:SetModuleInit(module.name, 
	function(module)
		PratCCFrameScrollText:SetScript("OnTextChanged", function(this) module:OnTextChanged(this) end)
		PratCCFrameScrollText:SetScript("OnEscapePressed", function(this) PratCCFrame:Hide() module.str = nil end)
	end
)


function module:OnModuleEnable()
    self.buttons = {}
	for k,v in pairs(Prat.HookedFrames) do
        self.buttons[k] = self:MakeReminder(v:GetID())
        self:showbutton(k, self.db.profile.showbutton[k])
	end
    UnitPopupButtons["COPYCHAT"]	= { text =L["Copy Text"], dist = 0 , func = function(a1, a2) module:CopyLineFromPlayerlink(a1, a2) end , arg1 = "", arg2 = ""};
	tinsert(UnitPopupMenus["FRIEND"],#UnitPopupMenus["FRIEND"]-1,"COPYCHAT");    

    self:SecureHook("UnitPopup_ShowMenu")
    self:SecureHook("ChatFrame_OnHyperlinkShow")
end
    
function module:ChatFrame_OnHyperlinkShow(this, ...)
	if not Prat.WOTLK then this = _G.this end
	self.clickedframe = this
end

function module:OnModuleDisable()
    self:hidebuttons()
	PratCCFrame:Hide()
end


--[[------------------------------------------------
	Core Functions
------------------------------------------------]]--

module.lines = {}
module.str = nil

function module:UnitPopup_ShowMenu(dropdownMenu, which, unit, name, userData, ...)
    local ORIGIN_FRAME = self.clickedframe
    
	for i=1, UIDROPDOWNMENU_MAXBUTTONS do
		button = getglobal("DropDownList"..UIDROPDOWNMENU_MENU_LEVEL.."Button"..i);
		
		if button.value == "COPYCHAT" then 
		  --  self:Debug(dropdownMenu:GetName(), which, unit, name, userData, button.value, ...)
		    button.func = UnitPopupButtons["COPYCHAT"].func
		    button.arg1 = ORIGIN_FRAME
		end
	end
end


function module:GetFormattedLine(line, r, g, b)
   local prof = self.db.profile
   local CLR = Prat.CLR

   if prof.copyformat == "plain" then 
	return line
   end

   if prof.copyformat == "bbcode" then
       local fline = line:gsub("|c[fF][fF](%w%w%w%w%w%w)", "[color=#%1]"):gsub("|r", "[/color]")

       return "[color=#"..CLR:GetHexColor(r,g,b).."]"..fline.."[/color]"
   end



end



function module:CopyLineFromPlayerlink(origin_frame, ...)

	-- TODO: Consider just using self.clickedFrame (I dont remember why the other code is there)
    local frame = (origin_frame and origin_frame:GetFrameType() == "ScrollingMessageFrame" and origin_frame) or self.clickedframe
    
	for i=1, #self.lines do
		self.lines[i] = nil
	end

	self:AddLines(self.lines, frame:GetRegions())    

    local dropdownFrame = _G[UIDROPDOWNMENU_INIT_MENU]
    
 	local name = dropdownFrame.name
	local server = dropdownFrame.server  or ""
	local linenum = dropdownFrame.lineID
	
	local fullname = name;

	if server:len()>0 then
		fullname = name.."-"..server;
	end

	local findname = "|Hplayer:"..fullname..":"..tostring(linenum)

    for i=1, #self.lines do
		if self.lines[i]:find(findname) then
		    self:StaticPopupCopyLine(fullname, self.lines[i])
		end
	end
    
end


function module:StaticPopupCopyLine(sender, text)
    StaticPopupDialogs["COPY_LINE"] = StaticPopupDialogs["COPY_LINE"] or {
        text = L["Message From : %s"],
        chattext = "",
        button2 = ACCEPT,
        hasEditBox = 1,
        hasWideEditBox = 1,

        OnShow = function()
            this:SetWidth(420)
            local editBox = _G[this:GetName().."WideEditBox"];
            editBox:SetText(StaticPopupDialogs["COPY_LINE"].chattext);
            editBox:SetFocus();
            editBox:HighlightText(0);

            local button = getglobal(this:GetName().."Button2");
            button:ClearAllPoints();
            button:SetWidth(200);
            button:SetPoint("CENTER", editBox, "CENTER", 0, -30);
        end,

        OnHide = function() end,
        OnAccept = function() end,
        OnCancel = function() end,
        EditBoxOnEscapePressed = function() this:GetParent():Hide(); end,
        timeout = 0,
        whileDead = 1,
        hideOnEscape = 1
    };

    StaticPopupDialogs["COPY_LINE"].chattext = text
    StaticPopup_Show ("COPY_LINE", sender);
end


function module:ScrapeChatFrame(frame, noshow)
	frame:ScrollToBottom()
	self:ScheduleTimer("DoCopyChatScroll", 0.1, frame)
end
     
function module:DoCopyChatScroll(frame, noshow)
	self.longstr = ""
	self.str = ""
	
	if frame:GetNumMessages() == 0 then return end

	repeat
		self:DoCopyChat(frame, nil, true)
		self.longstr = self.str..self.longstr -- TODO use a table, then concat
		frame:PageUp()
	until frame:AtTop()

	frame:ScrollToBottom()
	
	self.str, self.longstr = self.longstr

    if not noshow then 
    	PratCCText:SetText(L["ChatFrame"]..frame:GetName():gsub("ChatFrame", "")..L[" Text"], lines)
    	PratCCFrameScrollText:SetText(self.str or "")
    	PratCCFrame:Show()
    end
end
function module:DoCopyChatArg(arg)
	self:DoCopyChat(unpack(arg))
end

function module:DoCopyChat(frame, oldsize, noshow)
	for i=1, #self.lines do
		self.lines[i] = nil
	end

	self:AddLines(self.lines, frame:GetRegions())

	self.str = table.concat(self.lines, "\n")

	if oldsize then
	    FCF_SetChatWindowFontSize(frame, oldsize)
	end
	
    if not noshow then 
    	PratCCText:SetText(L["ChatFrame"]..frame:GetName():gsub("ChatFrame", "")..L[" Text"], lines)
    	PratCCFrameScrollText:SetText(self.str or "")
    	PratCCFrame:Show()
    end
end

function module:CopyChat()
	module:ScrapeChatFrame(SELECTED_CHAT_FRAME)
end

function module:AddLines(lines, ...)
  for i=select("#", ...),1,-1 do
    local x = select(i, ...)
	if x:GetObjectType() == "FontString" and not x:GetName() then
		table.insert(lines, self:GetFormattedLine(x:GetText(), x:GetTextColor()))
	end
  end
end

function module:OnTextChanged(this)
	if self.str and this:GetText() ~= self.str then
		this:SetText(self.str)
		self.str = nil
	end
	local s = PratCCFrameScrollScrollBar
	this:GetParent():UpdateScrollChildRect()
	local _, m = s:GetMinMaxValues()
	if m > 0 and this.max ~= m then
		this.max = m
		s:SetValue(m)
	end
end

function module:hidebuttons()
    for k,v in pairs(self.buttons) do
        v:Hide()
    end
end

function module:showbutton(id, show)
    local b = self.buttons[id]
    if show then b:Show() else b:Hide() end
end

do 
	local function reminderOnClick(self, button, down) PlaySound("igChatBottom"); module:ScrapeChatFrame(self:GetParent()) end
	local function reminderOnEnter(self, motion) self:SetAlpha(0.9) end
	local function reminderOnLeave(self, motion) self:SetAlpha(0.2) end
	
	function module:MakeReminder(id)
	    local cf = _G["ChatFrame"..id]
	    local name = "ChatFrame"..id.."PratCCReminder"
	    local b = _G[name]
	    if not b then
		    b = CreateFrame("Button", name, cf)
		    b:SetFrameStrata("BACKGROUND")
		    b:SetWidth(24)
		    b:SetHeight(24)
		    b:SetNormalTexture("Interface\\Addons\\Prat-3.0\\textures\\prat-chatcopy2")
		    b:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Down")
		    b:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight")
		    b:SetPoint("TOPLEFT", cf, "TOPLEFT", 0, 0)
		    b:SetScript("OnClick", reminderOnClick)
		    b:SetScript("OnEnter", reminderOnEnter)
		    b:SetScript("OnLeave", reminderOnLeave)
		    b:SetAlpha(0.2)
		    b:Hide()
		end

	    return b
	end
end

  return
end ) -- Prat:AddModuleToLoad