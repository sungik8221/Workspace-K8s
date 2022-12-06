# ubuntu:22.04 Dockerfile auto script
#
# 2022-11-04 Writed

(apt-get update && apt-get upgrade -y) > /dev/null # OS UPDATE
(apt-get install openssh-server iputils-ping iproute2 net-tools lsof sudo vim -y) > /dev/null # Install essential utility
(sed -i -E 's/^(#?)PermitRootLogin.*/PermitRootLogin Yes/gm' /etc/ssh/sshd_config) || echo "Failed to modify sshd_config" # Allow direct login with root
/etc/init.d/ssh start || echo "SSH service failed to run" # SSH Service Start
PASSWORD='dsm1234' || exit 1 # Define SSH Conn Password
(echo root:$PASSWORD | chpasswd) # Warning : Please add the privileged option to container run command execution argument

# Environment
IP_ADDRESS=`grep $(hostname) /etc/hosts | awk '{print $1}'` || exit 1 # Conn IP
PORT=`lsof -nPi4 | grep LISTEN | grep sshd | awk '{print $9}' | cut -d ':' -f2` || exit 1 # 22

# echo Manual (No Description)

echo "Ubuntu SSH Server Started"
echo "SSH server connection IP : $IP_ADDRESS:$PORT" 
echo "usage: ssh root@$IP_ADDRESS"
echo "password : dsm1234"
rm -rf /TempFolder/auto.sh

tail -f /dev/null # It doesn't turn off
