# dotfiles
> **debian linux config file**

- .bashrc
- .tmux.conf
- .Xresource(xterm)

------------------------
# 说明
> Updated: 2019/03/08
## (1).bashrc
### **Screenshot**
- **dirr**
![tmuximg](https://raw.githubusercontent.com/ajioy/storage/master/dirr.png)
- **autojump**
![tmuximg](https://raw.githubusercontent.com/ajioy/storage/master/autojump.png)
- **fzf**
![tmuximg](https://raw.githubusercontent.com/ajioy/storage/master/fzf.png)
### **Plugins**
- [x] **dirr**：一款增强版的ls，配色丰富，可统计目录及文件个数，
- [x] **autojump**：j path，可快速跳至已经cd过的目录
- [x] **fzf**：历史命令模糊搜索，查看当前目录下的所有目录及文件名，可预览文件内容
- [x] **tmux**：终端复用神器，同时开多个终端

### **Support**
- [x] 颜色渐变式的prompt
- [x] bash与tmux pane共享命令历史记录
- [x] 高频命令alias
- [x] xterm及-misc-fixed字体
- [x] 安全版的rm，删除后可恢复
- [x] python virtualenvwrapper配置
- [x] pyenv配置

### **Shortcuts**
#### - **fzf**
```
Ctrl + r          显示历史命令 (需要配置.bashrc)
Ctrl + t          显示fzf窗口，可预览文件内容
Alt + c           列出当前文件夹下的目录，选中后自动进入相应目录
ls/... **<tab>    触发文件或目录的自动完成
Ctrl-j/k/n/p      在结果集中用光标上下移动
Ctrl-c/g/ or Esc  退出

Mouse上下滚动， 选中， 双击； Shift多选
find * -type f | fzf > selected  搜索的结果集供选择
```

#### - **Bash Terminal**
##### **1.移动**
| 快捷键      | 功能            |
| --          | ------          |
| `Ctrl + a`  | 跳至命令行首，相当于HOME键    |
| `Ctrl + e`  | 跳至命令行尾，相当于END键   |
| `Alt + f`   | 光标向左移动一个单词，Ctrl+左键等同   |
| `Alt + b`   | 光标向右移动一个单词，Ctrl+右键等同    |
| `Ctrl + f`  | 光标向右移动一个字符，相当于右方向键    |
| `Ctrl + b`  | 光标向左移动一个字符，相当于左方向键    |
| `Esc + b`   | 移动到当前光标所在单词或前面一个单词的开头  |

##### **2.删除**
| 快捷键      | 功能            |
| --          | ------          |
| `Ctrl + c`  | 清除整行    |
| `Ctrl + u`  | 删除光标左边所有字符   |
| `Ctrl + k`  | 删除光标右边所有字符    |
| `Ctrl + w`  | 光标向左删除一个单词，包括空格    |
| `Alt + d`   | 光标向右删除一个单词，包括空格    |
| `Ctrl + d`  | 光标向左删除一个字符    |
| `Ctrl + h`  | 光标向右删除一个字符    |

##### **3.命令**
| 快捷键      | 功能            |
| --          | ------          |
| `Ctrl + p`  | 上一条命令，相当于上方向键   |
| `Ctrl + n`  | 下一条命令，相当于下方向键   |
| `Ctrl + l`  | 清屏，相当于clear命令    |
| `Ctrl + j`  | 执行命令，相当于Enter键   |
| `Ctrl + （x  u)`  | 撤消上一次操作，Ctrl按住不放    | 撤消 |
| `Ctrl + s`  | 挂起当前shell停止屏幕输出    |
| `Ctrl + q`  | 重新激活向屏幕输出   |
| `Ctrl + d`  | 退出终端，相当于logout命令   |


##### **4.复制粘贴**
| 快捷键      | 功能            |
| --          | ------          |
| `Ctrl + y`  | 粘贴刚才删除的字符    |
| `Ctrl + Insert`  | 复制选中内容至缓冲区    |
| `Shift + Insert`  | 粘贴缓冲区内容    |

##### **5.其他**
| 快捷键      | 功能            |
| --          | ------          |
| `Alt + t`  | 交换光标所在单词与左边的单词    |
| `Alt + u`  | 将光标所在单词转为大写    |
| `Alt + l`  | 将光标所在单词转为小写，xshell不生效    |
| `Ctrl + Shift + =`  | 放大终端界面，xshell不生效    |
| `Ctrl + -`  | 缩小终端界面，xshell不生效    |

------------------------
## (2).tmux.conf
### **ScreenShot**
![tmuximg](https://raw.githubusercontent.com/ajioy/storage/master/tmux.png)

### **Shortcuts**

**`Tip： 前缀键ctrl+b（prefix）`**
##### **1.系统System**
```
?           列出所有快捷键
d           脱离会话，返回到Shell界面
D           选择要脱离的会话
r           强制重绘未脱离的会话
s           选择并切换会话
:           进入命令行模式
[           进入复制模式
~           列出提示信息缓存
Ctrl+z      挂起当前会话
pageup      向上滚屏
pagedown    向下滚屏

刷新配置使之生效
prefix :source-file ~/.tmux.conf
prefix+R(自定义快捷键)
```

##### **2.会话Session**
```
:new<回车>  启动新会话
s           列出所有会话
$           重命名当前会话

启动新会话：
tmux [new -s 会话名 -n 窗口名]

恢复会话：
tmux at [-t 会话名]

列出所有会话：
tmux ls

关闭会话：
tmux kill-session -t 会话名

关闭所有会话：
tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill

借助插件管理工具Tmux Plugin Manager实现会话的保存与恢复
prefix Ctrl-s       # save tmux session to local file
prefix Ctrl-r       # reload tmux session from local file
```

##### **3.窗口Window**
```
c           创建新窗口
&           关闭当前窗口
0-9         切换至指定窗口
n           切换至下一窗口
p           切换至上一窗口
l           在两个窗口间切换
w           显示窗口列表
,           重命名当前窗口
.           修改当前窗口编号
f           查找窗口或文本
```

##### **4.面板Pane**
```
“           上下(垂直)分割面板
%           左右（水平）分割面板
Space       循环切换布局
x           关闭当前面板
!           将当前面板置于新窗口
q           显示面板编号
o           在面板之间移动焦点，交换窗格
t           显示时间
{           同上一个面板交换位置
}           同下一个个面板交换位置
z           最大化/最小化当前面板

Alt+o       逆时针旋转当前窗口的面板
Ctrl+o      顺时针旋转当前窗口的面板
方向键      移动光标以选择面板
Ctrl+方向键 调整当前面板大小1
Alt+方向键  调整当前面板大小5
```




