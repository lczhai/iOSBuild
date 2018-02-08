
projectnmae=$1
schemename=$2
exportpath=$3
mode=$4



echo 'projectnmae ： '${projectnmae}
echo 'schemename ： '${schemename}
echo 'mode ： '${mode}


if [ -z "$projectnmae" ]; then
    echo '${projectnmae} : 无效' 
    echo "请将projectNmae作为脚本第一个参数传入"; exit 1;
fi

if [ -z "$schemename" ]; then
    echo '${projectnmae} : 无效' 
    echo "请将projectNmae作为脚本第一个参数传入"; exit 1;
fi










#! /bin/bash
# created by Ficow Shen

#工程绝对路径
project_path=${PWD}

echo 'project_path===='$project_path

#工程名

project_name=${projectnmae}

#打包模式 Debug/Release
development_mode=${mode}

#scheme名
scheme_name=${schemename}

#build文件夹路径
build_path=${project_path}/build

#plist文件所在路径
exportOptionsPlistPath=${project_path}/exportOptions.plist

#导出.ipa文件所在路径
if [ -z "$exportpath" ]; then
    exportFilePath=${project_path}/ipa/${development_mode}
else  
    exportFilePath=${exportpath}
fi  

echo 'exportFilePath ==== ' ${exportFilePath}


echo '*** 正在 清理工程 ***'
xcodebuild \
clean -configuration ${development_mode} -quiet  || exit 
echo '*** 清理完成 ***'



echo '*** 正在 编译工程 For '${development_mode}
xcodebuild \
archive -workspace ${project_path}/${project_name}.xcworkspace \
-scheme ${scheme_name} \
-configuration ${development_mode} \
-archivePath ${build_path}/${project_name}.xcarchive -quiet  || exit
echo '*** 编译完成 ***'



echo '*** 正在 打包 ***'
xcodebuild -exportArchive -archivePath ${build_path}/${project_name}.xcarchive \
-configuration ${development_mode} \
-exportPath ${exportFilePath} \
-exportOptionsPlist ${exportOptionsPlistPath} \
-quiet || exit

if [ -e $exportFilePath/$scheme_name.ipa ]; then
    echo "*** .ipa文件已导出 ***"
    #open $exportFilePath
else
    echo "*** 创建.ipa文件失败 ***"
fi
echo '*** 打包完成 ***'
