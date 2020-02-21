sudo gpasswd -a $USER input
sudo apt-get install libinput-tools -y  
sudo apt-get install xdotool -y  
sudo apt install ruby  -y
sudo gem install fusuma  
mkdir ~/.config/fusuma  
touch ~/.config/fusuma/config.yml 

echo "swipe:
  3:
    left: 
      command: 'xdotool key ctrl+alt+Down'
    right: 
      command: 'xdotool key ctrl+alt+Up'
    up: 
      command: 'xdotool key super+a'
    down: 
      command: 'xdotool key super'
  4: 
    left:
      command: 'xdotool key alt+Shift+Tab'
    right:
      command: 'xdotool key alt+Tab'
    up:
      command: 'xdotool key ctrl+t'
      threshold: 1.5
    down:
      command: 'xdotool key ctrl+w'
      threshold: 1.5
pinch:
  in:
    command: 'xdotool key ctrl+plus'
    threshold: 0.1
  out:
    command: 'xdotool key ctrl+minus'
    threshold: 0.1

threshold:
  swipe: 0.4
  pinch: 0.4
interval:
  swipe: 0.8
  pinch: 1" > ~/.config/fusuma/config.yml