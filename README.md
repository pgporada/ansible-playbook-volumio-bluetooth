# Overview
I run [Volumio](https://volumio.org/) on several Raspberry Pi's in my home and barn. This code will provision them to accept bluetooth connections and allow me to pair a phone and stream audio to them. Volumio offers this feature, but only if you pay $35+ per year for a single RPi. For some that may be acceptable, but we can put that money towards the ~mortgage~ **beer** instead!

![](imgs/radio.png)

# Usage

    # Temporarily enable ssh mode at http://volumio_ip/dev

    # On your own computer, not necessarily the raspberry pi, you can run
    sudo apt install ansible git

    # Get this repository onto your computer
    git clone https://github.com/pgporada/ansible-playbook-volumio-bluetooth

    # Configure the Volumio server IP so that you're connecting to the correct device
    cd ansible-playbook-volumio-bluetooth
    vim hosts.example

    # Run ansible from your computer to configure the Volumio server
    ansible-playbook playbook.yml -i hosts.example -kK

    # Disable volumio ssh mode at http://volumio_ip/dev

### Pairing a device
This part is done on the Volumio server itself and is kind of a pain in the butt. An expect script or something might be useful for this as a future improvement. This only needs to be done once per phone per Volumio server.

    sudo bluetoothctl
    # power on
    # agent on
    # default-agent
    # scan on => xx:xx of your device
    # pair xx:xx
    # trust xx:xx
    # devices
    # exit

### Removing a device

    sudo bluetoothctl
    # devices
    # remove xx:xx
    # exit

### Troubleshooting

#### I have paired my phone to the raspberry pi, but I can't hear any audio!
If you're like me, you may have a web radio playing constantly from Volumio. When you connect your phone to bluetooth on the rpi, you may not hear anything until you pause the web radio in the Volumio interface. The interface will control the volume, but will not show that anything is "streaming" from your phone.

# References
Much of this comes from manual steps found [here](https://forum.volumio.org/volumio-bluetooth-receiver-t8937.html) and [here](https://www.raspberrypi.org/forums/viewtopic.php?f=38&t=247892).
