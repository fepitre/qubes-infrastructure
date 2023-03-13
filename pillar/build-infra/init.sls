build-infra:
  netvm: sys-net
  logs-template: fedora-37
  logs-netvm: sys-firewall
  build-template: fedora-37
  build-netvm: sys-whonix
  keys-template: fedora-37-minimal

  build-envs:
    iso:
      builderv2: True
      builders-list:
        /home/user/builder-iso-r4.2:
          release: 4.2
          config:
            - file: R4.2/qubes-os-r4.2-iso-online-testing.yml
            - repository:
                - baseurl: https://github.com/QubesOS/qubes-
                - component: release-configs
      volume-size: 60GiB
      logs: logs-iso
    templates-community:
      builderv2: True
      builders-list:
        /home/user/builder-templates-community-r4.2:
          release: 4.2
          config:
            - file: R4.2/qubes-os-r4.2-templates-community.yml
            - repository:
                - baseurl: https://github.com/QubesOS/qubes-
                - component: release-configs
      volume-size: 60GiB
      logs: logs-tertiary

  remote-hosts:
    yum.qubes-os.org:
      ssh_user: user
      ssh_host_key: AAAAB3NzaC1yc2EAAAADAQABAAABAQCs7JxW6S2eWv44tS9aXKrk2roSk8FclU7vtdz/hnsThtc3A7VofkGHCaG0xzFjreUvI300/dYQ3P6vehx08S+gpyWC6ILB6S4P4sY+VVl8d9OFenRDFXd+spv9DKEufsZ8x0E7DpopHYWir+NCx5ohw0BDwoeH/VOjQfAEzWy1kRyX2hy9dtO8rM8ykEUrL6bB0SAUF09HuVFhPVnveaLZD13baZcd5uBuqg5+s+atCFVRyr+f9ffBQKW+rE9FEckMV7/RfHF8FHeVZ/wHy+HIUF35I9IiXOr76TbRUttgTXpPU19aAsP91f4ISL8w49cBUiSCd4vYO9wqOV9rmCZ/
