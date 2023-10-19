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






