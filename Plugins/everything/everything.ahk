Everything:
  If Not A_ISAdmin
    Run, *RunAs %A_AhkPath% "%A_ScriptFullPath%"
	vim.SetPlugin("Everything","Array","0.1","用于Everything")
	vim.SetAction("ET_VimToggle","启用/禁止Everything vim热键")
	vim.SetAction("ET_CopyFullPath","复制选中项的完整路径")
	vim.SetAction("ET_CopyFullPath2","复制选中项的完整路径，含双引号")
	vim.SetAction("ET_CopyDir","复制选中项所在目录名")
	vim.SetAction("ET_CopyFileName","复制选中文件名")
	vim.SetAction("ET_CopyFileNameNoExt","复制选中项的文件名（不含扩展）")
	vim.SetWin("Everything","EVERYTHING")
	vim.SetMode("normal","Everything")
  vim.BeforeActionDo("Everything_Check","Everything")
	vim.map("1","<1>","Everything")
	vim.map("2","<2>","Everything")
	vim.map("3","<3>","Everything")
	vim.map("4","<4>","Everything")
	vim.map("5","<5>","Everything")
	vim.map("6","<6>","Everything")
	vim.map("7","<7>","Everything")
	vim.map("8","<8>","Everything")
	vim.map("9","<9>","Everything")
	vim.map("0","<0>","Everything")
	vim.map("j","<down>","Everything")
	vim.map("k","<up>","Everything")
	vim.map("yy","ET_CopyFullPath","Everything")
	vim.map("y'","ET_CopyFullPath2","Everything")
	vim.map("<super><ctrl>","ET_VimToggle","Everything")
	;Toggle := True
  etconfig := GetVimdConfig().everything
  Toggle := not etconfig.disabled
	vim.control(Toggle,"Everything")
return

Everything_Check()
{
  ControlGetFocus,ctrl,ahk_Class EVERYTHING
  If ctrl = Edit1
    return true
}

ET_VimToggle:
	Toggle := Toggle ? False : True
	vim.control(Toggle,"Everything")
return

ET_CopyFullPath:
  Clipboard := 
  Clipwait
  Winmenuselectitem,ahk_class EVERYTHING, 1&, 8&
  Clipboard := Trim(Clipboard,"""")
return
ET_CopyFullPath2:
  msgbox
  Winmenuselectitem,ahk_class EVERYTHING, 1&, 8&
return

