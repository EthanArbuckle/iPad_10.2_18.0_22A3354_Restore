@implementation MSDSystemMonitor

+ (id)sharedInstance
{
  if (qword_1001754E8 != -1)
    dispatch_once(&qword_1001754E8, &stru_10013F448);
  return (id)qword_1001754E0;
}

- (unint64_t)systemIdleDuration
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor coreDuetContext](self, "coreDuetContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](_CDContextQueries, "keyPathForInUseStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor coreDuetContext](self, "coreDuetContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForLastUseDate](_CDContextQueries, "keyPathForLastUseDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v10, "timeIntervalSinceDate:", v9);
    v12 = v11;

    v13 = 0.0;
    if (v12 > 0.0)
      v13 = v12;
    v6 = (unint64_t)v13;

  }
  return v6;
}

- (void)registerObserver:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___MSDSystemMonitorObserver) & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSDSystemMonitor.m"), 123, CFSTR("Observer does not conform to protocol"));

  }
  -[MSDSystemMonitor setObserver:](self, "setObserver:", v6);

}

- (void)unregisterObserver
{
  -[MSDSystemMonitor setObserver:](self, "setObserver:", 0);
}

- (void)startSystemIdleDetection
{
  -[MSDSystemMonitor setCoreDuetTriggeredPause:](self, "setCoreDuetTriggeredPause:", 0);
  -[MSDSystemMonitor setDiskSpaceTriggeredPause:](self, "setDiskSpaceTriggeredPause:", 0);
  -[MSDSystemMonitor startPowerForegroundAppMonitoring](self, "startPowerForegroundAppMonitoring");
  -[MSDSystemMonitor startDiskSpaceMonitoring](self, "startDiskSpaceMonitoring");
}

- (void)stopSystemIdleDetection
{
  void *v3;
  void *v4;

  -[MSDSystemMonitor setCoreDuetTriggeredPause:](self, "setCoreDuetTriggeredPause:", 0);
  -[MSDSystemMonitor setDiskSpaceTriggeredPause:](self, "setDiskSpaceTriggeredPause:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor coreDuetContext](self, "coreDuetContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor applicationRegistration](self, "applicationRegistration"));
  objc_msgSend(v3, "deregisterCallback:", v4);

  -[MSDSystemMonitor stopDiskSpaceMonitoring](self, "stopDiskSpaceMonitoring");
}

- (_CDClientContext)coreDuetContext
{
  return (_CDClientContext *)+[_CDClientContext userContext](_CDClientContext, "userContext");
}

- (void)startDiskSpaceMonitoring
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100080460;
  v2[3] = &unk_10013D840;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)stopDiskSpaceMonitoring
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000805C0;
  v2[3] = &unk_10013D840;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)processDiskSpaceMonitorCallback
{
  void *v2;
  id v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  MSDSystemMonitor *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v3 = objc_msgSend(v2, "getFreeSpace");

  if ((unint64_t)v3 + 0xFFFFF > 0x1FFFFE)
  {
    -[MSDSystemMonitor setDiskSpaceTriggeredPause:](obj, "setDiskSpaceTriggeredPause:", 0);
    v4 = 0;
  }
  else
  {
    -[MSDSystemMonitor setDiskSpaceTriggeredPause:](obj, "setDiskSpaceTriggeredPause:", 1);
    v4 = CFSTR("diskSpaceTriggeredPause");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor observer](obj, "observer"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor observer](obj, "observer"));
    v7 = -[MSDSystemMonitor coreDuetTriggeredPause](obj, "coreDuetTriggeredPause")
      || -[MSDSystemMonitor diskSpaceTriggeredPause](obj, "diskSpaceTriggeredPause");
    objc_msgSend(v6, "didReceiveNewPauseStatus:forReason:", v7, v4);

  }
  objc_sync_exit(obj);

}

- (void)startPowerForegroundAppMonitoring
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id location;
  _QWORD v16[4];

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](_CDContextQueries, "keyPathForInUseStatus"));
  v16[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForForegroundApp](_CDContextQueries, "keyPathForForegroundApp"));
  v16[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryLevel](_CDContextQueries, "keyPathForBatteryLevel"));
  v16[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryStateDataDictionary](_CDContextQueries, "keyPathForBatteryStateDataDictionary"));
  v16[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPaths:](_CDContextualPredicate, "predicateForChangeAtKeyPaths:", v7));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100080970;
  v13[3] = &unk_10013F470;
  objc_copyWeak(&v14, &location);
  v9 = objc_retainBlock(v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:contextualPredicate:callback:](_CDContextualChangeRegistration, "localWakingRegistrationWithIdentifier:contextualPredicate:callback:", CFSTR("com.apple.mobilestoredemo"), v8, v9));
  -[MSDSystemMonitor setApplicationRegistration:](self, "setApplicationRegistration:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor coreDuetContext](self, "coreDuetContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor applicationRegistration](self, "applicationRegistration"));
  objc_msgSend(v11, "registerCallback:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)processCoreDuetCallBack
{
  MSDSystemMonitor *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  const __CFString *v19;
  void *v20;
  unsigned int v21;
  int v22;
  void *v23;
  void *v24;
  unsigned int v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor coreDuetContext](v2, "coreDuetContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForForegroundApp](_CDContextQueries, "keyPathForForegroundApp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor coreDuetContext](v2, "coreDuetContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](_CDContextQueries, "keyPathForInUseStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));
  v9 = objc_msgSend(v8, "BOOLValue");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor coreDuetContext](v2, "coreDuetContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryLevel](_CDContextQueries, "keyPathForBatteryLevel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor coreDuetContext](v2, "coreDuetContext"));
  v15 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryStateDataDictionary](_CDContextQueries, "keyPathForBatteryStateDataDictionary"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  LOBYTE(v15) = objc_msgSend(v17, "tvOS");

  if ((v15 & 1) != 0)
  {
LABEL_2:
    v18 = 0;
    v19 = 0;
    if (!v9)
      goto LABEL_13;
    goto LABEL_6;
  }
  v19 = CFSTR("batteryLevelTriggeredPause");
  if ((unint64_t)v13 >= 0x15)
  {
    if ((unint64_t)v13 <= 0x31)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryExternalConnectedKey](_CDContextQueries, "batteryExternalConnectedKey"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", v23));
      v25 = objc_msgSend(v24, "BOOLValue");

      if (v25)
        v19 = 0;
      v18 = v25 ^ 1;
      if (!v9)
        goto LABEL_13;
      goto LABEL_6;
    }
    goto LABEL_2;
  }
  v18 = 1;
  if (!v9)
  {
LABEL_13:
    v22 = 0;
    goto LABEL_14;
  }
LABEL_6:
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor foregroundAllowedApps](v2, "foregroundAllowedApps"));
  v21 = objc_msgSend(v20, "containsObject:", v5);

  v22 = v21 ^ 1;
  if (!v21)
    v19 = CFSTR("systemInUseTriggeredPause");
LABEL_14:
  v26 = sub_1000604F0();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    sub_1000C5848((uint64_t)v5, v9, v27);

  -[MSDSystemMonitor setCoreDuetTriggeredPause:](v2, "setCoreDuetTriggeredPause:", v18 | v22);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor observer](v2, "observer"));

  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor observer](v2, "observer"));
    v30 = -[MSDSystemMonitor coreDuetTriggeredPause](v2, "coreDuetTriggeredPause")
       || -[MSDSystemMonitor diskSpaceTriggeredPause](v2, "diskSpaceTriggeredPause");
    objc_msgSend(v29, "didReceiveNewPauseStatus:forReason:", v30, v19);

  }
  objc_sync_exit(v2);

}

- (_CDContextualChangeRegistration)applicationRegistration
{
  return self->_applicationRegistration;
}

- (void)setApplicationRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_applicationRegistration, a3);
}

- (NSTimer)diskSpaceMonitoringTimer
{
  return self->_diskSpaceMonitoringTimer;
}

- (void)setDiskSpaceMonitoringTimer:(id)a3
{
  objc_storeStrong((id *)&self->_diskSpaceMonitoringTimer, a3);
}

- (NSSet)foregroundAllowedApps
{
  return self->_foregroundAllowedApps;
}

- (void)setForegroundAllowedApps:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundAllowedApps, a3);
}

- (MSDSystemMonitorObserver)observer
{
  return (MSDSystemMonitorObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (BOOL)coreDuetTriggeredPause
{
  return self->_coreDuetTriggeredPause;
}

- (void)setCoreDuetTriggeredPause:(BOOL)a3
{
  self->_coreDuetTriggeredPause = a3;
}

- (BOOL)diskSpaceTriggeredPause
{
  return self->_diskSpaceTriggeredPause;
}

- (void)setDiskSpaceTriggeredPause:(BOOL)a3
{
  self->_diskSpaceTriggeredPause = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_foregroundAllowedApps, 0);
  objc_storeStrong((id *)&self->_diskSpaceMonitoringTimer, 0);
  objc_storeStrong((id *)&self->_applicationRegistration, 0);
}

@end
