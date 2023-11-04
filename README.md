# PES_ADD_SUB_32

A 32 bit parallel prefix adder_subtractor

The adder Implemented here is a Ladner-Fischer adder that provides the output with very less delay when compared to traditional adders as we compute the carry before adding the numbers.
The mechanism used to calculate carry and sum are using
- generate
- propogate

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/725c09cc-ea87-4e33-a979-45f92505ef5a)

The black box, grey box are defined inside the design file

# Implementation
 
<details>
  <summary>Project Objectives</summary>
  <br>

- Low Delay
- Low Area

Both when compared to other types of parallel prefix adders such as kogge-stone adder, Brent-Kung adder.
  
</details>


<details>
<summary>Synthesis</summary>
<br>

```
yosys
read_liberty -lib <path to your lib file>
read_verilog pes_add_sub_32.v
synth -top PES_ADD_SUB_32
dfflibmap -liberty
abc -liberty
flatten
show
write_verilog PES_ADD_SUB_MAPPED.v
```

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/e12cb42f-a8e9-4618-9af8-b4709ceb6575)

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/66f3e6f6-9a24-4aca-93f2-ae8df36fcc66)

</details>

<details>
<summary>Gate Level Simulation</summary>
<br>

## Pre-synthesis Simulation

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/f5888a7b-e1c1-4920-ad6e-35fea94be13d)

![PES_ADD_SUB_TB_FINAL](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/06aaf1fc-e40e-409a-a54d-245b2cf833a2)

## Post-synthesis Simulation

![PES_ADD_SUB_MAPPED_FINAL](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/70dfd072-873b-410a-a2a4-aa374f40ec20)

</details>

# RTL2GDSII - OPENLANE

### Installing Openlane

The original Documentation can be found here [OpenLane Installation](https://openlane.readthedocs.io/en/latest/getting_started/installation/installation_ubuntu.html)

#### Installing the pre-requisites
```
sudo apt-get update
sudo apt-get upgrade
sudo apt install -y build-essential python3 python3-venv python3-pip make git
```

#### Uninstall conflicting packages of docker if present

```
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

```

#### Install Docker using ```apt``` repository

1. Setup Docker's ```apt``` repository

```
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

2. Install other packages

```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

3. Verify that the Docker Engine installation is successful by running the ```hello-world``` image.

```
sudo docker run hello-world
```

A successfull installation would look like
```
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
1. The Docker client contacted the Docker daemon.
2. The Docker daemon pulled the "hello-world" image from the Docker Hub. (amd64)
3. The Docker daemon created a new container from that image which runs the executable that produces the output you are currently reading.
4. The Docker daemon streamed that output to the Docker client, which sent it to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
$ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
https://hub.docker.com/

For more examples and ideas, visit:
https://docs.docker.com/get-started/
```

5. Making Docker available without root (Linux)

```
sudo groupadd docker
sudo usermod -aG docker $USER
sudo reboot # REBOOT!
```

6. Checking the docker installation after reboot

```
# After reboot
docker run hello-world
```

You will get a little happy message of Hello world, once again, but this time without root.

```
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
1. The Docker client contacted the Docker daemon.
2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
   (amd64)
3. The Docker daemon created a new container from that image which runs the
   executable that produces the output you are currently reading.
4. The Docker daemon streamed that output to the Docker client, which sent it
   to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
$ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
https://hub.docker.com/

For more examples and ideas, visit:
https://docs.docker.com/get-started/
```

### Checking Installation Requirements

```
git --version
docker --version
python3 --version
python3 -m pip --version
make --version
python3 -m venv -h
```

Successful output will look like this:

```
git --version
docker --version
python3 --version
python3 -m pip --version
make --version
python3 -m venv -h
git version 2.36.1
Docker version 20.10.16, build aa7e414fdc
Python 3.10.5
pip 21.0 from /usr/lib/python3.10/site-packages/pip (python 3.10)
GNU Make 4.3
Built for x86_64-pc-linux-gnu
Copyright (C) 1988-2020 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
usage: venv [-h] [--system-site-packages] [--symlinks | --copies] [--clear]
            [--upgrade] [--without-pip] [--prompt PROMPT] [--upgrade-deps]
            ENV_DIR [ENV_DIR ...]

Creates virtual Python environments in one or more target directories.
...
Once an environment has been created, you may wish to activate it, e.g. by
sourcing an activate script in its bin directory.
```

### Download and Install Openlane

Run these one after the other

```
git clone --depth 1 https://github.com/The-OpenROAD-Project/OpenLane.git
cd OpenLane/
make
make test
```

Successful test will output the following line:

```
Basic test passed
```

### Into The Workshop

Before starting the workshop, I would strongly suggest you to go through all the [Flow Configuration Variables](https://openlane.readthedocs.io/en/latest/reference/configuration.html), understand what they do and why they are required. This Will help reach the goal faster.

## Creating design folder through openlane

To create a design folder with a default config.json file, follow the below command

```
cd
cd OpenLane
make mount
./flow.tcl -design <YOUR_DESIGN_NAME_HERE> -init_design_config
```
![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/4841da88-f12c-4c20-85dc-aced9be0628f)

The difference can be observed that openlane directory is created when you run this command for the first time where all your designs will be saved

In a new tab,

```
cd ~/OpenLane/openlane/<YOUR_DESIGN>
mkdir src
cd src
gedit <DESIGN_NAME>.v
```

write verilog code for your design or paste it and save it

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/1e89ef6f-7cfc-414f-86fb-42fb6d5689a5)

The default config.json provided by openlane looks like this, add the path to the verilog file for the field VERILOG_FILES

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/137a7f34-8a8a-4931-9c06-ce17c7e94ac2)

To complete the json file for a basic run, ie., with default flow configuration variables, add the path to verilog file ```dir::src/<DESIGN_NAME>.v```

The config.json should look similar to this

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/ef672783-e069-42d7-873e-ce518191b6b4)

Now We are ready to go

## Running a basic automated flow

- The errors encountered here helps to find the variables to be set in the ```config.json``` file inorder to resolve the error.
- The warning messages also gives an info of what extra variables to be defined in the json file
- By end of this automated flow without any error or flow related warnings after some iterations, You will have a proper populated config.json file
- This json file can be used to go on with interactive flow where you can change the variables in between the flow if required

The command to run the automated flow is 

```
./flow.tcl -design openlane/<YOUR_DESIGN_FLODER_NAME> -tag <ANY_NAME_FOR_EACH_RUN>
```

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/bfb8e29a-6173-4c32-b80d-002f2bbbf311)

Here we can observe a warning saying that the core area is too small and it set an area by itself. But we can specify the area by including the corresponding variable in the json file.

Some of the conditions for the design to work properly

- slack after synthesis should be as small as possible and a very small negative value such as -0.1 or below should be ok as after routing stage, the delay gets added and slack becomes positive
- if the design is core, then you may proceed with assigning more core utilisation upto 75%
- Make sure about the synthesis strategy

##### INFO

- The default variables that are used to run the deisgn can be viewed at ```OpenLane/openlane/runs/<SPECIFIC_RUN_FOLDER>/config.tcl```
- Once go through all the default values, paths etc used and decide on what to change for next run for the design to make it better
- The results regarding the slack can be found at ```OpenLane/openlane/runs/<SPECIFIC_RUN_FOLDER>/reports/synthesis```
 - AREA stat rpt has the statistics related to design area and cells used in synthesis
 - sta summary has the slack details
- The results related to die area and core area can be obtained at ```OpenLane/openlane/runs/<SPECIFIC_RUN_FOLDER>/reports/floorplan```
 - core area file has the co-ordinates of the core ```(x0 y0 x1 y1)``` bottom left corner, top right corner co ordinates
 - Die area file has the co-ordinates of Die
 - Module area in the synthesis folder observed will almost be half of the core area (x1-x0 * y1-y0). This is because the default core utilisation is 50%
 - Make it less by changing the co-ordinates of core area using the corresponding variable with a utilisation percent in target
 - core util = module area / core area

 Similarly explore all the other folders inside the <SPECIFIC_RUN_FOLDER>.

### Config.json

Once all the above suggestions are followed, the config.json for my file looks something like this but you may have different variables according to your design

- The cap load can be seen at the input pin of the driving cell defined in the library corresponding to ```LIB_SYNTH_COMPLETE```

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/f9a7056e-ddef-46e9-8f42-e2b5608cf01c)

## Interactive flow 

The variables that can be changed for particular step of interactive flow can be found at ```OpenLane/configuratons``` in the form of <STAGE>.tcl

1. **Initiate the interactive flow** - ```./flow.tcl -interactive```
2. **prepare the design for the flow** - ```prep -design openlane/<DESIGN_FOLDER_NAME> -tag <RUN_NAME>```

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/24ccd73b-1d6e-42f1-9b36-230e31a0a731)

3. **Run Synthesis** - ```run_synthesis```

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/7b5e4a74-773f-4be4-91df-128e37d45a6c)

- The area statistics results can be found at ```results/synthesis```
- The static timing analysis (slack) results can be seen at the bottom of ```logs/synthesis/2-sta.summary.rpt```

### NOTE

1. ##### If the slack is highly negative -0.1, -0.05, 0 etc proceed to next steps from run_floorplan
2. ##### If the slack is just positive, then continue with next steps from run_floorplan
3. ##### If the slack is higly positive, Greater than 2 then you have a scope to decrease the clock period and run again so that freqency increases.
4. ##### If the slack is -0.4 , 0.5 or lower, then increase the clock period
5. ##### If the slack is -0.4 to 0 then instead of directly increasing the clock period, try some OpenSTA optimisations so that we get positive slack at same frequency.

Here We have 2 ways to go
1. OpenSTA
2. Proceed with further flow from run_floorplan

### OpenSTA

We here do pre-STA analsysis where we 
- replace the cells that have more fanout to a cell with cell fanout
- replace the cell contributing to more delay with a cell that decreases it by a larger verion of it with same functionality
- check the slack for every action taken
- stop the process once the slack is either point 1 or 2 under the NOTE
- replace the synthesized verilog file with the sta operated verilog file
- proceed with main floe from run_floorplan

The process requires 
- OpenSTA - ```sudo apt install opensta```
- a config file for sta
- a base.sdc file that defines the constraints

#### Config file for STA

- create a file pre_sta.conf in ```OpenLane/openlane``` with the content

```
set_cmd_units -time ns -capacitance pF -current mA -voltage V -resistance kOhm -distance um
read_liberty -max /home/yagna/.volare/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_100C_1v60.lib
read_liberty -min /home/yagna/.volare/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ff_n40C_1v95.lib
read_liberty -nom /home/yagna/.volare/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog /home/yagna/OpenLane/openlane/PES_ADD_SUB_32/runs/RUN1_INTER/results/synthesis/PES_ADD_SUB_32.v
link_design PES_ADD_SUB_32
read_sdc /home/yagna/OpenLane/openlane/PES_ADD_SUB_32/src/my_base.sdc
report_checks -path_delay min_max -fields {slew trans net cap input_pin}
report_tns
report_wns
```

- max library is the library corresponding to the path present at ```LIB_SLOWEST``` in the config.tcl file present in the runs/<SPECIFIC_RUN_FOLDER>
- min library is the library corresponding to the path present at ```LIB_FASTEST```
- nom library is the library corresponding to the path present at ```LIB_SYNTH_COMPLETE```
- my_base.sdc to be created in ```src``` folder with the content present at ```OpenLane/scripts/base.sdc``` and set the environment variables mentioned in ```base.sdc```

Comparision between base.sdc and my_base.sdc

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/6eaa41e0-7988-4c7b-bde5-84dafe2f8c4e)

#### OpenSTA Flow

Go to the directory where pre_sta.conf is present and run ```sta pre_sta.conf```

The  Hold slack has met the requirement 

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/b1d41842-6a42-4435-a28c-a467c38d1569)

The setup slack didnt meet the requirement

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/8e6997d0-f43f-420f-aad1-c7ff4922a04e)

##### STEP 1 : Decrease the Fanout - I did it to 4 

To the config.json file, add the line ``` "MAX_FANOUT_CONSTRAINT": 4,``` after the clock period variable and again start interactive flow from start, prepare design and overwrite the run, run_synthesis and then run the sta part

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/60ffa3ed-7012-4d43-9de8-751ef58f1e6a)

Setup slack after this step

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/fcfbf50a-b9ec-45cd-9d69-ba32e41f8083)

##### STEP 2 : Replace cells that infer larger delay

In the above figure we can observe that cell instance **493** is causing the most delay. So we have to replace it with larger version of itself

```report_net -connections _020_``` - instances being driven by net _020_ as in fig

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/45c077ce-62a9-496b-a5e7-af458b2be822)

The instance that's causing highest delay is the cell **493**. So replace it as mentioned and check the result

```
replace_cell _493_ sky130_fd_sc_hd__or2b_4
report_checks -path_delay min_max -fields {slew trans net cap input_pin}
```

repeat this till the slack reaches almost positive value or a minimum positive value

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/b98e9bb6-1771-481f-9f1f-48f3a563d612)

Once the slack is met, since the synthesized netlist has been manually modified, we have to write this out as a veriog file and replace it with the verilog file under ```results/synthesis``` with the same name so that the next steps consider this as the openlane synthesized netlist

```
write_verilog /home/yagna/OpenLane/openlane/PES_ADD_SUB_32/runs/RUN1_INTER/results/synthesis/PES_ADD_SUB_32.v
```

Exit STA and continue with the main Openlane flow

4. **Run Floorplan** - ```run_floorplan```

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/42f1f2d3-684f-4afd-9db6-15d94912e05a)

To view Floorplan in magic
```
cd /home/yagna/OpenLane/openlane/PES_ADD_SUB_32/runs/RUN1_INTER/results/floorplan
magic -T /home/yagna/.volare/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.nom.lef def read PES_ADD_SUB_32.def &
```

change the paths accordingly for the runs and hostname


![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/5a556eb5-c9ff-4bbe-a3ac-68a41498b7af)

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/8b8c4fbb-a4a5-4afd-bb1d-659836c17776)

5. **Run Placement** - ```run_placement```

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/f9182815-adae-4e06-a48e-371b7f979111)

A snipshot of placement 

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/a209e7ca-36fc-4c70-abaf-eebbd484ddfb)

Execute the same magic command as in floorplan stage but this time in ```results/placement``` folder

6. **Run CTS** - ```run_cts```

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/0c1e3d0c-d37a-4a72-a6e5-e09c38c51d06)

- The last 3 commands just shows that we can change the variable values in the interactive mode and continue with the flow
- ```echo``` is to check and ```set``` is to assign

POWER AREA AND TIMING REPORT

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/b8a96868-ebff-4e8c-bd43-8e3a06b03774)


7. **Generate Power Distribution Network** - ```gen_pdn```

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/910ba9ee-7ed5-4104-a6e5-6761bfa1c80f)

8. **Run Routing** - ```run_routing```

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/0119e4b2-ad27-4ad2-a1ac-3e84eef4c3c1)

![image](https://github.com/yagnavivek/PES_ADD_SUB_32/assets/93475824/60acc956-61e7-4bb5-85f7-4995dd499ead)



For further steps follow [interactive mode steps](https://openlane.readthedocs.io/en/latest/reference/interactive_mode.html)


