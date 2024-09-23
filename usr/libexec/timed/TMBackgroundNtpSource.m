@implementation TMBackgroundNtpSource

- (void)setFetchingTime:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 fetchingTime;
  NSObject *v6;
  OS_os_transaction *v7;

  v3 = a3;
  fetchingTime = self->_fetchingTime;
  if (fetchingTime == a3)
  {
    v6 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
      sub_10001C1A0(fetchingTime, v3, v6);
  }
  else
  {

    if (v3)
      v7 = (OS_os_transaction *)os_transaction_create("TMBackgroundNtpSource fetchingTime");
    else
      v7 = 0;
    self->_fetchingTransaction = v7;
  }
  self->_fetchingTime = v3;
}

- (void)fetchTime
{
  -[TMBackgroundNtpSource setLastFetchAttempt:](self, "setLastFetchAttempt:", 0.0);
  -[TMBackgroundNtpSource setBurstRetryCount:](self, "setBurstRetryCount:", -[TMPreferences NTPBurstRetryAttempts](self->_preferences, "NTPBurstRetryAttempts"));
  -[TMBackgroundNtpSource setWantedTime:](self, "setWantedTime:", -INFINITY);
}

- (TMBackgroundNtpSource)init
{
  TMBackgroundNtpSource *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TMBackgroundNtpSource;
  v2 = -[TMBackgroundNtpSource init](&v4, "init");
  if (v2)
    v2->_ntpQueue = (OS_dispatch_queue *)dispatch_queue_create("NTP Queue", 0);
  return v2;
}

- (void)dealloc
{
  __SCNetworkReachability *reachabilityTarget;
  objc_super v4;

  -[TMBackgroundNtpSource setAddress:](self, "setAddress:", 0);

  reachabilityTarget = self->_reachabilityTarget;
  if (reachabilityTarget)
    CFRelease(reachabilityTarget);

  self->_clock = 0;
  self->_preferences = 0;
  -[TMBackgroundNtpSource setReachabilityTransaction:](self, "setReachabilityTransaction:", 0);
  dispatch_release((dispatch_object_t)self->_ntpQueue);
  self->_ntpQueue = 0;
  v4.receiver = self;
  v4.super_class = (Class)TMBackgroundNtpSource;
  -[TMBackgroundNtpSource dealloc](&v4, "dealloc");
}

- (void)setWantedTime:(double)a3
{
  double Current;
  double v6;
  NSObject *v7;
  NSObject *ntpQueue;
  NSObject *v9;
  double v10;
  NSObject *v11;
  _BOOL4 v12;
  xpc_object_t v13;
  _QWORD v14[5];
  _QWORD block[5];
  uint8_t buf[4];
  double v17;
  __int16 v18;
  double v19;

  Current = CFAbsoluteTimeGetCurrent();
  v6 = sub_100015B78(self);
  v7 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v17 = (a3 - Current) / 60.0;
    v18 = 2048;
    v19 = v6 / 60.0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Want active time in %.2fmin. Remaining retry interval: %fmin.", buf, 0x16u);
  }
  if (Current >= a3 && v6 == 0.0)
  {
    ntpQueue = self->_ntpQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100015BF0;
    block[3] = &unk_100028DB0;
    block[4] = self;
    dispatch_async(ntpQueue, block);
  }
  else
  {
    if (Current + v6 > a3)
      a3 = Current + v6;
    v9 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unscheduling wanted job", buf, 2u);
    }
    xpc_activity_unregister("com.apple.timed.ntp.wanted");
    v10 = a3 - Current;
    v11 = qword_100033718;
    v12 = os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT);
    if (v10 >= 9.22337204e18)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Dropping job with infinite start time", buf, 2u);
      }
    }
    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Scheduling wanted job", buf, 2u);
      }
      v13 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_BOOL(v13, XPC_ACTIVITY_REPEATING, 0);
      xpc_dictionary_set_string(v13, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
      xpc_dictionary_set_int64(v13, XPC_ACTIVITY_DELAY, (uint64_t)v10);
      xpc_dictionary_set_int64(v13, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_MIN);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100015BF8;
      v14[3] = &unk_100028D88;
      v14[4] = self;
      xpc_activity_register("com.apple.timed.ntp.wanted", v13, v14);
      xpc_release(v13);
    }
  }
}

- (double)lastFetchAttempt
{
  return self->lastFetchAttempt;
}

- (void)setLastFetchAttempt:(double)a3
{
  self->lastFetchAttempt = a3;
}

- (double)schedulingInterval
{
  return self->schedulingInterval;
}

- (void)setSchedulingInterval:(double)a3
{
  self->schedulingInterval = a3;
}

- (int64_t)burstRetryCount
{
  return self->burstRetryCount;
}

- (void)setBurstRetryCount:(int64_t)a3
{
  self->burstRetryCount = a3;
}

- (TMPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (TMDaemonCore)daemonCore
{
  return self->_daemonCore;
}

- (void)setDaemonCore:(id)a3
{
  self->_daemonCore = (TMDaemonCore *)a3;
}

- (TMMonotonicClock)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (int64_t)servicePortRetryCount
{
  return self->_servicePortRetryCount;
}

- (void)setServicePortRetryCount:(int64_t)a3
{
  self->_servicePortRetryCount = a3;
}

- (OS_os_transaction)reachabilityTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 96, 1);
}

- (void)setReachabilityTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)isFetchingTime
{
  return self->_fetchingTime;
}

- (NSString)address
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAddress:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

@end
