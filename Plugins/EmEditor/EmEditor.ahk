EmEditor:

class:="EmEditor"
filepath:="EmEditor.exe"
;命令模式框
;gui,add,edit,vCmdLine
;Gui, Add, Button,Hidden default, OK  ; ButtonOK（如果存在）会在此按钮被按下时运行。
;GuiControl, Hide, OK;隐藏ok按钮

;========================公共键位begin============================================
; 设置Win
vim.SetWin("EmEditor",class,filepath)

; 切换到Inert模式，后续map的所有热键都是在Insert模式下
vim.SetMode("Insert","EmEditor")
; 映射热键
vim.map("<Esc>","<EmEditor_NormalMode>","EmEditor")
;切换到命令模式
vim.SetMode("Command","EmEditor")
; 映射热键
vim.map("<Esc>","<EmEditor_NormalMode>","EmEditor")
; 切换到Normal模式，后续map的所有热键都是在Noraml模式下
vim.SetMode("Normal","EmEditor")
; 映射热键
; <0>~<9>是内置的Label，可以看一下class_vim.ahk
;移动
vim.map("j","<EmEditor_Down>","EmEditor")
vim.map("k","<EmEditor_Up>","EmEditor")
vim.map("h","<left>","EmEditor")
vim.map("l","<right>","EmEditor")
vim.map("w","<EmEditor_word>","EmEditor")
vim.map("b","<EmEditor_back>","EmEditor")
vim.map("gg","<EmEditor_goBegin>","EmEditor")
vim.map("G","<EmEditor_goEnd>","EmEditor")

vim.map("o","<EmEditor_OneLine>","EmEditor")
vim.map("O","<EmEditor_upLine>","EmEditor")
vim.map("p","<EmEditor_paste>","EmEditor")
vim.map("yy","<EmEditor_linecopy>","EmEditor")
vim.map("u","<EmEditor_undo>","EmEditor")
vim.map("r","<EmEditor_redo>","EmEditor")

vim.map("x","<EmEditor_DeleteOneChar>","EmEditor")
vim.map("d","<EmEditor_Delete>","EmEditor")
vim.map("dd","<EmEditor_DeleteLine>","EmEditor")

vim.map("i","<EmEditor_InsertMode>","EmEditor")
vim.map("I","<EmEditor_PreInsertMode>","EmEditor")
vim.map("A","<EmEditor_LineAppend>","EmEditor")

vim.map(":","<EmEditor_CommandMode>","EmEditor")
;========================公共键位end============================================
; 注意，最后一次SetMode 为 "normal" 则当前为Noraml模式
return
EmEditor_CheckMode()
{
    ControlGetFocus,ctrl,AHK_CLASS EmEditor
    If RegExMatch(ctrl,"Edit1")
        Return True
    return False
}
;========================公共键位定义begin============================================
; 以下为热键对应的功能区
; 切换为Insert 模式
<EmEditor_InsertMode>:
  gui,cancel
  vim.SetMode("Insert","EmEditor")
return
<EmEditor_PreInsertMode>:
    send,{Home}
  vim.SetMode("Insert","EmEditor")
return

; 切换为Normal 模式
<EmEditor_NormalMode>:
  gui,cancel
  vim.SetMode("Normal","EmEditor")
return
; 切换为Command 模式
<EmEditor_CommandMode>:
  vim.SetMode("Command","EmEditor")
  GuiControl,,CmdLine,
  gui,show,,输入命令
return
;插入模式下的命令
<EmEditor_word>:
    send,^{Right} 
return
<EmEditor_back>:
    send,^{Left} 
return
<EmEditor_OneLine>:
    send,{End}{Enter} 
    vim.SetMode("Insert","EmEditor")
return
<EmEditor_Up>:
    sendplay,{Up}
return
<EmEditor_Down>:
    sendplay,{Down}
return
<EmEditor_goBegin>:
    sendplay,^{Home}
return
<EmEditor_goEnd>:
    sendplay,^{End}
return
<EmEditor_linecopy>:
    send,{home}
    send,+{end}
    send,^c
    send,{right}
return
<EmEditor_paste>:
    send,^v
return
<EmEditor_undo>:
    send,^z
return
<EmEditor_redo>:
    send,^y
return
<EmEditor_upLine>:
    send,{home}
    send,{enter}
    sendplay,{up}
return
<EmEditor_LineAppend>:
    send,{end}
    vim.SetMode("Insert","EmEditor")
return
<EmEditor_DeleteOneChar>:
    send,{backspace}
return
<EmEditor_Delete>:
    send,{delete}
return
<EmEditor_DeleteLine>:
    send,{home}
    send,+{end}
    send,{delete}
return
;命令模式下的命令begin
;GuiClose:
;ButtonOK:
;Gui, Submit  ; 保存用户的输入到每个控件的关联变量中.
;if (CmdLine="q")
;    send,^w
;else if (CmdLine="w")
;    send,^s
;else if (CmdLine="tabnew")
;    send,!s
;else 
;{}
;vim.SetMode("Normal","EmEditor")
;return
;命令模式下的命令end
;========================公共键位定义end============================================
