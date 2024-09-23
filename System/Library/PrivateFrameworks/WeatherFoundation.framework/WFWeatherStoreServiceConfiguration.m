@implementation WFWeatherStoreServiceConfiguration

+ (id)defaultConfigurationWithSourceBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHTTPShouldUsePipelining:", 1);
  objc_msgSend(v5, "setTimeoutIntervalForRequest:", 30.0);
  v12 = CFSTR("User-Agent");
  +[WFWeatherStoreServiceConfiguration generateUserAgent](WFWeatherStoreServiceConfiguration, "generateUserAgent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHTTPAdditionalHeaders:", v7);

  if (v3)
    objc_msgSend(v5, "set_sourceApplicationBundleIdentifier:", v3);
  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:delegate:delegateQueue:", v5, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSession:", v8);

  objc_msgSend(MEMORY[0x24BDBCF48], "wf_inMemoryAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCacheURL:", v9);

  +[WFSettingsManager sharedInstance](WFSettingsManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSettingsManager:", v10);

  return v4;
}

+ (id)defaultConfiguration
{
  return (id)objc_msgSend((id)objc_opt_class(), "defaultConfigurationWithSourceBundleIdentifier:", 0);
}

- (WFWeatherStoreServiceConfiguration)init
{
  WFWeatherStoreServiceConfiguration *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFWeatherStoreServiceConfiguration;
  v2 = -[WFWeatherStoreServiceConfiguration init](&v4, sel_init);
  if (v2)
  {
    -[WFWeatherStoreServiceConfiguration setCacheClass:](v2, "setCacheClass:", objc_opt_class());
    -[WFWeatherStoreServiceConfiguration setServiceConnectivityEvaluationURLLock:](v2, "setServiceConnectivityEvaluationURLLock:", 0);
    -[WFWeatherStoreServiceConfiguration setServiceConnectivityEvaluatorLock:](v2, "setServiceConnectivityEvaluatorLock:", 0);
  }
  return v2;
}

- (void)invalidate
{
  id v2;

  -[WFWeatherStoreServiceConfiguration session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateAndCancel");

}

- (NSString)apiVersion
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  -[WFWeatherStoreServiceConfiguration settingsManager](self, "settingsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "APIVersion");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("wds_v1");
  v5 = v3;

  return v5;
}

- (id)apiConfiguration
{
  void *v3;
  void *v4;

  -[WFWeatherStoreServiceConfiguration apiVersion](self, "apiVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWeatherStoreServiceConfiguration apiConfigurationForAPIVersion:](self, "apiConfigurationForAPIVersion:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)apiConfigurationForAPIVersion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  +[WFAPIConfigurationFactory configurationForAPIVersion:](WFAPIConfigurationFactory, "configurationForAPIVersion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[WFWeatherStoreServiceConfiguration serviceConnectivityEvaluationURL](self, "serviceConnectivityEvaluationURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hostUrl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      objc_msgSend(v4, "hostUrl");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWeatherStoreServiceConfiguration setServiceConnectivityEvaluationURL:](self, "setServiceConnectivityEvaluationURL:", v8);

    }
  }
  return v4;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  BOOL v5;

  -[WFWeatherStoreServiceConfiguration apiConfiguration](self, "apiConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isValid") && -[WFWeatherStoreServiceConfiguration cacheClass](self, "cacheClass"))
  {
    -[WFWeatherStoreServiceConfiguration session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)forecastRequestForTypes:(unint64_t)a3 location:(id)a4 date:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  -[WFWeatherStoreServiceConfiguration apiVersion](self, "apiVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWeatherStoreServiceConfiguration forecastRequestForTypes:location:date:apiVersion:error:](self, "forecastRequestForTypes:location:date:apiVersion:error:", a3, v11, v10, v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)forecastRequestForTypes:(unint64_t)a3 location:(id)a4 date:(id)a5 apiVersion:(id)a6 error:(id *)a7
{
  return -[WFWeatherStoreServiceConfiguration forecastRequestForTypes:location:units:date:apiVersion:error:](self, "forecastRequestForTypes:location:units:date:apiVersion:error:", a3, a4, 0, a5, a6, a7);
}

- (id)forecastRequestForTypes:(unint64_t)a3 location:(id)a4 units:(int)a5 date:(id)a6 apiVersion:(id)a7 error:(id *)a8
{
  return -[WFWeatherStoreServiceConfiguration forecastRequestForTypes:location:units:date:apiVersion:error:requestOptions:](self, "forecastRequestForTypes:location:units:date:apiVersion:error:requestOptions:", a3, a4, *(_QWORD *)&a5, a6, a7, a8, 0);
}

- (id)forecastRequestForTypes:(unint64_t)a3 location:(id)a4 units:(int)a5 date:(id)a6 apiVersion:(id)a7 error:(id *)a8 requestOptions:(id)a9
{
  uint64_t v12;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  WFRequestFormattingRules *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  WFRequestFormattingRules *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v33;
  id v34;

  v12 = *(_QWORD *)&a5;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a9;
  v19 = WFForecastTypesUnknownTypes(a3);
  if (v19)
  {
    if (a8)
      goto LABEL_3;
    v30 = v19;
    WFLogForCategory(0);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[WFWeatherStoreServiceConfiguration forecastRequestForTypes:location:units:date:apiVersion:error:requestOptions:].cold.2(a3, v30, v31);

LABEL_9:
    v20 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v15, "geoLocation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = [WFRequestFormattingRules alloc];
    -[WFWeatherStoreServiceConfiguration settingsManager](self, "settingsManager");
    v34 = v15;
    v23 = v18;
    v24 = v17;
    v25 = v16;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "settings");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[WFRequestFormattingRules initWithSettings:](v22, "initWithSettings:", v27);

    v16 = v25;
    v17 = v24;
    v18 = v23;
    v15 = v34;
    -[WFWeatherStoreServiceConfiguration apiConfigurationForAPIVersion:](self, "apiConfigurationForAPIVersion:", v17);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "forecastRequestForTypes:location:units:date:error:rules:options:", a3, v34, v12, v16, a8, v28, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  WFLogForCategory(2uLL);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    -[WFWeatherStoreServiceConfiguration forecastRequestForTypes:location:units:date:apiVersion:error:requestOptions:].cold.1((uint64_t)v15, v33);

  if (!a8)
    goto LABEL_9;
LABEL_3:
  objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 5);
  v20 = 0;
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v20;
}

- (id)parseForecast:(unint64_t)a3 data:(id)a4 location:(id)a5 units:(int)a6 locale:(id)a7 date:(id)a8 error:(id *)a9
{
  uint64_t v10;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;

  v10 = *(_QWORD *)&a6;
  v15 = a8;
  v16 = a7;
  v17 = a5;
  v18 = a4;
  -[WFWeatherStoreServiceConfiguration apiVersion](self, "apiVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWeatherStoreServiceConfiguration parseForecast:data:location:units:locale:date:apiVersion:error:](self, "parseForecast:data:location:units:locale:date:apiVersion:error:", a3, v18, v17, v10, v16, v15, v19, a9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)parseForecast:(unint64_t)a3 data:(id)a4 location:(id)a5 units:(int)a6 locale:(id)a7 date:(id)a8 apiVersion:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  WFResponseParsingRules *v20;
  void *v21;
  void *v22;
  WFResponseParsingRules *v23;
  void *v24;
  void *v25;

  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a5;
  v19 = a4;
  v20 = [WFResponseParsingRules alloc];
  -[WFWeatherStoreServiceConfiguration settingsManager](self, "settingsManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "settings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[WFResponseParsingRules initWithSettings:](v20, "initWithSettings:", v22);

  -[WFWeatherStoreServiceConfiguration apiConfigurationForAPIVersion:](self, "apiConfigurationForAPIVersion:", v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "parseForecast:data:location:units:locale:date:error:rules:", a3, v19, v18, a6, v17, v16, a10, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)aqiScaleRequestForScaleNamed:(id)a3 language:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a3;
  -[WFWeatherStoreServiceConfiguration apiVersion](self, "apiVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWeatherStoreServiceConfiguration apiConfigurationForAPIVersion:](self, "apiConfigurationForAPIVersion:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "aqiRequestForScaleNamed:language:", v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)parseAQIScaleNamed:(id)a3 data:(id)a4 apiVersion:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v9 = a4;
  v10 = a3;
  -[WFWeatherStoreServiceConfiguration apiVersion](self, "apiVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWeatherStoreServiceConfiguration apiConfigurationForAPIVersion:](self, "apiConfigurationForAPIVersion:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "parseAQIScaleNamed:data:error:", v10, v9, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  WFNetworkEvent *v37;
  void *v38;
  WFNetworkEvent *v39;
  void *v40;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  v7 = a4;
  objc_msgSend(v6, "transactionMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v7, "response");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "host");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "response");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@%@"), v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "taskInterval");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "requestEndDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestStartDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceDate:", v20);
  v22 = v21;

  objc_msgSend(v9, "responseEndDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "responseStartDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "timeIntervalSinceDate:", v24);
  v26 = v25;

  objc_msgSend(v9, "secureConnectionEndDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "secureConnectionStartDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "timeIntervalSinceDate:", v28);
  v30 = v29;

  objc_msgSend(v9, "domainLookupEndDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "domainLookupStartDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "timeIntervalSinceDate:", v32);
  v34 = v33;

  WFLogForCategory(8uLL);
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138479107;
    v43 = v17;
    v44 = 2114;
    v45 = v18;
    v46 = 2048;
    v47 = v22;
    v48 = 2048;
    v49 = v26;
    v50 = 2048;
    v51 = v30;
    v52 = 2048;
    v53 = v34;
    _os_log_impl(&dword_21189A000, v35, OS_LOG_TYPE_INFO, "Data fetched from: %{private}@, total time: %{public}@, request time: %f, response time: %f, TLS time:  %f, DNS time: %f", buf, 0x3Eu);
  }

  objc_msgSend(v9, "response");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v37 = [WFNetworkEvent alloc];
    -[WFWeatherStoreServiceConfiguration apiVersion](self, "apiVersion");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[WFNetworkEvent initWithEventType:metrics:](v37, "initWithEventType:metrics:", WFNetworkEventTypeFromAPIVersion(v38), v9);

    +[WFNetworkBehaviorMonitor sharedInstance](WFNetworkBehaviorMonitor, "sharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "logNetworkEvent:", v39);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_opt_class();
  v4 = (_QWORD *)objc_opt_new();
  -[WFWeatherStoreServiceConfiguration settingsManager](self, "settingsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSettingsManager:", v5);

  -[WFWeatherStoreServiceConfiguration session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSession:", v6);

  -[WFWeatherStoreServiceConfiguration cacheURL](self, "cacheURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCacheURL:", v7);

  -[WFWeatherStoreServiceConfiguration serviceConnectivityEvaluationURL](self, "serviceConnectivityEvaluationURL");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v4[3];
  v4[3] = v8;

  return v4;
}

- (NSURL)serviceConnectivityEvaluationURL
{
  os_unfair_lock_s *p_serviceConnectivityEvaluationURLLock;
  void *v4;

  p_serviceConnectivityEvaluationURLLock = &self->_serviceConnectivityEvaluationURLLock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSURL copy](self->_serviceConnectivityEvaluationURL, "copy");
  os_unfair_lock_unlock(p_serviceConnectivityEvaluationURLLock);
  return (NSURL *)v4;
}

- (void)setServiceConnectivityEvaluationURL:(id)a3
{
  os_unfair_lock_s *p_serviceConnectivityEvaluationURLLock;
  id v5;
  NSURL *v6;
  NSURL *serviceConnectivityEvaluationURL;

  p_serviceConnectivityEvaluationURLLock = &self->_serviceConnectivityEvaluationURLLock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  v6 = (NSURL *)objc_msgSend(v5, "copy");

  serviceConnectivityEvaluationURL = self->_serviceConnectivityEvaluationURL;
  self->_serviceConnectivityEvaluationURL = v6;

  os_unfair_lock_unlock(p_serviceConnectivityEvaluationURLLock);
}

+ (id)generateUserAgent
{
  void *v2;
  void *v3;
  const __CFDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BDBD1F0]));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v4);
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 531.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@_WeatherFoundation[%@]_%@"), v3, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isServiceAvailableSync
{
  os_unfair_lock_s *p_serviceConnectivityEvaluatorLock;
  NWPathEvaluator *serviceConnectivityEvaluator;
  void *v5;
  void *v6;
  NWPathEvaluator *v7;
  NWPathEvaluator *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  p_serviceConnectivityEvaluatorLock = &self->_serviceConnectivityEvaluatorLock;
  os_unfair_lock_lock_with_options();
  serviceConnectivityEvaluator = self->_serviceConnectivityEvaluator;
  if (serviceConnectivityEvaluator)
    goto LABEL_3;
  v5 = (void *)MEMORY[0x24BDE07E8];
  -[WFWeatherStoreServiceConfiguration serviceConnectivityEvaluationURL](self, "serviceConnectivityEvaluationURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wf_pathEvaluatorForURL:", v6);
  v7 = (NWPathEvaluator *)objc_claimAutoreleasedReturnValue();
  v8 = self->_serviceConnectivityEvaluator;
  self->_serviceConnectivityEvaluator = v7;

  serviceConnectivityEvaluator = self->_serviceConnectivityEvaluator;
  if (serviceConnectivityEvaluator)
  {
LABEL_3:
    -[NWPathEvaluator path](serviceConnectivityEvaluator, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "status");

    v11 = (v10 & 0xFFFFFFFFFFFFFFFDLL) == 1;
  }
  else
  {
    v11 = 0;
  }
  os_unfair_lock_unlock(p_serviceConnectivityEvaluatorLock);
  return v11;
}

- (NWPathEvaluator)serviceConnectivityEvaluator
{
  return self->_serviceConnectivityEvaluator;
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (void)setCacheURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (os_unfair_lock_s)serviceConnectivityEvaluationURLLock
{
  return self->_serviceConnectivityEvaluationURLLock;
}

- (void)setServiceConnectivityEvaluationURLLock:(os_unfair_lock_s)a3
{
  self->_serviceConnectivityEvaluationURLLock = a3;
}

- (os_unfair_lock_s)serviceConnectivityEvaluatorLock
{
  return self->_serviceConnectivityEvaluatorLock;
}

- (void)setServiceConnectivityEvaluatorLock:(os_unfair_lock_s)a3
{
  self->_serviceConnectivityEvaluatorLock = a3;
}

- (Class)cacheClass
{
  return self->_cacheClass;
}

- (void)setCacheClass:(Class)a3
{
  objc_storeStrong((id *)&self->_cacheClass, a3);
}

- (WFSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
{
  objc_storeStrong((id *)&self->_settingsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_cacheClass, 0);
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceConnectivityEvaluationURL, 0);
  objc_storeStrong((id *)&self->_serviceConnectivityEvaluator, 0);
}

- (void)forecastRequestForTypes:(uint64_t)a1 location:(NSObject *)a2 units:date:apiVersion:error:requestOptions:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21189A000, a2, OS_LOG_TYPE_ERROR, "Cannot format a forecast request without a geolocation: %@", (uint8_t *)&v2, 0xCu);
}

- (void)forecastRequestForTypes:(os_log_t)log location:units:date:apiVersion:error:requestOptions:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_error_impl(&dword_21189A000, log, OS_LOG_TYPE_ERROR, "Asked for forecast request for %lu, but it contains unknown types %lu.", (uint8_t *)&v3, 0x16u);
}

@end
