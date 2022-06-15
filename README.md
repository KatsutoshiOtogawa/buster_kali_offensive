# gentoo_systemd_box

gentoo install systemd is very difficult for gentoo biginner user.

this box is building systemd only execute vagrant up command.

```bash
vagrant up

# sysstemdの環境を読み込み。
vagrant reload

# 停止
vagrant halt

# 再利用のためパッケージ化
vagrant package --output out/buster_kali_offensive.box

# check sum upload時に必要。
sha256sum out/buster_kali_offensive.box | cut -d ' ' -f 1

OtogawaKatsutoshi/buster_kali_offensive

```

## version

build date v{yyyy.mm.dd}.

