# Overview
I run [Volumio](https://volumio.org/) on several Raspberry Pi's in my home and barn. This code will provision them to accept bluetooth connections and allow me to pair a phone and stream audio to them. Volumio offers this feature, but only if you pay $35+ per year for a single RPi. For some that may be acceptable, but we can put that money towards the mortgage instead!

![](imgs/radio.png)

# Usage

    # Temporarily enable ssh mode at http://volumio_ip/dev

    # On your own computer, not necessarily the raspberry pi, you can run
    git clone https://github.com/pgporada/ansible-playbook-volumio-bluetooth
    cd ansible-playbook-volumio-bluetooth
    ansible-playbook playbook.yml -i hosts.example -kK

    # Disable volumio ssh mode at http://volumio_ip/dev

### Pairing a device
This part is kind of a pain in the butt and currently must be done manually. An expect script or something might be useful for this.

    sudo bluetoothctl
    # power on
    # agent on
    # default-agent
    # scan on => xx:xx of your device
    # pair xx:xx
    # trust xx:xx
    # exit

### Removing a device

    sudo bluetoothctl
    # devices
    # remove xx:xx
    # exit

# References
Much of this comes from manual steps found [here](https://forum.volumio.org/volumio-bluetooth-receiver-t8937.htm) and [here](https://www.raspberrypi.org/forums/viewtopic.php?f=38&t=247892).
