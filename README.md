# AmazonDash_IFTTT

Notes; this is a naive port listenr

# Setup Instructions

## IFTTT
Setup an IFTTT account and conncet to the [Maker channel](https://ifttt.com/maker) and make a recipe.

## Dash Configuration

Follow the instructions from the Amazon app, but don't assign a product to the dash button.

## Router Configuration (openwrt)

1) Give the dash a static ip address
2) Configure Traffic Rules (Network -> Firewall -> Traffic Rules)
	2.1) Make a new forward rule, that forwards all traffic from the dash's mac address to the routers address.
		*You could also rewrite the destination port from 443 to something less used. If you do, change the port in dash_listener
	Example:
		From any host in any zone with source MAC <DASH MAC> To IP 192.168.1.1 in any zone
		Accept forward
	2.2) Block all wan requests from the dash
	Example:
		From any host in any zone with source MAC <DASH MAC> To any host in wan
		Refuse Forward

3) Configure scripts
In dash_listner.sh replace the url with the url from your recipe

4) Install scripts
cp dash_listener.sh /bin/
cp dash_service /etc/init.d/

reload your environement variables.

5) Start the dash service
/etc/init.d/dash_service start

