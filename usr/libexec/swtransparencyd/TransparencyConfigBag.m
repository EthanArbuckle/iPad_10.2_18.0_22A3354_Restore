@implementation TransparencyConfigBag

- (unint64_t)getConfigBagEnvironment
{
  unint64_t result;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;

  result = -[TransparencyConfigBag configApp](self, "configApp");
  if (result == 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag swtSettings](self, "swtSettings"));
    v7 = (unint64_t)objc_msgSend(v6, "atEnvironment");

    if (v7 > 9)
      return 1;
    else
      return qword_1000DB5A0[v7];
  }
  else if (result == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag settings](self, "settings"));
    v5 = objc_msgSend(v4, "getEnvironment");

    return (unint64_t)v5;
  }
  return result;
}

- (id)configBagURL
{
  id v3;
  unint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint8_t v15[8];
  _QWORD v16[2];

  v3 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithString:", CFSTR("https://init-kt.apple.com/init/getBag"));
  v4 = -[TransparencyConfigBag currentEnvironment](self, "currentEnvironment");
  if (v4 == 2)
  {
    if (qword_10012A810 != -1)
      dispatch_once(&qword_10012A810, &stru_1001068D0);
    v7 = qword_10012A818;
    if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "requesting QA2 configuration bag", v15, 2u);
    }
    v6 = CFSTR("init-kt-qa2.ess.apple.com");
    goto LABEL_13;
  }
  if (v4 == 1)
  {
    if (qword_10012A810 != -1)
      dispatch_once(&qword_10012A810, &stru_1001068B0);
    v5 = qword_10012A818;
    if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "requesting QA1 configuration bag", v15, 2u);
    }
    v6 = CFSTR("init-kt-qa1.ess.apple.com");
LABEL_13:
    objc_msgSend(v3, "setHost:", v6);
  }
  v8 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("ix"), CFSTR("3"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag settings](self, "settings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "devicePlatform"));

  v11 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("p"), v10);
  v16[0] = v8;
  v16[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
  objc_msgSend(v3, "setQueryItems:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));
  return v13;
}

- (id)configBagFileName
{
  unint64_t v2;
  NSObject *v3;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v2 = -[TransparencyConfigBag currentEnvironment](self, "currentEnvironment");
  if (v2 == 2)
  {
    if (qword_10012A810 != -1)
      dispatch_once(&qword_10012A810, &stru_100106910);
    v5 = qword_10012A818;
    if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "using QA2 configuration bag", v6, 2u);
    }
    return CFSTR("KTConfig-qa2.plist");
  }
  else if (v2 == 1)
  {
    if (qword_10012A810 != -1)
      dispatch_once(&qword_10012A810, &stru_1001068F0);
    v3 = qword_10012A818;
    if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "using QA1 configuration bag", buf, 2u);
    }
    return CFSTR("KTConfig-qa1.plist");
  }
  else
  {
    return CFSTR("KTConfig.plist");
  }
}

- (id)configBagRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t v18[16];
  uint8_t buf[2];
  __int16 v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag configBagURL](self, "configBagURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag settings](self, "settings"));
  objc_msgSend(v4, "uiBlockingNetworkTimeout");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:](NSMutableURLRequest, "requestWithURL:cachePolicy:timeoutInterval:", v3, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag settings](self, "settings"));
  LODWORD(v4) = objc_msgSend(v6, "getBool:", kTransparencyFlagUseTestConfig);

  if ((_DWORD)v4)
  {
    objc_msgSend(v5, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-Test-Application"));
    if (qword_10012A810 != -1)
      dispatch_once(&qword_10012A810, &stru_100106930);
    v7 = qword_10012A818;
    if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_DEBUG))
    {
      v20 = 0;
      v8 = "requesting test configuration bag";
      v9 = (uint8_t *)&v20;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, v8, v9, 2u);
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag settings](self, "settings"));
    v11 = objc_msgSend(v10, "allowsInternalSecurityPolicies");

    if (v11)
    {
      objc_msgSend(v5, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("x-internal"));
      if (qword_10012A810 != -1)
        dispatch_once(&qword_10012A810, &stru_100106950);
      v7 = qword_10012A818;
      if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v8 = "requesting carry configuration bag";
        v9 = buf;
        goto LABEL_11;
      }
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag settings](self, "settings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "transparencyVersionStr"));
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v13, off_1001266B8);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag settings](self, "settings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "automatedDeviceGroup"));

  if (v15)
    objc_msgSend(v5, "setValue:forHTTPHeaderField:", v15, off_1001266B0);
  if ((id)-[TransparencyConfigBag configApp](self, "configApp") == (id)2
    && !-[TransparencyConfigBag currentEnvironment](self, "currentEnvironment"))
  {
    objc_msgSend(v5, "_setPrivacyProxyFailClosed:", 1);
    if (qword_10012A810 != -1)
      dispatch_once(&qword_10012A810, &stru_100106970);
    v16 = qword_10012A818;
    if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Enforcing privacy proxy", v18, 2u);
    }
  }

  return v5;
}

- (void)getSettings
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencySettings getOverride:](TransparencySettings, "getOverride:", kTransparencyOverrideReversePushPercentage));
  v5 = objc_opt_class(NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    v6 = objc_msgSend(v3, "unsignedIntegerValue");
    if ((unint64_t)v6 <= 0x64)
    {
      v7 = v6;
      if (qword_10012A810 != -1)
        dispatch_once(&qword_10012A810, &stru_100106990);
      v8 = qword_10012A818;
      if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 134217984;
        v10 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Overriding bag reverse push percentage with %lu", (uint8_t *)&v9, 0xCu);
      }
      -[TransparencyConfigBag setOverrideReversePushConfig:](self, "setOverrideReversePushConfig:", 1);
      -[TransparencyConfigBag setOverrideReversePushPercentage:](self, "setOverrideReversePushPercentage:", v7);
    }
  }

}

- (TransparencyConfigBag)initWithRequiredKeys:(id)a3 settings:(id)a4 directory:(id)a5 configApp:(unint64_t)a6 swtSettings:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  TransparencyConfigBag *v16;
  TransparencyConfigBag *v17;
  TransparencyConfigBag *v18;
  void *v19;
  uint64_t v20;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)TransparencyConfigBag;
  v16 = -[TransparencyConfigBag init](&v22, "init");
  v17 = v16;
  if (!v16)
    goto LABEL_6;
  -[TransparencyConfigBag getSettings](v16, "getSettings");
  -[TransparencyConfigBag setSettings:](v17, "setSettings:", v13);
  -[TransparencyConfigBag setConfigApp:](v17, "setConfigApp:", a6);
  if (a6 != 2 || v15)
  {
    -[TransparencyConfigBag setSwtSettings:](v17, "setSwtSettings:", v15);
    -[TransparencyConfigBag setCurrentEnvironment:](v17, "setCurrentEnvironment:", -[TransparencyConfigBag getConfigBagEnvironment](v17, "getConfigBagEnvironment"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v12));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_opt_class(NSNumber, v20), CFSTR("bag-expiry-timestamp"));
    -[TransparencyConfigBag setRequiredKeys:](v17, "setRequiredKeys:", v19);
    -[TransparencyConfigBag setDirectory:](v17, "setDirectory:", v14);

LABEL_6:
    v18 = v17;
    goto LABEL_7;
  }
  v18 = 0;
LABEL_7:

  return v18;
}

- (TransparencyConfigBag)initWithRequiredKeys:(id)a3 settings:(id)a4 directory:(id)a5 configApp:(unint64_t)a6
{
  return -[TransparencyConfigBag initWithRequiredKeys:settings:directory:configApp:swtSettings:](self, "initWithRequiredKeys:settings:directory:configApp:swtSettings:", a3, a4, a5, a6, 0);
}

- (unint64_t)percentageForKey:(id)a3
{
  unint64_t result;

  result = -[TransparencyConfigBag uintegerForKey:](self, "uintegerForKey:", a3);
  if (result >= 0x64)
    return 100;
  return result;
}

- (unint64_t)uintegerForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag config](self, "config"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  v8 = objc_opt_class(NSNumber, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0
    || ((unint64_t)objc_msgSend(v6, "integerValue") & 0x8000000000000000) != 0)
  {
    v9 = 0;
  }
  else
  {
    v9 = objc_msgSend(v6, "unsignedIntegerValue");
  }

  return (unint64_t)v9;
}

- (id)stringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag config](self, "config"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  v8 = objc_opt_class(NSString, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    v9 = v6;
  else
    v9 = 0;

  return v9;
}

- (id)urlForKey:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag stringForKey:](self, "stringForKey:", a3));
  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));
  else
    v4 = 0;

  return v4;
}

- (double)doubleForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag config](self, "config"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  v8 = objc_opt_class(NSNumber, v7);
  v9 = 0.0;
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    objc_msgSend(v6, "doubleValue");
    v9 = v10;
  }

  return v9;
}

- (id)checkMissingBagKeys:(id)a3 keys:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v13, (_QWORD)v16));

        if (!v14)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)checkBagKeyClass:(id)a3 keys:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  char isKindOfClass;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v13, (_QWORD)v17));
        isKindOfClass = objc_opt_isKindOfClass(v14, objc_msgSend(v8, "objectForKeyedSubscript:", v13));

        if ((isKindOfClass & 1) == 0)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

- (BOOL)validateConfigEntries:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag requiredKeys](self, "requiredKeys"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag checkMissingBagKeys:keys:](self, "checkMissingBagKeys:keys:", v6, v7));

  if (objc_msgSend(v8, "count"))
  {
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -114, CFSTR("Missing required field in config bag data")));
    if (qword_10012A810 != -1)
      dispatch_once(&qword_10012A810, &stru_1001069B0);
    v9 = (void *)qword_10012A818;
    if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", CFSTR(",")));
      v20 = 138412290;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Missing required field in config bag data: %@", (uint8_t *)&v20, 0xCu);

    }
    v12 = 0;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag requiredKeys](self, "requiredKeys"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag checkBagKeyClass:keys:](self, "checkBagKeyClass:keys:", v6, v13));

    v15 = objc_msgSend(v14, "count");
    v12 = v15 == 0;
    if (v15)
    {
      if (a4)
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -115, CFSTR("Required field has unexpected class")));
      if (qword_10012A810 != -1)
        dispatch_once(&qword_10012A810, &stru_1001069D0);
      v16 = (void *)qword_10012A818;
      if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_ERROR))
      {
        v17 = v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsJoinedByString:", CFSTR(",")));
        v20 = 138412290;
        v21 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Required field has unexpected class: %@", (uint8_t *)&v20, 0xCu);

      }
    }

  }
  return v12;
}

- (BOOL)processConfigBagData:(id)a3 error:(id *)a4
{
  void *v6;
  BOOL v7;
  void *v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", a3, 0, 0, a4));
  if (v6 && -[TransparencyConfigBag validateConfigEntries:error:](self, "validateConfigEntries:error:", v6, a4))
  {
    v7 = 1;
    -[TransparencyConfigBag setConfigured:](self, "setConfigured:", 1);
    -[TransparencyConfigBag setCurrentEnvironment:](self, "setCurrentEnvironment:", -[TransparencyConfigBag getConfigBagEnvironment](self, "getConfigBagEnvironment"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bag-expiry-timestamp")));
    -[TransparencyConfigBag setExpirationTime:](self, "setExpirationTime:", (double)(uint64_t)objc_msgSend(v8, "longLongValue"));

    -[TransparencyConfigBag setConfig:](self, "setConfig:", v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)validateConfigBagCertificates:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  BOOL v10;
  unint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  const void *AppleIDSService;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  int v21;
  id v22;
  void *v23;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag settings](self, "settings"));
  if ((objc_msgSend(v7, "allowsInternalSecurityPolicies") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag settings](self, "settings"));
    v9 = objc_msgSend(v8, "getBool:", kTransparencyFlagDisableVerifyBagCertificate);

    if ((v9 & 1) != 0)
    {
      v10 = 1;
      goto LABEL_30;
    }
  }
  else
  {

  }
  if (objc_msgSend(v6, "count"))
  {
    v11 = -[TransparencyConfigBag currentEnvironment](self, "currentEnvironment");
    v12 = CFSTR("init-kt.apple.com");
    if (v11 == 2)
      v12 = CFSTR("init-kt-qa2.ess.apple.com");
    if (v11 == 1)
      v13 = CFSTR("init-kt-qa1.ess.apple.com");
    else
      v13 = v12;
    AppleIDSService = (const void *)SecPolicyCreateAppleIDSService(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
    v23 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    v10 = +[TransparencyCertificateHelper verifyCertificates:intermediates:policy:error:](TransparencyCertificateHelper, "verifyCertificates:intermediates:policy:error:", v16, v6, AppleIDSService, a4);

    if (!v10)
    {
      if (a4)
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -28, *a4, CFSTR("bag certificates failed trust evaluation")));
      if (qword_10012A810 != -1)
        dispatch_once(&qword_10012A810, &stru_100106A10);
      v17 = qword_10012A818;
      if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_ERROR))
      {
        if (a4)
          v18 = *a4;
        else
          v18 = 0;
        v21 = 138412290;
        v22 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "bag certificates failed trust evaluation: %@", (uint8_t *)&v21, 0xCu);
      }
    }
    if (AppleIDSService)
      CFRelease(AppleIDSService);
  }
  else
  {
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -113, CFSTR("Config bag missing certificates")));
    if (qword_10012A810 != -1)
      dispatch_once(&qword_10012A810, &stru_1001069F0);
    v19 = qword_10012A818;
    if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Config bag missing certificates", (uint8_t *)&v21, 2u);
    }
    v10 = 0;
  }
LABEL_30:

  return v10;
}

- (BOOL)validateConfigBagSignature:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __SecCertificate *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  int v24;
  id v25;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag settings](self, "settings"));
  if ((objc_msgSend(v7, "allowsInternalSecurityPolicies") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag settings](self, "settings"));
    v9 = objc_msgSend(v8, "getBool:", kTransparencyFlagDisableVerifyBagSignature);

    if ((v9 & 1) != 0)
    {
      v10 = 1;
      goto LABEL_38;
    }
  }
  else
  {

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bag")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("signature")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("certs")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));
  v15 = +[TransparencyCertificateHelper certificateFromData:error:](TransparencyCertificateHelper, "certificateFromData:error:", v14, a4);

  if (v15)
  {
    v16 = (void *)SecCertificateCopySubjectPublicKeyInfoSHA256Digest(v15);
    if (v16)
    {
      v17 = +[TransparencyCertificateHelper copyTrustedKeysFromDataArray:error:](TransparencyCertificateHelper, "copyTrustedKeysFromDataArray:error:", v13, a4);
      if (v17)
      {
        v10 = +[TransparencySignatureVerifier verifyMessage:signature:spkiHash:trustedKeys:algorithm:error:](TransparencySignatureVerifier, "verifyMessage:signature:spkiHash:trustedKeys:algorithm:error:", v11, v12, v16, v17, kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA256, a4);
        if (!v10)
        {
          if (qword_10012A810 != -1)
            dispatch_once(&qword_10012A810, &stru_100106A90);
          v18 = qword_10012A818;
          if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_ERROR))
          {
            if (a4)
              v19 = *a4;
            else
              v19 = 0;
            v24 = 138412290;
            v25 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Config bag signature verification failed: %@", (uint8_t *)&v24, 0xCu);
          }
        }
      }
      else
      {
        if (a4)
          *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -7, CFSTR("Failed to decode certs in bag")));
        if (qword_10012A810 != -1)
          dispatch_once(&qword_10012A810, &stru_100106A70);
        v22 = qword_10012A818;
        if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v24) = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to decode certs in bag", (uint8_t *)&v24, 2u);
        }
        v10 = 0;
      }
      CFRelease(v15);

    }
    else
    {
      if (a4)
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -30, CFSTR("Failed to get SPKI hash from cert")));
      if (qword_10012A810 != -1)
        dispatch_once(&qword_10012A810, &stru_100106A50);
      v21 = qword_10012A818;
      if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to get SPKI hash from cert", (uint8_t *)&v24, 2u);
      }
      CFRelease(v15);
      v10 = 0;
    }

  }
  else
  {
    if (qword_10012A810 != -1)
      dispatch_once(&qword_10012A810, &stru_100106A30);
    v20 = qword_10012A818;
    if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "failed to decode config bag leaf cert", (uint8_t *)&v24, 2u);
    }
    v10 = 0;
  }

LABEL_38:
  return v10;
}

- (BOOL)validateConfigBagEntries:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  BOOL v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  const char *ClassName;
  void *v35;
  NSObject *v36;
  const char *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  const char *v45;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bag")));
  v9 = objc_opt_class(NSData, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("certs")));
    v12 = objc_opt_class(NSArray, v11);
    if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0 && objc_msgSend(v10, "count"))
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v38 = v10;
      v13 = v10;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v14)
      {
        v16 = v14;
        v17 = *(_QWORD *)v40;
        while (2)
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(_QWORD *)v40 != v17)
              objc_enumerationMutation(v13);
            v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
            v20 = objc_opt_class(NSData, v15);
            if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0)
            {
              if (a4)
                *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -114, CFSTR("cert wrong type")));
              v10 = v38;
              if (qword_10012A810 != -1)
                dispatch_once(&qword_10012A810, &stru_100106AF0);
              v31 = (void *)qword_10012A818;
              if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_ERROR))
              {
                v32 = v31;
                ClassName = object_getClassName(v19);
                *(_DWORD *)buf = 136315138;
                v45 = ClassName;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "cert wrong type): %s", buf, 0xCu);

              }
              goto LABEL_35;
            }
          }
          v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
          if (v16)
            continue;
          break;
        }
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("signature")));
      v23 = objc_opt_class(NSData, v22);
      if ((objc_opt_isKindOfClass(v21, v23) & 1) != 0)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("certs")));
        v25 = -[TransparencyConfigBag validateConfigBagCertificates:error:](self, "validateConfigBagCertificates:error:", v24, a4);

        if (v25)
          v26 = -[TransparencyConfigBag validateConfigBagSignature:error:](self, "validateConfigBagSignature:error:", v6, a4);
        else
          v26 = 0;
        v10 = v38;
      }
      else
      {
        if (a4)
          *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -114, CFSTR("sigature missing required field or type")));
        if (qword_10012A810 != -1)
          dispatch_once(&qword_10012A810, &stru_100106B10);
        v10 = v38;
        v35 = (void *)qword_10012A818;
        if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_ERROR))
        {
          v36 = v35;
          v37 = object_getClassName(v21);
          *(_DWORD *)buf = 136315138;
          v45 = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "sigature bag missing (or wrong type): %s", buf, 0xCu);

        }
        v26 = 0;
      }

    }
    else
    {
      if (a4)
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -114, CFSTR("certs missing required field or type")));
      if (qword_10012A810 != -1)
        dispatch_once(&qword_10012A810, &stru_100106AD0);
      v29 = (void *)qword_10012A818;
      if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_ERROR))
      {
        v30 = v29;
        *(_DWORD *)buf = 136315138;
        v45 = object_getClassName(v10);
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "certs bag missing (or wrong type): %s", buf, 0xCu);

      }
LABEL_35:
      v26 = 0;
    }

  }
  else
  {
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -114, CFSTR("bag missing required field or type")));
    if (qword_10012A810 != -1)
      dispatch_once(&qword_10012A810, &stru_100106AB0);
    v27 = (void *)qword_10012A818;
    if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_ERROR))
    {
      v28 = v27;
      *(_DWORD *)buf = 136315138;
      v45 = object_getClassName(v7);
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "bag missing (or wrong type): %s", buf, 0xCu);

    }
    v26 = 0;
  }

  return v26;
}

- (BOOL)configureFromNetworkBagData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  TransparencyConfigBag *v8;
  void *v9;
  unsigned int v10;
  unsigned __int8 v11;
  id v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v6, 0, 0, a4));
  v8 = self;
  objc_sync_enter(v8);
  if (v7 && -[TransparencyConfigBag validateConfigBagEntries:error:](v8, "validateConfigBagEntries:error:", v7, a4))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bag")));
    v10 = -[TransparencyConfigBag processConfigBagData:error:](v8, "processConfigBagData:error:", v9, a4);

    if (v10)
    {
      v15 = 0;
      v11 = -[TransparencyConfigBag writeConfigToDisk:error:](v8, "writeConfigToDisk:error:", v7, &v15);
      v12 = v15;
      if ((v11 & 1) == 0)
      {
        if (qword_10012A810 != -1)
          dispatch_once(&qword_10012A810, &stru_100106B30);
        v13 = qword_10012A818;
        if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to write config bag to disk: %@", buf, 0xCu);
        }
      }

    }
    objc_sync_exit(v8);

  }
  else
  {
    objc_sync_exit(v8);

    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)configurationExpired
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v11;
  uint64_t v12;

  +[NSDate kt_currentTimeMs](NSDate, "kt_currentTimeMs");
  v4 = v3;
  -[TransparencyConfigBag expirationTime](self, "expirationTime");
  v6 = v5;
  if (v4 > v5)
  {
    if (qword_10012A810 != -1)
      dispatch_once(&qword_10012A810, &stru_100106B50);
    v7 = (void *)qword_10012A818;
    if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      -[TransparencyConfigBag expirationTime](self, "expirationTime");
      v11 = 134217984;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Configuration bag expired at %f", (uint8_t *)&v11, 0xCu);

    }
    -[TransparencyConfigBag setConfigured:](self, "setConfigured:", 0);
  }
  return v4 > v6;
}

- (id)readConfigFromDisk:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  id v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag configBagFileName](self, "configBagFileName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag directory](self, "directory"));
  v12 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyFileSupport readDictionaryFromFile:inDirectory:error:](TransparencyFileSupport, "readDictionaryFromFile:inDirectory:error:", v5, v6, &v12));
  v8 = v12;

  if (v7)
    v9 = 1;
  else
    v9 = a3 == 0;
  if (!v9 && v8 != 0)
    *a3 = objc_retainAutorelease(v8);

  return v7;
}

- (BOOL)writeConfigToDisk:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag configBagFileName](self, "configBagFileName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag directory](self, "directory"));
  LOBYTE(a4) = +[TransparencyFileSupport writeDictionaryToFile:fileName:inDirectory:error:](TransparencyFileSupport, "writeDictionaryToFile:fileName:inDirectory:error:", v6, v7, v8, a4);

  return (char)a4;
}

- (BOOL)configureWithDisk:(id *)a3
{
  void *v5;
  void *v6;
  BOOL v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag readConfigFromDisk:](self, "readConfigFromDisk:"));
  if (v5 && -[TransparencyConfigBag validateConfigBagEntries:error:](self, "validateConfigBagEntries:error:", v5, a3))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bag")));
    v7 = -[TransparencyConfigBag processConfigBagData:error:](self, "processConfigBagData:error:", v6, a3);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)configureFromNetworkWithFetcher:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag configBagRequest](self, "configBagRequest"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100018F24;
  v10[3] = &unk_100106B78;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "fetchConfigBag:completionHandler:", v8, v10);

}

- (void)configureWithFetcher:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  TransparencyConfigBag *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = -[TransparencyConfigBag getConfigBagEnvironment](self, "getConfigBagEnvironment");
  if (-[TransparencyConfigBag configured](self, "configured")
    && (void *)-[TransparencyConfigBag currentEnvironment](self, "currentEnvironment") == v8
    && (v6 || !-[TransparencyConfigBag configurationExpired](self, "configurationExpired")))
  {
    if (-[TransparencyConfigBag configurationExpired](self, "configurationExpired"))
    {
      if (qword_10012A810 != -1)
        dispatch_once(&qword_10012A810, &stru_100106B98);
      v14 = qword_10012A818;
      if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Configuration already loaded, but need to kick off config bag fetch because configuration expired", buf, 2u);
      }
      objc_msgSend(v6, "triggerConfigBagFetch:", 0.0);
    }
    v7[2](v7, 0);
  }
  else
  {
    v9 = self;
    objc_sync_enter(v9);
    v16 = 0;
    v10 = -[TransparencyConfigBag configureWithDisk:](v9, "configureWithDisk:", &v16);
    v11 = v16;
    if (!v10)
      goto LABEL_13;
    if (-[TransparencyConfigBag configurationExpired](v9, "configurationExpired"))
    {
      if (qword_10012A810 != -1)
        dispatch_once(&qword_10012A810, &stru_100106BB8);
      v12 = qword_10012A818;
      if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Configuration loaded from disk, but need to kick off config bag fetch because configuration expired", buf, 2u);
      }
      objc_msgSend(v6, "triggerConfigBagFetch:", 0.0);
    }
    if (!v11)
    {
      if (qword_10012A810 != -1)
        dispatch_once(&qword_10012A810, &stru_100106BD8);
      v15 = qword_10012A818;
      if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Loaded configuration bag from disk", buf, 2u);
      }
      v7[2](v7, 0);
      objc_sync_exit(v9);

    }
    else
    {
LABEL_13:

      objc_sync_exit(v9);
      if (qword_10012A810 != -1)
        dispatch_once(&qword_10012A810, &stru_100106BF8);
      v13 = qword_10012A818;
      if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating configuration from network", buf, 2u);
      }
      -[TransparencyConfigBag configureFromNetworkWithFetcher:completionHandler:](v9, "configureFromNetworkWithFetcher:completionHandler:", v6, v7);
    }
  }

}

- (id)copyConfigurationBag:(id *)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag readConfigFromDisk:](self, "readConfigFromDisk:"));
  if (v5 && -[TransparencyConfigBag validateConfigBagEntries:error:](self, "validateConfigBagEntries:error:", v5, a3))
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (void)clearState:(id *)a3
{
  TransparencyConfigBag *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;

  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag configBagFileName](v4, "configBagFileName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag directory](v4, "directory"));
  v7 = +[TransparencyFileSupport deleteFile:inDirectory:error:](TransparencyFileSupport, "deleteFile:inDirectory:error:", v5, v6, a3);

  if ((v7 & 1) != 0)
  {
    -[TransparencyConfigBag setConfigured:](v4, "setConfigured:", 0);
    -[TransparencyConfigBag setExpirationTime:](v4, "setExpirationTime:", 0.0);
    -[TransparencyConfigBag setConfig:](v4, "setConfig:", 0);
  }
  else
  {
    if (qword_10012A810 != -1)
      dispatch_once(&qword_10012A810, &stru_100106C18);
    v8 = qword_10012A818;
    if (os_log_type_enabled((os_log_t)qword_10012A818, OS_LOG_TYPE_ERROR))
    {
      if (a3)
        v9 = *a3;
      else
        v9 = 0;
      v10 = 138412290;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to delete KTLogClient configuration state: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  objc_sync_exit(v4);

}

- (BOOL)tapToRadarEnabled
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag config](self, "config"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ttr-enabled")));

  v5 = objc_opt_class(NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    v6 = objc_msgSend(v3, "BOOLValue");
  else
    v6 = 1;

  return v6;
}

- (NSString)swtCFUDetailsURL
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyConfigBag config](self, "config"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("swt-cfu-url")));

  v5 = objc_opt_class(NSString, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    v6 = v3;
  else
    v6 = 0;

  return (NSString *)v6;
}

- (BOOL)configured
{
  return self->_configured;
}

- (void)setConfigured:(BOOL)a3
{
  self->_configured = a3;
}

- (unint64_t)currentEnvironment
{
  return self->_currentEnvironment;
}

- (void)setCurrentEnvironment:(unint64_t)a3
{
  self->_currentEnvironment = a3;
}

- (unint64_t)overrideReversePushPercentage
{
  return self->_overrideReversePushPercentage;
}

- (void)setOverrideReversePushPercentage:(unint64_t)a3
{
  self->_overrideReversePushPercentage = a3;
}

- (BOOL)overrideReversePushConfig
{
  return self->_overrideReversePushConfig;
}

- (void)setOverrideReversePushConfig:(BOOL)a3
{
  self->_overrideReversePushConfig = a3;
}

- (NSURL)directory
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDirectory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (double)expirationTime
{
  return self->_expirationTime;
}

- (void)setExpirationTime:(double)a3
{
  self->_expirationTime = a3;
}

- (NSDictionary)config
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (SWTSettingsProtocol)swtSettings
{
  return (SWTSettingsProtocol *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSwtSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSDictionary)requiredKeys
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRequiredKeys:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (unint64_t)configApp
{
  return self->_configApp;
}

- (void)setConfigApp:(unint64_t)a3
{
  self->_configApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredKeys, 0);
  objc_storeStrong((id *)&self->_swtSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_directory, 0);
}

@end
