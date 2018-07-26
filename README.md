# `wif`
> A minimal command-line tool for managing WiFi connection on MacOS.

## Why?
I love using the command line over GUI any time I can. Prior to creating this tool, I had several clunky shell aliases and functions in my `.bashrc`.

```sh
# So that I could use `wf on` or `wf off`
alias wf="networksetup -setairportpower en1"
# So that I could get the password of a network without Keychain Access
alias nwp="security find-generic-password -wga"
# Other network operations, such as listing
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
# To connect to a network; required insecure inputting of network password
function nw {
    (networksetup -setairportnetwork en1 "$@" & 2>/dev/null)
}
# Written just before creating `wif` for more secure network password inputting. Still couldn't save passwords.
function nwpass {
    read -s -p "Password for $1: " pass
    echo
    nw "$1" "$pass"
}
```

These worked alright, but they were inconsistent. I wanted to capability to save network data to a JSON file or similar. Implementing such a system in bash would be convoluted and likely slow, so I decided to create a unified Python tool for manipulating my WiFi connections.

## Installation
From the project directory, run:
```sh
make install
```
for a full installation.

Alternatively, if you're working in a development environment, you may wish to symlink the executable for ease of testing:
```sh
make link
```
To uninstall:
```sh
make uninstall
```
Any of these commands may require root privileges depending on your environment.

## Use
Turn WiFi on or off:
```sh
wif on
wif off
```
List available networks:
```sh
wif list
```
Connect to a network:
```sh
wif connect -n SSID
```
You may also use the `-p PASSWORD` flag, however this is not recommended as it will not prevent the network password from being stored unpredictably in shell history.

## License
[MIT](LICENSE)

## Author
[Erik Boesen](https://github.com/ErikBoesen)
