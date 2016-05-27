# TestRNWithExistSwift
用现有的swift项目把RN集成进来

根据[Facebook官方教程](https://facebook.github.io/react-native/docs/embedded-app-ios.html)来做,有一些坑,记一下!
https://github.com/facebook/react-native/issues/4968
#### version
node: 4.3.2
react-native: 0.26.2
react: 15.0.2

* 1 跟着教程进入 `pod install` 时,如果不成功,尝试着再加一个swift或者OC的库进来,`pod install`就会成功了.
* 2 记得Podfile中时,也要加上`Target "projectName" do ..... end`的,否则,`pod install` 也可能会不成功
* 3 一直,跟着走都没问题,

```
(JS_DIR=`pwd`/ReactComponent; cd node_modules/react-native; npm run start -- --root $JS_DIR)
```
启动react-native,然后进入APP,build & run之后,这时候会出现`Unable to resolve module react`的错误,因为新版本的react需要自己手动安装,react-native不会帮你安装了,`npm install react --save`安装react,最好加上--save,否则可能会出问题.

* 4 安装react之后你会发现,npm还是会爆一个warning

`npm WARN react-native@0.26.2 requires a peer of react@15.0.2 but none was installed.`

因为你需要安装指定版本的react才行,否则还是运行不了.重新安装指定版本之后,就不会有这个警告了.

* 5 这时候理应大功告成,但是你可能还会报错,清RN缓存即可.

#### 其他坑:
* `Unable to resolve module LinkedStateMixin`没有安装react,最好加上`--save`命令
* `Unable to resolve module ReactDefaultPerf`我是一开始报上面那个错误,安装react后报这个错,清缓存后即可!
* `watchman watch-del-all` `npm start -- --reset-cache` 清缓存命令(注:我理解的是清缓存的意思)
* 如果问题,[这里](https://github.com/facebook/react-native/issues/4968)基本上可以解决

