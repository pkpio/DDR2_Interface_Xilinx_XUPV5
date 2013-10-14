# Following coregen commands to be uncommented  when the parameter DEBUG_EN is changed from 0 to 1 in ddr2_sdram.v/.vhd file.
#coregen -b icon4_cg.xco
#coregen -b vio_async_in96_cg.xco
#coregen -b vio_async_in192_cg.xco
#coregen -b vio_sync_out32_cg.xco
#coregen -b vio_async_in100_cg.xco
#del *.ncf
pjcli -f set_ise_prop.txt
