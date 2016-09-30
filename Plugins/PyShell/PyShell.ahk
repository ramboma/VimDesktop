PyShell:
class:="TkTopLevel"
filepath:="pythonw.exe"
;Python 3.4.3 Shell
;ahk_class TkTopLevel
;ahk_exe pythonw.exe
;定义row变量，用来实现2yy,2dd操作
onenote_row:=0
;========================公共键位begin============================================
; 设置Win
vim.SetWin("PyShell",class,filepath)

; 切换到Inert模式，后续map的所有热键都是在Insert模式下
vim.SetMode("Insert","PyShell")
; 映射热键
vim.map("<Esc>","<PyShell_NormalMode>","PyShell")
; 切换到Normal模式，后续map的所有热键都是在Noraml模式下
vim.SetMode("Normal","PyShell")
; 映射热键
; <0>~<9>是内置的Label，可以看一下class_vim.ahk
vim.map("j","<PyShell_Down>","PyShell")
vim.map("k","<PyShell_Up>","PyShell")
vim.map("h","<left>","PyShell")
vim.map("l","<right>","PyShell")
vim.map("w","<PyShell_word>","PyShell")
vim.map("b","<PyShell_back>","PyShell")
vim.map("o","<PyShell_OneLine>","PyShell")
vim.map("O","<PyShell_upLine>","PyShell")
vim.map("p","<PyShell_paste>","PyShell")
vim.map("yy","<PyShell_linecopy>","PyShell")
vim.map("u","<PyShell_undo>","PyShell")
vim.map("r","<PyShell_redo>","PyShell")
vim.map("gg","<PyShell_GoTop>","PyShell")
vim.map("G","<PyShell_GoBottom>","PyShell")
vim.map("tt","<PyShell_NewLine>","PyShell")

vim.map("x","<PyShell_DeleteOneChar>","PyShell")
vim.map("d","<PyShell_Delete>","PyShell")
vim.map("dd","<PyShell_DeleteLine>","PyShell")
vim.map("0","<PyShell_ToFirstChar>","PyShell")
vim.map("$","<PyShell_ToLastChar>","PyShell")

vim.map("i","<PyShell_InsertMode>","PyShell")
vim.map("I","<PyShell_PreInsertMode>","PyShell")
vim.map("A","<PyShell_LineAppend>","PyShell")
vim.map("v","<PyShell_SelectMode>","PyShell")

vim.map("2","<PyShell_Set2Rows>","PyShell")
vim.map("3","<PyShell_Set3Rows>","PyShell")
vim.map("4","<PyShell_Set4Rows>","PyShell")
vim.map("5","<PyShell_Set5Rows>","PyShell")
vim.map("6","<PyShell_Set6Rows>","PyShell")
vim.map("7","<PyShell_Set7Rows>","PyShell")
vim.map("8","<PyShell_Set8Rows>","PyShell")
vim.map("9","<PyShell_Set9Rows>","PyShell")
; 切换到Select模式，后续map的所有热键都是在Select模式下
vim.SetMode("Select","PyShell")
; 映射热键
vim.map("<Esc>","<PyShell_NormalMode>","PyShell")
vim.map("j","<PyShell_SelectDown>","PyShell")
vim.map("k","<PyShell_SelectUp>","PyShell")
vim.map("h","<PyShell_SelectLeft>","PyShell")
vim.map("l","<PyShell_selectRight>","PyShell")
vim.map("gg","<PyShell_SelectGoTop>","PyShell")
vim.map("G","<PyShell_SelectGoBottom>","PyShell")
vim.map("d","<PyShell_SelectDelete>","PyShell")
vim.map("y","<PyShell_SelectYank>","PyShell")
vim.map("p","<PyShell_Selectpaste>","PyShell")
;========================公共键位end============================================
; 注意，最后一次SetMode 为 "normal" 则当前为Noraml模式
return
;========================公共键位定义begin============================================
; 以下为热键对应的功能区
; 切换为Insert 模式
<PyShell_InsertMode>:
    ;SPI_SETCURSORS:=0x57
    ;DllCall("SystemParametersInfo","UInt",SPI_SETCURSORS,"UInt",0,"UInt",0,"UInt",0)
    ;msgbox,enter insert model
  vim.SetMode("Insert","PyShell")
  Tooltip, insert模式, 0,0,19
  ;WinGetTitle, Title,A
  ;winsettitle,%Title%,,%Title% Insert模式
return
<PyShell_PreInsertMode>:
    send,{Home}
  vim.SetMode("Insert","PyShell")
return

; 切换为Normal 模式
<PyShell_NormalMode>:
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
  vim.SetMode("Normal","PyShell")
  Tooltip, Normal模式, 0,0,19
  ;在title添加模式,结果无法对齐，背景也错误，取消
  ;WinGetTitle, Title,A
  ;winsettitle,%Title%,,%Title% Normal模式
return
; 切换为Select 模式
<PyShell_SelectMode>:
    ;shift按下
    ;send {shift down};
  vim.SetMode("Select","PyShell")
return
<PyShell_word>:
    send,^{Right} 
return
<PyShell_back>:
    send,^{Left} 
return
<PyShell_OneLine>:
    send,{End}{Enter} 
    ;msgbox,要进insertmodel了
    gosub,<PyShell_InsertMode>
    ;vim.SetMode("Insert","PyShell")
    ;Tooltip, insert模式, 0,0,19
return
<PyShell_Up>:
    sendplay,{Up}
return
<PyShell_Down>:
    sendplay,{Down}
return
<PyShell_linecopy>:
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
<PyShell_paste>:
    send,^v
return
<PyShell_undo>:
    send,^z
return
<PyShell_redo>:
    send,^y
return
<PyShell_upLine>:
    send,{home}
    send,{enter}
    sendplay,{up}
return
<PyShell_LineAppend>:
    send,{end}
    vim.SetMode("Insert","PyShell")
    Tooltip, insert模式, 0,0,19
return
<PyShell_DeleteOneChar>:
    send,{backspace}
return
<PyShell_Delete>:
    send,^x
return
<PyShell_Yank>:
    

    send,^c
return
<PyShell_DeleteLine>:
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

<PyShell_GoTop>:
    send,^{home}
return
<PyShell_GoBottom>:
    send,^{end}
return
<PyShell_ToFirstChar>:
    send,{Home}
return
<PyShell_ToLastChar>:
    send,{End}
return
<PyShell_NewLine>:
    send,{end}
    send,{enter}
return
;====选择模式====
<PyShell_SelectDown>:
    send {Shift down}
    sendplay,{Down}
    send {Shift up}
return
<PyShell_SelectUp>:
    send {Shift down}
    sendplay,{Up}
    send {Shift up}
return
<PyShell_SelectLeft>:
    send {Shift down}
    sendplay,{Left}
    send {Shift up}
return
<PyShell_selectRight>:
    send {Shift down}
    sendplay,{Right}
    send {Shift up}
return
<PyShell_SelectGoTop>:
    send {Shift down}
    send,^{home}
    send {Shift up}
return
<PyShell_SelectGoBottom>:
    send {Shift down}
    send,^{end}
    send {Shift up}
return
<PyShell_SelectDelete>:
    send,^x
return
<PyShell_SelectYank>:
    send,^c
return
<PyShell_Selectpaste>:
    send,^v
return
<PyShell_Set2Rows>:
   onenote_row:=2 
return
<PyShell_Set3Rows>:
   onenote_row:=3 
return
<PyShell_Set4Rows>:
   onenote_row:=4 
return
<PyShell_Set5Rows>:
   onenote_row:=5 
return
<PyShell_Set6Rows>:
   onenote_row:=6 
return
<PyShell_Set7Rows>:
   onenote_row:=7 
return
<PyShell_Set8Rows>:
   onenote_row:=8 
return
<PyShell_Set9Rows>:
   onenote_row:=9 
return

;========================公共键位定义end============================================
