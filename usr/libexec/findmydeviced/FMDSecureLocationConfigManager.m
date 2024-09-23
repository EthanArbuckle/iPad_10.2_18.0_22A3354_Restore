@implementation FMDSecureLocationConfigManager

- (FMDSecureLocationConfigManager)init
{
  FMDSecureLocationConfigManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *policyManagerQueue;
  NSMutableDictionary *v5;
  NSMutableDictionary *policyExpirationTimes;
  NSMutableDictionary *v7;
  NSMutableDictionary *activePolicies;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  FMDSecureLocationConfig *activeConfig;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)FMDSecureLocationConfigManager;
  v2 = -[FMDSecureLocationConfigManager init](&v20, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("FMDSecureLocationConfigManagerPolicyUpdate", 0);
    policyManagerQueue = v2->_policyManagerQueue;
    v2->_policyManagerQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    policyExpirationTimes = v2->_policyExpirationTimes;
    v2->_policyExpirationTimes = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    activePolicies = v2->_activePolicies;
    v2->_activePolicies = v7;

    v9 = objc_alloc((Class)FMDataArchiver);
    v11 = objc_msgSend((id)objc_opt_class(v2, v10), "defaultStorageLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_msgSend(v9, "initWithFileURL:", v12);
    -[FMDSecureLocationConfigManager setDataArchiver:](v2, "setDataArchiver:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager dataArchiver](v2, "dataArchiver"));
    objc_msgSend(v14, "setDataProtectionClass:", 4);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager dataArchiver](v2, "dataArchiver"));
    objc_msgSend(v15, "setBackedUp:", 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager dataArchiver](v2, "dataArchiver"));
    objc_msgSend(v16, "setCreateDirectories:", 1);

    -[FMDSecureLocationConfigManager _readExistingConfigFile](v2, "_readExistingConfigFile");
    v17 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager configForPolicy:](v2, "configForPolicy:", kFMDSecureLocationModeBackgroundProactive));
    activeConfig = v2->_activeConfig;
    v2->_activeConfig = (FMDSecureLocationConfig *)v17;

  }
  return v2;
}

+ (id)defaultStorageLocation
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  int v8;
  const __CFString *v9;
  __int16 v10;
  void *v11;

  v2 = objc_alloc_init((Class)FMInternalFileContainer);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "url"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fm_preferencesPathURLForDomain:", CFSTR("com.apple.icloud.findmydeviced.secureLocations.config")));

  v5 = sub_10005318C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = CFSTR("SecureLocationConfig");
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ archiverURL %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(v4, "setResourceValue:forKey:error:", &__kCFBooleanTrue, NSURLIsExcludedFromBackupKey, 0);
  return v4;
}

- (void)_readExistingConfigFile
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager policyManagerQueue](self, "policyManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008BAD8;
  block[3] = &unk_1002C1328;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_archiveConfigFile:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager policyManagerQueue](self, "policyManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008BD50;
  v7[3] = &unk_1002C13E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)updateConfigData:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  _BOOL4 v14;

  v4 = a3;
  v5 = sub_10005318C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v12 = CFSTR("SecureLocationConfig");
    v13 = 1024;
    v14 = v4 != 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ Received updated config from server. Not nil %d", buf, 0x12u);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager policyManagerQueue](self, "policyManagerQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008BFB8;
  v9[3] = &unk_1002C13E8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

- (id)_dictionaryFromConfigData:(id)a3
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v9;

  v9 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", a3, 4, &v9));
  v4 = v9;
  if (v4)
  {
    v5 = sub_10005318C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10022BA60();

    v7 = 0;
  }
  else
  {
    v7 = v3;
  }

  return v7;
}

- (id)_parseConfigFile:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager _dictionaryFromConfigData:](self, "_dictionaryFromConfigData:", a3));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager _readConfigFromDictionary:](self, "_readConfigFromDictionary:", v4));
  }
  else
  {
    v6 = sub_10005318C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10022BACC(v7, v8, v9, v10, v11, v12, v13, v14);

    v5 = 0;
  }

  return v5;
}

- (id)_readConfigFromDictionary:(id)a3
{
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *publishPolicies;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  FMDSecureLocationConfig *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSMutableDictionary *v19;
  void *v20;
  id v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  NSMutableDictionary *v36;
  _BYTE v37[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("publishPolicies")));
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v4, "count")));
  publishPolicies = self->_publishPolicies;
  self->_publishPolicies = v5;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v12));
        v14 = -[FMDSecureLocationConfig initWithName:values:]([FMDSecureLocationConfig alloc], "initWithName:values:", v12, v13);
        -[NSMutableDictionary setObject:forKey:](self->_publishPolicies, "setObject:forKey:", v14, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v9);
  }

  v15 = sub_10005318C();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager publishPolicies](self, "publishPolicies"));
    v18 = objc_msgSend(v17, "count");
    v19 = self->_publishPolicies;
    *(_DWORD *)buf = 138412802;
    v32 = CFSTR("SecureLocationConfig");
    v33 = 2048;
    v34 = v18;
    v35 = 2112;
    v36 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ Read %lu policies from config. Policies %@", buf, 0x20u);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_publishPolicies, "objectForKeyedSubscript:", kFMDSecureLocationModeBackgroundProactive));
  v21 = sub_10005318C();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "policyName"));
      *(_DWORD *)buf = 138412546;
      v32 = CFSTR("SecureLocationConfig");
      v33 = 2112;
      v34 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@ Setting defaultPolicy %@", buf, 0x16u);

    }
    v25 = v20;
  }
  else
  {
    if (v23)
    {
      *(_DWORD *)buf = 138412290;
      v32 = CFSTR("SecureLocationConfig");
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@ Failed to read policy from config data", buf, 0xCu);
    }

  }
  return v20;
}

- (id)configForPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  FMDSecureLocationConfig *v10;
  FMDSecureLocationConfig *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  __CFString **v16;
  int v18;
  const __CFString *v19;
  __int16 v20;
  id v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager publishPolicies](self, "publishPolicies"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  v7 = sub_10005318C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      v18 = 138412546;
      v19 = CFSTR("SecureLocationConfig");
      v20 = 2112;
      v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ Found config for policy %@", (uint8_t *)&v18, 0x16u);
    }

    v10 = v6;
    goto LABEL_5;
  }
  if (v9)
  {
    v18 = 138412546;
    v19 = CFSTR("SecureLocationConfig");
    v20 = 2112;
    v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ No config found with name %@ from server configs. Creating with default values if name matches", (uint8_t *)&v18, 0x16u);
  }

  v12 = kFMDSecureLocationModeLive;
  if (!objc_msgSend(v4, "caseInsensitiveCompare:", kFMDSecureLocationModeLive))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("1.0"), CFSTR("minDistanceBetweenPublish"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("0.97"), CFSTR("minTimeBetweenPublish"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("3600"), CFSTR("expirationInterval"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("4"), CFSTR("heartbeatPublish"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("5"), CFSTR("priority"));
    v16 = off_1002C4880;
LABEL_21:
    objc_msgSend(v15, "setObject:forKeyedSubscript:", *v16, CFSTR("desiredAccuracy"));
    v11 = -[FMDSecureLocationConfig initWithName:values:]([FMDSecureLocationConfig alloc], "initWithName:values:", v12, v15);

    goto LABEL_22;
  }
  v12 = kFMDSecureLocationModeProactiveShallow;
  if (!objc_msgSend(v4, "caseInsensitiveCompare:", kFMDSecureLocationModeProactiveShallow))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("25"), CFSTR("minDistanceBetweenPublish"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("30"), CFSTR("minTimeBetweenPublish"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("240"), CFSTR("expirationInterval"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("50"), CFSTR("heartbeatPublish"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("4"), CFSTR("priority"));
    v16 = off_1002C4890;
    goto LABEL_21;
  }
  v12 = kFMDSecureLocationModeOwnerProactive;
  if (!objc_msgSend(v4, "caseInsensitiveCompare:", kFMDSecureLocationModeOwnerProactive))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("0.0"), CFSTR("minDistanceBetweenPublish"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("3000"), CFSTR("minTimeBetweenPublish"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("86400.0"), CFSTR("expirationInterval"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("3000"), CFSTR("heartbeatPublish"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("priority"));
    v16 = off_1002C4898;
    goto LABEL_21;
  }
  if (!objc_msgSend(v4, "caseInsensitiveCompare:", kFMDSecureLocationModeProactive))
  {
    v10 = objc_alloc_init(FMDSecureLocationConfig);
LABEL_5:
    v11 = v10;
    goto LABEL_22;
  }
  v12 = kFMDSecureLocationModeBackgroundProactive;
  if (!objc_msgSend(v4, "caseInsensitiveCompare:", kFMDSecureLocationModeBackgroundProactive))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("10000"), CFSTR("minDistanceBetweenPublish"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("3600"), CFSTR("minTimeBetweenPublish"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("86400.0"), CFSTR("expirationInterval"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("900"), CFSTR("minTimeBetweenVisitPublish"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("shouldWakeDevice"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("0"), CFSTR("priority"));
    v16 = &off_1002C48B0;
    goto LABEL_21;
  }
  v13 = sub_10005318C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412546;
    v19 = CFSTR("SecureLocationConfig");
    v20 = 2112;
    v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ Invalid policy name specified %@", (uint8_t *)&v18, 0x16u);
  }

  v11 = 0;
LABEL_22:

  return v11;
}

- (void)requestMonitorWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager policyManagerQueue](self, "policyManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008CB6C;
  block[3] = &unk_1002C11E8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_addContext:(id)a3 withExpiration:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  const __CFString *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager policyManagerQueue](self, "policyManagerQueue"));
  dispatch_assert_queue_V2(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager activePolicies](self, "activePolicies"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v10));

  if (!v11)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager activePolicies](self, "activePolicies"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mode"));
    objc_msgSend(v12, "setObject:forKey:", v11, v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "findMyId"));
  objc_msgSend(v11, "setObject:forKey:", v7, v14);

  v15 = sub_10005318C();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mode"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "findMyId"));
    v19 = 138413058;
    v20 = CFSTR("SecureLocationConfig");
    v21 = 2112;
    v22 = v17;
    v23 = 2112;
    v24 = v7;
    v25 = 2112;
    v26 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ Added policy %@ expiration to %@ for %@", (uint8_t *)&v19, 0x2Au);

  }
}

- (void)_policyRequested:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  int v25;
  const __CFString *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager policyManagerQueue](self, "policyManagerQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager configForPolicy:](self, "configForPolicy:", v4));
  v8 = sub_10005318C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager activeConfig](self, "activeConfig"));
    v25 = 138412802;
    v26 = CFSTR("SecureLocationConfig");
    v27 = 2112;
    v28 = v4;
    v29 = 2112;
    v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ policyRequested %@. Current activeConfig %@", (uint8_t *)&v25, 0x20u);

  }
  v11 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager activeConfig](self, "activeConfig"));
  if (v11
    && (v12 = (void *)v11,
        v13 = objc_msgSend(v7, "priority"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager activeConfig](self, "activeConfig")),
        v15 = objc_msgSend(v14, "priority"),
        v14,
        v12,
        (uint64_t)v13 <= (uint64_t)v15))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "policyName"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager activeConfig](self, "activeConfig"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "policyName"));
    v24 = objc_msgSend(v21, "isEqualToString:", v23);

    if (v24 && v6)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager activeConfig](self, "activeConfig"));
      objc_msgSend(v6, "activeConfigExtended:", v20);
      goto LABEL_12;
    }
  }
  else
  {
    v16 = sub_10005318C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager activeConfig](self, "activeConfig"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "policyName"));
      v25 = 138412802;
      v26 = CFSTR("SecureLocationConfig");
      v27 = 2112;
      v28 = v19;
      v29 = 2112;
      v30 = v4;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ Switching active policy from %@ to %@", (uint8_t *)&v25, 0x20u);

    }
    -[FMDSecureLocationConfigManager setActiveConfig:](self, "setActiveConfig:", v7);
    if (v6)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager activeConfig](self, "activeConfig"));
      objc_msgSend(v6, "activeConfigChanged:", v20);
LABEL_12:

    }
  }

}

- (void)removeMonitorWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  FMDSecureLocationConfigManager *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager policyManagerQueue](self, "policyManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008D1E8;
  v7[3] = &unk_1002C21C8;
  objc_copyWeak(&v10, &location);
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)_removeContext:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  int v31;
  const __CFString *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager policyManagerQueue](self, "policyManagerQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mode"));
  if (v6
    && (v7 = (void *)v6,
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "findMyId")),
        v8,
        v7,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager activePolicies](self, "activePolicies"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mode"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v10));

    if (!v11)
    {
      v28 = sub_10005318C();
      v18 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mode"));
        v31 = 138412546;
        v32 = CFSTR("SecureLocationConfig");
        v33 = 2114;
        v34 = v29;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ No active contexts for mode %{public}@", (uint8_t *)&v31, 0x16u);

      }
      v19 = 0;
      goto LABEL_14;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "findMyId"));
    -[NSObject removeObjectForKey:](v11, "removeObjectForKey:", v12);

    v13 = sub_10005318C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "findMyId"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mode"));
      v31 = 138412802;
      v32 = CFSTR("SecureLocationConfig");
      v33 = 2114;
      v34 = v15;
      v35 = 2114;
      v36 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ Removed active sub for %{public}@ in mode %{public}@", (uint8_t *)&v31, 0x20u);

    }
    if (-[NSObject count](v11, "count"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject allValues](v11, "allValues"));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sortedArrayUsingComparator:", &stru_1002C4690));

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lastObject](v18, "lastObject"));
LABEL_14:

      goto LABEL_15;
    }
  }
  else
  {
    v20 = sub_10005318C();
    v11 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10022BBAC(v11, v21, v22, v23, v24, v25, v26, v27);
  }
  v19 = 0;
LABEL_15:

  return v19;
}

- (id)expirationTimeFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager policyExpirationTimes](self, "policyExpirationTimes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
}

- (void)policyExpired:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  FMDSecureLocationConfigManager *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfigManager policyManagerQueue](self, "policyManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008D930;
  v7[3] = &unk_1002C21C8;
  objc_copyWeak(&v10, &location);
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (FMDSecureLocationConfig)activeConfig
{
  return (FMDSecureLocationConfig *)objc_getProperty(self, a2, 16, 1);
}

- (void)setActiveConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (FMDSecureLocationsConfigManagerDelegate)delegate
{
  return (FMDSecureLocationsConfigManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)featureEnabled
{
  return self->_featureEnabled;
}

- (void)setFeatureEnabled:(BOOL)a3
{
  self->_featureEnabled = a3;
}

- (OS_dispatch_queue)policyManagerQueue
{
  return self->_policyManagerQueue;
}

- (void)setPolicyManagerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_policyManagerQueue, a3);
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
  objc_storeStrong((id *)&self->_dataArchiver, a3);
}

- (NSMutableDictionary)publishPolicies
{
  return self->_publishPolicies;
}

- (void)setPublishPolicies:(id)a3
{
  objc_storeStrong((id *)&self->_publishPolicies, a3);
}

- (NSMutableDictionary)policyExpirationTimes
{
  return self->_policyExpirationTimes;
}

- (void)setPolicyExpirationTimes:(id)a3
{
  objc_storeStrong((id *)&self->_policyExpirationTimes, a3);
}

- (NSMutableDictionary)activePolicies
{
  return self->_activePolicies;
}

- (void)setActivePolicies:(id)a3
{
  objc_storeStrong((id *)&self->_activePolicies, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePolicies, 0);
  objc_storeStrong((id *)&self->_policyExpirationTimes, 0);
  objc_storeStrong((id *)&self->_publishPolicies, 0);
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_policyManagerQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeConfig, 0);
}

@end
