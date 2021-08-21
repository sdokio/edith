*For **ENGLISH** readme, click [here](https://github.com/SoyaDokio/edith/blob/main/README_EN.md).*

　

　

```
申明
本项目 fork 自 https://github.com/sunny/edith，中文 README 于2021年8月22日凌晨编写。
SoyaDokio
2021-08-22
```

Edith
=====

Edith 是一个敏捷轻量的 Wiki 程序，适合快速分享文本。直观地讲，就是一个没有任何 UI 的在线记事本。

由于每次编辑都会自动保存，你大可不必担心文本丢失问题。

在线尝试：[https://edit.sunfox.org/any-page-name](https://edit.sunfox.org/any-page-name)

功能
-----

### 多种模式

- `/any-page-name`: 输入任意内容，可自动保存。
- `/any-page-name.txt`: 纯文本模式。
- `/any-page-name.html`: 遵循 [Markdown](https://daringfireball.net/projects/markdown/) 语法的 HTML 模式。
- `/any-page-name.remark`: 遵循 [Remark](https://github.com/gnab/remark) 语法的 Slideshow 模式。
- `/any-page-name.graphviz`: 遵循 [Viz](https://github.com/mdaines/viz.js/) 语法的 Graph 模式（流程图、思维导图等。示例演示：[WebGraphViz](http://www.webgraphviz.com/)）。

快捷键 `Ctrl`+`E` 让你可以在编辑模式和 HTML 模式之间随心切换。

### 网页图标

![网页图标随网页内容变化而变化](https://sunny.github.io/edith/favicon.gif)

网页图标随网页内容变化而变化，同时也可以通过观察它来判断是否自动保存。

### REST

Edith 还支持 RESTful 风格的 API，那还等啥？快去试试对 URL 执行 `PUT` 或 `DELETE` 吧。

### 页面清单

可以访问 `/list` 以显示当前所有页面名称及其后缀格式。

```
注：
不建议公开使用，请注意保护个人隐私。
```

如何配置一个属于你自己的 Edith
-----

1.使用 Clone 命令将远程代码克隆到本地：

```sh
$ git clone https://github.com/sunny/edith.git
$ cd edith
```

### 方式一：使用 Docker

2.创建镜像：

```sh
$ docker build . -t edith
```

3.启动镜像：

```sh
$ docker run --rm -p 8888:80 edith
```

然后你就可以通过 [http://localhost:8888/](http://localhost:8888/) 访问 Edith 了。

### 方式二：使用本地 Web服务器

2.给文件夹 `data` 添加**写**权限：

```sh
$ chmod a+w data
```

3.使用支持 PHP 的 Web服务器运行它，并将所有 404 指向 `index.php`：

- PHP 内建服务器

  ```sh
  $ php -S localhost:8888 index.php
  ```

- Apache 服务器

  你可以使用给定的 .htaccess 样例文件。

  ```sh
  $ cp htaccess.example .htaccess
  ```

- Nginx 服务器

  添加下列指令到你的 Nginx 配置中：

  ```
  try_files $uri $uri/ @rewrites;
  location @rewrites {
    rewrite ^ /index.php last;
  }
  ```

进阶功能
-----

```
注：
尝试下列操作时，请确认知道你自己在干啥，否则啥也别干。
```

### 自定义配置

参考 `config.example.php` 内容，并改为适合你使用的版本，重命名为 `config.php` 。

### 并发访问

多人同时在线编辑，内容实时同步，而不必担心自己的变更内容被他人覆盖。

使用此功能必须安装 [Google Mobwrite](https://code.google.com/archive/p/google-mobwrite/) 到某个服务器，并在 `config.php` 中定义你的端点。

### 页面只读

只需删除文件的**写**权限，即可使对应页面只读：

```sh
$ chmod -w data/foo.txt
```

只读页面将被显示为 HTML ，页面内容编写时请遵循 [Markdown](https://daringfireball.net/projects/markdown/) 语法，否则只能原样输出。

[edit.sunfox.org](https://edit.sunfox.org/) 的主页用的就是这个功能。

要禁止创建新页面的话，删除文件夹 `data` 的**写**权限即可。

### URLs

你可以使用除 `.txt` 和 `.html` 结尾的任意字符串作为文件名。

```
If you prefer `/page.js/txt` URLs instead of `/page.js.txt`, the config file
has a setting for you.
未经确认的翻译：
多级文件夹
如果你输入 /page.js.txt 时表达的意思是创建一个名为 page.js 的文件夹，并在其内创建文件 txt，那么恭喜你，配置文件有为你准备此功能的开关。
```

共同开发
-----

欢迎各位志同道合的朋友共同开发本项目。有意请通过 Issues 给我提意见，或者直接 Fork [本项目](https://github.com/sunny/edith)以创建属于你的分支。

许可协议
-----

Edith 遵循麻省理工学院的开源协议 [MIT License](https://opensource.org/licenses/MIT) 而发布。
