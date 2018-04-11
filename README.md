vimcdoc
=======

Vim 中文文檔計劃

# 關 於

Vim (http://www.vim.org) 是一個功能非常強大，且具有很強擴展性的編輯器。而且 Vim
本身帶有一個完備的幫助系統。本項目的目的就是將 Vim 的這些文檔翻譯成中文，以便更
多的人認識及更好地使用這個非常強大的編輯器。文檔分成用戶手冊和參考手冊兩部分，
你既可以像使用教程那樣循序漸進，也可以快速地查閱來獲取幫助。

# 下 載

(繁體中文尚未支援)

https://github.com/yianwillis/vimcdoc/releases 提供發佈版本的下載。

* PDF 用戶手冊和參考手冊
* tar.gz 包
* Win32 GB2312 版本和 UTF8 版本的中文自動安裝程序

# 安裝

## Vim 8.0 自帶軟件包支持

```shell
$ mkdir -p ~/.vim/pack/foo/start
$ cd ~/.vim/pack/foo/start
$ git clone git://github.com/Chienweichih/vimcdoc.git
```

重啟 Vim。

其中 foo 可以是任何你自選的名字。

當然，如果不想用 git，也可用解壓下載的 tar.gz 包到 `~/.vim/pack/foo/start`。git
方式的好處可以隨時進行更新。

## Vundle

(繁體中文尚未支援)

.vimrc 中加入：

```
Plugin "yianwillis/vimcdoc"
```

重啟 Vim 後執行 `:PluginInstall`。

## NeoBundle

(繁體中文尚未支援)

.vimrc 中加入：

```
NeoBundle 'yianwillis/vimcdoc"
```

重啟 Vim 後執行命令 `:NeoBundleInstall`。

## Pathogen

(繁體中文尚未支援)

```shell
$ cd ~/.vim/bundle
$ git clone git://github.com/yianwillis/vimcdoc.git
```

重啟 Vim。

## vim-plug

(繁體中文尚未支援)

.vimrc 中加入:

```
Plug 'yianwillis/vimcdoc'
```

重啟 Vim 後執行命令 `:PlugInstall`。

## Linux 程序安裝

(繁體中文尚未支援)

下載的 tar.gz 包括所有翻譯過的 vim 文檔 (.twx 文件) 和相關的語法文件和插件。
先將其解壓縮：

```shell
$ tar zxvf vimcdoc-<version>.tar.gz
```

然後進入 vimcdoc-<version> 目錄並執行

```shell
$ ./vimcdoc.sh -i
```

就可以了。該安裝程序會自動識別 Vim 的安裝路徑，將中文的文檔拷貝到相應的地方。原
有的英文文檔不受影響。

缺省安裝 vimcdoc.vim 插件，設置缺省幫助語言為中文。如果你不希望如此，可用

```shell
$ ./vimcdoc.sh -I
```

來代替。

這種方法對 root 和非 root 用戶都適用。但建議以 root 身份安裝。當以 root 身份安
裝時，文件會被拷貝至 /usr/share/vim/vimfiles/doc 下。因此所有系統的用戶都可以使
用中文文檔。如果你的 vim 是安裝在 /usr/local 下的話，你需要這樣設定 vim 的
runtimepath 選項：

```vim
:set rtp+=/usr/share/vim/vimfiles
```

你可以將上面的設定加入到你的 vimrc 文件中以便每次啟動 vim 都生效。當以普通用戶
安裝時，所有文件會被拷貝至 ~/.vim/doc 下，所以僅對該用戶有效。

## Win32 程序安裝

建議使用已經做好的自動安裝程序。該程序不寫註冊表，不建立程序組，不覆蓋任何 Vim
原有文件。所以可以放心使用。

## 手動安裝

你也可以自己動手來安裝：只要把所有的中文文檔以及 tags-tw 文件拷貝到 runtimepath
之一的 doc 子目錄下就行了。runtimepath 可用在 vim 內用 `:set rtp?` 命令來得到。比
如在 `vimcdoc-<version>` 目錄中，可以執行以下命令：

```shell
$ cp -R doc /usr/share/vim/vimfiles/doc
```

這種方法對 Linux 和 Win32 都有效。

現在啟動 vim/gvim, 鍵入 :help 看看吧！


# 卸 載

## Linux 程序安裝
如果你是使用的自動安裝腳本安裝的話，只要運行：

```shell
$ ./vimcdoc.sh -u
```

即可。但必須用與安裝時同樣的用戶名 (root 用戶安裝程序會在
/usr/share/doc/vimcdoc 下安裝該文件)。

## Win32 程序安裝

假定你的 Vim 安裝在 c:\vim 下，在 c:\vim\vimfiles\doc\ 目錄內會有一個
vimcdoc-Uninst.exe，只要執行它就可以了。

## 設 置

你的 'encoding' 設置及字體必須支持中文顯示。對於使用非 utf-8 中文環境的用戶，在
瀏覽某些幫助文件的時候可能會遇到麻煩。這是因為那些文件包含無法在 gbk, gb2312 等
編碼方式下顯示的字符。遇到這種情況，有以下幾種解決方案：

1. 使用 utf-8 中文環境。例如，將 `LC_ALL` 設定為 `zh_TW.UTF-8`
2. 強制 vim 使用 utf-8 編碼。做法是 `:set enc=utf-8`
3. 如果你的系統有 GB18030 支持，可以讓 vim 使用 GB18030 編碼，因為 GB18030 對非
   中文字符也能進行適當的處理。方法是

   ```vim
   :set enc=2byte-gb18030
   ```

   這時，Vim 會正確地進行轉換。注意這裡不能通過設置 `LC_ALL` 來完成。

如果使用 2 或 3，建議把 vim 設置寫入你的個人 .vimrc 設置文件，避免每次都要輸入
命令的麻煩。

備註：如果 `set enc=utf-8` 時，使用的中文消息出現亂碼，可以同時設置

```vim
:language message zh_TW.UTF-8
```

# 在 線 閱 讀

可在線閱讀幫助文檔的 HTML 版。

http://Chienweichih.github.io/vimcdoc/

為了最佳閱讀效果，請確保你的系統安裝了 'Noto Sans Mono CJK TC' 或 Monaco 字
體，否則可能有字體不能完全對齊的情況。
(改成繁體字型有些地方變得不對齊了)

# 加 入

我們歡迎各種各樣的幫助，翻譯，測試，等等等等。如果你也想加入本項目的話，請直接
與我們聯繫 (見下)，同時請先行閱讀 guides.txt。

AUTHORS 列出了翻譯人員。

LICENSE 包括版權信息。

# 信 息

歡迎訪問我們的主頁以獲取更多的信息和最新的版本:

https://github.com/Chienweichih/vimcdoc

這將是我們的新主頁。原版本 http://vimcdoc.sf.net (English) 的內容已經完整導入。
以後的更新也只會在 github 進行。


# 聯 系

任何建議、問題等等，請送往 chienweichih@hotmail.com。
