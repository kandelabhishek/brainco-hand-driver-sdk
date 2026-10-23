### 🛜Steps to connect g1 to wifi

#check all the connections
```
nmcli connection show
```
<img src="images/Screenshot from 2026-09-25 13-39-42.png"  width="500">
# Turn off the hotspot

```
sudo nmcli connection down "Hotspot-Name"

```


#Scan for the wifi
```
nmcli device wifi list
```
<img src="images/wifi_list.png"  width="500">


#connect to the wifi 
```
sudo nmcli device wifi connect {WIFI_NAME} password {PASSWORD}
```

###⚠️Note:The G1 cannot connect to WPA3. So, the wifi must be WPA2. 

