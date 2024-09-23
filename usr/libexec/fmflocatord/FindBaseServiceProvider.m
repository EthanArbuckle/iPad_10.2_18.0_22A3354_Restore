@implementation FindBaseServiceProvider

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider standardLocator](self, "standardLocator"));
  objc_msgSend(v3, "stopLocator");

  v4.receiver = self;
  v4.super_class = (Class)FindBaseServiceProvider;
  -[FindBaseServiceProvider dealloc](&v4, "dealloc");
}

- (FindBaseServiceProvider)init
{
  FindBaseServiceProvider *v2;
  void *v3;
  NSRecursiveLock *v4;
  dispatch_queue_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FindBaseServiceProvider;
  v2 = -[FindBaseServiceProvider init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[FindBaseServiceProvider setRequests:](v2, "setRequests:", v3);

    v4 = objc_opt_new(NSRecursiveLock);
    -[FindBaseServiceProvider setRequestModifierLock:](v2, "setRequestModifierLock:", v4);

    v5 = dispatch_queue_create("fmf.deviceRegisterQ", 0);
    -[FindBaseServiceProvider setRegisterQueue:](v2, "setRegisterQueue:", v5);

  }
  return v2;
}

- (id)serviceName
{
  return CFSTR("find-base");
}

- (void)registerCommonNotifications
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "deviceNameChanged:", CFSTR("DeviceNameChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "locationServicesStateChanged:", CFSTR("LocationServicesStateChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "fmfLocationServicesStateChanged:", CFSTR("FMFLocationServicesStateChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "localeChanged:", CFSTR("LocaleChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "appInstallStateChanged:", CFSTR("FMFAppInstallStateChangedNotification"), 0);

}

- (void)deregisterCommonNotifications
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("DeviceNameChangedNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("LocationServicesStateChangedNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("FMFLocationServicesStateChangedNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("LocaleChangedNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("FMFAppInstallStateChangedNotification"), 0);

}

- (void)deleteRegisterDigest
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider _registerDigestPrefKey](self, "_registerDigestPrefKey"));
  +[FMPreferencesUtil removeKey:inDomain:](FMPreferencesUtil, "removeKey:inDomain:", v5, CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider _nonEssentialRegisterDigestPrefKey](self, "_nonEssentialRegisterDigestPrefKey"));
  +[FMPreferencesUtil removeKey:inDomain:](FMPreferencesUtil, "removeKey:inDomain:", v3, CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider lastForcedRegisterTimePrefKey](self, "lastForcedRegisterTimePrefKey"));
  +[FMPreferencesUtil removeKey:inDomain:](FMPreferencesUtil, "removeKey:inDomain:", v4, CFSTR("com.apple.icloud.fmflocatord.notbackedup"));

}

- (void)deinitializeProvider
{
  FindBaseServiceProvider *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  FindBaseServiceProvider *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned int v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];

  v2 = self;
  v33.receiver = self;
  v33.super_class = (Class)FindBaseServiceProvider;
  -[ServiceProvider deinitializeProvider](&v33, "deinitializeProvider");
  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider fm_logID](v2, "fm_logID"));
    *(_DWORD *)buf = 138412290;
    v35 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ Deinitializing...", buf, 0xCu);

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider requests](v2, "requests"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v30;
    *(_QWORD *)&v8 = 138412546;
    v28 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v11);
        v13 = sub_10001C4E8();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = v2;
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider fm_logID](v2, "fm_logID"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fm_logID"));
          *(_DWORD *)buf = v28;
          v35 = v16;
          v36 = 2112;
          v37 = v17;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@ cancelling request %@", buf, 0x16u);

          v2 = v15;
        }

        objc_msgSend(v12, "setDelegate:", 0);
        objc_msgSend(v12, "cancel");
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v9);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[FindBaseServiceProvider setRequests:](v2, "setRequests:", v18);

  v19 = objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider standardLocator](v2, "standardLocator"));
  if (v19)
  {
    v20 = (void *)v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider standardLocator](v2, "standardLocator"));
    v22 = objc_msgSend(v21, "locatorRunning");

    if (v22)
    {
      v23 = sub_10001C4E8();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Stopping standard locate...", buf, 2u);
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider standardLocator](v2, "standardLocator"));
      objc_msgSend(v25, "stopLocator");

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider standardLocator](v2, "standardLocator"));
      objc_msgSend(v26, "setReceivedLocationBlock:", 0);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider standardLocator](v2, "standardLocator"));
      objc_msgSend(v27, "setStoppedLocatorBlock:", 0);

    }
  }
  -[FindBaseServiceProvider setStandardLocator:](v2, "setStandardLocator:", 0, v28);
}

- (NSString)serviceIdentifierInURL
{
  return (NSString *)&stru_100057AE0;
}

- (id)formattedURLForTemplate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  int v10;
  void *v11;
  __int16 v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider substituteStandardURLPlaceholders:](self, "substituteStandardURLPlaceholders:", v4));
  v6 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v5);
  if (!v6)
  {
    v7 = sub_10001C4E8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Could not create an NSURL from the url string %@ for the template %@", (uint8_t *)&v10, 0x16u);
    }

  }
  return v6;
}

- (id)substituteStandardURLPlaceholders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PreferencesMgr sharedInstance](PreferencesMgr, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostportOverride"));

  if (objc_msgSend(v6, "length"))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${hostname}"), v6));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverHost"));

    if (!v9)
      goto LABEL_6;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serverHost"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${hostname}"), v11));

    v4 = v10;
  }

  v4 = (id)v7;
LABEL_6:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[PreferencesMgr sharedInstance](PreferencesMgr, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "protocolSchemeOverride"));

  if (objc_msgSend(v13, "length"))
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${scheme}"), v13));
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "serverProtocolScheme"));

    if (!v16)
      goto LABEL_11;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "serverProtocolScheme"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${scheme}"), v18));

    v4 = v17;
  }

  v4 = (id)v14;
LABEL_11:
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider serviceIdentifierInURL](self, "serviceIdentifierInURL"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider serviceIdentifierInURL](self, "serviceIdentifierInURL"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${service}"), v20));

    v4 = (id)v21;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "authId"));

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "authId"));
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${dsid}"), v25));

    v4 = (id)v26;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "deviceUDID"));

  if (v28)
  {
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${udid}"), v28));

    v4 = (id)v29;
  }

  return v4;
}

- (NSMutableDictionary)standardDeviceContext
{
  return (NSMutableDictionary *)-[FindBaseServiceProvider _constructStandardDeviceContext](self, "_constructStandardDeviceContext");
}

- (NSMutableDictionary)fullDeviceInfo
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider _constructNonVolatileFullDeviceInfo](self, "_constructNonVolatileFullDeviceInfo"));
  objc_msgSend(v3, "addEntriesFromDictionary:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider _constructVolatileFullDeviceInfo](self, "_constructVolatileFullDeviceInfo"));
  objc_msgSend(v3, "addEntriesFromDictionary:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider _constructNonCriticalFullDeviceInfo](self, "_constructNonCriticalFullDeviceInfo"));
  objc_msgSend(v3, "addEntriesFromDictionary:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PreferencesMgr sharedInstance](PreferencesMgr, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceInfoOverrides"));

  if (v9)
    objc_msgSend(v3, "addEntriesFromDictionary:", v9);

  objc_autoreleasePoolPop(v4);
  return (NSMutableDictionary *)v3;
}

- (NSMutableDictionary)locationDeviceInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider _constructLocationDeviceInfo](self, "_constructLocationDeviceInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider _constructNonVolatileFullDeviceInfo](self, "_constructNonVolatileFullDeviceInfo"));
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider _constructVolatileFullDeviceInfo](self, "_constructVolatileFullDeviceInfo"));
  objc_msgSend(v3, "addEntriesFromDictionary:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider _constructNonCriticalFullDeviceInfo](self, "_constructNonCriticalFullDeviceInfo"));
  objc_msgSend(v3, "addEntriesFromDictionary:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PreferencesMgr sharedInstance](PreferencesMgr, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "locationDeviceInfoOverrides"));

  if (v8)
    objc_msgSend(v3, "addEntriesFromDictionary:", v8);

  return (NSMutableDictionary *)v3;
}

- (id)_constructStandardDeviceContext
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringValueForServer"));

  if (v4)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("deviceTS"));

  return v2;
}

- (id)_constructVolatileFullDeviceInfo
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  id v20;
  void *v21;
  FMDGainsboroughPairedDeviceSimulation *v22;
  void *v23;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFConfig sharedInstance](FMFConfig, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isLocationServicesEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("locationServicesEnabled"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMFConfig sharedInstance](FMFConfig, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "isLocationServicesEnabledForShareMyLocation")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("smlLS"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceName"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("deviceName"), v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timezone"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("timezone"), v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "locale"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("locale"), v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v14, "processIdentifier")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringValue"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("processId"), v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "unlockState")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("unlockState"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v20 = objc_msgSend(v19, "isFMFAppRemoved");

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v20));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("isFMFAppRemoved"), v21);

  v22 = objc_alloc_init(FMDGainsboroughPairedDeviceSimulation);
  if (-[FMDGainsboroughPairedDeviceSimulation isPairedDeviceSimulationActive](v22, "isPairedDeviceSimulationActive"))
    objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("deviceName"), CFSTR("Gainsborough's iPhone"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider _constructPairedDevicesInfo](self, "_constructPairedDevicesInfo"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("otherDevices"));

  return v3;
}

- (id)_constructNonVolatileFullDeviceInfo
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceUDID"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("udid"), v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  LODWORD(v4) = objc_msgSend(v6, "canRegisterWithIDSID");

  if ((_DWORD)v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsDeviceID"));
    objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("idsDeviceId"), v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceClassString"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("deviceClass"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "productType"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("productType"), v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "buildVersion"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("buildVersion"), v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "productVersion"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("productVersion"), v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "platform"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("platform"), v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v19, "isInternalBuild")));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("isInternal"), v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "serialNumber"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("serialNumber"), v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "versionHistory"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "componentsJoinedByString:", CFSTR(",")));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("versionHistory"), v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "deviceColor"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("deviceColor"), v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "deviceEnclosureColor"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("enclosureColor"), v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v30, "forceTouchAvailable")));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("supportsForceTouch"), v31);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("supportsNotifyV2"));
  return v3;
}

- (id)_constructNonEssentialDeviceInfo
{
  return objc_alloc_init((Class)NSMutableDictionary);
}

- (id)_constructNonCriticalFullDeviceInfo
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "batteryStats");

  return v2;
}

- (id)_constructLocationDeviceInfo
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceUDID"));
  objc_msgSend(v2, "fm_safelyMapKey:toObject:", CFSTR("udid"), v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "batteryStats");

  return v2;
}

- (id)_registerDigestPrefKey
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
  v5 = objc_opt_class(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RegisterDigest-%@-%@"), v5, v7));

  return v8;
}

- (id)_nonEssentialRegisterDigestPrefKey
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
  v5 = objc_opt_class(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RegisterDigestNonEssential-%@-%@"), v5, v7));

  return v8;
}

- (NSString)lastForcedRegisterTimePrefKey
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
  v5 = objc_opt_class(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("LastForcedRegisterTime-%@-%@"), v5, v7));

  return (NSString *)v8;
}

- (id)_constructPairedDevicesInfo
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  _UNKNOWN **v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  FMDGainsboroughPairedDeviceSimulation *v25;
  void *v26;
  void *context;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  v35 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  context = objc_autoreleasePoolPush();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getPairedDevices"));

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v38;
    v7 = NRDevicePropertyIsPaired;
    v8 = NRDevicePropertyIsAltAccount;
    v32 = NRDevicePropertyLastActiveDate;
    v31 = NRDevicePropertyUDID;
    v30 = NRDevicePropertyProductType;
    v29 = NRDevicePropertyName;
    v33 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForProperty:", v7));
        v12 = objc_msgSend(v11, "BOOLValue");

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForProperty:", v8));
        v14 = objc_msgSend(v13, "BOOLValue");

        if (v12 && (v14 & 1) == 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForProperty:", v32));
          v17 = v16;
          if (v16)
            v18 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v16, "fm_epoch")));
          else
            v18 = &off_10005AED8;
          objc_msgSend(v15, "fm_safelyMapKey:toObject:", CFSTR("lastActiveTime"), v18);
          objc_msgSend(v15, "fm_safelyMapKey:toObject:", CFSTR("deviceClass"), CFSTR("Watch"));
          objc_msgSend(v15, "fm_safelyMapKey:toObject:", CFSTR("platform"), CFSTR("watchos"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider connectionStringForNRDevice:](self, "connectionStringForNRDevice:", v10));
          objc_msgSend(v15, "fm_safelyMapKey:toObject:", CFSTR("connectionStatus"), v19);

          v20 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider pairingIdForNRDevice:](self, "pairingIdForNRDevice:", v10));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUIDString"));
          objc_msgSend(v15, "fm_safelyMapKey:toObject:", CFSTR("pairingId"), v21);

          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForProperty:", v31));
          objc_msgSend(v15, "fm_safelyMapKey:toObject:", CFSTR("udid"), v22);

          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForProperty:", v30));
          objc_msgSend(v15, "fm_safelyMapKey:toObject:", CFSTR("productType"), v23);

          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForProperty:", v29));
          objc_msgSend(v15, "fm_safelyMapKey:toObject:", CFSTR("deviceName"), v24);

          objc_msgSend(v35, "addObject:", v15);
          v6 = v33;
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(context);
  v25 = objc_alloc_init(FMDGainsboroughPairedDeviceSimulation);
  if (-[FMDGainsboroughPairedDeviceSimulation isPairedDeviceSimulationActive](v25, "isPairedDeviceSimulationActive"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMDGainsboroughPairedDeviceSimulation pairedDeviceInfo](v25, "pairedDeviceInfo"));
    objc_msgSend(v35, "addObjectsFromArray:", v26);

  }
  return v35;
}

- (id)pairingIdForNRDevice:(id)a3
{
  return objc_msgSend(a3, "valueForProperty:", NRDevicePropertyPairingID);
}

- (id)connectionStringForNRDevice:(id)a3
{
  return CFSTR("unknown");
}

- (void)registerDeviceWithCause:(id)a3 force:(BOOL)a4 includeKeys:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  _QWORD *v13;
  unint64_t v14;
  BOOL v15;
  _QWORD v16[5];
  id v17;

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_10001097C;
  v16[4] = sub_10001098C;
  v8 = a3;
  v17 = v8;
  v9 = objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider registerQueue](self, "registerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010994;
  block[3] = &unk_1000555E8;
  block[4] = self;
  v12 = v8;
  v15 = a4;
  v13 = v16;
  v14 = a5;
  v10 = v8;
  dispatch_async(v9, block);

  _Block_object_dispose(v16, 8);
}

- (void)registerDeviceWithCause:(id)a3
{
  -[FindBaseServiceProvider registerDeviceWithCause:force:](self, "registerDeviceWithCause:force:", a3, 0);
}

- (void)registerDeviceWithCause:(id)a3 force:(BOOL)a4
{
  -[FindBaseServiceProvider registerDeviceWithCause:force:includeKeys:](self, "registerDeviceWithCause:force:includeKeys:", a3, a4, 0);
}

- (void)_registerDeviceWithCause:(id)a3 includeKeys:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  FMRequestRegister *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  unsigned int v20;
  id v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  unsigned int v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  unsigned int v32;
  id v33;
  NSObject *v34;
  void *v35;
  unsigned int v36;
  id v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  NSObject *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  FindBaseServiceProvider *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;

  v5 = a3;
  v6 = -[FindBaseServiceProvider essentialServerInfoMissingError](self, "essentialServerInfoMissingError");
  if ((_DWORD)v6 == 1196379972)
  {
    v7 = -[FMRequestRegister initWithProvider:andCause:]([FMRequestRegister alloc], "initWithProvider:andCause:", self, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestRegister registrationInformationDigestIncludingKeys](v7, "registrationInformationDigestIncludingKeys"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider _registerDigestPrefKey](self, "_registerDigestPrefKey"));
    if (qword_1000695B8 && objc_msgSend((id)qword_1000695B8, "isEqualToData:", v8))
    {
      v10 = sub_10001C4E8();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider fm_logID](self, "fm_logID"));
        *(_DWORD *)buf = 138412546;
        v54 = v12;
        v55 = 2112;
        v56 = v5;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ Not sending register with cause %@ because there is already another register with the same registration information in-progress", buf, 0x16u);

      }
    }
    else
    {
      v24 = objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil dataForKey:inDomain:](FMPreferencesUtil, "dataForKey:inDomain:", v9, CFSTR("com.apple.icloud.fmflocatord.notbackedup")));
      v11 = v24;
      if (v24)
        v25 = -[NSObject isEqualToData:](v24, "isEqualToData:", v8);
      else
        v25 = 0;
      v29 = sub_10001C4E8();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v54) = v25;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Reg-info matching complete. Essentitial info matches - [%i]", buf, 8u);
      }

      if (v25)
      {
        if (-[FindBaseServiceProvider completedStartupRegister](self, "completedStartupRegister")
          || (v31 = (void *)objc_claimAutoreleasedReturnValue(+[FMFLocatorDaemon sharedInstance](FMFLocatorDaemon, "sharedInstance")),
              v32 = objc_msgSend(v31, "isFirstRunAfterBoot"),
              v31,
              !v32))
        {
          if (-[FindBaseServiceProvider completedStartupRegister](self, "completedStartupRegister")
            || (v35 = (void *)objc_claimAutoreleasedReturnValue(+[StartupRegisterManager sharedInstance](StartupRegisterManager, "sharedInstance")), v36 = objc_msgSend(v35, "shouldForceRegisterOnStartup"), v35, !v36))
          {
            v44 = sub_10001C4E8();
            v45 = objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v54 = v5;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Reg-info unchanged. Ignoring register %@", buf, 0xCu);
            }

            goto LABEL_41;
          }
          v37 = sub_10001C4E8();
          v34 = objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(+[StartupRegisterManager sharedInstance](StartupRegisterManager, "sharedInstance"));
            *(_DWORD *)buf = 138412546;
            v54 = v5;
            v55 = 2112;
            v56 = v38;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Reg-info unchanged but forcing register %@ due to %@", buf, 0x16u);

          }
        }
        else
        {
          v33 = sub_10001C4E8();
          v34 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v54 = v5;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Reg-info unchanged but forcing register %@", buf, 0xCu);
          }
        }

      }
      v39 = sub_10001C4E8();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider fm_logID](self, "fm_logID"));
        *(_DWORD *)buf = 138412546;
        v54 = v41;
        v55 = 2112;
        v56 = v5;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%@ Sending register with cause %@ because registration information has changed", buf, 0x16u);

      }
      objc_initWeak((id *)buf, self);
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_100011270;
      v51[3] = &unk_100055418;
      v42 = v8;
      v52 = v42;
      -[FMRequest setWillSendHandler:](v7, "setWillSendHandler:", v51);
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_100011280;
      v46[3] = &unk_100055610;
      objc_copyWeak(&v50, (id *)buf);
      v47 = v42;
      v48 = v9;
      v49 = self;
      -[FMRequest setCompletionHandler:](v7, "setCompletionHandler:", v46);
      if (!-[FindBaseServiceProvider enqueueRequest:](self, "enqueueRequest:", v7))
      {
        v43 = (void *)qword_1000695B8;
        qword_1000695B8 = 0;

      }
      objc_destroyWeak(&v50);

      objc_destroyWeak((id *)buf);
    }
LABEL_41:

    goto LABEL_42;
  }
  v13 = v6;
  v14 = sub_10001C4E8();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider fm_logID](self, "fm_logID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CommonUtil stringForFourCC:](CommonUtil, "stringForFourCC:", v13));
    *(_DWORD *)buf = 138412802;
    v54 = v16;
    v55 = 2112;
    v56 = v5;
    v57 = 2112;
    v58 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: Not sending register with cause %@ to server since some essential server info is missing - '%@'", buf, 0x20u);

  }
  v18 = v13 == 1480675411;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v20 = objc_msgSend(v19, "isInternalBuild");

  if (v18)
  {
    if (v20)
    {
      v21 = sub_10001C4E8();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider serviceName](self, "serviceName"));
        *(_DWORD *)buf = 138412290;
        v54 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@ is not functional as an APS token is not available.", buf, 0xCu);

      }
    }
  }
  else
  {
    if (v20)
    {
      v26 = sub_10001C4E8();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider serviceName](self, "serviceName"));
        *(_DWORD *)buf = 138412290;
        v54 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@ is not functional as authentication credentials are not available.", buf, 0xCu);

      }
    }
    -[FindBaseServiceProvider tryToFetchAuthToken](self, "tryToFetchAuthToken");
  }
LABEL_42:

}

- (void)unregisterDevice
{
  FMRequestUnregister *v3;
  _QWORD v4[5];

  v3 = -[FMRequest initWithProvider:]([FMRequestUnregister alloc], "initWithProvider:", self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000115E8;
  v4[3] = &unk_100055418;
  v4[4] = self;
  -[FMRequest setCompletionHandler:](v3, "setCompletionHandler:", v4);
  -[FindBaseServiceProvider enqueueRequest:](self, "enqueueRequest:", v3);

}

- (void)sendQueueCheckRequest:(id)a3
{
  -[FindBaseServiceProvider sendQueueCheckRequest:withReasons:](self, "sendQueueCheckRequest:withReasons:", a3, 0);
}

- (void)sendQueueCheckRequest:(id)a3 withReasons:(id)a4
{
  id v5;
  FMRequestQueueCheck *v6;
  _QWORD v7[5];

  v5 = a3;
  -[FindBaseServiceProvider _beginXPCTransaction](self, "_beginXPCTransaction");
  v6 = -[FMRequestQueueCheck initWithProvider:andServerContext:]([FMRequestQueueCheck alloc], "initWithProvider:andServerContext:", self, v5);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000119DC;
  v7[3] = &unk_100055418;
  v7[4] = self;
  -[FMRequest setCompletionHandler:](v6, "setCompletionHandler:", v7);
  -[FindBaseServiceProvider enqueueRequest:](self, "enqueueRequest:", v6);

  -[FindBaseServiceProvider _endXPCTransaction](self, "_endXPCTransaction");
}

- (void)sendCurrentLocation:(id)a3 isFinished:(BOOL)a4 forCmd:(id)a5 withReason:(int64_t)a6 andAccuracyChange:(double)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  FMRequestCurrentLocation *v24;
  uint64_t v25;
  uint64_t CTGreenTeaOsLogHandle;
  NSObject *v27;
  NSObject *v28;
  _QWORD v29[5];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = sub_10001C4E8();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    sub_100033DA4(self, v15);

  v16 = sub_10001C558();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider serviceName](self, "serviceName"));
    objc_msgSend(v12, "horizontalAccuracy");
    v20 = v19;
    objc_msgSend(v12, "coordinate");
    v22 = v21;
    objc_msgSend(v12, "coordinate");
    *(_DWORD *)buf = 138413059;
    v31 = v18;
    v32 = 2049;
    v33 = v20;
    v34 = 2049;
    v35 = v22;
    v36 = 2049;
    v37 = v23;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@: Publishing Location with Accuracy: %{private}f Longitude: %{private}f Latitude: %{private}f", buf, 0x2Au);

  }
  v24 = -[FMRequestCurrentLocation initWithProvider:location:finalLocation:locateCommand:reason:accuracyChange:]([FMRequestCurrentLocation alloc], "initWithProvider:location:finalLocation:locateCommand:reason:accuracyChange:", self, v12, v10, v13, a6, a7);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100011E88;
  v29[3] = &unk_100055418;
  v29[4] = self;
  -[FMRequest setCompletionHandler:](v24, "setCompletionHandler:", v29);
  v25 = ct_green_tea_logger_create_static("fmflocatord");
  CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle(v25);
  v27 = objc_claimAutoreleasedReturnValue(CTGreenTeaOsLogHandle);
  v28 = v27;
  if (v27 && os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Transmitting Location.", buf, 2u);
  }

  -[FindBaseServiceProvider enqueueRequest:](self, "enqueueRequest:", v24);
}

- (void)ackRegisterCommand:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  FMRequestAckRegister *v10;
  id v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  FindBaseServiceProvider *v17;
  id v18;
  uint8_t buf[4];
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ackURL")));
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v8));
    v10 = -[FMRequestAckRegister initWithProvider:registerCommand:ackURL:]([FMRequestAckRegister alloc], "initWithProvider:registerCommand:ackURL:", self, v6, v9);
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_1000121D0;
    v16 = &unk_100055440;
    v17 = self;
    v18 = v7;
    -[FMRequest setCompletionHandler:](v10, "setCompletionHandler:", &v13);
    -[FindBaseServiceProvider enqueueRequest:](self, "enqueueRequest:", v10, v13, v14, v15, v16, v17);

  }
  else
  {
    v11 = sub_10001C4E8();
    v9 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider serviceName](self, "serviceName"));
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@: Not acking the register command because there is no ack URL", buf, 0xCu);

    }
  }

}

- (void)ackLocateCommand:(id)a3 withStatusCode:(int64_t)a4 andStatusMessage:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  FMRequestAckLocate *v15;
  id v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  FindBaseServiceProvider *v22;
  id v23;
  uint8_t buf[4];
  void *v25;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ackURL")));
  if (v13)
  {
    v14 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v13));
    v15 = -[FMRequestAckLocate initWithProvider:locateCommand:ackURL:cmdStatusCode:cmdStatusMessage:]([FMRequestAckLocate alloc], "initWithProvider:locateCommand:ackURL:cmdStatusCode:cmdStatusMessage:", self, v10, v14, a4, v11);
    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_100012568;
    v21 = &unk_100055440;
    v22 = self;
    v23 = v12;
    -[FMRequest setCompletionHandler:](v15, "setCompletionHandler:", &v18);
    -[FindBaseServiceProvider enqueueRequest:](self, "enqueueRequest:", v15, v18, v19, v20, v21, v22);

  }
  else
  {
    v16 = sub_10001C4E8();
    v14 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider serviceName](self, "serviceName"));
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@: Not acking the locate command because there is no ack URL", buf, 0xCu);

    }
  }

}

- (BOOL)locServicesCapable
{
  return 1;
}

- (void)handleQueueCheckResponseWithStatus:(int64_t)a3 andBody:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  id v24;
  void *v25;
  const char *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;

  v6 = a4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cmd")));
    v9 = sub_10001C4E8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider serviceName](self, "serviceName"));
      v27 = 138412546;
      v28 = v11;
      v29 = 2112;
      v30 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: Command Received: %@", (uint8_t *)&v27, 0x16u);

    }
    v12 = -[FindBaseServiceProvider copyHandlerForCommand:params:](self, "copyHandlerForCommand:params:", v8, v7);
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "executeCommand");
      v14 = sub_10001C4E8();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider serviceName](self, "serviceName"));
        v27 = 138412546;
        v28 = v16;
        v29 = 2112;
        v30 = v8;
        v17 = "%@: Successfully finished command %@";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v27, 0x16u);

      }
    }
    else
    {
      v18 = sub_10001C4E8();
      v15 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider serviceName](self, "serviceName"));
        v27 = 138412546;
        v28 = v16;
        v29 = 2112;
        v30 = v8;
        v17 = "%@: No handler found for command %@";
        goto LABEL_11;
      }
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[StartupRegisterManager sharedInstance](StartupRegisterManager, "sharedInstance"));
    objc_msgSend(v19, "eventDidOccur:", 8);

    if (a3 == 210 || a3 == 204)
    {
      v24 = sub_10001C4E8();
      v21 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider serviceName](self, "serviceName"));
        v27 = 138412290;
        v28 = v25;
        v26 = "%@: No more pending messages on the server...";
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v26, (uint8_t *)&v27, 0xCu);

      }
    }
    else
    {
      if (a3 != 200)
      {
LABEL_23:

        goto LABEL_24;
      }
      v20 = sub_10001C4E8();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
      if (v13)
      {
        if (v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider serviceName](self, "serviceName"));
          v27 = 138412290;
          v28 = v23;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%@: More messages pending - checking now...", (uint8_t *)&v27, 0xCu);

        }
        -[FindBaseServiceProvider sendQueueCheckRequest:](self, "sendQueueCheckRequest:", 0);
        goto LABEL_23;
      }
      if (v22)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider serviceName](self, "serviceName"));
        v27 = 138412290;
        v28 = v25;
        v26 = "%@: Not checking for new messages - previous command was not successful or duplicate";
        goto LABEL_21;
      }
    }

    goto LABEL_23;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[StartupRegisterManager sharedInstance](StartupRegisterManager, "sharedInstance"));
  objc_msgSend(v8, "eventDidOccur:", 8);
LABEL_24:

}

- (BOOL)isProviderEnabledForLocations
{
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider fm_logID](self, "fm_logID"));
    v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ isProviderEnabledForLocations should be handled in a subclass", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

- (unsigned)essentialServerInfoMissingError
{
  unsigned int v3;
  FindBaseServiceProvider *v4;
  void *v5;

  v3 = -[FindBaseServiceProvider authInvalidError](self, "authInvalidError");
  if (v3 == 1196379972)
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider apsToken](v4, "apsToken"));

    if (v5)
      v3 = 1196379972;
    else
      v3 = 1480675411;
    objc_sync_exit(v4);

  }
  return v3;
}

- (unsigned)authInvalidError
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));

  if (!v3)
    return 1480672067;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "username"));
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    return 1481986898;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "authToken"));
  v9 = objc_msgSend(v8, "length");

  if (!v9)
    return 1481920331;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "authId"));
  v12 = objc_msgSend(v11, "length");

  if (v12)
    return 1196379972;
  else
    return 1482639684;
}

- (void)tryToFetchAuthToken
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "authToken"));
  objc_msgSend(v2, "length");

}

- (id)newLocationManager
{
  return 0;
}

- (id)copyHandlerForCommand:(id)a3 params:(id)a4
{
  id v4;
  NSObject *v5;
  uint8_t v7[16];

  v4 = sub_10001C4E8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Base copyHandlerForCommand should not be called", v7, 2u);
  }

  return 0;
}

- (void)showAlertFromServerResponse:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  BOOL v18;
  BOOL v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  dispatch_time_t v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  void *v34;
  _QWORD block[4];
  NSObject *v36;
  _QWORD v37[4];
  __CFString *v38;
  id v39;
  _QWORD v40[4];
  __CFString *v41;
  id v42;
  uint8_t buf[4];
  double v44;

  v3 = a3;
  v4 = sub_10001C4E8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100033E30((uint64_t)v3, v5, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("title")));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("text")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("okButtonTitle")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("okButtonURL")));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("okButtonAction")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cancelButtonTitle")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cancelButtonURL")));
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cancelButtonAction")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("delay")));
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  if (v7)
  {
    v17 = objc_alloc_init((Class)FMAlert);
    objc_msgSend(v17, "setCategory:", qword_100068E68);
    objc_msgSend(v17, "setMsgTitle:", v7);
    objc_msgSend(v17, "setMsgText:", v34);
    objc_msgSend(v17, "setShowMsgInLockScreen:", 1);
    objc_msgSend(v17, "setDismissMsgOnUnlock:", 0);
    objc_msgSend(v17, "setDismissMsgOnLock:", 0);
    objc_msgSend(v17, "setDefaultButtonTitle:", v8);
    if (v9)
      v18 = v10 == 0;
    else
      v18 = 0;
    if (v18)
      v10 = CFSTR("open-url");
    if (v12)
      v19 = v13 == 0;
    else
      v19 = 0;
    if (v19)
      v13 = CFSTR("open-url");
    if (v10)
    {
      v31 = v8;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider alertActionInfoForAction:andURL:](self, "alertActionInfoForAction:andURL:", v10, v9));
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100013274;
      v40[3] = &unk_100055638;
      v41 = v10;
      v42 = v20;
      v21 = v20;
      objc_msgSend(v17, "setDefaultButtonAction:", v40);

      v8 = v31;
    }
    objc_msgSend(v17, "setAlternateButtonTitle:", v11, v9);
    if (v13)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider alertActionInfoForAction:andURL:](self, "alertActionInfoForAction:andURL:", v13, v12));
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100013328;
      v37[3] = &unk_100055638;
      v38 = v13;
      v39 = v22;
      v23 = v22;
      objc_msgSend(v17, "setAlternateButtonAction:", v37);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "defaultButtonTitle"));
    if (v24)
    {

    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "alternateButtonTitle"));

      if (!v25)
      {
        v30 = sub_10001C4E8();
        v29 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Received a server alert without an button. Not showing it", buf, 2u);
        }
        goto LABEL_26;
      }
    }
    if (v16 <= 0.0)
    {
      v29 = objc_claimAutoreleasedReturnValue(+[FMAlertManager sharedInstance](FMAlertManager, "sharedInstance"));
      -[NSObject activateAlert:](v29, "activateAlert:", v17);
    }
    else
    {
      v26 = sub_10001C4E8();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v44 = v16;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Showing alert after %.2f seconds...", buf, 0xCu);
      }

      v28 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000133DC;
      block[3] = &unk_100055230;
      v36 = v17;
      dispatch_after(v28, (dispatch_queue_t)&_dispatch_main_q, block);
      v29 = v36;
    }
LABEL_26:

    v9 = v32;
  }

}

- (id)alertActionInfoForAction:(id)a3 andURL:(id)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  unsigned int v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];

  v5 = a3;
  v6 = (__CFString *)a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("appleid")))
  {

    v6 = CFSTR("prefs:root=APPLE_ACCOUNT");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT")));
    v19[0] = CFSTR("url");
    v19[1] = CFSTR("sensitive");
    v20[0] = v7;
    v20[1] = &__kCFBooleanTrue;
    v8 = v20;
    v9 = v19;
LABEL_10:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v9, 2));

    goto LABEL_11;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("settings")))
  {

    v6 = CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE")));
    v17[0] = CFSTR("url");
    v17[1] = CFSTR("sensitive");
    v18[0] = v7;
    v18[1] = &__kCFBooleanTrue;
    v8 = v18;
    v9 = v17;
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("sml-settings")))
  {

    v6 = CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/LOCATION_SHARING");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/LOCATION_SHARING")));
    v15[0] = CFSTR("url");
    v15[1] = CFSTR("sensitive");
    v16[0] = v7;
    v16[1] = &__kCFBooleanTrue;
    v8 = v16;
    v9 = v15;
    goto LABEL_10;
  }
  v10 = objc_msgSend(v5, "isEqualToString:", CFSTR("open-url"));
  v11 = 0;
  if (v6 && v10)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
    v13[0] = CFSTR("url");
    v13[1] = CFSTR("sensitive");
    v14[0] = v7;
    v14[1] = &__kCFBooleanFalse;
    v8 = v14;
    v9 = v13;
    goto LABEL_10;
  }
LABEL_11:

  return v11;
}

- (void)deviceNameChanged:(id)a3
{
  -[FindBaseServiceProvider registerDeviceWithCause:](self, "registerDeviceWithCause:", CFSTR("DeviceNameChanged"));
}

- (void)locationServicesStateChanged:(id)a3
{
  -[FindBaseServiceProvider registerDeviceWithCause:](self, "registerDeviceWithCause:", CFSTR("LocationServicesStateChanged"));
}

- (void)fmfLocationServicesStateChanged:(id)a3
{
  -[FindBaseServiceProvider registerDeviceWithCause:](self, "registerDeviceWithCause:", CFSTR("FMFLocationServicesStateChanged"));
}

- (void)localeChanged:(id)a3
{
  -[FindBaseServiceProvider registerDeviceWithCause:](self, "registerDeviceWithCause:", CFSTR("LocaleChanged"));
}

- (void)appInstallStateChanged:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_10001C638();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMFAppStateObserver", v6, 2u);
  }

  -[FindBaseServiceProvider registerDeviceWithCause:](self, "registerDeviceWithCause:", CFSTR("AppStateChanged"));
}

- (BOOL)shouldRegisterForWristMonitor
{
  return 0;
}

- (BOOL)shouldRegisterForNetworkMonitor
{
  return 0;
}

- (BOOL)enqueueRequest:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  BOOL v32;
  FindBaseServiceProvider *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  _BYTE v50[128];

  v34 = a3;
  v32 = -[FindBaseServiceProvider allowServerRequests](self, "allowServerRequests");
  if (v32)
  {
    v33 = self;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider requestModifierLock](self, "requestModifierLock"));
    objc_msgSend(v4, "lock");

    v5 = sub_10001C4E8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider fm_logID](v33, "fm_logID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "fm_logID"));
      *(_DWORD *)buf = 138412546;
      v44 = v7;
      v45 = 2112;
      v46 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ Enqueueing request %@", buf, 0x16u);

    }
    objc_msgSend(v34, "setDelegate:", v33);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider requests](v33, "requests"));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v34, "canReplace:", v14))
            objc_msgSend(v9, "addObject:", v14);
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
      }
      while (v11);
    }

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v15 = v9;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(_QWORD *)v36 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j);
          v20 = sub_10001C4E8();
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider fm_logID](v33, "fm_logID"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "fm_logID"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "fm_logID"));
            *(_DWORD *)buf = 138412802;
            v44 = v22;
            v45 = 2112;
            v46 = v23;
            v47 = 2112;
            v48 = v24;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%@ Discarding %@ because a newer request %@ can replace this one", buf, 0x20u);

          }
          objc_msgSend(v19, "cancel");
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
      }
      while (v16);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider requests](v33, "requests"));
    objc_msgSend(v25, "addObject:", v34);

    objc_msgSend(v34, "send");
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider requestModifierLock](v33, "requestModifierLock"));
    objc_msgSend(v26, "unlock");

  }
  else
  {
    v27 = sub_10001C4E8();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider fm_logID](self, "fm_logID"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "fm_logID"));
      *(_DWORD *)buf = 138412546;
      v44 = v29;
      v45 = 2112;
      v46 = v30;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%@: Not sending request %@ to server since the provider is not allowing server requests", buf, 0x16u);

    }
  }

  return v32;
}

- (void)didReceiveResponseFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  if (objc_msgSend(v4, "responseErrorType") == (id)257)
    -[FindBaseServiceProvider didReceiveAuthFailureForRequest:](self, "didReceiveAuthFailureForRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alertFromServerResponse"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alertFromServerResponse"));
    -[FindBaseServiceProvider showAlertFromServerResponse:](self, "showAlertFromServerResponse:", v6);

  }
  if ((objc_msgSend(v4, "willRetry") & 1) == 0)
  {
    v7 = sub_10001C4E8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider fm_logID](self, "fm_logID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fm_logID"));
      v14 = 138412546;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ Removing request %@ from the queue as it was completed or it exhausted its retries", (uint8_t *)&v14, 0x16u);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider requestModifierLock](self, "requestModifierLock"));
    objc_msgSend(v11, "lock");

    objc_msgSend(v4, "deinitializeRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider requests](self, "requests"));
    objc_msgSend(v12, "removeObject:", v4);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider requestModifierLock](self, "requestModifierLock"));
    objc_msgSend(v13, "unlock");

  }
}

- (void)didCancelRequest:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = sub_10001C4E8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider fm_logID](self, "fm_logID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fm_logID"));
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ Removing request %@ from the queue as it was cancelled", (uint8_t *)&v12, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v9, "lock");

  objc_msgSend(v4, "deinitializeRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider requests](self, "requests"));
  objc_msgSend(v10, "removeObject:", v4);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v11, "unlock");

}

- (void)_beginXPCTransaction
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%X"), v5, self));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v6, "beginTransaction:", v7);

}

- (void)_endXPCTransaction
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%X"), v5, self));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v6, "endTransaction:", v7);

}

- (NSString)apsToken
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setApsToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (Locator)standardLocator
{
  return self->_standardLocator;
}

- (void)setStandardLocator:(id)a3
{
  objc_storeStrong((id *)&self->_standardLocator, a3);
}

- (BOOL)allowServerRequests
{
  return self->_allowServerRequests;
}

- (void)setAllowServerRequests:(BOOL)a3
{
  self->_allowServerRequests = a3;
}

- (void)setLastForcedRegisterTimePrefKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSMutableArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
  objc_storeStrong((id *)&self->_requests, a3);
}

- (NSRecursiveLock)requestModifierLock
{
  return self->_requestModifierLock;
}

- (void)setRequestModifierLock:(id)a3
{
  objc_storeStrong((id *)&self->_requestModifierLock, a3);
}

- (BOOL)completedStartupRegister
{
  return self->_completedStartupRegister;
}

- (void)setCompletedStartupRegister:(BOOL)a3
{
  self->_completedStartupRegister = a3;
}

- (OS_dispatch_queue)registerQueue
{
  return self->_registerQueue;
}

- (void)setRegisterQueue:(id)a3
{
  objc_storeStrong((id *)&self->_registerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registerQueue, 0);
  objc_storeStrong((id *)&self->_requestModifierLock, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_lastForcedRegisterTimePrefKey, 0);
  objc_storeStrong((id *)&self->_standardLocator, 0);
  objc_storeStrong((id *)&self->_apsToken, 0);
}

@end
