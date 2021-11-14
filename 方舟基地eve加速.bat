::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcByLPWSyOpEZ++Pv4Pq7p1sY0Qj/8W8k5r2eNrZd+kvjFQ==
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFANdTQuKAE+/Fb4I5/jH6vyCJ6fd3QLARAogBDJOx64a6UqE
::YAwzuBVtJxjWCl3EqQJhSA==
::ZR4luwNxJguZRRmT+kMiI1VXQwni
::Yhs/ulQjdFy5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdFy5
::ZR41oxFsdFKZSTk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJgZksaHUrTXA==
::ZQ05rAF9IBncCkqN+0xwdVsEAlTMbSXrZg==
::ZQ05rAF9IAHYFVzEqQK23sLcpPsHw7E/+mVR7f7+agBHK63iNA==
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQK1wtvdrPuHKm76CbsQ4eb+aSZAJLHw0xjb/X8UX15GpRnbb6oO8071UJK1HjfhifGZ++tjDg==
::dhA7uBVwLU+EWN9yLcrY156rloF+7As=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATEcY3Crd+oyvJbtINFZg==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFANdTQuKAE+/Fb4I5/jH6vyCJ6fd3QLARAktAzxm32XsMMAYpbMb8/+wWELs81VdZhfL
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal EnableDelayedExpansion
color 0b
mode con cols=80 lines=25
echo **************************************
echo 建议仅从wnark.com下载脚本
echo 使用其他来源下载谨防病毒、木马
echo 对了，记得打开网卡的启用IPv6支持
start ipv6.png
echo 如果不随便“优化”的话默认都是打开的
echo 不懂的可以百度搜：启用IPv6支持
pause
echo 桌面的ipv6.png是自动打开的那个图片，我设置会自动删除
echo 如果没有自动删除的话
echo 麻烦您待会把桌面的那个ipv6.png文件手动删掉谢谢啦
pause
echo 360啥的会提示这个脚本修改网络啥的
echo 允许就行了
pause
echo 由于安全软件的原因请手动修改hosts文件
echo hosts位置：C:\Windows\System32\drivers\etc
echo **************************************
echo 如果加速游戏服务器请在hosts内填入
echo 127.0.0.1 tranquility.servers.eveonline.com
echo **************************************
echo 如果加速启动器请在hosts内填入
echo 127.0.0.1  launcher.eveonline.com
echo 127.0.0.1  resources.eveonline.com
echo 127.0.0.1  binaries.eveonline.com
echo **************************************
echo 修改hosts的时候不用关闭此脚本
echo 修改完成后执行下一步
pause
echo 检测iphlpsvc服务是否在运行
for /f "skip=3 tokens=4" %%n in ('sc query iphlpsvc') do set "zt=%%n" &goto :next
:next
if /i "%zt%"=="STOPPED" (goto 1)
if /i "%zt%"=="RUNNING" (goto 2)
:1
	echo iphlpsvc服务现在处理停止状态,将进行启动
	sc config iphlpsvc start= auto
	net start iphlpsvc
	echo 启动完成后请重启电脑再次执行脚本
	pause
exit

:2
	echo iphlpsvc服务在运行，现在进入下一步
	pause
	echo 检测hosts的内容中,请稍等
	For /f "skip=1 tokens=2 delims=[" %%a in ('ping  tranquility.servers.eveonline.com') do (
		For /f "tokens=1 delims=]" %%b in ("%%a") do (
			Set serverip=%%b
		)
	)
	For /f "skip=1 tokens=2 delims=[" %%a in ('ping  launcher.eveonline.com') do (
		For /f "tokens=1 delims=]" %%b in ("%%a") do (
			Set launcherip=%%b
		)
	)
	For /f "skip=1 tokens=2 delims=[" %%a in ('ping  resources.eveonline.com') do (
		For /f "tokens=1 delims=]" %%b in ("%%a") do (
			Set resourcesip=%%b
		)
	)
	For /f "skip=1 tokens=2 delims=[" %%a in ('ping  binaries.eveonline.com') do (
		For /f "tokens=1 delims=]" %%b in ("%%a") do (
			Set binariesip=%%b
		)
	)

		echo 请选择加速类型
		echo **************************************
		echo 1.加速游戏服务器
		echo 2.加速启动器
		echo 3.恢复原状
		echo **************************************
		set /p option=请输入你的选择:
		if "!option!"=="1" (
		echo 开始加速游戏服务器
		echo 检测hosts是否正确
		echo tranquility.servers.eveonline.com的ip是%serverip%
		pause
		if "%serverip%"=="127.0.0.1" (
		echo hosts设置正确
		pause
		netsh interface portproxy add v4tov4 listenport=26000 listenaddress=127.0.0.1 connectport=33389 connectaddress=129.146.46.7.ipssh.net
		echo 加速完成
		echo **************************************
		echo 当前Windows端口转发状态.
		echo 没显示即加速失败
		echo 加速失败请附上此处截图加群：797474927询问
		netsh interface portproxy show all
		netstat -ano | findstr :26000
		echo **************************************
		pause
		exit
		) else (
		echo hosts没正确修改，请设置
		echo 127.0.0.1 tranquility.servers.eveonline.com
		echo 然后再次运行此脚本
		pause
		exit
		)
		)else if "!option!"=="2" (
		echo 开始加速启动器
		echo 检测hosts是否正确
		echo launcher.eveonline.com的ip是%launcherip%
		echo resources.eveonline.com的ip是%resourcesip%
		echo binaries.eveonline.com的ip是%binariesip%
		pause
		if "%launcherip%+%launcherip%+%binariesip%"=="127.0.0.1+127.0.0.1+127.0.0.1" (
		echo hosts设置正确
		pause
		netsh interface portproxy add v4tov4 listenport=443 listenaddress=127.0.0.1 connectport=47068 connectaddress=idc.cubepaas.com
		echo 加速完成
		echo **************************************
		echo 当前Windows端口转发状态.
		echo 没显示即加速失败
		echo 加速失败请附上此处截图加群：797474927询问
		netsh interface portproxy show all
		netstat -ano | findstr :443
		echo **************************************
		pause
		exit
		) else (
		echo hosts没正确修改，请设置
		echo 127.0.0.1  launcher.eveonline.com
		echo 127.0.0.1  resources.eveonline.com
		echo 127.0.0.1  binaries.eveonline.com
		echo 然后再次运行此脚本
		pause
		exit
		)
		)else if "!option!"=="3" (
		netsh interface portproxy delete v4tov4 listenport=26000 listenaddress=127.0.0.1
		netsh interface portproxy delete v4tov4 listenport=443 listenaddress=127.0.0.1
		echo **************************************
		echo 恢复完成，请自行删除hosts的内容
		echo 当前Windows端口转发状态.
		echo 没显示即恢复成功
		netsh interface portproxy show all
		echo **************************************
		pause
		exit
		) else (
		echo 输入无效请重新执行脚本.
		pause
		exit
		)	
		
exit














