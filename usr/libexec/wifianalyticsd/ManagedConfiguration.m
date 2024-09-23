@implementation ManagedConfiguration

+ (ManagedConfiguration)sharedInstance
{
  if (qword_1000ED000 != -1)
    dispatch_once(&qword_1000ED000, &stru_1000CCF98);
  return (ManagedConfiguration *)(id)qword_1000ECFF8;
}

- (ManagedConfiguration)init
{
  ManagedConfiguration *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  _UNKNOWN **v13;
  ManagedConfiguration *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  NSObject *v24;

  v16.receiver = self;
  v16.super_class = (Class)ManagedConfiguration;
  v2 = -[ManagedConfiguration init](&v16, "init");
  v3 = WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v18 = "-[ManagedConfiguration init]";
      v19 = 1024;
      v20 = 104;
      v21 = 2112;
      v22 = CFSTR("com.apple.wifianalyticsd");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:starting id %@", buf, 0x1Cu);
    }

    -[ManagedConfiguration setMonitoring:](v2, "setMonitoring:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    -[ManagedConfiguration setMcConnection:](v2, "setMcConnection:", v6);

    v5 = objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject persistentDomainForName:](v5, "persistentDomainForName:", CFSTR("com.apple.wifianalyticsd")));
    v8 = WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "-[ManagedConfiguration init]";
      v19 = 1024;
      v20 = 114;
      v21 = 2112;
      v22 = CFSTR("com.apple.wifianalyticsd");
      v23 = 2112;
      v24 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:RecommendationPreferences bundleIdentifier %@ defaults %@", buf, 0x26u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v11 = +[WAUtil isWiFiFragmentSamplingEnabled](WAUtil, "isWiFiFragmentSamplingEnabled");
    if (v11)
      v12 = &__kCFBooleanTrue;
    else
      v12 = &__kCFBooleanFalse;
    if (v11)
      v13 = &off_1000E0080;
    else
      v13 = &off_1000E0098;
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("megawifiprofile_diagnostic_metrics_enabled"));
    objc_msgSend(v10, "setObject:forKey:", v13, CFSTR("megawifiprofile_diagnostic_metrics_period_ms"));
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("coredata_diagnostic_metrics_enabled"));
    objc_msgSend(v10, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("megawifiprofile_diagnostic_metrics_before_first_assoc"));
    objc_msgSend(v10, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("megawifiprofile_diagnostic_metrics_while_unassoc"));
    -[NSObject setPersistentDomain:forName:](v5, "setPersistentDomain:forName:", v7, CFSTR("com.apple.wifianalyticsd"));
    -[NSObject registerDefaults:](v5, "registerDefaults:", v10);
    -[NSObject addObserver:forKeyPath:options:context:](v5, "addObserver:forKeyPath:options:context:", v2, CFSTR("megawifiprofile_diagnostic_metrics_enabled"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v5, "addObserver:forKeyPath:options:context:", v2, CFSTR("megawifiprofile_diagnostic_metrics_period_ms"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v5, "addObserver:forKeyPath:options:context:", v2, CFSTR("coredata_diagnostic_metrics_enabled"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v5, "addObserver:forKeyPath:options:context:", v2, CFSTR("megawifiprofile_diagnostic_metrics_before_first_assoc"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v5, "addObserver:forKeyPath:options:context:", v2, CFSTR("megawifiprofile_diagnostic_metrics_while_unassoc"), 5, 0);
    v14 = v2;

  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v18 = "-[ManagedConfiguration init]";
    v19 = 1024;
    v20 = 102;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error super init", buf, 0x12u);
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (-[ManagedConfiguration monitoring](self, "monitoring"))
    -[ManagedConfiguration stopMonitoring](self, "stopMonitoring");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("megawifiprofile_diagnostic_metrics_enabled"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("megawifiprofile_diagnostic_metrics_period_ms"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("coredata_diagnostic_metrics_enabled"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("megawifiprofile_diagnostic_metrics_before_first_assoc"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("megawifiprofile_diagnostic_metrics_while_unassoc"));

  v4.receiver = self;
  v4.super_class = (Class)ManagedConfiguration;
  -[ManagedConfiguration dealloc](&v4, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  unsigned int v15;
  const char *v16;
  const char *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  unint64_t v29;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
  v10 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("megawifiprofile_diagnostic_metrics_enabled")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("megawifiprofile_diagnostic_metrics_period_ms")))
    {
      if (!v12)
        goto LABEL_28;
      -[ManagedConfiguration setMegawifiprofile_diagnostic_metrics_period_ms:](self, "setMegawifiprofile_diagnostic_metrics_period_ms:", objc_msgSend(v12, "unsignedIntValue"));
      v18 = WALogCategoryDefaultHandle();
      v14 = objc_claimAutoreleasedReturnValue(v18);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      v22 = 136446978;
      v23 = "-[ManagedConfiguration observeValueForKeyPath:ofObject:change:context:]";
      v24 = 1024;
      v25 = 192;
      v26 = 2112;
      v27 = CFSTR("megawifiprofile_diagnostic_metrics_period_ms");
      v28 = 2048;
      v29 = -[ManagedConfiguration megawifiprofile_diagnostic_metrics_period_ms](self, "megawifiprofile_diagnostic_metrics_period_ms");
      v17 = "%{public}s::%d:%@ Preference is %lu";
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("coredata_diagnostic_metrics_enabled")))
    {
      if (!v12)
        goto LABEL_28;
      -[ManagedConfiguration setCoredata_diagnostic_metrics_enabled:](self, "setCoredata_diagnostic_metrics_enabled:", objc_msgSend(v12, "BOOLValue"));
      v19 = WALogCategoryDefaultHandle();
      v14 = objc_claimAutoreleasedReturnValue(v19);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      v22 = 136446978;
      v23 = "-[ManagedConfiguration observeValueForKeyPath:ofObject:change:context:]";
      v24 = 1024;
      v25 = 197;
      v26 = 2112;
      v27 = CFSTR("coredata_diagnostic_metrics_enabled");
      v28 = 2048;
      v29 = -[ManagedConfiguration coredata_diagnostic_metrics_enabled](self, "coredata_diagnostic_metrics_enabled");
      v17 = "%{public}s::%d:%@ Preference is %lu";
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("megawifiprofile_diagnostic_metrics_before_first_assoc")))
    {
      if (!v12)
        goto LABEL_28;
      -[ManagedConfiguration setMegawifiprofile_diagnostic_metrics_before_first_assoc:](self, "setMegawifiprofile_diagnostic_metrics_before_first_assoc:", objc_msgSend(v12, "BOOLValue"));
      v20 = WALogCategoryDefaultHandle();
      v14 = objc_claimAutoreleasedReturnValue(v20);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      v22 = 136446978;
      v23 = "-[ManagedConfiguration observeValueForKeyPath:ofObject:change:context:]";
      v24 = 1024;
      v25 = 202;
      v26 = 2112;
      v27 = CFSTR("megawifiprofile_diagnostic_metrics_before_first_assoc");
      v28 = 2048;
      v29 = -[ManagedConfiguration megawifiprofile_diagnostic_metrics_before_first_assoc](self, "megawifiprofile_diagnostic_metrics_before_first_assoc");
      v17 = "%{public}s::%d:%@ Preference is %lu";
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("megawifiprofile_diagnostic_metrics_while_unassoc"))|| !v12)
      {
        goto LABEL_28;
      }
      -[ManagedConfiguration setMegawifiprofile_diagnostic_metrics_while_unassoc:](self, "setMegawifiprofile_diagnostic_metrics_while_unassoc:", objc_msgSend(v12, "BOOLValue"));
      v21 = WALogCategoryDefaultHandle();
      v14 = objc_claimAutoreleasedReturnValue(v21);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      v22 = 136446978;
      v23 = "-[ManagedConfiguration observeValueForKeyPath:ofObject:change:context:]";
      v24 = 1024;
      v25 = 207;
      v26 = 2112;
      v27 = CFSTR("megawifiprofile_diagnostic_metrics_while_unassoc");
      v28 = 2048;
      v29 = -[ManagedConfiguration megawifiprofile_diagnostic_metrics_while_unassoc](self, "megawifiprofile_diagnostic_metrics_while_unassoc");
      v17 = "%{public}s::%d:%@ Preference is %lu";
    }
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v22, 0x26u);
    goto LABEL_27;
  }
  if (v12)
  {
    -[ManagedConfiguration setMegawifiprofile_diagnostic_metrics_enabled:](self, "setMegawifiprofile_diagnostic_metrics_enabled:", objc_msgSend(v12, "BOOLValue"));
    v13 = WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = -[ManagedConfiguration megawifiprofile_diagnostic_metrics_enabled](self, "megawifiprofile_diagnostic_metrics_enabled");
      v16 = "NO";
      v23 = "-[ManagedConfiguration observeValueForKeyPath:ofObject:change:context:]";
      v24 = 1024;
      v25 = 187;
      v22 = 136446978;
      if (v15)
        v16 = "YES";
      v26 = 2112;
      v27 = CFSTR("megawifiprofile_diagnostic_metrics_enabled");
      v28 = 2080;
      v29 = (unint64_t)v16;
      v17 = "%{public}s::%d:%@ Preference is %s";
      goto LABEL_26;
    }
LABEL_27:

  }
LABEL_28:

}

- (void)MCSettingsDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = "-[ManagedConfiguration MCSettingsDidChange:]";
    v10 = 1024;
    v11 = 215;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:MCNotification received", (uint8_t *)&v8, 0x12u);
  }

  -[ManagedConfiguration profileChangedCallback:](self, "profileChangedCallback:", 0);
  objc_autoreleasePoolPop(v5);

}

- (void)scheduleWithQueue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  -[ManagedConfiguration setQueue:](self, "setQueue:", v4);
  v6 = WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v11 = "-[ManagedConfiguration scheduleWithQueue:]";
    v12 = 1024;
    v13 = 226;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:scheduleWithQueue", buf, 0x12u);
  }

  v8 = objc_claimAutoreleasedReturnValue(-[ManagedConfiguration queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000338CC;
  block[3] = &unk_1000CCDB0;
  block[4] = self;
  dispatch_async(v8, block);

  objc_autoreleasePoolPop(v5);
}

- (void)unscheduleFromQueue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = "-[ManagedConfiguration unscheduleFromQueue:]";
    v10 = 1024;
    v11 = 238;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:unscheduleFromQueue", (uint8_t *)&v8, 0x12u);
  }

  -[ManagedConfiguration stopMonitoring](self, "stopMonitoring");
  -[ManagedConfiguration setQueue:](self, "setQueue:", 0);
  objc_autoreleasePoolPop(v5);

}

- (void)startMonitoring
{
  int *p_profileNoticeToken;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  uint32_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v16;
  id v17;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint32_t v24;

  p_profileNoticeToken = &self->_profileNoticeToken;
  global_queue = dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100033CF8;
  handler[3] = &unk_1000CCFC0;
  handler[4] = self;
  v6 = notify_register_dispatch("com.apple.ManagedConfiguration.profileListChanged", p_profileNoticeToken, v5, handler);

  v7 = WALogCategoryDefaultHandle();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v20 = "-[ManagedConfiguration startMonitoring]";
    v21 = 1024;
    v22 = 256;
    v23 = 1024;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:notify_register_dispatch for PROFILE_SERVICE_IDENTIFIER %d", buf, 0x18u);
  }

  v9 = objc_autoreleasePoolPush();
  v10 = WALogCategoryDefaultHandle();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v20 = "-[ManagedConfiguration startMonitoring]";
    v21 = 1024;
    v22 = 260;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding NSNotificationCenter Observer", buf, 0x12u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "addObserver:selector:name:object:", self, "MCSettingsDidChange:", MCEffectiveSettingsChangedNotification, 0);

  v13 = WALogCategoryDefaultHandle();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v20 = "-[ManagedConfiguration startMonitoring]";
    v21 = 1024;
    v22 = 267;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding DarwinNotifyCenter Observer", buf, 0x12u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v16 = DarwinNotifyCenter;
  if (DarwinNotifyCenter)
  {
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100033D04, CFSTR("CCDaemonProfile Changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    xpc_set_event_stream_handler("com.apple.notifyd.matching", v5, &stru_1000CD000);
  }
  else
  {
    v17 = WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v20 = "-[ManagedConfiguration startMonitoring]";
      v21 = 1024;
      v22 = 270;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unable to get DarwinNotifyCenter", buf, 0x12u);
    }
  }

  -[ManagedConfiguration setMonitoring:](self, "setMonitoring:", v16 != 0);
  objc_autoreleasePoolPop(v9);
}

- (void)profileChangedCallback:(int)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[ManagedConfiguration queue](self, "queue", *(_QWORD *)&a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033F74;
  block[3] = &unk_1000CCDB0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)stopMonitoring
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;

  v3 = objc_autoreleasePoolPush();
  v4 = WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446466;
    v8 = "-[ManagedConfiguration stopMonitoring]";
    v9 = 1024;
    v10 = 414;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:removing observer", (uint8_t *)&v7, 0x12u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, MCEffectiveSettingsChangedNotification, 0);

  -[ManagedConfiguration setMonitoring:](self, "setMonitoring:", 0);
  objc_autoreleasePoolPop(v3);
}

- (WADiagDBDelegate)dbDelegate
{
  return (WADiagDBDelegate *)objc_loadWeakRetained((id *)&self->_dbDelegate);
}

- (void)setDbDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dbDelegate, a3);
}

- (BOOL)disable_dps_wd
{
  return self->_disable_dps_wd;
}

- (BOOL)megawifiprofile_diagnostic_metrics_enabled
{
  return self->_megawifiprofile_diagnostic_metrics_enabled;
}

- (void)setMegawifiprofile_diagnostic_metrics_enabled:(BOOL)a3
{
  self->_megawifiprofile_diagnostic_metrics_enabled = a3;
}

- (unint64_t)megawifiprofile_diagnostic_metrics_period_ms
{
  return self->_megawifiprofile_diagnostic_metrics_period_ms;
}

- (void)setMegawifiprofile_diagnostic_metrics_period_ms:(unint64_t)a3
{
  self->_megawifiprofile_diagnostic_metrics_period_ms = a3;
}

- (BOOL)megawifiprofile_diagnostic_metrics_before_first_assoc
{
  return self->_megawifiprofile_diagnostic_metrics_before_first_assoc;
}

- (void)setMegawifiprofile_diagnostic_metrics_before_first_assoc:(BOOL)a3
{
  self->_megawifiprofile_diagnostic_metrics_before_first_assoc = a3;
}

- (BOOL)megawifiprofile_diagnostic_metrics_while_unassoc
{
  return self->_megawifiprofile_diagnostic_metrics_while_unassoc;
}

- (void)setMegawifiprofile_diagnostic_metrics_while_unassoc:(BOOL)a3
{
  self->_megawifiprofile_diagnostic_metrics_while_unassoc = a3;
}

- (BOOL)coredata_diagnostic_metrics_enabled
{
  return self->_coredata_diagnostic_metrics_enabled;
}

- (void)setCoredata_diagnostic_metrics_enabled:(BOOL)a3
{
  self->_coredata_diagnostic_metrics_enabled = a3;
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (MCProfileConnection)mcConnection
{
  return (MCProfileConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMcConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDictionary)profileConfiguration
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProfileConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)profileLoaded
{
  return self->_profileLoaded;
}

- (void)setProfileLoaded:(BOOL)a3
{
  self->_profileLoaded = a3;
}

- (OS_os_transaction)megaProfileInstalledTransaction
{
  return self->_megaProfileInstalledTransaction;
}

- (void)setMegaProfileInstalledTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_megaProfileInstalledTransaction, a3);
}

- (int)profileNoticeToken
{
  return self->_profileNoticeToken;
}

- (void)setProfileNoticeToken:(int)a3
{
  self->_profileNoticeToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_megaProfileInstalledTransaction, 0);
  objc_storeStrong((id *)&self->_profileConfiguration, 0);
  objc_storeStrong((id *)&self->_mcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_dbDelegate);
}

@end
