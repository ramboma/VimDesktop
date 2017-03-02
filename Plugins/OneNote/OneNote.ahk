OneNote:
class:="Framework::CFrame"
filepath:="ONENOTE.EXE"
;定义row变量，用来实现2yy,2dd操作
global onenote_row:=0
global push_row:=0
global push_cmd:=""
push_cmds(cmd)
{

    ;outputdebug,push_st_onenote_row:%onenote_row%
    ;outputdebug,push_st_push_row:%push_row%
    global onenote_row
    global push_row:=onenote_row
    global push_cmd:=cmd
    ;outputdebug,push_end_onenote_row:%onenote_row%
    ;outputdebug,push_end_push_row:%push_row%
}
pop_cmd()
{
    ;outputdebug,pop_st_push_row:%push_row%
    ;outputdebug,pop_st_onenote_row:%onenote_row%
    global onenote_row:=push_row
    global push_row
    global push_cmd

    gosub,%push_cmd%
    ;outputdebug,pop_end_push_row:%push_row%
    ;outputdebug,pos_end_onenote_row:%onenote_row%
}
;========================公共键位begin============================================
; 设置Win
vim.SetWin("OneNote",class,filepath)

; 切换到Inert模式，后续map的所有热键都是在Insert模式下
vim.SetMode("Insert","OneNote")
; 映射热键
vim.map("<Esc>","<OneNote_NormalMode>","OneNote")
; 切换到Normal模式，后续map的所有热键都是在Noraml模式下
vim.SetMode("Normal","OneNote")
; 映射热键
; <0>~<9>是内置的Label，可以看一下class_vim.ahk
vim.map("j","<OneNote_Down>","OneNote")
vim.map("k","<OneNote_Up>","OneNote")
vim.map("h","<left>","OneNote")
vim.map("l","<right>","OneNote")
vim.map("w","<OneNote_word>","OneNote")
vim.map("b","<OneNote_back>","OneNote")
vim.map("o","<OneNote_OneLine>","OneNote")
vim.map("O","<OneNote_upLine>","OneNote")
vim.map("p","<OneNote_paste>","OneNote")
vim.map("yy","<OneNote_linecopy>","OneNote")
vim.map("u","<OneNote_undo>","OneNote")
vim.map("r","<OneNote_redo>","OneNote")
vim.map("gg","<OneNote_GoTop>","OneNote")
vim.map("G","<OneNote_GoBottom>","OneNote")
vim.map("tt","<OneNote_NewLine>","OneNote")

vim.map("x","<OneNote_DeleteOneChar>","OneNote")
vim.map("d","<OneNote_Delete>","OneNote")
vim.map("dd","<OneNote_DeleteLine>","OneNote")
vim.map("0","<OneNote_ToFirstChar>","OneNote")
vim.map("$","<OneNote_ToLastChar>","OneNote")

vim.map("i","<OneNote_InsertMode>","OneNote")
vim.map("I","<OneNote_PreInsertMode>","OneNote")
vim.map("A","<OneNote_LineAppend>","OneNote")
vim.map("v","<OneNote_SelectMode>","OneNote")

vim.map("2","<OneNote_Set2Rows>","OneNote")
vim.map("3","<OneNote_Set3Rows>","OneNote")
vim.map("4","<OneNote_Set4Rows>","OneNote")
vim.map("5","<OneNote_Set5Rows>","OneNote")
vim.map("6","<OneNote_Set6Rows>","OneNote")
vim.map("7","<OneNote_Set7Rows>","OneNote")
vim.map("8","<OneNote_Set8Rows>","OneNote")
vim.map("9","<OneNote_Set9Rows>","OneNote")
vim.map(".","<pop_cmd>","OneNote")
;翻页操作
vim.map("fu","<OneNote_PageUp>","OneNote")
vim.map("fd","<OneNote_PageDown>","OneNote")
; 切换到Select模式，后续map的所有热键都是在Select模式下
vim.SetMode("Select","OneNote")
; 映射热键
vim.map("<Esc>","<OneNote_NormalMode>","OneNote")
vim.map("j","<OneNote_SelectDown>","OneNote")
vim.map("k","<OneNote_SelectUp>","OneNote")
vim.map("h","<OneNote_SelectLeft>","OneNote")
vim.map("l","<OneNote_selectRight>","OneNote")
vim.map("gg","<OneNote_SelectGoTop>","OneNote")
vim.map("G","<OneNote_SelectGoBottom>","OneNote")
vim.map("d","<OneNote_SelectDelete>","OneNote")
vim.map("y","<OneNote_SelectYank>","OneNote")
vim.map("p","<OneNote_Selectpaste>","OneNote")
;========================公共键位end============================================
; 注意，最后一次SetMode 为 "normal" 则当前为Noraml模式
return
OneNote_CheckMode()
{
    ControlGetFocus,ctrl,AHK_CLASS OneNote
    If RegExMatch(ctrl,"Edit1")
        Return True
    return False
}

;========================公共键位定义begin============================================
; 以下为热键对应的功能区
; 切换为Insert 模式
<OneNote_InsertMode>:
    ;SPI_SETCURSORS:=0x57
    ;DllCall("SystemParametersInfo","UInt",SPI_SETCURSORS,"UInt",0,"UInt",0,"UInt",0)
    ;outputdebug,enter insert model
  vim.SetMode("Insert","OneNote")
  Tooltip, I, 0,0,19
  ;WinGetTitle, Title,A
  ;winsettitle,%Title%,,%Title% Insert模式
return
<OneNote_PreInsertMode>:
    send,{Home}
  vim.SetMode("Insert","OneNote")
return

; 切换为Normal 模式
<OneNote_NormalMode>:
  ;释放shift
  ;send {shift up}
  ;设置光标样式
  ;Send,{Esc}
  ;OCR_NORMAL=32512
  ;OCR_IBEAM=32513

  ;harrow:=DllCall("LoadCursorFromFile","Str","c:\windows\cursors\move_l.cur")
  ;DllCall("SetSystemCursor",Uint,harrow,Int,OCR_NORMAL)
  ;hbeam:=DllCall("LoadCursorFromFile","Str","c:\windows\cursors\no_il.cur")
  ;DllCall("SetSystemCursor",Uint,harrow,Int,OCR_IBEAM)
  vim.SetMode("Normal","OneNote")
  Tooltip, N, 0,0,19
  Bmp := DllCall("LoadImage","UInt",NULL,"Str","caret.bmp","UInt",0,"Int",0,"Int",0,"UInt",0x00000050)
DllCall("CreateCaret","Int",A,"UInt",Bmp)
DllCall("ShowCaret","Int",A)
  ;init rows
  ;在title添加模式,结果无法对齐，背景也错误，取消
  ;WinGetTitle, Title,A
  ;winsettitle,%Title%,,%Title% Normal模式
return
; 切换为Select 模式
<OneNote_SelectMode>:
    ;shift按下
    ;send {shift down};
  vim.SetMode("Select","OneNote")
  Tooltip, V, 0,0,19
return
<OneNote_word>:
    send,^{Right} 
return
<OneNote_back>:
    send,^{Left} 
return
<OneNote_OneLine>:
    send,{End}{Enter} 
    ;outputdebug,要进insertmodel了
    gosub,<OneNote_InsertMode>
    ;vim.SetMode("Insert","OneNote")
    ;Tooltip, insert模式, 0,0,19
return
<OneNote_Up>:
    ;sendplay,{Up}
    if onenote_row>1
    {
        push_cmds("<OneNote_Up>")
        loop,%onenote_row%
        {
            sendplay,{Up}
        }
        onenote_row:=0
    }
    else
    {
        
        sendplay,{Up}
    }
return
<pop_cmd>:
     pop_cmd()
return
<OneNote_Down>:
    if onenote_row>1
    {
        push_cmds("<OneNote_Down>")
        loop,%onenote_row%
        {
            sendplay,{Down}
        }
        onenote_row:=0
    }
    else
    {
        
        sendplay,{Down}
    }
return
<OneNote_linecopy>:
    send,{home}
    sleep,100
    send,+{end}
    sleep,100
    if onenote_row>1
    {
        onenote_row:=onenote_row-1
        loop,%onenote_row%
        {
            sendplay,+{Down}
        }
        onenote_row:=0
    }
    sleep,300
    send,^c
    send,{right}
    ;winactivate,ahk_class Chrome_WidgetWin_1
return
<OneNote_paste>:
    send,^v
return
<OneNote_undo>:
    send,^z
return
<OneNote_redo>:
    send,^y
return
<OneNote_upLine>:
    send,{home}
    send,{enter}
    sendplay,{up}
return
<OneNote_LineAppend>:
    send,{end}
    vim.SetMode("Insert","OneNote")
    Tooltip, insert模式, 0,0,19
return
<OneNote_DeleteOneChar>:
    send,{backspace}
return
<OneNote_Delete>:
    send,^x
return
<OneNote_Yank>:
    

    send,^c
return
<OneNote_DeleteLine>:
    send,{home}
    sleep,100
    send,+{end}
    sleep,100
    if onenote_row>1
    {
        onenote_row:=onenote_row-1
        loop,%onenote_row%
        {
            sendplay,+{Down}
        }
        onenote_row:=0
    }
    sleep,300
    send,^x
    send,{BS}
return

<OneNote_GoTop>:
    send,^{home}
return
<OneNote_GoBottom>:
    send,^{end}
return
<OneNote_ToFirstChar>:
    send,{Home}
return
<OneNote_ToLastChar>:
    send,{End}
return
<OneNote_NewLine>:
    send,{end}
    send,{enter}
return
;====选择模式====
<OneNote_SelectDown>:
    send {Shift down}
    sendplay,{Down}
    send {Shift up}
return
<OneNote_SelectUp>:
    send {Shift down}
    sendplay,{Up}
    send {Shift up}
return
<OneNote_SelectLeft>:
    send {Shift down}
    sendplay,{Left}
    send {Shift up}
return
<OneNote_selectRight>:
    send {Shift down}
    sendplay,{Right}
    send {Shift up}
return
<OneNote_SelectGoTop>:
    send {Shift down}
    send,^{home}
    send {Shift up}
return
<OneNote_SelectGoBottom>:
    send {Shift down}
    send,^{end}
    send {Shift up}
return
<OneNote_SelectDelete>:
    send,^x
return
<OneNote_SelectYank>:
    send,^c
return
<OneNote_Selectpaste>:
    send,^v
return
<OneNote_Set2Rows>:
   onenote_row:=2 
return
<OneNote_Set3Rows>:
   onenote_row:=3 
return
<OneNote_Set4Rows>:
   onenote_row:=4 
return
<OneNote_Set5Rows>:
   onenote_row:=5 
return
<OneNote_Set6Rows>:
   onenote_row:=6 
return
<OneNote_Set7Rows>:
   onenote_row:=7 
return
<OneNote_Set8Rows>:
   onenote_row:=8 
return
<OneNote_Set9Rows>:
   onenote_row:=9 
return

<OneNote_PageUp>:
    send,^{PgUp}
return
<OneNote_PageDown>:
    send,^{PgDn}
return
