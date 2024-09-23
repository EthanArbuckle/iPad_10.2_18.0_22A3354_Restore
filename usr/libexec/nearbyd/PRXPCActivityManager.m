@implementation PRXPCActivityManager

- (PRXPCActivityManager)init
{
  -[PRXPCActivityManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (PRXPCActivityManager)initWithQueue:(id)a3
{
  id v5;
  PRXPCActivityManager *v6;
  PRXPCActivityManager *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *activities;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  NSObject *v17;
  const char *v18;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PRXPCActivityManager;
  v6 = -[PRXPCActivityManager init](&v20, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    activities = v7->_activities;
    v7->_activities = v8;

    -[PRXPCActivityManager setupActivityInterval](v7, "setupActivityInterval");
    -[PRXPCActivityManager registerForActivityWithIdentifier:](v7, "registerForActivityWithIdentifier:", CFSTR("com.apple.Proximity.LogPowerStatistics"));
    v10 = sub_100004784();
    v7->_enableDeepSleepHeartbeat = sub_1003956D8((uint64_t)v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("AllowRoseDeepSleep")));
    v13 = v12 == 0;

    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v15 = objc_msgSend(v14, "BOOLForKey:", CFSTR("AllowRoseDeepSleep"));
      if (v7->_enableDeepSleepHeartbeat)
        v16 = v15;
      else
        v16 = 0;
      v7->_enableDeepSleepHeartbeat = v16;

    }
    v17 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      if (v7->_enableDeepSleepHeartbeat)
        v18 = "Y";
      else
        v18 = "N";
      *(_DWORD *)buf = 136315138;
      v22 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "DSLP heartbeat enabled: %s", buf, 0xCu);
    }
  }

  return v7;
}

- (void)setupActivityInterval
{
  int64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = XPC_ACTIVITY_INTERVAL_15_MIN;
  self->_xpcActivityInterval = XPC_ACTIVITY_INTERVAL_30_MIN;
  self->_xpcActivityGracePeriod = XPC_ACTIVITY_INTERVAL_15_MIN;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("UWBDSLPHeartbeatInterval")));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringForKey:", CFSTR("UWBDSLPHeartbeatInterval")));
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("1minute")))
    {
      v3 = XPC_ACTIVITY_INTERVAL_1_MIN;
      self->_xpcActivityInterval = XPC_ACTIVITY_INTERVAL_1_MIN;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("5minutes")))
    {
      self->_xpcActivityInterval = XPC_ACTIVITY_INTERVAL_5_MIN;
      v3 = XPC_ACTIVITY_INTERVAL_1_MIN;
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("30minutes")))
      {
LABEL_9:

        goto LABEL_10;
      }
      self->_xpcActivityInterval = XPC_ACTIVITY_INTERVAL_30_MIN;
    }
    self->_xpcActivityGracePeriod = v3;
    goto LABEL_9;
  }
LABEL_10:

}

- (void)registerForActivityWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  xpc_object_t v6;
  int v7;
  id v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Proximity.LogPowerStatistics")))
  {
    v5 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "registering for activity: %@", (uint8_t *)&v7, 0xCu);
    }
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REPEATING, 1);
    xpc_dictionary_set_string(v6, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_int64(v6, XPC_ACTIVITY_INTERVAL, self->_xpcActivityInterval);
    xpc_dictionary_set_int64(v6, XPC_ACTIVITY_GRACE_PERIOD, self->_xpcActivityGracePeriod);
    -[PRXPCActivityManager checkInForActivityWithCriteria:identifier:](self, "checkInForActivityWithCriteria:identifier:", v6, v4);

  }
}

- (void)checkInForActivityWithCriteria:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  id v9;
  id v10;
  _QWORD handler[4];
  id v12;
  PRXPCActivityManager *v13;
  id v14;

  v6 = a3;
  v7 = objc_retainAutorelease(a4);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001C334;
  handler[3] = &unk_1007FA540;
  v9 = v6;
  v12 = v9;
  v13 = self;
  v10 = v7;
  v14 = v10;
  xpc_activity_register(v8, XPC_ACTIVITY_CHECK_IN, handler);

}

- (void)runActivityWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _OWORD v30[2];
  _OWORD v31[2];
  uint8_t buf[16];
  __int128 v33;
  _BYTE v34[28];
  char v35;

  v4 = a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "running activity with identifier: %@", buf, 0xCu);
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Proximity.LogPowerStatistics")))
  {
    if (!-[PRXPCActivityManager proceedWithPowerStatsQuery](self, "proceedWithPowerStatsQuery"))
    {
      v6 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003CA3DC(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    v14 = sub_1002CA108();
    sub_1002CCF28((uint64_t)v14, 1000, (uint64_t)buf);
    -[PRXPCActivityManager cleanupPowerState](self, "cleanupPowerState");
    if (v35)
    {
      CFAbsoluteTimeGetCurrent();
      if (!v35)
        sub_10000BA44();
      v30[0] = *(_OWORD *)buf;
      v30[1] = v33;
      v31[0] = *(_OWORD *)v34;
      *(_OWORD *)((char *)v31 + 12) = *(_OWORD *)&v34[12];
      sub_10019EDD8((unsigned int *)v30);
    }
    else
    {
      v22 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003CA3AC(v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }
  else
  {
    v15 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003CA40C((uint64_t)v4, v15, v16, v17, v18, v19, v20, v21);
  }

}

- (BOOL)proceedWithPowerStatsQuery
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v15[16];

  if (self->_enableDeepSleepHeartbeat
    && (self->_deepSleepHeartbeatPowerRequested = 0, v3 = sub_1002CA108(), sub_1002CCFC0((uint64_t)v3)))
  {
    v4 = sub_1002CA108();
    v5 = sub_1002CCF38((uint64_t)v4, 1);
    v6 = qword_10085F520;
    if ((_DWORD)v5)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#heartbeat waking UWB chip", v15, 2u);
      }
      self->_deepSleepHeartbeatPowerRequested = 1;
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    {
      sub_1003CA474(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    -[PRXPCActivityManager sendAnalyticsHeartbeatWasSuccessful:](self, "sendAnalyticsHeartbeatWasSuccessful:", v5);
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)cleanupPowerState
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (self->_enableDeepSleepHeartbeat)
  {
    v3 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#heartbeat enter DSLP after heartbeat", v5, 2u);
    }
    if (self->_deepSleepHeartbeatPowerRequested)
    {
      v4 = sub_1002CA108();
      sub_1002CCF38((uint64_t)v4, 0);
    }
  }
}

- (void)sendAnalyticsHeartbeatWasSuccessful:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _UNKNOWN **v9;
  _UNKNOWN **v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = v5;
  if (self->_enableDeepSleepHeartbeat)
    v7 = &__kCFBooleanTrue;
  else
    v7 = &__kCFBooleanFalse;
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("HeartbeatIsEnabled"));
  if (v3)
    v8 = &__kCFBooleanTrue;
  else
    v8 = &__kCFBooleanFalse;
  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("HeartbeatStatus"));
  if (v3)
    v9 = &off_10082BE18;
  else
    v9 = &off_10082BE30;
  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("HeartbeatFailure"));
  if (v3)
    v10 = &off_10082BE30;
  else
    v10 = &off_10082BE18;
  objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("HeartbeatSuccess"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001C92C;
  v12[3] = &unk_1007FA568;
  v11 = objc_msgSend(v6, "mutableCopy");
  v13 = v11;
  AnalyticsSendEventLazy(CFSTR("com.apple.nearbyd.uwb.deepsleep.heartbeat"), v12);
  sub_10019F0C0(v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
