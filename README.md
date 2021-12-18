# Simple Weather App
Very simple weather app made in Linux scripting languague - Bash. This script is using OpenWeather API and will only print out Temperature, Humidity and Wind speed. You can tell it to be verbose and pass an arguments to return only what you want.

# Setup

First install jq
```
sudo apt install jq -y
```
Install this script
```
wget https://raw.githubusercontent.com/t0mzSK/simple-weather-app/main/weather.sh
```
Make the file executable
```
chmod u+x
```
Lastly, add your API key to the "key" variable.

# Usage
```
./weather.sh <city> - this will return current Temperature, Humidity and Wind speed in that city

Optional arguments:
  -t    Only print temperature
  -h    Only print humidity
  -w    Only print wind speed
```

# Example
```
./weather.sh London - output will be: 7.2 °C 95% 3.09 m/s
./weather.sh London -v - output will be: Temperature: 7.2 °C Humidity: 95% Wind speed: 3.09 m/s
./weather.sh London,f -w -v - output will be: Wind speed: 5.75 mph
```
