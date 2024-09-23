@implementation FMFHeartbeatManager

- (void)updateHeartbeat
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  double v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFHeartbeatManager latestXPCActivityRegistrationTime](self, "latestXPCActivityRegistrationTime"));
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  if (v6 >= 600.0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    objc_msgSend(v12, "heartbeatIntervalInSec");
    v14 = v13;

    if (v14 <= 0.0)
    {
      v19 = sub_100011D0C();
      v8 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 134217984;
        v21 = *(_QWORD *)&v14;
        v9 = "Not scheduling heartbeat as server value was: %f";
        v10 = v8;
        v11 = 12;
        goto LABEL_10;
      }
    }
    else
    {
      v8 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v8, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
      xpc_dictionary_set_BOOL(v8, XPC_ACTIVITY_REPEATING, 0);
      xpc_dictionary_set_int64(v8, XPC_ACTIVITY_INTERVAL, (uint64_t)v14);
      xpc_dictionary_set_BOOL(v8, XPC_ACTIVITY_ALLOW_BATTERY, 1);
      xpc_dictionary_set_BOOL(v8, XPC_ACTIVITY_POWER_NAP, 1);
      xpc_dictionary_set_int64(v8, XPC_ACTIVITY_DELAY, (uint64_t)v14);
      xpc_dictionary_set_int64(v8, XPC_ACTIVITY_GRACE_PERIOD, 60);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMFHeartbeatManager _activityBlock](self, "_activityBlock"));
      v16 = sub_100011D0C();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 134218240;
        v21 = *(_QWORD *)&v14;
        v22 = 2048;
        v23 = v6;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Registering heartbeat after: %f(intervalSinceLastXPCActivityRegistration: %f)", (uint8_t *)&v20, 0x16u);
      }

      xpc_activity_register(off_1000B3158, v8, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[FMFHeartbeatManager setLatestXPCActivityRegistrationTime:](self, "setLatestXPCActivityRegistrationTime:", v18);

    }
  }
  else
  {
    v7 = sub_100011D0C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 134218240;
      v21 = 0x4082C00000000000;
      v22 = 2048;
      v23 = v6;
      v9 = "Not re-registering heartbeat, since we have already registered in last %f(intervalSinceLastXPCActivityRegistration: %f) secs";
      v10 = v8;
      v11 = 22;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v20, v11);
    }
  }

}

- (void)setLatestXPCActivityRegistrationTime:(id)a3
{
  objc_storeStrong((id *)&self->_latestXPCActivityRegistrationTime, a3);
}

- (NSDate)latestXPCActivityRegistrationTime
{
  return self->_latestXPCActivityRegistrationTime;
}

- (id)_activityBlock
{
  return &stru_10009A688;
}

+ (id)sharedInstance
{
  if (qword_1000B37F8 != -1)
    dispatch_once(&qword_1000B37F8, &stru_10009A648);
  return (id)qword_1000B37F0;
}

- (void)checkin
{
  void *v2;
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFHeartbeatManager _activityBlock](self, "_activityBlock"));
  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Heartbeat checkin", v5, 2u);
  }

  xpc_activity_register(off_1000B3158, XPC_ACTIVITY_CHECK_IN, v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestXPCActivityRegistrationTime, 0);
}

@end
