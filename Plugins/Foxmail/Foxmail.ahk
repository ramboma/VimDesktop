Foxmail:

class:="Foxmail"
filepath:="Foxmail.exe"
;命令模式框
;gui,add,edit,vCmdLine
;Gui, Add, Button,Hidden default, OK  ; ButtonOK（如果存在）会在此按钮被按下时运行。
;GuiControl, Hide, OK;隐藏ok按钮

;========================公共键位begin============================================
; 设置Win
vim.SetWin("Foxmail",class,filepath)
; 切换到Inert模式，后续map的所有热键都是在Insert模式下
vim.SetMode("Insert","Foxmail")
; 映射热键
vim.map("<Esc>","<Foxmail_NormalMode>","Foxmail")
;切换到命令模式
vim.SetMode("Command","Foxmail")
; 映射热键
vim.map("<Esc>","<Foxmail_NormalMode>","Foxmail")
; 切换到Normal模式，后续map的所有热键都是在Noraml模式下
vim.SetMode("Normal","Foxmail")
; 映射热键
; <0>~<9>是内置的Label，可以看一下class_vim.ahk
;移动
vim.map("j","<Foxmail_Down>","Foxmail")
vim.map("k","<Foxmail_Up>","Foxmail")
vim.map("h","<Foxmail_Left>","Foxmail")
vim.map("l","<Foxmail_Right>","Foxmail")

vim.map("zl","<Foxmail_MailList>","Foxmail")
vim.map("gg","<Foxmail_GotoTop>","Foxmail")
vim.map("G","<Foxmail_GotoButtom>","Foxmail")
vim.map("o","<Foxmail_OpenMail>","Foxmail")
vim.map("w","<Foxmail_NewMail>","Foxmail")
vim.map("gm","<Foxmail_GetMail>","Foxmail")
vim.map("ga","<Foxmail_GetAllMail>","Foxmail")
vim.map("rr","<Foxmail_ReplyMail>","Foxmail")
vim.map("ss","<Foxmail_SendMail>","Foxmail")
vim.map("ra","<Foxmail_ReplyAll>","Foxmail")
vim.map("m","<Foxmail_Mark>","Foxmail")
vim.map("n","<Foxmail_MarkNo>","Foxmail")
vim.map("M","<Foxmail_MarkStar>","Foxmail")
vim.map("p","<Foxmail_Spam>","Foxmail")
vim.map("I","<Foxmail_InBox>","Foxmail")
vim.map("S","<Foxmail_SendedBox>","Foxmail")
vim.map("t","<Foxmail_TransMail>","Foxmail")
vim.map("w","<Foxmail_word>","Foxmail")
vim.map("b","<Foxmail_back>","Foxmail")

vim.map("x","<Foxmail_DeleteMail>","Foxmail")

vim.map("i","<Foxmail_InsertMode>","Foxmail")
vim.map(":","<Foxmail_CommandMode>","Foxmail")
;========================公共键位end============================================
; 注意，最后一次SetMode 为 "normal" 则当前为Noraml模式
return
Foxmail_CheckMode()
{
    ControlGetFocus,ctrl,AHK_CLASS Foxmail
    If RegExMatch(ctrl,"Edit1")
        Return True
    return False
}
;========================公共键位定义begin============================================
; 以下为热键对应的功能区
; 切换为Insert 模式
<Foxmail_InsertMode>:
  vim.SetMode("Insert","Foxmail")
  ;Gui, MyGui:Add, Text,, 插入模式
  ;Gui, MyGui:Show
return
<Foxmail_PreInsertMode>:
    send,{Home}
  vim.SetMode("Insert","Foxmail")
return
; 切换为Normal 模式
<Foxmail_NormalMode>:
  vim.SetMode("Normal","Foxmail")
return
; 切换为Command 模式
<Foxmail_CommandMode>:
  vim.SetMode("Command","Foxmail")
  GuiControl,,CmdLine,
  gui,show,,输入命令
return
;插入模式下的命令
<Foxmail_Down>:
    send,{down}
return
<Foxmail_Up>:
    send,{up}
return
<Foxmail_Left>:
    send,{Left}
return
<Foxmail_Right>:
    Send, {Right}
return
<Foxmail_MailList>:
    send,^+u
return
<Foxmail_OpenMail>:
    send,^o
return
<Foxmail_NewMail>:
    send,^n
    vim.SetMode("Insert","Foxmail")
return
<Foxmail_GetMail>:
    send,{F2}
return
<Foxmail_GetAllMail>:
    send,{F4}
return
<Foxmail_ReplyMail>:
    send,^r
    vim.SetMode("Insert","Foxmail")
return
<Foxmail_SendMail>:
    send,^{Enter}
return
<Foxmail_ReplyAll>:
    send,^+r
    vim.SetMode("Insert","Foxmail")
return
<Foxmail_TransMail>:
    sendinput,+w
    vim.SetMode("Insert","Foxmail")
return
<Foxmail_Mark>:
    send,^e
return 
<Foxmail_MarkNo>:
    send,^u
return 
<Foxmail_MarkStar>:
    send,{NumpadMult}
return 
<Foxmail_Spam>:
    send,+1
return 
<Foxmail_InBox>:
    send,^+i
return
<Foxmail_SendedBox>:
    send,^+s
return
<Foxmail_DeleteMail>:
    send,{delete}
return
<Foxmail_GotoTop>:
    send,{Home}
return
<Foxmail_GotoButtom>:
    send,{End}
return
<Foxmail_word>:
    send,^{Right} 
return
<Foxmail_back>:
    send,^{Left} 
return
;========================公共键位定义end============================================
