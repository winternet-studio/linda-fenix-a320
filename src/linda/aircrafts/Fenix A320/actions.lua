-- FENIX A320
-- Module version 0.3
-- Jun 2022

-- Tested with FlyByWire A32NX Development/Experimental version

-- ## Glareshield - FCU  ##################################

-- $$ Autopilot Buttons

function FNX_GLSD_FCU_SPDMACH_toggle()
    ipc.writeLvar("L:S_FCU_SPD_MACH", 1)
    DspShow('MACH','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_SPD_MACH", 0)
end

function FNX_GLSD_FCU_AP_1_toggle()
    ipc.writeLvar("L:S_FCU_AP1", 1)
    DspShow('AP1','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_AP1", 0)
end

function FNX_GLSD_FCU_AP_2_toggle()
    ipc.writeLvar("L:S_FCU_AP2", 1)
    DspShow('AP2','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_AP2", 0)
end

function FNX_CKPT_CAPT_AP_Disconnect()
    local Lvar = "L:S_FC_CAPT_INST_DISCONNECT"
    ipc.writeLvar(Lvar, 1)
    DspShow('AP', 'disc')
    ipc.sleep(300)
    ipc.writeLvar(Lvar, 0)
end

function FNX_CKPT_FO_AP_Disconnect()
    local Lvar = "L:S_FC_FO_INST_DISCONNECT"
    ipc.writeLvar(Lvar, 1)
    DspShow('AP', 'disc')
    ipc.sleep(300)
    ipc.writeLvar(Lvar, 0)
end

function FNX_GLSD_FCU_AP_Disconnect()
    local Lvar = "L:I_FCU_AP1"
    local Lval = ipc.readLvar(Lvar)
    _loggg('AP1=' .. Lval)
    if Lval ~= 0 then
        FNX_GLSD_FCU_AP_1_toggle()
    end
    local Lvar = "L:I_FCU_AP2"
    local Lval = ipc.readLvar(Lvar)
    _loggg('AP2=' .. Lval)
    if Lval ~= 0 then
        FNX_GLSD_FCU_AP_2_toggle()
    end
    DspShow('AP','disc')
end

function FNX_GLSD_FCU_ATHR_toggle()
    ipc.writeLvar("L:S_FCU_ATHR", 1)
    FNX_DspATHR(ipc.readLvar('L:I_FCU_TRACK_FPA_MODE'))
    DspShow('ATHR','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_ATHR", 0)
end

function FNX_GLSD_FCU_ATHR_Disconnect()
    ipc.control(EvtPtr + 4)
    DspShow('ATHR','disc')
end

function FNX_GLSD_FCU_LOC_toggle()
    ipc.writeLvar("L:S_FCU_LOC", 1)
    DspShow('LOC','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_LOC", 0)
end

function FNX_GLSD_FCU_APPR_toggle()
    ipc.writeLvar("L:S_FCU_APPR", 1)
    DspShow('APPR','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_APPR", 0)
end

function FNX_GLSD_FCU_EXPED_toggle()
    ipc.writeLvar("L:S_FCU_EXPED", 1)
    DspShow('EXPD','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_EXPED", 0)
end

function FNX_GLSD_FCU_HDGTRK_toggle()
    local Lvar = "L:S_FCU_HDGVS_TRKFPA"
    local Lval = ipc.readLvar(Lvar)
    ipc.writeLvar(Lvar, Lval + 2)
    FNX_DspHDGtxt(ipc.readLvar('L:I_FCU_TRACK_FPA_MODE'))
    DspShow('HGTK','tgl')
    ipc.sleep(100)
end

function FNX_GLSD_FCU_METRIC_toggle()
    local Lvar = "L:S_FCU_METRIC_ALT"
    ipc.writeLvar(Lvar, 1)
    DspShow('METR','tgl')
    ipc.sleep(20)
    ipc.writeLvar(Lval, 0)
end

-- $$ Speed

function FNX_GLSD_FCU_SPD_inc()
    local Lvar = "L:E_FCU_SPEED"
    local Lval = ipc.readLvar(Lvar)
    _loggg('SPD=' .. Lval)
    ipc.writeLvar(Lvar, Lval + 1)
    _sleep(40)
    FNX_DspSPD()
end

function FNX_GLSD_FCU_SPD_incfast()
    local Lvar = "L:E_FCU_SPEED"
    local Lval = ipc.readLvar(Lvar)
    _loggg('SPD=' .. Lval)
    ipc.writeLvar(Lvar, Lval + 3)
    _sleep(40)
    FNX_DspSPD()
end

function FNX_GLSD_FCU_SPD_dec()
    local Lvar = "L:E_FCU_SPEED"
    local Lval = ipc.readLvar(Lvar)
    _loggg('SPD=' .. Lval)
    ipc.writeLvar(Lvar, Lval - 1)
    _sleep(40)
    FNX_DspSPD()
end

function FNX_GLSD_FCU_SPD_decfast()
    local Lvar = "L:E_FCU_SPEED"
    local Lval = ipc.readLvar(Lvar)
    _loggg('SPD=' .. Lval)
    ipc.writeLvar(Lvar, Lval - 3)
    _sleep(40)
    FNX_DspSPD()
end

function FNX_GLSD_FCU_SPD_selected ()
    local Lvar = "L:S_FCU_SPEED"
    local Lval = ipc.readLvar(Lvar)
    _loggg('SPDMODE=' .. Lval)
    ipc.writeLvar(Lvar, Lval + 1)
    DspShow ("SPD", "set")
    FNX_DspSPD()
end

function FNX_GLSD_FCU_SPD_managed ()
    local Lvar = "L:S_FCU_SPEED"
    local Lval = ipc.readLvar(Lvar)
    _loggg('SPDMODE=' .. Lval)
    ipc.writeLvar(Lvar, Lval - 1)
    DspShow ("SPD", "mngd")
    FNX_DspSPD()
end

-- $$ Heading

function FNX_GLSD_FCU_HDG_inc()
    local Lvar = "L:E_FCU_HEADING"
    local Lval = ipc.readLvar(Lvar)
    _loggg('HDG=' .. Lval)
    ipc.writeLvar(Lvar, Lval + 1)
    _sleep(40)
    FNX_DspHDG()
end

function FNX_GLSD_FCU_HDG_incfast()
    local Lvar = "L:E_FCU_HEADING"
    local Lval = ipc.readLvar(Lvar)
    _loggg('HDG=' .. Lval)
    ipc.writeLvar(Lvar, Lval + 3)
    _sleep(40)
    FNX_DspHDG()
end

function FNX_GLSD_FCU_HDG_dec()
    local Lvar = "L:E_FCU_HEADING"
    local Lval = ipc.readLvar(Lvar)
    _loggg('HDG=' .. Lval)
    ipc.writeLvar(Lvar, Lval - 1)
    _sleep(40)
    FNX_DspHDG()
end

function FNX_GLSD_FCU_HDG_decfast()
    local Lvar = "L:E_FCU_HEADING"
    local Lval = ipc.readLvar(Lvar)
    _loggg('HDG=' .. Lval)
    ipc.writeLvar(Lvar, Lval - 3)
    _sleep(40)
    FNX_DspHDG()
end

function FNX_GLSD_FCU_HDG_selected ()
    local Lvar = "L:S_FCU_HEADING"
    local Lval = ipc.readLvar(Lvar)
    _loggg('HDGMODE=' .. Lval)
    ipc.writeLvar(Lvar, Lval + 1)
    DspShow ("HDG", "set")
    ipc.sleep(200)
    FNX_DspHDG()
end

function FNX_GLSD_FCU_HDG_managed ()
    local Lvar = "L:S_FCU_HEADING"
    local Lval = ipc.readLvar(Lvar)
    _loggg('HDGMODE=' .. Lval)
    ipc.writeLvar(Lvar, Lval - 1)
    DspShow ("HDG", "mngd")
    ipc.sleep(200)
    FNX_DspHDG()
end

-- $$ Altitude

function FNX_GLSD_FCU_ALT_inc()
    local Lvar = "L:S_FCU_ALTITUDE_SCALE"
    local Lval = ipc.readLvar(Lvar)
    if Lval == nil then
        AltStep = 10
    elseif Lval == 0 then
        AltStep = 1
    else
        AltStep = 10
    end

    local Lvar = "L:E_FCU_ALTITUDE"
    local Lval = ipc.readLvar(Lvar)
    _loggg('ALTval=' .. Lval .. ' ' .. AltStep)

    local alt = Lval + 1
    if alt > 49 then alt = 49 end

    _loggg('ALT=' .. alt)
    ipc.writeLvar(Lvar, alt)

    DspALT(alt * 10)
    ipc.sleep(50)
end

function FNX_GLSD_FCU_ALT_dec()
    local Lvar = "L:S_FCU_ALTITUDE_SCALE"
    local Lval = ipc.readLvar(Lvar)
    if Lval == nil then
        AltStep = 10
    elseif Lval == 0 then
        AltStep = 1
    else
        AltStep = 10
    end

    local Lvar = "L:E_FCU_ALTITUDE"
    local Lval = ipc.readLvar(Lvar)
    local alt = Lval - 1
    _loggg('ALT=' .. alt)
    ipc.writeLvar(Lvar, alt)

    if alt < 1 then alt = 1 end

    DspALT(alt * 10)
    ipc.sleep(50)
end

function FNX_GLSD_FCU_ALT_selected ()
    local Lvar = "L:S_FCU_ALTITUDE"
    local Lval = ipc.readLvar(Lvar)
    _loggg('ALTMODE=' .. Lval)
    ipc.writeLvar(Lvar, Lval + 1)
    DspShow ("ALT", "set")
    FNX_DspALT()
end

function FNX_GLSD_FCU_ALT_managed ()
    local Lvar = "L:S_FCU_ALTITUDE"
    local Lval = ipc.readLvar(Lvar)
    _loggg('ALTMODE=' .. Lval)
    ipc.writeLvar(Lvar, Lval - 1)
    DspShow ("ALT", "mngd")
    FNX_DspALT()
end

function FNX_GLSD_FCU_ALT_STEP_100()
    ipc.writeLvar("L:S_FCU_ALTITUDE_SCALE", 0)
    DspShow("STEP","100")
end

function FNX_GLSD_FCU_ALT_STEP_1000()
    ipc.writeLvar("L:S_FCU_ALTITUDE_SCALE", 1)
    DspShow("STEP","1000")
end

function FNX_GLSD_FCU_ALT_STEP_toggle()
    step = ipc.readLvar("L:S_FCU_ALTITUDE_SCALE")
    if step == 0 then
        FNX_GLSD_FCU_ALT_STEP_1000()
    else
        FNX_GLSD_FCU_ALT_STEP_100()
    end
end

-- $$ Vertical Speed

function FNX_GLSD_FCU_VS_inc()
    local Lvar = "L:E_FCU_VS"
    local Lval = ipc.readLvar(Lvar)
    _loggg('VS=' .. Lval)
    ipc.writeLvar(Lvar, Lval + 1)
    _sleep(40)
    FNX_DspVVS ()
end

function FNX_GLSD_FCU_VS_dec()
    local Lvar = "L:E_FCU_VS"
    local Lval = ipc.readLvar(Lvar)
    _loggg('VS=' .. Lval)
    ipc.writeLvar(Lvar, Lval - 1)
    _sleep(40)
    FNX_DspVVS ()
end

function FNX_GLSD_FCU_VS_MODE_push ()
    ipc.control(EvtPtr + 27)
    DspShow ("VS", "push")
    FNX_DspVVS ()
end

function FNX_GLSD_FCU_VS_MODE_pull ()
    ipc.control(EvtPtr + 28)
    DspShow ("VS", "pull")
    FNX_DspVVS ()
end

function FNX_GLSD_FCU_VS_selected ()
    local Lvar = "L:S_FCU_VERTICAL_SPEED"
    local Lval = ipc.readLvar(Lvar)
    _loggg('VSMODE=' .. Lval)
    ipc.writeLvar(Lvar, Lval + 1)
    DspShow ("VS", "set")
    FNX_DspVVS ()
end

function FNX_GLSD_FCU_VS_managed ()
    local Lvar = "L:S_FCU_VERTICAL_SPEED"
    local Lval = ipc.readLvar(Lvar)
    _loggg('ALTMODE=' .. Lval)
    ipc.writeLvar(Lvar, Lval - 1)
    DspShow ("VS", "mngd")
    FNX_DspVVS ()
end

-- ## Glareshield - Warn/Caution Left #####################

function FNX_GLSD_ATTNL_WARNING_push ()
    ipc.writeLvar("L:S_MIP_MASTER_WARNING_CAPT", 1)
    DspShow('WARN','capt')
    ipc.sleep(100)
    ipc.writeLvar("L:S_MIP_MASTER_WARNING_CAPT", 0)
end

function FNX_GLSD_ATTNL_CAUTION_push ()
    ipc.writeLvar("L:S_MIP_MASTER_CAUTION_CAPT",1)
    DspShow('CAUT','capt')
    ipc.sleep(100)
    ipc.writeLvar("L:S_MIP_MASTER_CAUTION_CAPT", 0)
end

function FNX_GLSD_ATTNL_WARNCAUT_both ()
    FNX_GLSD_ATTNL_WARNING_push ()
    FNX_GLSD_ATTNL_CAUTION_push ()
    FNX_PED_ECAM_clrl()   -- clear ECAM for AP disconnect
end

-- ## Glareshield - EFIS Left  #####################

-- $$ EFISL FD/LS

function FNX_GLSD_EFISL_FD_on()
    if ipc.readLvar("I_FCU_EFIS1_FD") ~= 1 then
		ipc.writeLvar("L:S_FCU_EFIS1_FD", 1)
		DspShow('FD L','on')
		ipc.sleep(100)
		ipc.writeLvar("L:S_FCU_EFIS1_FD", 0)
    end

end

function FNX_GLSD_EFISL_FD_off()
    if ipc.readLvar("I_FCU_EFIS1_FD") == 1 then
		ipc.writeLvar("L:S_FCU_EFIS1_FD", 1)
		DspShow('FD L','off')
		ipc.sleep(100)
		ipc.writeLvar("L:S_FCU_EFIS1_FD", 0)
	end
end

function FNX_GLSD_EFISL_FD_toggle()
    ipc.writeLvar("L:S_FCU_EFIS1_FD", 1)
    DspShow('FD','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_EFIS1_FD", 0)
end

function FNX_GLSD_EFISL_LS_on()
    if ipc.readLvar("I_FCU_EFIS1_LS") ~= 1 then
		ipc.writeLvar("L:S_FCU_EFIS1_LS", 1)
		DspShow('LS L','on')
		ipc.sleep(100)
		ipc.writeLvar("L:S_FCU_EFIS1_LS", 0)
    end
end

function FNX_GLSD_EFISL_LS_off()
    if ipc.readLvar("I_FCU_EFIS1_LS") == 1 then
		ipc.writeLvar("L:S_FCU_EFIS1_LS", 1)
		DspShow('LS L','off')
		ipc.sleep(100)
		ipc.writeLvar("L:S_FCU_EFIS1_LS", 0)
	end
end

function FNX_GLSD_EFISL_LS_toggle()
    ipc.writeLvar("L:S_FCU_EFIS1_LS", 1)
    DspShow('LS L','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_EFIS1_LS", 0)
end

-- $$ EFISL BARO Reference

function FNX_GLSD_EFISL_BARO_inc()
    local Lvar = "L:E_FCU_EFIS1_BARO"
    local Lval = ipc.readLvar(Lvar)
    _loggg('BARO=' .. Lval)
    ipc.writeLvar(Lvar, Lval + 1)
    DspShow('BARO','inc')
end

function FNX_GLSD_EFISL_BARO_dec()
    local Lvar = "L:E_FCU_EFIS1_BARO"
    local Lval = ipc.readLvar(Lvar)
    _loggg('BARO=' .. Lval)
    ipc.writeLvar(Lvar, Lval - 1)
    DspShow('BARO','dec')
end

function FNX_GLSD_EFISL_BARO_HPa()
    ipc.writeLvar("L:S_FCU_EFIS1_BARO_MODE", 1)
    BaroMode = 1
    DspShow('BARO','HPa')
end

function FNX_GLSD_EFISL_BARO_InHg()
    ipc.writeLvar("L:S_FCU_EFIS1_BARO_MODE", 0)
    BaroMode = 0
    DspShow('BARO','InHg')
end

function FNX_GLSD_EFISL_BARO_UNIT_toggle()
    if ipc.readLvar("L:S_FCU_EFIS1_BARO_MODE") == 0 then
        FNX_GLSD_EFISL_BARO_HPa()
    else
        FNX_GLSD_EFISL_BARO_InHg()
    end
end

function FNX_GLSD_EFISL_BARO_qfe()
    ipc.writeLvar("L:S_FCU_EFIS1_BARO_STD",0)
    BaroRef = 0
    DspShow('BARO', 'qfe')
end

function FNX_GLSD_EFISL_BARO_qnh()
    ipc.writeLvar("L:S_FCU_EFIS1_BARO_STD",0)
    ipc.writeLvar("L:S_FCU_EFIS2_BARO_STD",0) -- sync L-R
    BaroRef = 1
    DspShow('BARO', 'qnh')
end

function FNX_GLSD_EFISL_BARO_std()
    ipc.writeLvar("L:S_FCU_EFIS1_BARO_STD",1)
    ipc.writeLvar("L:S_FCU_EFIS2_BARO_STD",1) -- sync L-R
    DspShow('BARO', 'std')
end

function FNX_GLSD_EFISL_BARO_pull()
    FNX_GLSD_EFISL_BARO_std()
end

function FNX_GLSD_EFISL_BARO_push()
    Lval = ipc.readLvar("L:S_FCU_EFIS1_BARO_STD")
    _loggg('BARO-STD=' .. Lval)
    if Lval == 1 then
        FNX_GLSD_EFISL_BARO_qnh()
    elseif Lval == 1 then
        FNX_GLSD_EFISL_BARO_qfe()
    elseif BaroRef > 0 then
        FNX_GLSD_EFISL_BARO_qnh()
    else
        FNX_GLSD_EFISL_BARO_qfe()
    end
end

function FNX_GLSD_EFISL_BARO_toggle()
    Lval = ipc.readLvar("L:S_FCU_EFIS1_BARO_STD")
    if Lval > 0 then
        FNX_GLSD_EFISL_BARO_push()
    else
        FNX_GLSD_EFISL_BARO_pull()
    end
end

-- $$ EFISL ND Mode

function FNX_GLSD_EFISL_NDMODE1_ls()
     ipc.writeLvar("L:S_FCU_EFIS1_ND_MODE", 0)
     DspShow('NDM','ls')
end

function FNX_GLSD_EFISL_NDMODE1_vor()
     ipc.writeLvar("L:S_FCU_EFIS1_ND_MODE", 1)
     DspShow('NDM','vor')
end

function FNX_GLSD_EFISL_NDMODE1_nav()
     ipc.writeLvar("L:S_FCU_EFIS1_ND_MODE", 2)
     DspShow('NDM','nav')
end

function FNX_GLSD_EFISL_NDMODE1_arc()
     ipc.writeLvar("L:S_FCU_EFIS1_ND_MODE", 3)
     DspShow('NDM','arc')
end

function FNX_GLSD_EFISL_NDMODE1_plan()
     ipc.writeLvar("L:S_FCU_EFIS1_ND_MODE", 4)
     DspShow('NDM','plan')
end

function FNX_GLSD_EFISL_NDMODE1_inc()
     local mode = ipc.readLvar("L:S_FCU_EFIS1_ND_MODE")
     if mode >= 4 then mode = 4 else mode = mode + 1 end
     ipc.writeLvar("L:S_FCU_EFIS1_ND_MODE", mode)
end

function FNX_GLSD_EFISL_NDMODE1_dec()
     local mode = ipc.readLvar("L:S_FCU_EFIS1_ND_MODE")
     if mode <= 0 then mode = 0 else mode = mode - 1 end
     ipc.writeLvar("L:S_FCU_EFIS1_ND_MODE", mode)
end

function FNX_GLSD_EFISL_NDMODE1_cycle()
     local mode = ipc.readLvar("L:S_FCU_EFIS1_ND_MODE")
     if mode < 4 then
        FNX_GLSD_EFISL_NDMODE1_inc()
     else
        FNX_GLSD_EFISL_NDMODE1_ls()
     end
end

-- $$ EFISL ND Range --------------------------------------

function FNX_GLSD_EFISL_NDRANGE1_10()
     ipc.writeLvar("L:S_FCU_EFIS1_ND_ZOOM", 0)
     DspShow('NDR','10')
end

function FNX_GLSD_EFISL_NDRANGE1_20()
     ipc.writeLvar("L:S_FCU_EFIS1_ND_ZOOM", 1)
     DspShow('NDR','20')
end

function FNX_GLSD_EFISL_NDRANGE1_40()
     ipc.writeLvar("L:S_FCU_EFIS1_ND_ZOOM", 2)
     DspShow('NDR','40')
end

function FNX_GLSD_EFISL_NDRANGE1_80()
     ipc.writeLvar("L:S_FCU_EFIS1_ND_ZOOM", 3)
     DspShow('NDR','80')
end

function FNX_GLSD_EFISL_NDRANGE1_160()
     ipc.writeLvar("L:S_FCU_EFIS1_ND_ZOOM", 4)
     DspShow('NDR','160')
end

function FNX_GLSD_EFISL_NDRANGE1_320()
     ipc.writeLvar("L:S_FCU_EFIS1_ND_ZOOM", 5)
     DspShow('NDR','320')
end

function FNX_GLSD_EFISL_NDRANGE1_inc()
     local rng = ipc.readLvar("L:S_FCU_EFIS1_ND_ZOOM")
     if rng >= 5 then rng = 5 else rng = rng + 1 end
     ipc.writeLvar("L:S_FCU_EFIS1_ND_ZOOM", rng)
end

function FNX_GLSD_EFISL_NDRANGE1_dec()
     local rng = ipc.readLvar("L:S_FCU_EFIS1_ND_ZOOM")
     if rng <= 0 then rng = 0 else rng = rng - 1 end
     ipc.writeLvar("L:S_FCU_EFIS1_ND_ZOOM", rng)
end

function FNX_GLSD_EFISL_NDRANGE1_cycle()
     local rng = ipc.readLvar("L:S_FCU_EFIS1_ND_ZOOM")
     if rng < 5 then
        FNX_GLSD_EFISL_NDRANGE1_inc()
     else
        FNX_GLSD_EFISL_NDRANGE1_10()
     end
end

-- $$ EFISL Option Buttons

function FNX_GLSD_EFISL_cstr()
    ipc.writeLvar("L:S_FCU_EFIS1_CSTR", 1)
    DspShow('CSTR','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_EFIS1_CSTR", 0)
end

function FNX_GLSD_EFISL_wpt()
    ipc.writeLvar("L:S_FCU_EFIS1_WPT", 1)
    DspShow('WPT','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_EFIS1_WPT", 0)
end

function FNX_GLSD_EFISL_vor()
    ipc.writeLvar("L:S_FCU_EFIS1_VORD", 1)
    DspShow('VORD','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_EFIS1_VORD", 0)
end

function FNX_GLSD_EFISL_ndb()
    ipc.writeLvar("L:S_FCU_EFIS1_NDB", 1)
    DspShow('NDB','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_EFIS1_NDB", 0)
end

function FNX_GLSD_EFISL_aprt()
    ipc.writeLvar("L:S_FCU_EFIS1_ARPT", 1)
    DspShow('ARPT','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_EFIS1_ARPT", 0)
end

-- $$ EFISL Nav Aid Switches Capt

function FNX_GLSD_EFISL_NAVAID1_adf()
    Lvar = "L:S_FCU_EFIS1_NAV1"
    Lval = ipc.readLvar(Lvar)
    opt = 0
    if Lval ~= opt then
        ipc.writeLvar(Lvar, opt)
        DspShow('NAV1', 'adf')
    end
end

function FNX_GLSD_EFISL_NAVAID1_off()
    Lvar = "L:S_FCU_EFIS1_NAV1"
    Lval = ipc.readLvar(Lvar)
    opt = 1
    if Lval ~= opt then
        ipc.writeLvar(Lvar, opt)
        DspShow('NAV1', 'off')
    end
end

function FNX_GLSD_EFISL_NAVAID1_vor()
    Lvar = "L:S_FCU_EFIS1_NAV1"
    Lval = ipc.readLvar(Lvar)
    opt = 2
    if Lval ~= opt then
        ipc.writeLvar(Lvar, opt)
        DspShow('NAV1', 'vor')
    end
end

function FNX_GLSD_EFISL_NAVAID2_adf()
    Lvar = "L:S_FCU_EFIS1_NAV2"
    Lval = ipc.readLvar(Lvar)
    opt = 0
    if Lval ~= opt then
        ipc.writeLvar(Lvar, opt)
        DspShow('NAV2', 'adf')
    end
end

function FNX_GLSD_EFISL_NAVAID2_off()
    Lvar = "L:S_FCU_EFIS1_NAV2"
    Lval = ipc.readLvar(Lvar)
    opt = 1
    if Lval ~= opt then
        ipc.writeLvar(Lvar, opt)
        DspShow('NAV2', 'off')
    end
end

function FNX_GLSD_EFISL_NAVAID2_vor()
    Lvar = "L:S_FCU_EFIS1_NAV2"
    Lval = ipc.readLvar(Lvar)
    opt = 2
    if Lval ~= opt then
        ipc.writeLvar(Lvar, opt)
        DspShow('NAV2', 'vor')
    end
end
-- ## Glareshield - EFIS Right

-- $$ EFISR ND Mode

function FNX_GLSD_EFISR_NDMODE1_ls()
     ipc.writeLvar("L:S_FCU_EFIS2_ND_MODE", 0)
     DspShow('NDM','ls')
end

function FNX_GLSD_EFISR_NDMODE1_vor()
     ipc.writeLvar("L:S_FCU_EFIS2_ND_MODE", 1)
     DspShow('NDM','vor')
end

function FNX_GLSD_EFISR_NDMODE1_nav()
     ipc.writeLvar("L:S_FCU_EFIS2_ND_MODE", 2)
     DspShow('NDM','nav')
end

function FNX_GLSD_EFISR_NDMODE1_arc()
     ipc.writeLvar("L:S_FCU_EFIS2_ND_MODE", 3)
     DspShow('NDM','arc')
end

function FNX_GLSD_EFISR_NDMODE1_plan()
     ipc.writeLvar("L:S_FCU_EFIS2_ND_MODE", 4)
     DspShow('NDM','plan')
end

function FNX_GLSD_EFISR_NDMODE1_inc()
     local mode = ipc.readLvar("L:S_FCU_EFIS2_ND_MODE")
     if mode >= 4 then mode = 4 else mode = mode + 1 end
     ipc.writeLvar("L:S_FCU_EFIS2_ND_MODE", mode)
end

function FNX_GLSD_EFISR_NDMODE1_dec()
     local mode = ipc.readLvar("L:S_FCU_EFIS2_ND_MODE")
     if mode <= 0 then mode = 0 else mode = mode - 1 end
     ipc.writeLvar("L:S_FCU_EFIS2_ND_MODE", mode)
end

function FNX_GLSD_EFISR_NDMODE1_cycle()
     local mode = ipc.readLvar("L:S_FCU_EFIS2_ND_MODE")
     if mode < 4 then
        FNX_GLSD_EFISR_NDMODE1_inc()
     else
        FNX_GLSD_EFISR_NDMODE1_ls()
     end
end

-- $$ EFISR ND Range --------------------------------------

function FNX_GLSD_EFISR_NDRANGE1_10()
     ipc.writeLvar("L:S_FCU_EFIS2_ND_ZOOM", 0)
     DspShow('NDR','10')
end

function FNX_GLSD_EFISR_NDRANGE1_20()
     ipc.writeLvar("L:S_FCU_EFIS2_ND_ZOOM", 1)
     DspShow('NDR','20')
end

function FNX_GLSD_EFISR_NDRANGE1_40()
     ipc.writeLvar("L:S_FCU_EFIS2_ND_ZOOM", 2)
     DspShow('NDR','40')
end

function FNX_GLSD_EFISR_NDRANGE1_80()
     ipc.writeLvar("L:S_FCU_EFIS2_ND_ZOOM", 3)
     DspShow('NDR','80')
end

function FNX_GLSD_EFISR_NDRANGE1_160()
     ipc.writeLvar("L:S_FCU_EFIS2_ND_ZOOM", 4)
     DspShow('NDR','160')
end

function FNX_GLSD_EFISR_NDRANGE1_320()
     ipc.writeLvar("L:S_FCU_EFIS2_ND_ZOOM", 5)
     DspShow('NDR','320')
end

function FNX_GLSD_EFISR_NDRANGE1_inc()
     local rng = ipc.readLvar("L:S_FCU_EFIS2_ND_ZOOM")
     if rng >= 5 then rng = 5 else rng = rng + 1 end
     ipc.writeLvar("L:S_FCU_EFIS2_ND_ZOOM", rng)
end

function FNX_GLSD_EFISR_NDRANGE1_dec()
     local rng = ipc.readLvar("L:S_FCU_EFIS2_ND_ZOOM")
     if rng <= 0 then rng = 0 else rng = rng - 1 end
     ipc.writeLvar("L:S_FCU_EFIS2_ND_ZOOM", rng)
end

function FNX_GLSD_EFISR_NDRANGE1_cycle()
     local rng = ipc.readLvar("L:S_FCU_EFIS2_ND_ZOOM")
     if rng < 5 then
        FNX_GLSD_EFISR_NDRANGE1_inc()
     else
        FNX_GLSD_EFISR_NDRANGE1_10()
     end
end

-- $$ EFISR Option Buttons FO

function FNX_GLSD_EFISR_cstr()
    ipc.writeLvar("L:S_FCU_EFIS2_CSTR", 1)
    DspShow('CSTR','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_EFIS2_CSTR", 0)
end

function FNX_GLSD_EFISR_wpt()
    ipc.writeLvar("L:S_FCU_EFIS2_WPT", 1)
    DspShow('WPT','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_EFIS2_WPT", 0)
end

function FNX_GLSD_EFISR_vor()
    ipc.writeLvar("L:S_FCU_EFIS2_VORD", 1)
    DspShow('VORD','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_EFIS2_VORD", 0)
end

function FNX_GLSD_EFISR_ndb()
    ipc.writeLvar("L:S_FCU_EFIS2_NDB", 1)
    DspShow('NDB','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_EFIS2_NDB", 0)
end

function FNX_GLSD_EFISR_aprt()
    ipc.writeLvar("L:S_FCU_EFIS2_ARPT", 1)
    DspShow('ARPT','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_EFIS2_ARPT", 0)
end

-- $$ EFISR Nav Aid Switches FO

function FNX_GLSD_EFISR_NAVAID1_adf()
    Lvar = "L:S_FCU_EFIS2_NAV1"
    Lval = ipc.readLvar(Lvar)
    opt = 0
    if Lval ~= opt then
        ipc.writeLvar(Lvar, opt)
        DspShow('NAV1', 'adf')
    end
end

function FNX_GLSD_EFISR_NAVAID1_off()
    Lvar = "L:S_FCU_EFIS2_NAV1"
    Lval = ipc.readLvar(Lvar)
    opt = 1
    if Lval ~= opt then
        ipc.writeLvar(Lvar, opt)
        DspShow('NAV1', 'off')
    end
end

function FNX_GLSD_EFISR_NAVAID1_vor()
    Lvar = "L:S_FCU_EFIS2_NAV1"
    Lval = ipc.readLvar(Lvar)
    opt = 2
    if Lval ~= opt then
        ipc.writeLvar(Lvar, opt)
        DspShow('NAV1', 'vor')
    end
end

function FNX_GLSD_EFISR_NAVAID2_adf()
    Lvar = "L:S_FCU_EFIS2_NAV2"
    Lval = ipc.readLvar(Lvar)
    opt = 0
    if Lval ~= opt then
        ipc.writeLvar(Lvar, opt)
        DspShow('NAV2', 'adf')
    end
end

function FNX_GLSD_EFISR_NAVAID2_off()
    Lvar = "L:S_FCU_EFIS2_NAV2"
    Lval = ipc.readLvar(Lvar)
    opt = 1
    if Lval ~= opt then
        ipc.writeLvar(Lvar, opt)
        DspShow('NAV2', 'off')
    end
end

function FNX_GLSD_EFISR_NAVAID2_vor()
    Lvar = "L:S_FCU_EFIS2_NAV2"
    Lval = ipc.readLvar(Lvar)
    opt = 2
    if Lval ~= opt then
        ipc.writeLvar(Lvar, opt)
        DspShow('NAV2', 'vor')
    end
end

-- $$ EFISR FD/LS FO

function FNX_GLSD_EFISR_FD_on()
    if ipc.readLvar("I_FCU_EFIS2_FD") ~= 1 then
		ipc.writeLvar("L:S_FCU_EFIS2_FD", 1)
		DspShow('FD R','on')
		ipc.sleep(100)
		ipc.writeLvar("L:S_FCU_EFIS2_FD", 0)
    end

end

function FNX_GLSD_EFISR_FD_off()
    if ipc.readLvar("I_FCU_EFIS2_FD") == 1 then
		ipc.writeLvar("L:S_FCU_EFIS2_FD", 1)
		DspShow('FD R','off')
		ipc.sleep(100)
		ipc.writeLvar("L:S_FCU_EFIS2_FD", 0)
	end
end

function FNX_GLSD_EFISR_FD_toggle()
    ipc.writeLvar("L:S_FCU_EFIS2_FD", 1)
    DspShow('FD R','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_EFIS2_FD", 0)
end

function FNX_GLSD_EFISR_LS_on()
    if ipc.readLvar("I_FCU_EFIS2_LS") ~= 1 then
		ipc.writeLvar("L:S_FCU_EFIS2_LS", 1)
		DspShow('LS R','on')
		ipc.sleep(100)
		ipc.writeLvar("L:S_FCU_EFIS2_LS", 0)
    end
end

function FNX_GLSD_EFISR_LS_off()
    if ipc.readLvar("I_FCU_EFIS2_LS") == 1 then
		ipc.writeLvar("L:S_FCU_EFIS2_LS", 1)
		DspShow('LS R','off')
		ipc.sleep(100)
		ipc.writeLvar("L:S_FCU_EFIS2_LS", 0)
	end
end

function FNX_GLSD_EFISR_LS_toggle()
    ipc.writeLvar("L:S_FCU_EFIS2_LS", 1)
    DspShow('LS R','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_EFIS2_LS", 0)
end

-- $$ EFISR BARO Reference FO

function FNX_GLSD_EFISR_BARO_inc()
    local Lvar = "L:E_FCU_EFIS2_BARO"
    local Lval = ipc.readLvar(Lvar)
    _loggg('BARO=' .. Lval)
    ipc.writeLvar(Lvar, Lval + 1)
    DspShow('BARO','inc')
end

function FNX_GLSD_EFISR_BARO_dec()
    local Lvar = "L:E_FCU_EFIS2_BARO"
    local Lval = ipc.readLvar(Lvar)
    _loggg('BARO=' .. Lval)
    ipc.writeLvar(Lvar, Lval - 1)
    DspShow('BARO','dec')
end

function FNX_GLSD_EFISR_BARO_HPa()
    ipc.writeLvar("L:S_FCU_EFIS2_BARO_MODE", 1)
    BaroMode = 1
    DspShow('BARO','HPa')
end

function FNX_GLSD_EFISR_BARO_InHg()
    ipc.writeLvar("L:S_FCU_EFIS2_BARO_MODE", 0)
    BaroMode = 0
    DspShow('BARO','InHg')
end

function FNX_GLSD_EFISR_BARO_UNIT_toggle()
    if ipc.readLvar("L:S_FCU_EFIS2_BARO_MODE") == 0 then
        FNX_GLSD_EFISR_BARO_HPa()
    else
        FNX_GLSD_EFISR_BARO_InHg()
    end
end

function FNX_GLSD_EFISR_BARO_qfe()
    ipc.writeLvar("L:S_FCU_EFIS2_BARO_STD",0)
    BaroRef = 0
    DspShow('BARO', 'qfe')
end

function FNX_GLSD_EFISR_BARO_qnh()
    --ipc.writeLvar("L:S_FCU_EFIS2_BARO_STD",0)
    ipc.writeLvar("L:S_FCU_EFIS2_BARO_STD",0) -- sync L-R
    BaroRef = 1
    DspShow('BARO', 'qnh')
end

function FNX_GLSD_EFISR_BARO_std()
    --ipc.writeLvar("L:S_FCU_EFIS1_BARO_STD",1)
    ipc.writeLvar("L:S_FCU_EFIS2_BARO_STD",1) -- sync L-R
    DspShow('BARO', 'std')
end

function FNX_GLSD_EFISR_BARO_pull()
    FNX_GLSD_EFISR_BARO_std()
end

function FNX_GLSD_EFISR_BARO_push()
    Lval = ipc.readLvar("L:S_FCU_EFIS2_BARO_STD")
    _loggg('BARO-STD=' .. Lval)
    if Lval == 1 then
        FNX_GLSD_EFISR_BARO_qnh()
    elseif Lval == 1 then
        FNX_GLSD_EFISR_BARO_qfe()
    elseif BaroRef > 0 then
        FNX_GLSD_EFISR_BARO_qnh()
    else
        FNX_GLSD_EFISR_BARO_qfe()
    end
end

function FNX_GLSD_EFISR_BARO_toggle()
    Lval = ipc.readLvar("L:S_FCU_EFIS2_BARO_STD")
    if Lval > 0 then
        FNX_GLSD_EFISR_BARO_push()
    else
        FNX_GLSD_EFISR_BARO_pull()
    end
end

-- ## Glareshield - Warn/Caution FO #####################

function FNX_GLSD_ATTNR_WARNING_push ()
    ipc.writeLvar("L:S_MIP_MASTER_WARNING_FO", 1)
    DspShow('WARN','fo')
    ipc.sleep(100)
    ipc.writeLvar("L:S_MIP_MASTER_WARNING_FO", 0)
end

function FNX_GLSD_ATTNR_CAUTION_push ()
    ipc.writeLvar("L:S_MIP_MASTER_CAUTION_FO",1)
    DspShow('CAUT','fo')
    ipc.sleep(100)
    ipc.writeLvar("L:S_MIP_MASTER_CAUTION_FO", 0)
end

function FNX_GLSD_ATTNR_WARNCAUT_both ()
    FNX_GLSD_ATTNR_WARNING_push ()
    FNX_GLSD_ATTNR_CAUTION_push ()
    FNX_PED_ECAM_clrl()   -- clear ECAM for AP disconnect
end

-- ## Overhead - External Lights #####################################

-- $$ Strobe Lights

function FNX_OVHD_EXTLT_STROBE_auto()
    ipc.writeLvar("L:S_OH_EXT_LT_STROBE", 1)
    DspShow('STRB','auto')
end

function FNX_OVHD_EXTLT_STROBE_on()
    ipc.writeLvar("L:S_OH_EXT_LT_STROBE", 2)
    DspShow('STRB','on')
end

function FNX_OVHD_EXTLT_STROBE_off()
    ipc.writeLvar("L:S_OH_EXT_LT_STROBE", 0)
    DspShow('STRB','off')
end

function FNX_OVHD_EXTLT_STROBE_toggle()
    local Lvar = "L:S_OH_EXT_LT_STROBE"
    local Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        FNX_OVHD_EXTLT_STROBE_off()
    else
        FNX_OVHD_EXTLT_STROBE_on()
    end
end

function FNX_OVHD_EXTLT_STROBE_cycle()
    local Lvar = "S_OH_EXT_LT_STROBE"
    local Lval = ipc.readLvar(Lvar)
    if Lval == 0 then
        FNX_OVHD_EXTLT_STROBE_auto()
    elseif Lval == 1 then
        FNX_OVHD_EXTLT_STROBE_on()
    else
        FNX_OVHD_EXTLT_STROBE_off()
    end
end

-- $$ Beacon Lights

function FNX_OVHD_EXTLT_BEACON_on ()
    ipc.writeLvar("L:S_OH_EXT_LT_BEACON", 1)
    DspShow('BCN','on')
end

function FNX_OVHD_EXTLT_BEACON_off()
    ipc.writeLvar("L:S_OH_EXT_LT_BEACON", 0)
    DspShow('BCN','off')
end

function FNX_OVHD_EXTLT_BEACON_toggle()
    local Lvar = "L:S_OH_EXT_LT_BEACON"
    local Lval = ipc.readLvar(Lvar)
    if Lval == 0 then
        FNX_OVHD_EXTLT_BEACON_on()
    else
        FNX_OVHD_EXTLT_BEACON_off()
    end
end

-- $$ Wing Lights

function FNX_OVHD_EXTLT_WING_on()
    ipc.writeLvar("L:S_OH_EXT_LT_WING", 1)
    DspShow('WING','on')
end

function FNX_OVHD_EXTLT_WING_off()
    ipc.writeLvar("L:S_OH_EXT_LT_WING", 0)
    DspShow('WING','off')
end

function FNX_OVHD_EXTLT_WING_toggle()
    local Lvar = "L:S_OH_EXT_LT_WING"
    local Lval = ipc.readLvar(Lvar)
    if Lval == 0 then
        FNX_OVHD_EXTLT_WING_on()
    else
        FNX_OVHD_EXTLT_WING_off()
    end
end

-- $$ Navigation Lights

function FNX_OVHD_EXTLT_NAV_2()
    ipc.writeLvar("L:S_OH_EXT_LT_NAV_LOGO", 2)
    DspShow('NAV','1')
end

function FNX_OVHD_EXTLT_NAV_1()
    ipc.writeLvar("L:S_OH_EXT_LT_NAV_LOGO", 1)
    DspShow('NAV','1')
end

function FNX_OVHD_EXTLT_NAV_off()
    ipc.writeLvar("L:S_OH_EXT_LT_NAV_LOGO", 0)
    DspShow('NAV','off')
end

function FNX_OVHD_EXTLT_NAV_toggle()
    local Lvar = "L:S_OH_EXT_LT_NAV_LOGO"
    local Lval = ipc.readLvar(Lvar)
    if Lval == 0 then
        FNX_OVHD_EXTLT_NAV_2()
    else
        FNX_OVHD_EXTLT_NAV_off()
    end
end

function FNX_OVHD_EXTLT_NAV_cycle()
    local Lvar = "L:S_OH_EXT_LT_NAV_LOGO"
    local Lval = ipc.readLvar(Lvar)
    if Lval == 0 then
        FNX_OVHD_EXTLT_NAV_1()
    elseif Lval == 1 then
        FNX_OVHD_EXTLT_NAV_2()
    else
        FNX_OVHD_EXTLT_NAV_off()
    end
end

-- $$ Runway Turn Off

function FNX_OVHD_EXTLT_RWYTURN_on()
    ipc.writeLvar("L:S_OH_EXT_LT_RWY_TURNOFF", 1)
    DspShow('RWYT','on')
end

function FNX_OVHD_EXTLT_RWYTURN_off()
    ipc.writeLvar("L:S_OH_EXT_LT_RWY_TURNOFF", 0)
    DspShow('RWYT','off')
end

function FNX_OVHD_EXTLT_RWYTURN_toggle()
    local Lvar = "L:S_OH_EXT_LT_RWY_TURNOFF"
    local Lval = ipc.readLvar(Lvar)
    if Lval == 1 then
        FNX_OVHD_EXTLT_RWYTURN_off()
    else
        FNX_OVHD_EXTLT_RWYTURN_on()
    end
end

-- $$ Landing Lights

function FNX_OVHD_EXTLT_LAND_L_retract()
    ipc.writeLvar("L:S_OH_EXT_LT_LANDING_L", 0)
    DspShow('LNDL','retr')
end

function FNX_OVHD_EXTLT_LAND_L_off()
    ipc.writeLvar("L:S_OH_EXT_LT_LANDING_L", 1)
    DspShow('LNDL','off')
end

function FNX_OVHD_EXTLT_LAND_L_on()
    ipc.writeLvar("L:S_OH_EXT_LT_LANDING_L", 2)
    DspShow('LNDL','on')
end

function FNX_OVHD_EXTLT_LAND_L_toggle()
    local Lvar = "L:S_OH_EXT_LT_LANDING_L"
    local Lval = ipc.readLvar(Lvar)
    if Lval == 0 then
        FNX_OVHD_EXTLT_LAND_L_on()
    else
        FNX_OVHD_EXTLT_LAND_L_retract()
    end
end

function FNX_OVHD_EXTLT_LAND_L_cycle()
    local Lvar = "L:S_OH_EXT_LT_LANDING_L"
    local Lval = ipc.readLvar(Lvar)
    if Lval == 0 then
        FNX_OVHD_EXTLT_LAND_L_off()
    elseif Lval == 1 then
        FNX_OVHD_EXTLT_LAND_L_on()
    else
        FNX_OVHD_EXTLT_LAND_L_retract()
    end
end

function FNX_OVHD_EXTLT_LAND_R_retract()
    ipc.writeLvar("L:S_OH_EXT_LT_LANDING_R", 0)
    DspShow('LNDR','retr')
end

function FNX_OVHD_EXTLT_LAND_R_off()
    ipc.writeLvar("L:S_OH_EXT_LT_LANDING_R", 1)
    DspShow('LNDR','off')
end

function FNX_OVHD_EXTLT_LAND_R_on()
    ipc.writeLvar("L:S_OH_EXT_LT_LANDING_R", 2)
    DspShow('LNDR','on')
end

function FNX_OVHD_EXTLT_LAND_R_toggle()
    local Lvar = "L:S_OH_EXT_LT_LANDING_R"
    local Lval = ipc.readLvar(Lvar)
    if Lval == 0 then
        FNX_OVHD_EXTLT_LAND_R_on()
    else
        FNX_OVHD_EXTLT_LAND_R_retract()
    end
end

function FNX_OVHD_EXTLT_LAND_R_cycle()
    local Lvar = "L:S_OH_EXT_LT_LANDING_R"
    local Lval = ipc.readLvar(Lvar)
    if Lval == 0 then
        FNX_OVHD_EXTLT_LAND_R_off()
    elseif Lval == 1 then
        FNX_OVHD_EXTLT_LAND_R_on()
    else
        FNX_OVHD_EXTLT_LAND_R_retract()
    end
end

-- $$ Nose Lights

function FNX_OVHD_EXTLT_NOSE_to()
    ipc.writeLvar("L:S_OH_EXT_LT_NOSE", 2)
    DspShow('NOSE','to')
end

function FNX_OVHD_EXTLT_NOSE_taxi()
    ipc.writeLvar("L:S_OH_EXT_LT_NOSE", 1)
    DspShow('NOSE','taxi')
end

function FNX_OVHD_EXTLT_NOSE_off()
    ipc.writeLvar("L:S_OH_EXT_LT_NOSE", 0)
    DspShow('NOSE','off')
end

function FNX_OVHD_EXTLT_NOSE_toggle()
    local Lvar = "L:S_OH_EXT_LT_NOSE"
    local Lval = ipc.readLvar(Lvar)
    if Lval == 0 then
        FNX_OVHD_EXTLT_NOSE_to()
    else
        FNX_OVHD_EXTLT_NOSE_off()
    end
end

function FNX_OVHD_EXTLT_NOSE_cycle()
    local Lvar = "L:S_OH_EXT_LT_NOSE"
    local Lval = ipc.readLvar(Lvar)
    if Lval == 0 then
        FNX_OVHD_EXTLT_NOSE_taxi()
    elseif Lval == 1 then
        FNX_OVHD_EXTLT_NOSE_to()
    else
        FNX_OVHD_EXTLT_NOSE_off()
    end
end

-- $$ All Landing

function FNX_OVHD_EXTLT_LAND_Both_retract()
     FNX_OVHD_EXTLT_LAND_L_retract()
     FNX_OVHD_EXTLT_LAND_R_retract()
end

function FNX_OVHD_EXTLT_LAND_Both_off()
     FNX_OVHD_EXTLT_LAND_L_off()
     FNX_OVHD_EXTLT_LAND_R_off()
end

function FNX_OVHD_EXTLT_LAND_Both_on()
     FNX_OVHD_EXTLT_LAND_L_on()
     FNX_OVHD_EXTLT_LAND_R_on()
end

function FNX_OVHD_EXTLT_LAND_Both_toggle()
     FNX_OVHD_EXTLT_LAND_L_toggle()
     FNX_OVHD_EXTLT_LAND_R_toggle()
end

function FNX_OVHD_EXTLT_LAND_Both_cycle()
     FNX_OVHD_EXTLT_LAND_L_cycle()
     FNX_OVHD_EXTLT_LAND_R_cycle()
end

function FNX_OVHD_EXTLT_LAND_ALL_on()
	FNX_OVHD_EXTLT_LAND_Both_on()
	FNX_OVHD_EXTLT_NOSE_to()
end

function FNX_OVHD_EXTLT_LAND_ALL_off()
	FNX_OVHD_EXTLT_LAND_Both_off()
	FNX_OVHD_EXTLT_NOSE_taxi()
end

-- ## Overhead - Internal Lights

-- $$ Seat Belt Signs

function FNX_OVHD_INTLT_SEATBELT_on()
    ipc.writeLvar("L:S_OH_SIGNS", 1)
    DspShow('SEAT', 'on')
end

function FNX_OVHD_INTLT_SEATBELT_off()
    ipc.writeLvar("L:S_OH_SIGNS", 0)
    DspShow('SEAT', 'off')
end

function FNX_OVHD_INTLT_SEATBELT_toggle()
    local Lvar = "L:S_OH_SIGNS"
    local Lval = ipc.readLvar(Lvar)
    if Lval == 0 then
        FNX_OVHD_INTLT_SEATBELT_on()
    else
        FNX_OVHD_INTLT_SEATBELT_off()
    end
end

-- $$ No Smoking Signs

function FNX_OVHD_INTLT_NOSMOKING_on()
    ipc.writeLvar("L:S_OH_SIGNS_SMOKING", 2)
    DspShow('SMOK', 'on')
end

function FNX_OVHD_INTLT_NOSMOKING_auto()
    ipc.writeLvar("L:S_OH_SIGNS_SMOKING", 1)
    DspShow('SMOK', 'auto')
end

function FNX_OVHD_INTLT_NOSMOKING_off()
    ipc.writeLvar("L:S_OH_SIGNS_SMOKING", 0)
    DspShow('SMOK', 'off')
end

function FNX_OVHD_INTLT_NOSMOKING_cycle()
    local Lvar = 'L:S_OH_SIGNS_SMOKING'
    local Lval = ipc.readLvar(Lvar)
    if Lval == nil then Lval = 1 end
    if Lval == 0 then
        FNX_OVHD_INTLT_NOSMOKING_auto()
    elseif Lval == 1 then
        FNX_OVHD_INTLT_NOSMOKING_on()
    else
        FNX_OVHD_INTLT_NOSMOKING_off()
    end
end

function FNX_OVHD_INTLT_NOSMOKING_toggle()
    local Lvar = 'L:S_OH_SIGNS_SMOKING'
    local Lval = ipc.readLvar(Lvar)
    if Lval == nil then Lval = 1 end
    if Lval == 0 then
        FNX_OVHD_INTLT_NOSMOKING_auto()
    else
        FNX_OVHD_INTLT_NOSMOKING_off()
    end
end

-- $$ Emergency Exit Lighting

function FNX_OVHD_INTLT_EMEREXIT_on()
    ipc.writeLvar("L:S_OH_INT_LT_EMER", 2)
    DspShow('EXIT', 'on')
end

function FNX_OVHD_INTLT_EMEREXIT_arm()
    ipc.writeLvar("L:S_OH_INT_LT_EMER", 1)
    DspShow('EXIT', 'auto')
end

function FNX_OVHD_INTLT_EMEREXIT_off()
    ipc.writeLvar("L:S_OH_INT_LT_EMER", 0)
    DspShow('EXIT', 'off')
end

function FNX_OVHD_INTLT_EMEREXIT_cycle()
    local Lvar = 'L:S_OH_INT_LT_EMER'
    local Lval = ipc.readLvar(Lvar)
    if Lval == nil then Lval = 1 end
    if Lval == 0 then
        FNX_OVHD_INTLT_EMEREXIT_arm()
    elseif Lval == 1 then
        FNX_OVHD_INTLT_EMEREXIT_on()
    else
        FNX_OVHD_INTLT_EMEREXIT_off()
    end
end

function FNX_OVHD_INTLT_EMEREXIT_toggle()
    local Lvar = 'L:S_OH_INT_LT_EMER'
    local Lval = ipc.readLvar(Lvar)
    if Lval == nil then Lval = 1 end
    if Lval == 0 then
        FNX_OVHD_INTLT_EMEREXIT_arm()
    else
        FNX_OVHD_INTLT_EMEREXIT_off()
    end
end

-- $$ Annuciator Lighting

function FNX_OVHD_INTLT_ANNLT_test()
    ipc.writeLvar("L:S_OH_IN_LT_ANN_LT", 2)
    DspShow('ANLT', 'test')
end

function FNX_OVHD_INTLT_ANNLT_brt()
    ipc.writeLvar("L:S_OH_IN_LT_ANN_LT", 1)
    DspShow('ANLT', 'brt')
end

function FNX_OVHD_INTLT_ANNLT_dim()
    ipc.writeLvar("L:S_OH_IN_LT_ANN_LT", 0)
    DspShow('ANLT', 'dim')
end

function FNX_OVHD_INTLT_ANNLT_cycle()
    local Lvar = 'L:S_OH_IN_LT_ANN_LT'
    local Lval = ipc.readLvar(Lvar)
    if Lval == nil then Lval = 1 end
    if Lval == 0 then
        FNX_OVHD_INTLT_ANNLT_brt()
    elseif Lval == 1 then
        FNX_OVHD_INTLT_ANNLT_test()
    else
        FNX_OVHD_INTLT_ANNLT_dim()
    end
end

function FNX_OVHD_INTLT_ANNLT_toggle()
    local Lvar = 'L:S_OH_IN_LT_ANN_LT'
    local Lval = ipc.readLvar(Lvar)
    if Lval == nil then Lval = 1 end
    if Lval == 0 then
        FNX_OVHD_INTLT_ANNLT_brt()
    else
        FNX_OVHD_INTLT_ANNLT_dim()
    end
end

-- $$ Pre / Post Flight

function FNX_OVHD_INTLT_preflt()
    FNX_OVHD_INTLT_SEATBELT_on()
    FNX_OVHD_INTLT_NOSMOKING_auto()
    FNX_OVHD_INTLT_EMEREXIT_arm()
end

function FNX_OVHD_INTLT_postflt()
    FNX_OVHD_INTLT_SEATBELT_off()
    FNX_OVHD_INTLT_NOSMOKING_off()
    FNX_OVHD_INTLT_EMEREXIT_off()
end

function FNX_OVHD_INTLT_toggle()
    FNX_OVHD_INTLT_SEATBELT_toggle()
    FNX_OVHD_INTLT_NOSMOKING_toggle()
    FNX_OVHD_INTLT_EMEREXIT_toggle()
end

-- $$ Cabin Lighting / Dome

function FNX_OVHD_INTLT_DOME_brt()
    if ipc.readLvar("L:B_LT_DOME_BRT") == 0 then
        ipc.writeLvar("L:S_OH_INT_LT_DOME", 2)
        DspShow('DOME', 'brt')
    end
end

function FNX_OVHD_INTLT_DOME_dim()
    if ipc.readLvar("L:B_LT_DOME_DIM") == 0 then
        ipc.writeLvar("L:S_OH_INT_LT_DOME", 1)
        DspShow('DOME', 'dim')
    end
end

function FNX_OVHD_INTLT_DOME_off()
    if ipc.readLvar("L:B_LT_DOME") == 1 then
        ipc.writeLvar("L:S_OH_INT_LT_DOME", 0)
        DspShow('DOME', 'off')
    end
end

function FNX_OVHD_INTLT_DOME_cycle()
    local on = ipc.readLvar("L:B_LT_DOME")
    local brt = ipc.readLvar("L:B_LT_DOME_BRT")
    local dim = ipc.readLvar("L:B_LT_DOME_DIM")
    if brt == 1 then
        FNX_OVHD_INTLT_DOME_off()
    elseif dim == 1 then
        FNX_OVHD_INTLT_DOME_brt()
    else
        FNX_OVHD_INTLT_DOME_dim()
    end
end

function FNX_OVHD_INTLT_DOME_toggle ()
    local brt = ipc.readLvar("L:B_LT_DOME_BRT")
    if brt == 0 then
        FNX_OVHD_INTLT_DOME_brt()
    else
        FNX_OVHD_INTLT_DOME_dim()
    end
end

-- ## Overhead Oxygen

function FNX_OVHD_OXY_CREWSUPPLY_on()
    Lvar = "L:S_OH_OXYGEN_CREW_OXYGEN"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('COXY','on')
    end
end

function FNX_OVHD_OXY_CREWSUPPLY_off()
    Lvar = "L:S_OH_OXYGEN_CREW_OXYGEN"
    if ipc.readLvar(Lvar) == 1 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('COXY','off')
    end
end

function FNX_OVHD_OXY_CREWSUPPLY_toggle()
    Lvar = "L:S_OH_OXYGEN_CREW_OXYGEN"
    Lval = ipc.readLvar(Lvar)
    if Lval == 0 then
        FNX_OVHD_OXY_CREWSUPPLY_on()
    else
        FNX_OVHD_OXY_CREWSUPPLY_off()
    end
end

-- ## Overhead Calls #####################################

function FNX_OVHD_CALLS_all()
    ipc.writeLvar('L:S_OH_CALLS_ALL', 1)
    DspShow('CALL','all')
    ipc.sleep(100)
    ipc.writeLvar('L:S_OH_CALLS_ALL', 0)
end

-- ## Overhead Fuel ######################################

-- $$ L1

function FNX_OVHD_FUEL_PUMP_L1_on()
    Lvar = "L:S_OH_FUEL_LEFT_1"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('F L1','on')
    end
end

function FNX_OVHD_FUEL_PUMP_L1_off()
    Lvar = "L:S_OH_FUEL_LEFT_1"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('F L1','off')
    end
end

function FNX_OVHD_FUEL_PUMP_L1_toggle()
    Lvar = "L:S_OH_FUEL_LEFT_1"
    if ipc.readLvar(Lvar) ~= 1 then
        FNX_OVHD_FUEL_PUMP_L1_on()
    else
        FNX_OVHD_FUEL_PUMP_L1_off()
    end
end

-- $$ L2

function FNX_OVHD_FUEL_PUMP_L2_on()
    Lvar = "L:S_OH_FUEL_LEFT_2"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('F L2','on')
    end
end

function FNX_OVHD_FUEL_PUMP_L2_off()
    Lvar = "L:S_OH_FUEL_LEFT_2"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('F L2','off')
    end
end

function FNX_OVHD_FUEL_PUMP_L2_toggle()
    Lvar = "L:S_OH_FUEL_LEFT_2"
    if ipc.readLvar(Lvar) ~= 1 then
        FNX_OVHD_FUEL_PUMP_L2_on()
    else
        FNX_OVHD_FUEL_PUMP_L2_off()
    end
end

-- $$ C1

function FNX_OVHD_FUEL_PUMP_C1_on()
    Lvar = "L:S_OH_FUEL_CENTER_1"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('F C1','on')
    end
end

function FNX_OVHD_FUEL_PUMP_C1_off()
    Lvar = "L:S_OH_FUEL_CENTER_1"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('F C1','off')
    end
end

function FNX_OVHD_FUEL_PUMP_C1_toggle()
    Lvar = "L:S_OH_FUEL_CENTER_1"
    if ipc.readLvar(Lvar) ~= 1 then
        FNX_OVHD_FUEL_PUMP_C1_on()
    else
        FNX_OVHD_FUEL_PUMP_C1_off()
    end
end

-- $$ C2

function FNX_OVHD_FUEL_PUMP_C2_on()
    Lvar = "L:S_OH_FUEL_CENTER_2"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('F C2','on')
    end
end

function FNX_OVHD_FUEL_PUMP_C2_off()
    Lvar = "L:S_OH_FUEL_CENTER_2"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('F C2','off')
    end
end

function FNX_OVHD_FUEL_PUMP_C2_toggle()
    Lvar = "L:S_OH_FUEL_CENTER_2"
    if ipc.readLvar(Lvar) ~= 1 then
        FNX_OVHD_FUEL_PUMP_C2_on()
    else
        FNX_OVHD_FUEL_PUMP_C2_off()
    end
end

--$$ R1

function FNX_OVHD_FUEL_PUMP_R1_on()
    Lvar = "L:S_OH_FUEL_RIGHT_1"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('F R1','on')
    end
end

function FNX_OVHD_FUEL_PUMP_R1_off()
    Lvar = "L:S_OH_FUEL_RIGHT_1"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('F R1','off')
    end
end

function FNX_OVHD_FUEL_PUMP_R1_toggle()
    Lvar = "L:S_OH_FUEL_RIGHT_1"
    if ipc.readLvar(Lvar) ~= 1 then
        FNX_OVHD_FUEL_PUMP_R1_on()
    else
        FNX_OVHD_FUEL_PUMP_R1_off()
    end
end

-- $$ R2

function FNX_OVHD_FUEL_PUMP_R2_on()
    Lvar = "L:S_OH_FUEL_RIGHT_2"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('F R2','on')
    end
end

function FNX_OVHD_FUEL_PUMP_R2_off()
    Lvar = "L:S_OH_FUEL_RIGHT_2"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('F R2','off')
    end
end

function FNX_OVHD_FUEL_PUMP_R2_toggle()
    Lvar = "L:S_OH_FUEL_RIGHT_2"
    if ipc.readLvar(Lvar) ~= 1 then
        FNX_OVHD_FUEL_PUMP_R2_on()
    else
        FNX_OVHD_FUEL_PUMP_R2_off()
    end
end

-- $$ Mode Select

function FNX_OVHD_FUEL_MODESEL_on()
    Lvar = "L:S_OH_FUEL_MODE_SEL"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('F MS','on')
    end
end

function FNX_OVHD_FUEL_MODESEL_off()
    Lvar = "L:S_OH_FUEL_MODE_SEL"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('F MS','off')
    end
end

function FNX_OVHD_FUEL_MODESEL_toggle()
    Lvar = "L:S_OH_FUEL_MODE_SEL"
    if ipc.readLvar(Lvar) < 1 then
        FNX_OVHD_FUEL_MODESEL_on()
    else
        FNX_OVHD_FUEL_MODESEL_off()
    end
end

-- $$ All

function FNX_OVHD_FUEL_PUMP_ALL_toggle()
    FNX_OVHD_FUEL_PUMP_L1_toggle()
    FNX_OVHD_FUEL_PUMP_L2_toggle()
    FNX_OVHD_FUEL_PUMP_C1_toggle()
    --FNX_OVHD_FUEL_MODESEL_toggle()
    FNX_OVHD_FUEL_PUMP_C2_toggle()
    FNX_OVHD_FUEL_PUMP_R1_toggle()
    FNX_OVHD_FUEL_PUMP_R2_toggle()
end

function FNX_OVHD_FUEL_PUMP_ALL_on()
    FNX_OVHD_FUEL_PUMP_L1_on()
    FNX_OVHD_FUEL_PUMP_L2_on()
    FNX_OVHD_FUEL_PUMP_C1_on()
    --FNX_OVHD_FUEL_MODESEL_on()
    FNX_OVHD_FUEL_PUMP_C2_on()
    FNX_OVHD_FUEL_PUMP_R1_on()
    FNX_OVHD_FUEL_PUMP_R2_on()
end

function FNX_OVHD_FUEL_PUMP_ALL_off()
    FNX_OVHD_FUEL_PUMP_L1_off()
    FNX_OVHD_FUEL_PUMP_L2_off()
    FNX_OVHD_FUEL_PUMP_C1_off()
    --FNX_OVHD_FUEL_MODESEL_off()
    FNX_OVHD_FUEL_PUMP_C2_off()
    FNX_OVHD_FUEL_PUMP_R1_off()
    FNX_OVHD_FUEL_PUMP_R2_off()
end

-- ## Overhead ADIRS #####################################

-- $$ ADIRS 1
-- $$ EFISR FD/LS FO

function FNX_GLSD_EFISR_FD_on()
    if ipc.readLvar("I_FCU_EFIS2_FD") ~= 1 then
		ipc.writeLvar("L:S_FCU_EFIS2_FD", 1)
		DspShow('FD R','on')
		ipc.sleep(100)
		ipc.writeLvar("L:S_FCU_EFIS2_FD", 0)
    end

end

function FNX_GLSD_EFISR_FD_off()
    if ipc.readLvar("I_FCU_EFIS2_FD") == 1 then
		ipc.writeLvar("L:S_FCU_EFIS2_FD", 1)
		DspShow('FD R','off')
		ipc.sleep(100)
		ipc.writeLvar("L:S_FCU_EFIS2_FD", 0)
	end
end

function FNX_GLSD_EFISR_FD_toggle()
    ipc.writeLvar("L:S_FCU_EFIS2_FD", 1)
    DspShow('FD R','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_EFIS2_FD", 0)
end

function FNX_GLSD_EFISR_LS_on()
    if ipc.readLvar("I_FCU_EFIS2_LS") ~= 1 then
		ipc.writeLvar("L:S_FCU_EFIS2_LS", 1)
		DspShow('LS R','on')
		ipc.sleep(100)
		ipc.writeLvar("L:S_FCU_EFIS2_LS", 0)
    end

end

function FNX_GLSD_EFISR_LS_off()
    if ipc.readLvar("I_FCU_EFIS2_LS") == 1 then
		ipc.writeLvar("L:S_FCU_EFIS2_LS", 1)
		DspShow('LS R','off')
		ipc.sleep(100)
		ipc.writeLvar("L:S_FCU_EFIS2_LS", 0)
	end
end

function FNX_GLSD_EFISR_LS_toggle()
    ipc.writeLvar("L:S_FCU_EFIS2_LS", 1)
    DspShow('LS R','tgl')
    ipc.sleep(20)
    ipc.writeLvar("L:S_FCU_EFIS2_LS", 0)
end

-- $$ EFISR BARO Reference FO

function FNX_GLSD_EFISR_BARO_inc()
    local Lvar = "L:E_FCU_EFIS2_BARO"
    local Lval = ipc.readLvar(Lvar)
    _loggg('BARO=' .. Lval)
    ipc.writeLvar(Lvar, Lval + 1)
    DspShow('BARO','inc')
end

function FNX_GLSD_EFISR_BARO_dec()
    local Lvar = "L:E_FCU_EFIS2_BARO"
    local Lval = ipc.readLvar(Lvar)
    _loggg('BARO=' .. Lval)
    ipc.writeLvar(Lvar, Lval - 1)
    DspShow('BARO','dec')
end

function FNX_GLSD_EFISR_BARO_HPa()
    ipc.writeLvar("L:S_FCU_EFIS2_BARO_MODE", 1)
    BaroMode = 1
    DspShow('BARO','HPa')
end

function FNX_GLSD_EFISR_BARO_InHg()
    ipc.writeLvar("L:S_FCU_EFIS2_BARO_MODE", 0)
    BaroMode = 0
    DspShow('BARO','InHg')
end

function FNX_GLSD_EFISR_BARO_UNIT_toggle()
    if ipc.readLvar("L:S_FCU_EFIS2_BARO_MODE") == 0 then
        FNX_GLSD_EFISR_BARO_HPa()
    else
        FNX_GLSD_EFISR_BARO_InHg()
    end
end

function FNX_GLSD_EFISR_BARO_qfe()
    ipc.writeLvar("L:S_FCU_EFIS2_BARO_STD",0)
    BaroRef = 0
    DspShow('BARO', 'qfe')
end

function FNX_GLSD_EFISR_BARO_qnh()
    --ipc.writeLvar("L:S_FCU_EFIS2_BARO_STD",0)
    ipc.writeLvar("L:S_FCU_EFIS2_BARO_STD",0) -- sync L-R
    BaroRef = 1
    DspShow('BARO', 'qnh')
end

function FNX_GLSD_EFISR_BARO_std()
    --ipc.writeLvar("L:S_FCU_EFIS1_BARO_STD",1)
    ipc.writeLvar("L:S_FCU_EFIS2_BARO_STD",1) -- sync L-R
    DspShow('BARO', 'std')
end

function FNX_GLSD_EFISR_BARO_pull()
    FNX_GLSD_EFISR_BARO_std()
end

function FNX_GLSD_EFISR_BARO_push()
    Lval = ipc.readLvar("L:S_FCU_EFIS2_BARO_STD")
    _loggg('BARO-STD=' .. Lval)
    if Lval == 1 then
        FNX_GLSD_EFISR_BARO_qnh()
    elseif Lval == 1 then
        FNX_GLSD_EFISR_BARO_qfe()
    elseif BaroRef > 0 then
        FNX_GLSD_EFISR_BARO_qnh()
    else
        FNX_GLSD_EFISR_BARO_qfe()
    end
end

function FNX_GLSD_EFISR_BARO_toggle()
    Lval = ipc.readLvar("L:S_FCU_EFIS2_BARO_STD")
    if Lval > 0 then
        FNX_GLSD_EFISR_BARO_push()
    else
        FNX_GLSD_EFISR_BARO_pull()
    end
end

function FNX_OVHD_ADIRS_1_off()
     adirs1Knob = 0
     FNX_OVHD_ADIRS_1_set(adirs1Knob)
end

function FNX_OVHD_ADIRS_1_nav()
    adirs1Knob = 1
    FNX_OVHD_ADIRS_1_set(adirs1Knob)
end

function FNX_OVHD_ADIRS_1_att()
     adirs1Knob = 2
	FNX_OVHD_ADIRS_1_set(adirs1Knob)
end

function FNX_OVHD_ADIRS_1_inc()
     adirs1Knob = ipc.readLvar("L:S_OH_NAV_IR1_MODE")
     if adirs1Knob >= 2 then adirs1Knob = 2 else adirs1Knob = adirs1Knob + 1 end
	FNX_OVHD_ADIRS_1_set(adirs1Knob)
    DspShow ("ADIRS1", adirs1Knob)
end

function FNX_OVHD_ADIRS_1_dec()
     adirs1Knob = ipc.readLvar("L:S_OH_NAV_IR1_MODE")
     if adirs1Knob <= 0 then adirs1Knob = 0 else adirs1Knob = adirs1Knob - 1 end
	FNX_OVHD_ADIRS_1_set(adirs1Knob)
end

function FNX_OVHD_ADIRS_1_set(adirs1Knob)
     ipc.writeLvar("L:S_OH_NAV_IR1_MODE", adirs1Knob)
     DspShow ("ADR1", adirs1Knob)
end

-- $$ ADIRS 2

function FNX_OVHD_ADIRS_2_off()
     adirs1Knob = 0
     FNX_OVHD_ADIRS_2_set(adirs1Knob)
end

function FNX_OVHD_ADIRS_2_nav()
     adirs1Knob = 1
	FNX_OVHD_ADIRS_2_set(adirs1Knob)
end

function FNX_OVHD_ADIRS_2_att()
     adirs1Knob = 2
	FNX_OVHD_ADIRS_2_set(adirs1Knob)
end

function FNX_OVHD_ADIRS_2_inc()
     adirs1Knob = ipc.readLvar("L:S_OH_NAV_IR2_MODE")
     if adirs1Knob >= 2 then adirs1Knob = 2 else adirs1Knob = adirs1Knob + 1 end
	FNX_OVHD_ADIRS_2_set(adirs1Knob)
end

function FNX_OVHD_ADIRS_2_dec()
     adirs1Knob = ipc.readLvar("L:S_OH_NAV_IR2_MODE")
     if adirs1Knob <= 0 then adirs1Knob = 0 else adirs1Knob = adirs1Knob - 1 end
	FNX_OVHD_ADIRS_2_set(adirs1Knob)
end

function FNX_OVHD_ADIRS_2_set(adirs1Knob)
     ipc.writeLvar("L:S_OH_NAV_IR2_MODE", adirs1Knob)
     DspShow ("ADR2", adirs1Knob)
end

-- $$ ADIRS 3

function FNX_OVHD_ADIRS_3_off()
     adirs1Knob = 0
     FNX_OVHD_ADIRS_3_set(adirs1Knob)
end

function FNX_OVHD_ADIRS_3_nav()
     adirs1Knob = 1
	FNX_OVHD_ADIRS_3_set(adirs1Knob)
end

function FNX_OVHD_ADIRS_3_att()
     adirs1Knob = 2
	FNX_OVHD_ADIRS_3_set(adirs1Knob)
end

function FNX_OVHD_ADIRS_3_inc()
     adirs1Knob = ipc.readLvar("L:S_OH_NAV_IR3_MODE")
     if adirs1Knob >= 2 then adirs1Knob = 2 else adirs1Knob = adirs1Knob + 1 end
	FNX_OVHD_ADIRS_3_set(adirs1Knob)
end

function FNX_OVHD_ADIRS_3_dec()
     adirs1Knob = ipc.readLvar("L:S_OH_NAV_IR3_MODE")
     if adirs1Knob <= 0 then adirs1Knob = 0 else adirs1Knob = adirs1Knob - 1 end
	FNX_OVHD_ADIRS_3_set(adirs1Knob)
end

function FNX_OVHD_ADIRS_3_set(adirs1Knob)
     ipc.writeLvar("L:S_OH_NAV_IR3_MODE", adirs1Knob)
     DspShow ("ADR3", adirs1Knob)
end

-- $$ ADIRS All

function FNX_OVHD_ADIRS_ALL_off()
	FNX_OVHD_ADIRS_1_off()
	FNX_OVHD_ADIRS_2_off()
	FNX_OVHD_ADIRS_3_off()
end

function FNX_OVHD_ADIRS_ALL_nav()
    FNX_OVHD_ADIRS_1_nav()
	FNX_OVHD_ADIRS_2_nav()
	FNX_OVHD_ADIRS_3_nav()
end

-- ## Overhead AntiIce #####################################

-- $$ Wing anti-ice

function FNX_OVHD_AICE_WING_on()
    Lvar = "L:S_OH_PNEUMATIC_WING_ANTI_ICE"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('AIWG','on')
    end
end

function FNX_OVHD_AICE_WING_off()
    Lvar = "L:S_OH_PNEUMATIC_WING_ANTI_ICE"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('AIWG','off')
    end
end

function FNX_OVHD_AICE_WING_toggle()
    Lvar = "L:S_OH_PNEUMATIC_WING_ANTI_ICE"
    if ipc.readLvar(Lvar) < 1 then
        FNX_OVHD_AICE_WING_on()
    else
        FNX_OVHD_AICE_WING_off()
    end
end

function FNX_OVHD_AICE_WING_ALL_on()
	FNX_OVHD_AICE_WING_on()
	FNX_OVHD_AICE_ENG1_on()
	FNX_OVHD_AICE_ENG2_on()
end

function FNX_OVHD_AICE_WING_ALL_off()
	FNX_OVHD_AICE_WING_off()
	FNX_OVHD_AICE_ENG1_off()
	FNX_OVHD_AICE_ENG2_off()
end

-- $$ Eng 1 anti-ice

function FNX_OVHD_AICE_ENG1_on()
    Lvar = "L:S_OH_PNEUMATIC_ENG1_ANTI_ICE"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('AIE1','on')
    end
end

function FNX_OVHD_AICE_ENG1_off()
    Lvar = "L:S_OH_PNEUMATIC_ENG1_ANTI_ICE"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('AIE1','off')
    end
end
function FNX_OVHD_AICE_ENG1_toggle()
    Lvar = "L:S_OH_PNEUMATIC_ENG1_ANTI_ICE"
    if ipc.readLvar(Lvar) < 1 then
        FNX_OVHD_AICE_ENG1_on()
    else
        FNX_OVHD_AICE_ENG1_off()
    end
end

-- $$ Eng 2 anti-ice

function FNX_OVHD_AICE_ENG2_on()
    Lvar = "L:S_OH_PNEUMATIC_ENG2_ANTI_ICE"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('AIE2','on')
    end
end

function FNX_OVHD_AICE_ENG2_off()
    Lvar = "L:S_OH_PNEUMATIC_ENG2_ANTI_ICE"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('AIE2','off')
    end
end

function FNX_OVHD_AICE_ENG2_toggle()
    Lvar = "L:S_OH_PNEUMATIC_ENG2_ANTI_ICE"
    if ipc.readLvar(Lvar) < 1 then
        FNX_OVHD_AICE_ENG2_on()
    else
        FNX_OVHD_AICE_ENG2_off()
    end
end

-- $$ Probe Heat

function FNX_OVHD_AICE_PROBE_on()
    Lvar = "L:S_OH_PROBE_HEAT"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('PROB','on')
    end
end

function FNX_OVHD_AICE_PROBE_off()
    Lvar = "L:S_OH_PROBE_HEAT"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('PROB','off')
    end
end

function FNX_OVHD_AICE_PROBE_toggle()
    Lvar = "L:S_OH_PROBE_HEAT"
    if ipc.readLvar(Lvar) < 1 then
        FNX_OVHD_AICE_PROBE_on()
    else
        FNX_OVHD_AICE_PROBE_off()
    end
end

-- ## Overhead Electrics #####################################

-- $$ External Power

function FNX_OVHD_ELEC_EXTPWR_on()
    if (ipc.readLvar("I_OH_ELEC_EXT_PWR_L") == 0) then
        Lvar = "L:S_OH_ELEC_EXT_PWR"
        Lval = ipc.readLvar(Lvar)
        ipc.writeLvar(Lvar, Lval + 1)
        ipc.sleep(100)
        ipc.writeLvar(Lvar, Lval + 2)
        DspShow('EPWR','on')
        ipc.sleep(100)
    end
end

function FNX_OVHD_ELEC_EXTPWR_off()
    if (ipc.readLvar("I_OH_ELEC_EXT_PWR_L") == 1) then
        Lvar = "L:S_OH_ELEC_EXT_PWR"
        Lval = ipc.readLvar(Lvar)
        ipc.writeLvar(Lvar, Lval + 1)
        ipc.sleep(100)
        ipc.writeLvar(Lvar, Lval + 2)
        DspShow('EPWR','off')
        ipc.sleep(100)
    end
end

function FNX_OVHD_ELEC_EXTPWR_toggle()
    Lvar = "L:I_OH_ELEC_EXT_PWR_L"
    if ipc.readLvar(Lvar) == 0 then
        FNX_OVHD_ELEC_EXTPWR_on()
    else
        FNX_OVHD_ELEC_EXTPWR_off()
    end
end

-- $$ Batteries

function FNX_OVHD_ELEC_BAT1_on()
    Lvar = "L:S_OH_ELEC_BAT1"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('BAT1','on')
    end
end

function FNX_OVHD_ELEC_BAT1_off()
    Lvar = "L:S_OH_ELEC_BAT1"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('BAT1','off')
    end
end

function FNX_OVHD_ELEC_BAT1_toggle()
    Lvar = "L:S_OH_ELEC_BAT1"
    if ipc.readLvar(Lvar) == 0 then
        FNX_OVHD_ELEC_BAT1_on()
    else
        FNX_OVHD_ELEC_BAT1_off()
    end
end

function FNX_OVHD_ELEC_BAT2_on()
    Lvar = "L:S_OH_ELEC_BAT2"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('BAT2','on')
    end
end

function FNX_OVHD_ELEC_BAT2_off()
    Lvar = "L:S_OH_ELEC_BAT2"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('BAT2','off')
    end
end

function FNX_OVHD_ELEC_BAT2_toggle()
    Lvar = "L:S_OH_ELEC_BAT2"
    if ipc.readLvar(Lvar) == 0 then
        FNX_OVHD_ELEC_BAT2_on()
    else
        FNX_OVHD_ELEC_BAT2_off()
    end
end

function FNX_OVHD_ELEC_BAT_BOTH_on()
    FNX_OVHD_ELEC_BAT1_on()
	FNX_OVHD_ELEC_BAT2_on()
end

function FNX_OVHD_ELEC_BAT_BOTH_off()
    FNX_OVHD_ELEC_BAT1_off()
	FNX_OVHD_ELEC_BAT2_off()
end

-- $$ Generators

function FNX_OVHD_ELEC_GEN1_on()
    Lvar = "L:S_OH_ELEC_GEN1"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('GEN1','on')
    end
end

function FNX_OVHD_ELEC_GEN1_off()
    Lvar = "L:S_OH_ELEC_GEN1"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('GEN1','off')
    end
end

function FNX_OVHD_ELEC_GEN1_toggle()
    Lvar = "L:S_OH_ELEC_GEN1"
    if ipc.readLvar(Lvar) == 0 then
        FNX_OVHD_ELEC_GEN1_on()
    else
        FNX_OVHD_ELEC_GEN1_off()
    end
end

function FNX_OVHD_ELEC_GEN2_on()
    Lvar = "L:S_OH_ELEC_GEN2"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('GEN2','on')
    end
end

function FNX_OVHD_ELEC_GEN2_off()
    Lvar = "L:S_OH_ELEC_GEN2"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('GEN2','off')
    end
end

function FNX_OVHD_ELEC_GEN2_toggle()
    Lvar = "L:S_OH_ELEC_GEN2"
    if ipc.readLvar(Lvar) == 0 then
        FNX_OVHD_ELEC_GEN2_on()
    else
        FNX_OVHD_ELEC_GEN2_off()
    end
end

-- $$ APU Generator

function FNX_OVHD_ELEC_APUGEN_on()
    Lvar = "L:S_OH_ELEC_APU_GENERATOR"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('APUG','on')
    end
end

function FNX_OVHD_ELEC_APUGEN_off()
    Lvar = "L:S_OH_ELEC_APU_GENERATOR"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('APUG','off')
    end
end

function FNX_OVHD_ELEC_APUGEN_toggle()
    Lvar = "L:S_OH_ELEC_APU_GENERATOR"
    if ipc.readLvar(Lvar) == 0 then
        FNX_OVHD_ELEC_APUGEN_on()
    else
        FNX_OVHD_ELEC_APUGEN_off()
    end
end

-- ## Overhead APU ######################################

-- $$ APU Master

function FNX_OVHD_ELEC_APUMASTER_on()
    Lvar = "L:S_OH_ELEC_APU_MASTER"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('APU','on')
    end
end

function FNX_OVHD_ELEC_APUMASTER_off()
    Lvar = "L:S_OH_ELEC_APU_MASTER"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('APU','off')
    end
end

function FNX_OVHD_ELEC_APUMASTER_toggle()
    Lvar = "L:S_OH_ELEC_APU_MASTER"
    if ipc.readLvar(Lvar) == 0 then
        FNX_OVHD_ELEC_APUMASTER_on()
    else
        FNX_OVHD_ELEC_APUMASTER_off()
    end
end

-- $$ APU Start

function FNX_OVHD_APU_START_on()
    ipc.writeLvar('L:S_OH_ELEC_APU_START', 1)
    DspShow('APU','strt')
    ipc.sleep(50)
    ipc.writeLvar('L:S_OH_ELEC_APU_START', 0)
end

-- ## Overhead Air Conditioning

-- $$ APU Bleed

function FNX_OVHD_PNEU_APU_BLEED_on()
    Lvar = "L:S_OH_PNEUMATIC_APU_BLEED"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('ABLD','on')
    end
end

function FNX_OVHD_PNEU_APU_BLEED_off()
    Lvar = "L:S_OH_PNEUMATIC_APU_BLEED"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('ABLD','off')
    end
end

function FNX_OVHD_PNEU_APU_BLEED_toggle()
    Lvar = "L:S_OH_PNEUMATIC_APU_BLEED"
    if ipc.readLvar(Lvar) == 0 then
        FNX_OVHD_PNEU_APU_BLEED_on()
    else
        FNX_OVHD_PNEU_APU_BLEED_off()
    end
end

-- $$ Eng 1 Bleed

function FNX_OVHD_PNEU_ENG1_BLEED_on()
    Lvar = "L:S_OH_PNEUMATIC_ENG1_BLEED"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('1BLD','on')
    end
end

function FNX_OVHD_PNEU_ENG1_BLEED_off()
    Lvar = "L:S_OH_PNEUMATIC_ENG1_BLEED"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('1BLD','off')
    end
end

function FNX_OVHD_PNEU_ENG1_BLEED_toggle()
    Lvar = "L:S_OH_PNEUMATIC_ENG1_BLEED"
    if ipc.readLvar(Lvar) == 0 then
        FNX_OVHD_PNEU_ENG1_BLEED_on()
    else
        FNX_OVHD_PNEU_ENG1_BLEED_off()
    end
end

-- $$ Eng 2 Bleed

function FNX_OVHD_PNEU_ENG2_BLEED_on()
    Lvar = "L:S_OH_PNEUMATIC_ENG2_BLEED"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('2BLD','on')
    end
end

function FNX_OVHD_PNEU_ENG2_BLEED_off()
    Lvar = "L:S_OH_PNEUMATIC_ENG2_BLEED"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('2BLD','off')
    end
end

function FNX_OVHD_PNEU_ENG2_BLEED_toggle()
    Lvar = "L:S_OH_PNEUMATIC_ENG2_BLEED"
    if ipc.readLvar(Lvar) == 0 then
        FNX_OVHD_PNEU_ENG2_BLEED_on()
    else
        FNX_OVHD_PNEU_ENG2_BLEED_off()
    end
end

-- $$ Pack 1

function FNX_OVHD_PNEU_PACK1_on()
    Lvar = "L:S_OH_PNEUMATIC_PACK_1"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('PCK1','on')
    end
end

function FNX_OVHD_PNEU_PACK1_off()
    Lvar = "L:S_OH_PNEUMATIC_PACK_1"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('PCK1','off')
    end
end

function FNX_OVHD_PNEU_PACK1_toggle()
    Lvar = "L:S_OH_PNEUMATIC_PACK_1"
    if ipc.readLvar(Lvar) == 0 then
        FNX_OVHD_PNEU_PACK1_on()
    else
        FNX_OVHD_PNEU_PACK1_off()
    end
end

-- $$ Pack 2

function FNX_OVHD_PNEU_PACK2_on()
    Lvar = "L:S_OH_PNEUMATIC_PACK_2"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('PCK2','on')
    end
end

function FNX_OVHD_PNEU_PACK2_off()
    Lvar = "L:S_OH_PNEUMATIC_PACK_2"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('PCK2','off')
    end
end

function FNX_OVHD_PNEU_PACK2_toggle()
    Lvar = "L:S_OH_PNEUMATIC_PACK_2"
    if ipc.readLvar(Lvar) == 0 then
        FNX_OVHD_PNEU_PACK2_on()
    else
        FNX_OVHD_PNEU_PACK2_off()
    end
end

-- $$ Hot Air

function FNX_OVHD_PNEU_HOTAIR_on()
    Lvar = "L:S_OH_PNEUMATIC_HOT_AIR"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('HOTA','on')
    end
end

function FNX_OVHD_PNEU_HOTAIR_off()
    Lvar = "L:S_OH_PNEUMATIC_HOT_AIR"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('HOTA','off')
    end
end

function FNX_OVHD_PNEU_HOTAIR_toggle()
    Lvar = "L:S_OH_PNEUMATIC_HOT_AIR"
    if ipc.readLvar(Lvar) == 0 then
        FNX_OVHD_PNEU_HOTAIR_on()
    else
        FNX_OVHD_PNEU_HOTAIR_off()
    end
end

-- $$ Cabin Fan

function FNX_OVHD_CAB_FAN_on()
    Lvar = "L:S_OH_PNEUMATIC_CAB_FANS"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        DspShow('CFAN', 'on')
    end
end

function FNX_OVHD_CAB_FAN_off()
    Lvar = "L:S_OH_PNEUMATIC_CAB_FANS"
    if ipc.readLvar(Lvar) == 1 then
        ipc.writeLvar(Lvar, 0)
        DspShow('CFAN', 'off')
    end
end

function FNX_OVHD_CAB_FAN_toggle()
    Lvar = "L:S_OH_PNEUMATIC_CAB_FANS"
    if ipc.readLvar(Lvar) == 1 then
        FNX_OVHD_CAB_FAN_off()
    else
        FNX_OVHD_CAB_FAN_on()
    end
end

-- ## Overhead Hydraulics

-- $$ Eng 1 Pump

function FNX_OVHD_HYD_PUMP_ENG1_on()
    Lvar = "L:S_OH_HYD_ENG_1_PUMP"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('HYD1','on')
    end
end

function FNX_OVHD_HYD_PUMP_ENG1_off()
    Lvar = "L:S_OH_HYD_ENG_1_PUMP"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('HYD1','off')
    end
end

function FNX_OVHD_HYD_PUMP_ENG1_toggle()
    Lvar = "L:S_OH_HYD_ENG_1_PUMP"
    if ipc.readLvar(Lvar) == 0 then
        FNX_OVHD_HYD_PUMP_ENG1_on()
    else
        FNX_OVHD_HYD_PUMP_ENG1_off()
    end
end

-- $$ Eng 2 Pump

function FNX_OVHD_HYD_PUMP_ENG2_on()
    Lvar = "L:S_OH_HYD_ENG_2_PUMP"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('HYD1','on')
    end
end

function FNX_OVHD_HYD_PUMP_ENG2_off()
    Lvar = "L:S_OH_HYD_ENG_2_PUMP"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('HYD1','off')
    end
end

function FNX_OVHD_HYD_PUMP_ENG2_toggle()
    Lvar = "L:S_OH_HYD_ENG_2_PUMP"
    if ipc.readLvar(Lvar) == 0 then
        FNX_OVHD_HYD_PUMP_ENG2_on()
    else
        FNX_OVHD_HYD_PUMP_ENG2_off()
    end
end

-- $$ Hydraulic All

function FNX_OVHD_HYD_PUMP_ENG_ALL_on()
	FNX_OVHD_HYD_PUMP_ENG1_on()
	FNX_OVHD_HYD_PUMP_ENG2_on()
end

function FNX_OVHD_HYD_PUMP_ENG_ALL_off()
	FNX_OVHD_HYD_PUMP_ENG1_off()
	FNX_OVHD_HYD_PUMP_ENG2_off()
end

function FNX_OVHD_HYD_PUMP_ENG_ALL_toggle()
	FNX_OVHD_HYD_PUMP_ENG1_toggle()
	FNX_OVHD_HYD_PUMP_ENG2_toggle()
end

-- $$ Elec Pump Yellow

function FNX_OVHD_HYD_PUMP_ELEC_on()
    Lvar = "L:S_OH_HYD_YELLOW_ELEC_PUMP"
    LvarL = "L:I_OH_HYD_YELLOW_ELEC_PUMP_L"
    if ipc.readLvar(LvarL) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('HYDE','on')
        _sleep(50)
        ipc.writeLvar(Lvar, 0)
    end
end

function FNX_OVHD_HYD_PUMP_ELEC_off()
    Lvar = "L:S_OH_HYD_YELLOW_ELEC_PUMP"
    LvarL = "L:I_OH_HYD_YELLOW_ELEC_PUMP_L"
    if ipc.readLvar(LvarL) ~= 0 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('HYDE','off')
        _sleep(50)
        ipc.writeLvar(Lvar, 0)
    end
end

function FNX_OVHD_HYD_PUMP_ELEC_toggle()
    LvarL = "L:I_OH_HYD_YELLOW_ELEC_PUMP_L"
    if ipc.readLvar(LvarL) ~= 1 then
        FNX_OVHD_HYD_PUMP_ELEC_on()
    else
        FNX_OVHD_HYD_PUMP_ELEC_off()
    end
end

-- $$ Elec Pump Blue

function FNX_OVHD_HYD_PUMP_BLUE_on()
    Lvar = "L:S_OH_HYD_BLUE_ELEC_PUMP"
    LvarL = "L:I_OH_HYD_BLUE_ELEC_PUMP_L"
    if ipc.readLvar(LvarL) ~= 0 then
        ipc.readLvar(Lvar .. '_Cover', 1)
        _sleep(150)
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('HYDB','on')
        _sleep(150)
        ipc.readLvar(Lvar .. '_Cover', 0)
    end
end

function FNX_OVHD_HYD_PUMP_BLUE_off()
    Lvar = "L:S_OH_HYD_BLUE_ELEC_PUMP"
    LvarL = "L:I_OH_HYD_BLUE_ELEC_PUMP_L"
    if ipc.readLvar(LvarL) ~= 1 then
        ipc.readLvar(Lvar .. '_Cover', 1)
        _sleep(150)
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('HYDB','off')
        _sleep(150)
        ipc.readLvar(Lvar .. '_Cover', 0)
    end
end

function FNX_OVHD_HYD_PUMP_BLUE_toggle()
    LvarL = "L:I_OH_HYD_BLUE_ELEC_PUMP_L"
    if ipc.readLvar(LvarL) ~= 0 then
        FNX_OVHD_HYD_PUMP_BLUE_on()
    else
        FNX_OVHD_HYD_PUMP_BLUE_off()
    end
end

-- $$ RAT

function FNX_OVHD_HYD_RAT_on()
    Lvar = "L:S_OH_HYD_RAT_MAN_ON"
    Lvar2 = "L:A320_RAT_Open"
    if true then --ipc.readLvar(Lvar2) < 190 then
        ipc.readLvar(Lvar .. "_Cover", 1)
        _sleep(150)
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. "_Anim", 1)
        DspShow('RAT','on')
        _sleep(150)
        --ipc.readLvar(Lvar .. "_Cover", 0)
    end
end


-- ## Main Panel #####################################

-- $$ Standby Attitude Uncage

function FNX_MPNL_STBY_ATT_pull()
    ipc.writeLvar('L:S_STANDBY_ATTITUDE_CAGE',1)
    DspShow('SBAT','cage')
    _sleep(2000)
    ipc.writeLvar('L:S_STANDBY_ATTITUDE_CAGE',0)
end

-- $$ Anti Skid

function FNX_MPNL_LDG_ANTISKID_on()
    ipc.writeLvar('L:S_FC_MIP_ANTI_SKID',1)
    DspShow('SKID','on')
end

function FNX_MPNL_LDG_ANTISKID_off()
    ipc.writeLvar('L:S_FC_MIP_ANTI_SKID',0)
    DspShow('SKID','off')
end

function FNX_MPNL_LDG_ANTISKID_toggle()
    if ipc.readLvar('L:S_FC_MIP_ANTI_SKID') > 0 then
        FNX_MPNL_LDG_ANTISKID_off()
    else
        FNX_MPNL_LDG_ANTISKID_on()
    end
end

-- $$ Autobrake

function FNX_MPNL_LDG_AUTOBRK_off()
    local level = FNX_MPNL_LDG_AUTOBRK_level()
    --level = auto_brk
    if level == 1 then
        FNX_MPNL_LDG_AUTOBRK_LOW_off()
    elseif level == 2 then
        FNX_MPNL_LDG_AUTOBRK_MED_off()
    elseif level == 3 then
        FNX_MPNL_LDG_AUTOBRK_MAX_off()
    end
    auto_brk = 0
end

function FNX_MPNL_LDG_AUTOBRK_LOW_press()
    local Lvar = 'L:S_MIP_AUTOBRAKE_LO'
    ipc.writeLvar(Lvar, 1)
    DspShow('ABRK','low')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
    ipc.sleep(100)
    auto_brk = FNX_MPNL_LDG_AUTOBRK_level()
end

function FNX_MPNL_LDG_AUTOBRK_MED_press()
    local Lvar = 'L:S_MIP_AUTOBRAKE_MED'
    ipc.writeLvar(Lvar, 1)
    DspShow('ABRK','med')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
    ipc.sleep(100)
    auto_brk = FNX_MPNL_LDG_AUTOBRK_level()
end

function FNX_MPNL_LDG_AUTOBRK_MAX_press()
    local Lvar = 'L:S_MIP_AUTOBRAKE_MAX'
    ipc.writeLvar(Lvar, 1)
    DspShow('ABRK','max')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
    ipc.sleep(100)
    auto_brk = FNX_MPNL_LDG_AUTOBRK_level()
end

function FNX_MPNL_LDG_AUTOBRK_LOW_off()
    local Lvar = 'L:I_MIP_AUTOBRAKE_LO_'
    if (ipc.readLvar(Lvar .. 'L') == 1) or
        (ipc.readLvar(Lvar .. 'U') == 1) then
		FNX_MPNL_LDG_AUTOBRK_LOW_press()
        auto_brk = 0
	end
end

function FNX_MPNL_LDG_AUTOBRK_LOW_on()
    local Lvar = 'L:I_MIP_AUTOBRAKE_LO_'
    if (ipc.readLvar(Lvar .. 'L') ~= 1) and
        (ipc.readLvar(Lvar .. 'U') ~= 1) then
		FNX_MPNL_LDG_AUTOBRK_LOW_press()
        auto_brk = 1
	end
end

function FNX_MPNL_LDG_AUTOBRK_MED_off()
    local Lvar = 'L:I_MIP_AUTOBRAKE_MED_'
    if (ipc.readLvar(Lvar .. 'L') == 1) or
        (ipc.readLvar(Lvar .. 'U') == 1) then
		FNX_MPNL_LDG_AUTOBRK_MED_press()
        auto_brk = 0
	end
end

function FNX_MPNL_LDG_AUTOBRK_MED_on()
    local Lvar = 'L:I_MIP_AUTOBRAKE_MED_'
    if (ipc.readLvar(Lvar .. 'L') ~= 1) and
        (ipc.readLvar(Lvar .. 'U') ~= 1) then
		FNX_MPNL_LDG_AUTOBRK_MED_press()
        auto_brk = 2
	end
end

function FNX_MPNL_LDG_AUTOBRK_MAX_off()
    local Lvar = 'L:I_MIP_AUTOBRAKE_MAX_'
    if (ipc.readLvar(Lvar .. 'L') == 1) or
        (ipc.readLvar(Lvar .. 'U') == 1) then
		FNX_MPNL_LDG_AUTOBRK_MAX_press()
        auto_brk = 0
	end
end

function FNX_MPNL_LDG_AUTOBRK_MAX_on()
    local Lvar = 'L:I_MIP_AUTOBRAKE_MAX_'
    if (ipc.readLvar(Lvar .. 'L') ~= 1) and
        (ipc.readLvar(Lvar .. 'U') ~= 1) then
		FNX_MPNL_LDG_AUTOBRK_MAX_press()
        auto_brk = 3
	end
end

function FNX_MPNL_LDG_AUTOBRK_cycle()
    local level = auto_brk
    if level == 0 then
        FNX_MPNL_LDG_AUTOBRK_LOW_on()
        auto_brk = 1
    elseif level == 1 then
        FNX_MPNL_LDG_AUTOBRK_MED_on()
        auto_brk = 2
    elseif level == 2 then
        FNX_MPNL_LDG_AUTOBRK_MAX_on()
        auto_brk = 3
    elseif level == 3 then
        FNX_MPNL_LDG_AUTOBRK_MAX_off()
        auto_brk = 0
    end
end

function FNX_MPNL_LDG_AUTOBRK_level()
    local Lvar = 'I_MIP_AUTOBRAKE_'
    if (ipc.readLvar(Lvar .. 'LO_L') == 1) or
        (ipc.readLvar(Lvar .. 'LO_U') == 1) then
        _loggg('ABRK low')
        auto_brk = 1
    elseif (ipc.readLvar(Lvar .. 'MED_L') == 1) or
        (ipc.readLvar(Lvar .. 'MED_U') == 1) then
        _loggg('ABRK med')
        auto_brk = 2
    elseif (ipc.readLvar(Lvar .. 'MAX_L') == 1) or
        (ipc.readLvar(Lvar .. 'MAX_U') == 1) then
        _loggg('ABRK max')
        auto_brk = 3
    else
        _loggg('ABRK off')
        auto_brk = 0
    end
    _loggg('ABRK=' .. auto_brk)
    return auto_brk
end

-- $$ Brake Fan

function FNX_MPNL_BRAKE_FAN_on()
    Lvar = "L:S_MIP_BRAKE_FAN"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        DspShow('BFAN','on')
    end
end

function FNX_MPNL_BRAKE_FAN_off()
    Lvar = "L:S_MIP_BRAKE_FAN"
    if ipc.readLvar(Lvar) == 1 then
        ipc.writeLvar(Lvar, 0)
        DspShow('BFAN','off')
    end
end


-- $$ Landing Gear Handle

function FNX_MPNL_LDG_GEAR_up()
    local Lvar = 'L:S_MIP_GEAR'
    ipc.writeLvar(Lvar, 0)
    DspShow('GEAR','up')
end

function FNX_MPNL_LDG_GEAR_down()
    local Lvar = 'L:S_MIP_GEAR'
    ipc.writeLvar(Lvar, 1)
    DspShow('GEAR','down')
end

function FNX_MPNL_LDG_GEAR_toggle()
    local Lvar = "L:S_MIP_GEAR"
    if ipc.readLvar(Lvar) > 0 then
        FNX_MPNL_LDG_GEAR_up()
    else
        FNX_MPNL_LDG_GEAR_down()
    end
end

-- $$ Terr on ND

function FNX_MPNL_ND_TERRONND_1_on()
    Lvar = "L:I_MIP_GPWS_TERRAIN_ON_ND_CAPT_L"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('TERR','on')
    end
end

function FNX_MPNL_ND_TERRONND_1_off()
    Lvar = "L:I_MIP_GPWS_TERRAIN_ON_ND_CAPT_L"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('TERR','off')
    end
end

function FNX_MPNL_ND_TERRONND_1_toggle()
    Lvar = "L:I_MIP_GPWS_TERRAIN_ON_ND_CAPT_L"
    if ipc.readLvar(Lvar) == 0 then
        FNX_MPNL_ND_TERRONND_1_on()
    else
        FNX_MPNL_ND_TERRONND_1_off()
    end
end

-- ## Chrono Capt

function FNX_MPNL_CHRONO1_press()
    Lvar = "L:S_MIP_CHRONO_CAPT"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        DspShow('CHRO','pres')
        _sleep(50)
        ipc.writeLvar(Lvar, 0)
    end
end

-- ## Chrono

function FNX_MPNL_CHRONO_RST_press()
    Lvar = "L:S_MIP_CLOCK_RST"
    ipc.writeLvar(Lvar, 1)
    DspShow('RST','on')
    _sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_MPNL_CHRONO_CHR_press()
    Lvar = "L:S_MIP_CLOCK_CHR"
    ipc.writeLvar(Lvar, 1)
    DspShow('CHR','on')
    _sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_MPNL_CHRONO_DATE_press()
    Lvar = "L:S_MIP_CLOCK_SET"
    ipc.writeLvar(Lvar, 1)
    DspShow('CLK','on')
    _sleep(50)
    ipc.writeLvar(Lvar, 0)
end

-- $$ UTC

function FNX_MPNL_CHRONO_UTC_gps()
    Lvar = "L:S_MIP_CLOCK_UTC"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        DspShow('UTC','gps')
    end
end

function FNX_MPNL_CHRONO_UTC_int()
    Lvar = "L:S_MIP_CLOCK_UTC"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        DspShow('UTC','int')
    end
end

function FNX_MPNL_CHRONO_UTC_set()
    Lvar = "L:S_MIP_CLOCK_UTC"
    if ipc.readLvar(Lvar) ~= 2 then
        ipc.writeLvar(Lvar, 2)
        DspShow('UTC','set')
    end
end

function FNX_MPNL_CHRONO_UTC_cycle()
    Lvar = "L:S_MIP_CLOCK_UTC"
    if ipc.readLvar(Lvar) == 0 then
        FNX_MPNL_CHRONO_UTC_int()
    elseif ipc.readLvar(Lvar) == 1 then
        FNX_MPNL_CHRONO_UTC_set()
    else
        FNX_MPNL_CHRONO_UTC_gps()
    end
end

-- $$ ET

function FNX_MPNL_CHRONO_ET_run()
    Lvar = "L:S_MIP_CLOCK_ET"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        DspShow('ET','run')
    end
end

function FNX_MPNL_CHRONO_ET_stp()
    Lvar = "L:S_MIP_CLOCK_ET"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        DspShow('ET','stop')
    end
end

function FNX_MPNL_CHRONO_ET_rst()
    Lvar = "L:S_MIP_CLOCK_ET"
    if ipc.readLvar(Lvar) ~= 2 then
        ipc.writeLvar(Lvar, 2)
        DspShow('ET','rst')
    end
end

function FNX_MPNL_CHRONO_ET_toggle()
    Lvar = "L:S_MIP_CLOCK_ET"
    if ipc.readLvar(Lvar) == 0 then
        FNX_MPNL_CHRONO_ET_stp()
        _sleep(100)
        FNX_MPNL_CHRONO_ET_rst()
    else
        FNX_MPNL_CHRONO_ET_run()
    end
end

function FNX_MPNL_CHRONO_ET_RUNSTP_toggle()
    Lvar = "L:S_MIP_CLOCK_ET"
    if ipc.readLvar(Lvar) == 0 then
        FNX_MPNL_CHRONO_ET_stp()
    elseif ipc.readLvar(Lvar) == 1 then
        FNX_MPNL_CHRONO_ET_run()
    end
end

-- ## Pedestal

-- $$ Spoilers

function FNX_PED_SPOILERARM_on ()
    local Lvar = 'L:A_FC_SPEEDBRAKE'
    local Lval = ipc.readLvar(Lvar)
    if Lval == 1 then
        ipc.writeLvar(Lvar, 0)
        DspShow('SARM','on')
    end
end

function FNX_PED_SPOILERARM_off ()
    local Lvar = 'L:A_FC_SPEEDBRAKE'
    local Lval = ipc.readLvar(Lvar)
    if Lval == 0 then
        ipc.writeLvar(Lvar, 1)
        DspShow('SARM','off')
    end
end

function FNX_PED_SPOILERARM_toggle ()
    local Lvar = 'L:A_FC_SPEEDBRAKE'
    local Lval = ipc.readLvar(Lvar)
    if Lval == 0 then
        FNX_PED_SPOILERARM_off ()
    else
        FNX_PED_SPOILERARM_on ()
    end
end

-- $$ Engines

function FNX_PED_ENG_MODE_crank()
    FNX_PED_ENG_MODE_set(0)
end

function FNX_PED_ENG_MODE_norm()
    FNX_PED_ENG_MODE_set(1)
end

function FNX_PED_ENG_MODE_start()
    FNX_PED_ENG_MODE_set(2)
end

function FNX_PED_ENG_MODE_toggle()
    local Lvar = 'L:S_ENG_MODE'
    if ipc.readLvar(Lvar) < 2 then
        FNX_PED_ENG_MODE_start()
    else
        FNX_PED_ENG_MODE_norm()
    end
end

function FNX_PED_ENG_MODE_cycle()
    local Lvar = 'L:S_ENG_MODE'
    local Lval = ipc.readLvar(Lvar)
    if Lval == 0 then
        FNX_PED_ENG_MODE_norm()
    elseif Lval == 1 then
        FNX_PED_ENG_MODE_start()
    else
        FNX_PED_ENG_MODE_crank()
    end
end

function FNX_PED_ENG_1_on()
    local Lvar = 'L:S_ENG_MASTER_1'
    ipc.writeLvar(Lvar, 1)
    DspShow('ENG1','on')
end

function FNX_PED_ENG_1_off()
    local Lvar = 'L:S_ENG_MASTER_1'
    ipc.writeLvar(Lvar, 0)
    DspShow('ENG1','off')
end

function FNX_PED_ENG_1_toggle()
    local Lvar = 'L:S_ENG_MASTER_1'
    local Lval = ipc.readLvar(Lvar)
    if Lval == 0 then
        FNX_PED_ENG_1_on()
    else
        FNX_PED_ENG_1_off()
    end
end

function FNX_PED_ENG_2_on()
    local Lvar = 'L:S_ENG_MASTER_2'
    ipc.writeLvar(Lvar, 1)
    DspShow('ENG2','on')
end

function FNX_PED_ENG_2_off()
    local Lvar = 'L:S_ENG_MASTER_2'
    ipc.writeLvar(Lvar, 0)
    DspShow('ENG2','on')
end

function FNX_PED_ENG_2_toggle()
    local Lvar = 'L:S_ENG_MASTER_2'
    local Lval = ipc.readLvar(Lvar)
    if Lval == 0 then
        FNX_PED_ENG_2_on()
    else
        FNX_PED_ENG_2_off()
    end
end

function FNX_PED_ENG_MODE_set(engMode)
    local Lvar = 'L:S_ENG_MODE'
    ipc.writeLvar(Lvar, engMode)
    local modeText = {'crnk','norm','strt'}
    DspShow('ENG1',modeText[engMode + 1 ])
end

function FNX_PED_ATHR_L_Disconnect()
    local Lvar = "L:S_FC_THR_INST_DISCONNECT1"
    ipc.writeLvar(Lvar, 1)
    DspShow('ATHR', 'disc')
    ipc.sleep(300)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_ATHR_R_Disconnect()
    local Lvar = "L:S_FC_THR_INST_DISCONNECT2"
    ipc.writeLvar(Lvar, 1)
    DspShow('ATHR', 'disc')
    ipc.sleep(300)
    ipc.writeLvar(Lvar, 0)
end

-- $$ Park Brake

function FNX_PED_PARKBRAKE_on()
    ipc.writeLvar("L:S_MIP_PARKING_BRAKE", 1)
    DspShow('PARK','on')
end

function FNX_PED_PARKBRAKE_off()
    ipc.writeLvar("L:S_MIP_PARKING_BRAKE", 0)
    DspShow('PARK','off')
end

function FNX_PED_PARKBRAKE_toggle()
    if ipc.readLvar("L:S_MIP_PARKING_BRAKE") > 0 then
        FNX_PED_PARKBRAKE_off()
    else
        FNX_PED_PARKBRAKE_on()
    end
end

-- ## Transponder / ATC / TCAS

-- $$ Transponder Mode

function FNX_PED_XPDR_MODE_on()
    ipc.writeLvar("L:S_XPDR_OPERATION", 2)
    DspShow('XPDR','on')
end

function FNX_PED_XPDR_MODE_auto()
    ipc.writeLvar("L:S_XPDR_OPERATION", 1)
    DspShow('XPDR','auto')
end

function FNX_PED_XPDR_MODE_stby()
    ipc.writeLvar("L:S_XPDR_OPERATION", 0)
    DspShow('XPDR','stby')
end

function FNX_PED_XPDR_MODE_toggle()
    local val = ipc.readLvar("L:S_XPDR_OPERATION")
    if val > 1 then
        FNX_PED_XPDR_MODE_stby()
    else
        FNX_PED_XPDR_MODE_on()
    end
end

function FNX_PED_XPDR_MODE_cycle()
    local val = ipc.readLvar("L:S_XPDR_OPERATION")
    if val > 1 then
        FNX_PED_XPDR_MODE_stby()
    elseif val > 0 then
        FNX_PED_XPDR_MODE_on()
    else
        FNX_PED_XPDR_MODE_auto()
    end
end

function FNX_PED_XPDR_MODE_inc()
    Lvar = "L:S_XPDR_OPERATION"
    Lval = ipc.readLvar(Lvar)
    if Lval < 2 then
        Lval = Lval + 1
    end
    if Lval == 0 then
        FNX_PED_XPDR_MODE_stby()
    elseif Lval == 1 then
        FNX_PED_XPDR_MODE_auto()
    else
        FNX_PED_XPDR_MODE_on()
    end
end

function FNX_PED_XPDR_MODE_dec()
    Lvar = "L:S_XPDR_OPERATION"
    Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        Lval = Lval - 1
    end
    if Lval == 0 then
        FNX_PED_XPDR_MODE_stby()
    elseif Lval == 1 then
        FNX_PED_XPDR_MODE_auto()
    else
        FNX_PED_XPDR_MODE_on()
    end
end

-- ATC SYSTEM 1/2 NOT ENABLED DUE TO VPILOT LIMITATION

-- $$ Transponder System = Not available

function FNX_PED_XPDR_ATC_1()
    Lvar = "L:S_XPDR_ATC"
    ipc.writeLvar(Lvar, 0)
    DspShow('ATC','1')
end

function FNX_PED_XPDR_ATC_2()
    Lvar = "L:S_XPDR_ATC"
    ipc.writeLvar(Lvar, 1)
    DspShow('ATC','2')
end

function FNX_PED_XPDR_ATC_toggle()
    Lvar = "L:S_XPDR_ATC"
    Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        FNX_PED_XPDR_ATC_1()
    else
        FNX_PED_XPDR_ATC_2()
    end
end

-- $$ Transponder Altitude / RPTG

function FNX_PED_XPDR_ALT_off()
    Lvar = "L:S_XPDR_ALTREPORTING"
    ipc.writeLvar(Lvar, 0)
    DspShow('ALT','off')
end

function FNX_PED_XPDR_ALT_on()
    Lvar = "L:S_XPDR_ALTREPORTING"
    ipc.writeLvar(Lvar, 1)
    DspShow('ALT','on')
end

function FNX_PED_XPDR_ALT_toggle()
    Lvar = "L:S_XPDR_ALTREPORTING"
    Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        FNX_PED_XPDR_ALT_off()
    else
        FNX_PED_XPDR_ALT_on()
    end
end

-- $$ TCAS Traffic

function FNX_PED_XPDR_TCAS_TFC_thrt()
    Lvar = "L:S_TCAS_RANGE"
    ipc.writeLvar(Lvar, 0)
    DspShow('TRFC','thrt')
end

function FNX_PED_XPDR_TCAS_TFC_all()
    Lvar = "L:S_TCAS_RANGE"
    ipc.writeLvar(Lvar, 1)
    DspShow('TRFC','all')
end

function FNX_PED_XPDR_TCAS_TFC_abv()
    Lvar = "L:S_TCAS_RANGE"
    ipc.writeLvar(Lvar, 2)
    DspShow('TRFC','abv')
end

function FNX_PED_XPDR_TCAS_TFC_blw()
    Lvar = "L:S_TCAS_RANGE"
    ipc.writeLvar(Lvar, 3)
    DspShow('TRFC','blw')
end

function FNX_PED_XPDR_TCAS_TFC_inc()
    Lvar = "L:S_TCAS_RANGE"
    Lval = ipc.readLvar(Lvar)
    if Lval < 3 then
        Lval = Lval + 1
    end
    if Lval == 0 then
        FNX_PED_XPDR_TCAS_TFC_thrt()
    elseif Lval == 3 then
        FNX_PED_XPDR_TCAS_TFC_blw()
    elseif Lval == 2 then
        FNX_PED_XPDR_TCAS_TFC_abv()
    else
        FNX_PED_XPDR_TCAS_TFC_all()
    end
end

function FNX_PED_XPDR_TCAS_TFC_dec()
    Lvar = "L:S_TCAS_RANGE"
    Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        Lval = Lval - 1
    end
    if Lval == 0 then
        FNX_PED_XPDR_TCAS_TFC_thrt()
    elseif Lval == 3 then
        FNX_PED_XPDR_TCAS_TFC_blw()
    elseif Lval == 2 then
        FNX_PED_XPDR_TCAS_TFC_abv()
    else
        FNX_PED_XPDR_TCAS_TFC_all()
    end
end

function FNX_PED_XPDR_TCAS_TFC_cycle()
    Lvar = "L:S_TCAS_RANGE"
    Lval = ipc.readLvar(Lvar)
    if Lval > 2 then
        FNX_PED_XPDR_TCAS_TFC_thrt()
    elseif Lval > 1 then
        FNX_PED_XPDR_TCAS_TFC_blw()
    elseif Lval > 0 then
        FNX_PED_XPDR_TCAS_TFC_abv()
    else
        FNX_PED_XPDR_TCAS_TFC_all()
    end
end

-- $$ TCAS Mode

function FNX_PED_XPDR_TCAS_MODE_stby()
    Lvar = "L:S_XPDR_MODE"
    ipc.writeLvar(Lvar, 0)
    DspShow('TCAS','stby')
end

function FNX_PED_XPDR_TCAS_MODE_ta()
    Lvar = "L:S_XPDR_MODE"
    ipc.writeLvar(Lvar, 1)
    DspShow('TCAS','ta')
end

function FNX_PED_XPDR_TCAS_MODE_tara()
    Lvar = "L:S_XPDR_MODE"
    ipc.writeLvar(Lvar, 2)
    DspShow('TCAS','tara')
end

function FNX_PED_XPDR_TCAS_MODE_inc()
    Lvar = "L:S_XPDR_MODE"
    Lval = ipc.readLvar(Lvar)
    if Lval < 2 then
        Lval = Lval + 1
    end
    if Lval == 0 then
        FNX_PED_XPDR_TCAS_MODE_stby()
    elseif Lval == 1 then
        FNX_PED_XPDR_TCAS_MODE_ta()
    else
        FNX_PED_XPDR_TCAS_MODE_tara()
    end
end

function FNX_PED_XPDR_TCAS_MODE_dec()
    Lvar = "L:S_XPDR_MODE"
    Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        Lval = Lval - 1
    end
    if Lval == 0 then
        FNX_PED_XPDR_TCAS_MODE_stby()
    elseif Lval == 1 then
        FNX_PED_XPDR_TCAS_MODE_ta()
    else
        FNX_PED_XPDR_TCAS_MODE_tara()
    end
end

function FNX_PED_XPDR_TCAS_MODE_cycle()
    Lvar = "L:S_XPDR_MODE"
    Lval = ipc.readLvar(Lvar)
    if Lval > 1 then
        FNX_PED_XPDR_TCAS_MODE_stby()
    elseif Lval > 0 then
        FNX_PED_XPDR_TCAS_MODE_tara()
    else
        FNX_PED_XPDR_TCAS_MODE_ta()
    end
end

-- $$ Transponder Mode and TCAS

function FNX_PED_XPDR_MODE_and_TCAS_on()
	FNX_PED_XPDR_MODE_on()
	FNX_PED_XPDR_TCAS_MODE_tara()
end

function FNX_PED_XPDR_MODE_and_TCAS_off()
	FNX_PED_XPDR_MODE_stby()
	FNX_PED_XPDR_TCAS_MODE_stby()
end

-- $$ Transponder Ident

function FNX_PED_XPDR_IDENT_press()
    ipc.writeLvar('L:S_XPDR_IDENT', 1)
    DspShow('IDNT', 'on')
    ipc.sleep(100)
    ipc.writeLvar('L:S_XPDR_IDENT', 0)
end

-- ## RADAR

-- $$ Predictive Wind Shear (PWS)

--[[     NOT IMPLEMENTED
function FNX_PED_RDR_PWS_off()
    ipc.writeLvar("L:FNX_SWITCH_RADAR_PWS_Position", 0)
    DspShow('PWS', 'off')
end

function FNX_PED_RDR_PWS_auto()
    ipc.writeLvar("L:FNX_SWITCH_RADAR_PWS_Position", 1)
    DspShow('PWS', 'auto')
end

function FNX_PED_RDR_PWS_toggle()
    local pos = ipc.readLvar("L:FNX_SWITCH_RADAR_PWS_Position")
    if pos == nil then return end
    if pos == 0 then
        FNX_PED_RDR_PWS_auto()
    else
        FNX_PED_RDR_PWS_off()
    end
end
--]]

-- $$ WX System

function FNX_PED_RDR_SYS_1()
    local Lvar = "L:S_WR_SYS"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        DspShow('SYS', '1')
    end
end

function FNX_PED_RDR_SYS_off()
    local Lvar = "L:S_WR_SYS"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        DspShow('SYS', 'off')
    end
end

function FNX_PED_RDR_SYS_2()
    local Lvar = "L:S_WR_SYS"
    if ipc.readLvar(Lvar) ~= 2 then
        ipc.writeLvar(Lvar, 2)
        DspShow('SYS', '2')
    end
end

function FNX_PED_RDR_SYS_toggle()
    local Lvar = "L:S_WR_SYS"
    if ipc.readLvar(Lvar) ~= 0 then
        FNX_PED_RDR_SYS_1()
    else
        FNX_PED_RDR_SYS_off()
    end
end

-- $$ WX Multiscan

function FNX_PED_RDR_MULTISCAN_man()
    local Lvar = "L:S_WR_MULTISCAN"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        DspShow('MSCN', 'man')
    end
end

function FNX_PED_RDR_MULTISCAN_auto()
    local Lvar = "L:S_WR_MULTISCAN"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        DspShow('MSCN', 'auto')
    end
end

function FNX_PED_RDR_MULTISCAN_toggle()
    local Lvar = "L:S_WR_MULTISCAN"
    if ipc.readLvar(Lvar) ~= 0 then
        FNX_PED_RDR_MULTISCAN_man()
    else
        FNX_PED_RDR_MULTISCAN_auto()
    end
end

-- $$ WX GCS

function FNX_PED_RDR_GCS_off()
    local Lvar = "L:S_WR_GCS"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        DspShow('GCS', 'off')
    end
end

function FNX_PED_RDR_GCS_auto()
    local Lvar = "L:S_WR_GCS"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        DspShow('GCS', 'auto')
    end
end

function FNX_PED_RDR_GCS_toggle()
    local Lvar = "L:S_WR_GCS"
    if ipc.readLvar(Lvar) ~= 0 then
        FNX_PED_RDR_GCS_off()
    else
        FNX_PED_RDR_GCS_auto()
    end
end

-- $$ WX Mode

function FNX_PED_RDR_MODE_inc()
    local Lvar = 'L:S_WR_MODE'
    local Lval = ipc.readLvar(Lvar)
    if Lval < 3 then
        ipc.writeLvar(Lvar, Lval + 1)
    end
end

function FNX_PED_RDR_MODE_dec()
    local Lvar = 'L:S_WR_MODE'
    local Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        ipc.writeLvar(Lvar, Lval - 1)
    end
end

function FNX_PED_RDR_MODE_cycle()
    local Lvar = 'L:S_WR_MODE'
    local Lval = ipc.readLvar(Lvar)
    if Lval < 3 then
        FNX_PED_RDR_MODE_inc()
    else
        FNX_PED_RDR_MODE_wx()
    end
end

function FNX_PED_RDR_MODE_wx()
    local Lvar = 'L:S_WR_MODE'
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        DspShow('WXMD', 'wx')
    end
end

function FNX_PED_RDR_MODE_wxt()
    local Lvar = 'L:S_WR_MODE'
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        DspShow('WXMD', 'wx+t')
    end
end

function FNX_PED_RDR_MODE_wxthaz()
    local Lvar = 'L:S_WR_MODE'
    if ipc.readLvar(Lvar) ~= 2 then
        ipc.writeLvar(Lvar, 2)
        DspShow('WXMD', 'wxth')
    end
end

function FNX_PED_RDR_MODE_map()
    local Lvar = 'L:S_WR_MODE'
    if ipc.readLvar(Lvar) ~= 3 then
        ipc.writeLvar(Lvar, 3)
        DspShow('WXMD', 'map')
    end
end

-- $$ WX Gain

function FNX_PED_RDR_GAIN_inc()
    local Lvar = 'L:A_WR_GAIN'
    local Lval = ipc.readLvar(Lvar)
    if Lval < 5 then
        ipc.writeLvar(Lvar, Lval + 1)
    end
end

function FNX_PED_RDR_GAIN_dec()
    local Lvar = 'L:A_WR_GAIN'
    local Lval = ipc.readLvar(Lvar)
    if Lval > -5 then
        ipc.writeLvar(Lvar, Lval - 1)
    end
end

function FNX_PED_RDR_GAIN_min()
    local Lvar = 'L:A_WR_GAIN'
    if ipc.readLvar(Lvar) ~= -5 then
        ipc.writeLvar(Lvar, -5)
        DspShow('GAIN', 'min')
    end
end

function FNX_PED_RDR_GAIN_cal()
    local Lvar = 'L:A_WR_GAIN'
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        DspShow('GAIN', 'cal')
    end
end

function FNX_PED_RDR_GAIN_max()
    local Lvar = 'L:A_WR_GAIN'
    if ipc.readLvar(Lvar) ~= 5 then
        ipc.writeLvar(Lvar, 5)
        DspShow('GAIN', 'max')
    end
end

-- $$ WX Tilt

function FNX_PED_RDR_TILT_inc()
    local Lvar = 'L:A_WR_TILT'
    local Lval = ipc.readLvar(Lvar)
    if Lval < 5 then
        ipc.writeLvar(Lvar, Lval + 1)
    end
end

function FNX_PED_RDR_TILT_dec()
    local Lvar = 'L:A_WR_TILT'
    local Lval = ipc.readLvar(Lvar)
    if Lval > -5 then
        ipc.writeLvar(Lvar, Lval - 1)
    end
end

function FNX_PED_RDR_TILT_min()
    local Lvar = 'L:A_WR_TILT'
    if ipc.readLvar(Lvar) ~= -15 then
        ipc.writeLvar(Lvar, -15)
        DspShow('TILT', '-15')
    end
end

function FNX_PED_RDR_TILT_0()
    local Lvar = 'L:A_WR_TILT'
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        DspShow('TILT', '0')
    end
end

function FNX_PED_RDR_TILT_max()
    local Lvar = 'L:A_WR_TILT'
    if ipc.readLvar(Lvar) ~= 15 then
        ipc.writeLvar(Lvar, 15)
        DspShow('TILT', '+15')
    end
end

-- ## Radios

function FNX_PED_RADIO_POWER_ALL_on()
	FNX_PED_RADIO_POWER_1_on()
	FNX_PED_RADIO_POWER_2_on()
end

function FNX_PED_RADIO_POWER_ALL_off()
	FNX_PED_RADIO_POWER_1_off()
	FNX_PED_RADIO_POWER_2_off()
end

function FNX_PED_RADIO_POWER_1_on()
    Lvar = "L:S_PED_RMP1_POWER"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
    end
end

function FNX_PED_RADIO_POWER_1_off()
    Lvar = "L:S_PED_RMP1_POWER"
    if ipc.readLvar(Lvar) == 1 then
        ipc.writeLvar(Lvar, 0)
    end
end

function FNX_PED_RADIO_POWER_1_toggle()
    Lvar = "L:S_PED_RMP1_POWER"
    if ipc.readLvar(Lvar) == 1 then
        FNX_PED_RADIO_POWER_1_off()
    else
        FNX_PED_RADIO_POWER_1_on()
    end
end

function FNX_PED_RADIO_POWER_2_on()
    Lvar = "L:S_PED_RMP2_POWER"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
    end
end

function FNX_PED_RADIO_POWER_2_off()
    Lvar = "L:S_PED_RMP2_POWER"
    if ipc.readLvar(Lvar) == 1 then
        ipc.writeLvar(Lvar, 0)
    end
end

function FNX_PED_RADIO_POWER_2_toggle()
    Lvar = "L:S_PED_RMP2_POWER"
    if ipc.readLvar(Lvar) == 1 then
        FNX_PED_RADIO_POWER_2_off()
    else
        FNX_PED_RADIO_POWER_2_on()
    end
end

-- ## ECAM #####################################

function FNX_PED_ECAM_TOCONFIG_press()
    local Lvar = 'L:S_ECAM_TO'
    ipc.writeLvar(Lvar, 1)
    DspShow('TOCG','pres')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_ECAM_eng()
    local Lvar = 'L:S_ECAM_ENGINE'
    ipc.writeLvar(Lvar, 1)
    DspShow('ECAM','eng')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_ECAM_bleed()
    local Lvar = 'L:S_ECAM_BLEED'
    ipc.writeLvar(Lvar, 1)
    DspShow('ECAM','bled')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_ECAM_press()
    local Lvar = 'L:S_ECAM_CAB_PRESS'
    ipc.writeLvar(Lvar, 1)
    DspShow('ECAM','pres')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_ECAM_elec()
    local Lvar = 'L:S_ECAM_ELEC'
    ipc.writeLvar(Lvar, 1)
    DspShow('ECAM','elec')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_ECAM_hyd()
    local Lvar = 'L:S_ECAM_HYD'
    ipc.writeLvar(Lvar, 1)
    DspShow('ECAM','hyd')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_ECAM_fuel()
    local Lvar = 'L:S_ECAM_FUEL'
    ipc.writeLvar(Lvar, 1)
    DspShow('ECAM','fuel')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_ECAM_apu()
    local Lvar = 'L:S_ECAM_APU'
    ipc.writeLvar(Lvar, 1)
    DspShow('ECAM','apu')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_ECAM_cond()
    local Lvar = 'L:S_ECAM_COND'
    ipc.writeLvar(Lvar, 1)
    DspShow('ECAM','cond')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_ECAM_door()
    local Lvar = 'L:S_ECAM_DOOR'
    ipc.writeLvar(Lvar, 1)
    DspShow('ECAM','door')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_ECAM_wheel()
    local Lvar = 'L:S_ECAM_WHEEL'
    ipc.writeLvar(Lvar, 1)
    DspShow('ECAM','whel')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_ECAM_fctl()
    local Lvar = 'L:S_ECAM_FCTL'
    ipc.writeLvar(Lvar, 1)
    DspShow('ECAM','fctl')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_ECAM_sts()
    local Lvar = 'L:S_ECAM_STATUS'
    ipc.writeLvar(Lvar, 1)
    DspShow('ECAM','sts')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_ECAM_all()
    local Lvar = 'L:S_ECAM_ALL'
    ipc.writeLvar(Lvar, 1)
    DspShow('ECAM','all')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_ECAM_clrl()
    local Lvar = 'L:S_ECAM_CLR_LEFT'
    ipc.writeLvar(Lvar, 1)
    DspShow('ECAM','clrl')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_ECAM_clrr()
    local Lvar = 'L:S_ECAM_CLR_RIGHT'
    ipc.writeLvar(Lvar, 1)
    DspShow('ECAM','clrr')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_ECAM_rcl()
    local Lvar = 'L:S_ECAM_RCL'
    ipc.writeLvar(Lvar, 1)
    DspShow('ECAM','rcl')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_ECAM_EMER_cancel()
    local Lvar = 'L:S_ECAM_EMER_CANCEL'
    ipc.writeLvar(Lvar, 1)
    DspShow('ECAM','emer')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

-- ## MCDU Left Functions

-- $$ line 1

function FNX_PED_MCDUL_BTN_dir()
    local Lvar = 'L:S_CDU1_KEY_DIR'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','dir')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_prog()
    local Lvar = 'L:S_CDU1_KEY_PROG'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','prog')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_perf()
    local Lvar = 'L:S_CDU1_KEY_PERF'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','perf')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_init()
    local Lvar = 'L:S_CDU1_KEY_INIT'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','init')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_data()
    local Lvar = 'L:S_CDU1_KEY_DATA'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','data')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

-- $$ line 2

function FNX_PED_MCDUL_BTN_fpln()
    local Lvar = 'L:S_CDU1_KEY_FPLN'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','fpln')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_radnav()
    local Lvar = 'L:S_CDU1_KEY_RAD_NAV'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','rad')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_fuel()
    local Lvar = 'L:S_CDU1_KEY_FUEL_PRED'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','fuel')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_secfpln()
    local Lvar = 'L:S_CDU1_KEY_SEC_FPLN'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','sec')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_atc()
    local Lvar = 'L:S_CDU1_KEY_ATC_COM'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','atc')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

-- $$

function FNX_PED_MCDUL_BTN_menu()
    local Lvar = 'L:S_CDU1_KEY_MENU'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','menu')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_airport()
    local Lvar = 'L:S_CDU1_KEY_AIRPORT'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','arpt')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

-- $$ Arrows

function FNX_PED_MCDUL_BTN_up()
    local Lvar = 'L:S_CDU1_KEY_ARROW_UP'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','up')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_down()
    local Lvar = 'L:S_CDU1_KEY_ARROW_DOWN'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','down')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_left()
    local Lvar = 'L:S_CDU1_KEY_ARROW_LEFT'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','left')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_right()
    local Lvar = 'L:S_CDU1_KEY_ARROW_RIGHT'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','rght')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

-- $$ LSK Left

function FNX_PED_MCDUL_BTN_L1()
    local Lvar = 'L:S_CDU1_KEY_LSK1L'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','L1')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_L2()
    local Lvar = 'L:S_CDU1_KEY_LSK2L'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','L2')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_L3()
    local Lvar = 'L:S_CDU1_KEY_LSK3L'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','L3')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_L4()
    local Lvar = 'L:S_CDU1_KEY_LSK4L'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','L4')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_L5()
    local Lvar = 'L:S_CDU1_KEY_LSK5L'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','L5')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_L6()
    local Lvar = 'L:S_CDU1_KEY_LSK6L'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','L6')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

-- $$ LSK Right

function FNX_PED_MCDUL_BTN_R1()
    local Lvar = 'L:S_CDU1_KEY_LSK1R'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','R1')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_R2()
    local Lvar = 'L:S_CDU1_KEY_LSK2R'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','R2')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_R3()
    local Lvar = 'L:S_CDU1_KEY_LSK3R'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','R3')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_R4()
    local Lvar = 'L:S_CDU1_KEY_LSK4R'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','R4')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_R5()
    local Lvar = 'L:S_CDU1_KEY_LSK5R'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','R5')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_R6()
    local Lvar = 'L:S_CDU1_KEY_LSK6R'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','R6')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

-- ## MCDU Left Aplhanumeric

-- $$ Letters

function FNX_PED_MCDUL_BTN_A()
    local Lvar = 'L:S_CDU1_KEY_A'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','A')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_B()
    local Lvar = 'L:S_CDU1_KEY_B'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','B')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_C()
    local Lvar = 'L:S_CDU1_KEY_C'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','C')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_D()
    local Lvar = 'L:S_CDU1_KEY_D'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','D')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_E()
    local Lvar = 'L:S_CDU1_KEY_E'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','E')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_F()
    local Lvar = 'L:S_CDU1_KEY_F'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','F')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_G()
    local Lvar = 'L:S_CDU1_KEY_G'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','G')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_H()
    local Lvar = 'L:S_CDU1_KEY_H'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','H')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_I()
    local Lvar = 'L:S_CDU1_KEY_I'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','I')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_J()
    local Lvar = 'L:S_CDU1_KEY_J'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','J')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_K()
    local Lvar = 'L:S_CDU1_KEY_K'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','K')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_L()
    local Lvar = 'L:S_CDU1_KEY_L'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','L')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_M()
    local Lvar = 'L:S_CDU1_KEY_M'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','M')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_N()
    local Lvar = 'L:S_CDU1_KEY_N'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','N')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_O()
    local Lvar = 'L:S_CDU1_KEY_O'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','0')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_P()
    local Lvar = 'L:S_CDU1_KEY_P'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','P')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_Q()
    local Lvar = 'L:S_CDU1_KEY_Q'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','Q')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_R()
    local Lvar = 'L:S_CDU1_KEY_R'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','R')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_S()
    local Lvar = 'L:S_CDU1_KEY_S'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','S')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_T()
    local Lvar = 'L:S_CDU1_KEY_T'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','T')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_U()
    local Lvar = 'L:S_CDU1_KEY_U'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','U')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_V()
    local Lvar = 'L:S_CDU1_KEY_V'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','V')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_W()
    local Lvar = 'L:S_CDU1_KEY_W'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','W')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_X()
    local Lvar = 'L:S_CDU1_KEY_X'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','X')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_Y()
    local Lvar = 'L:S_CDU1_KEY_Y'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','Y')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_Z()
    local Lvar = 'L:S_CDU1_KEY_Z'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','Z')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

-- $$ Digits

function FNX_PED_MCDUL_BTN_1()
    local Lvar = 'L:S_CDU1_KEY_1'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','1')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_2()
    local Lvar = 'L:S_CDU1_KEY_2'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','2')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_3()
    local Lvar = 'L:S_CDU1_KEY_3'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','3')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_4()
    local Lvar = 'L:S_CDU1_KEY_4'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','4')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_5()
    local Lvar = 'L:S_CDU1_KEY_5'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','5')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_6()
    local Lvar = 'L:S_CDU1_KEY_6'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','6')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_7()
    local Lvar = 'L:S_CDU1_KEY_7'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','7')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_8()
    local Lvar = 'L:S_CDU1_KEY_8'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','8')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_9()
    local Lvar = 'L:S_CDU1_KEY_9'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','9')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_0()
    local Lvar = 'L:S_CDU1_KEY_0'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','0')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

-- $$ Signs

function FNX_PED_MCDUL_BTN_dot()
    local Lvar = 'L:S_CDU1_KEY_DOT'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','dot')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_plusminus()
    local Lvar = 'L:S_CDU1_KEY_MINUS'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','+/-')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_sp()
    local Lvar = 'L:S_CDU1_KEY_SPACE'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','spc')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_div()
    local Lvar = 'L:S_CDU1_KEY_SLASH'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','/')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_ovfy()
    local Lvar = 'L:S_CDU1_KEY_OVFLY'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','ofly')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

function FNX_PED_MCDUL_BTN_clr()
    local Lvar = 'L:S_CDU1_KEY_CLEAR'
    ipc.writeLvar(Lvar, 1)
    DspShow('CDU1','clr')
    ipc.sleep(50)
    ipc.writeLvar(Lvar, 0)
end

-- ## Cockpit Internal Lighting

-- $$ integal overhead

function FNX_OVHD_INTLT_INTEG_inc()
    local Lvar = 'L:A_OH_LIGHTING_OVD'
    local Lval = ipc.readLvar(Lvar)
    if Lval < 1 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval + 0.1)
    end
end

function FNX_OVHD_INTLT_INTEG_dec()
    local Lvar = 'L:A_OH_LIGHTING_OVD'
    local Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval - 0.1)
    end
end

function FNX_OVHD_INTLT_INTEG_0()
    local Lvar = 'L:A_OH_LIGHTING_OVD'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.0)
end

function FNX_OVHD_INTLT_INTEG_50()
    local Lvar = 'L:A_OH_LIGHTING_OVD'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.5)
end

function FNX_OVHD_INTLT_INTEG_100()
    local Lvar = 'L:A_OH_LIGHTING_OVD'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 1.0)
end

-- $$ integal pedestal

function FNX_PED_INTLT_INTEG_inc()
    local Lvar = 'L:A_PED_LIGHTING_PEDESTAL'
    local Lval = ipc.readLvar(Lvar)
    if Lval < 1 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval + 0.1)
    end
end

function FNX_PED_INTLT_INTEG_dec()
    local Lvar = 'L:A_PED_LIGHTING_PEDESTAL'
    local Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval - 0.1)
    end
end

function FNX_PED_INTLT_INTEG_0()
    local Lvar = 'L:A_PED_LIGHTING_PEDESTAL'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.0)
end

function FNX_PED_INTLT_INTEG_50()
    local Lvar = 'L:A_PED_LIGHTING_PEDESTAL'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.5)
end

function FNX_PED_INTLT_INTEG_100()
    local Lvar = 'L:A_PED_LIGHTING_PEDESTAL'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 1.0)
end

-- $$ flood main

function FNX_PED_INTLT_FLOOD_MAIN_inc()
    local Lvar = 'L:A_MIP_LIGHTING_FLOOD_MAIN'
    local Lval = ipc.readLvar(Lvar)
    if Lval < 1 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval + 0.1)
    end
end

function FNX_PED_INTLT_FLOOD_MAIN_dec()
    local Lvar = 'L:A_MIP_LIGHTING_FLOOD_MAIN'
    local Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval - 0.1)
    end
end

function FNX_PED_INTLT_FLOOD_MAIN_0()
    local Lvar = 'L:A_MIP_LIGHTING_FLOOD_MAIN'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.0)
end

function FNX_PED_INTLT_FLOOD_MAIN_50()
    local Lvar = 'L:A_MIP_LIGHTING_FLOOD_MAIN'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.5)
end

function FNX_PED_INTLT_FLOOD_MAIN_100()
    local Lvar = 'L:A_MIP_LIGHTING_FLOOD_MAIN'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 1.0)
end

-- $$ flood pedestal

function FNX_PED_INTLT_FLOOD_PED_inc()
    local Lvar = 'L:A_MIP_LIGHTING_FLOOD_PEDESTAL'
    local Lval = ipc.readLvar(Lvar)
    if Lval < 1 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval + 0.1)
    end
end

function FNX_PED_INTLT_FLOOD_PED_dec()
    local Lvar = 'L:A_MIP_LIGHTING_FLOOD_PEDESTAL'
    local Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval - 0.1)
    end
end

function FNX_PED_INTLT_FLOOD_PED_0()
    local Lvar = 'L:A_MIP_LIGHTING_FLOOD_PEDESTAL'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.0)
end

function FNX_PED_INTLT_FLOOD_PED_50()
    local Lvar = 'L:A_MIP_LIGHTING_FLOOD_PEDESTAL'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.5)
end

function FNX_PED_INTLT_FLOOD_PED_100()
    local Lvar = 'L:A_MIP_LIGHTING_FLOOD_PEDESTAL'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 1.0)
end

-- $$ FCU lighting

function FNX_GLSD_INTLT_FCU_inc()
    local Lvar = 'L:A_FCU_LIGHTING'
    local Lval = ipc.readLvar(Lvar)
    if Lval < 1 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval + 0.1)
    end
end

function FNX_GLSD_INTLT_FCU_dec()
    local Lvar = 'L:A_FCU_LIGHTING'
    local Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval - 0.1)
    end
end

function FNX_GLSD_INTLT_FCU_0()
    local Lvar = 'L:A_FCU_LIGHTING'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.0)
end

function FNX_GLSD_INTLT_FCU_50()
    local Lvar = 'L:A_FCU_LIGHTING'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.5)
end

function FNX_GLSD_INTLT_FCU_100()
    local Lvar = 'L:A_FCU_LIGHTING'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 1.0)
end

-- $$ FCU text

function FNX_GLSD_INTLT_FCU_TEXT_inc()
    local Lvar = 'L:A_FCU_LIGHTING_TEXT'
    local Lval = ipc.readLvar(Lvar)
    if Lval < 1 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval + 0.1)
    end
end

function FNX_GLSD_INTLT_FCU_TEXT_dec()
    local Lvar = 'L:A_FCU_LIGHTING_TEXT'
    local Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval - 0.1)
    end
end

function FNX_GLSD_INTLT_FCU_TEXT_0()
    local Lvar = 'L:A_FCU_LIGHTING_TEXT'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.0)
end

function FNX_GLSD_INTLT_FCU_TEXT_50()
    local Lvar = 'L:A_FCU_LIGHTING_TEXT'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.5)
end

function FNX_GLSD_INTLT_FCU_TEXT_100()
    local Lvar = 'L:A_FCU_LIGHTING_TEXT'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 1.0)
end

-- $$ Map left

function FNX_MPNL_INTLT_MAP_L_inc()
    local Lvar = 'L:A_MIP_LIGHTING_MAP_L'
    local Lval = ipc.readLvar(Lvar)
    if Lval < 1 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval + 0.1)
    end
end

function FNX_MPNL_INTLT_MAP_L_dec()
    local Lvar = 'L:A_MIP_LIGHTING_MAP_L'
    local Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval - 0.1)
    end
end

function FNX_MPNL_INTLT_MAP_L_0()
    local Lvar = 'L:A_MIP_LIGHTING_MAP_L'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.0)
end

function FNX_MPNL_INTLT_MAP_L_50()
    local Lvar = 'L:A_MIP_LIGHTING_MAP_L'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.5)
end

function FNX_MPNL_INTLT_MAP_L_100()
    local Lvar = 'L:A_MIP_LIGHTING_MAP_L'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 1.0)
end

-- $$ Map right

function FNX_MPNL_INTLT_MAP_R_inc()
    local Lvar = 'L:A_MIP_LIGHTING_MAP_R'
    local Lval = ipc.readLvar(Lvar)
    if Lval < 1 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval + 0.1)
    end
end

function FNX_MPNL_INTLT_MAP_R_dec()
    local Lvar = 'L:A_MIP_LIGHTING_MAP_R'
    local Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval - 0.1)
    end
end

function FNX_MPNL_INTLT_MAP_R_0()
    local Lvar = 'L:A_MIP_LIGHTING_MAP_R'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.0)
end

function FNX_MPNL_INTLT_MAP_R_50()
    local Lvar = 'L:A_MIP_LIGHTING_MAP_R'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.5)
end

function FNX_MPNL_INTLT_MAP_R_100()
    local Lvar = 'L:A_MIP_LIGHTING_MAP_R'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 1.0)
end

-- $$ Reading Capt left

function FNX_MPNL_INTLT_READING_L_inc()
    local Lvar = 'L:A_OH_LIGHTING_READING_CAPT'
    local Lval = ipc.readLvar(Lvar)
    if Lval < 1 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval + 0.1)
    end
end

function FNX_MPNL_INTLT_READING_L_dec()
    local Lvar = 'L:A_OH_LIGHTING_READING_CAPT'
    local Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval - 0.1)
    end
end

function FNX_MPNL_INTLT_READING_L_0()
    local Lvar = 'L:A_OH_LIGHTING_READING_CAPT'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.0)
end

function FNX_MPNL_INTLT_READING_L_50()
    local Lvar = 'L:A_OH_LIGHTING_READING_CAPT'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.5)
end

function FNX_MPNL_INTLT_READING_L_100()
    local Lvar = 'L:A_OH_LIGHTING_READING_CAPT'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 1.0)
end

-- $$ Reading FO right

function FNX_MPNL_INTLT_READING_R_inc()
    local Lvar = 'L:A_OH_LIGHTING_READING_FO'
    local Lval = ipc.readLvar(Lvar)
    if Lval < 1 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval + 0.1)
    end
end

function FNX_MPNL_INTLT_READING_R_inc()
    local Lvar = 'L:A_OH_LIGHTING_READING_FO'
    local Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval - 0.1)
    end
end

function FNX_MPNL_INTLT_READING_R_0()
    local Lvar = 'L:A_OH_LIGHTING_READING_FO'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.0)
end

function FNX_MPNL_INTLT_READING_R_50()
    local Lvar = 'L:A_OH_LIGHTING_READING_FO'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.5)
end

function FNX_MPNL_INTLT_READING_R_100()
    local Lvar = 'L:A_OH_LIGHTING_READING_FO'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 1.0)
end

-- ## Display Brightness

-- $$ DU outer Capt

function FNX_MPNL_DU_OUTER_CAPT_inc()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_CO'
    local Lval = ipc.readLvar(Lvar)
    if Lval < 1 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval + 0.1)
    end
end

function FNX_MPNL_DU_OUTER_CAPT_dec()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_CO'
    local Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval - 0.1)
    end
end

function FNX_MPNL_DU_OUTER_CAPT_10()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_CO'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.1)
end

function FNX_MPNL_DU_OUTER_CAPT_50()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_CO'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.5)
end

function FNX_MPNL_DU_OUTER_CAPT_100()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_CO'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 1.0)
end

-- $$ DU inner middle Capt

function FNX_MPNL_DU_INNER_CAPT_inc()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_CI'
    local Lval = ipc.readLvar(Lvar)
    if Lval < 1 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval + 0.1)
    end
end

function FNX_MPNL_DU_INNER_CAPT_dec()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_CI'
    local Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval - 0.1)
    end
end

function FNX_MPNL_DU_INNER_CAPT_10()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_CI'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.1)
end

function FNX_MPNL_DU_INNER_CAPT_50()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_CI'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.5)
end

function FNX_MPNL_DU_INNER_CAPT_100()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_CI'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 1.0)
end

-- $$ DU inner outside Capt

function FNX_MPNL_DU_INNER_BACK_CAPT_inc()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_CI_OUTER'
    local Lval = ipc.readLvar(Lvar)
    if Lval < 1 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval + 0.1)
    end
end

function FNX_MPNL_DU_INNER_BACK_CAPT_dec()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_CI_OUTER'
    local Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval - 0.1)
    end
end

function FNX_MPNL_DU_INNER_BACK_CAPT_10()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_CI_OUTER'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.1)
end

function FNX_MPNL_DU_INNER_BACK_CAPT_50()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_CI_OUTER'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.5)
end

function FNX_MPNL_DU_INNER_BACK_CAPT_100()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_CI_OUTER'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 1.0)
end

-- $$ DU outer FO

function FNX_MPNL_DU_OUTER_FO_inc()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_FO'
    local Lval = ipc.readLvar(Lvar)
    if Lval < 1 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval + 0.1)
    end
end

function FNX_MPNL_DU_OUTER_FO_dec()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_FO'
    local Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval - 0.1)
    end
end

function FNX_MPNL_DU_OUTER_FO_10()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_FO'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.1)
end

function FNX_MPNL_DU_OUTER_FO_50()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_FO'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.5)
end

function FNX_MPNL_DU_OUTER_FO_100()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_FO'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 1.0)
end

-- $$ DU inner middle FO

function FNX_MPNL_DU_INNER_FO_inc()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_FI'
    local Lval = ipc.readLvar(Lvar)
    if Lval < 1 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval + 0.1)
    end
end

function FNX_MPNL_DU_INNER_FO_dec()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_FI'
    local Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval - 0.1)
    end
end

function FNX_MPNL_DU_INNER_FO_10()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_FI'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.1)
end

function FNX_MPNL_DU_INNER_FO_50()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_FI'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.5)
end

function FNX_MPNL_DU_INNER_FO_100()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_FI'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 1.0)
end

-- $$ DU inner outside FO

function FNX_MPNL_DU_INNER_BACK_FO_inc()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_FI_OUTER'
    local Lval = ipc.readLvar(Lvar)
    if Lval < 1 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval + 0.1)
    end
end

function FNX_MPNL_DU_INNER_BACK_FO_dec()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_FI_OUTER'
    local Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval - 0.1)
    end
end

function FNX_MPNL_DU_INNER_BACK_FO_10()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_FI_OUTER'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.1)
end

function FNX_MPNL_DU_INNER_BACK_FO_50()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_FI_OUTER'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.5)
end

function FNX_MPNL_DU_INNER_BACK_FO_100()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_FI_OUTER'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 1.0)
end

-- $$ ECAM upper

function FNX_MPNL_ECAM_U_inc()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_ECAM_U'
    local Lval = ipc.readLvar(Lvar)
    if Lval < 1 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval + 0.1)
    end
end

function FNX_MPNL_ECAM_U_dec()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_ECAM_U'
    local Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval - 0.1)
    end
end

function FNX_MPNL_ECAM_U_10()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_ECAM_U'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.1)
end

function FNX_MPNL_ECAM_U_50()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_ECAM_U'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.5)
end

function FNX_MPNL_ECAM_U_100()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_ECAM_U'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 1.0)
end

-- $$ ECAM lower

function FNX_MPNL_ECAM_L_inc()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_ECAM_L'
    local Lval = ipc.readLvar(Lvar)
    if Lval < 1 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval + 0.1)
    end
end

function FNX_MPNL_ECAM_L_dec()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_ECAM_L'
    local Lval = ipc.readLvar(Lvar)
    if Lval > 0 then
        FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval - 0.1)
    end
end

function FNX_MPNL_ECAM_L_10()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_ECAM_L'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.1)
end

function FNX_MPNL_ECAM_L_50()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_ECAM_L'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 0.5)
end

function FNX_MPNL_ECAM_L_100()
    local Lvar = 'L:A_DISPLAY_BRIGHTNESS_ECAM_L'
    FNX_CKPT_INTLT_DIMMER_set(Lvar, 1.0)
end

-- ## Cockpit Lighting All

-- $$ Cockpit Integal ALL

function FNX_CKPT_INTLT_INTEG_inc()
    FNX_OVHD_INTLT_INTEG_inc()
    FNX_PED_INTLT_INTEG_inc()
    FNX_GLSD_INTLT_FCU_inc()
    FNX_GLSD_INTLT_FCU_TEXT_inc()
end

function FNX_CKPT_INTLT_INTEG_dec()
    FNX_OVHD_INTLT_INTEG_dec()
    FNX_PED_INTLT_INTEG_dec()
    FNX_GLSD_INTLT_FCU_dec()
    FNX_GLSD_INTLT_FCU_TEXT_dec()
end

function FNX_CKPT_INTLT_INTEG_100()
    FNX_OVHD_INTLT_INTEG_100()
    FNX_PED_INTLT_INTEG_100()
    FNX_GLSD_INTLT_FCU_100()
    FNX_GLSD_INTLT_FCU_TEXT_100()
end

function FNX_CKPT_INTLT_INTEG_50()
    FNX_OVHD_INTLT_INTEG_50()
    FNX_PED_INTLT_INTEG_50()
    FNX_GLSD_INTLT_FCU_50()
    FNX_GLSD_INTLT_FCU_TEXT_50()
end

function FNX_CKPT_INTLT_INTEG_0()
    FNX_OVHD_INTLT_INTEG_0()
    FNX_PED_INTLT_INTEG_0()
    FNX_GLSD_INTLT_FCU_0()
    FNX_GLSD_INTLT_FCU_TEXT_0()
end

-- $$ Cockpit Flood Lights

function FNX_CKPT_INTLT_FLOOD_inc()
    FNX_PED_INTLT_FLOOD_MAIN_inc()
    FNX_PED_INTLT_FLOOD_PED_inc()
end

function FNX_CKPT_INTLT_FLOOD_dec()
    FNX_PED_INTLT_FLOOD_MAIN_dec()
    FNX_PED_INTLT_FLOOD_PED_dec()
end

function FNX_CKPT_INTLT_FLOOD_100()
    FNX_PED_INTLT_FLOOD_MAIN_100()
    FNX_PED_INTLT_FLOOD_PED_100()
end

function FNX_CKPT_INTLT_FLOOD_50()
    FNX_PED_INTLT_FLOOD_MAIN_50()
    FNX_PED_INTLT_FLOOD_PED_50()
end

function FNX_CKPT_INTLT_FLOOD_0()
    FNX_PED_INTLT_FLOOD_MAIN_0()
    FNX_PED_INTLT_FLOOD_PED_0()
end

-- $$ PFD/ND/ECAM Displays

function FNX_CKPT_INTLT_DSPLYS_inc()
    FNX_MPNL_DU_OUTER_CAPT_inc()
    FNX_MPNL_DU_INNER_CAPT_inc()
    FNX_MPNL_DU_INNER_BACK_CAPT_inc()
    FNX_MPNL_DU_OUTER_FO_inc()
    FNX_MPNL_DU_INNER_FO_inc()
    FNX_MPNL_DU_INNER_BACK_FO_inc()
    FNX_MPNL_ECAM_U_inc()
    FNX_MPNL_ECAM_L_inc()
end

function FNX_CKPT_INTLT_DSPLYS_dec()
    FNX_MPNL_DU_OUTER_CAPT_dec()
    FNX_MPNL_DU_INNER_CAPT_dec()
    FNX_MPNL_DU_INNER_BACK_CAPT_dec()
    FNX_MPNL_DU_OUTER_FO_dec()
    FNX_MPNL_DU_INNER_FO_dec()
    FNX_MPNL_DU_INNER_BACK_FO_dec()
    FNX_MPNL_ECAM_U_dec()
    FNX_MPNL_ECAM_L_dec()
end

function FNX_CKPT_INTLT_DSPLYS_100()
    FNX_MPNL_DU_OUTER_CAPT_100()
    FNX_MPNL_DU_INNER_CAPT_100()
    FNX_MPNL_DU_INNER_BACK_CAPT_100()
    FNX_MPNL_DU_OUTER_FO_100()
    FNX_MPNL_DU_INNER_FO_100()
    FNX_MPNL_DU_INNER_BACK_FO_100()
    FNX_MPNL_ECAM_U_100()
    FNX_MPNL_ECAM_L_100()
end

function FNX_CKPT_INTLT_DSPLYS_50()
    FNX_MPNL_DU_OUTER_CAPT_50()
    FNX_MPNL_DU_INNER_CAPT_50()
    FNX_MPNL_DU_INNER_BACK_CAPT_50()
    FNX_MPNL_DU_OUTER_FO_50()
    FNX_MPNL_DU_INNER_FO_50()
    FNX_MPNL_DU_INNER_BACK_FO_50()
    FNX_MPNL_ECAM_U_50()
    FNX_MPNL_ECAM_L_50()
end

function FNX_CKPT_INTLT_DSPLYS_10()
    FNX_MPNL_DU_OUTER_CAPT_10()
    FNX_MPNL_DU_INNER_CAPT_10()
    FNX_MPNL_DU_INNER_BACK_CAPT_10()
    FNX_MPNL_DU_OUTER_FO_10()
    FNX_MPNL_DU_INNER_FO_10()
    FNX_MPNL_DU_INNER_BACK_FO_10()
    FNX_MPNL_ECAM_U_10()
    FNX_MPNL_ECAM_L_10()
end

-- ## System functions ################################

-- $$ DO NOT USE OR CHANGE

function InitVars ()

	-- Initialise Custom Event pointers
	InitCustomEvents()

    Airbus = true -- set flag for Airbus MCP2a panels
    P3D = 1 -- flag for imperial altitude conversion

    BaroRef = 1
    BaroMode = 1

    -- Barometer Unit setting
	FNX_GLSD_EFISL_BARO_HPa()
    FNX_GLSD_EFISL_BARO_qnh()
	-- Internal Cockpit Lighting Dimmer values
    FNX_CKPT_INTLT_INTEG = 50
    FNX_CKPT_INTLT_DSPLYS = 50
    FNX_CKPT_INTLT_FLOOD = 50
	-- used to control position of DOME light switch
	FNX_Dome = 2 -- = off

    mode = 0
    rng = 0
    eicasEcam2Page = 1
    bat1Status = ipc.readLvar("L:S_OH_ELEC_BAT1")
    bat2Status = ipc.readLvar("L:S_OH_ELEC_BAT2")
    eicasEcam2Functions = {"FNX_EICAS_2_ECAM_PAGE_ENG","FNX_EICAS_2_ECAM_PAGE_BLEED","FNX_EICAS_2_ECAM_PAGE_PRESS","FNX_EICAS_2_ECAM_PAGE_ELEC","FNX_EICAS_2_ECAM_PAGE_HYD","FNX_EICAS_2_ECAM_PAGE_FUEL","FNX_EICAS_2_ECAM_PAGE_APU","FNX_EICAS_2_ECAM_PAGE_COND","FNX_EICAS_2_ECAM_PAGE_DOOR","FNX_EICAS_2_ECAM_PAGE_WHEEL","FNX_EICAS_2_ECAM_PAGE_FTCL","FNX_EICAS_2_ECAM_PAGE_STS","FNX_EICAS_2_ECAM_PAGE_cycle"}
    autoBrakeLevel = ipc.readLvar("L:XMLVAR_Autobrakes_Level")
    tcasSwitchPos = ipc.readLvar("L:FNX_SWITCH_TCAS_Position")
    chronoLState = 0

	nd_mode = 1 -- default ND mode
	baro_mode = 1  -- default BARO mode is hPa
	auto_brk = 0
    AutoDisplay = false -- override automatic display updates (SPD/HDG/ALT/VVS_
    DSP_MODE_one ()

	EcamTxt = 1
    OnVar = 16 -- change this for initial brightness of displays. 0 to 20
    --TestCnt = 0
    TestVar = ""
    TestLast = ""
    -- variables to prevent constant LCD display updating
    FNX_MODE = false
    -- MCDU keyboard timeout
    FNX_PED_MCDU_Key_Timer = 60000
    FNX_PED_MCDU_Key_Flag = false
    ipc.set("MCDU", 0)
    -- ALT/VVS DspE Flash Protection
    FNX_ALT_Dot = ' '
    FNX_VVS_Sign = '-'
    FNX_ALT_Zero = '0'
    FNX_Dot = string.char(7)
    FNX_NoDot = ' '
    _loggg('[F320] FNX320 Variables initialised')
end

-----------------------------------------------------------

function InitCustomEvents()
    -- get custom events file offset start pointer
    -- defined in [EVENTS] block in FSUIPC7.INI
    _loggg('[F320] Checking Event Files Data ************')

	-- initialise default Event Pointers 0 and 1
	EvtPtr = 32768
    EvtPtr1 = EvtPtr + 256

    n =  ipc.get("EVTNUM")
    _loggg('[F320] EvtNum=' .. tostring(n))
    if n == nil then return end

    for i = 0, tonumber(n) - 1 do
        s = ipc.get("EVTFILE" .. tostring(i))
        _loggg('[F320] EVTFILE ' .. tostring(i) .. '==' .. tostring(s))
    end

    EvtFile = string.lower("FNX320")
    EvtCnt = ipc.get("EVTNUM")
    if EvtCnt == nil then
        EvtCnt = 0
    end
    f = ''
    for i = 0, EvtCnt - 1 do
        ef = ipc.get("EVTFILE" .. tostring(i))
        if ef ~= nil then
            f = string.lower(ipc.get("EVTFILE" .. tostring(i)))
            if f == EvtFile then
                EvtIdx = i
                break
            end
        end
    end
    _loggg('[F320] EvtIdx =' .. tostring(EvtIdx) .. '::' .. f)


    -- defined in [EVENTS] block in FSUIPC7.INI
    if EvtIdx ~= nil then
        -- start address for A32NX.EVT custom events
        EvtPtr = 32768 + (EvtIdx * 256)
    else
        EvtPtr = 32768
    end

    EvtFile = string.lower("A32X-FBW1")
    EvtCnt = ipc.get("EVTNUM")
    if EvtCnt == nil then
        EvtCnt = 0
    end
    f = ''
    for i = 0, EvtCnt - 1 do
        ef = ipc.get("EVTFILE" .. tostring(i))
        if ef ~= nil then
            f = string.lower(ipc.get("EVTFILE" .. tostring(i)))
            if f == EvtFile then
                EvtIdx = i
                break
            end
        end
    end
    _loggg('[F320] EvtIdx1=' .. tostring(EvtIdx) .. '::' .. f)

    -- defined in [EVENTS] block in FSUIPC7.INI
    if EvtIdx ~= nil then
        -- start address for A32NX.EVT custom events
        EvtPtr2 = 32768 + (EvtIdx * 256)
    else
        EvtPtr2 = 32768 + 256
    end

    _loggg('[F320] EvtPtrs= ' .. EvtPtr .. ' == ' .. EvtPtr2)
    _loggg('[F320] Checking Event Files Data ************')
end

-----------------------------------------------------------

-- Initial info on MCP display

function InitDsp ()
    if _MCP1() or _MCP2() then
        DspSPD(ipc.readLvar("L:E_FCU_SPEED") + 100)
        DspHDG(ipc.readLvar("L:E_FCU_HEADING"))
        DspALT(ipc.readLvar("L:E_FCU_ALTITUDE") * 0)
        DspVVS(ipc.readLvar("L:E_FCU_VS"))
    else -- MCP2a
        FNX_DspSPDtxt(ipc.readLvar('I_FCU_MACH_MODE'))
        FNX_DspHDGtxt()
        FNX_DspALTtxt()
        FNX_DspSPD()
        FNX_DspHDG()
        FNX_DspALT()
        FNX_DspVVS()
    end
end

----------------------------------------------------------

function Timer ()
    -- check AP2 status
    if ipc.readLvar('I_FCU_LOC') == 0 and
        ipc.readLvar('I_FCU_AP2') == 1 and
        ipc.readLvar('I_FCU_AP1') == 1 then
        ipc.writeLvar('S_FCU_AP2', 0)
    end
    -- set display information
    if _MCP2() then
        if ipc.get("DSPmode") == 1 then
            -- show autopilot info
            FNX_AP_INFO ()
        else
            -- show flaps/gears info
            FNX_FLIGHT_INFO ()
        end
    elseif _MCP2a() then
        if ipc.get("DSPmode") == 1 then
            -- keep flag until all MODEs reset
            local info = Modes()
            if info ~= "M111" then
                FNX_MODE = true
            else
                FNX_MODE = false
            end
            -- show autopilot info
            FNX_AP_INFO ()
        else
            -- show flaps/gears info
            FNX_FLIGHT_INFO ()
        end
    else  -- Display for MCP1 Users
        -- Display Autopilot
        FNX_DispAP_MCP1 ()
        -- Display Gearstatus
        FNX_DispGear_MCP1 ()
        -- Display Flapstatus
        FNX_DispFlaps_MCP1 ()
    end

    -- handle timer for MCDU Key Input Reversion
    if ipc.elapsedtime() - ipc.get("MCDU") > FNX_PED_MCDU_Key_Timer
        and FNX_PED_MCDU_Key_Flag then
        FNX_PED_MCDU_KEYB_off()
        Sounds("modechange")
    end
end

-- Initial info on MCP display

function InitDsp ()
    if _MCP1() or _MCP2() then
        DspSPD(0) --ipc.readLvar("FNX_AUTOPILOT_SPEED_SELECTED"))
        DspHDG(0) --ipc.readLvar("FNX_AUTOPILOT_HEADING_SELECTED"))
        DspALT(0) --getALTValue() / 100)
        DspVVS(0) --ipc.readLvar("FNX_AUTOPILOT_VS_SELECTED"))
    else -- MCP2a
        FNX_DspSPDtxt(ipc.readLvar('I_FCU_MACH_MODE'))
        FNX_DspHDGtxt()
        FNX_DspALTtxt()
        FNX_DspSPD()
        FNX_DspHDG()
        FNX_DspALT()
        FNX_DspVVS()
    end
end

----------------------------------------------------------

-- display AP mode information
function FNX_AP_INFO ()
    if _MCP2() then
        -- FD
        if ipc.readLvar('I_FCU_EFIS1_FD') == 0 then
            DspFD(0)
        else
            DspFD(1)
        end
        -- ATHR
        if ipc.readLvar('I_FCU_ATHR') == 0 then
            DspAT(0)
        else
            DspAT(1)
        end
        local Var, str1, str2
        -- AP1
        Var = ipc.readLvar('I_FCU_AP1')
        if Var == 1 then
            str1 = ' 1AP'
        else
            str1 = ' -AP'
        end
        -- AP2
        Var = ipc.readLvar('I_FCU_AP2')
        if Var == 1 then
            str1 = str1 .. '2 '
        else
            str1 = str1 .. '- '
        end
        -- ILS
        Var = ipc.readLvar('I_FCU_EFIS1_LS')
        if Var == 1 then
            str2 = ' ILS '
        else
            str2 = '     '
        end
        -- LOC or APPR
        if (ipc.readLvar('I_FCU_LOC') == 1) then
            str2 = str2 .. 'LOC'
        elseif (ipc.readLvar('I_FCU_APPR') == 1) then
            str2 = str2 .. 'APR'
        end
        FLIGHT_INFO1 = str1
        FLIGHT_INFO2 = str2
    elseif _MCP2a() then -- Airbus FCU
        local Var
        -- ILS
        Var = ipc.readLvar('I_FCU_EFIS1_LS')
        DspILS(Var)
        -- APs 1 & 2
        DspAPs(ipc.readLvar('I_FCU_AP1'),
            ipc.readLvar('I_FCU_AP2'))
        -- A/THR
        Var = ipc.readLvar('I_FCU_ATHR')
        DspAT(Var)
        -- LOC
        Var = ipc.readLvar('I_FCU_LOC')
        DspLOC(Var)
        -- APPR
        Var = ipc.readLvar('APPR')
        if not FNX_MODE then
            DspAPPR(Var)
        end
        -- reset flight information for Airbus MCP2a display
        FLIGHT_INFO1 = ""
        FLIGHT_INFO2 = ""
    end
    -- SPD/MACH labels
    FNX_DspSPDtxt(ipc.readLvar('I_FCU_MACH_MODE'))
    -- HDG/TRK labels
    FNX_DspHDGtxt(ipc.readLvar("I_FCU_TRACK_FPA_MODE"))
    -- ALT labels
    FNX_DspALTtxt()
    -- ALT/VVS DspE to avoid cursor flicker
    FNX_DspE()
    -- AP VALUES --
    FNX_DspSPD ()
    FNX_DspHDG ()
    FNX_DspALT ()
    FNX_DspVVS ()
end

-----------------------------------------------------------

-- Display Flight Information
function FNX_FLIGHT_INFO ()
        FLIGHT_INFO1 = ""
        FLIGHT_INFO2 = ""
   -- end
end

-------------------------------------------------------

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

-----------------------------------------------------------

-- ## Display Functions

-- $$ Cockpit Display Dimmer

function FNX_CKPT_INTLT_DIMMER_set(Lvar, Lval)
    if Lvar == nil or Lval == nil then return end
    ipc.writeLvar(Lvar, Lval)
end

function FNX_DspSPD()
    FNX_spd = ipc.readLvar("E_FCU_SPEED") + 100
    FNX_spd_dashes = ipc.readLvar("I_FCU_SPEED_MANAGED")
    FNX_spd_dot = ipc.readLvar('I_FCU_SPEED_MANAGED')
    FNX_mach = ipc.readLvar('I_FCU_MACH_MODE')

    if FNX_spd == nil then return end

    local strVal = 100 --FNX_spd

    --[[if FNX_spd ~= -1 then
        if (tonumber(strVal) < 100) then
            FNX_mach = 1
        else
            FNX_mach = 0
        end
    end   --]]

    if FNX_spd_dashes == 1 then
        strVal = '---'
    end

    if FNX_spd_dot == 1 then
        if _MCP2a() then
            strVal = strVal .. string.char(7)
        else
            strVal = strVal .. '*'
        end
    end

    if not _MCP1() then
        DspSPDs(strVal, true)
        FNX_DspSPDtxt(FNX_mach)
    end
end

-----------------------------------------------------------

function FNX_DspHDG ()
    FNX_hdg = ipc.readLvar("E_FCU_HEADING")
    FNX_hdg_dashes = ipc.readLvar("I_FCU_HEADING_MANAGED")
    FNX_hdg_dot = ipc.readLvar('I_FCU_HEADING_MANAGED')

    if FNX_hdg == nil then return end

    FNX_hdg = 0

    local strVal = string.format("%03d", FNX_hdg)

    if FNX_hdg_dashes == 1 then
        strVal = '---'
    end

    if FNX_hdg_dot == 1 then
        if _MCP2a() then
            strVal = strVal .. string.char(7)
        else
            strVal = strVal .. '*'
        end
    end

    if not _MCP1() then
        DspHDGs(strVal, true)
    end
end

-----------------------------------------------------------

function FNX_DspALT ()
    FNX_alt = ipc.readLvar("E_FCU_ALTITUDE")
    if FNX_alt == nil then return end
    if _MCP1() then return end
    DspALT(FNX_alt * 10)
    FNX_DspALTmode()
end

-----------------------------------------------------------

function FNX_getALTValue ()
local alt
	alt = round(ipc.readUD(0x0798) / 65536)
    alt = round(round(alt * 3.2808399)/10) * 10
    return alt
end

-----------------------------------------------------------

function FNX_setALTValue (value)
local alt
    alt = (value / 3.2808399) * 65536
	ipc.writeUD(0x07D4, alt)
end

-----------------------------------------------------------

function FNX320_Misc_Tiller_Pedal_Disconnect_on()
    Lvar = "L:S_FC_CAPT_TILLER_PEDAL_DISCONNECT"
    if ipc.readLvar(Lvar) ~= 1 then
        ipc.writeLvar(Lvar, 1)
        ipc.writeLvar(Lvar .. '_Anim', 1)
        DspShow('PDL_DSC','on')
    end
end

function FNX320_Misc_Tiller_Pedal_Disconnect_off()
    Lvar = "L:S_FC_CAPT_TILLER_PEDAL_DISCONNECT"
    if ipc.readLvar(Lvar) ~= 0 then
        ipc.writeLvar(Lvar, 0)
        ipc.writeLvar(Lvar .. '_Anim', 0)
        DspShow('PDL_DSC','off')
    end
end

function FNX320_Misc_Tiller_Pedal_Disconnect_toggle()
    Lvar = "L:S_FC_CAPT_TILLER_PEDAL_DISCONNECT"
    if ipc.readLvar(Lvar) < 1 then
        FNX320_Misc_Tiller_Pedal_Disconnect_on()
    else
        FNX320_Misc_Tiller_Pedal_Disconnect_off()
    end
end

-----------------------------------------------------------

function FNX_DspVVS (force)
    if force == nil then
        force = 0
    end

	local VS_alt = 0
    local VS_val = ipc.readLvar("E_FCU_VS")
    local VS_mode = ipc.readLvar(0) --"FNX_FCU_VS_MANAGED")
    local FPA_val = ipc.readLvar(0) --"FNX_AUTOPILOT_FPA_SELECTED")
    local FPA_mode = ipc.readLvar(0) --"FNX_TRK_FPA_MODE_ACTIVE")

    FNX_DspHDGtxt(FPA_mode, force)

	-- ensure valid values to cope with initial start conditions
	if VS_val == nil then
		VS_val = 0
	end
	if VS_mode == nil then
		VS_mode = 0
	end
	if FPA_val == nil then
		FPA_val = 0
	end
	if FPA_mode == nil then
		FPA_mode = 0
	end

    if VS_mode == 1 then
        if _MCP2a() then
            DspVVSs("----")
            FNX_VVS_Sign = '-'
        else
            DspVVS_AP_on()
            DspVVSs("----", true)
        end
    else
        DspVVS_AP_off()
        if FPA_mode == 0 then
            VS_alt = VS_val / 100
            DspVVS((VS_alt) * 1.0, 1)
            if VS_alt >= 0 then
                FNX_VVS_Sign = '+'
            else
                FNX_VVS_Sign = '-'
            end
        else  -- display FPA
            VS_alt = FPA_val
            _loggg('FPA=' .. VS_alt)
            DspFPA((VS_alt) * 1.0, 1)
            FNX_VVS_Sign = ' '
        end
    end
end

-----------------------------------------------------------

-- function to stop DspE field flashing
function FNX_DspE(val)
    if _MCP1() or _MCP2() then return end
    if val == nil then
        val = "0" .. FNX_ALT_Dot .. "\\" .. FNX_VVS_Sign
    end
    DspE(val, false)
end

-- AP mode dots
function FNX_SPDmode_Dot ()
    SPD_mode_set = ipc.readLvar('I_FCU_SPEED_MANAGED')
    if SPD_mode_set == 1 then
        return true
    else
        return false
    end
end

function FNX_HDGmode_Dot ()
    HDG_mode_set = ipc.readLvar('I_FCU_HEADING_MANAGED')
    if HDG_mode_set == 1 then
        return true
    else
        return false
    end
end

function FNX_ALTmode_Dot ()
    ALT_mode = ipc.readLvar('I_FCU_ALTITUDE_MANAGED')
    if ALT_mode == 1 then
        return true
    else
        return false
    end
end

function FNX_DspAP1_on()
    DspAP1(true)
end

function FNX_DspAP1_off()
    DspAP1(false)
end

function FNX_DspAP2_on()
    DspAP2(true)
end

function FNX_DspAP2_off()
    DspAP2(false)
end

function FNX_DspILS_on()
    DspILS(true)
end

function FNX_DspILS_off()
    DspILS(false)
end

function FNX_DspSPDtxt(i)
    if _MCP1() then return end
    -- SPD/MACH
    if _MCP2a() then
        if i == 1  then
            Dsp0('MACH')
        else
            Dsp0('SPD ')
        end
    else  -- MCP2
        if i == 1  then
            Dsp0('\\\\\\M')
            Dsp1('ACH\\')
        else
            Dsp0('\\\\\\S')
            Dsp1('PD \\')
        end
    end
end

function FNX_DspHDGtxt(i)
    if _MCP1() or _MCP2() then return end
    if i == nil then
        i = ipc.readLvar("L:I_FCU_TRACK_FPA_MODE")
    end
    -- HDG/TRK
    if i == 1 then
        Dsp2('TRK ')
        DspB(' TRK')
        DspC('FPA ')
        Dsp7(' FPA')
    else
        Dsp2('HDG ')
        DspB(' HDG')
        DspC('V/S ')
        Dsp7(' V/S')
    end
end

function FNX_DspALTtxt()
    if _MCP1() or _MCP2() then return end
    -- ALT mode
    Dsp5('ALT ')
    DspD('\\\\\\0')
    --DspE('0\\\\\\')
end

function FNX_DspInfoClear()
    if _MCP1() or _MCP2() then return end
    DspILS(false)
    DspLOC(false)
    DspAT(false)
    DspAPPR(false)
    Dsp1('    ', true) -- blank ILS
    Dsp9('    ', true) -- blank LOC
    Dsp3('    ', true) -- blank APs
    Dsp4('    ', true) -- blank AT
    DspB('    ', true) -- blank HDG
    DspC('    ', true) -- blank V/S
    Dsp6('    ', true) -- blank APPR
end

function FNX_DspSPDmode (i)
	if dev == 0 then return end
    if _MCP1() then return end
    local val
    if _MCP2a() then
        if i == true then
   	        val = "\\\\\\" .. string.char(7)
        else
            val = "\\\\\\ "
        end
        Dsp8(val)
    else
        if i then
            FNX_DspSPD_AP_on()
        else
            FNX_DspSPD_AP_off()
        end
    end
end

function FNX_DspMACHmode (i)
	if dev == 0 then return end
    if not _MCP2a() then return end
    local val
    if i == true then
   	    val = string.char(7) .. "\\\\\\"
    else
        val = " \\\\\\"
    end
    Dsp9(val)
end

function FNX_DspHDGmode (i)
	if dev == 0 then return end
    if _MCP1() then return end
    local val
    if _MCP2a() then
        if i then
            val = "\\\\\\" .. string.char(7)
        else
   	        val = "\\\\\\ "
        end
        DspA(val)
    else -- MCP2
        if i then
            val = "\\\\\\*"
        else
            val = "\\\\\\ "
        end
        DspC(val)
    end
end

function FNX_DspALTmode ()
	if dev == 0 then return end
    if _MCP1() then return end
    local Dot
    local val
    Dot = ipc.readLvar('I_FCU_ALTITUDE_MANAGED')
    if Dot == 1 then
        if _MCP2a() then
            FNX_ALT_Dot = FNX_Dot
            FNX_DspE()
        else
            val = "\\*\\\\"
            Dsp6(val)
        end
    else
        if _MCP2a() then
            FNX_ALT_Dot = ' '
            FNX_DspE()
        else
            val = "\\ \\\\"
            Dsp6(val)
        end
    end
end

function FNX_DspSPD_AP_on ()
	if dev == 0 then return end
    if not _MCP2() then return end
    if ipc.readLvar("FNX_AP_MACH_Select") == 0 then
   	    _sleep(20)
        com.write(dev, "DSP1\\\\*\\", 8)
    end
 end

function FNX_DspSPD_AP_off ()
	if dev == 0 then return end
    if not _MCP2() then return end
    if ipc.readLvar("FNX_AP_MACH_Select") == 0 then
   	    _sleep(20)
        com.write(dev, "DSP1\\\\ \\", 8)
    end
end

function FNX_DspMode_Toggle()
    if ipc.get("DSPmode") == 1 then
        FNX_DspInfoClear()
        FNX_APPR = false
    end
    DSP_MODE_toggle()
end

---------------------------------------------------------

function FNX_DispAP_MCP1 ()

    ILS_cur = ipc.readLvar("I_FCU_EFIS1_LS")
    LOC_cur = ipc.readLvar("I_FCU_LOC")
    AP1_cur = ipc.readLvar("I_FCU_AP1")
    AP2_cur = ipc.readLvar("I_FCU_AP2")
    ATT_cur = ipc.readLvar("I_FCU_ATHR")
    APP_cur = ipc.readLvar("I_FCU_APPR")
    FD_cur  = ipc.readLvar("I_FCU_EFIS1_FD")

    APUbleed_cur    = ipc.readLvar("I_OH_PNEUMATIC_APU_BLEED_L")
    MASTERcaut_cur  = ipc.readLvar("I_MIP_MASTER_CAUTION_CAPT")
    MASTERwarn_cur  = ipc.readLvar("I_MIP_MASTER_WARNING_CAPT")

    SPDmode_cur = ipc.readLvar("FNX_FCU_SPD_MANAGED_DASHES")
    HDGmode_cur = ipc.readLvar("FNX_FCU_HDG_MANAGED_DASHES")
    -- VSmode_cur  = ipc.readSB(0x5634)

    QNH_cur = ipc.readSW(0x0330) / 16

    -- QNH changed
    if QNH_cur ~= QNH_pre then
        QNH_pre = QNH_cur
        if round(QNH_cur, 0) == 1013 then
            DspShow ('BARO', ' STD')
        else
            DspShow('BARO', QNH_cur)
        end
    end

    -- Important LED change
        -- MASTER Caution
    if MASTERcaut_cur ~= MASTERcaut_pre then
        MASTERcaut_pre = MASTERcaut_cur
        if MASTERcaut_cur == 1 then
            FLIGHT_INFO1 = 'MSTR'
            FLIGHT_INFO2 = 'CAUT'
        else
            APchange = true
        end
    end

        -- MASTER Warning
    if MASTERwarn_cur ~= MASTERwarn_pre then
        MASTERwarn_pre = MASTERwarn_cur
        if MASTERwarn_cur == 1 then
            FLIGHT_INFO1 = 'MSTR'
            FLIGHT_INFO2 = 'WARN'
        else
            APchange = true
        end
    end
        -- APU Bleed LED on/off
    if APUbleed_cur ~= APUbleed_pre then
        APUbleed_pre = APUbleed_cur
        if APUbleed_cur == 1 then
            DspShow("APUb",">>on")
        else
            DspShow("APUb",">off")
        end
    end

    -- Selected / Managed Display
    if SPDmode_cur ~= SPDmode_pre then
        SPDmode_pre = SPDmode_cur
        if SPDmode_cur == 1 then
            val = '---'
    	else
            val = 'sel'
        end
        DspShow ("SPD", val)
    end

    if HDGmode_cur ~= HDGmode_pre then
        HDGmode_pre = HDGmode_cur
        if HDGmode_cur == 1 then
            val = '---'
    	else
            val = 'sel'
        end
        DspShow ("HDG", val)
    end

    if VSmode_cur ~= VSmode_pre then
        VSmode_pre = VSmode_cur
        if VSmode_cur == 1 then
            val = '---'
    	else
            val = 'sel'
        end
        DspShow ("VS", val)
    end

    -- Autopilot Display
    -- AP1
	if AP1_cur ~= AP1_pre then
        AP1_pre = AP1_cur
        APchange = true
        if AP1_cur == 1 then
            D11 = "1"
        else
            D11 = "_"
        end
	end

    -- AP2
	if AP2_cur ~= AP2_pre then
        AP2_pre = AP2_cur
        APchange = true
        if AP2_cur == 1 then
            D12 = "2"
        else
            D12 = "_"
        end
	end

    -- APPR mode
	if APP_cur ~= APP_pre then
        APP_pre = APP_cur
        APchange = true
        if APP_cur == 1 then
            D14 = "A"
        else
            D14 = "_"
        end
	end
    -- LOC mode
	if LOC_cur ~= LOC_pre then
        LOC_pre = LOC_cur
        APchange = true
        if LOC_cur == 1 then
            D14 = "L"
        else
            D14 = D14
        end
	end

    -- FD
	if FD_cur ~= FD_pre then
        FD_pre = FD_cur
        APchange = true
        if FD_cur == 1 then
            D21 = "F"
        else
            D21 = "_"
        end
	end

    -- ILS
	if ILS_cur ~= ILS_pre then
        ILS_pre = ILS_cur
        APchange = true
        if ILS_cur == 1 then
            D22 = "I"
        else
            D22 = "_"
        end
	end

    -- ATHR
	if ATT_cur ~= ATT_pre then
        ATT_pre = ATT_cur
        APchange = true
        if ATT_cur == 1 then
            D24 = "T"
        else
            D24 = "_"
        end
	end

    -- form 2 lines of flight info display
    if APchange == true then
        APchange = false
        FLIGHT_INFO1 = D11 .. D12 .. ' ' .. D14
        FLIGHT_INFO2 = D21 .. D22 .. ' ' .. D24
    end
end

function FNX_DispGear_MCP1 ()
    GNOSE_cur = ipc.readUD(0x0BEC)
    GLEFT_cur = ipc.readUD(0x0BF4)
    GRIGHT_cur = ipc.readUD(0x0BF0)

    if GNOSE_cur ~= GNOSE_pre then
        GNOSE_pre = GNOSE_cur
        GEARchange = true

        if GNOSE_cur == 16383 then
            GNOSE = ' oo'
        elseif GNOSE_cur == 0 then
            GNOSE = ' -- '
        else
            GNOSE = ' ** '
        end
    end

    if GLEFT_cur ~= GLEFT_pre then
        GLEFT_pre = GLEFT_cur
        GEARchange = true

        if GLEFT_cur == 16383 then
            GLEFT = 'o##'
        elseif GLEFT_cur == 0 then
            GLEFT = '-##'
        else
            GLEFT = '*##'
        end
    end

    if GRIGHT_cur ~= GRIGHT_pre then
        GRIGHT_pre = GRIGHT_cur
        GEARchange = true

        if GRIGHT_cur == 16383 then
            GRIGHT = 'o'
        elseif GRIGHT_cur == 0 then
            GRIGHT = '-'
        else
            GRIGHT = '*'
        end
    end

    if GEARchange == true then
        GEARchange = false
        FLIGHT_INFO1 = GNOSE
        FLIGHT_INFO2 = GLEFT .. GRIGHT
    else
        APchange = true
    end
end

function FNX_DispFlaps_MCP1 ()

    FLAP_cur = ipc.readUD(0x0BDC)

    if FLAP_pre ~= FLAP_cur then
        FLAP_pre = FLAP_cur

        if FLAP_cur == 0 then
            FLAP = '----'
            FLAPchange=true
        elseif FLAP_cur > 4096 and FLAP_cur < 6750 then
            FLAP = '1---'
            FLAPchange=true
        elseif FLAP_cur > 7000 and  FLAP_cur < 10000 then
            FLAP = '-2--'
            FLAPchange=true
        elseif FLAP_cur > 11000 and FLAP_cur < 13500 then
            FLAP = '--3-'
            FLAPchange=true
        elseif FLAP_cur > 16000 then
            FLAP = '---4'
            FLAPchange=true
        else
            FLAPchange = false
        end
    end

    if FLAPchange == true then
        FLAPchange=false
        _loggg('FLAP=' .. FLAP)
        DspShow('FLAP', FLAP)
    else
        APchange = true
    end
end
