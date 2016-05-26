FoxitReader:
class:="classFoxitReader "
filepath:="Foxit Reader.exe"
;命令模式框
;gui,add,edit,vCmdLine
;Gui, Add, Button,Hidden default, OK  ; ButtonOK（如果存在）会在此按钮被按下时运行。
;GuiControl, Hide, OK;隐藏ok按钮

;========================公共键位begin============================================
; 设置Win
vim.SetWin("FoxitReader",class,filepath)
; 切换到Inert模式，后续map的所有热键都是在Insert模式下
vim.SetMode("Insert","FoxitReader")
; 映射热键
vim.map("<Esc>","<FoxitReader_NormalMode>","FoxitReader")
;切换到命令模式
vim.SetMode("Command","FoxitReader")
; 映射热键
vim.map("<Esc>","<FoxitReader_NormalMode>","FoxitReader")
; 切换到Normal模式，后续map的所有热键都是在Noraml模式下
vim.SetMode("Normal","FoxitReader")
; 映射热键
; <0>~<9>是内置的Label，可以看一下class_vim.ahk
;移动
vim.map("j","<FoxitReader_Down>","FoxitReader")
vim.map("k","<FoxitReader_Up>","FoxitReader")
vim.map("h","<FoxitReader_Left>","FoxitReader")
vim.map("l","<FoxitReader_Right>","FoxitReader")

vim.map("gg","<FoxitReader_GotoTop>","FoxitReader")
vim.map("G","<FoxitReader_GotoButtom>","FoxitReader")
vim.map("m","<FoxitReader_PrePage>","FoxitReader")
vim.map("n","<FoxitReader_NextPage>","FoxitReader")
vim.map("b","<FoxitReader_OpenBookMark>","FoxitReader")
vim.map("c","<FoxitReader_OpenComment>","FoxitReader")
vim.map("a","<FoxitReader_AddBookMark>","FoxitReader")
vim.map("x","<FoxitReader_DelBookMark>","FoxitReader")


vim.map("i","<FoxitReader_InsertMode>","FoxitReader")
vim.map(":","<FoxitReader_CommandMode>","FoxitReader")
;========================公共键位end============================================
; 注意，最后一次SetMode 为 "normal" 则当前为Noraml模式
return
FoxitReader_CheckMode()
{
    ControlGetFocus,ctrl,AHK_CLASS FoxitReader
    If RegExMatch(ctrl,"Edit1")
        Return True
    return False
}
;========================公共键位定义begin============================================
; 以下为热键对应的功能区
; 切换为Insert 模式
<FoxitReader_InsertMode>:
  gui,cancel
  vim.SetMode("Insert","FoxitReader")
return
<FoxitReader_PreInsertMode>:
    send,{Home}
  vim.SetMode("Insert","FoxitReader")
return
; 切换为Normal 模式
<FoxitReader_NormalMode>:
  gui,cancel
  vim.SetMode("Normal","FoxitReader")
return
; 切换为Command 模式
<FoxitReader_CommandMode>:
  vim.SetMode("Command","FoxitReader")
  GuiControl,,CmdLine,
  gui,show,,输入命令
return
;插入模式下的命令
<FoxitReader_Down>:
    send,{down}
return
<FoxitReader_Up>:
    send,{up}
return
<FoxitReader_Left>:
    sendplay,{Left}
return
<FoxitReader_Right>:
    Send, {Right}
return
<FoxitReader_PrePage>:
    send,{PgUp}
return 
<FoxitReader_NextPage>:
    send,{PgDn}
return 
<FoxitReader_GotoTop>:
    send,{Home}
return
<FoxitReader_GotoButtom>:
    send,{End}
return
<FoxitReader_OpenBookMark>:
    send,!+V
    send,N
    send,B
return
<FoxitReader_OpenComment>:
    send,!+V
    send,N
    send,C
return
<FoxitReader_AddBookMark>:
    send,!+E
    send,D
return
<FoxitReader_DelBookMark>:
    send,{Del}
return

;========================公共键位定义end============================================
