# Following coregen commands to be uncommented  when the parameter DEBUG_EN is changed from 0 to 1 in ddr2_sdram.v/.vhd file.
#coregen -b icon4_cg.xco
#coregen -b vio_async_in96_cg.xco
#coregen -b vio_async_in192_cg.xco
#coregen -b vio_sync_out32_cg.xco
#coregen -b vio_async_in100_cg.xco
#del *.ncf
echo Synthesis Tool: XST

mkdir "../synth/__projnav" > ise_flow_results.txt
mkdir "../synth/xst" >> ise_flow_results.txt
mkdir "../synth/xst/work" >> ise_flow_results.txt

xst -ifn xst_run.txt -ofn mem_interface_top.syr -intstyle ise >> ise_flow_results.txt
ngdbuild -intstyle ise -dd ../synth/_ngo -nt timestamp -uc ddr2_sdram.ucf -p xc5vlx110tff1136-1 ddr2_sdram.ngc ddr2_sdram.ngd >> ise_flow_results.txt

map -intstyle ise -detail -p xc5vlx110tff1136-1 -w -logic_opt off -ol high -xe n -t 1 -cm area -k 6 -o ddr2_sdram_map.ncd ddr2_sdram.ngd ddr2_sdram.pcf >> ise_flow_results.txt
par -w -intstyle ise -ol high -xe n -t 1 ddr2_sdram_map.ncd ddr2_sdram.ncd ddr2_sdram.pcf >> ise_flow_results.txt
trce -e 3 -xml ddr2_sdram ddr2_sdram.ncd -o ddr2_sdram.twr ddr2_sdram.pcf >> ise_flow_results.txt
bitgen -intstyle ise -f mem_interface_top.ut ddr2_sdram.ncd >> ise_flow_results.txt

echo done!
