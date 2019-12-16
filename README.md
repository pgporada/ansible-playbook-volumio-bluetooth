# Overview
I have run several Raspberry Pi's in my home and barn. This code will provision them to accept bluetooth connections and allow me to pair a phone and stream audio to them. Volumio offers this feature, but only if you pay $35+ per year for a single RPi. For some that may be acceptable, but we can put that money towards the mortgage instead!

![](imgs/radio.png)

# Usage

    # Temporarily enable ssh mode at http://volumio_ip/dev

    ansible-galaxy install -r requirements.yml

    # This will fail shortly after adding the users, that's fine
    ansible-playbook playbook.yml -i hosts_prep

    # Resume with the new password
    ansible-playbook playbook.yml -i hosts_prep -kK

    # Once your user has been added, switch to the new inventory
    ansible-playbook playbook.yml -i hosts -K

    # Disable volumio ssh mode at http://volumio_ip/dev

# References
Much of this comes from manual steps found [here](https://forum.volumio.org/volumio-bluetooth-receiver-t8937.htm) and [here](https://www.raspberrypi.org/forums/viewtopic.php?f=38&t=247892).
