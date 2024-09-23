@implementation FenceScheduler

- (FenceScheduler)initWithDelegate:(id)a3
{
  id v4;
  FenceScheduler *v5;
  FenceScheduler *v6;

  v4 = a3;
  v5 = -[FenceScheduler init](self, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    -[FenceScheduler _registerForSignificantTimeChangeNotifications](v6, "_registerForSignificantTimeChangeNotifications");
  }

  return v6;
}

- (void)setSchedules:(id)a3
{
  id WeakRetained;

  objc_storeStrong((id *)&self->_schedules, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "fenceSchedulerCurrentSchedulesDidChange:", self);

  -[FenceScheduler _updateScheduleTimer](self, "_updateScheduleTimer");
}

- (NSArray)currentSchedules
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FenceScheduler schedules](self, "schedules"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fm_filter:", &stru_1000564F8));

  return (NSArray *)v3;
}

+ (const)timerIdentifier
{
  id v2;
  const char *v3;

  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[FindMyLocateSession scheduleTimerIdentifier](_TtC11fmflocatord19FindMyLocateSession, "scheduleTimerIdentifier")));
  v3 = (const char *)objc_msgSend(v2, "cStringUsingEncoding:", 4);

  return v3;
}

+ (const)alarmStream
{
  id v2;
  const char *v3;

  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[FindMyLocateSession scheduleAlarmStream](_TtC11fmflocatord19FindMyLocateSession, "scheduleAlarmStream")));
  v3 = (const char *)objc_msgSend(v2, "cStringUsingEncoding:", 4);

  return v3;
}

- (void)notifyDelegateThatCurrentSchedulesDidChange
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[FenceScheduler delegate](self, "delegate"));
  objc_msgSend(v3, "fenceSchedulerCurrentSchedulesDidChange:", self);

}

- (void)_updateScheduleTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  xpc_object_t v7;
  double v8;
  double v9;
  time_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  FenceScheduler *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;

  v3 = (void *)objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FenceScheduler schedules](self, "schedules"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_nextStartOrEndDateFrom:forSchedules:", v4, v5));

  if (v6)
  {
    xpc_set_event(+[FenceScheduler alarmStream](FenceScheduler, "alarmStream"), +[FenceScheduler timerIdentifier](FenceScheduler, "timerIdentifier"), 0);
    v7 = xpc_dictionary_create(0, 0, 0);
    objc_msgSend(v6, "timeIntervalSinceNow");
    v9 = v8;
    v10 = time(0);
    xpc_dictionary_set_date(v7, "Date", (uint64_t)((ceil(v9) + (double)v10) * 1000000000.0));
    xpc_dictionary_set_BOOL(v7, "UserVisible", 1);
    xpc_set_event(+[FenceScheduler alarmStream](FenceScheduler, "alarmStream"), +[FenceScheduler timerIdentifier](FenceScheduler, "timerIdentifier"), v7);

  }
  v11 = sub_10001C6A8();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FenceScheduler schedules](self, "schedules"));
    v14 = 136315906;
    v15 = "-[FenceScheduler _updateScheduleTimer]";
    v16 = 2112;
    v17 = self;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: %@ fireDate: %@ schedules: %@", (uint8_t *)&v14, 0x2Au);

  }
}

+ (id)_nextStartOrEndDateFrom:(id)a3 forSchedules:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002AAA4;
  v12[3] = &unk_100056530;
  v13 = a3;
  v6 = v13;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "fm_map:", v12));
  v9 = objc_msgSend((id)objc_opt_class(a1, v8), "firstDateFromDates:order:", v7, -1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (void)_registerForSignificantTimeChangeNotifications
{
  id v3;
  _QWORD block[5];

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_significantTimeChange:", CFSTR("FMFLocatorSchedulerSignificantTimeChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_significantTimeChange:", NSSystemClockDidChangeNotification, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_significantTimeChange:", NSSystemTimeZoneDidChangeNotification, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002ABA0;
  block[3] = &unk_100055230;
  block[4] = self;
  if (qword_1000697D8 != -1)
    dispatch_once(&qword_1000697D8, block);

}

- (void)_significantTimeChange:(id)a3
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_updateScheduleTimer", 0);
  -[FenceScheduler performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_updateScheduleTimer", 0, 0.2);
}

+ (id)firstDateFromDates:(id)a3 order:(int64_t)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (!v8 || objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "compare:", v8) == (id)a4)
        {
          v12 = v11;

          v8 = v12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (FenceSchedulerDelegate)delegate
{
  return (FenceSchedulerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSArray)schedules
{
  return self->_schedules;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedules, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
