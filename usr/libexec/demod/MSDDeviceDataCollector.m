@implementation MSDDeviceDataCollector

+ (id)sharedInstance
{
  if (qword_100175348 != -1)
    dispatch_once(&qword_100175348, &stru_10013EB48);
  return (id)qword_100175340;
}

- (id)getCurrentAppUsageSessionUUID
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDeviceDataCollector sessionUUID](self, "sessionUUID"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDeviceDataCollector sessionUUID](self, "sessionUUID"));
  v5 = objc_msgSend(v4, "copy");

  objc_sync_exit(v3);
  return v5;
}

- (void)collectAppUsageBetweenLastSetupDoneAndNow
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];

  v3 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.demo-settings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("SetupDoneTimestamp")));
  if (v4)
  {
    v5 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v5, "setDateFormat:", CFSTR("dd-MM-yyyy_HH:mm:ss:SSS"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateFromString:", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    -[MSDDeviceDataCollector collectAppUsageWithSessionStart:andEnd:](self, "collectAppUsageWithSessionStart:andEnd:", v6, v7);
    sleep(1u);
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("SetupDoneTimestamp"));
    objc_msgSend(v3, "synchronize");

  }
  else
  {
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Skip collecting any app usage data as setup done timestamp is not set.", v10, 2u);
    }

  }
}

- (void)collectAppUsageWithSessionStart:(id)a3 andEnd:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDeviceDataCollector sessionUUID](self, "sessionUUID"));
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDeviceDataCollector sessionUUID](self, "sessionUUID"));
  v9 = objc_msgSend(v8, "copy");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
  -[MSDDeviceDataCollector setSessionUUID:](self, "setSessionUUID:", v11);

  objc_sync_exit(v7);
  -[MSDDeviceDataCollector collectAppUsageDataForSession:fromStart:toEnd:](self, "collectAppUsageDataForSession:fromStart:toEnd:", v9, v12, v6);

}

- (void)collectAppUsageDataForSession:(id)a3 fromStart:(id)a4 toEnd:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  _BYTE *v24;
  uint64_t v25;
  _BYTE buf[24];
  uint64_t v27;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = sub_1000604F0();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "toString"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "toString"));
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Collecting app usage data between %{public}@ and %{public}@", buf, 0x16u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDBiome collectAppUsageDataFrom:to:](MSDBiome, "collectAppUsageDataFrom:to:", v8, v9));
  v15 = v14;
  if (v14)
  {
    if (objc_msgSend(v14, "count"))
    {
      v16 = objc_alloc_init((Class)NSDateFormatter);
      objc_msgSend(v9, "timeIntervalSinceDate:", v8);
      v18 = v17;
      objc_msgSend(v16, "setDateFormat:", CFSTR("dd-MM-yyyy_HH:mm:ss:SSS"));
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v27 = 1;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100057044;
      v21[3] = &unk_10013EB70;
      v19 = v16;
      v22 = v19;
      v24 = buf;
      v25 = (uint64_t)v18;
      v23 = v7;
      objc_msgSend(v15, "enumerateObjectsUsingBlock:", v21);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v20 = sub_1000604F0();
      v19 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Unable to find any app usage info in the Biome database.", buf, 2u);
      }
    }

  }
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end
