OneNote:
class:="Framework::CFrame"
filepath:="ONENOTE.EXE"
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

vim.map("x","<OneNote_DeleteOneChar>","OneNote")
vim.map("d","<OneNote_Delete>","OneNote")
vim.map("dd","<OneNote_DeleteLine>","OneNote")

vim.map("i","<OneNote_InsertMode>","OneNote")
vim.map("I","<OneNote_PreInsertMode>","OneNote")
vim.map("A","<OneNote_LineAppend>","OneNote")
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
  vim.SetMode("Insert","OneNote")
return
<OneNote_PreInsertMode>:
    send,{Home}
  vim.SetMode("Insert","OneNote")
return

; 切换为Normal 模式
<OneNote_NormalMode>:
  vim.SetMode("Normal","OneNote")
return
<OneNote_word>:
    send,^{Right} 
return
<OneNote_back>:
    send,^{Left} 
return
<OneNote_OneLine>:
    send,{End}{Enter} 
    vim.SetMode("Insert","OneNote")
return
<OneNote_Up>:
    sendplay,{Up}
return
<OneNote_Down>:
    sendplay,{Down}
return
<OneNote_linecopy>:
    send,{home}
    send,+{end}
    send,^c
    send,{right}
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
return
<OneNote_DeleteOneChar>:
    send,{backspace}
return
<OneNote_Delete>:
    send,{delete}
return
<OneNote_DeleteLine>:
    send,{home}
    send,+{end}
    send,{delete}
return
;========================公共键位定义end============================================
