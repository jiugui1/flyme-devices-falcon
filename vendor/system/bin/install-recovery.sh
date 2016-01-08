#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9023488 1ccfdf3415459923137ff59772b2da0e40151f42 6733824 db2d7701bc58444b6ed7acb02a416dfc8df8ba59
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:9023488:1ccfdf3415459923137ff59772b2da0e40151f42; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:6733824:db2d7701bc58444b6ed7acb02a416dfc8df8ba59 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 1ccfdf3415459923137ff59772b2da0e40151f42 9023488 db2d7701bc58444b6ed7acb02a416dfc8df8ba59:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
