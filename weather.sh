#!/usr/bin/bash

function getUsage() {
	echo -e "Usage: $0 city\n"
	echo "Optional arguments:"
	echo "  -t	Only print temperature"
	echo "  -h	Only print humidity"
	echo "  -w 	Only print wind speed"
}

city="$1"
if [ -z "$city" ]; then
	getUsage
	exit 1
else
	if [ "${city: -2}" == ",f" ]; then
		url="https://api.openweathermap.org/data/2.5/weather?q=${city::-2}&units=imperial&appid="
		fahrenheit=true
	else
		url="https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid="
		fahrenheit=false
	fi
fi

key=""
full_url="$url$key"

function getTemperature() {
	curl -s "$full_url" | jq ".main.temp"
}

function getHumidity() {
	curl -s "$full_url" | jq ".main.humidity"
}

function getWind() {
	curl -s "$full_url" | jq ".wind.speed"
}

function getAll() {
	getTemperature
	getHumidity
	getWind
}

if [ "$2" == "-t" ]; then
	if [ "$3" == "-v" ]; then
		if [ "$fahrenheit" == true ]; then
			echo "Temperature: $(getTemperature) °F"
		else
			echo "Temperature: $(getTemperature) °C"
		fi
	else getTemperature
	fi

elif [ "$2" == "-h" ]; then
	if [ "$3" == "-v" ]; then
		echo "Humidity: $(getHumidity)%"
	else getHumidity
	fi

elif [ "$2" == "-w" ]; then
	if [ "$3" == "-v" ]; then
  		if [ "$fahrenheit" == true ]; then
                        echo "Wind speed: $(getWind) mph"
		else
			echo "Wind speed: $(getWind) m/s"
		fi
	else getWind
	fi

elif [ "$2" == "-v" ]; then
	if [ "$fahrenheit" == true ]; then
		echo "Temperature: $(getTemperature) °F"
		echo "Humidity: $(getHumidity)%"
		echo "Wind speed: $(getWind) mph"
	else
		echo "Temperature: $(getTemperature) °C"
                echo "Humidity: $(getHumidity)%"
                echo "Wind speed: $(getWind) m/s"
	fi

else getAll
fi