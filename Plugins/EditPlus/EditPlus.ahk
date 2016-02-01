EditPlus:

class:="EditPlus"
filepath:="EditPlus.exe"
;命令模式框
gui,add,edit,vCmdLine
Gui, Add, Button,Hidden default, OK  ; ButtonOK（如果存在）会在此按钮被按下时运行。
;GuiControl, Hide, OK;隐藏ok按钮

;========================公共键位begin============================================
; 设置Win
vim.SetWin("EditPlus",class,filepath)

; 切换到Inert模式，后续map的所有热键都是在Insert模式下
vim.SetMode("Insert","EditPlus")
; 映射热键
vim.map("<Esc>","<EditPlus_NormalMode>","EditPlus")
;切换到命令模式
vim.SetMode("Command","EditPlus")
; 映射热键
vim.map("<Esc>","<EditPlus_NormalMode>","EditPlus")
; 切换到Normal模式，后续map的所有热键都是在Noraml模式下
vim.SetMode("Normal","EditPlus")
; 映射热键
; <0>~<9>是内置的Label，可以看一下class_vim.ahk
;移动
vim.map("j","<EditPlus_Down>","EditPlus")
vim.map("k","<EditPlus_Up>","EditPlus")
vim.map("h","<left>","EditPlus")
vim.map("l","<right>","EditPlus")
vim.map("w","<EditPlus_word>","EditPlus")
vim.map("b","<EditPlus_back>","EditPlus")
vim.map("gg","<EditPlus_goBegin>","EditPlus")
vim.map("G","<EditPlus_goEnd>","EditPlus")

vim.map("o","<EditPlus_OneLine>","EditPlus")
vim.map("O","<EditPlus_upLine>","EditPlus")
vim.map("p","<EditPlus_paste>","EditPlus")
vim.map("yy","<EditPlus_linecopy>","EditPlus")
vim.map("u","<EditPlus_undo>","EditPlus")
vim.map("r","<EditPlus_redo>","EditPlus")

vim.map("x","<EditPlus_DeleteOneChar>","EditPlus")
vim.map("d","<EditPlus_Delete>","EditPlus")
vim.map("dd","<EditPlus_DeleteLine>","EditPlus")

vim.map("i","<EditPlus_InsertMode>","EditPlus")
vim.map("I","<EditPlus_PreInsertMode>","EditPlus")
vim.map("A","<EditPlus_LineAppend>","EditPlus")

vim.map(":","<EditPlus_CommandMode>","EditPlus")
;========================公共键位end============================================
; 注意，最后一次SetMode 为 "normal" 则当前为Noraml模式
return
EditPlus_CheckMode()
{
    ControlGetFocus,ctrl,AHK_CLASS EditPlus
    If RegExMatch(ctrl,"Edit1")
        Return True
    return False
}
;========================公共键位定义begin============================================
; 以下为热键对应的功能区
; 切换为Insert 模式
<EditPlus_InsertMode>:
  gui,cancel
  vim.SetMode("Insert","EditPlus")
return
<EditPlus_PreInsertMode>:
    send,{Home}
  vim.SetMode("Insert","EditPlus")
return

; 切换为Normal 模式
<EditPlus_NormalMode>:
  gui,cancel
  vim.SetMode("Normal","EditPlus")
return
; 切换为Command 模式
<EditPlus_CommandMode>:
  vim.SetMode("Command","EditPlus")
  GuiControl,,CmdLine,
  gui,show,,输入命令
return
;插入模式下的命令
<EditPlus_word>:
    send,^{Right} 
return
<EditPlus_back>:
    send,^{Left} 
return
<EditPlus_OneLine>:
    send,{End}{Enter} 
    vim.SetMode("Insert","EditPlus")
return
<EditPlus_Up>:
    sendplay,{Up}
return
<EditPlus_Down>:
    sendplay,{Down}
return
<EditPlus_goBegin>:
    sendplay,^{Home}
return
<EditPlus_goEnd>:
    sendplay,^{End}
return
<EditPlus_linecopy>:
    send,{home}
    send,+{end}
    send,^c
    send,{right}
return
<EditPlus_paste>:
    send,^v
return
<EditPlus_undo>:
    send,^z
return
<EditPlus_redo>:
    send,^y
return
<EditPlus_upLine>:
    send,{home}
    send,{enter}
    sendplay,{up}
return
<EditPlus_LineAppend>:
    send,{end}
    vim.SetMode("Insert","EditPlus")
return
<EditPlus_DeleteOneChar>:
    send,{backspace}
return
<EditPlus_Delete>:
    send,{delete}
return
<EditPlus_DeleteLine>:
    send,{home}
    send,+{end}
    send,{delete}
return
;命令模式下的命令begin
GuiClose:
ButtonOK:
Gui, Submit  ; 保存用户的输入到每个控件的关联变量中.
if (CmdLine="q")
    send,^w
else if (CmdLine="w")
    send,^s
else if (CmdLine="tabnew")
    send,!s
else 
{}
vim.SetMode("Normal","EditPlus")
return
;命令模式下的命令end
;========================公共键位定义end============================================
