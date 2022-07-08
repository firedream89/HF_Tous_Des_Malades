--INIT EVENTS
local function OnEvent(self, event, addOnName)
  if addOnName == "HF_Tous_Des_Malades" then
    TDMDB = TDMDB or {} -- initialize it to a table if this is the first time
    TDMDB.sessions = (TDMDB.sessions or 0) + 1
    TDMDB.baie_du_butin = TDMDB.baie_du_butin or {}
    TDMDB.cabestan = TDMDB.cabestan or {}
    TDMDB.foire_de_sombrelune = TDMDB.foire_de_sombrelune or {}
    TDMDB.gadgetzan = TDMDB.gadgetzan or {}
    TDMDB.long_guet = TDMDB.long_guet or {}
    TDMDB.ravenhold = TDMDB.ravenhold or {}
    TDMDB.shen_dralar = TDMDB.shen_dralar or {}
    TDMDB.completed = TDMDB.completed or IS_COMPLETED
    TDMDB.state = TDMDB.state or STATES
    if TDMDB.sessions == 1 then
      TDMDB.showUI = true
    end

    print("Tous des malades loaded !")
    print("'/tdm hide' for hide UI")
    print("'/tdm show' for show UI")
    Update()
	end
end

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", OnEvent)


-- ADD CHAT COMMAND
local function MyAddonCommands(msg, editbox)
    if msg == CMD_HIDE then
      Ui:Hide()
    elseif msg == CMD_SHOW then
      Ui:Show()
    elseif msg == CMD_RESET then
      Ui:Hide()
      TDMDB = {}
      print("TDM : Database cleared !")
      print("TDM : Please Reload UI")
    end
  end
  
  SLASH_TDM1, SLASH_TDM2 = '/tdm', '/TDM'
  
  SlashCmdList["TDM"] = MyAddonCommands