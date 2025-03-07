#!/bin/bash
#
# AWS流量阈值脚本
#
# Copyright (c) 2020.





# Detect Debian users running the script with "sh" instead of bash
if readlink /proc/$$/exe | grep -q "Bash"; then
	echo "该脚本需要使用bash而不是sh运行"
	exit
fi

if [[ "$EUID" -ne 0 ]]; then
	echo "对不起你需要使用ROOT权限运行该脚本"
	exit
fi
beikong0_chushihua(){
    	echo "开始安装依赖"
		echo "安装依赖"
		yum install wget -y
		yum install epel-release -y
		yum install wget vnstat -y
		apt-get install wget -y
		apt-get install epel-release -y
		apt-get install vnstat -y
		service vnstat start
		vnstat --create -i eth0
		chkconfig vnstat on
		vnstat -u -i eth0
		mkdir /root/.awsll/
		wget https://raw.githubusercontent.com/reno1314/yppro/main/vnstat.sh -O /root/.awsll/vnstat.sh
		chmod +x /root/.awsll/vnstat.sh
		wget https://raw.githubusercontent.com/reno1314/yppro/main/serviceoff.sh -O /root/.awsll/serviceoff.sh
		chmod +x /root/.awsll/serviceoff.sh
		wget https://raw.githubusercontent.com/reno1314/yppro/main/serviceon.sh -O /root/.awsll/serviceon.sh
		chmod +x /root/.awsll/serviceon.sh
		
	read -p "是否下载300G版本脚本[y/N]" down_files_1
	if [[ "$down_files_1" =~ ^[yY]$ ]]; then
		echo "正在下载300G版脚本"
		wget https://raw.githubusercontent.com/reno1314/yppro/main/300.py -O /root/.awsll/300.py
		chmod +x /root/.awsll/300.py
		nohup python /root/.awsll/300.py >> /dev/null 2>&1 &
		
	fi
	echo "正在添加定时任务"
	crontab -l > "$file_1/crontab.bak"
    sed -i "/vnstat -u -i eth0/d" "$file_1/crontab.bak"
    sed -i "/vnstat.sh/d" "$file_1/crontab.bak"
    echo -e "\n*/1 * * * *  /usr/bin$file_1/vnstat -u -i eth0" >> "$file_1/crontab.bak"
    echo -e "\n0 12 1 * *  /root/.awsll$file_1/vnstat.sh" >> "$file_1/crontab.bak"
    crontab "$file_1/crontab.bak"
    rm -r "$file_1/crontab.bak"
    cron_config=$(crontab -l | grep "vnstat -u -i eth0")
    cron_config=$(crontab -l | grep "vnstat.sh")
	wget https://raw.githubusercontent.com/reno1314/yppro/main/ds.txt -O /root/.awsll/ds.txt
	crontab /root/.awsll/ds.txt
    echo "正在添加自启任务"
    wget https://raw.githubusercontent.com/reno1314/yppro/main/300-zq.sh -O /root/.awsll/300-zq.sh
    chmod +x /root/.awsll/300-zq.sh
	chmod +x /etc/rc.d/rc.local
	echo "/root/.awsll/300-zq.sh >/root/.awsll/300.py.log 2>&1" >> /etc/rc.d/rc.local
	echo "正在下载管理脚本"
    curl -o /usr/bin/yp -Ls https://raw.githubusercontent.com/reno1314/yppro/main/ll.sh
	chmod +x /usr/bin/yp
    echo "安装完成，请输入 yp 管理流量统计"
	
}
beikong1_chushihua(){
    echo "开始安装依赖"
		echo "安装依赖"
		yum install wget -y
		yum install epel-release -y
		yum install wget vnstat -y
		apt-get install wget -y
		apt-get install epel-release -y
		apt-get install vnstat -y
		service vnstat start
		vnstat --create -i eth0
		chkconfig vnstat on
		vnstat -u -i eth0
		mkdir /root/.awsll/
		wget https://raw.githubusercontent.com/reno1314/yppro/main/vnstat.sh -O /root/.awsll/vnstat.sh
		chmod +x /root/.awsll/vnstat.sh
		wget https://raw.githubusercontent.com/reno1314/yppro/main/serviceoff.sh -O /root/.awsll/serviceoff.sh
		chmod +x /root/.awsll/serviceoff.sh
		wget https://raw.githubusercontent.com/reno1314/yppro/main/serviceon.sh -O /root/.awsll/serviceon.sh
		chmod +x /root/.awsll/serviceon.sh

	read -p "是否下载1T版本脚本[y/N]" down_files_1
	if [[ "$down_files_1" =~ ^[yY]$ ]]; then
		echo "正在下载1T版脚本"
		wget https://raw.githubusercontent.com/reno1314/yppro/main/1024.py -O /root/.awsll/1024.py
		chmod +x /root/.awsll/1024.py
		nohup python /root/.awsll/1024.py >> /dev/null 2>&1 &
		
	fi
	echo "正在添加定时任务"
	crontab -l > "$file_1/crontab.bak"
    sed -i "/vnstat -u -i eth0/d" "$file_1/crontab.bak"
    sed -i "/vnstat.sh/d" "$file_1/crontab.bak"
    echo -e "\n*/1 * * * *  /usr/bin$file_1/vnstat -u -i eth0" >> "$file_1/crontab.bak"
    echo -e "\n0 12 1 * *  /root/.awsll$file_1/vnstat.sh" >> "$file_1/crontab.bak"
    crontab "$file_1/crontab.bak"
    rm -r "$file_1/crontab.bak"
    cron_config=$(crontab -l | grep "vnstat -u -i eth0")
    cron_config=$(crontab -l | grep "vnstat.sh")
	wget https://raw.githubusercontent.com/reno1314/yppro/main/ds.txt -O /root/.awsll/ds.txt
	crontab /root/.awsll/ds.txt
    echo "正在添加自启任务"
    wget https://raw.githubusercontent.com/reno1314/yppro/main/1024-zq.sh -O /root/.awsll/1024-zq.sh
    chmod +x /root/.awsll/1024-zq.sh
	chmod +x /etc/rc.d/rc.local
	echo "/root/.awsll/1024-zq.sh >/root/.awsll/1024.py.log 2>&1" >> /etc/rc.d/rc.local
	echo "正在下载管理脚本"
    curl -o /usr/bin/yp -Ls https://raw.githubusercontent.com/reno1314/yppro/main/ll.sh
	chmod +x /usr/bin/yp
    echo "安装完成，请输入 yp 管理流量统计"
}
beikong2_chushihua(){
    echo "开始安装依赖"
		echo "安装依赖"
		yum install wget -y
		yum install epel-release -y
		yum install wget vnstat -y
		apt-get install wget -y
		apt-get install epel-release -y
		apt-get install vnstat -y
		service vnstat start
		vnstat --create -i eth0
		chkconfig vnstat on
		vnstat -u -i eth0
		mkdir /root/.awsll/
		wget https://raw.githubusercontent.com/reno1314/yppro/main/vnstat.sh -O /root/.awsll/vnstat.sh
		chmod +x /root/.awsll/vnstat.sh
		wget https://raw.githubusercontent.com/reno1314/yppro/main/serviceoff.sh -O /root/.awsll/serviceoff.sh
		chmod +x /root/.awsll/serviceoff.sh
		wget https://raw.githubusercontent.com/reno1314/yppro/main/serviceon.sh -O /root/.awsll/serviceon.sh
		chmod +x /root/.awsll/serviceon.sh

	read -p "是否下载5G版本脚本[y/N]" down_files_1
	if [[ "$down_files_1" =~ ^[yY]$ ]]; then
		echo "正在下载5G版脚本"
		wget https://raw.githubusercontent.com/reno1314/yppro/main/aws5.py -O /root/.awsll/aws5.py
		chmod +x /root/.awsll/aws5.py
		nohup python /root/.awsll/aws5.py >> /dev/null 2>&1 &
		
	fi
	echo "正在添加定时任务"
	crontab -l > "$file_1/crontab.bak"
    sed -i "/vnstat -u -i eth0/d" "$file_1/crontab.bak"
    sed -i "/vnstat.sh/d" "$file_1/crontab.bak"
    echo -e "\n*/1 * * * *  /usr/bin$file_1/vnstat -u -i eth0" >> "$file_1/crontab.bak"
    echo -e "\n0 12 1 * *  /root/.awsll$file_1/vnstat.sh" >> "$file_1/crontab.bak"
    crontab "$file_1/crontab.bak"
    rm -r "$file_1/crontab.bak"
    cron_config=$(crontab -l | grep "vnstat -u -i eth0")
    cron_config=$(crontab -l | grep "vnstat.sh")
    echo "正在添加自启任务"
    wget https://raw.githubusercontent.com/reno1314/yppro/main/aws5-zq.sh -O /root/.awsll/aws5-zq.sh
    chmod +x /root/.awsll/aws5-zq.sh
	chmod +x /etc/rc.d/rc.local
	echo "/root/.awsll/aws5-zq.sh >/root/.awsll/aws5.py.log 2>&1" >> /etc/rc.d/rc.local
	echo "正在下载管理脚本"
    curl -o /usr/bin/aws -Ls https://raw.githubusercontent.com/reno1314/yppro/main/ll.sh
	chmod +x /user/bin/yp
    echo "安装完成，请输入 yp 管理流量统计"
}
echo && echo -e " 月抛流量服务管理脚本，达量停止服务，次日自动开启服务。

 ${Green_font_prefix}1.${Font_color_suffix} 300G版(300G单向统计)
 ${Green_font_prefix}2.${Font_color_suffix} 1024G版(1024G单向统计)
 ${Green_font_prefix}3.${Font_color_suffix} 5G版(5G双向统计仅做测试)" && echo
stty erase '^H' && read -p " 请输入数字 [1-2]:" num
case "$num" in
	1)
	beikong0_chushihua
	;;
	2)
	beikong1_chushihua
	;;
	3)
	beikong2_chushihua
	;;
	
	*)
	echo "请输入正确数字 [1-2]"
	;;
esac
