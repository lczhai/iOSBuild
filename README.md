### iOS自动打包脚本使用介绍

tips:
1，当前脚本目前仅仅适用于使用cocoapods进行包管理的项目
2，依赖xcodebuild,故不能跨平台

简书地址：https://www.jianshu.com/p/a33fcad2be55
github地址：https://github.com/lczhai/iOSBuild

###使用步骤

#### 准备工具

> 1，macOS系统
>
> 2，xcode
>
> 3，脚本(auto_build.sh)
>
> 4，ExportOptions.plist 配置文件
>
> *ExportOptions.plist 可通过手动打包一次，在生成的包文件夹中即可获取（亦可自己配置，百度一下，很多资料）*
![plist.jpg](http://upload-images.jianshu.io/upload_images/2312430-8b7a57c83623ada6.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



#####1，将脚本(auto_build.sh)和ExportOptions.plist放入项目根目录下

#####2,执行脚本


-----------


###脚本使用方式
>脚本共有四个参数，分别为：
1，项目名称   ：如 TestProject
2，target名称：如 TestProject
3，导出路径   :  你希望导出的路径，若希望导出到当前路径，则填写   '  ./   '即可
4，打包模式  ： Debug 或者 Release   


###执行命令
>1打开终端terminal  
2进入项目根目录下，执行脚本

>命令：
cd  xxx
./auto_build.sh  projectname  targetname  导出路径 打包模式


>EX
cd  testproject/
./auto_build.sh  testproject  testproject  ../ Debug




>提示:项目名称（projectname）和target名称（targetname）查看位置
![project.jpg](http://upload-images.jianshu.io/upload_images/2312430-f4698cad40174e40.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

