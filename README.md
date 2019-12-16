# Overview
I have run several Raspberry Pi's in my home and barn. This code will provision them to accept bluetooth connections and allow one to pair a phone and stream audio to them. Volumio offers this feature, but only if you pay $35+ per year. For some that may be acceptable, but we can put that money towards the mortgage instead!

![](imgs/radio.png)

# Usage

    ansible-galaxy install -r requirements.yml

    # This will fail shortly after adding the users, that's fine
    ansible-playbook playbook.yml -i hosts_prep

    # Resume with the new password
    ansible-playbook playbook.yml -i hosts_prep -kK

    # Once your user has been added, switch to the new inventory
    ansible-playbook playbook.yml -i hosts -K
