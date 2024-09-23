@implementation Tasking

- (Tasking)initWithWorkDir:(id)a3
{
  id v5;
  Tasking *v6;
  Tasking *v7;
  NSDictionary *myTaskingDict;
  Tasking *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)Tasking;
  v6 = -[Tasking init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workDir, a3);
    myTaskingDict = v7->_myTaskingDict;
    v7->_myTaskingDict = 0;

    v9 = v7;
  }

  return v7;
}

+ (void)startDpTaskingMonitorOnDispatchQ:(id)a3 andWorkDir:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F988;
  block[3] = &unk_10008CA58;
  v9 = a3;
  v10 = a4;
  v5 = qword_1000C48D0;
  v6 = v10;
  v7 = v9;
  if (v5 != -1)
    dispatch_once(&qword_1000C48D0, block);

}

- (void)tryLoadDPTasking
{
  id v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  const char *v16;
  int v17;
  const char *v18;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking workDir](self, "workDir"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("dp_tasking_payload.plist")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (objc_msgSend(v7, "fileExistsAtPath:", v5))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v6, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("expire_time")));
    if (v9
      && (v2 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now")),
          v10 = objc_msgSend(v9, "compare:", v2),
          v2,
          v10 == (id)1))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking myTaskingDict](self, "myTaskingDict"));

      if (!v11)
      {
        v12 = oslog;
        if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17) = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Loading tasking payload from DP", (uint8_t *)&v17, 2u);
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("payload")));
        -[Tasking setMyTaskingDict:](self, "setMyTaskingDict:", v13);

      }
    }
    else
    {
      v14 = (id)oslog;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        if (v9)
        {
          v15 = DateTimeToStr(v9);
          v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v15));
          v16 = (const char *)objc_msgSend(v2, "UTF8String");
        }
        else
        {
          v16 = "N/A";
        }
        v17 = 136315138;
        v18 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Deleting expired payload with expire date %s", (uint8_t *)&v17, 0xCu);
        if (v9)

      }
      objc_msgSend(v7, "removeItemAtPath:error:", v5, 0);
    }
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }

}

- (BOOL)LoadTasking
{
  id v2;
  void *v4;
  NSObject *v5;
  unsigned int v6;
  const char *v7;
  void *v8;
  int v10;
  const char *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking LoadFromPlist:forKey:](self, "LoadFromPlist:forKey:", CFSTR("com.apple.da"), CFSTR("ASPCarryLog_tasking")));
  if (v4)
    -[Tasking LoadTaskingFromDict:](self, "LoadTaskingFromDict:", v4);
  -[Tasking tryLoadDPTasking](self, "tryLoadDPTasking");
  v5 = (id)oslog;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[Tasking isDeviceTasked](self, "isDeviceTasked");
    if (v6)
    {
      v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[Tasking getTaskingID](self, "getTaskingID")));
      v7 = (const char *)objc_msgSend(v2, "UTF8String");
    }
    else
    {
      v7 = "None";
    }
    v10 = 136315138;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DA tasking info loaded. Tasking id: %s", (uint8_t *)&v10, 0xCu);
    if (v6)

  }
  v8 = (void *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEBUG))
    sub_1000425C8(v8, self);

  return 1;
}

- (id)LoadFromPlist:(id)a3 forKey:(id)a4
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = (void *)CFPreferencesCopyValue((CFStringRef)a4, (CFStringRef)a3, CFSTR("mobile"), kCFPreferencesCurrentHost);
  v5 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;

  return v6;
}

- (BOOL)isDeviceTasked
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking getTaskingID](self, "getTaskingID"));
  v3 = v2 != 0;

  return v3;
}

- (id)getTaskingID
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking myTaskingDict](self, "myTaskingDict"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForKey:", CFSTR("TASKING_ID")));

  if (!v4
    || (objc_msgSend(v4, "isEqualToString:", &stru_10008DD38) & 1) != 0
    || -[Tasking getTaskingDurationInSeconds](self, "getTaskingDurationInSeconds") < 0)
  {
    v5 = 0;
  }
  else
  {
    v5 = v4;
  }

  return v5;
}

- (int64_t)getTaskingDurationInSeconds
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking myTaskingDict](self, "myTaskingDict"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("TASKING_DURATION_SECONDS")));
  v4 = objc_msgSend(v3, "longLongValue");

  return (int64_t)v4;
}

- (int64_t)getTaskingSizeLimitInBytes
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking myTaskingDict](self, "myTaskingDict"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("TASKING_SIZE_LIMIT_BYTES")));
  v4 = objc_msgSend(v3, "longLongValue");

  return (int64_t)v4;
}

- (id)getTaskingCriteria
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking myTaskingDict](self, "myTaskingDict"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("TASKING_CRITERIA")));

  v4 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v9 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    v10 = v5;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  }
  else
  {
    v7 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v3, v7) & 1) != 0)
      v6 = v3;
    else
      v6 = 0;
  }

  return v6;
}

- (BOOL)validate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking myTaskingDict](self, "myTaskingDict"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TASKING_CRITERIA_VERSION")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking myTaskingDict](self, "myTaskingDict"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TASKING_SIZE_LIMIT_BYTES")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking myTaskingDict](self, "myTaskingDict"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TASKING_ID")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking getTaskingCriteria](self, "getTaskingCriteria"));
  v10 = objc_opt_class(NSNumber);
  v11 = (objc_opt_isKindOfClass(v4, v10) & 1) != 0 && (int)objc_msgSend(v4, "intValue") < 3;
  v12 = objc_opt_class(NSNumber);
  v13 = (objc_opt_isKindOfClass(v6, v12) & 1) != 0 && (uint64_t)objc_msgSend(v6, "longLongValue") > 0;
  if (v8)
    v14 = v9 == 0;
  else
    v14 = 1;
  v15 = !v14 && v11;
  v16 = v15 && v13;

  return v16;
}

- (BOOL)evaluateTaskingCriteria:(id)a3 doWhiteListCheck:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  unsigned __int8 v9;

  v4 = a4;
  v6 = a3;
  if (-[Tasking validate](self, "validate"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[Tasking getTaskingCriteria](self, "getTaskingCriteria"));
    v8 = -[TaskingCriteriaRange initFromTaskingCrit:]([TaskingCriteriaRange alloc], "initFromTaskingCrit:", v7);
    v9 = objc_msgSend(v8, "evaluateCriteriaUsingStatsProvider:doWhiteListCheck:", v6, v4);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (StatsProvider)myStatsProvider
{
  return self->_myStatsProvider;
}

- (void)setMyStatsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_myStatsProvider, a3);
}

- (NSDictionary)myTaskingDict
{
  return self->_myTaskingDict;
}

- (void)setMyTaskingDict:(id)a3
{
  objc_storeStrong((id *)&self->_myTaskingDict, a3);
}

- (NSDate)dpTaskingExpireTime
{
  return self->_dpTaskingExpireTime;
}

- (void)setDpTaskingExpireTime:(id)a3
{
  objc_storeStrong((id *)&self->_dpTaskingExpireTime, a3);
}

- (NSString)workDir
{
  return self->_workDir;
}

- (void)setWorkDir:(id)a3
{
  objc_storeStrong((id *)&self->_workDir, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workDir, 0);
  objc_storeStrong((id *)&self->_dpTaskingExpireTime, 0);
  objc_storeStrong((id *)&self->_myTaskingDict, 0);
  objc_storeStrong((id *)&self->_myStatsProvider, 0);
}

@end
