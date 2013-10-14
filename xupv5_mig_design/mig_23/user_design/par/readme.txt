This folder has the batch files to synthesize using the XST or Synplify Pro and implement the design through command mode or GUI mode.

Steps to run the design using the ise flow (batch mode):

1. Double clicking the "ise_flow.bat" file synthesizes the design using XST or Synplify Pro and does the implementation of design.

2. Running the "ise_flow.bat" file creates the ise_flow_results text file. It has the report file data for all the XST tool processes.

Steps to run the design using the create_ise (GUI mode - for XST cases only):

1. This file will appear for XST cases only.

2. Double clicking the "create_ise.bat" file creates "test.ise" project file and set all the properties of the design selected.

3. Once the "test.ise" project file is created, you can open the project file and do synthesis and implementation.

Other files in PAR folder :

* "ddr2_sdram.ucf" file is the constraint file for the design. This is used by ISE tool during translate phase.
  It has clock constraints, location constraints, IO standards and Area group constraints if any.

* "xst_run.txt" file has synthesis options for the XST tool. This file is used for batch mode.

* "set_ise_props.txt" file has all the properties that needs to be set in GUI mode. This file will appear only for XST cases.

* "mem_interface_top.ut" file has the options for the Configuration file generation i.e. the "ddr2_sdram.bit" file to run in batch mode.

* "icon4_cg.xco", "vio_async_in96_cg.xco", "vio_async_in100_cg.xco", "vio_async_in192_cg.xco" and "vio_sync_out32_cg.xco" files 
  are used to generate chipscope ila and icon EDIF/NGC files.
  view the design signals on chipscope, you should port the design signals to chipscope modules i.e., ila and icon
  and set DEBUG_EN parameter to 1 in ddr2_sdram rtl file. In order to generate the EDIF/NGC files, you must execute
  the following commands before starting systhesis and PAR.

        coregen -b icon4_cg.xco
        coregen -b vio_async_in96_cg.xco
        coregen -b vio_async_in100_cg.xco
        coregen -b vio_async_in192_cg.xco
        coregen -b vio_sync_out32_cg.xco

Synth folder:

* Synth folder has the constraint file for Synplify Pro designs i.e. the "mem_interface_top_synp.sdc" file, "ddr2_sdram.prj" file which has the design files to be added to the project, "script_synp.tcl" file that sets the synthesis options and 
"ddr2_sdram.lso" file which is a custom library search order file for XST synthesis.

compatible_ucf folder:

* MIG outputs this folder only when Pin Compatible FPGAs are checked in GUI (Pin Compatible FPGAs page in GUI). It generates the UCF files for the all the Compatible FPGAs selected in GUI. If you want to switch to any of the Compatible FPGAs follow the steps mentioned below.

* For example, the design is generated with component name as mig_22 with Target FPGA LX50t-FF1136 and Compatible FPGA LX85t-FF1136.

   - Change the FPGA name to LX85t-FF1136 from LX50t-FF1136 in ise_flow.bat, create_ise.bat and xst_run.txt, set_ise_prop.txt in par folder and .tcl file in synth folder.
   - Paste the xc5vlx85t_ff1136.ucf file in par folder.
   - Change the UCF file name in batch file to the one in compatible_ucf folder i.e., change the UCF name (ddr2_sdram.ucf) in ise_flow.bat and create_ise.bat file to xc5vlx85t_ff1136.ucf.

Note : When you generate the design usign DEBUG_EN option, the above mentioned chipscope coregen commands are printed
       into ise_flow.bat and create_ise.bat files. The ddr2_sdram rtl file will have the design debug signals portmapped
       to ila and icon chipscope modules.
