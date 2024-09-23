@implementation WFRemoteAppSettings

+ (id)configurationWithData:(id)a3 userID:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v7 = (void *)MEMORY[0x24BDD1488];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "countryCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend((id)objc_opt_class(), "useInternalBundleID");
  v15 = objc_msgSend((id)objc_opt_class(), "wfSeedBuild");
  if (v11)
  {
    objc_msgSend((id)objc_opt_class(), "bundleIDsListFor:useInternalBundleID:useSeedBundleID:", v11, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = (void *)MEMORY[0x24BDBD1A8];
  }
  objc_msgSend((id)objc_opt_class(), "configurationWithData:bundleIDs:country:userID:error:", v9, v16, v13, v8, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)configurationWithData:(id)a3 bundleIDs:(id)a4 country:(id)a5 userID:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  WFRemoteAppSettings *v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  WFRemoteAppSettings *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v10, 0, &v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v21;
  +[WFRemoteAppSettings defaultSettings](WFRemoteAppSettings, "defaultSettings");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v15)
  {
    v18 = (WFRemoteAppSettings *)v16;
  }
  else
  {
    v18 = -[WFRemoteAppSettings initWithConfigDictionary:bundleIDs:country:userID:]([WFRemoteAppSettings alloc], "initWithConfigDictionary:bundleIDs:country:userID:", v14, v11, v12, v13);

    WFLogForCategory(9uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v18;
      _os_log_impl(&dword_21189A000, v19, OS_LOG_TYPE_DEFAULT, "[WFRemoteAppSettings] initialized new remote app settings instance: %@", buf, 0xCu);
    }

  }
  return v18;
}

+ (id)defaultSettings
{
  return -[WFRemoteAppSettings initWithConfigDictionary:bundleIDs:country:userID:]([WFRemoteAppSettings alloc], "initWithConfigDictionary:bundleIDs:country:userID:", 0, 0, 0, 0);
}

+ (id)bundleIDsListFor:(id)a3 useInternalBundleID:(BOOL)a4 useSeedBundleID:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("internal"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "operatingSystemVersion");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%li_%li"), 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@.seed"), v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v13);

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v7, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v14);

  objc_msgSend(v8, "addObject:", v7);
  return v8;
}

+ (BOOL)useInternalBundleID
{
  void *v2;
  char v3;

  WeatherFoundationInternalUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("use_non_internal_bundleid"));

  return objc_msgSend((id)objc_opt_class(), "wfInternalBuild") & (v3 ^ 1);
}

+ (BOOL)wfInternalBuild
{
  if (wfInternalBuild_onceToken != -1)
    dispatch_once(&wfInternalBuild_onceToken, &__block_literal_global_8);
  return wfInternalBuild_internalBuild;
}

uint64_t __38__WFRemoteAppSettings_wfInternalBuild__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  wfInternalBuild_internalBuild = result;
  return result;
}

+ (BOOL)wfSeedBuild
{
  return 0;
}

- (WFRemoteAppSettings)initWithConfigDictionary:(id)a3 bundleIDs:(id)a4 country:(id)a5 userID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  WFRemoteAppSettings *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDate *lastModificationDate;
  uint64_t v19;
  NSDate *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSSet *aqiEnabledCountryCodes;
  uint64_t v26;
  NSString *apiVersion;
  uint64_t v28;
  NSString *apiVersionFallback;
  uint64_t v30;
  NSDictionary *widgetRefreshPolicy;
  void *v32;
  WFWeatherEventsConfig *v33;
  WFWeatherEventsConfig *weatherEventsConfig;
  double v35;
  double v36;
  double v37;
  objc_super v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v39.receiver = self;
  v39.super_class = (Class)WFRemoteAppSettings;
  v14 = -[WFRemoteAppSettings init](&v39, sel_init);
  if (v14)
  {
    WeatherFoundationInternalUserDefaults();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("cachedAppConfigLastSavedDate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    lastModificationDate = v14->_lastModificationDate;
    v14->_lastModificationDate = (NSDate *)v17;

    if (!v14->_lastModificationDate)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v14->_lastModificationDate;
      v14->_lastModificationDate = (NSDate *)v19;

    }
    -[WFRemoteAppSettings getEnvironmentSpecificConfigDictionaryFromDictionary:bundleIDs:country:](v14, "getEnvironmentSpecificConfigDictionaryFromDictionary:bundleIDs:country:", v10, v11, v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v14->_config, v21);
    if (v21)
    {
      v22 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("aqiEnabledCountries"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setWithArray:", v23);
      v24 = objc_claimAutoreleasedReturnValue();
      aqiEnabledCountryCodes = v14->_aqiEnabledCountryCodes;
      v14->_aqiEnabledCountryCodes = (NSSet *)v24;

    }
    else
    {
      v23 = v14->_aqiEnabledCountryCodes;
      v14->_aqiEnabledCountryCodes = 0;
    }

    v14->_appConfigRefreshRate = objc_msgSend(MEMORY[0x24BDBCE70], "integerValueFromDictionary:forKey:defaultValue:", v21, CFSTR("configRefreshRate"), 86400);
    v14->_networkFailedAttemptsLimit = objc_msgSend(MEMORY[0x24BDBCE70], "integerValueFromDictionary:forKey:defaultValue:", v21, CFSTR("networkFailedAttemptsLimit"), 3);
    v14->_networkSwitchExpirationTimeInSeconds = objc_msgSend(MEMORY[0x24BDBCE70], "integerValueFromDictionary:forKey:defaultValue:", v21, CFSTR("networkSwitchExpirationTime"), 3600);
    -[WFRemoteAppSettings getAPIVersionFromDictionary:userID:](v14, "getAPIVersionFromDictionary:userID:", v21, v13);
    v26 = objc_claimAutoreleasedReturnValue();
    apiVersion = v14->_apiVersion;
    v14->_apiVersion = (NSString *)v26;

    objc_msgSend(MEMORY[0x24BDBCE70], "stringValueFromDictionary:forKey:defaultValue:", v21, CFSTR("apiVersionFallback"), CFSTR("twc_v2"));
    v28 = objc_claimAutoreleasedReturnValue();
    apiVersionFallback = v14->_apiVersionFallback;
    v14->_apiVersionFallback = (NSString *)v28;

    v14->_locationNumDecimalsOfPrecision = objc_msgSend(MEMORY[0x24BDBCE70], "integerValueFromDictionary:forKey:defaultValue:", v21, CFSTR("locationDecimalPrecision"), 3);
    objc_msgSend(v21, "dictionaryForKey:", CFSTR("widgetRefresh"));
    v30 = objc_claimAutoreleasedReturnValue();
    widgetRefreshPolicy = v14->_widgetRefreshPolicy;
    v14->_widgetRefreshPolicy = (NSDictionary *)v30;

    objc_msgSend(v21, "dictionaryForKey:", CFSTR("WeatherEventConfig"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[WFWeatherEventsConfig initWithDictionary:]([WFWeatherEventsConfig alloc], "initWithDictionary:", v32);
    weatherEventsConfig = v14->_weatherEventsConfig;
    v14->_weatherEventsConfig = v33;

    objc_msgSend(MEMORY[0x24BDBCE70], "timeIntervalValueFromDictionary:forKey:defaultValue:", v21, CFSTR("cachedGeocodeLocationExpirationTimeInterval"), 86400.0);
    v14->_cachedGeocodeLocationExpirationTimeInterval = v35;
    objc_msgSend(MEMORY[0x24BDBCE70], "timeIntervalValueFromDictionary:forKey:defaultValue:", v21, CFSTR("locationUpdateMinTimeInterval"), 1800.0);
    v14->_locationUpdateMinTimeInterval = v36;
    objc_msgSend(MEMORY[0x24BDBCE70], "doubleValueFromDictionary:forKey:defaultValue:", v21, CFSTR("locationUpdateMinDistance"), 1500.0);
    v14->_locationUpdateMinDistance = v37;
    v14->_disableForecastRequestCancelation = objc_msgSend(v21, "BOOLForKey:defaultValue:", CFSTR("disableForecastRequestCancelation"), 0);
    v14->_disablePriorityForecastRequestQueue = objc_msgSend(v21, "BOOLForKey:defaultValue:", CFSTR("disablePriorityForecastRequestQueue"), 0);
    v14->_loadSavedCitiesFromKVSOnly = objc_msgSend(v21, "BOOLForKey:defaultValue:", CFSTR("loadSavedCitiesFromKVSOnly"), 0);
    v14->_disableLimitReverseGeocoding = objc_msgSend(v21, "BOOLForKey:defaultValue:", CFSTR("disableLimitReverseGeocoding"), 0);

  }
  return v14;
}

- (id)getEnvironmentSpecificConfigDictionaryFromDictionary:(id)a3 bundleIDs:(id)a4 country:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSString *v13;
  NSString *bundleID;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  NSURL *v26;
  NSURL *appAnalyticsEndpointUrl;
  void *v28;
  double v29;
  float v30;
  double v31;
  float v32;
  double v33;
  float v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSString *v41;
  NSString *countryCode;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "stringForKey:", CFSTR("fallbackBundleId"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "mutableCopy");

  v47 = v11;
  objc_msgSend(v11, "wf_safelyAddObject:", v48);
  objc_msgSend(v10, "arrayForKey:", CFSTR("weatherBundleConfigs"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteAppSettings getSpecificConfigFromConfigs:configSpecifiers:specifierKey:](self, "getSpecificConfigFromConfigs:configSpecifiers:specifierKey:", v46, v11, CFSTR("bundleId"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringForKey:", CFSTR("bundleId"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleID = self->_bundleID;
  self->_bundleID = v13;

  objc_msgSend(v10, "arrayForKey:", CFSTR("endpointConfigs"));
  v15 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v15;
  WeatherFoundationInternalUserDefaults();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringForKey:", CFSTR("AppAnalyticsEnvironment"));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  v19 = CFSTR("PRODUCTION");
  if (v17)
    v19 = (__CFString *)v17;
  v20 = v19;

  v49[0] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteAppSettings getSpecificConfigFromConfigs:configSpecifiers:specifierKey:](self, "getSpecificConfigFromConfigs:configSpecifiers:specifierKey:", v15, v44, CFSTR("environment"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("appAnalyticsEndpointUrl"));
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  v24 = CFSTR("https://weather-analytics-events.apple.com/analyticseventsv2/async");
  if (v22)
    v24 = (__CFString *)v22;
  v25 = v24;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v25);
  v26 = (NSURL *)objc_claimAutoreleasedReturnValue();

  appAnalyticsEndpointUrl = self->_appAnalyticsEndpointUrl;
  self->_appAnalyticsEndpointUrl = v26;

  objc_msgSend(v10, "objectForKey:", CFSTR("privacyConfiguration"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v29) = 1045220557;
  objc_msgSend(MEMORY[0x24BDBCE70], "floatValueFromDictionary:forKey:defaultValue:", v28, CFSTR("dataSamplingRate"), v29);
  self->_dataSamplingRate = v30;
  LODWORD(v31) = 0.25;
  objc_msgSend(MEMORY[0x24BDBCE70], "floatValueFromDictionary:forKey:defaultValue:", v28, CFSTR("telemetrySamplingRate"), v31);
  self->_telemetrySamplingRate = v32;
  LODWORD(v33) = 1045220557;
  objc_msgSend(MEMORY[0x24BDBCE70], "floatValueFromDictionary:forKey:defaultValue:", v28, CFSTR("locationGeocodingSamplingRate"), v33);
  self->_locationGeocodingSamplingRate = v34;
  objc_msgSend(MEMORY[0x24BDBCE70], "timeIntervalValueFromDictionary:forKey:defaultValue:", v28, CFSTR("userIdentifierResetTimeInterval"), 2592000.0);
  self->_userIdentifierResetTimeInterval = v35;
  objc_msgSend(MEMORY[0x24BDBCE70], "timeIntervalValueFromDictionary:forKey:defaultValue:", v28, CFSTR("privateUserIdentifierResetTimeInterval"), 33696000.0);
  self->_privateUserIdentifierResetTimeInterval = v36;
  objc_msgSend(v12, "stringForKey:", CFSTR("fallbackCountryCode"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_opt_new();
  objc_msgSend(v38, "wf_safelyAddObject:", v8);

  objc_msgSend(v38, "wf_safelyAddObject:", v37);
  objc_msgSend(v12, "arrayForKey:", CFSTR("weatherCountryConfigs"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteAppSettings getSpecificConfigFromConfigs:configSpecifiers:specifierKey:](self, "getSpecificConfigFromConfigs:configSpecifiers:specifierKey:", v39, v38, CFSTR("countryCode"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "stringForKey:", CFSTR("countryCode"));
  v41 = (NSString *)objc_claimAutoreleasedReturnValue();
  countryCode = self->_countryCode;
  self->_countryCode = v41;

  return v40;
}

- (id)getSpecificConfigFromConfigs:(id)a3 configSpecifiers:(id)a4 specifierKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = v8;
  v24 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v24)
  {
    v11 = *(_QWORD *)v31;
    v25 = v7;
    v23 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v10);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v14 = v7;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v27;
          while (2)
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v27 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
              objc_msgSend(v19, "stringForKey:", v9);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v20, "length") && (objc_msgSend(v13, "isEqualToString:", v20) & 1) != 0)
              {
                v21 = v19;

                v7 = v25;
                goto LABEL_20;
              }

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v16)
              continue;
            break;
          }
        }

        v7 = v25;
        v11 = v23;
      }
      v21 = 0;
      v24 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v24);
  }
  else
  {
    v21 = 0;
  }
LABEL_20:

  return v21;
}

- (id)getAPIVersionFromDictionary:(id)a3 userID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (a3)
  {
    objc_msgSend(a3, "arrayForKey:", CFSTR("weatherApiVersionConfigs"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if (-[WFRemoteAppSettings shouldUseAPIVersionFromDictionary:userID:](self, "shouldUseAPIVersionFromDictionary:userID:", v12, v6, (_QWORD)v30))
          {
            objc_msgSend(MEMORY[0x24BDBCE70], "stringValueFromDictionary:forKey:defaultValue:", v12, CFSTR("apiVersion"), CFSTR("wds_v1"));
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
            WFLogForCategory(9uLL);
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              -[WFRemoteAppSettings getAPIVersionFromDictionary:userID:].cold.3(v12, (uint64_t)v20, v21);

            goto LABEL_16;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v9)
          continue;
        break;
      }
    }

    WFLogForCategory(9uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[WFRemoteAppSettings getAPIVersionFromDictionary:userID:].cold.2((uint64_t)CFSTR("wds_v1"), v13, v14, v15, v16, v17, v18, v19);

    v20 = CFSTR("wds_v1");
LABEL_16:

  }
  else
  {
    WFLogForCategory(9uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[WFRemoteAppSettings getAPIVersionFromDictionary:userID:].cold.1((uint64_t)CFSTR("wds_v1"), v22, v23, v24, v25, v26, v27, v28);

    v20 = CFSTR("wds_v1");
  }

  return v20;
}

- (BOOL)shouldUseAPIVersionFromDictionary:(id)a3 userID:(id)a4
{
  void *v6;
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t apiConfigModdedHash;
  BOOL v16;

  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(v6, "integerValueFromDictionary:forKey:defaultValue:", v8, CFSTR("modMax"), 1000);
  v10 = objc_msgSend(v7, "hash");

  self->_apiConfigModdedHash = v10 % v9;
  WeatherFoundationInternalUserDefaults();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("api_version_bucket_hash"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    self->_apiConfigModdedHash = objc_msgSend(v12, "unsignedIntegerValue") % v9;
  self->_apiConfigMinRange = objc_msgSend(MEMORY[0x24BDBCE70], "integerValueFromDictionary:forKey:defaultValue:", v8, CFSTR("minRange"), 0);
  v13 = objc_msgSend(MEMORY[0x24BDBCE70], "integerValueFromDictionary:forKey:defaultValue:", v8, CFSTR("maxRange"), 0);

  self->_apiConfigMaxRange = v13;
  apiConfigModdedHash = self->_apiConfigModdedHash;
  v16 = self->_apiConfigMinRange <= apiConfigModdedHash && apiConfigModdedHash < v13;

  return v16;
}

- (NSString)description
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int64_t v16;
  void *v17;

  v17 = (void *)MEMORY[0x24BDD17C8];
  -[WFRemoteAppSettings aqiEnabledCountryCodes](self, "aqiEnabledCountryCodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[WFRemoteAppSettings appConfigRefreshRate](self, "appConfigRefreshRate");
  v4 = -[WFRemoteAppSettings networkFailedAttemptsLimit](self, "networkFailedAttemptsLimit");
  v5 = -[WFRemoteAppSettings networkSwitchExpirationTimeInSeconds](self, "networkSwitchExpirationTimeInSeconds");
  -[WFRemoteAppSettings apiVersion](self, "apiVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteAppSettings apiVersionFallback](self, "apiVersionFallback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFRemoteAppSettings locationNumDecimalsOfPrecision](self, "locationNumDecimalsOfPrecision");
  -[WFRemoteAppSettings cachedGeocodeLocationExpirationTimeInterval](self, "cachedGeocodeLocationExpirationTimeInterval");
  v10 = v9;
  -[WFRemoteAppSettings locationUpdateMinTimeInterval](self, "locationUpdateMinTimeInterval");
  v12 = v11;
  -[WFRemoteAppSettings locationUpdateMinDistance](self, "locationUpdateMinDistance");
  objc_msgSend(v17, "stringWithFormat:", CFSTR("AQI countries = %@, refresh rate = %lld, network fail limit = %lu, network switch expiration = %lu, API version = %@, API version fallback = %@, location precision = %ld, _cachedGeocodeLocationExpirationTimeInterval: %f, locationUpdateMinTimeInterval: %f, locationUpdateMinDistance: %f, disableForecastRequestCancelation: %d, disablePriorityForecastRequestQueue: %d, loadSavedCitiesFromKVSOnly: %d, disableLimitReverseGeocoding: %d"), v3, v16, v4, v5, v6, v7, v8, v10, v12, v13, -[WFRemoteAppSettings disableForecastRequestCancelation](self, "disableForecastRequestCancelation"), -[WFRemoteAppSettings disablePriorityForecastRequestQueue](self, "disablePriorityForecastRequestQueue"), -[WFRemoteAppSettings loadSavedCitiesFromKVSOnly](self, "loadSavedCitiesFromKVSOnly"), -[WFRemoteAppSettings disableLimitReverseGeocoding](self, "disableLimitReverseGeocoding"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (BOOL)isExpired
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  _BOOL4 v9;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteAppSettings lastModificationDate](self, "lastModificationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  v7 = (double)-[WFRemoteAppSettings appConfigRefreshRate](self, "appConfigRefreshRate");
  WFLogForCategory(9uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v6 < v7)
  {
    if (v9)
      -[WFRemoteAppSettings isExpired].cold.2(self);
  }
  else if (v9)
  {
    -[WFRemoteAppSettings isExpired].cold.1(self);
  }

  return v6 >= v7;
}

- (BOOL)aqiEnabledForCountryCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[WFRemoteAppSettings aqiEnabledCountryCodes](self, "aqiEnabledCountryCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[WFRemoteAppSettings aqiEnabledCountryCodes](self, "aqiEnabledCountryCodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_apiVersion, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSDictionary copyWithZone:](self->_widgetRefreshPolicy, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v8;

  v10 = -[NSString copyWithZone:](self->_apiVersionFallback, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSSet copyWithZone:](self->_aqiEnabledCountryCodes, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  *(_QWORD *)(v5 + 144) = self->_appConfigRefreshRate;
  v14 = -[NSDate copyWithZone:](self->_lastModificationDate, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v14;

  *(_QWORD *)(v5 + 48) = self->_networkFailedAttemptsLimit;
  *(_QWORD *)(v5 + 56) = self->_networkSwitchExpirationTimeInSeconds;
  *(_QWORD *)(v5 + 64) = self->_locationNumDecimalsOfPrecision;
  v16 = -[WFWeatherEventsConfig copyWithZone:](self->_weatherEventsConfig, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v16;

  v18 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v18;

  v20 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v20;

  *(_QWORD *)(v5 + 176) = self->_apiConfigModdedHash;
  *(_QWORD *)(v5 + 184) = self->_apiConfigMinRange;
  *(_QWORD *)(v5 + 192) = self->_apiConfigMaxRange;
  v22 = -[NSURL copyWithZone:](self->_appAnalyticsEndpointUrl, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v22;

  *(float *)(v5 + 12) = self->_dataSamplingRate;
  *(float *)(v5 + 16) = self->_telemetrySamplingRate;
  *(float *)(v5 + 20) = self->_locationGeocodingSamplingRate;
  *(double *)(v5 + 96) = self->_userIdentifierResetTimeInterval;
  *(double *)(v5 + 104) = self->_privateUserIdentifierResetTimeInterval;
  *(double *)(v5 + 112) = self->_cachedGeocodeLocationExpirationTimeInterval;
  *(double *)(v5 + 120) = self->_locationUpdateMinTimeInterval;
  *(double *)(v5 + 128) = self->_locationUpdateMinDistance;
  return (id)v5;
}

- (NSString)apiVersion
{
  return self->_apiVersion;
}

- (NSString)apiVersionFallback
{
  return self->_apiVersionFallback;
}

- (NSSet)aqiEnabledCountryCodes
{
  return self->_aqiEnabledCountryCodes;
}

- (unint64_t)networkFailedAttemptsLimit
{
  return self->_networkFailedAttemptsLimit;
}

- (unint64_t)networkSwitchExpirationTimeInSeconds
{
  return self->_networkSwitchExpirationTimeInSeconds;
}

- (unint64_t)locationNumDecimalsOfPrecision
{
  return self->_locationNumDecimalsOfPrecision;
}

- (WFWeatherEventsConfig)weatherEventsConfig
{
  return self->_weatherEventsConfig;
}

- (NSDictionary)widgetRefreshPolicy
{
  return self->_widgetRefreshPolicy;
}

- (NSURL)appAnalyticsEndpointUrl
{
  return self->_appAnalyticsEndpointUrl;
}

- (float)dataSamplingRate
{
  return self->_dataSamplingRate;
}

- (float)telemetrySamplingRate
{
  return self->_telemetrySamplingRate;
}

- (float)locationGeocodingSamplingRate
{
  return self->_locationGeocodingSamplingRate;
}

- (double)userIdentifierResetTimeInterval
{
  return self->_userIdentifierResetTimeInterval;
}

- (double)privateUserIdentifierResetTimeInterval
{
  return self->_privateUserIdentifierResetTimeInterval;
}

- (double)cachedGeocodeLocationExpirationTimeInterval
{
  return self->_cachedGeocodeLocationExpirationTimeInterval;
}

- (double)locationUpdateMinTimeInterval
{
  return self->_locationUpdateMinTimeInterval;
}

- (double)locationUpdateMinDistance
{
  return self->_locationUpdateMinDistance;
}

- (BOOL)disableForecastRequestCancelation
{
  return self->_disableForecastRequestCancelation;
}

- (BOOL)disablePriorityForecastRequestQueue
{
  return self->_disablePriorityForecastRequestQueue;
}

- (BOOL)loadSavedCitiesFromKVSOnly
{
  return self->_loadSavedCitiesFromKVSOnly;
}

- (BOOL)disableLimitReverseGeocoding
{
  return self->_disableLimitReverseGeocoding;
}

- (NSDictionary)config
{
  return self->_config;
}

- (int64_t)appConfigRefreshRate
{
  return self->_appConfigRefreshRate;
}

- (NSDate)lastModificationDate
{
  return self->_lastModificationDate;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (unint64_t)apiConfigModdedHash
{
  return self->_apiConfigModdedHash;
}

- (unint64_t)apiConfigMinRange
{
  return self->_apiConfigMinRange;
}

- (unint64_t)apiConfigMaxRange
{
  return self->_apiConfigMaxRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_lastModificationDate, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_appAnalyticsEndpointUrl, 0);
  objc_storeStrong((id *)&self->_widgetRefreshPolicy, 0);
  objc_storeStrong((id *)&self->_weatherEventsConfig, 0);
  objc_storeStrong((id *)&self->_aqiEnabledCountryCodes, 0);
  objc_storeStrong((id *)&self->_apiVersionFallback, 0);
  objc_storeStrong((id *)&self->_apiVersion, 0);
}

- (void)getAPIVersionFromDictionary:(uint64_t)a3 userID:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21189A000, a2, a3, "no apiVersion dictionary to parse, use default source: %@", a5, a6, a7, a8, 2u);
}

- (void)getAPIVersionFromDictionary:(uint64_t)a3 userID:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21189A000, a2, a3, "user did not fall in any range, use default source: %@", a5, a6, a7, a8, 2u);
}

- (void)getAPIVersionFromDictionary:(NSObject *)a3 userID:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "numberForKey:", CFSTR("minRange"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "numberForKey:", CFSTR("maxRange"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 2112;
  v13 = a2;
  _os_log_debug_impl(&dword_21189A000, a3, OS_LOG_TYPE_DEBUG, "user fell in range [%@,%@), use data source: %@", (uint8_t *)&v8, 0x20u);

}

- (void)isExpired
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "appConfigRefreshRate");
  OUTLINED_FUNCTION_1_0(&dword_21189A000, v1, v2, "The app config is still valid, seconds remaining: %f, refresh rate: %lld", v3, v4, v5, v6, 0);
}

@end
