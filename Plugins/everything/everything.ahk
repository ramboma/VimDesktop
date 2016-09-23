everything:

class:="everything"
filepath:="everything.exe"

;========================公共键位begin============================================
; 设置Win
vim.SetWin("everything",class,filepath)

; 切换到Inert模式，后续map的所有热键都是在Insert模式下
vim.SetMode("Insert","everything")
; 映射热键
vim.map("<Esc>","<everything_NormalMode>","everything")
; 切换到Normal模式，后续map的所有热键都是在Noraml模式下
vim.SetMode("Normal","everything")
; 映射热键
vim.map("i","<everything_InsertMode>","everything")
; <0>~<9>是内置的Label，可以看一下class_vim.ahk
;移动

vim.map("j","<everything_Down>","everything")
vim.map("k","<everything_Up>","everything")

vim.map("o","<everything_OpenPath>","everything")
vim.map("yf","<everything_copyfile>","everything")
vim.map("yp","<everything_copyallpath>","everything")

vim.map("x","<everything_Delete>","everything")

;========================公共键位end============================================
; 注意，最后一次SetMode 为 "normal" 则当前为Noraml模式
return
everything_CheckMode()
{
    ControlGetFocus,ctrl,AHK_CLASS everything
    If RegExMatch(ctrl,"everything")
        Return True
    return False
}
;========================公共键位定义begin============================================
; 以下为热键对应的功能区
; 切换为Insert 模式
<everything_InsertMode>:

    send,!{Home}
  vim.SetMode("Insert","everything")
return

; 切换为Normal 模式
<everything_NormalMode>:
  vim.SetMode("Normal","everything")
return
;插入模式下的命令
<everything_Up>:
    sendplay,{Up}
return
<everything_Down>:
    sendplay,{Down}
return
<everything_OpenPath>:
    sendplay,^{Enter}
return
<everything_copyfile>:
    sendplay,^c
return
<everything_copyallpath>:
    send,^+c
return
<everything_Delete>:
    send,{Delete}
return
