@implementation WFInternalAppSettings

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WFInternalAppSettings apiVersion](self, "apiVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFInternalAppSettings apiVersionFallback](self, "apiVersionFallback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("API version = %@, API Fallback version = %@, Network Failed Attempts Limit = %lu, Network Switch Expiration Time In Seconds = %lu, location precision = %ld"), v4, v5, -[WFInternalAppSettings networkFailedAttemptsLimit](self, "networkFailedAttemptsLimit"), -[WFInternalAppSettings networkFailedAttemptsLimit](self, "networkFailedAttemptsLimit"), -[WFInternalAppSettings locationNumDecimalsOfPrecision](self, "locationNumDecimalsOfPrecision"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)apiVersion
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  WeatherFoundationInternalUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("apiVersion"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("twc_v2");
  v5 = v3;

  return v5;
}

- (NSSet)aqiEnabledCountryCodes
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;

  WeatherFoundationInternalUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("aqiEnabled"));

  if ((v3 & 1) != 0)
  {
    WeatherFoundationInternalUserDefaults();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayForKey:", CFSTR("aqiEnabledCountries"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
    else
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("CN"), CFSTR("US"), CFSTR("DE"), CFSTR("IN"), CFSTR("MX"), CFSTR("GB"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)objc_opt_new();
  }
  return (NSSet *)v6;
}

- (NSString)apiVersionFallback
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  WeatherFoundationInternalUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("apiVersionFallback"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("twc_v2");
  v5 = v3;

  return v5;
}

- (unint64_t)networkFailedAttemptsLimit
{
  void *v2;
  void *v3;
  unint64_t v4;

  WeatherFoundationInternalUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("networkFailedAttemptsLimit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 2;

  return v4;
}

- (unint64_t)networkSwitchExpirationTimeInSeconds
{
  void *v2;
  void *v3;
  unint64_t v4;

  WeatherFoundationInternalUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("networkSwitchExpirationTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 60;

  return v4;
}

- (unint64_t)locationNumDecimalsOfPrecision
{
  void *v2;
  void *v3;
  unint64_t v4;

  WeatherFoundationInternalUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("locationDecimalPrecision"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 3;

  return v4;
}

- (NSURL)appAnalyticsEndpointUrl
{
  return (NSURL *)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://weather-analytics-events.apple.com/analyticseventsv2/async"));
}

- (float)dataSamplingRate
{
  return 0.2;
}

- (float)telemetrySamplingRate
{
  return 0.25;
}

- (float)locationGeocodingSamplingRate
{
  return 0.2;
}

- (double)userIdentifierResetTimeInterval
{
  return 33696000.0;
}

- (double)privateUserIdentifierResetTimeInterval
{
  return 2592000.0;
}

- (double)cachedGeocodeLocationExpirationTimeInterval
{
  return 86400.0;
}

- (double)locationUpdateMinTimeInterval
{
  return 1800.0;
}

- (double)locationUpdateMinDistance
{
  return 500.0;
}

- (WFWeatherEventsConfig)weatherEventsConfig
{
  return -[WFWeatherEventsConfig initWithDictionary:]([WFWeatherEventsConfig alloc], "initWithDictionary:", 0);
}

- (BOOL)disableForecastRequestCancelation
{
  return 0;
}

- (BOOL)disablePriorityForecastRequestQueue
{
  return 0;
}

- (BOOL)loadSavedCitiesFromKVSOnly
{
  return 0;
}

- (BOOL)disableLimitReverseGeocoding
{
  return 0;
}

@end
