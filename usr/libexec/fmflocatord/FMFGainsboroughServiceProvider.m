@implementation FMFGainsboroughServiceProvider

+ (BOOL)isSimulationActive
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v3 = objc_msgSend(v2, "isInternalBuild");

  if (v3)
    return +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("GainsboroughSimulationWatch"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
  else
    return 0;
}

- (FMFGainsboroughServiceProvider)init
{
  FMFGainsboroughServiceProvider *v2;
  FMFGainsboroughServiceProvider *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMFGainsboroughServiceProvider;
  v2 = -[FMFServiceProvider init](&v5, "init");
  v3 = v2;
  if (v2)
    -[FMFGainsboroughServiceProvider logState](v2, "logState");
  return v3;
}

- (id)udid
{
  return +[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", CFSTR("GainsboroughWatchUDID"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
}

- (id)deviceName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "deviceName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR("_gainsborough")));

  return v4;
}

- (id)connectionStatusString
{
  __CFString *v2;
  unint64_t v3;
  __CFString *v4;

  v2 = CFSTR("unknown");
  v3 = (unint64_t)+[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", CFSTR("GainsboroughConnectionStatus"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
  if (v3 <= 3)
  {
    v4 = *(&off_100054FC0)[v3];

    v2 = v4;
  }
  return v2;
}

- (id)wristStatusString
{
  __CFString *v2;
  id v3;
  __CFString **v4;
  __CFString *v5;

  v2 = CFSTR("Unknown");
  v3 = +[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", CFSTR("GainsboroughWristStatus"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
  if (!v3)
  {
    v4 = &off_100056160;
    goto LABEL_5;
  }
  if (v3 == (id)1)
  {
    v4 = &off_100056158;
LABEL_5:
    v5 = *v4;

    v2 = v5;
  }
  return v2;
}

- (id)lastOnWristTime
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFGainsboroughServiceProvider wristStatusString](self, "wristStatusString"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("on"));

  if ((v5 & 1) != 0)
  {
    -[FMFGainsboroughServiceProvider setLastOnWristDate:](self, "setLastOnWristDate:", v3);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFGainsboroughServiceProvider lastOnWristDate](self, "lastOnWristDate"));

    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateByAddingTimeInterval:", -300.0));
      -[FMFGainsboroughServiceProvider setLastOnWristDate:](self, "setLastOnWristDate:", v7);

    }
    v8 = objc_claimAutoreleasedReturnValue(-[FMFGainsboroughServiceProvider lastOnWristDate](self, "lastOnWristDate"));

    v3 = (void *)v8;
  }
  return v3;
}

- (id)lastActiveDate
{
  char *v2;
  double v3;

  v2 = (char *)+[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", CFSTR("GainsboroughLastActiveTime"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
  if ((unint64_t)(v2 - 1) > 3)
    v3 = -0.0;
  else
    v3 = dbl_100049CF0[(_QWORD)(v2 - 1)];
  return +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", v3);
}

- (id)companionUDID
{
  return +[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", CFSTR("GainsboroughPhoneUDID"), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
}

- (void)logState
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider simulation active", (uint8_t *)&v26, 2u);
  }

  v5 = sub_10001C4E8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFGainsboroughServiceProvider udid](self, "udid"));
    v26 = 138412290;
    v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider udid %@", (uint8_t *)&v26, 0xCu);

  }
  v8 = sub_10001C4E8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMFGainsboroughServiceProvider deviceName](self, "deviceName"));
    v26 = 138412290;
    v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider deviceName %@", (uint8_t *)&v26, 0xCu);

  }
  v11 = sub_10001C4E8();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMFGainsboroughServiceProvider connectionStatusString](self, "connectionStatusString"));
    v26 = 138412290;
    v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider connectionStatusString %@", (uint8_t *)&v26, 0xCu);

  }
  v14 = sub_10001C4E8();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMFGainsboroughServiceProvider wristStatusString](self, "wristStatusString"));
    v26 = 138412290;
    v27 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider wristStatusString %@", (uint8_t *)&v26, 0xCu);

  }
  v17 = sub_10001C4E8();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMFGainsboroughServiceProvider lastActiveDate](self, "lastActiveDate"));
    v26 = 138412290;
    v27 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider lastActiveDate %@", (uint8_t *)&v26, 0xCu);

  }
  v20 = sub_10001C4E8();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMFGainsboroughServiceProvider companionUDID](self, "companionUDID"));
    v26 = 138412290;
    v27 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider companionUDID %@", (uint8_t *)&v26, 0xCu);

  }
  v23 = sub_10001C4E8();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMFGainsboroughServiceProvider companionUDID](self, "companionUDID"));
    v26 = 138412290;
    v27 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider pairingId %@", (uint8_t *)&v26, 0xCu);

  }
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
  uint64_t v28;

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
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServiceProvider serviceIdentifierInURL](self, "serviceIdentifierInURL"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServiceProvider serviceIdentifierInURL](self, "serviceIdentifierInURL"));
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
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMFGainsboroughServiceProvider udid](self, "udid"));
  if (v27)
  {
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("${udid}"), v27));

    v4 = (id)v28;
  }

  return v4;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  int v31;
  id v32;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FindBaseServiceProvider apsToken](self, "apsToken"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("aps-token"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFConfig sharedInstance](FMFConfig, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "isLocationServicesEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("locationServicesEnabled"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMFConfig sharedInstance](FMFConfig, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "isLocationServicesEnabledForShareMyLocation")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("smlLS"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFGainsboroughServiceProvider deviceName](self, "deviceName"));
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

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMFGainsboroughServiceProvider connectionStatusString](self, "connectionStatusString"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("connectionStatus"), v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMFGainsboroughServiceProvider wristStatusString](self, "wristStatusString"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("wristStatus"), v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMFGainsboroughServiceProvider lastOnWristTime](self, "lastOnWristTime"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v21, "fm_epoch")));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("lastOnWristTime"), v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v23, "hasCellularCapability")));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("hasGainsborough"), v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[FMFFencesMgr sharedInstance](FMFFencesMgr, "sharedInstance"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "fenceVersion"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("fenceVersion"), v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMFGainsboroughServiceProvider _constructPairedDevicesInfo](self, "_constructPairedDevicesInfo"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("otherDevices"));
  v28 = sub_10001C4E8();
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v31 = 138412290;
    v32 = v3;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider simulated device info %@", (uint8_t *)&v31, 0xCu);
  }

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
  id v22;
  NSObject *v23;
  int v25;
  id v26;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("productType"), CFSTR("Watch3,1"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("productVersion"), CFSTR("4.0"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFGainsboroughServiceProvider udid](self, "udid"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("udid"), v4);

  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("deviceClass"), CFSTR("watch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "buildVersion"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("buildVersion"), v6);

  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("platform"), CFSTR("watchos"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "isInternalBuild")));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("isInternal"), v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serialNumber"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("serialNumber"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProvider account](self, "account"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "versionHistory"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", CFSTR(",")));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("versionHistory"), v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "deviceColor"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("deviceColor"), v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "deviceEnclosureColor"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("enclosureColor"), v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v18, "forceTouchAvailable")));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("supportsForceTouch"), v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v20, "isRegionMonitoringAvailable")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("fenceMonitoringCapable"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("supportsNotifyV2"));
  v22 = sub_10001C4E8();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138412290;
    v26 = v3;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider simulated device info %@", (uint8_t *)&v25, 0xCu);
  }

  return v3;
}

- (id)_constructLocationDeviceInfo
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t buf[4];
  id v11;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFGainsboroughServiceProvider udid](self, "udid"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("udid"), v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "batteryStats");

  v7 = sub_10001C4E8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider simulated device info %@", buf, 0xCu);
  }

  return v3;
}

- (id)_constructPairedDevicesInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  int v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFGainsboroughServiceProvider lastActiveDate](self, "lastActiveDate"));
  v6 = v5;
  if (v5)
    v7 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v5, "fm_epoch")));
  else
    v7 = &off_10005AEC0;
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("lastActiveTime"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFGainsboroughServiceProvider companionUDID](self, "companionUDID"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("udid"), v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFGainsboroughServiceProvider companionUDID](self, "companionUDID"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("pairingId"), v9);

  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("productType"), CFSTR("iPhone6,1"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("deviceClass"), CFSTR("iPhone"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("platform"), CFSTR("iphoneos"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("deviceName"), CFSTR("Gainsborough's iPhone"));
  objc_msgSend(v3, "addObject:", v4);
  v10 = sub_10001C4E8();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FMFGainsboroughServiceProvider simulated paired device info %@", (uint8_t *)&v13, 0xCu);
  }

  return v3;
}

- (NSDate)lastOnWristDate
{
  return self->_lastOnWristDate;
}

- (void)setLastOnWristDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastOnWristDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastOnWristDate, 0);
}

@end
