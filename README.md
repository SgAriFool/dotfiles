# 文件说明

这是我的一个配置文件的同步文件夹, 将该文件夹 `clone` 到 Home 目录, 然后使用 stow 创建软链接到相应的位置

注意, 在使用 stow 的时候需要将目录 cd 到这个 dotfiles 文件夹下, 方便操作

# 如何添加一个新的 dotfile

查看新的 dotfile 相对于 Home 目录的路径

假如有一个 dotfile, 它的路径是 `~/.zshrc` 那么我们应该这样在 dotfiles 文件夹创建一个新的 dotfile, `~./dotfiles/zsh/.zshrc` 创建完之后目录结构应该如下所示

```bash
~
├─dotfiles
│  ├─bash
│  │  └─.bashrc
│  ├─tmux
│  │  └─.tmux.conf
│  └─zsh
│     └─.zshrc
├─Desktop
├─Document
├─Download
└─...

```

这里的 zsh 就是后面使用 stow 命令时, 跟着的文件夹名称, 然后就会在 Home 目录里创建一个 `~/.zshrc` -> `~./dotfiles/zsh/.zshrc` 的软链接

# 具体使用方法

1. 安装 stow(如果没有的话)
2. cd 到 dotfiles 目录
3. 使用命令
```bash
stow [your_fold_name, 上述例子里这里应该使用 zsh]
```
4. 可以建立一个相应目录的软链接
