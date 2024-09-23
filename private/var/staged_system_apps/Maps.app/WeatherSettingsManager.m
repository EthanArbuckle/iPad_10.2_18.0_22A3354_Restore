@implementation WeatherSettingsManager

+ (id)sharedManager
{
  if (qword_1014D3138 != -1)
    dispatch_once(&qword_1014D3138, &stru_1011C5B48);
  return (id)qword_1014D3130;
}

- (WeatherSettingsManager)init
{

  return 0;
}

- (id)initSharedManager
{
  WeatherSettingsManager *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WeatherSettingsManager;
  v2 = -[WeatherSettingsManager init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "countryConfigurationDidChange:", GEOCountryConfigurationCountryCodeDidChangeNotification, 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "countryConfigurationDidChange:", GEOCountryConfigurationProvidersDidChangeNotification, 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "countryConfigurationDidChange:", UIApplicationWillEnterForegroundNotification, 0);

  }
  return v2;
}

+ (id)settingsUpdatedNotification
{
  return CFSTR("WeatherConditionsNeedsUpdatedNotification");
}

- (void)countryConfigurationDidChange:(id)a3
{
  -[WeatherSettingsManager _postWeatherConditionsSettingsUpdatedNotification](self, "_postWeatherConditionsSettingsUpdatedNotification", a3);
}

- (BOOL)shouldShowAirQualityConditions
{
  return GEOConfigGetBOOL(MapsSupportConfig_ClimateShowAirQualityIndex[0], MapsSupportConfig_ClimateShowAirQualityIndex[1]);
}

- (void)setShouldShowAirQualityConditions:(BOOL)a3
{
  GEOConfigSetBOOL(MapsSupportConfig_ClimateShowAirQualityIndex[0], MapsSupportConfig_ClimateShowAirQualityIndex[1], a3);
  -[WeatherSettingsManager _postWeatherConditionsSettingsUpdatedNotification](self, "_postWeatherConditionsSettingsUpdatedNotification");
}

- (BOOL)shouldShowWeatherConditions
{
  return GEOConfigGetBOOL(MapsSupportConfig_ClimateShowWeatherConditions[0], MapsSupportConfig_ClimateShowWeatherConditions[1]);
}

- (void)setShouldShowWeatherConditions:(BOOL)a3
{
  GEOConfigSetBOOL(MapsSupportConfig_ClimateShowWeatherConditions[0], MapsSupportConfig_ClimateShowWeatherConditions[1], a3);
  -[WeatherSettingsManager _postWeatherConditionsSettingsUpdatedNotification](self, "_postWeatherConditionsSettingsUpdatedNotification");
}

- (void)_postWeatherConditionsSettingsUpdatedNotification
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("WeatherConditionsNeedsUpdatedNotification"), self);

}

@end
