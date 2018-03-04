## 検証するとき

### box を作る

適宜 `sudo` がいるかも

```console
$ git clone ghq get timsutton/osx-vm-templates
$ cd $_
$ MAC_OS_VERSION=10.13.2
$ mkdir out
$ ../prepare_iso/prepare_vdi.sh \
  -D DISABLE_REMOTE_MANAGEMENT \
  -o macOS_$MAC_OS_VERSION.vdi \
   /Applications/Install\ macOS\ High\ Sierra.app/ \
  .
$ ../prepare_iso/prepare_ovf.sh macOS_$MAC_OS_VERSION.vdi
$ packer build \
  -var provisioning_delay=30 \
  -var autologin=true \
  -var source_path=macOS_$MAC_OS_VERSION.ovf \
  -only virtualbox-ovf \
  ../packer/template.json
$ vagrant box add osx-high-sierra-$MAC_OS_VERSION $HOME/soft/packer_virtualbox-ovf_virtualbox.box
```

### Vagrant で実行する

```console
$ vagrant up highSierra --no-provision
$ vagrant snapshot save highSierraInit
$ vagrant provision
$ vagrant snapshot restore highSierraInit
```

## 参考

https://qiita.com/gin0606/items/b26a8786aa7c437db0fb