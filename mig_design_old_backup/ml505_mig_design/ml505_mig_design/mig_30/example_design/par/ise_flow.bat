call rem_files.bat

:: Following coregen commands to be uncommented  when the parameter DEBUG_EN is changed from 0 to 1 in ddr2_sdram.v/.vhd file.
::coregen -b icon4_cg.xco
::coregen -b vio_async_in96_cg.xco
::coregen -b vio_async_in192_cg.xco
::coregen -b vio_sync_out32_cg.xco
::coregen -b vio_async_in100_cg.xco

::del *.ncf
echo Synthesis Tool: XST

mkdir "../synth/__projnav" > ise_flow_results.txt
mkdir "../synth/xst" >> ise_flow_results.txt
mkdir "../synth/xst/work" >> ise_flow_results.txt

xst -ifn xst_run.txt -ofn mem_interface_top.syr -intstyle ise >> ise_flow_results.txt
ngdbuild -intstyle ise -dd ../synth/_ngo -nt timestamp -uc mig_30.ucf -p xc5vlx50tff1136-1 mig_30.ngc mig_30.ngd >> ise_flow_results.txt

map -intstyle ise -detail -w -logic_opt off -ol high -xe n -t 1 -cm area -o mig_30_map.ncd mig_30.ngd mig_30.pcf >> ise_flow_results.txt
par -w -intstyle ise -ol high -xe n -t 1 mig_30_map.ncd mig_30.ncd mig_30.pcf >> ise_flow_results.txt
trce -e 3 -xml mig_30 mig_30.ncd -o mig_30.twr mig_30.pcf >> ise_flow_results.txt
bitgen -intstyle ise -f mem_interface_top.ut mig_30.ncd >> ise_flow_results.txt

echo done!
