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
echo �������wnark.com���ؽű�
echo ʹ��������Դ���ؽ���������ľ��
echo ���ˣ��ǵô�����������IPv6֧��
start ipv6.png
echo �������㡰�Ż����Ļ�Ĭ�϶��Ǵ򿪵�
echo �����Ŀ��԰ٶ��ѣ�����IPv6֧��
pause
echo �����ipv6.png���Զ��򿪵��Ǹ�ͼƬ�������û��Զ�ɾ��
echo ���û���Զ�ɾ���Ļ�
echo �鷳�������������Ǹ�ipv6.png�ļ��ֶ�ɾ��лл��
pause
echo 360ɶ�Ļ���ʾ����ű��޸�����ɶ��
echo ���������
pause
echo ���ڰ�ȫ�����ԭ�����ֶ��޸�hosts�ļ�
echo hostsλ�ã�C:\Windows\System32\drivers\etc
echo **************************************
echo ���������Ϸ����������hosts������
echo 127.0.0.1 tranquility.servers.eveonline.com
echo **************************************
echo �����������������hosts������
echo 127.0.0.1  launcher.eveonline.com
echo 127.0.0.1  resources.eveonline.com
echo 127.0.0.1  binaries.eveonline.com
echo **************************************
echo �޸�hosts��ʱ���ùرմ˽ű�
echo �޸���ɺ�ִ����һ��
pause
echo ���iphlpsvc�����Ƿ�������
for /f "skip=3 tokens=4" %%n in ('sc query iphlpsvc') do set "zt=%%n" &goto :next
:next
if /i "%zt%"=="STOPPED" (goto 1)
if /i "%zt%"=="RUNNING" (goto 2)
:1
	echo iphlpsvc�������ڴ���ֹͣ״̬,����������
	sc config iphlpsvc start= auto
	net start iphlpsvc
	echo ������ɺ������������ٴ�ִ�нű�
	pause
exit

:2
	echo iphlpsvc���������У����ڽ�����һ��
	pause
	echo ���hosts��������,���Ե�
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

		echo ��ѡ���������
		echo **************************************
		echo 1.������Ϸ������
		echo 2.����������
		echo 3.�ָ�ԭ״
		echo **************************************
		set /p option=���������ѡ��:
		if "!option!"=="1" (
		echo ��ʼ������Ϸ������
		echo ���hosts�Ƿ���ȷ
		echo tranquility.servers.eveonline.com��ip��%serverip%
		pause
		if "%serverip%"=="127.0.0.1" (
		echo hosts������ȷ
		pause
		netsh interface portproxy add v4tov4 listenport=26000 listenaddress=127.0.0.1 connectport=33389 connectaddress=129.146.46.7.ipssh.net
		echo �������
		echo **************************************
		echo ��ǰWindows�˿�ת��״̬.
		echo û��ʾ������ʧ��
		echo ����ʧ���븽�ϴ˴���ͼ��Ⱥ��797474927ѯ��
		netsh interface portproxy show all
		netstat -ano | findstr :26000
		echo **************************************
		pause
		exit
		) else (
		echo hostsû��ȷ�޸ģ�������
		echo 127.0.0.1 tranquility.servers.eveonline.com
		echo Ȼ���ٴ����д˽ű�
		pause
		exit
		)
		)else if "!option!"=="2" (
		echo ��ʼ����������
		echo ���hosts�Ƿ���ȷ
		echo launcher.eveonline.com��ip��%launcherip%
		echo resources.eveonline.com��ip��%resourcesip%
		echo binaries.eveonline.com��ip��%binariesip%
		pause
		if "%launcherip%+%launcherip%+%binariesip%"=="127.0.0.1+127.0.0.1+127.0.0.1" (
		echo hosts������ȷ
		pause
		netsh interface portproxy add v4tov4 listenport=443 listenaddress=127.0.0.1 connectport=47068 connectaddress=idc.cubepaas.com
		echo �������
		echo **************************************
		echo ��ǰWindows�˿�ת��״̬.
		echo û��ʾ������ʧ��
		echo ����ʧ���븽�ϴ˴���ͼ��Ⱥ��797474927ѯ��
		netsh interface portproxy show all
		netstat -ano | findstr :443
		echo **************************************
		pause
		exit
		) else (
		echo hostsû��ȷ�޸ģ�������
		echo 127.0.0.1  launcher.eveonline.com
		echo 127.0.0.1  resources.eveonline.com
		echo 127.0.0.1  binaries.eveonline.com
		echo Ȼ���ٴ����д˽ű�
		pause
		exit
		)
		)else if "!option!"=="3" (
		netsh interface portproxy delete v4tov4 listenport=26000 listenaddress=127.0.0.1
		netsh interface portproxy delete v4tov4 listenport=443 listenaddress=127.0.0.1
		echo **************************************
		echo �ָ���ɣ�������ɾ��hosts������
		echo ��ǰWindows�˿�ת��״̬.
		echo û��ʾ���ָ��ɹ�
		netsh interface portproxy show all
		echo **************************************
		pause
		exit
		) else (
		echo ������Ч������ִ�нű�.
		pause
		exit
		)	
		
exit














