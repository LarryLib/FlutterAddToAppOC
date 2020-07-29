# FlutterAddToAppOC
https://github.com/LarryLib/FlutterAddToAppOC/issues/1#issue-667590900

【测试项目】
1、主项目是OC
2、flutter项目中有用到插件：（以device_info为例）
3、编译、运行
（1）、test_flutter可正常运行：调用device_info正常
（2）、.iOS、.android可正常运行：调用device_info正常
（3）、FlutterAddToAppOC可正常运行：调用device_info相关的API，就会报错，错误日志如下：
[VERBOSE-2:ui_dart_state.cc(157)] Unhandled Exception: MissingPluginException(No implementation found for method getIosDeviceInfo on channel plugins.flutter.io/device_info)

【项目结构】
一、以前的flutter项目，可正常运行。
test_flutter(flutter项目)
|
|
|----------------------------------------------------原生iOS、原生Android
|
|(插件)
|
device_info

二、device_info插件，结构如下
device_info
|
|-----------------Android
|  
|  
iOS  

三、当前项目结构
FlutterAddToAppOC（作为主项目）
|
|---test_flutter（有隐藏文件：.ios、.android）
 |
 |(插件)
 |
device_info
