wget -O ng.sh #!/bin/bash
stty intr ""
stty quit ""
stty susp undef

clear
rm -rf ngrok ngrok.zip ng.sh > /dev/null 2>&1
echo "======================="
echo "Downloading ngrok..."
echo "======================="
wget -O ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok.zip > /dev/null 2>&1 > /dev/null 2>&1
chmod +x ng.sh
./ng.sh


function goto
{
    label=$1
    cd 
    cmd=$(sed -n "/^:[[:blank:]][[:blank:]]*${label}/{:a;n;p;ba};" $0 | 
          grep -v ':$')
    eval "$cmd"
    exit
}

: ngrok
clear
echo "Go to: https://dashboard.ngrok.com/get-started/your-authtoken"
read -p "Paste Ngrok Authtoken: " CRP
./ngrok authtoken $CRP 

clear
echo "Tutorial: https://youtu.be/FblFJWodUoY"
echo "======================="
echo "choose ngrok region (for better connection)."
echo "======================="
echo "us - United States (south carolina)"
echo "eu - Europe (Belgium)"
read -p "choose ngrok region: " CRP
./ngrok tcp --region $CRP 4000 &>/dev/null &
sleep 1
if curl --silent --show-error http://127.0.0.1:4040/api/tunnels  > /dev/null 2>&1; then echo OK; else echo "Ngrok Error! Please try again!" && sleep 1 && goto ngrok; fi
docker run --rm -d --network host --privileged --name nomachine-xfce5 -e PASSWORD=123456 -e USER=user --cap-add=SYS_PTRACE --shm-size=1g thuonghai2711/nomachine-ubuntu-desktop:windows10
clear
echo "NoMachine: https://www.nomachine.com/download"
echo Done! NoMachine Information:
echo IP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p' 
echo User: user
echo Passwd: 123456
echo "VM can't connect? Restart Cloud Shell then Re-run script."
seq 1 1200 | while read i; do echo -en "\r Running .     $i s /1200 s";sleep 0.1;echo -en "\r Running ..    $i s /1200 s";sleep 0.1;echo -en "\r Running ...   $i s /1200 s";sleep 0.1;echo -en "\r Running ....  $i s /1200 s";sleep 0.1;echo -en "\r Running ..... $i s /1200 s";sleep 0.1;echo -en "\r Running     . $i s /1200 s";sleep 0.1;echo -en "\r Running  .... $i s /1200 s";sleep 0.1;echo -en "\r Running   ... $i s /1200 s";sleep 0.1;echo -en "\r Running    .. $i s /1200 s";sleep 0.1;echo -en "\r Running     . $i s /1200 s";sleep 0.1; done
