# Binaries and Systemd Service to load PS5 Camera firmware 

CPP binary and firmware generated from [PS5-Camera-Firmware-Loader](https://github.com/raleighlittles/PS5-Camera-Firmware-Loader). Built and tested on Fedora 38/39.

# Instructions

Install `v4l2-ctl` and `inotify-tools` (dependency):
```bash
sudo dnf install v4l-utils inotify-tools
```

Copy folder `ps5cam/` to `/opt`:
```bash
sudo cp -R ps5cam /opt/
```

## Link Files to the systemd locations

NOTE: The script has lots of assumptions that are typical defaults of Fedora 38 and characteristics of the PS5 Camera. It assumes the camera will be recognised as `/dev/video0`. 

Link the script and the systemd service unit file to the appropriate locations:

```bash
sudo ln -s /opt/ps5cam/ps5cam-load-firmware.sh /usr/local/bin/ps5cam-load-firmware.sh
sudo ln -s /opt/ps5cam/systemd/ps5cam.service /etc/systemd/system/ps5cam.service
```

## Set Correct Permissions

Ensure the script and service file have the correct permissions:

```bash
sudo chmod 755 /usr/local/bin/ps5cam-load-firmware.sh
sudo chmod 644 /etc/systemd/system/ps5cam.service
```

## Reload systemd and Enable the Service

Reload systemd to pick up the changes you've made:

```bash
sudo systemctl daemon-reload
```

Enable the service to run at startup:

```bash
sudo systemctl enable ps5cam.service
```

## Start the Service 

You can start the service manually to test if everything is working as expected:

```bash
sudo systemctl start ps5cam.service
```
---

# Thanks
 - To [Raleigh Littles](https://github.com/raleighlittles) for his work on the firmware loader
 - To ChatGPT to help with the generation of this README file. (The trick to get it to generate Markdown source is to prompt: ***"you should not display the processed markdown with the source, just show the source of your text as a markdown document in plain text so I can copy it"***)
