# OpenRazer Kernel Module Signer

It's a simple script that signs [OpenRazer](https://openrazer.github.io/) drivers 
on Fedora, so they'll be usable with UEFI Secure Boot.

## Setup

Follow these steps before signing:

 1. Modify `openssl.cnf` to match your name, etc.
 2. Run
    ```shell
    openssl req -config ./openssl.cnf \
      -new -x509 -newkey rsa:2048 \
      -nodes -days 36500 -outform DER \
      -keyout "MOK.priv" \
      -out "MOK.der"
    ```
 3. `sudo mokutil --import MOK.der`
 4. Reboot and import the key in EFI.

## Signing

First install the drivers however you like. Usually by `dnf install
openrazer-meta`. Then just run `sudo sh ./razer-sign.sh`. You have to do this
with every new kernel, sadly.

## Security

As you're importing a custom key into EFI, obviously you shouldn't just leave
it laying around on the internet. Back it up somewhere safe just in case.

## License

Public domain. Go wild.

