@implementation DPSQuickRecoveryRecommendationEngine

- (DPSQuickRecoveryRecommendationEngine)init
{
  DPSQuickRecoveryRecommendationEngine *v2;
  uint64_t v3;
  RecommendationPreferences *preferences;
  uint32_t v5;
  id v7;
  NSObject *v8;
  const char *v9;
  id v10;
  NSObject *v11;
  uint32_t v12;
  uint32_t v13;
  id v14;
  id v15;
  NSObject *v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint32_t v23;

  v17.receiver = self;
  v17.super_class = (Class)DPSQuickRecoveryRecommendationEngine;
  v2 = -[DPSQuickRecoveryRecommendationEngine init](&v17, "init");
  if (!v2)
  {
    v7 = WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_DWORD *)buf = 136446466;
    v19 = "-[DPSQuickRecoveryRecommendationEngine init]";
    v20 = 1024;
    v21 = 83;
    v9 = "%{public}s::%d:Error in super init failed";
LABEL_9:
    v11 = v8;
    v12 = 18;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v9, buf, v12);
    goto LABEL_13;
  }
  v3 = objc_claimAutoreleasedReturnValue(+[RecommendationPreferences sharedObject](RecommendationPreferences, "sharedObject"));
  preferences = v2->_preferences;
  v2->_preferences = (RecommendationPreferences *)v3;

  if (!v2->_preferences)
  {
    v10 = WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_DWORD *)buf = 136446466;
    v19 = "-[DPSQuickRecoveryRecommendationEngine init]";
    v20 = 1024;
    v21 = 86;
    v9 = "%{public}s::%d:Error RecommendationPreferences init";
    goto LABEL_9;
  }
  v5 = notify_register_check("com.apple.springboard.hasBlankedScreen", &v2->screenStateToken);
  if (!v5)
    return v2;
  v13 = v5;
  v14 = WALogCategoryDefaultHandle();
  v8 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v19 = "-[DPSQuickRecoveryRecommendationEngine init]";
    v20 = 1024;
    v21 = 89;
    v22 = 1024;
    v23 = v13;
    v9 = "%{public}s::%d:notify_register_check() for screenstate failed with %u";
    v11 = v8;
    v12 = 24;
    goto LABEL_12;
  }
LABEL_13:

  v15 = WALogCategoryDefaultHandle();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v19 = "-[DPSQuickRecoveryRecommendationEngine init]";
    v20 = 1024;
    v21 = 97;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:FAILED to initialize!", buf, 0x12u);
  }

  return 0;
}

- (id)updateDpsStats:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

  objc_msgSend(v5, "addEntriesFromDictionary:", self->_dpsQuickRecoveryWDBudgetDict);
  objc_msgSend(v5, "addEntriesFromDictionary:", self->_dpsStats);
  return v5;
}

- (void)addNumRecommendedScreenOnQuickRecoveryWD
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  unsigned int v14;

  v3 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsQuickRecoveryWDBudgetDict, "valueForKey:", CFSTR("dps_numRecommendedScreenOnQuickRecoveryWD")));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(0, "intValue") + 1));
  }
  -[NSMutableDictionary setObject:forKey:](self->_dpsQuickRecoveryWDBudgetDict, "setObject:forKey:", v5, CFSTR("dps_numRecommendedScreenOnQuickRecoveryWD"));
  v6 = WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsQuickRecoveryWDBudgetDict, "valueForKey:", CFSTR("dps_numRecommendedScreenOnQuickRecoveryWD")));
    v9 = 136446722;
    v10 = "-[DPSQuickRecoveryRecommendationEngine addNumRecommendedScreenOnQuickRecoveryWD]";
    v11 = 1024;
    v12 = 121;
    v13 = 1024;
    v14 = objc_msgSend(v8, "intValue") - 1;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:number screen-on fast resets triggered previously: %d", (uint8_t *)&v9, 0x18u);

  }
}

- (void)addNumRecommendedScreenOffQuickRecoveryWD
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  unsigned int v14;

  v3 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsQuickRecoveryWDBudgetDict, "valueForKey:", CFSTR("dps_numRecommendedScreenOffQuickRecoveryWD")));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(0, "intValue") + 1));
  }
  -[NSMutableDictionary setObject:forKey:](self->_dpsQuickRecoveryWDBudgetDict, "setObject:forKey:", v5, CFSTR("dps_numRecommendedScreenOffQuickRecoveryWD"));
  v6 = WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsQuickRecoveryWDBudgetDict, "valueForKey:", CFSTR("dps_numRecommendedScreenOffQuickRecoveryWD")));
    v9 = 136446722;
    v10 = "-[DPSQuickRecoveryRecommendationEngine addNumRecommendedScreenOffQuickRecoveryWD]";
    v11 = 1024;
    v12 = 133;
    v13 = 1024;
    v14 = objc_msgSend(v8, "intValue") - 1;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:number screen-off fast resets triggered previously: %d", (uint8_t *)&v9, 0x18u);

  }
}

- (void)addNumSuppressedScreenOnQuickRecoveryWD
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  unsigned int v14;

  v3 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsQuickRecoveryWDBudgetDict, "valueForKey:", CFSTR("dps_numSuppressedScreenOnQuickRecoveryWD")));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(0, "intValue") + 1));
  }
  -[NSMutableDictionary setObject:forKey:](self->_dpsQuickRecoveryWDBudgetDict, "setObject:forKey:", v5, CFSTR("dps_numSuppressedScreenOnQuickRecoveryWD"));
  v6 = WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsQuickRecoveryWDBudgetDict, "valueForKey:", CFSTR("dps_numSuppressedScreenOnQuickRecoveryWD")));
    v9 = 136446722;
    v10 = "-[DPSQuickRecoveryRecommendationEngine addNumSuppressedScreenOnQuickRecoveryWD]";
    v11 = 1024;
    v12 = 145;
    v13 = 1024;
    v14 = objc_msgSend(v8, "intValue") - 1;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:number screen-on fast resets suppressed previously: %d", (uint8_t *)&v9, 0x18u);

  }
}

- (void)addNumSuppressedScreenOffQuickRecoveryWD
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  unsigned int v14;

  v3 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsQuickRecoveryWDBudgetDict, "valueForKey:", CFSTR("dps_numSuppressedScreenOffQuickRecoveryWD")));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(0, "intValue") + 1));
  }
  -[NSMutableDictionary setObject:forKey:](self->_dpsQuickRecoveryWDBudgetDict, "setObject:forKey:", v5, CFSTR("dps_numSuppressedScreenOffQuickRecoveryWD"));
  v6 = WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsQuickRecoveryWDBudgetDict, "valueForKey:", CFSTR("dps_numSuppressedScreenOffQuickRecoveryWD")));
    v9 = 136446722;
    v10 = "-[DPSQuickRecoveryRecommendationEngine addNumSuppressedScreenOffQuickRecoveryWD]";
    v11 = 1024;
    v12 = 157;
    v13 = 1024;
    v14 = objc_msgSend(v8, "intValue") - 1;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:number screen-off fast resets suppressed previously: %d", (uint8_t *)&v9, 0x18u);

  }
}

- (BOOL)isForegroundTrafficPresent
{
  const void *v2;
  CFRunLoopRef Current;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  CFRunLoopRef v15;
  char *v17;
  _BYTE buf[24];
  void *v19;

  v2 = (const void *)sub_10003535C((uint64_t)kCFAllocatorDefault);
  if (!v2)
  {
    v10 = WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[DPSQuickRecoveryRecommendationEngine isForegroundTrafficPresent]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 168;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error managerClient init failed", buf, 0x12u);
    }
    goto LABEL_14;
  }
  Current = CFRunLoopGetCurrent();
  sub_100035418((uint64_t)v2, (uint64_t)Current);
  v4 = (void *)sub_1000354E0((uint64_t)v2);
  if (!v4)
  {
    v12 = WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[DPSQuickRecoveryRecommendationEngine isForegroundTrafficPresent]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 173;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:No WiFi Devices present! Defaulting to screen state for decision!", buf, 0x12u);
    }
LABEL_14:

    v5 = 0;
    goto LABEL_18;
  }
  v5 = v4;
  if (!objc_msgSend(v4, "count"))
  {
LABEL_18:
    v9 = 1;
    goto LABEL_19;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));

  if (!v6)
  {
    v13 = WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[DPSQuickRecoveryRecommendationEngine isForegroundTrafficPresent]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 177;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:DeviceClient not present! Defaulting to screen state for decision!", buf, 0x12u);
    }

    goto LABEL_18;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v7 = off_1000ED028;
  v19 = off_1000ED028;
  if (!off_1000ED028)
  {
    v8 = (void *)sub_10003C298();
    v7 = dlsym(v8, "WiFiDeviceClientGetAppState");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v7;
    off_1000ED028 = v7;
  }
  _Block_object_dispose(buf, 8);
  if (!v7)
  {
    v17 = dlerror();
    abort_report_np("%s", v17);
    __break(1u);
  }
  v9 = ((unsigned int (*)(void *))v7)(v6) != 0;
LABEL_19:
  v15 = CFRunLoopGetCurrent();
  sub_100035598((uint64_t)v2, (uint64_t)v15);
  if (v2)
    CFRelease(v2);

  return v9;
}

- (void)updateScreenState
{
  uint64_t v3;
  unsigned __int8 v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  const char *v8;
  _BOOL4 screenON;
  uint64_t state64;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;

  state64 = 0;
  notify_get_state(self->screenStateToken, &state64);
  v3 = state64;
  v4 = -[DPSQuickRecoveryRecommendationEngine isForegroundTrafficPresent](self, "isForegroundTrafficPresent");
  if (v3 == 1)
    v5 = 0;
  else
    v5 = v4;
  self->screenON = v5;
  v6 = WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "DETECTED";
    screenON = self->screenON;
    v12 = "-[DPSQuickRecoveryRecommendationEngine updateScreenState]";
    *(_DWORD *)buf = 136446722;
    if (!screenON)
      v8 = "NOT DETECTED";
    v13 = 1024;
    v14 = 198;
    v15 = 2080;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS Fast Reset Recommendation Engine: (screenON & foreGrnd traffic) is %s", buf, 0x1Cu);
  }

}

- (void)updateSymptomsDPSRecoveryWDStatsForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  unsigned int v10;
  NSMutableDictionary *dpsQuickRecoveryWDBudgetDict;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  NSMutableDictionary *v21;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsQuickRecoveryWDBudgetDict, "valueForKey:", v4));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(0, "intValue") + 1));
  }
  -[NSMutableDictionary setObject:forKey:](self->_dpsQuickRecoveryWDBudgetDict, "setObject:forKey:", v7, v4);
  v8 = WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v7, "intValue");
    dpsQuickRecoveryWDBudgetDict = self->_dpsQuickRecoveryWDBudgetDict;
    v12 = 136447234;
    v13 = "-[DPSQuickRecoveryRecommendationEngine updateSymptomsDPSRecoveryWDStatsForKey:]";
    v14 = 1024;
    v15 = 210;
    v16 = 2112;
    v17 = v4;
    v18 = 1024;
    v19 = v10;
    v20 = 2112;
    v21 = dpsQuickRecoveryWDBudgetDict;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Added key: %@ value:%d dict:%@", (uint8_t *)&v12, 0x2Cu);
  }

}

- (BOOL)isPriorityNetwork
{
  const void *v2;
  CFRunLoopRef Current;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  CFRunLoopRef v13;
  id v15;
  const char *v16;
  id v17;
  id v18;
  NSObject *v19;
  char *v20;
  _BYTE buf[24];
  void *v22;

  v2 = (const void *)sub_10003535C((uint64_t)kCFAllocatorDefault);
  if (!v2)
  {
    v15 = WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[DPSQuickRecoveryRecommendationEngine isPriorityNetwork]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 222;
    v16 = "%{public}s::%d:Error managerClient init failed";
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, v16, buf, 0x12u);
    goto LABEL_26;
  }
  Current = CFRunLoopGetCurrent();
  sub_100035418((uint64_t)v2, (uint64_t)Current);
  v4 = sub_1000354E0((uint64_t)v2);
  if (!v4)
  {
    v17 = WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[DPSQuickRecoveryRecommendationEngine isPriorityNetwork]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 227;
    v16 = "%{public}s::%d:No WiFi Devices present! Defaulting to screen state for decision!";
    goto LABEL_21;
  }
  v5 = v4;
  if (!-[NSObject count](v4, "count"))
  {
    v9 = 0;
    goto LABEL_10;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", 0));

  if (v6)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v7 = off_1000ED038;
    v22 = off_1000ED038;
    if (!off_1000ED038)
    {
      v8 = (void *)sub_10003C298();
      v7 = dlsym(v8, "WiFiDeviceClientCopyCurrentNetwork");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v7;
      off_1000ED038 = v7;
    }
    _Block_object_dispose(buf, 8);
    if (!v7)
      goto LABEL_27;
    v9 = ((uint64_t (*)(void *))v7)(v6);
LABEL_10:
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v10 = off_1000ED040;
    v22 = off_1000ED040;
    if (!off_1000ED040)
    {
      v11 = (void *)sub_10003C298();
      v10 = dlsym(v11, "WiFiNetworkIsPriorityNetworkWrapper");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v10;
      off_1000ED040 = v10;
    }
    _Block_object_dispose(buf, 8);
    if (v10)
    {
      v12 = ((uint64_t (*)(uint64_t))v10)(v9) != 0;
      goto LABEL_14;
    }
LABEL_27:
    v20 = dlerror();
    abort_report_np("%s", v20);
    __break(1u);
  }
  v18 = WALogCategoryDefaultHandle();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[DPSQuickRecoveryRecommendationEngine isPriorityNetwork]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 231;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:DeviceClient not present! Defaulting to screen state for decision!", buf, 0x12u);
  }

LABEL_26:
  v12 = 0;
LABEL_14:

  v13 = CFRunLoopGetCurrent();
  sub_100035598((uint64_t)v2, (uint64_t)v13);
  if (v2)
    CFRelease(v2);
  return v12;
}

- (BOOL)checkForPriorityNetwork
{
  _BOOL4 v3;
  id v4;
  NSObject *v5;
  unsigned int v6;
  const char *v7;
  const char *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;

  if (-[RecommendationPreferences disable_slow_wifi_dps_is_priority_network](self->_preferences, "disable_slow_wifi_dps_is_priority_network"))
  {
    v3 = 1;
  }
  else
  {
    v3 = -[DPSQuickRecoveryRecommendationEngine isPriorityNetwork](self, "isPriorityNetwork");
  }
  v4 = WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[RecommendationPreferences disable_slow_wifi_dps_is_priority_network](self->_preferences, "disable_slow_wifi_dps_is_priority_network");
    v7 = "NO";
    v11 = "-[DPSQuickRecoveryRecommendationEngine checkForPriorityNetwork]";
    v12 = 1024;
    v13 = 256;
    if (v6)
      v8 = "YES";
    else
      v8 = "NO";
    v10 = 136446978;
    v15 = v8;
    v14 = 2080;
    if (v3)
      v7 = "YES";
    v16 = 2080;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Priority Network Check Disabled: %s IsPriorityNetwork: %s", (uint8_t *)&v10, 0x26u);
  }

  return v3;
}

- (BOOL)isResetAllowedForSymptomsDPS
{
  unsigned int v3;
  BOOL v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;

  if (self->screenON)
  {
    v3 = -[DPSQuickRecoveryRecommendationEngine isResetAllowedForKey:forPrefSelector:](self, "isResetAllowedForKey:forPrefSelector:", CFSTR("symptomsDps_lastScreenOnRecoveryWD"), "minutes_between_symptoms_dps_wd_screen_on");
    v4 = v3;
    v5 = CFSTR("symptomsDps_numSuppressedScreenOnRecoveryWD");
    v6 = CFSTR("symptomsDps_numRecommendedScreenOnRecoveryWD");
  }
  else
  {
    v3 = -[DPSQuickRecoveryRecommendationEngine isResetAllowedForKey:forPrefSelector:](self, "isResetAllowedForKey:forPrefSelector:", CFSTR("symptomsDps_lastScreenOffRecoveryWD"), "minutes_between_symptoms_dps_wd_screen_off");
    v4 = v3;
    v5 = CFSTR("symptomsDps_numSuppressedScreenOffRecoveryWD");
    v6 = CFSTR("symptomsDps_numRecommendedScreenOffRecoveryWD");
  }
  if (v3)
    v7 = v6;
  else
    v7 = v5;
  -[DPSQuickRecoveryRecommendationEngine updateSymptomsDPSRecoveryWDStatsForKey:](self, "updateSymptomsDPSRecoveryWDStatsForKey:", v7);
  return v4;
}

- (BOOL)isResetAllowedForQuickDPS
{
  if (!self->screenON)
  {
    if (-[DPSQuickRecoveryRecommendationEngine isResetAllowedForKey:forPrefSelector:](self, "isResetAllowedForKey:forPrefSelector:", CFSTR("dps_lastScreenOffQuickRecoveryWD"), "minutes_between_fast_dps_wd_screen_off"))
    {
      goto LABEL_6;
    }
    if (!-[DPSQuickRecoveryRecommendationEngine isResetAllowedForKey:forPrefSelector:](self, "isResetAllowedForKey:forPrefSelector:", CFSTR("dps_lastScreenOnQuickRecoveryWD"), "minutes_between_fast_dps_wd_screen_on"))
    {
      -[DPSQuickRecoveryRecommendationEngine addNumSuppressedScreenOffQuickRecoveryWD](self, "addNumSuppressedScreenOffQuickRecoveryWD");
      return 0;
    }
LABEL_8:
    -[DPSQuickRecoveryRecommendationEngine addNumRecommendedScreenOnQuickRecoveryWD](self, "addNumRecommendedScreenOnQuickRecoveryWD");
    return 1;
  }
  if (-[DPSQuickRecoveryRecommendationEngine isResetAllowedForKey:forPrefSelector:](self, "isResetAllowedForKey:forPrefSelector:", CFSTR("dps_lastScreenOnQuickRecoveryWD"), "minutes_between_fast_dps_wd_screen_on"))
  {
    goto LABEL_8;
  }
  if (-[DPSQuickRecoveryRecommendationEngine isResetAllowedForKey:forPrefSelector:](self, "isResetAllowedForKey:forPrefSelector:", CFSTR("dps_lastScreenOffQuickRecoveryWD"), "minutes_between_fast_dps_wd_screen_off"))
  {
LABEL_6:
    -[DPSQuickRecoveryRecommendationEngine addNumRecommendedScreenOffQuickRecoveryWD](self, "addNumRecommendedScreenOffQuickRecoveryWD");
    return 1;
  }
  -[DPSQuickRecoveryRecommendationEngine addNumSuppressedScreenOnQuickRecoveryWD](self, "addNumSuppressedScreenOnQuickRecoveryWD");
  return 0;
}

- (BOOL)isResetAllowedForKey:(id)a3 forPrefSelector:(SEL)a4
{
  id v6;
  void *v7;
  unsigned int (*v8)(RecommendationPreferences *, SEL);
  void *v9;
  double v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  const char *v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (unsigned int (*)(RecommendationPreferences *, SEL))-[RecommendationPreferences methodForSelector:](self->_preferences, "methodForSelector:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsQuickRecoveryWDBudgetDict, "valueForKey:", v6));
  if (v9 && (objc_msgSend(v7, "timeIntervalSinceDate:", v9), (int)(v10 / 60.0) < v8(self->_preferences, a4)))
  {
    v11 = 0;
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](self->_dpsQuickRecoveryWDBudgetDict, "setObject:forKey:", v7, v6);
    v11 = 1;
  }
  v12 = WALogCategoryDefaultHandle();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v17 = "-[DPSQuickRecoveryRecommendationEngine isResetAllowedForKey:forPrefSelector:]";
    v14 = "NO";
    v18 = 1024;
    v19 = 330;
    v16 = 136447490;
    if (v11)
      v14 = "YES";
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v7;
    v26 = 2080;
    v27 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:key:%@ previousWD_TS:%@ currentWD_TS:%@ recommendation:%s", (uint8_t *)&v16, 0x3Au);
  }

  return v11;
}

- (id)computeFeatures:(id)a3 currentSample:(id)a4 acList:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  int v17;
  int v18;
  int v19;
  unsigned int v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char *v28;
  double v29;
  unint64_t v30;
  unsigned int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  double v49;
  unsigned int v50;
  unint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  double v68;
  unsigned int v69;
  unint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  void *j;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  uint64_t v98;
  void *k;
  void *v100;
  void *v101;
  unsigned int v102;
  void *v103;
  unsigned int v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  unsigned int v109;
  void *v110;
  void *v111;
  void *v112;
  unsigned int v113;
  void *v114;
  unsigned int v115;
  unsigned int v116;
  int v117;
  unsigned int v118;
  id v119;
  NSObject *v120;
  id v121;
  NSObject *v122;
  id v123;
  NSObject *v124;
  id v125;
  NSObject *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  unsigned int v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  id v209;
  NSObject *v210;
  unsigned int v211;
  id v212;
  NSObject *v213;
  id v214;
  NSObject *v215;
  id v216;
  NSObject *v217;
  id v218;
  NSObject *v219;
  id v220;
  NSObject *v221;
  id v222;
  NSObject *v223;
  id v224;
  NSObject *v225;
  id v226;
  NSObject *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  unsigned int v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  id v248;
  NSObject *v249;
  id v250;
  NSObject *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  unsigned int v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  id v290;
  NSObject *v291;
  id v292;
  NSObject *v293;
  id v294;
  NSObject *v295;
  id v296;
  NSObject *v297;
  WiFiStallDetectInput *v298;
  unsigned int v300;
  unsigned int v301;
  unsigned int v302;
  unsigned int v303;
  void *v304;
  unsigned int v305;
  void *v306;
  unsigned int v307;
  unsigned int v308;
  void *v309;
  unsigned int v310;
  unsigned int v311;
  unsigned int v312;
  unsigned int v313;
  void *v314;
  unsigned int v315;
  unsigned int v316;
  unsigned int v317;
  unsigned int v318;
  void *v319;
  unsigned int v320;
  unsigned int v321;
  unsigned int v322;
  unsigned int v323;
  void *v324;
  unsigned int v325;
  unsigned int v326;
  unsigned int v327;
  void *v328;
  id v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  id obj;
  unsigned int obja;
  uint64_t v338;
  unsigned int v339;
  id v340;
  unsigned int v341;
  id v342;
  unsigned int v343;
  unsigned int v344;
  char *v345;
  unsigned int v346;
  unsigned int v347;
  void *v348;
  unsigned int v349;
  char *v350;
  unint64_t v351;
  unint64_t v352;
  unsigned int v353;
  void *v354;
  unsigned int v355;
  unsigned int v356;
  unsigned int v357;
  id v358;
  id v359;
  unsigned int v360;
  void *v361;
  unsigned int v362;
  unsigned int v363;
  void *v364;
  unsigned int v365;
  id v366;
  void *v367;
  void *v368;
  unsigned int v369;
  void *v370;
  unsigned int v371;
  void *v372;
  unsigned int v373;
  unsigned int v374;
  void *v375;
  void *v376;
  void *v377;
  unsigned int v378;
  unsigned int v379;
  unsigned int v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  unsigned int v386;
  unsigned int v387;
  void *v388;
  void *v389;
  void *v390;
  unsigned int v391;
  unsigned int v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  __int128 v399;
  __int128 v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  _BYTE v405[128];
  uint8_t v406[128];
  uint8_t buf[4];
  const char *v408;
  __int16 v409;
  int v410;
  __int16 v411;
  _BYTE v412[10];
  double v413;
  int v414;
  __int16 v415;
  int v416;
  _BYTE v417[128];

  v329 = a3;
  v342 = a4;
  v7 = a5;
  v8 = WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 335;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Computing features for ML model...", buf, 0x12u);
  }

  v403 = 0u;
  v404 = 0u;
  v401 = 0u;
  v402 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v401, v417, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v402;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v402 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v401 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fieldForKey:", CFSTR("DPSN_symptom")));
        v16 = objc_msgSend(v15, "int32Value");

        if (!v16)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fieldForKey:", CFSTR("DPSN_problemAC")));
          v20 = objc_msgSend(v21, "uint32Value");

          v18 = (v20 >> 1) & 1;
          v19 = v20 & 1;
          v17 = (v20 >> 2) & 1;
          LODWORD(v11) = (v20 >> 3) & 1;
          goto LABEL_13;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v401, v417, 16);
      if (v11)
        continue;
      break;
    }
  }
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
LABEL_13:

  v22 = WALogCategoryDefaultHandle();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447746;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 358;
    v411 = 1024;
    *(_DWORD *)v412 = v20;
    *(_WORD *)&v412[4] = 1024;
    *(_DWORD *)&v412[6] = v19;
    LOWORD(v413) = 1024;
    *(_DWORD *)((char *)&v413 + 2) = v18;
    HIWORD(v413) = 1024;
    v414 = v17;
    v415 = 1024;
    v416 = (int)v11;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:problemAC: %u dpsBE:%d dpsBK:%d dpsVO:%d dpsVI:%d", buf, 0x30u);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "subMessageValue"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "fieldForKey:", CFSTR("NWAPS_ccas")));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "repeatableValues"));
  v28 = (char *)objc_msgSend(v27, "count");

  v29 = 0.0;
  v328 = v10;
  v327 = v20;
  if (v28)
  {
    v350 = v28 - 1;
    if (v28 != (char *)1)
    {
      v345 = v28;
      v30 = 0;
      v31 = 0;
      while (1)
      {
        v357 = v31;
        v388 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "fieldForKey:", CFSTR("DPSCS_peerStats")));
        v381 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v388, "subMessageValue"));
        v375 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v381, "fieldForKey:", CFSTR("NWAPS_ccas")));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v375, "repeatableValues"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndex:", v30));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "fieldForKey:", CFSTR("NWASB_residentTime")));
        v366 = objc_msgSend(v34, "uint64Value");
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "fieldForKey:", CFSTR("DPSCS_peerStats")));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "subMessageValue"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "fieldForKey:", CFSTR("NWAPS_ccas")));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "repeatableValues"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectAtIndex:", v30));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "fieldForKey:", CFSTR("NWASB_residentTime")));
        v41 = objc_msgSend(v40, "uint64Value");

        if (v366 != v41)
          break;
        v30 = v357 + 1;
        v31 = v357 + 1;
        if ((unint64_t)v350 <= v30)
          goto LABEL_22;
      }
      v29 = (double)v357;
LABEL_22:
      v28 = v345;
    }
  }
  v42 = WALogCategoryDefaultHandle();
  v43 = objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 374;
    v411 = 2048;
    *(_QWORD *)v412 = v28;
    *(_WORD *)&v412[8] = 2048;
    v413 = v29;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:ccaBinCount:%llu ccaBin:%.2f", buf, 0x26u);
  }

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "subMessageValue"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "fieldForKey:", CFSTR("NWAPS_rssis")));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "repeatableValues"));
  v48 = objc_msgSend(v47, "count");

  v49 = 0.0;
  v351 = (unint64_t)v48;
  if ((unint64_t)v48 >= 2)
  {
    v50 = 0;
    v51 = 1;
    while (1)
    {
      v389 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "fieldForKey:", CFSTR("DPSCS_peerStats")));
      v382 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v389, "subMessageValue"));
      v376 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v382, "fieldForKey:", CFSTR("NWAPS_rssis")));
      v367 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v376, "repeatableValues"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v367, "objectAtIndex:", v51));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "fieldForKey:", CFSTR("NWASB_residentTime")));
      v358 = objc_msgSend(v53, "uint64Value");
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "fieldForKey:", CFSTR("DPSCS_peerStats")));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "subMessageValue"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "fieldForKey:", CFSTR("NWAPS_rssis")));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "repeatableValues"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectAtIndex:", v51));
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "fieldForKey:", CFSTR("NWASB_residentTime")));
      v60 = objc_msgSend(v59, "uint64Value");

      if (v358 != v60)
        break;
      v51 = v50 + 2;
      ++v50;
      if (v351 <= v51)
        goto LABEL_31;
    }
    v49 = (double)v50;
  }
LABEL_31:
  v61 = WALogCategoryDefaultHandle();
  v62 = objc_claimAutoreleasedReturnValue(v61);
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 388;
    v411 = 2048;
    *(_QWORD *)v412 = v351;
    *(_WORD *)&v412[8] = 2048;
    v413 = v49;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:rssiBinCount:%llu rssiBin:%.2f", buf, 0x26u);
  }

  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "subMessageValue"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "fieldForKey:", CFSTR("NWAPS_snrs")));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "repeatableValues"));
  v67 = objc_msgSend(v66, "count");

  v68 = 0.0;
  v352 = (unint64_t)v67;
  if ((unint64_t)v67 >= 2)
  {
    v69 = 0;
    v70 = 1;
    while (1)
    {
      v390 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "fieldForKey:", CFSTR("DPSCS_peerStats")));
      v383 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v390, "subMessageValue"));
      v377 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v383, "fieldForKey:", CFSTR("NWAPS_snrs")));
      v368 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v377, "repeatableValues"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v368, "objectAtIndex:", v70));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "fieldForKey:", CFSTR("NWASB_residentTime")));
      v359 = objc_msgSend(v72, "uint64Value");
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "fieldForKey:", CFSTR("DPSCS_peerStats")));
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "subMessageValue"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "fieldForKey:", CFSTR("NWAPS_snrs")));
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "repeatableValues"));
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectAtIndex:", v70));
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "fieldForKey:", CFSTR("NWASB_residentTime")));
      v79 = objc_msgSend(v78, "uint64Value");

      if (v359 != v79)
        break;
      v70 = v69 + 2;
      ++v69;
      if (v352 <= v70)
        goto LABEL_39;
    }
    v68 = (double)v69;
  }
LABEL_39:
  v80 = WALogCategoryDefaultHandle();
  v81 = objc_claimAutoreleasedReturnValue(v80);
  if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 402;
    v411 = 2048;
    *(_QWORD *)v412 = v352;
    *(_WORD *)&v412[8] = 2048;
    v413 = v68;
    _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:snrBinCount:%llu snrBin:%.2f", buf, 0x26u);
  }

  v399 = 0u;
  v400 = 0u;
  v397 = 0u;
  v398 = 0u;
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "subMessageValue"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "fieldForKey:", CFSTR("NWAPS_acCompletions")));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "repeatableValues"));

  obj = v85;
  v340 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v397, v406, 16);
  if (v340)
  {
    v334 = 0;
    v335 = 0;
    v86 = 0;
    v332 = 0;
    v333 = 0;
    v87 = 0;
    v330 = 0;
    v331 = 0;
    v88 = 0;
    v89 = 0;
    v338 = *(_QWORD *)v398;
    do
    {
      for (j = 0; j != v340; j = (char *)j + 1)
      {
        v391 = v86;
        if (*(_QWORD *)v398 != v338)
          objc_enumerationMutation(obj);
        v91 = *(void **)(*((_QWORD *)&v397 + 1) + 8 * (_QWORD)j);
        v393 = 0u;
        v394 = 0u;
        v395 = 0u;
        v396 = 0u;
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "fieldForKey:", CFSTR("DPSCS_peerStats")));
        v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "subMessageValue"));
        v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "fieldForKey:", CFSTR("NWAPS_acCompletions")));
        v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "repeatableValues"));

        v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v393, v405, 16);
        if (v96)
        {
          v97 = v96;
          v360 = v87;
          v369 = v88;
          v378 = v89;
          v384 = j;
          v98 = *(_QWORD *)v394;
          while (2)
          {
            for (k = 0; k != v97; k = (char *)k + 1)
            {
              if (*(_QWORD *)v394 != v98)
                objc_enumerationMutation(v95);
              v100 = *(void **)(*((_QWORD *)&v393 + 1) + 8 * (_QWORD)k);
              v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "fieldForKey:", CFSTR("NWAPACTC_ac")));
              v102 = objc_msgSend(v101, "int32Value");

              v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "fieldForKey:", CFSTR("NWAPACTC_ac")));
              v104 = objc_msgSend(v103, "int32Value");

              if (v104 == v102)
              {
                v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "fieldForKey:", CFSTR("NWAPACTC_expiredComp")));
                v353 = objc_msgSend(v105, "uint32Value");
                v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "fieldForKey:", CFSTR("NWAPACTC_expiredComp")));
                v346 = objc_msgSend(v106, "uint32Value");

                v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "fieldForKey:", CFSTR("NWAPACTC_failedComp")));
                v343 = objc_msgSend(v107, "uint32Value");
                v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "fieldForKey:", CFSTR("NWAPACTC_failedComp")));
                v109 = objc_msgSend(v108, "uint32Value");

                v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "fieldForKey:", CFSTR("NWAPACTC_noAckComp")));
                LODWORD(v107) = objc_msgSend(v110, "uint32Value");
                v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "fieldForKey:", CFSTR("NWAPACTC_noAckComp")));
                LODWORD(v108) = objc_msgSend(v111, "uint32Value");

                v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "fieldForKey:", CFSTR("NWAPACTC_otherErrComp")));
                v113 = objc_msgSend(v112, "uint32Value");
                v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "fieldForKey:", CFSTR("NWAPACTC_otherErrComp")));
                v115 = objc_msgSend(v114, "uint32Value");

                v116 = v102 - 2;
                v89 = v353 - v346;
                v117 = (_DWORD)v107 - (_DWORD)v108;
                v118 = v113 - v115;
                v86 = v343 - v109;
                v87 = v117;
                v88 = v113 - v115;
                j = v384;
                switch(v116)
                {
                  case 0u:
                    HIDWORD(v334) = v353 - v346;
                    v86 = v391;
                    LODWORD(v333) = v343 - v109;
                    v87 = v360;
                    HIDWORD(v331) = v117;
                    v88 = v369;
                    LODWORD(v330) = v118;
                    goto LABEL_61;
                  case 1u:
                    goto LABEL_62;
                  case 2u:
                    HIDWORD(v335) = v353 - v346;
                    v86 = v391;
                    LODWORD(v334) = v343 - v109;
                    v87 = v360;
                    HIDWORD(v332) = v117;
                    v88 = v369;
                    LODWORD(v331) = v118;
                    goto LABEL_61;
                  case 3u:
                    LODWORD(v335) = v353 - v346;
                    v86 = v391;
                    HIDWORD(v333) = v343 - v109;
                    v87 = v360;
                    LODWORD(v332) = v117;
                    v88 = v369;
                    HIDWORD(v330) = v118;
LABEL_61:
                    v89 = v378;
                    break;
                  default:
                    goto LABEL_58;
                }
                goto LABEL_62;
              }
            }
            v97 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v393, v405, 16);
            if (v97)
              continue;
            break;
          }
LABEL_58:
          v86 = v391;
          v87 = v360;
          v88 = v369;
          v89 = v378;
          j = v384;
        }
        else
        {
          v86 = v391;
        }
LABEL_62:

      }
      v340 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v397, v406, 16);
    }
    while (v340);
  }
  else
  {
    v334 = 0;
    v335 = 0;
    v86 = 0;
    v332 = 0;
    v333 = 0;
    v87 = 0;
    v330 = 0;
    v331 = 0;
    v88 = 0;
    v89 = 0;
  }

  v119 = WALogCategoryDefaultHandle();
  v120 = objc_claimAutoreleasedReturnValue(v119);
  if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447490;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 462;
    v411 = 1024;
    *(_DWORD *)v412 = v89;
    *(_WORD *)&v412[4] = 1024;
    *(_DWORD *)&v412[6] = HIDWORD(v334);
    LOWORD(v413) = 1024;
    *(_DWORD *)((char *)&v413 + 2) = v335;
    HIWORD(v413) = 1024;
    v414 = HIDWORD(v335);
    _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:txBEExpComp: %u txBKExpComp: %u txVIExpComp: %u txVOExpComp: %u", buf, 0x2Au);
  }

  v121 = WALogCategoryDefaultHandle();
  v122 = objc_claimAutoreleasedReturnValue(v121);
  if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447490;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 464;
    v411 = 1024;
    *(_DWORD *)v412 = v86;
    *(_WORD *)&v412[4] = 1024;
    *(_DWORD *)&v412[6] = v333;
    LOWORD(v413) = 1024;
    *(_DWORD *)((char *)&v413 + 2) = HIDWORD(v333);
    HIWORD(v413) = 1024;
    v414 = v334;
    _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:txBEFailComp: %u txBKFailComp: %u txVIFailComp: %u txVOFailComp: %u", buf, 0x2Au);
  }

  v123 = WALogCategoryDefaultHandle();
  v124 = objc_claimAutoreleasedReturnValue(v123);
  if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447490;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 466;
    v411 = 1024;
    *(_DWORD *)v412 = v87;
    *(_WORD *)&v412[4] = 1024;
    *(_DWORD *)&v412[6] = HIDWORD(v331);
    LOWORD(v413) = 1024;
    *(_DWORD *)((char *)&v413 + 2) = v332;
    HIWORD(v413) = 1024;
    v414 = HIDWORD(v332);
    _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:txBENoAckComp: %u txBKNoAckComp: %u txVINoAckComp: %u txVONoAckComp: %u", buf, 0x2Au);
  }
  obja = v89;
  v341 = v87;
  v344 = v86;

  v125 = WALogCategoryDefaultHandle();
  v126 = objc_claimAutoreleasedReturnValue(v125);
  if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447490;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 468;
    v411 = 1024;
    *(_DWORD *)v412 = v88;
    *(_WORD *)&v412[4] = 1024;
    *(_DWORD *)&v412[6] = v330;
    LOWORD(v413) = 1024;
    *(_DWORD *)((char *)&v413 + 2) = HIDWORD(v330);
    HIWORD(v413) = 1024;
    v414 = v331;
    _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:txBEOErrComp: %u txBKOErrComp: %u txVIOErrComp: %u txVOOErrComp: %u", buf, 0x2Au);
  }
  v339 = v88;

  v385 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v385, "subMessageValue"));
  v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "fieldForKey:", CFSTR("NWAPS_completions")));
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "subMessageValue"));
  v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "fieldForKey:", CFSTR("NWATC_chipmodeerror")));
  v131 = objc_msgSend(v130, "uint32Value");
  v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "subMessageValue"));
  v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "fieldForKey:", CFSTR("NWAPS_completions")));
  v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "subMessageValue"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "fieldForKey:", CFSTR("NWATC_chipmodeerror")));
  v392 = v131 - objc_msgSend(v136, "uint32Value");

  v370 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v361 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v370, "subMessageValue"));
  v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v361, "fieldForKey:", CFSTR("NWAPS_completions")));
  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "subMessageValue"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "fieldForKey:", CFSTR("NWATC_expired")));
  v386 = objc_msgSend(v139, "uint32Value");
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "subMessageValue"));
  v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "fieldForKey:", CFSTR("NWAPS_completions")));
  v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "subMessageValue"));
  v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "fieldForKey:", CFSTR("NWATC_expired")));
  v379 = objc_msgSend(v144, "uint32Value");

  v354 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v354, "subMessageValue"));
  v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "fieldForKey:", CFSTR("NWAPS_completions")));
  v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "subMessageValue"));
  v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "fieldForKey:", CFSTR("NWATC_internalerror")));
  v371 = objc_msgSend(v148, "uint32Value");
  v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "subMessageValue"));
  v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "fieldForKey:", CFSTR("NWAPS_completions")));
  v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "subMessageValue"));
  v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "fieldForKey:", CFSTR("NWATC_internalerror")));
  v362 = objc_msgSend(v153, "uint32Value");

  v324 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v324, "subMessageValue"));
  v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "fieldForKey:", CFSTR("NWAPS_completions")));
  v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v155, "subMessageValue"));
  v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "fieldForKey:", CFSTR("NWATC_ioerror")));
  v355 = objc_msgSend(v157, "uint32Value");
  v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "subMessageValue"));
  v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "fieldForKey:", CFSTR("NWAPS_completions")));
  v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "subMessageValue"));
  v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v161, "fieldForKey:", CFSTR("NWATC_ioerror")));
  v347 = objc_msgSend(v162, "uint32Value");

  v319 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v319, "subMessageValue"));
  v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "fieldForKey:", CFSTR("NWAPS_completions")));
  v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "subMessageValue"));
  v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v165, "fieldForKey:", CFSTR("NWATC_noack")));
  v325 = objc_msgSend(v166, "uint32Value");
  v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "subMessageValue"));
  v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "fieldForKey:", CFSTR("NWAPS_completions")));
  v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "subMessageValue"));
  v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "fieldForKey:", CFSTR("NWATC_noack")));
  v322 = objc_msgSend(v171, "uint32Value");

  v314 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v314, "subMessageValue"));
  v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "fieldForKey:", CFSTR("NWAPS_completions")));
  v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v173, "subMessageValue"));
  v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v174, "fieldForKey:", CFSTR("NWATC_nobuf")));
  v320 = objc_msgSend(v175, "uint32Value");
  v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "subMessageValue"));
  v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v177, "fieldForKey:", CFSTR("NWAPS_completions")));
  v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "subMessageValue"));
  v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v179, "fieldForKey:", CFSTR("NWATC_nobuf")));
  v317 = objc_msgSend(v180, "uint32Value");

  v309 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v306 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v309, "subMessageValue"));
  v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v306, "fieldForKey:", CFSTR("NWAPS_completions")));
  v182 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v181, "subMessageValue"));
  v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v182, "fieldForKey:", CFSTR("NWATC_noremotepeer")));
  v315 = objc_msgSend(v183, "uint32Value");
  v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v185 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "subMessageValue"));
  v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v185, "fieldForKey:", CFSTR("NWAPS_completions")));
  v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v186, "subMessageValue"));
  v188 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "fieldForKey:", CFSTR("NWATC_noremotepeer")));
  v312 = objc_msgSend(v188, "uint32Value");

  v189 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "subMessageValue"));
  v191 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "fieldForKey:", CFSTR("NWAPS_completions")));
  v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v191, "subMessageValue"));
  v193 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v192, "fieldForKey:", CFSTR("NWATC_noresources")));
  v310 = objc_msgSend(v193, "uint32Value");
  v194 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v195 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v194, "subMessageValue"));
  v196 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "fieldForKey:", CFSTR("NWAPS_completions")));
  v197 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v196, "subMessageValue"));
  v198 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v197, "fieldForKey:", CFSTR("NWATC_noresources")));
  v307 = objc_msgSend(v198, "uint32Value");

  v199 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v200 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "subMessageValue"));
  v201 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "fieldForKey:", CFSTR("NWAPS_completions")));
  v202 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v201, "subMessageValue"));
  v203 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "fieldForKey:", CFSTR("NWATC_txfailure")));
  v303 = objc_msgSend(v203, "uint32Value");
  v204 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v205 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v204, "subMessageValue"));
  v206 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v205, "fieldForKey:", CFSTR("NWAPS_completions")));
  v207 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "subMessageValue"));
  v208 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v207, "fieldForKey:", CFSTR("NWATC_txfailure")));
  v301 = objc_msgSend(v208, "uint32Value");

  v209 = WALogCategoryDefaultHandle();
  v210 = objc_claimAutoreleasedReturnValue(v209);
  if (os_log_type_enabled(v210, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 490;
    v411 = 1024;
    *(_DWORD *)v412 = v392;
    _os_log_impl((void *)&_mh_execute_header, v210, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:chipModeError: %u", buf, 0x18u);
  }
  v211 = v386 - v379;

  v212 = WALogCategoryDefaultHandle();
  v213 = objc_claimAutoreleasedReturnValue(v212);
  if (os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 491;
    v411 = 1024;
    *(_DWORD *)v412 = v386 - v379;
    _os_log_impl((void *)&_mh_execute_header, v213, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:expired: %u", buf, 0x18u);
  }

  v214 = WALogCategoryDefaultHandle();
  v215 = objc_claimAutoreleasedReturnValue(v214);
  if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 492;
    v411 = 1024;
    *(_DWORD *)v412 = v371 - v362;
    _os_log_impl((void *)&_mh_execute_header, v215, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:internalError: %u", buf, 0x18u);
  }

  v216 = WALogCategoryDefaultHandle();
  v217 = objc_claimAutoreleasedReturnValue(v216);
  if (os_log_type_enabled(v217, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 493;
    v411 = 1024;
    *(_DWORD *)v412 = v355 - v347;
    _os_log_impl((void *)&_mh_execute_header, v217, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:ioError: %u", buf, 0x18u);
  }

  v218 = WALogCategoryDefaultHandle();
  v219 = objc_claimAutoreleasedReturnValue(v218);
  if (os_log_type_enabled(v219, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 494;
    v411 = 1024;
    *(_DWORD *)v412 = v325 - v322;
    _os_log_impl((void *)&_mh_execute_header, v219, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:noAck: %u", buf, 0x18u);
  }

  v220 = WALogCategoryDefaultHandle();
  v221 = objc_claimAutoreleasedReturnValue(v220);
  if (os_log_type_enabled(v221, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 495;
    v411 = 1024;
    *(_DWORD *)v412 = v320 - v317;
    _os_log_impl((void *)&_mh_execute_header, v221, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:noBuf: %u", buf, 0x18u);
  }

  v222 = WALogCategoryDefaultHandle();
  v223 = objc_claimAutoreleasedReturnValue(v222);
  if (os_log_type_enabled(v223, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 496;
    v411 = 1024;
    *(_DWORD *)v412 = v315 - v312;
    _os_log_impl((void *)&_mh_execute_header, v223, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:noRemotePeer: %u", buf, 0x18u);
  }
  v387 = v310 - v307;

  v224 = WALogCategoryDefaultHandle();
  v225 = objc_claimAutoreleasedReturnValue(v224);
  if (os_log_type_enabled(v225, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 497;
    v411 = 1024;
    *(_DWORD *)v412 = v310 - v307;
    _os_log_impl((void *)&_mh_execute_header, v225, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:noResources: %u", buf, 0x18u);
  }
  v313 = v315 - v312;
  v316 = v320 - v317;
  v318 = v325 - v322;
  v321 = v355 - v347;
  v323 = v371 - v362;
  v326 = v211;

  v226 = WALogCategoryDefaultHandle();
  v227 = objc_claimAutoreleasedReturnValue(v226);
  if (os_log_type_enabled(v227, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 498;
    v411 = 1024;
    *(_DWORD *)v412 = v303 - v301;
    _os_log_impl((void *)&_mh_execute_header, v227, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:txFailure: %u", buf, 0x18u);
  }
  v311 = v303 - v301;

  v372 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "fieldForKey:", CFSTR("DPSCS_controllerStats")));
  v228 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v372, "subMessageValue"));
  v229 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v228, "fieldForKey:", CFSTR("NWACS_scanActivity")));
  v230 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v229, "subMessageValue"));
  v231 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v230, "fieldForKey:", CFSTR("NWASA_roamDur")));
  v232 = objc_msgSend(v231, "uint32Value");
  v233 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "fieldForKey:", CFSTR("DPSCS_controllerStats")));
  v234 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v233, "subMessageValue"));
  v235 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v234, "fieldForKey:", CFSTR("NWACS_scanActivity")));
  v236 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "subMessageValue"));
  v237 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v236, "fieldForKey:", CFSTR("NWASA_roamDur")));
  v380 = v232 - objc_msgSend(v237, "uint32Value");

  v238 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "fieldForKey:", CFSTR("DPSCS_controllerStats")));
  v239 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v238, "subMessageValue"));
  v240 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v239, "fieldForKey:", CFSTR("NWACS_scanActivity")));
  v241 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v240, "subMessageValue"));
  v242 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v241, "fieldForKey:", CFSTR("NWASA_roamCount")));
  v373 = objc_msgSend(v242, "uint32Value");
  v243 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "fieldForKey:", CFSTR("DPSCS_controllerStats")));
  v244 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v243, "subMessageValue"));
  v245 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v244, "fieldForKey:", CFSTR("NWACS_scanActivity")));
  v246 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v245, "subMessageValue"));
  v247 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v246, "fieldForKey:", CFSTR("NWASA_roamCount")));
  v363 = objc_msgSend(v247, "uint32Value");

  v248 = WALogCategoryDefaultHandle();
  v249 = objc_claimAutoreleasedReturnValue(v248);
  if (os_log_type_enabled(v249, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 506;
    v411 = 1024;
    *(_DWORD *)v412 = v380;
    _os_log_impl((void *)&_mh_execute_header, v249, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:roamDuration: %u", buf, 0x18u);
  }

  v250 = WALogCategoryDefaultHandle();
  v251 = objc_claimAutoreleasedReturnValue(v250);
  if (os_log_type_enabled(v251, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 507;
    v411 = 1024;
    *(_DWORD *)v412 = v373 - v363;
    _os_log_impl((void *)&_mh_execute_header, v251, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:roamCount: %u", buf, 0x18u);
  }
  v308 = v373 - v363;

  v364 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "fieldForKey:", CFSTR("DPSCS_controllerStats")));
  v252 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v364, "subMessageValue"));
  v253 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v252, "fieldForKey:", CFSTR("NWACS_btCoex")));
  v254 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v253, "subMessageValue"));
  v255 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v254, "fieldForKey:", CFSTR("NWABC_btabort")));
  v256 = objc_msgSend(v255, "uint32Value");
  v257 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "fieldForKey:", CFSTR("DPSCS_controllerStats")));
  v258 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v257, "subMessageValue"));
  v259 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v258, "fieldForKey:", CFSTR("NWACS_btCoex")));
  v260 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v259, "subMessageValue"));
  v261 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v260, "fieldForKey:", CFSTR("NWABC_btabort")));
  v374 = v256 - objc_msgSend(v261, "uint32Value");

  v348 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "fieldForKey:", CFSTR("DPSCS_controllerStats")));
  v304 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v348, "subMessageValue"));
  v262 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v304, "fieldForKey:", CFSTR("NWACS_btCoex")));
  v263 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v262, "subMessageValue"));
  v264 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v263, "fieldForKey:", CFSTR("NWABC_grant")));
  v365 = objc_msgSend(v264, "uint32Value");
  v265 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "fieldForKey:", CFSTR("DPSCS_controllerStats")));
  v266 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v265, "subMessageValue"));
  v267 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v266, "fieldForKey:", CFSTR("NWACS_btCoex")));
  v268 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v267, "subMessageValue"));
  v269 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v268, "fieldForKey:", CFSTR("NWABC_grant")));
  v356 = objc_msgSend(v269, "uint32Value");

  v270 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "fieldForKey:", CFSTR("DPSCS_controllerStats")));
  v271 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "subMessageValue"));
  v272 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v271, "fieldForKey:", CFSTR("NWACS_btCoex")));
  v273 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "subMessageValue"));
  v274 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v273, "fieldForKey:", CFSTR("NWABC_request")));
  v349 = objc_msgSend(v274, "uint32Value");
  v275 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "fieldForKey:", CFSTR("DPSCS_controllerStats")));
  v276 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v275, "subMessageValue"));
  v277 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v276, "fieldForKey:", CFSTR("NWACS_btCoex")));
  v278 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v277, "subMessageValue"));
  v279 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v278, "fieldForKey:", CFSTR("NWABC_request")));
  v305 = objc_msgSend(v279, "uint32Value");

  v280 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "fieldForKey:", CFSTR("DPSCS_controllerStats")));
  v281 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "subMessageValue"));
  v282 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v281, "fieldForKey:", CFSTR("NWACS_btCoex")));
  v283 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v282, "subMessageValue"));
  v284 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v283, "fieldForKey:", CFSTR("NWABC_ucodehighlatency")));
  v302 = objc_msgSend(v284, "uint32Value");
  v285 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "fieldForKey:", CFSTR("DPSCS_controllerStats")));
  v286 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v285, "subMessageValue"));
  v287 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v286, "fieldForKey:", CFSTR("NWACS_btCoex")));
  v288 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v287, "subMessageValue"));
  v289 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v288, "fieldForKey:", CFSTR("NWABC_ucodehighlatency")));
  v300 = objc_msgSend(v289, "uint32Value");

  v290 = WALogCategoryDefaultHandle();
  v291 = objc_claimAutoreleasedReturnValue(v290);
  if (os_log_type_enabled(v291, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 517;
    v411 = 1024;
    *(_DWORD *)v412 = v374;
    _os_log_impl((void *)&_mh_execute_header, v291, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:bt_abort: %u", buf, 0x18u);
  }

  v292 = WALogCategoryDefaultHandle();
  v293 = objc_claimAutoreleasedReturnValue(v292);
  if (os_log_type_enabled(v293, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 518;
    v411 = 1024;
    *(_DWORD *)v412 = v365 - v356;
    _os_log_impl((void *)&_mh_execute_header, v293, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:bt_grant: %u", buf, 0x18u);
  }

  v294 = WALogCategoryDefaultHandle();
  v295 = objc_claimAutoreleasedReturnValue(v294);
  if (os_log_type_enabled(v295, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 519;
    v411 = 1024;
    *(_DWORD *)v412 = v349 - v305;
    _os_log_impl((void *)&_mh_execute_header, v295, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:bt_request: %u", buf, 0x18u);
  }

  v296 = WALogCategoryDefaultHandle();
  v297 = objc_claimAutoreleasedReturnValue(v296);
  if (os_log_type_enabled(v297, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v408 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    v409 = 1024;
    v410 = 520;
    v411 = 1024;
    *(_DWORD *)v412 = v302 - v300;
    _os_log_impl((void *)&_mh_execute_header, v297, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:bt_uch_latency: %u", buf, 0x18u);
  }

  v298 = objc_retainAutoreleaseReturnValue(-[WiFiStallDetectInput initWithAC_problem_bitfield:TxBE_expiredCompletions:TxBE_failedCompletions:TxBE_noAckCompletions:TxBE_otherErrCompletions:TxBK_expiredCompletions:TxBK_failedCompletions:TxBK_noAckCompletions:TxBK_otherErrCompletions:TxVI_expiredCompletions:TxVI_failedCompletions:TxVI_noAckCompletions:TxVI_otherErrCompletions:TxVO_expiredCompletions:TxVO_failedCompletions:TxVO_noAckCompletions:TxVO_otherErrCompletions:bt_abort:bt_grant:bt_request:bt_uch_latency:cca_bin:completions_chipmodeerror:completions_expired:completions_internalerror:completions_ioerror:completions_noack:completions_nobuf:completions_noremotepeer:completions_noresources:completions_txfailure:roam_count:roam_duration:rssi_bin:snr_bin:]([WiFiStallDetectInput alloc], "initWithAC_problem_bitfield:TxBE_expiredCompletions:TxBE_failedCompletions:TxBE_noAckCompletions:TxBE_otherErrCompletions:TxBK_expiredCompletions:TxBK_failedCompletions:TxBK_noAckCompletions:TxBK_otherErrCompletions:TxVI_expiredCompletions:TxVI_failedCompletions:TxVI_noAckCompletions:TxVI_otherErrCompletions:TxVO_expiredCompletions:TxVO_failedCompletions:TxVO_noAckCompletions:TxVO_otherErrCompletions:bt_abort:bt_grant:bt_request:bt_uch_latency:cca_bin:completions_chipmodeerror:completions_expired:completions_internalerror:completions_ioerror:completions_noack:completions_nobuf:completions_noremotepeer:completions_noresources:completions_txfailure:roam_count:roam_duration:rssi_bin:snr_bin:", (double)v327, (double)obja, (double)v344, (double)v341, (double)v339, (double)HIDWORD(v334), (double)v333, (double)HIDWORD(v331), (double)v330, (double)v335,
             (double)HIDWORD(v333),
             (double)v332,
             (double)HIDWORD(v330),
             (double)HIDWORD(v335),
             (double)v334,
             (double)HIDWORD(v332),
             (double)v331,
             (double)v374,
             (double)(v365 - v356),
             (double)(v349 - v305),
             (double)(v302 - v300),
             *(_QWORD *)&v29,
             (double)v392,
             (double)v326,
             (double)v323,
             (double)v321,
             (double)v318,
             (double)v316,
             (double)v313,
             (double)v387,
             (double)v311,
             (double)v308,
             (double)v380,
             *(_QWORD *)&v49,
             *(_QWORD *)&v68));

  return v298;
}

- (BOOL)checkDpsStatus:(id)a3 currentSample:(id)a4 qDpsStat:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  id v34;
  NSObject *v35;
  unsigned int v36;
  void *v37;
  id v38;
  NSObject *v39;
  id v41;
  NSObject *v42;
  DPSQuickRecoveryRecommendationEngine *v43;
  id v44;
  void *v45;
  id v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  unsigned int v54;

  v8 = a3;
  v46 = a4;
  v9 = a5;
  if (-[RecommendationPreferences disable_fast_dps_wd](self->_preferences, "disable_fast_dps_wd"))
  {
    v10 = WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v48 = "-[DPSQuickRecoveryRecommendationEngine checkDpsStatus:currentSample:qDpsStat:]";
      v49 = 1024;
      v50 = 567;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Quick DPS Reset Recovery is disabled", buf, 0x12u);
    }

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fieldForKey:", CFSTR("WFAAWDWAQDS_suppressedReason")));
    v13 = v12;
    v14 = 3;
    goto LABEL_27;
  }
  if (-[RecommendationPreferences disable_fast_dps_validation_for_test](self->_preferences, "disable_fast_dps_validation_for_test"))
  {
    v15 = WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v48 = "-[DPSQuickRecoveryRecommendationEngine checkDpsStatus:currentSample:qDpsStat:]";
      v49 = 1024;
      v50 = 574;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Bypassing Quick DPS validation for Quick Reset Recovery", buf, 0x12u);
    }
    v16 = 1;
    goto LABEL_28;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "subMessageValue"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fieldForKey:", CFSTR("NWAPS_acCompletions")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "repeatableValues"));
  v21 = (unint64_t)objc_msgSend(v20, "count");

  v22 = WALogCategoryDefaultHandle();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v48 = "-[DPSQuickRecoveryRecommendationEngine checkDpsStatus:currentSample:qDpsStat:]";
    v49 = 1024;
    v50 = 580;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%{public}s::%d:DPS Fast Reset Recovery Enabled, Validation Starts...", buf, 0x12u);
  }

  if (v21 < 5)
  {
    if (!v21)
    {
      v41 = WALogCategoryDefaultHandle();
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_FAULT, "acCompletions not populated, so this DPS trigger cannot be validated", buf, 2u);
      }

      if (-[DPSQuickRecoveryRecommendationEngine computeBin:previousSample:currentSample:](self, "computeBin:previousSample:currentSample:", CFSTR("NWAPS_ccas"), v8, v46) != 0xFFFF)goto LABEL_26;
      goto LABEL_23;
    }
  }
  else
  {
    v24 = WALogCategoryDefaultHandle();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v48 = (const char *)v21;
      _os_log_fault_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "Out of range acCount found in NWAPS_acCompletions: %llu", buf, 0xCu);
    }

    v21 = 4;
  }
  v43 = self;
  v44 = v8;
  v45 = v9;
  v26 = 0;
  while (1)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "fieldForKey:", CFSTR("DPSCS_peerStats")));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "subMessageValue"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "fieldForKey:", CFSTR("NWAPS_acCompletions")));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "repeatableValues"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndex:", v26));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "fieldForKey:", CFSTR("NWAPACTC_durSinceLastSuccessfulComp")));
    v33 = objc_msgSend(v32, "uint32Value");

    v34 = WALogCategoryDefaultHandle();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v48 = "-[DPSQuickRecoveryRecommendationEngine checkDpsStatus:currentSample:qDpsStat:]";
      v49 = 1024;
      v50 = 592;
      v51 = 1024;
      v52 = v26;
      v53 = 1024;
      v54 = v33;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC:%u NWAPACTC_durSinceLastSuccessfulComp[@6s] %u", buf, 0x1Eu);
    }

    v36 = v33 >> 2;
    v16 = v33 >> 2 > 0x658;
    if (v36 <= 0x658)
      break;
    if (v21 == ++v26)
      goto LABEL_22;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "fieldForKey:", CFSTR("WFAAWDWAQDS_suppressedReason")));
  objc_msgSend(v37, "setInt32Value:", 9);

LABEL_22:
  v8 = v44;
  v9 = v45;
  if (-[DPSQuickRecoveryRecommendationEngine computeBin:previousSample:currentSample:](v43, "computeBin:previousSample:currentSample:", CFSTR("NWAPS_ccas"), v44, v46) == 0xFFFF)
  {
LABEL_23:
    v38 = WALogCategoryDefaultHandle();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_FAULT, "Instances populated with the same values, CCA not found (QuickDPS)", buf, 2u);
    }

LABEL_26:
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fieldForKey:", CFSTR("WFAAWDWAQDS_suppressedReason")));
    v13 = v12;
    v14 = 10;
LABEL_27:
    -[NSObject setInt32Value:](v12, "setInt32Value:", v14);
    v16 = 0;
LABEL_28:

  }
  return v16;
}

- (unsigned)computeBin:(id)a3 previousSample:(id)a4 currentSample:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  unsigned int v26;
  id v27;
  NSObject *v28;
  unint64_t v30;
  id v31;
  void *v32;
  void *v33;
  unsigned int v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  unint64_t v46;
  __int16 v47;
  unsigned int v48;

  v7 = a3;
  v8 = a4;
  v31 = a5;
  v32 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subMessageValue"));
  v33 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fieldForKey:", v7));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "repeatableValues"));
  v13 = objc_msgSend(v12, "count");

  v30 = (unint64_t)v13;
  if (v13)
  {
    v14 = 0;
    v15 = 0;
    while (1)
    {
      v34 = v15;
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "fieldForKey:", CFSTR("DPSCS_peerStats")));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "subMessageValue"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "fieldForKey:", v33));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "repeatableValues"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", v14));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fieldForKey:", CFSTR("NWASB_residentTime")));
      v35 = objc_msgSend(v18, "uint64Value");
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "fieldForKey:", CFSTR("DPSCS_peerStats")));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "subMessageValue"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "fieldForKey:", v33));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "repeatableValues"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndex:", v14));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "fieldForKey:", CFSTR("NWASB_residentTime")));
      v25 = objc_msgSend(v24, "uint64Value");

      if (v35 != v25)
        break;
      v14 = v34 + 1;
      v15 = v34 + 1;
      if (v30 <= v14)
        goto LABEL_5;
    }
    v26 = v34;
  }
  else
  {
LABEL_5:
    v26 = 0xFFFF;
  }
  v27 = WALogCategoryDefaultHandle();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447234;
    v40 = "-[DPSQuickRecoveryRecommendationEngine computeBin:previousSample:currentSample:]";
    v41 = 1024;
    v42 = 629;
    v43 = 2112;
    v44 = v33;
    v45 = 2048;
    v46 = v30;
    v47 = 1024;
    v48 = v26;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:key:%@ binCount:%llu bin:%u", buf, 0x2Cu);
  }

  return v26;
}

- (BOOL)isTriggerDisconnect:(id)a3 currentSample:(id)a4
{
  id v6;
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
  __CFString *v27;
  void *v28;
  int v29;
  id v30;
  NSObject *v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  _BOOL4 v39;
  id v40;
  NSObject *v41;
  unint64_t v42;
  id v43;
  NSObject *v44;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  DPSQuickRecoveryRecommendationEngine *v120;
  void *v121;
  void *v122;
  id v123;
  uint8_t buf[4];
  const char *v125;
  __int16 v126;
  int v127;
  __int16 v128;
  _BYTE v129[10];
  __int16 v130;
  int v131;

  v6 = a3;
  v123 = a4;
  v120 = self;
  LODWORD(v115) = -[DPSQuickRecoveryRecommendationEngine computeBin:previousSample:currentSample:](self, "computeBin:previousSample:currentSample:", CFSTR("NWAPS_rssis"), v6, v123);
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "subMessageValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fieldForKey:", CFSTR("NWAPS_completions")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subMessageValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fieldForKey:", CFSTR("NWATC_noack")));
  LODWORD(v119) = objc_msgSend(v10, "uint32Value");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subMessageValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fieldForKey:", CFSTR("NWAPS_completions")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subMessageValue"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fieldForKey:", CFSTR("NWATC_noack")));
  LODWORD(v118) = objc_msgSend(v15, "uint32Value");

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "subMessageValue"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fieldForKey:", CFSTR("NWAPS_completions")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "subMessageValue"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "fieldForKey:", CFSTR("NWATC_expired")));
  LODWORD(v117) = objc_msgSend(v20, "uint32Value");
  v122 = v6;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "subMessageValue"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "fieldForKey:", CFSTR("NWAPS_completions")));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "subMessageValue"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "fieldForKey:", CFSTR("NWATC_expired")));
  LODWORD(v116) = objc_msgSend(v25, "uint32Value");

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "fieldForKey:", CFSTR("DPSCS_peerStats")));
  v27 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "subMessageValue"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString fieldForKey:](v27, "fieldForKey:", CFSTR("NWAPS_rssiValue")));
  v29 = objc_msgSend(v28, "int32Value");

  v30 = WALogCategoryDefaultHandle();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447234;
    v125 = "-[DPSQuickRecoveryRecommendationEngine isTriggerDisconnect:currentSample:]";
    v126 = 1024;
    v127 = 641;
    v128 = 1024;
    *(_DWORD *)v129 = (_DWORD)v119 - (_DWORD)v118;
    *(_WORD *)&v129[4] = 1024;
    *(_DWORD *)&v129[6] = (_DWORD)v117 - (_DWORD)v116;
    v130 = 1024;
    v131 = v29;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:noACK errors: %d txExpired errors: %d RSSI:%d", buf, 0x24u);
  }

  if (v29 >= -84)
  {
    if (-[RecommendationPreferences reset_rssi_bin_threshold](v120->_preferences, "reset_rssi_bin_threshold") < v115
      || (_DWORD)v119 == (_DWORD)v118 && (_DWORD)v117 == (_DWORD)v116)
    {
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v38 = 0;
      v39 = 0;
    }
    else
    {
      v22 = v123;
      v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "fieldForKey:", CFSTR("DPSCS_peerStats")));
      v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "subMessageValue"));
      v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "fieldForKey:", CFSTR("NWAPS_completions")));
      v27 = CFSTR("NWATC_chipmodeerror");
      v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "subMessageValue"));
      v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "fieldForKey:", CFSTR("NWATC_chipmodeerror")));
      v46 = objc_msgSend(v115, "uint32Value");
      v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "fieldForKey:", CFSTR("DPSCS_peerStats")));
      v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "subMessageValue"));
      v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "fieldForKey:", CFSTR("NWAPS_completions")));
      v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "subMessageValue"));
      v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "fieldForKey:", CFSTR("NWATC_chipmodeerror")));
      if (v46 == objc_msgSend(v110, "uint32Value"))
      {
        v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "fieldForKey:", CFSTR("DPSCS_peerStats")));
        v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "subMessageValue"));
        v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "fieldForKey:", CFSTR("NWAPS_completions")));
        v27 = CFSTR("NWATC_internalerror");
        v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "subMessageValue"));
        v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "fieldForKey:", CFSTR("NWATC_internalerror")));
        v47 = objc_msgSend(v105, "uint32Value");
        v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "fieldForKey:", CFSTR("DPSCS_peerStats")));
        v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "subMessageValue"));
        v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "fieldForKey:", CFSTR("NWAPS_completions")));
        v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "subMessageValue"));
        v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "fieldForKey:", CFSTR("NWATC_internalerror")));
        if (v47 == objc_msgSend(v100, "uint32Value"))
        {
          v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "fieldForKey:", CFSTR("DPSCS_peerStats")));
          v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "subMessageValue"));
          v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "fieldForKey:", CFSTR("NWAPS_completions")));
          v27 = CFSTR("NWATC_ioerror");
          v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "subMessageValue"));
          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "fieldForKey:", CFSTR("NWATC_ioerror")));
          v48 = objc_msgSend(v95, "uint32Value");
          v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "fieldForKey:", CFSTR("DPSCS_peerStats")));
          v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "subMessageValue"));
          v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "fieldForKey:", CFSTR("NWAPS_completions")));
          v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "subMessageValue"));
          v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "fieldForKey:", CFSTR("NWATC_ioerror")));
          if (v48 == objc_msgSend(v90, "uint32Value"))
          {
            v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "fieldForKey:", CFSTR("DPSCS_peerStats")));
            v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "subMessageValue"));
            v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "fieldForKey:", CFSTR("NWAPS_completions")));
            v27 = CFSTR("NWATC_nobuf");
            v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "subMessageValue"));
            v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "fieldForKey:", CFSTR("NWATC_nobuf")));
            v49 = objc_msgSend(v85, "uint32Value");
            v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "fieldForKey:", CFSTR("DPSCS_peerStats")));
            v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "subMessageValue"));
            v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "fieldForKey:", CFSTR("NWAPS_completions")));
            v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "subMessageValue"));
            v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "fieldForKey:", CFSTR("NWATC_nobuf")));
            if (v49 == objc_msgSend(v80, "uint32Value"))
            {
              v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "fieldForKey:", CFSTR("DPSCS_peerStats")));
              v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "subMessageValue"));
              v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "fieldForKey:", CFSTR("NWAPS_completions")));
              v27 = CFSTR("NWATC_noremotepeer");
              v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "subMessageValue"));
              v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "fieldForKey:", CFSTR("NWATC_noremotepeer")));
              v50 = objc_msgSend(v75, "uint32Value");
              v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "fieldForKey:", CFSTR("DPSCS_peerStats")));
              v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "subMessageValue"));
              v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "fieldForKey:", CFSTR("NWAPS_completions")));
              v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "subMessageValue"));
              v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "fieldForKey:", CFSTR("NWATC_noremotepeer")));
              if (v50 == objc_msgSend(v70, "uint32Value"))
              {
                v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "fieldForKey:", CFSTR("DPSCS_peerStats")));
                v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "subMessageValue"));
                v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "fieldForKey:", CFSTR("NWAPS_completions")));
                v27 = CFSTR("NWATC_noresources");
                v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "subMessageValue"));
                v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "fieldForKey:", CFSTR("NWATC_noresources")));
                v51 = objc_msgSend(v65, "uint32Value");
                v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "fieldForKey:", CFSTR("DPSCS_peerStats")));
                v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "subMessageValue"));
                v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "fieldForKey:", CFSTR("NWAPS_completions")));
                v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "subMessageValue"));
                v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "fieldForKey:", CFSTR("NWATC_noresources")));
                if (v51 == objc_msgSend(v60, "uint32Value"))
                {
                  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "fieldForKey:", CFSTR("DPSCS_peerStats")));
                  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "subMessageValue"));
                  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "fieldForKey:", CFSTR("NWAPS_completions")));
                  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "subMessageValue"));
                  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "fieldForKey:", CFSTR("NWATC_txfailure")));
                  v52 = objc_msgSend(v55, "uint32Value");
                  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "fieldForKey:", CFSTR("DPSCS_peerStats")));
                  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "subMessageValue"));
                  v27 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "fieldForKey:", CFSTR("NWAPS_completions")));
                  v22 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString subMessageValue](v27, "subMessageValue"));
                  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "fieldForKey:", CFSTR("NWATC_txfailure")));
                  v39 = v52 == objc_msgSend(v24, "uint32Value");
                  v32 = 1;
                  v33 = 1;
                  v34 = 1;
                  v35 = 1;
                  v36 = 1;
                  v37 = 1;
                  v38 = 1;
                }
                else
                {
                  v38 = 0;
                  v39 = 0;
                  v32 = 1;
                  v33 = 1;
                  v34 = 1;
                  v35 = 1;
                  v36 = 1;
                  v37 = 1;
                }
              }
              else
              {
                v37 = 0;
                v38 = 0;
                v39 = 0;
                v32 = 1;
                v33 = 1;
                v34 = 1;
                v35 = 1;
                v36 = 1;
              }
            }
            else
            {
              v36 = 0;
              v37 = 0;
              v38 = 0;
              v39 = 0;
              v32 = 1;
              v33 = 1;
              v34 = 1;
              v35 = 1;
            }
          }
          else
          {
            v35 = 0;
            v36 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v32 = 1;
            v33 = 1;
            v34 = 1;
          }
        }
        else
        {
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v32 = 1;
          v33 = 1;
        }
      }
      else
      {
        v33 = 0;
        v34 = 0;
        v35 = 0;
        v36 = 0;
        v37 = 0;
        v38 = 0;
        v39 = 0;
        v32 = 1;
      }
    }
  }
  else
  {
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v38 = 0;
    v39 = 1;
  }
  if (v38)
  {

    if (!v37)
    {
LABEL_11:
      if (!v36)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if (!v37)
  {
    goto LABEL_11;
  }

  if (v36)
  {
LABEL_12:

  }
LABEL_13:
  if (v35)
  {

    if (!v34)
    {
LABEL_15:
      if (!v33)
        goto LABEL_16;
      goto LABEL_30;
    }
  }
  else if (!v34)
  {
    goto LABEL_15;
  }

  if (!v33)
  {
LABEL_16:
    if (!v32)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_30:

  if (v32)
  {
LABEL_17:

  }
LABEL_18:
  if (v39)
  {
    v40 = WALogCategoryDefaultHandle();
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = -[RecommendationPreferences reset_rssi_bin_threshold](v120->_preferences, "reset_rssi_bin_threshold");
      *(_DWORD *)buf = 136446722;
      v125 = "-[DPSQuickRecoveryRecommendationEngine isTriggerDisconnect:currentSample:]";
      v126 = 1024;
      v127 = 662;
      v128 = 2048;
      *(_QWORD *)v129 = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:rssi-bin threshold: %ld", buf, 0x1Cu);
    }

    v43 = WALogCategoryDefaultHandle();
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v125 = "-[DPSQuickRecoveryRecommendationEngine isTriggerDisconnect:currentSample:]";
      v126 = 1024;
      v127 = 663;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Trigger Disconnect suspected!", buf, 0x12u);
    }

  }
  return v39;
}

- (BOOL)isHighAWDLActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  NSObject *v21;
  unint64_t v22;
  BOOL result;
  unint64_t v24;
  id v25;
  NSObject *v26;
  int v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  unint64_t v38;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fieldForKey:", CFSTR("DPSS_awdlSnapshot")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subMessageValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fieldForKey:", CFSTR("DPSAWDLS_sdb")));
  v8 = objc_msgSend(v7, "uint32Value");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fieldForKey:", CFSTR("DPSS_awdlSnapshot")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subMessageValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fieldForKey:", CFSTR("DPSAWDLS_use")));
  v12 = objc_msgSend(v11, "uint32Value");

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fieldForKey:", CFSTR("DPSS_awdlSnapshot")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subMessageValue"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fieldForKey:", CFSTR("DPSAWDLS_ts")));
  v16 = (unint64_t)objc_msgSend(v15, "uint64Value");

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v17, "timeIntervalSince1970");
  v19 = v18;

  v20 = WALogCategoryDefaultHandle();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = -[RecommendationPreferences reset_awdl_activity_threshold](self->_preferences, "reset_awdl_activity_threshold");
    v27 = 136447490;
    v28 = "-[DPSQuickRecoveryRecommendationEngine isHighAWDLActivity:]";
    v29 = 1024;
    v30 = 680;
    v31 = 2048;
    v32 = v22;
    v33 = 1024;
    v34 = v12;
    v35 = 1024;
    v36 = v8;
    v37 = 2048;
    v38 = (unint64_t)v19 - v16 / 0x3E8;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:awdl activity threshold: %ld, awdl usage: %u, sdb: %u, updated before:%llu seconds", (uint8_t *)&v27, 0x32u);
  }

  if (v8)
    return 0;
  v24 = -[RecommendationPreferences reset_awdl_activity_threshold](self->_preferences, "reset_awdl_activity_threshold");
  result = 0;
  if (v24 < v12 && (unint64_t)v19 - v16 / 0x3E8 <= 0xF)
  {
    v25 = WALogCategoryDefaultHandle();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 136446466;
      v28 = "-[DPSQuickRecoveryRecommendationEngine isHighAWDLActivity:]";
      v29 = 1024;
      v30 = 683;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:High AWDL Activity suspected!", (uint8_t *)&v27, 0x12u);
    }

    return 1;
  }
  return result;
}

- (BOOL)checkParameterThresholds:(id)a3 currentSample:(id)a4 qDpsStat:(id)a5 chipNumber:(id)a6 dpsSnapshot:(id)a7 originalCCA:(unsigned int)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  unsigned int v19;
  unsigned int v20;
  RecommendationPreferences *preferences;
  unint64_t v22;
  unint64_t v23;
  double v24;
  id v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  id v32;
  BOOL v33;
  int v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  unsigned int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  _BYTE v44[18];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = -[DPSQuickRecoveryRecommendationEngine computeBin:previousSample:currentSample:](self, "computeBin:previousSample:currentSample:", CFSTR("NWAPS_ccas"), v14, v15);
  v20 = objc_msgSend(&off_1000E03E0, "containsObject:", v17);
  preferences = self->_preferences;
  if (v20)
    v22 = -[RecommendationPreferences reset_legacy_chipset_cca_bin_threshold](preferences, "reset_legacy_chipset_cca_bin_threshold");
  else
    v22 = -[RecommendationPreferences reset_cca_bin_threshold](preferences, "reset_cca_bin_threshold");
  v23 = v22;
  v24 = (double)(v22 + 1) * 12.5;
  v25 = WALogCategoryDefaultHandle();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v35 = 136447490;
    v36 = "-[DPSQuickRecoveryRecommendationEngine checkParameterThresholds:currentSample:qDpsStat:chipNumber:dpsSnapshot:originalCCA:]";
    v37 = 1024;
    v38 = 699;
    v39 = 1024;
    v40 = a8;
    v41 = 1024;
    v42 = v23;
    v43 = 2048;
    *(double *)v44 = v24;
    *(_WORD *)&v44[8] = 2112;
    *(_QWORD *)&v44[10] = v17;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:notificationCCA: %d ccaThreshold:%d ccaFloatThreshold:%f set for chipset : %@", (uint8_t *)&v35, 0x32u);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fieldForKey:", CFSTR("WFAAWDWAQDS_ccaThreshold")));
  objc_msgSend(v27, "setUint32Value:", v23);

  if (v19 >= v23 || v24 <= (double)a8)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fieldForKey:", CFSTR("WFAAWDWAQDS_suppressedReason")));
    objc_msgSend(v31, "setInt32Value:", 6);

    v32 = WALogCategoryDefaultHandle();
    v29 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v35 = 136447490;
      v36 = "-[DPSQuickRecoveryRecommendationEngine checkParameterThresholds:currentSample:qDpsStat:chipNumber:dpsSnapshot:originalCCA:]";
      v37 = 1024;
      v38 = 707;
      v39 = 1024;
      v40 = v19;
      v41 = 1024;
      v42 = v23;
      v43 = 1024;
      *(_DWORD *)v44 = a8;
      *(_WORD *)&v44[4] = 2048;
      *(double *)&v44[6] = v24;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:CCA Threshold Suppression.. cca-bin: %d threshold: %d notificationCCA: %d CCALimit: %f", (uint8_t *)&v35, 0x2Eu);
    }
  }
  else
  {
    if (-[DPSQuickRecoveryRecommendationEngine isTriggerDisconnect:currentSample:](self, "isTriggerDisconnect:currentSample:", v14, v15))
    {
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fieldForKey:", CFSTR("WFAAWDWAQDS_suppressedReason")));
      v29 = v28;
      v30 = 7;
    }
    else
    {
      if (!-[DPSQuickRecoveryRecommendationEngine isHighAWDLActivity:](self, "isHighAWDLActivity:", v18))
      {
        v33 = 1;
        goto LABEL_16;
      }
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fieldForKey:", CFSTR("WFAAWDWAQDS_suppressedReason")));
      v29 = v28;
      v30 = 8;
    }
    -[NSObject setInt32Value:](v28, "setInt32Value:", v30);
  }

  v33 = 0;
LABEL_16:

  return v33;
}

- (unint64_t)recommendReset:(id)a3 currentSample:(id)a4 acList:(id)a5 qDpsStat:(id)a6 chipNumber:(id)a7 dpsSnapshot:(id)a8 originalCCA:(unsigned int)a9
{
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  const char *v27;
  id v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  unint64_t v36;
  void *v37;
  id v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NSURL *v46;
  NSURL *modelUrl;
  id v48;
  NSObject *v49;
  NSURL *v50;
  WiFiStallDetect *v51;
  NSURL *v52;
  WiFiStallDetect *v53;
  id v54;
  WiFiStallDetect *model;
  double v56;
  id v57;
  NSObject *v58;
  void *v59;
  unsigned int v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  const char *v67;
  id v68;
  NSObject *v69;
  id v70;
  __CFString *v71;
  void *v72;
  void *v73;
  RecommendationPreferences **p_preferences;
  RecommendationPreferences *preferences;
  void *v76;
  void *v77;
  void *v78;
  id v80;
  NSObject *v81;
  id v82;
  NSObject *v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  id v88;
  uint8_t buf[4];
  const char *v90;
  __int16 v91;
  int v92;
  __int16 v93;
  double v94;
  __int16 v95;
  double v96;

  v15 = a3;
  v16 = a4;
  v85 = a5;
  v17 = a6;
  v86 = a7;
  v87 = a8;
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v18 = -[RecommendationPreferences disable_fast_dps_validation_for_test](self->_preferences, "disable_fast_dps_validation_for_test");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fieldForKey:", CFSTR("WFAAWDWAQDS_isDpsValidationDisabled")));
  objc_msgSend(v19, "setBoolValue:", v18);

  -[DPSQuickRecoveryRecommendationEngine updateTimeSincePreviousTriggerForStudy:msgKey:dictKey:](self, "updateTimeSincePreviousTriggerForStudy:msgKey:dictKey:", v17, CFSTR("WFAAWDWAQDS_quickDpsTimeSincePreviousTriggerMinutes"), CFSTR("dps_lastQuickDpsTrigger"));
  -[DPSQuickRecoveryRecommendationEngine updateScreenState](self, "updateScreenState");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fieldForKey:", CFSTR("WFAAWDWAQDS_screenStateOn")));
  objc_msgSend(v20, "setBoolValue:", self->screenON);

  if (-[DPSQuickRecoveryRecommendationEngine checkDpsStatus:currentSample:qDpsStat:](self, "checkDpsStatus:currentSample:qDpsStat:", v15, v16, v17))
  {
    if (self->model)
      goto LABEL_3;
    v42 = WALogCategoryDefaultHandle();
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v90 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSnapshot:originalCCA:]";
      v91 = 1024;
      v92 = 739;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Model not yet loaded, loading...", buf, 0x12u);
    }

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil resourcePath](WAUtil, "resourcePath"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@.%@"), v44, CFSTR("WiFiStallDetect"), CFSTR("mlmodelc")));

    v46 = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v45));
    modelUrl = self->modelUrl;
    self->modelUrl = v46;

    v48 = WALogCategoryDefaultHandle();
    v49 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = self->modelUrl;
      *(_DWORD *)buf = 136446722;
      v90 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSnapshot:originalCCA:]";
      v91 = 1024;
      v92 = 744;
      v93 = 2112;
      v94 = *(double *)&v50;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:modelUrl is %@", buf, 0x1Cu);
    }

    v51 = [WiFiStallDetect alloc];
    v52 = self->modelUrl;
    v88 = 0;
    v53 = -[WiFiStallDetect initWithContentsOfURL:error:](v51, "initWithContentsOfURL:error:", v52, &v88);
    v54 = v88;
    model = self->model;
    self->model = v53;

    if (self->model)
    {
LABEL_3:
      if (!self->screenON)
        goto LABEL_28;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:](self, "computeFeatures:currentSample:acList:", v15, v16, v85));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiStallDetect predictionFromFeatures:error:](self->model, "predictionFromFeatures:error:", v21, 0));
      v23 = WALogCategoryDefaultHandle();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      v25 = v24;
      if (v22)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v26 = objc_msgSend(v22, "stall");
          v27 = "WILL";
          v90 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSnapsh"
                "ot:originalCCA:]";
          *(_DWORD *)buf = 136446722;
          if (!v26)
            v27 = "WILL NOT";
          v91 = 1024;
          v92 = 762;
          v93 = 2080;
          v94 = *(double *)&v27;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS ML Prediction: The Stall '%s' last for more than 10 seconds", buf, 0x1Cu);
        }

        v28 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedLongLong:", objc_msgSend(v22, "stall"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stallProbability"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", v28));
        objc_msgSend(v30, "doubleValue");
        v32 = v31;

        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fieldForKey:", CFSTR("WFAAWDWAQDS_stallPrediction")));
        objc_msgSend(v33, "setBoolValue:", (uint64_t)objc_msgSend(v22, "stall") > 0);

        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fieldForKey:", CFSTR("WFAAWDWAQDS_stallProbability")));
        v35 = v32 * 100.0;
        objc_msgSend(v34, "setUint32Value:", v35);

        v36 = -[RecommendationPreferences prediction_probability_threshold](self->_preferences, "prediction_probability_threshold");
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fieldForKey:", CFSTR("WFAAWDWAQDS_probabilityThreshold")));
        objc_msgSend(v37, "setUint32Value:", v36);

        if ((_DWORD)v18)
        {
          v38 = WALogCategoryDefaultHandle();
          v39 = objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v90 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSnap"
                  "shot:originalCCA:]";
            v91 = 1024;
            v92 = 779;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:simluated DPS: Overriding decision...do reset", buf, 0x12u);
          }

LABEL_27:
LABEL_28:
          if (!-[DPSQuickRecoveryRecommendationEngine checkParameterThresholds:currentSample:qDpsStat:chipNumber:dpsSnapshot:originalCCA:](self, "checkParameterThresholds:currentSample:qDpsStat:chipNumber:dpsSnapshot:originalCCA:", v15, v16, v17, v86, v87, a9)|| !-[DPSQuickRecoveryRecommendationEngine checkForPriorityNetwork](self, "checkForPriorityNetwork"))
          {
            v62 = 0;
            v18 = 0;
LABEL_38:
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fieldForKey:", CFSTR("WFAAWDWAQDS_suppressedReason")));
            v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v63, "int32Value")));

            -[NSMutableDictionary setObject:forKey:](self->_dpsStats, "setObject:forKey:", v64, CFSTR("dps_lastQuickRecoverySuppressionReason"));
            if ((v62 & 1) == 0)
              -[NSMutableDictionary setObject:forKey:](self->_dpsStats, "setObject:forKey:", v84, CFSTR("dps_lastQuickRecoverySuppressedWD"));
            v65 = WALogCategoryDefaultHandle();
            v66 = objc_claimAutoreleasedReturnValue(v65);
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
            {
              v67 = "NO";
              v90 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSn"
                    "apshot:originalCCA:]";
              *(_DWORD *)buf = 136446722;
              if ((_DWORD)v62)
                v67 = "YES";
              v91 = 1024;
              v92 = 820;
              v93 = 2080;
              v94 = *(double *)&v67;
              _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Recommendation for fast reset: %s", buf, 0x1Cu);
            }

            if ((v62 & 1) == 0)
            {
              v68 = WALogCategoryDefaultHandle();
              v69 = objc_claimAutoreleasedReturnValue(v68);
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
              {
                v70 = objc_msgSend(v64, "intValue");
                if (v70 >= 0xB)
                  v71 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v70));
                else
                  v71 = off_1000CD038[(int)v70];
                *(_DWORD *)buf = 136446722;
                v90 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dps"
                      "Snapshot:originalCCA:]";
                v91 = 1024;
                v92 = 822;
                v93 = 2112;
                v94 = *(double *)&v71;
                _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:quickDPS: Suppressed Reason: %@", buf, 0x1Cu);

              }
            }
            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fieldForKey:", CFSTR("WFAAWDWAQDS_quickDpsResetRecommendation")));
            objc_msgSend(v72, "setBoolValue:", v62);

            v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fieldForKey:", CFSTR("WFAAWDWAQDS_rssiThreshold")));
            preferences = self->_preferences;
            p_preferences = &self->_preferences;
            objc_msgSend(v73, "setUint32Value:", -[RecommendationPreferences reset_rssi_bin_threshold](preferences, "reset_rssi_bin_threshold"));

            v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fieldForKey:", CFSTR("WFAAWDWAQDS_screenOnThreshold")));
            objc_msgSend(v76, "setUint32Value:", -[RecommendationPreferences minutes_between_fast_dps_wd_screen_on](*p_preferences, "minutes_between_fast_dps_wd_screen_on"));

            v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fieldForKey:", CFSTR("WFAAWDWAQDS_screenOffThreshold")));
            objc_msgSend(v77, "setUint32Value:", -[RecommendationPreferences minutes_between_fast_dps_wd_screen_off](*p_preferences, "minutes_between_fast_dps_wd_screen_off"));

            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fieldForKey:", CFSTR("WFAAWDWAQDS_awdlActivityThreshold")));
            objc_msgSend(v78, "setUint32Value:", -[RecommendationPreferences reset_awdl_activity_threshold](*p_preferences, "reset_awdl_activity_threshold"));

            goto LABEL_52;
          }
          v60 = -[DPSQuickRecoveryRecommendationEngine isResetAllowedForQuickDPS](self, "isResetAllowedForQuickDPS");
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fieldForKey:", CFSTR("WFAAWDWAQDS_suppressedReason")));
          v21 = v61;
          if (v60)
          {
            objc_msgSend(v61, "setInt32Value:", 0);
            v18 = 1;
            v62 = 1;
          }
          else
          {
            objc_msgSend(v61, "setInt32Value:", 5);
            v62 = 0;
            v18 = 2;
          }
LABEL_37:

          goto LABEL_38;
        }
        if ((uint64_t)objc_msgSend(v22, "stall") < 1)
        {
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fieldForKey:", CFSTR("WFAAWDWAQDS_suppressedReason")));
          objc_msgSend(v59, "setInt32Value:", 1);
        }
        else
        {
          v56 = (double)v36;
          v57 = WALogCategoryDefaultHandle();
          v58 = objc_claimAutoreleasedReturnValue(v57);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446978;
            v90 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSnap"
                  "shot:originalCCA:]";
            v91 = 1024;
            v92 = 782;
            v93 = 2048;
            v94 = v35;
            v95 = 2048;
            v96 = v56;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS ML Prediction probability: %lf threshold: %lf", buf, 0x26u);
          }

          if (v35 >= v56)
            goto LABEL_27;
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fieldForKey:", CFSTR("WFAAWDWAQDS_suppressedReason")));
          objc_msgSend(v59, "setInt32Value:", 2);
        }

      }
      else
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v90 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSnapsh"
                "ot:originalCCA:]";
          v91 = 1024;
          v92 = 761;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}s::%d:ML model output is nil", buf, 0x12u);
        }

      }
      v62 = 0;
      v18 = 0;
      goto LABEL_37;
    }
    v80 = WALogCategoryDefaultHandle();
    v81 = objc_claimAutoreleasedReturnValue(v80);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v90 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSnapshot:originalCCA:]";
      v91 = 1024;
      v92 = 754;
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error WiFiStallDetect init", buf, 0x12u);
    }

    v82 = WALogCategoryDefaultHandle();
    v83 = objc_claimAutoreleasedReturnValue(v82);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_FAULT, "Error WiFiStallDetect init", buf, 2u);
    }

  }
  else
  {
    v40 = WALogCategoryDefaultHandle();
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v90 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSnapshot:originalCCA:]";
      v91 = 1024;
      v92 = 734;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS Fast Reset Recovery Validations Failed!", buf, 0x12u);
    }

    v18 = 0;
  }
LABEL_52:

  return v18;
}

- (BOOL)isPeerDiagnosticsTriggerAllowed:(unint64_t)a3
{
  void *v5;
  RecommendationPreferences *preferences;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  double v10;
  unint64_t v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  preferences = self->_preferences;
  if (a3)
  {
    v7 = -[RecommendationPreferences minutes_between_peer_diagnostics_trigger_for_other_issues](preferences, "minutes_between_peer_diagnostics_trigger_for_other_issues");
    v8 = CFSTR("pd_lastDiagnosticsTriggerForOtherIssues");
  }
  else
  {
    v7 = -[RecommendationPreferences minutes_between_peer_diagnostics_trigger_for_dns_stall](preferences, "minutes_between_peer_diagnostics_trigger_for_dns_stall");
    v8 = CFSTR("pd_lastDiagnosticsTriggerForDNSStall");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsQuickRecoveryWDBudgetDict, "valueForKey:", v8));
  if (v9 && (objc_msgSend(v5, "timeIntervalSinceDate:", v9), v11 = (int)(v10 / 60.0), v7 > v11))
  {
    v12 = WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136447234;
      v17 = "-[DPSQuickRecoveryRecommendationEngine isPeerDiagnosticsTriggerAllowed:]";
      v18 = 1024;
      v19 = 859;
      v20 = 2048;
      v21 = a3;
      v22 = 2048;
      v23 = (int)v11;
      v24 = 2112;
      v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: Trigger Not Allowed for type:%lu - Last trigger was %ld minutes ago at %@", (uint8_t *)&v16, 0x30u);
    }

    v14 = 0;
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](self->_dpsQuickRecoveryWDBudgetDict, "setObject:forKey:", v5, v8);
    v14 = 1;
  }

  return v14;
}

- (BOOL)isScoreBelowThreshold:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  unsigned int v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("NetScore")));
  v6 = objc_msgSend(v5, "unsignedIntValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("DataStallScore")));
  v8 = objc_msgSend(v7, "unsignedIntValue");

  v9 = -[RecommendationPreferences reset_score_threshold](self->_preferences, "reset_score_threshold") >= v6
    || -[RecommendationPreferences reset_score_threshold](self->_preferences, "reset_score_threshold") >= v8;
  v10 = WALogCategoryDefaultHandle();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136446978;
    v14 = "-[DPSQuickRecoveryRecommendationEngine isScoreBelowThreshold:]";
    v15 = 1024;
    v16 = 882;
    v17 = 1024;
    v18 = v6;
    v19 = 1024;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: netScore:%u dataStallScore:%u", (uint8_t *)&v13, 0x1Eu);
  }

  return v9;
}

- (BOOL)isGoodWiFiCondition:(id)a3
{
  id v4;
  void *v5;
  signed int v6;
  void *v7;
  unint64_t v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  unint64_t v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("RSSI")));
  v6 = objc_msgSend(v5, "intValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("CCA")));
  v8 = objc_msgSend(v7, "unsignedIntValue");

  v9 = -[RecommendationPreferences reset_pd_rssi_threshold](self->_preferences, "reset_pd_rssi_threshold") <= v6
    && -[RecommendationPreferences reset_pd_cca_threshold](self->_preferences, "reset_pd_cca_threshold") >= v8;
  v10 = WALogCategoryDefaultHandle();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136446978;
    v14 = "-[DPSQuickRecoveryRecommendationEngine isGoodWiFiCondition:]";
    v15 = 1024;
    v16 = 898;
    v17 = 2048;
    v18 = v6;
    v19 = 2048;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: RSSI:%ld CCA:%ld", (uint8_t *)&v13, 0x26u);
  }

  return v9;
}

- (void)updateTimeSincePreviousTriggerForStudy:(id)a3 msgKey:(id)a4 dictKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsQuickRecoveryWDBudgetDict, "valueForKey:", v10));
  if (v12)
  {
    objc_msgSend(v11, "timeIntervalSinceDate:", v12);
    v14 = (int)(v13 / 60.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fieldForKey:", v9));
    objc_msgSend(v15, "setUint64Value:", v14);

  }
  else
  {
    v14 = 0;
  }
  -[NSMutableDictionary setObject:forKey:](self->_dpsQuickRecoveryWDBudgetDict, "setObject:forKey:", v11, v10);
  v16 = WALogCategoryDefaultHandle();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136447746;
    v19 = "-[DPSQuickRecoveryRecommendationEngine updateTimeSincePreviousTriggerForStudy:msgKey:dictKey:]";
    v20 = 1024;
    v21 = 913;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    v26 = 2112;
    v27 = v12;
    v28 = 2112;
    v29 = v11;
    v30 = 2048;
    v31 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:msgkey:%@ dictKey:%@ previous_TS:%@ current_TS:%@ difference:%llu", (uint8_t *)&v18, 0x44u);
  }

}

- (void)updateTimeSincePreviousTriggerForQuickDps:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsQuickRecoveryWDBudgetDict, "valueForKey:", CFSTR("dps_lastQuickDpsTrigger")));
  if (v5)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = (int)(v6 / 60.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fieldForKey:", CFSTR("WFAAWDWAQDS_quickDpsTimeSincePreviousTriggerMinutes")));
    objc_msgSend(v8, "setUint64Value:", v7);

  }
}

- (BOOL)checkAWDLActivity:(id)a3 symptomsDnsStats:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  NSObject *v23;
  BOOL v24;
  _BOOL4 v25;
  void *v26;
  id v27;
  NSObject *v28;
  int v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  unsigned int v37;
  __int16 v38;
  unint64_t v39;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fieldForKey:", CFSTR("DPSS_awdlSnapshot")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subMessageValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fieldForKey:", CFSTR("DPSAWDLS_sdb")));
  v10 = objc_msgSend(v9, "uint32Value");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fieldForKey:", CFSTR("DPSS_awdlSnapshot")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subMessageValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fieldForKey:", CFSTR("DPSAWDLS_use")));
  v14 = objc_msgSend(v13, "uint32Value");

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fieldForKey:", CFSTR("DPSS_awdlSnapshot")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subMessageValue"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fieldForKey:", CFSTR("DPSAWDLS_ts")));
  v18 = (unint64_t)objc_msgSend(v17, "uint64Value");

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v19, "timeIntervalSince1970");
  v21 = v20;

  v22 = WALogCategoryDefaultHandle();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 136447234;
    v31 = "-[DPSQuickRecoveryRecommendationEngine checkAWDLActivity:symptomsDnsStats:]";
    v32 = 1024;
    v33 = 939;
    v34 = 1024;
    v35 = v14;
    v36 = 1024;
    v37 = v10;
    v38 = 2048;
    v39 = (unint64_t)v21 - v18 / 0x3E8;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:awdl activity detected, awdl usage: %u, sdb: %u, updated before:%llu seconds", (uint8_t *)&v30, 0x28u);
  }

  if (v14)
    v24 = (unint64_t)v21 - v18 / 0x3E8 >= 0x10;
  else
    v24 = 1;
  v25 = !v24;
  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fieldForKey:", CFSTR("WFAAWDWASDS_suppressedReason")));
    objc_msgSend(v26, "setInt32Value:", 4);

    v27 = WALogCategoryDefaultHandle();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 136446466;
      v31 = "-[DPSQuickRecoveryRecommendationEngine checkAWDLActivity:symptomsDnsStats:]";
      v32 = 1024;
      v33 = 943;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AWDL Activity suspected!", (uint8_t *)&v30, 0x12u);
    }

  }
  return v25;
}

- (unint64_t)recommendSymptomsDpsRecovery:(id)a3 symptomsDnsStats:(id)a4 awdlState:(BOOL)a5 currentSymptomsCondition:(BOOL)a6 isLANPingSuccessful:(BOOL)a7 appUsage:(BOOL)a8 averageCCA:(unsigned int)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v12;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char *__ptr32 *v20;
  id v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *i;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  id v38;
  NSObject *v39;
  _BOOL4 v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  id v44;
  NSObject *v45;
  NSObject *v46;
  unint64_t v47;
  int v48;
  const char *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  NSObject *v54;
  const char *v55;
  id v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  __CFString *v60;
  void *v62;
  id v63;
  const char *v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  _BOOL4 v69;
  _BOOL4 v70;
  void *v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t v77[128];
  uint8_t buf[4];
  const char *v79;
  __int16 v80;
  int v81;
  __int16 v82;
  id v83;

  v9 = a8;
  v10 = a7;
  v12 = a5;
  v15 = a3;
  v16 = a4;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fieldForKey:", CFSTR("WFAAWDWASDS_symptomsDnsRecommendation")));
  objc_msgSend(v17, "setInt32Value:", 0);

  -[DPSQuickRecoveryRecommendationEngine updateTimeSincePreviousTriggerForStudy:msgKey:dictKey:](self, "updateTimeSincePreviousTriggerForStudy:msgKey:dictKey:", v16, CFSTR("WFAAWDWASDS_symptomsDnsTimeSincePreviousTriggerMinutes"), CFSTR("dps_lastSymptomsDpsTrigger"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fieldForKey:", CFSTR("WFAAWDWASDS_suppressedReason")));
  objc_msgSend(v18, "setInt32Value:", 0);

  -[DPSQuickRecoveryRecommendationEngine updateScreenState](self, "updateScreenState");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fieldForKey:", CFSTR("WFAAWDWASDS_symptomsDnsscreenStateOn")));
  objc_msgSend(v19, "setBoolValue:", self->screenON);

  v20 = &off_100092000;
  if (v9)
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fieldForKey:", CFSTR("WFAAWDWASDS_suppressedReason")));
    objc_msgSend(v62, "setInt32Value:", 5);

    v63 = WALogCategoryDefaultHandle();
    v46 = objc_claimAutoreleasedReturnValue(v63);
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      goto LABEL_71;
    *(_DWORD *)buf = 136446466;
    v79 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:currentSymptoms"
          "Condition:isLANPingSuccessful:appUsage:averageCCA:]";
    v80 = 1024;
    v81 = 961;
    v64 = "%{public}s::%d:critical App In Use";
LABEL_70:
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, v64, buf, 0x12u);
    goto LABEL_71;
  }
  if (!a6)
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fieldForKey:", CFSTR("WFAAWDWASDS_suppressedReason")));
    objc_msgSend(v65, "setInt32Value:", 2);

    v66 = WALogCategoryDefaultHandle();
    v46 = objc_claimAutoreleasedReturnValue(v66);
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      goto LABEL_71;
    *(_DWORD *)buf = 136446466;
    v79 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:currentSymptoms"
          "Condition:isLANPingSuccessful:appUsage:averageCCA:]";
    v80 = 1024;
    v81 = 962;
    v64 = "%{public}s::%d:DNS symptoms Condition recovered";
    goto LABEL_70;
  }
  if (-[RecommendationPreferences dps_symptoms_average_cca_threshold](self->_preferences, "dps_symptoms_average_cca_threshold") < a9)
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fieldForKey:", CFSTR("WFAAWDWASDS_suppressedReason")));
    objc_msgSend(v67, "setInt32Value:", 7);

    v68 = WALogCategoryDefaultHandle();
    v46 = objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v79 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:currentSympto"
            "msCondition:isLANPingSuccessful:appUsage:averageCCA:]";
      v80 = 1024;
      v81 = 963;
      v64 = "%{public}s::%d:DNS symptoms Average CCA greater than threshold";
      goto LABEL_70;
    }
LABEL_71:
    v47 = 0;
    v49 = "NoBudget";
    v48 = 1;
LABEL_51:

    goto LABEL_52;
  }
  v21 = WALogCategoryDefaultHandle();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v23)
    {
      *(_DWORD *)buf = 136446722;
      v79 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:currentSympto"
            "msCondition:isLANPingSuccessful:appUsage:averageCCA:]";
      v80 = 1024;
      v81 = 968;
      v82 = 2112;
      v83 = v15;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: all:%@", buf, 0x1Cu);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "info"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("PeerDiagnosticsResults")));

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v22 = v26;
    v27 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
    v28 = v15;
    if (v27)
    {
      v29 = v27;
      v69 = v12;
      v70 = v10;
      v71 = v28;
      v30 = *(_QWORD *)v74;
      v72 = 1;
      while (2)
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(_QWORD *)v74 != v30)
            objc_enumerationMutation(v22);
          v32 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i);
          v33 = WALogCategoryDefaultHandle();
          v34 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446722;
            v79 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:current"
                  "SymptomsCondition:isLANPingSuccessful:appUsage:averageCCA:]";
            v80 = 1024;
            v81 = 971;
            v82 = 2112;
            v83 = v32;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: parsing results...peer:%@", buf, 0x1Cu);
          }

          if (v32)
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("LQMSummary")));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("LocalDevice")));
            v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("YES"));

            v38 = WALogCategoryDefaultHandle();
            v39 = objc_claimAutoreleasedReturnValue(v38);
            v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
            if (v37)
            {
              if (v40)
              {
                *(_DWORD *)buf = 136446466;
                v79 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:cur"
                      "rentSymptomsCondition:isLANPingSuccessful:appUsage:averageCCA:]";
                v80 = 1024;
                v81 = 976;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: self...", buf, 0x12u);
              }

              -[DPSQuickRecoveryRecommendationEngine isScoreBelowThreshold:](self, "isScoreBelowThreshold:", v35);
            }
            else
            {
              if (v40)
              {
                *(_DWORD *)buf = 136446466;
                v79 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:cur"
                      "rentSymptomsCondition:isLANPingSuccessful:appUsage:averageCCA:]";
                v80 = 1024;
                v81 = 982;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: peer...", buf, 0x12u);
              }

              if (-[DPSQuickRecoveryRecommendationEngine isGoodWiFiCondition:](self, "isGoodWiFiCondition:", v35)
                && -[DPSQuickRecoveryRecommendationEngine isScoreBelowThreshold:](self, "isScoreBelowThreshold:", v35))
              {

                v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fieldForKey:", CFSTR("WFAAWDWASDS_suppressedReason")));
                objc_msgSend(v43, "setInt32Value:", 3);

                v44 = WALogCategoryDefaultHandle();
                v41 = objc_claimAutoreleasedReturnValue(v44);
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136446466;
                  v79 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:c"
                        "urrentSymptomsCondition:isLANPingSuccessful:appUsage:averageCCA:]";
                  v80 = 1024;
                  v81 = 994;
                  _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: Peer Devices are also experiencing issues", buf, 0x12u);
                }
                v72 = 0;
                v15 = v71;
                goto LABEL_33;
              }
            }
          }
          else
          {
            v35 = 0;
          }

        }
        v29 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
        if (v29)
          continue;
        break;
      }
      v41 = v22;
      v15 = v71;
LABEL_33:
      v20 = &off_100092000;
      v12 = v69;
      v10 = v70;
    }
    else
    {
      v72 = 1;
      v41 = v22;
    }

    v42 = v72;
  }
  else
  {
    if (v23)
    {
      *(_DWORD *)buf = 136446466;
      v79 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:currentSympto"
            "msCondition:isLANPingSuccessful:appUsage:averageCCA:]";
      v80 = 1024;
      v81 = 966;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: Data not received from peerDiagnostics", buf, 0x12u);
    }
    v42 = 1;
  }

  if (v42 && !v12 && -[DPSQuickRecoveryRecommendationEngine checkForPriorityNetwork](self, "checkForPriorityNetwork"))
  {
    if (-[DPSQuickRecoveryRecommendationEngine isResetAllowedForSymptomsDPS](self, "isResetAllowedForSymptomsDPS"))
    {
      v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fieldForKey:", CFSTR("WFAAWDWASDS_symptomsDnsRecommendation")));
      v46 = v45;
      if (v10)
      {
        v47 = 2;
        -[NSObject setInt32Value:](v45, "setInt32Value:", 2);
        v48 = 0;
        v49 = "Reassoc";
      }
      else
      {
        v47 = 1;
        -[NSObject setInt32Value:](v45, "setInt32Value:", 1);
        v48 = 0;
        v49 = "Reset";
      }
    }
    else
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fieldForKey:", CFSTR("WFAAWDWASDS_suppressedReason")));
      objc_msgSend(v51, "setInt32Value:", 1);

      v52 = WALogCategoryDefaultHandle();
      v46 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v79 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:currentSymp"
              "tomsCondition:isLANPingSuccessful:appUsage:averageCCA:]";
        v80 = 1024;
        v81 = 1012;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: No budget", buf, 0x12u);
      }
      v48 = 0;
      v49 = "NoBudget";
      v47 = 3;
    }
    goto LABEL_51;
  }
  v47 = 0;
  v49 = "NoBudget";
  v48 = 1;
  if (v42 && v12)
  {
    v50 = WALogCategoryDefaultHandle();
    v46 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v79 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:currentSympto"
            "msCondition:isLANPingSuccessful:appUsage:averageCCA:]";
      v80 = 1024;
      v81 = 1016;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: DNS symptoms recovery suppressed due to AWDL activity", buf, 0x12u);
    }
    v47 = 0;
    goto LABEL_51;
  }
LABEL_52:
  v53 = WALogCategoryDefaultHandle();
  v54 = objc_claimAutoreleasedReturnValue(v53);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    v55 = "None";
    *(_DWORD *)buf = *((_QWORD *)v20 + 281);
    v79 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:currentSymptoms"
          "Condition:isLANPingSuccessful:appUsage:averageCCA:]";
    if (!v48)
      v55 = v49;
    v80 = 1024;
    v81 = 1023;
    v82 = 2080;
    v83 = (id)v55;
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: Recommendation for DNS Symptoms Recovery: %s", buf, 0x1Cu);
  }

  if (v48)
  {
    v56 = WALogCategoryDefaultHandle();
    v57 = objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fieldForKey:", CFSTR("WFAAWDWASDS_suppressedReason")));
      v59 = (void *)v58;
      if (v58 >= 0xB)
        v60 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v58));
      else
        v60 = off_1000CD090[(int)v58];
      *(_DWORD *)buf = *((_QWORD *)v20 + 281);
      v79 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:currentSympto"
            "msCondition:isLANPingSuccessful:appUsage:averageCCA:]";
      v80 = 1024;
      v81 = 1025;
      v82 = 2112;
      v83 = v60;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: Suppressed Reason: %@", buf, 0x1Cu);

    }
  }

  return v47;
}

- (RecommendationPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (NSMutableDictionary)dpsQuickRecoveryWDBudgetDict
{
  return self->_dpsQuickRecoveryWDBudgetDict;
}

- (void)setDpsQuickRecoveryWDBudgetDict:(id)a3
{
  objc_storeStrong((id *)&self->_dpsQuickRecoveryWDBudgetDict, a3);
}

- (NSMutableDictionary)dpsStats
{
  return self->_dpsStats;
}

- (void)setDpsStats:(id)a3
{
  objc_storeStrong((id *)&self->_dpsStats, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dpsStats, 0);
  objc_storeStrong((id *)&self->_dpsQuickRecoveryWDBudgetDict, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->modelUrl, 0);
  objc_storeStrong((id *)&self->model, 0);
}

@end
