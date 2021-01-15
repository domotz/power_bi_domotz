# Power BI Domotz Connector
Power BI Domotz custom connector provides an easy way to fetch data from Domotz and use 
them to create custom reports in Power BI.

### Usage
Create a folder with the following path if it does not exist:
`\User\Documents\Microsoft Power BI Desktop\Custom Connectors` and copy the file bin/debug/domotz.mez in that folder.
Start Power BI Desktop and from `Options -> Security -> Data Extensions` 
select `Allow any extension to load without validation or warning`

Select `Get data` and you will find `domotz (Beta)` extension. To complete the configuration you will need to provide 
the API Endpoint and API Key (obtained from the Domotz Portal). When the configuration is complete you will have access
to a subset of (read-only) endpoints of the Domotz Public API. Keep in mind that some data might require some
transformation (expanding nested objects, data conversion) before being usable from Power BI visualization tools. 

### Build requirements
Building the project requires Visual Studio and the Power Query SDK (https://marketplace.visualstudio.com/items?itemName=Dakahn.PowerQuerySDK).

### Disclaimer
Please note that this is a beta version of the Power BI Domotz Connector which is
still undergoing final testing. The connector and all content found in this repository are provided on an
"as is" and "as available" basis.

### References

[Domotz Developers](https://portal.domotz.com/developers) - Domotz API Documentation

[Domotz Portal](https://portal.domotz.com) - subscribe and get an API-Key

[Domotz Website](https://www.domotz.com)

## Screenshots

Get Data


<img src="screenshots/get_data.png?raw=true" width="600">

------------------------
Configuration


<img src="screenshots/conf.png?raw=true" width="450">

------------------------

API Navigator


<img src="screenshots/api_navigator.png?raw=true" width="600">

------------------------

Visualization Example


<img src="screenshots/visualization.png?raw=true" width="600">
