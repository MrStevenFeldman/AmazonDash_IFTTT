# AmazonDash_IFTTT

TODO: This can be improved by executing specific code based on the IP addresss of the connecting device.

Notes: Is there a better way to achieve this on a router?

# Setup Instructions

## IFTTT
Setup an IFTTT account and conncet to the [Maker channel](https://ifttt.com/maker) and make a recipe.

## Dash Configuration

Follow the instructions from the Amazon app, but don't assign a product to the dash button.

## Router Configuration (openwrt)

### Web UI configurations:
1. Give the dash a static ip address
2. Configure Traffic Rules (Network -> Firewall -> Traffic Rules)

  * Make a new forward rule, that forwards all traffic from the dash's mac address to the routers address.
  Note: You could also rewrite the destination port from 443 to something less used.
  If you do, change the port in dash_listener
	
    Example:
    ```
    	From any host in any zone with source MAC <DASH MAC> To IP 192.168.1.1 in any zone
    	Accept forward
    ```

  * Block all wan requests from the dash
  
    Example:
    ```
      From any host in any zone with source MAC <DASH MAC> To any host in wan
    	Refuse Forward
    ```

### Terminal configuration

1. Configure scripts
    In dash_listner.sh replace the url with the url from your recipe

2. Install scripts on the router
  ```
    cp dash_listener.sh /bin/
    cp dash_service /etc/init.d/
    reload your environement variables.
  ```

3. Start the dash service
  ```
    /etc/init.d/dash_service start
  ```
