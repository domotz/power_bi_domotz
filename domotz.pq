section domotz;

[DataSource.Kind="domotz", Publish="domotz.Publish"]
shared domotz.PublicAPI = () =>
    let
        apiKey = Extension.CurrentCredential()[Password],
        endpoint = Extension.CurrentCredential()[Username],
        
        headers = [
            #"X-API-KEY" = apiKey,
            #"Content-Type" = "application/json"
        ],
        swaggerDef = Json.Document(Web.Contents("https://raw.githubusercontent.com/domotz/power_bi_domotz/main/domotz-swagger.json")),
        API_Endpoint_1 = Text.Replace(endpoint, "https://", ""),
        API_Endpoint_2 = Text.Replace(API_Endpoint_1, "/public-api/v1/", ""),
        domotzSwagger = Record.AddField(swaggerDef, "host", API_Endpoint_2),
        request = OpenApi.Document(Binary.From(Json.FromValue(domotzSwagger)), [ Headers = headers, ManualCredentials = true ]
                  )
       
    in
        request;

// Data Source Kind description
domotz = [
    TestConnection = (domotz) => {"domotz.PublicAPI"},
    Authentication = [
        UsernamePassword = [UsernameLabel="API Endpoint", PasswordLabel="API Key", Label="Domotz Public API"]
    ],
    Label = Extension.LoadString("DataSourceLabel")
];

// Data Source UI publishing description
domotz.Publish = [
    Beta = true,
    Category = "Other",
    ButtonText = { Extension.LoadString("ButtonTitle"), Extension.LoadString("ButtonHelp") },
    LearnMoreUrl = "https://github.com/domotz/power_bi_domotz",
    SourceImage = domotz.Icons,
    SourceTypeImage = domotz.Icons
];

domotz.Icons = [
    Icon16 = { Extension.Contents("domotz16.png"), Extension.Contents("domotz20.png"), Extension.Contents("domotz24.png"), Extension.Contents("domotz32.png") },
    Icon32 = { Extension.Contents("domotz32.png"), Extension.Contents("domotz40.png"), Extension.Contents("domotz48.png"), Extension.Contents("domotz64.png") }
];
