@implementation CSCoreAnalyticsUtils

+ (double)getSecondsSinceReboot
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  NSObject *v6;
  mach_timebase_info info;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  double v14;

  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_10034DFA8);
  v2 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "getSecondsSinceReboot", buf, 2u);
  }
  v3 = mach_continuous_time();
  mach_timebase_info(&info);
  v4 = info.numer / info.denom;
  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_10034DFA8);
  v5 = v3 * v4 / 0x3B9ACA00;
  v6 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    v10 = v3;
    v11 = 2048;
    v12 = v4;
    v13 = 2048;
    v14 = (double)v5 / 60.0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "UserInfo machTime - currentTicks:%llu, ticksToNanoseconds:%llu, minutesSinceReboot:%f", buf, 0x20u);
  }
  return (double)v5;
}

+ (BOOL)shouldAttemptCoreAnalyticsUploadWithInterval:(double)a3 persistentKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  _BOOL4 v12;
  _BOOL4 v13;
  NSObject *v14;
  char v15;
  uint8_t v17[16];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v5));
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v10, "timeIntervalSinceDate:", v9);
    v12 = a3 > 0.0;
    if (v11 <= 0.0)
      v12 = 0;
    v13 = v11 < a3 * 0.9 && v12;
    if (v13)
    {
      if (qword_1003873C0 != -1)
        dispatch_once(&qword_1003873C0, &stru_10034DFA8);
      v14 = qword_1003873C8;
      if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "CoreAnalytics upload ran recently, skipping now.", v17, 2u);
      }
    }
    v15 = !v13;

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

@end
