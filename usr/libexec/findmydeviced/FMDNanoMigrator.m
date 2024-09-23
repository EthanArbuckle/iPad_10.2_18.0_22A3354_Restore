@implementation FMDNanoMigrator

- (FMDNanoMigrator)initWithCompanionRegistry:(id)a3 unregisterTokenStore:(id)a4 serverInteractionController:(id)a5
{
  id v8;
  id v9;
  id v10;
  FMDNanoMigrator *v11;
  FMDNanoMigrator *v12;
  void *v13;
  unsigned int v14;
  id v15;
  double v16;
  FMDXPCJanitor *v17;
  FMDXPCJanitor *v18;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id location;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)FMDNanoMigrator;
  v11 = -[FMDNanoMigrator init](&v26, "init");
  v12 = v11;
  if (v11)
  {
    -[FMDNanoMigrator setRegistry:](v11, "setRegistry:", v8);
    -[FMDNanoMigrator setUnregisterTokenStore:](v12, "setUnregisterTokenStore:", v9);
    -[FMDNanoMigrator setServerInteractionController:](v12, "setServerInteractionController:", v10);
    -[FMDNanoMigrator addObservers](v12, "addObservers");
    objc_initWeak(&location, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
    v14 = objc_msgSend(v13, "isInternalBuild");

    if (v14)
    {
      v15 = +[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", CFSTR("NanoMigratorRetryInterval"), kFMDNotBackedUpPrefDomain);
      if ((uint64_t)v15 <= 0)
        v16 = 10800.0;
      else
        v16 = (double)(uint64_t)v15;
    }
    else
    {
      v16 = 10800.0;
    }
    v17 = [FMDXPCJanitor alloc];
    v20 = _NSConcreteStackBlock;
    v21 = 3221225472;
    v22 = sub_100051644;
    v23 = &unk_1002C1378;
    objc_copyWeak(&v24, &location);
    v18 = -[FMDXPCJanitor initWithName:gracePeriod:cleanupTask:](v17, "initWithName:gracePeriod:cleanupTask:", CFSTR("FMDNanoMigratorJanitor"), &v20, v16);
    -[FMDNanoMigrator setJanitor:](v12, "setJanitor:", v18, v20, v21, v22, v23);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)unregisterAccessoriesIfNeeded
{
  void *v3;
  unsigned int v4;
  id v5;
  double v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[6];
  uint8_t buf[4];
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v4 = objc_msgSend(v3, "isInternalBuild");

  if (v4)
  {
    v5 = +[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", CFSTR("NanoMigratorRetryInterval"), kFMDNotBackedUpPrefDomain);
    if ((uint64_t)v5 <= 0)
      v6 = 3600.0;
    else
      v6 = (double)(uint64_t)v5;
  }
  else
  {
    v6 = 3600.0;
  }
  -[FMDNanoMigrator scheduleJanitor:](self, "scheduleJanitor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoMigrator unregisterDeviceInfoAdaptors](self, "unregisterDeviceInfoAdaptors"));
  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    v9 = v8;
    v10 = sub_1000031B8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FMDNanoMigrator will attempt to unregister %li", buf, 0xCu);
    }

    v12 = sub_10005342C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Watch Migration: Unregister device count %li", buf, 0xCu);
    }

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100051994;
    v18[3] = &unk_1002C3320;
    v18[4] = self;
    *(double *)&v18[5] = v6;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v18);
  }
  else
  {
    v14 = sub_10005342C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Watch Migration: There were no devices or no tokens to unregister.", buf, 2u);
    }

    v16 = sub_1000031B8();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FMDNanoMigrator there were no devices or no tokens to unregister.", buf, 2u);
    }

  }
}

- (void)addObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "deviceDidPair:", CFSTR("nano.devicedidpair"), 0);

}

- (void)scheduleJanitor:(double)a3
{
  void *v5;
  unsigned int v6;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  int v27;
  id v28;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoMigrator unregisterTokenStore](self, "unregisterTokenStore"));
  v6 = objc_msgSend(v5, "accessoriesNeedUnregister");

  if (a3 <= 0.0 || v6 == 0)
  {
    v8 = sub_1000031B8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMDNanoMigrator deactivating janitor", (uint8_t *)&v27, 2u);
    }

    v10 = sub_10005342C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Watch Migration: deactivating janitor", (uint8_t *)&v27, 2u);
    }

    -[FMDNanoMigrator setJanitorScheduledDate:](self, "setJanitorScheduledDate:", 0);
    v12 = (id)objc_claimAutoreleasedReturnValue(-[FMDNanoMigrator janitor](self, "janitor"));
    objc_msgSend(v12, "deactivate");
  }
  else
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[FMDNanoMigrator lastScheduledJanitorDate](self, "lastScheduledJanitorDate"));
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    v17 = v14 - v16;

    v18 = v12;
    if (v17 < 60.0)
    {
      v19 = sub_1000031B8();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "FMDNanoMigrator The last scheduled time is too short, rescheduling.", (uint8_t *)&v27, 2u);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a3));
    }
    v21 = sub_1000031B8();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138412290;
      v28 = v18;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "FMDNanoMigrator scheduling janitor to run %@", (uint8_t *)&v27, 0xCu);
    }

    v23 = sub_10005342C();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(v18, "fm_epoch");
      v27 = 134217984;
      v28 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Watch Migration: scheduling janitor to run %lli", (uint8_t *)&v27, 0xCu);
    }

    -[FMDNanoMigrator setJanitorScheduledDate:](self, "setJanitorScheduledDate:", v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoMigrator janitor](self, "janitor"));
    objc_msgSend(v26, "schedule:requireClass:", v18, 1);

  }
}

- (id)deviceInfoForHostDevice
{
  FMDFMIPUnregisterDeviceInfo *v2;
  void *v3;
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

  v2 = objc_alloc_init(FMDFMIPUnregisterDeviceInfo);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceUDID"));
  -[FMDFMIPUnregisterDeviceInfo setUdid:](v2, "setUdid:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "internationalMobileEquipmentIdentity"));
  -[FMDFMIPUnregisterDeviceInfo setImei:](v2, "setImei:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mobileEquipmentIdentifier"));
  -[FMDFMIPUnregisterDeviceInfo setMeid:](v2, "setMeid:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serialNumber"));
  -[FMDFMIPUnregisterDeviceInfo setSerialNumber:](v2, "setSerialNumber:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "productType"));
  -[FMDFMIPUnregisterDeviceInfo setProductType:](v2, "setProductType:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "productVersion"));
  -[FMDFMIPUnregisterDeviceInfo setProductVersion:](v2, "setProductVersion:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "buildVersion"));
  -[FMDFMIPUnregisterDeviceInfo setBuildVersion:](v2, "setBuildVersion:", v16);

  -[FMDFMIPUnregisterDeviceInfo setDisableContext:](v2, "setDisableContext:", 7);
  return v2;
}

- (id)unregisterDeviceInfoAdaptors
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoMigrator registry](self, "registry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pairedAccessories"));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000525B0;
  v10[3] = &unk_1002C3348;
  v10[4] = self;
  v6 = v3;
  v11 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  v7 = v11;
  v8 = v6;

  return v8;
}

- (id)lastScheduledJanitorDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContextManager sharedManager](FMDProtectedContextManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contextForKey:contextUUID:error:", CFSTR("FMDNanoMigratorLastScheduledJanitorDateKey"), 0, 0));

  return v3;
}

- (void)setJanitorScheduledDate:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContextManager sharedManager](FMDProtectedContextManager, "sharedManager"));
  v4 = v3;
  if (v6)
    v5 = objc_msgSend(v3, "saveContext:forContextKey:dataProtectionClass:", v6, CFSTR("FMDNanoMigratorLastScheduledJanitorDateKey"), 4);
  else
    objc_msgSend(v3, "cleanupAllContextsForKey:", CFSTR("FMDNanoMigratorLastScheduledJanitorDateKey"));

}

- (FMDCompanionRegistry)registry
{
  return self->_registry;
}

- (void)setRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_registry, a3);
}

- (FMDUnregisterTokenStore)unregisterTokenStore
{
  return self->_unregisterTokenStore;
}

- (void)setUnregisterTokenStore:(id)a3
{
  objc_storeStrong((id *)&self->_unregisterTokenStore, a3);
}

- (FMDServerInteractionController)serverInteractionController
{
  return self->_serverInteractionController;
}

- (void)setServerInteractionController:(id)a3
{
  objc_storeStrong((id *)&self->_serverInteractionController, a3);
}

- (FMDXPCJanitor)janitor
{
  return self->_janitor;
}

- (void)setJanitor:(id)a3
{
  objc_storeStrong((id *)&self->_janitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_janitor, 0);
  objc_storeStrong((id *)&self->_serverInteractionController, 0);
  objc_storeStrong((id *)&self->_unregisterTokenStore, 0);
  objc_storeStrong((id *)&self->_registry, 0);
}

@end
