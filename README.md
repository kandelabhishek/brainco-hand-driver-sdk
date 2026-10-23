# 🤖 BrainCo Hand on Unitree G1 — Easy Setup Guide
---

| Without the driver ❌ | With the driver ✅ |
|---|---|
| Hand shows up as `/dev/ttyACM0` | Hand shows up as `/dev/ttyCH343USB0` |
| Hand does **not** respond | Hand works |

---

## 1.clone the sdk

```bash
git clone https://github.com/kandelabhishek/brainco-hand-driver-sdk.git
```
---

## 2.Build the USB driver

```bash
ls ~/brainco-hand-driver-sdk/tools/ch343ser_linux/driver
cd ~/brainco-hand-driver-sdk/tools/ch343ser_linux/driver
make
```

If you dont have gcc /if it shows that its missing

```
sudo apt update && sudo apt install build-essential -y
```


---

### 3.build it

```bash
sudo make load
sudo make install
```

### Restart the g1

### 3.1 Check if it worked

```bash
ls /dev/ttyCH343USB*
```

✅ You should see:

```
/dev/ttyCH343USB0  /dev/ttyCH343USB1  /dev/ttyCH343USB2
```

> `USB0` and `USB1` are the hands. `USB2` is something else on the robot — ignore it.
>If you cant see the abouve output then restart the robot
---

---

## Step 5 — Build the program

```bash
cd ~/brainco-hand-driver-sdk/
./download-lib.sh
cd ~/brainco-hand-driver-sdk/c/
make clean
make
```
---

## Step 6 — Find which port is which hand

Usually:

| Hand | Port | ID |
|---|---|---|
| Left Hand | `/dev/ttyCH343USB0` | `126` |
| Right Hand| `/dev/ttyCH343USB1` | `127` |

---

## Step 7 — Move the hand 

### Basic command

```bash
sudo ./hand_demo.exe -m <PORT> 460800 <ID> <DEMO>
```

### Most useful commands

```bash
# Left hand
sudo ./hand_demo.exe -m /dev/ttyCH343USB0 460800 126 0

# Right hand 
sudo ./hand_demo.exe -m /dev/ttyCH343USB1 460800 127 0

```

### Demo list

| Number | What happens |
|---|---|
| *(nothing)* | Runs all demos |
| `1` | Make a fist, open hand, move one finger |
| `2` | Speed and force control |
| `3` | Advanced movements |
| `4` | Built-in gestures (fist, pinch, point…) |
| `5` | Show hand info (no movement) |
| `6` | Read touch sensors |
| `7` | **Open/close loop forever** |


## 🛠️ Problems & Fixes

| You see this | Do this |
|---|---|
| Only `/dev/ttyACM0`, no `ttyCH343USB` | Driver not active → redo **Step 3**, then unplug/replug |
| `timeout` / `Failed to get device info` | Wrong ID → swap `126` ↔ `127` |
| `Failed to open Modbus port` | Wrong port, or you're on your **laptop** not the G1 (check prompt says `unitree@`) |
| `skipping incompatible libbc_stark_sdk.so` | Re-copy the full SDK from laptop (**Step 1**) |
| `auto_detect.exe: No such file` | Build failed → redo **Step 5** and read the error |
| `Failed to create log file: Permission denied` | Run with `sudo` |
| `make` fails in Step 3.1 | Kernel headers missing → ask Unitree for L4T headers |
| Hand LED is off | Turn on the robot fully; check the cable |

---



## easy mode(all-in-one script)

If the driver folder is already in `tools/` :

```bash
cd ~/brainco-hand-sdk
./tools/setup_g1_hand.sh
```
Then unplug/replug the hand, log out/in, and jump to **Step 6**.

#you can download the driver seperately from the link below

```bash
cd ~/brainco-hand-driver-sdk/tools
git clone https://github.com/WCHSoftGroup/ch343ser_linux.git

cd ch343ser_linux/driver
make
```


