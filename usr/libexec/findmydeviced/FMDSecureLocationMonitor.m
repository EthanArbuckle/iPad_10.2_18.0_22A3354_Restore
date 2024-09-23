@implementation FMDSecureLocationMonitor

- (FMDSecureLocationMonitor)init
{
  id v2;
  dispatch_queue_t v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  FMDSecureLocationConfigManager *v7;
  void *v8;
  void *v9;
  FMDSecureLocationPublisher *v10;
  void *v11;
  FMDSecureLocationPublisher *v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)FMDSecureLocationMonitor;
  v2 = -[FMDSecureLocationMonitor init](&v17, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.findmydevice.locationPublishQueue", 0);
    v4 = (void *)*((_QWORD *)v2 + 18);
    *((_QWORD *)v2 + 18) = v3;

    v5 = dispatch_queue_create("com.apple.findmydevice.forcePushOndemandLocationQueue", 0);
    v6 = (void *)*((_QWORD *)v2 + 19);
    *((_QWORD *)v2 + 19) = v5;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v2 + 19), "com.apple.findmydevice.forcePublishQueueKey", "com.apple.findmydevice.forcePublishQueueKey", 0);
    v7 = objc_alloc_init(FMDSecureLocationConfigManager);
    v8 = (void *)*((_QWORD *)v2 + 14);
    *((_QWORD *)v2 + 14) = v7;

    objc_msgSend(*((id *)v2 + 14), "setDelegate:", v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v2 + 14), "activeConfig"));

    if (v9)
    {
      v10 = [FMDSecureLocationPublisher alloc];
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v2 + 14), "activeConfig"));
      v12 = -[FMDSecureLocationPublisher initWithConfiguration:](v10, "initWithConfiguration:", v11);
      v13 = (void *)*((_QWORD *)v2 + 13);
      *((_QWORD *)v2 + 13) = v12;

    }
    v14 = objc_alloc_init((Class)SPSecureLocationsManager);
    v15 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v14;

    objc_msgSend(v2, "_registerForOnDemandPublishRequest");
    objc_msgSend(v2, "_registerForStewiePublishRequest");
  }
  return (FMDSecureLocationMonitor *)v2;
}

- (void)dealloc
{
  objc_super v3;

  -[FMDSecureLocationMonitor _unregisterFromOnDemandPublishRequest](self, "_unregisterFromOnDemandPublishRequest");
  -[FMDSecureLocationMonitor _unregisterFromStewiePublishRequest](self, "_unregisterFromStewiePublishRequest");
  v3.receiver = self;
  v3.super_class = (Class)FMDSecureLocationMonitor;
  -[FMDSecureLocationMonitor dealloc](&v3, "dealloc");
}

- (void)startLocationMonitor:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;
  id buf[2];

  v4 = a3;
  v5 = sub_10005318C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attempting to start location monitors", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000861D0;
  block[3] = &unk_1002C44C8;
  objc_copyWeak(&v10, buf);
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

- (void)startLocationMonitorWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = sub_10005318C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "startLocationMonitorWithContext %@", (uint8_t *)&v11, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor configManager](self, "configManager"));
  objc_msgSend(v10, "requestMonitorWithContext:", v6);

  v7[2](v7, 0);
}

- (void)startLocationMonitorWithContext:(id)a3 forcePublish:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, _QWORD);
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  FMDSecureLocationMonitor *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  _BOOL4 v23;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  v10 = sub_10005318C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    v22 = 1024;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "startLocationMonitorWithContext %@ forcePublish %d", buf, 0x12u);
  }

  if (v6)
  {
    objc_initWeak((id *)buf, self);
    v12 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor forcePushOndemandLocationQueue](self, "forcePushOndemandLocationQueue"));
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_10008711C;
    v17 = &unk_1002C11E8;
    objc_copyWeak(&v19, (id *)buf);
    v18 = self;
    dispatch_async(v12, &v14);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor configManager](self, "configManager", v14, v15, v16, v17));
  objc_msgSend(v13, "requestMonitorWithContext:", v8);

  v9[2](v9, 0);
}

- (void)startLocationMonitorAfterRestart
{
  char *v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  NSObject *v8;
  char *v9;
  id v10;
  NSObject *v11;
  int v12;
  char *v13;

  v3 = (char *)+[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", CFSTR("kFMDSecureLocationsShouldStartMonitor"), kFMDNotBackedUpPrefDomain);
  v4 = sub_10005318C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134217984;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "shouldStart secure locations %ld", (uint8_t *)&v12, 0xCu);
  }

  v6 = objc_alloc_init((Class)FMDSecureLocationContext);
  objc_msgSend(v6, "setFindMyId:", CFSTR("restart"));
  if ((unint64_t)(v3 - 1) < 3)
  {
    objc_msgSend(v6, "setMode:", *(_QWORD *)*(&off_1002C4630 + (_QWORD)(v3 - 1)));
LABEL_6:
    v7 = sub_10005318C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mode"));
      v12 = 138412290;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "starting location monitoring after restart with policy %@", (uint8_t *)&v12, 0xCu);

    }
    if (!-[FMDSecureLocationMonitor isRunning](self, "isRunning"))
      -[FMDSecureLocationMonitor startLocationMonitorWithContext:completion:](self, "startLocationMonitorWithContext:completion:", v6, &stru_1002C4508);
    goto LABEL_10;
  }
  if ((uint64_t)v3 > 0)
    goto LABEL_6;
  if (!-[FMDSecureLocationMonitor isRunning](self, "isRunning"))
  {
    v10 = sub_10005318C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unregister previously scheduled activity, if any.", (uint8_t *)&v12, 2u);
    }

    xpc_activity_unregister("com.apple.findmydevice.secureLocationsCheck");
  }
LABEL_10:

}

- (void)stopLocationMonitorWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = sub_10005318C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "stopLocationMonitorWithContext %@", (uint8_t *)&v11, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor configManager](self, "configManager"));
  objc_msgSend(v10, "removeMonitorWithContext:", v6);

  v7[2](v7, 0);
}

- (void)stopLocationMonitor:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100087610;
  block[3] = &unk_1002C1CF8;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (BOOL)isRunning
{
  return -[FMDSecureLocationMonitor locationManagerStarted](self, "locationManagerStarted");
}

- (BOOL)shouldStartMonitor
{
  return (uint64_t)+[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", CFSTR("kFMDSecureLocationsShouldStartMonitor"), kFMDNotBackedUpPrefDomain) > 0;
}

- (double)_clLocationAccuracyFromConfigValue:(id)a3
{
  id v3;
  double v4;
  const __CFString *v5;
  id v6;
  NSObject *v7;
  int v9;
  const __CFString *v10;
  __int16 v11;
  id v12;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("best")))
  {
    v4 = kCLLocationAccuracyBest;
    v5 = CFSTR("kCLLocationAccuracyBest");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("navigation")))
  {
    v4 = kCLLocationAccuracyBestForNavigation;
    v5 = CFSTR("kCLLocationAccuracyBestForNavigation");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("10meters")))
  {
    v4 = kCLLocationAccuracyNearestTenMeters;
    v5 = CFSTR("kCLLocationAccuracyNearestTenMeters");
  }
  else
  {
    v4 = kCLLocationAccuracyHundredMeters;
    v5 = CFSTR("kCLLocationAccuracyHundredMeters");
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("100meters")) & 1) == 0)
    {
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("1kilometer")))
      {
        v4 = kCLLocationAccuracyKilometer;
        v5 = CFSTR("kCLLocationAccuracyKilometer");
      }
      else if (objc_msgSend(v3, "isEqualToString:", CFSTR("3kilometers")))
      {
        v5 = CFSTR("kCLLocationAccuracyThreeKilometers");
        v4 = kCLLocationAccuracyThreeKilometers;
      }
    }
  }
  v6 = sub_10005318C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: returning CL accuracy %@ for config value %@", (uint8_t *)&v9, 0x16u);
  }

  return v4;
}

- (void)_publishLocation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  unsigned int v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  int v26;

  v4 = a3;
  if ((objc_msgSend(v4, "isLocationValid") & 1) != 0)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[FMDRestrictedRegions sharedInstance](FMDRestrictedRegions, "sharedInstance"));
    if (-[NSObject isRestrictedSKU](v5, "isRestrictedSKU"))
    {
      v6 = sub_10005318C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
LABEL_11:

        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      v8 = "SecureLocationMonitor - not publishing - restricted SKU";
      v9 = v7;
      v10 = 2;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "locationInfo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "latitude"));
      objc_msgSend(v13, "doubleValue");
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "locationInfo"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "longitude"));
      objc_msgSend(v17, "doubleValue");
      v19 = -[NSObject isRestrictedLocationWithLatitude:longitude:](v5, "isRestrictedLocationWithLatitude:longitude:", v15, v18);

      if (!v19)
      {
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100087DEC;
        v21[3] = &unk_1002C13E8;
        v21[4] = self;
        v22 = v4;
        _os_activity_initiate((void *)&_mh_execute_header, "FMDSecureLocationMonitor.publishLocation", OS_ACTIVITY_FLAG_DEFAULT, v21);

        goto LABEL_13;
      }
      v20 = sub_10005318C();
      v7 = objc_claimAutoreleasedReturnValue(v20);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      *(_DWORD *)buf = 67109376;
      v24 = 0;
      v25 = 1024;
      v26 = 1;
      v8 = "SecureLocationMonitor - not publishing - restricted region. isRestrictedSKU %d isRestrictedLocation %d";
      v9 = v7;
      v10 = 14;
    }
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    goto LABEL_11;
  }
  v11 = sub_10005318C();
  v5 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor - not publishing - invalid location", buf, 2u);
  }
LABEL_13:

}

- (void)_publishHeartbeatIfNeeded
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  double v25;
  __int16 v26;
  uint64_t v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor lastPublishedTime](self, "lastPublishedTime"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor lastPublishedTime](self, "lastPublishedTime"));
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor configManager](self, "configManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeConfig"));
  objc_msgSend(v8, "heartbeatPublish");
  v10 = v9;

  v11 = sub_10005318C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (v3)
      v13 = CFSTR("NO");
    else
      v13 = CFSTR("YES");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor lastPublishedTime](self, "lastPublishedTime"));
    objc_msgSend(v14, "timeIntervalSinceNow");
    v16 = -v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor configManager](self, "configManager"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "activeConfig"));
    objc_msgSend(v18, "heartbeatPublish");
    *(_DWORD *)buf = 138412802;
    v23 = v13;
    v24 = 2048;
    v25 = v16;
    v26 = 2048;
    v27 = v19;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: Heartbeat isfirstpublish %@. Time since last publish %f configLimit %f", buf, 0x20u);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor lastPublishedTime](self, "lastPublishedTime"));

  if (!v20 || v10 <= -v6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000882F4;
    block[3] = &unk_1002C1328;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_publishPeriodicShallowIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CLLocationFMGeoLocatableAdapter *v15;
  FMDSecureLocationInfo *v16;
  void *v17;
  void *v18;
  FMDSecureLocationInfo *v19;
  id v20;
  NSObject *v21;
  uint8_t v22[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor configManager](self, "configManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configForPolicy:", kFMDSecureLocationModeProactiveShallow));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor lastShallowPublishTime](self, "lastShallowPublishTime"));
  if (!v8)
    goto LABEL_3;
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor lastShallowPublishTime](self, "lastShallowPublishTime"));
  objc_msgSend(v10, "timeIntervalSinceNow");
  v12 = -v11;
  objc_msgSend(v6, "minTimeBetweenPublish");
  v14 = v13;

  if (v14 <= v12)
  {
LABEL_3:
    v15 = -[CLLocationFMGeoLocatableAdapter initWithLocation:]([CLLocationFMGeoLocatableAdapter alloc], "initWithLocation:", v4);
    v16 = [FMDSecureLocationInfo alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor motionMonitor](self, "motionMonitor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastKnownDeviceMotion"));
    v19 = -[FMDSecureLocationInfo initWithLocation:motion:publishReason:](v16, "initWithLocation:motion:publishReason:", v15, v18, 6);

    -[FMDSecureLocationMonitor _publishLocation:](self, "_publishLocation:", v19);
    -[FMDSecureLocationMonitor setLastShallowPublishTime:](self, "setLastShallowPublishTime:", v7);
    v20 = sub_10005318C();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: Published periodic shallow during live session", v22, 2u);
    }

  }
}

- (void)publishOnDemandLocation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor locationPublishQueue](self, "locationPublishQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100088628;
  v7[3] = &unk_1002C2038;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_registerForOnDemandPublishRequest
{
  __CFNotificationCenter *DarwinNotifyCenter;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100088878, CFSTR("com.apple.icloud.searchparty.secureLocations.OnDemandPublishRequest"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v4 = sub_10005318C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: Registered for ondemand publish notification", v6, 2u);
  }

}

- (void)_unregisterFromOnDemandPublishRequest
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.icloud.searchparty.secureLocations.OnDemandPublishRequest"), 0);
}

- (void)publishLocationToStewie:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor stewieLocationManager](self, "stewieLocationManager", a3));

  if (!v4)
  {
    v5 = sub_10005318C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = CFSTR("stewie:");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: %@ No location manager - creating one", buf, 0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor _createLocationManagerForStewie](self, "_createLocationManagerForStewie"));
    -[FMDSecureLocationMonitor setStewieLocationManager:](self, "setStewieLocationManager:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor stewieLocationManager](self, "stewieLocationManager"));

  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor locationPublishQueue](self, "locationPublishQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100088ABC;
    block[3] = &unk_1002C1328;
    block[4] = self;
    dispatch_async(v9, block);

  }
  else
  {
    v10 = sub_10005318C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = CFSTR("stewie:");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: %@ No location manager available", buf, 0xCu);
    }

  }
}

- (void)_registerForStewiePublishRequest
{
  __CFNotificationCenter *DarwinNotifyCenter;
  id v4;
  NSObject *v5;
  const char *v6;
  id v7;
  int v8;
  const __CFString *v9;

  if (_os_feature_enabled_impl("FindMy", "FM_NiftyCurve"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100088CA4, CFSTR("com.apple.icloud.searchparty.secureLocations.liteLocationPublishRequest"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v4 = sub_10005318C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = CFSTR("stewie:");
      v6 = "SecureLocationMonitor: %@ Registered for publish notification";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    v7 = sub_10005318C();
    v5 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = CFSTR("stewie:");
      v6 = "SecureLocationMonitor: %@ feature disabled. Not registering for notification";
      goto LABEL_6;
    }
  }

}

- (void)_unregisterFromStewiePublishRequest
{
  __CFNotificationCenter *DarwinNotifyCenter;
  id v4;
  NSObject *v5;
  int v6;
  const __CFString *v7;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.icloud.searchparty.secureLocations.stewiePublishRequest"), 0);
  v4 = sub_10005318C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = CFSTR("stewie:");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: %@ Unregistered for publish notification", (uint8_t *)&v6, 0xCu);
  }

}

- (id)_createLocationManagerForStewie
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor _createLocationManager](self, "_createLocationManager"));
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setDesiredAccuracy:", kCLLocationAccuracyBest);
  return v3;
}

- (id)_createLocationManager
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/FindMyDevice.framework")));
  v3 = objc_msgSend(objc_alloc((Class)CLLocationManager), "initWithEffectiveBundle:", v2);

  return v3;
}

- (id)_createLocationManagerWithQueue:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/FindMyDevice.framework")));
  v6 = objc_msgSend(objc_alloc((Class)CLLocationManager), "initWithEffectiveBundle:delegate:onQueue:", v5, self, v4);

  return v6;
}

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  CLLocationFMGeoLocatableAdapter *v22;
  FMDSecureLocationInfo *v23;
  void *v24;
  void *v25;
  FMDSecureLocationInfo *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;

  v5 = a4;
  v6 = sub_10005318C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "coordinate");
    v9 = v8;
    objc_msgSend(v5, "coordinate");
    v29 = 138412803;
    v30 = v5;
    v31 = 2049;
    v32 = v9;
    v33 = 2049;
    v34 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "didVisit %@ %{private}f %{private}f", (uint8_t *)&v29, 0x20u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor locationPublisher](self, "locationPublisher"));
  if (v11)
  {
    if (objc_msgSend(v5, "hasArrivalDate")
      && (objc_msgSend(v5, "hasDepartureDate") & 1) == 0)
    {
      v14 = objc_alloc((Class)CLLocation);
      objc_msgSend(v5, "coordinate");
      v16 = v15;
      v18 = v17;
      objc_msgSend(v5, "horizontalAccuracy");
      v20 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v13 = objc_msgSend(v14, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v21, v16, v18, 0.0, v20, 0.0);

      v22 = -[CLLocationFMGeoLocatableAdapter initWithLocation:]([CLLocationFMGeoLocatableAdapter alloc], "initWithLocation:", v13);
      v23 = [FMDSecureLocationInfo alloc];
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor motionMonitor](self, "motionMonitor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lastKnownDeviceMotion"));
      v26 = -[FMDSecureLocationInfo initWithLocation:motion:publishReason:](v23, "initWithLocation:motion:publishReason:", v22, v25, 2);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
      LODWORD(v25) = objc_msgSend(v27, "isInternalBuild");

      if ((_DWORD)v25
        && +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("PublishVisitImmediately"), kFMDNotBackedUpPrefDomain))
      {
        -[FMDSecureLocationMonitor _publishLocation:](self, "_publishLocation:", v26);
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor locationPublisher](self, "locationPublisher"));
      objc_msgSend(v28, "processUpdatedLocation:", v26);

    }
    else
    {
      v12 = sub_10005318C();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: Received visit departure. Ignoring", (uint8_t *)&v29, 2u);
      }
    }

  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _BOOL4 v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  unsigned int v35;
  BOOL v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  _BOOL4 v41;
  int v42;
  CLLocationFMGeoLocatableAdapter *v43;
  FMDSecureLocationInfo *v44;
  void *v45;
  void *v46;
  FMDSecureLocationInfo *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  id v54;
  NSObject *v55;
  id v56;
  id v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  unsigned int v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  int v68;
  id v69;
  CLLocationFMGeoLocatableAdapter *v70;
  id v71;
  _QWORD v72[5];
  uint8_t buf[4];
  const __CFString *v74;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "count"))
  {
    v20 = sub_10005318C();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor didUpdateLocations but location count is zero", buf, 2u);
    }
    goto LABEL_51;
  }
  v8 = (id)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor bystanderLocationManager](self, "bystanderLocationManager"));

  if (v8 == v6)
  {
    v22 = v7;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor configManager](self, "configManager"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "activeConfig"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "policyName"));
    v26 = objc_msgSend(v25, "isEqualToString:", kFMDSecureLocationModeOwnerProactive);

    if ((v26 & 1) != 0)
    {
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v15 = 0;
      v19 = 10;
    }
    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor configManager](self, "configManager"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "activeConfig"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "policyName"));
      v30 = objc_msgSend(v29, "isEqualToString:", kFMDSecureLocationModeBackgroundProactive);

      v16 = 0;
      v17 = 0;
      v18 = 0;
      v15 = 0;
      if (v30)
        v19 = 12;
      else
        v19 = 4;
    }
    v7 = v22;
  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor slcLocationManager](self, "slcLocationManager"));

    if (v9 == v6)
    {
      v16 = 0;
      v17 = 0;
      v15 = 0;
      v18 = 1;
      v19 = 1;
    }
    else
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor heartbeatLocationManager](self, "heartbeatLocationManager"));

      if (v10 == v6)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor configManager](self, "configManager"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "activeConfig"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "policyName"));
        v34 = v7;
        v35 = objc_msgSend(v33, "isEqualToString:", kFMDSecureLocationModeOwnerProactive);

        v16 = 0;
        v17 = 0;
        v18 = 0;
        v15 = 0;
        v36 = v35 == 0;
        v7 = v34;
        if (v36)
          v19 = 3;
        else
          v19 = 9;
      }
      else
      {
        v11 = (id)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor ondemandLocationManager](self, "ondemandLocationManager"));

        if (v11 == v6)
        {
          v16 = 0;
          v17 = 0;
          v18 = 0;
          v15 = 0;
          v19 = 5;
        }
        else
        {
          v12 = (id)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor liveLocationManager](self, "liveLocationManager"));

          if (v12 == v6)
          {
            v17 = 0;
            v18 = 0;
            v15 = 0;
            v16 = 1;
            v19 = 7;
          }
          else
          {
            v13 = (id)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor shallowLocationManager](self, "shallowLocationManager"));

            if (v13 == v6)
            {
              objc_msgSend(v6, "setDesiredAccuracy:", kCLLocationAccuracyHundredMeters);
              v16 = 0;
              v18 = 0;
              v15 = 0;
              v17 = 1;
              v19 = 6;
            }
            else
            {
              v14 = (id)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor stewieLocationManager](self, "stewieLocationManager"));
              v15 = v14 == v6;

              v16 = 0;
              v17 = 0;
              v18 = 0;
              v19 = 8 * v15;
            }
          }
        }
      }
    }
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
  -[FMDSecureLocationMonitor forcePublishOndemandLocationIfNeeded:](self, "forcePublishOndemandLocationIfNeeded:", v37);

  v38 = sub_10005318C();
  v39 = objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    sub_10022B7C4(v19, v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor locationPublisher](self, "locationPublisher"));
  if (v40)
  {
    v41 = v15;
    v71 = v6;
    v68 = v17;
    v42 = v16;
    v69 = v7;
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
    v43 = -[CLLocationFMGeoLocatableAdapter initWithLocation:]([CLLocationFMGeoLocatableAdapter alloc], "initWithLocation:", v21);
    v44 = [FMDSecureLocationInfo alloc];
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor motionMonitor](self, "motionMonitor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "lastKnownDeviceMotion"));
    v70 = v43;
    v47 = -[FMDSecureLocationInfo initWithLocation:motion:publishReason:](v44, "initWithLocation:motion:publishReason:", v43, v46, v19);

    if (v18)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor configManager](self, "configManager"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "configForPolicy:", kFMDSecureLocationModeProactive));

      v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject timestamp](v21, "timestamp"));
      objc_msgSend(v50, "timeIntervalSinceNow");
      v52 = -v51;

      objc_msgSend(v49, "minTimeBetweenPublish");
      if (v53 < v52)
      {
        v54 = sub_10005318C();
        v55 = objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor - we received a very old location. Lets ignore it and request an on demand publish", buf, 2u);
        }

        -[FMDSecureLocationMonitor publishOnDemandLocation:](self, "publishOnDemandLocation:", &stru_1002C4550);
        goto LABEL_32;
      }
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
      v62 = objc_msgSend(v61, "isInternalBuild");

      if (v62
        && +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("PublishSLCImmediately"), kFMDNotBackedUpPrefDomain))
      {
        -[FMDSecureLocationMonitor _publishLocation:](self, "_publishLocation:", v47);
LABEL_32:
        v6 = v71;

        v7 = v69;
LABEL_51:

        goto LABEL_52;
      }

      v16 = v42;
      v17 = v68;
      v6 = v71;
    }
    else
    {
      v16 = v42;
      v17 = v68;
      v6 = v71;
      if (v41)
      {
        v57 = sub_10005318C();
        v58 = objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v74 = CFSTR("stewie:");
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: %@ location request - sending to publish immediately", buf, 0xCu);
        }

        -[FMDSecureLocationMonitor _publishLocation:](self, "_publishLocation:", v47);
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor stewieLocationManager](self, "stewieLocationManager"));
        objc_msgSend(v59, "stopUpdatingLocation");

        v60 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor stewieLocationManager](self, "stewieLocationManager"));
        objc_msgSend(v60, "setDelegate:", 0);

        -[FMDSecureLocationMonitor setStewieLocationManager:](self, "setStewieLocationManager:", 0);
      }
    }
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor locationPublisher](self, "locationPublisher"));
    objc_msgSend(v63, "processUpdatedLocation:", v47);

    v7 = v69;
  }
  else
  {
    v56 = sub_10005318C();
    v21 = objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor - anomalous condition - received locations but no publisher setup", buf, 2u);
    }
  }

  if ((v16 | v17) == 1)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor configManager](self, "configManager"));
    v65 = v64;
    if (v16)
    {
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "expirationTimeFor:", kFMDSecureLocationModeLive));

      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
      -[FMDSecureLocationMonitor _publishPeriodicShallowIfNeeded:](self, "_publishPeriodicShallowIfNeeded:", v65);
    }
    else
    {
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "expirationTimeFor:", kFMDSecureLocationModeProactiveShallow));
    }

    if (v21)
    {
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v67 = objc_msgSend(v66, "compare:", v21);

      if (v67 == (id)1)
      {
        v72[0] = _NSConcreteStackBlock;
        v72[1] = 3221225472;
        v72[2] = sub_100089A10;
        v72[3] = &unk_1002C1690;
        v72[4] = self;
        -[FMDSecureLocationMonitor stopLocationMonitor:](self, "stopLocationMonitor:", v72);
      }
    }
    goto LABEL_51;
  }
LABEL_52:

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  uint8_t buf[16];

  v5 = a4;
  v6 = sub_10005318C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_10022B864((uint64_t)v5, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  if (!objc_msgSend(v8, "isEqualToString:", kCLErrorDomain))
  {

    goto LABEL_8;
  }
  v9 = objc_msgSend(v5, "code");

  if (v9)
  {
LABEL_8:
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100089C00;
    v12[3] = &unk_1002C1690;
    v13 = v5;
    -[FMDSecureLocationMonitor stopLocationMonitor:](self, "stopLocationMonitor:", v12);
    v11 = v13;
    goto LABEL_9;
  }
  v10 = sub_10005318C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not stopping the SecureLocationMonitor service because the error is temporary.", buf, 2u);
  }
LABEL_9:

}

- (void)_scheduleXPCActivity
{
  xpc_object_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  int64_t v21;
  unsigned int v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  _QWORD handler[5];
  uint8_t buf[4];
  int64_t v29;
  __int16 v30;
  unsigned int v31;

  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = kFMDSecureLocationModeProactive;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor configManager](self, "configManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeConfig"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "policyName"));
  v8 = (void *)kFMDSecureLocationModeOwnerProactive;
  v9 = objc_msgSend(v7, "caseInsensitiveCompare:", kFMDSecureLocationModeOwnerProactive);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor configManager](self, "configManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeConfig"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "policyName"));
    v8 = (void *)kFMDSecureLocationModeBackgroundProactive;
    v13 = objc_msgSend(v12, "caseInsensitiveCompare:", kFMDSecureLocationModeBackgroundProactive);

    if (v13)
      goto LABEL_9;
    v14 = sub_10005318C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = (int64_t)v8;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: _scheduleXPCActivity for %@", buf, 0xCu);
    }
  }
  else
  {
    v16 = sub_10005318C();
    v15 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = (int64_t)v8;
      goto LABEL_7;
    }
  }

  v17 = v8;
  v4 = v17;
LABEL_9:
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor configManager](self, "configManager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "configForPolicy:", v4));

  if (v19)
  {
    objc_msgSend(v19, "heartbeatPublish");
    v21 = (uint64_t)v20;
    v22 = objc_msgSend(v19, "shouldWakeDevice");
  }
  else
  {
    v22 = 1;
    v21 = 1080;
  }
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_DELAY, v21);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, v22);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_15_MIN);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  v23 = sub_10005318C();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v29 = v21;
    v30 = 1024;
    v31 = v22;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: Configuring Heartbeat XPC activity with duration %lld. shouldWake: %i", buf, 0x12u);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10008A074;
  handler[3] = &unk_1002C4040;
  handler[4] = self;
  xpc_activity_register("com.apple.findmydevice.secureLocationsCheck", v3, handler);
  v25 = sub_10005318C();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Scheduled XPC Activity for SecureLocations Hearbeat", buf, 2u);
  }

}

- (void)updateMonitorConfig:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = sub_10005318C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "updateMonitorConfig", v8, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor configManager](self, "configManager"));
  objc_msgSend(v7, "updateConfigData:", v4);

}

- (void)activeConfigChanged:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  _QWORD v11[4];
  id v12;
  FMDSecureLocationMonitor *v13;
  uint8_t buf[4];
  id v15;

  v4 = a3;
  v5 = sub_10005318C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: Active Config Changed: %{public}@.", buf, 0xCu);
  }

  v7 = -[FMDSecureLocationMonitor isRunning](self, "isRunning");
  v8 = sub_10005318C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: Stopping and restarting after config change", buf, 2u);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10008A5A0;
    v11[3] = &unk_1002C2130;
    v12 = v4;
    v13 = self;
    -[FMDSecureLocationMonitor stopLocationMonitor:](self, "stopLocationMonitor:", v11);

  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: Not running. Starting it.", buf, 2u);
    }

    -[FMDSecureLocationMonitor startLocationMonitor:](self, "startLocationMonitor:", &stru_1002C4590);
  }

}

- (void)activeConfigExtended:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;

  v4 = a3;
  v5 = sub_10005318C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "policyName"));
    v12 = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: Active Config Extended %@", (uint8_t *)&v12, 0xCu);

  }
  if (-[FMDSecureLocationMonitor isRunning](self, "isRunning"))
  {
    v8 = sub_10005318C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: activeConfig already running", (uint8_t *)&v12, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "policyName"));
    v11 = objc_msgSend(v10, "caseInsensitiveCompare:", kFMDSecureLocationModeProactive);

    if (!v11)
      -[FMDSecureLocationMonitor publishOnDemandLocation:](self, "publishOnDemandLocation:", &stru_1002C45D0);
  }
  else
  {
    -[FMDSecureLocationMonitor startLocationMonitor:](self, "startLocationMonitor:", &stru_1002C45B0);
  }

}

- (void)forcePublishOndemandLocationIfNeeded:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (dispatch_get_specific("com.apple.findmydevice.forcePublishQueueKey") == "com.apple.findmydevice.forcePublishQueueKey")
  {
    -[FMDSecureLocationMonitor publishOneTimeShallowLocation:](self, "publishOneTimeShallowLocation:", v4);
  }
  else
  {
    objc_initWeak(&location, self);
    v5 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor forcePushOndemandLocationQueue](self, "forcePushOndemandLocationQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008ABE0;
    block[3] = &unk_1002C11E8;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    dispatch_async(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

- (void)requestForcedShallowLocation
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor forcePushOndemandLocationQueue](self, "forcePushOndemandLocationQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor forceShallowLocationManager](self, "forceShallowLocationManager"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor forceShallowLocationManager](self, "forceShallowLocationManager"));
    objc_msgSend(v5, "stopUpdatingLocation");

    -[FMDSecureLocationMonitor setForceShallowLocationManager:](self, "setForceShallowLocationManager:", 0);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor forcePushOndemandLocationQueue](self, "forcePushOndemandLocationQueue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor _createLocationManagerWithQueue:](self, "_createLocationManagerWithQueue:", v6));
  -[FMDSecureLocationMonitor setForceShallowLocationManager:](self, "setForceShallowLocationManager:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor forceShallowLocationManager](self, "forceShallowLocationManager"));
  objc_msgSend(v8, "setDelegate:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor forceShallowLocationManager](self, "forceShallowLocationManager"));
  objc_msgSend(v9, "setDesiredAccuracy:", kCLLocationAccuracyThreeKilometers);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor forceShallowLocationManager](self, "forceShallowLocationManager"));
  objc_msgSend(v10, "requestLocation");

}

- (void)publishOneTimeShallowLocation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  CLLocationFMGeoLocatableAdapter *v8;
  void *v9;
  CLLocationFMGeoLocatableAdapter *v10;
  FMDSecureLocationInfo *v11;
  void *v12;
  void *v13;
  FMDSecureLocationInfo *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor forcePushOndemandLocationQueue](self, "forcePushOndemandLocationQueue"));
  dispatch_assert_queue_V2(v5);

  if (-[FMDSecureLocationMonitor forcePushOndemandlocation](self, "forcePushOndemandlocation"))
  {
    v6 = sub_10005318C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SecureLocationMonitor: Sending force location to searchpartyd to publish %@", (uint8_t *)&v17, 0xCu);
    }

    v8 = [CLLocationFMGeoLocatableAdapter alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v10 = -[CLLocationFMGeoLocatableAdapter initWithLocation:timeStamp:](v8, "initWithLocation:timeStamp:", v4, v9);

    v11 = [FMDSecureLocationInfo alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor motionMonitor](self, "motionMonitor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastKnownDeviceMotion"));
    v14 = -[FMDSecureLocationInfo initWithLocation:motion:publishReason:](v11, "initWithLocation:motion:publishReason:", v10, v13, 6);

    -[FMDSecureLocationMonitor _publishLocation:](self, "_publishLocation:", v14);
    -[FMDSecureLocationMonitor setForcePushOndemandlocation:](self, "setForcePushOndemandlocation:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor forceShallowLocationManager](self, "forceShallowLocationManager"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationMonitor forceShallowLocationManager](self, "forceShallowLocationManager"));
      objc_msgSend(v16, "stopUpdatingLocation");

      -[FMDSecureLocationMonitor setForceShallowLocationManager:](self, "setForceShallowLocationManager:", 0);
    }

  }
}

- (SPSecureLocationsManager)secureLocationsManager
{
  return self->_secureLocationsManager;
}

- (void)setSecureLocationsManager:(id)a3
{
  objc_storeStrong((id *)&self->_secureLocationsManager, a3);
}

- (CLLocationManager)visitsLocationManager
{
  return self->_visitsLocationManager;
}

- (void)setVisitsLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_visitsLocationManager, a3);
}

- (CLLocationManager)slcLocationManager
{
  return self->_slcLocationManager;
}

- (void)setSlcLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_slcLocationManager, a3);
}

- (CLLocationManager)bystanderLocationManager
{
  return self->_bystanderLocationManager;
}

- (void)setBystanderLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_bystanderLocationManager, a3);
}

- (CLLocationManager)heartbeatLocationManager
{
  return self->_heartbeatLocationManager;
}

- (void)setHeartbeatLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_heartbeatLocationManager, a3);
}

- (CLLocationManager)ondemandLocationManager
{
  return self->_ondemandLocationManager;
}

- (void)setOndemandLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_ondemandLocationManager, a3);
}

- (CLLocationManager)stewieLocationManager
{
  return self->_stewieLocationManager;
}

- (void)setStewieLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_stewieLocationManager, a3);
}

- (CLLocationManager)liveLocationManager
{
  return self->_liveLocationManager;
}

- (void)setLiveLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_liveLocationManager, a3);
}

- (CLLocationManager)shallowLocationManager
{
  return self->_shallowLocationManager;
}

- (void)setShallowLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_shallowLocationManager, a3);
}

- (CLLocationManager)forceShallowLocationManager
{
  return self->_forceShallowLocationManager;
}

- (void)setForceShallowLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_forceShallowLocationManager, a3);
}

- (FMDMotionMonitor)motionMonitor
{
  return self->_motionMonitor;
}

- (void)setMotionMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_motionMonitor, a3);
}

- (FMDSecureLocationPublisher)locationPublisher
{
  return self->_locationPublisher;
}

- (void)setLocationPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_locationPublisher, a3);
}

- (FMDSecureLocationConfigManager)configManager
{
  return self->_configManager;
}

- (void)setConfigManager:(id)a3
{
  objc_storeStrong((id *)&self->_configManager, a3);
}

- (NSDate)lastPublishedTime
{
  return self->_lastPublishedTime;
}

- (void)setLastPublishedTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastPublishedTime, a3);
}

- (NSDate)lastOnDemandPublishTime
{
  return self->_lastOnDemandPublishTime;
}

- (void)setLastOnDemandPublishTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastOnDemandPublishTime, a3);
}

- (NSDate)lastShallowPublishTime
{
  return self->_lastShallowPublishTime;
}

- (void)setLastShallowPublishTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastShallowPublishTime, a3);
}

- (BOOL)locationManagerStarted
{
  return self->_locationManagerStarted;
}

- (void)setLocationManagerStarted:(BOOL)a3
{
  self->_locationManagerStarted = a3;
}

- (OS_dispatch_queue)locationPublishQueue
{
  return self->_locationPublishQueue;
}

- (void)setLocationPublishQueue:(id)a3
{
  objc_storeStrong((id *)&self->_locationPublishQueue, a3);
}

- (OS_dispatch_queue)forcePushOndemandLocationQueue
{
  return self->_forcePushOndemandLocationQueue;
}

- (void)setForcePushOndemandLocationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_forcePushOndemandLocationQueue, a3);
}

- (BOOL)forcePushOndemandlocation
{
  return self->_forcePushOndemandlocation;
}

- (void)setForcePushOndemandlocation:(BOOL)a3
{
  self->_forcePushOndemandlocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forcePushOndemandLocationQueue, 0);
  objc_storeStrong((id *)&self->_locationPublishQueue, 0);
  objc_storeStrong((id *)&self->_lastShallowPublishTime, 0);
  objc_storeStrong((id *)&self->_lastOnDemandPublishTime, 0);
  objc_storeStrong((id *)&self->_lastPublishedTime, 0);
  objc_storeStrong((id *)&self->_configManager, 0);
  objc_storeStrong((id *)&self->_locationPublisher, 0);
  objc_storeStrong((id *)&self->_motionMonitor, 0);
  objc_storeStrong((id *)&self->_forceShallowLocationManager, 0);
  objc_storeStrong((id *)&self->_shallowLocationManager, 0);
  objc_storeStrong((id *)&self->_liveLocationManager, 0);
  objc_storeStrong((id *)&self->_stewieLocationManager, 0);
  objc_storeStrong((id *)&self->_ondemandLocationManager, 0);
  objc_storeStrong((id *)&self->_heartbeatLocationManager, 0);
  objc_storeStrong((id *)&self->_bystanderLocationManager, 0);
  objc_storeStrong((id *)&self->_slcLocationManager, 0);
  objc_storeStrong((id *)&self->_visitsLocationManager, 0);
  objc_storeStrong((id *)&self->_secureLocationsManager, 0);
}

@end
