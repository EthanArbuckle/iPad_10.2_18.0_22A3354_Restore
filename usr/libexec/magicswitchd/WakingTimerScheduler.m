@implementation WakingTimerScheduler

- (WakingTimerScheduler)init
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  dispatch_source_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint32_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint32_t v19;
  NSObject *v20;
  io_connect_t v21;
  IONotificationPort *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void **v27;
  uint64_t v28;
  id (*v29)(uint64_t);
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  int out_token;
  _QWORD handler[4];
  id v36;
  objc_super v37;
  uint8_t buf[4];
  uint32_t v39;

  v37.receiver = self;
  v37.super_class = (Class)WakingTimerScheduler;
  v2 = -[WakingTimerScheduler init](&v37, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    v4 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "workQueue"));
    v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v6);
    v8 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v7;

    v9 = *((_QWORD *)v2 + 5);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100009884;
    handler[3] = &unk_100018538;
    v10 = v2;
    v36 = v10;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 5), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_activate(*((dispatch_object_t *)v2 + 5));
    out_token = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "workQueue"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000098F4;
    v32[3] = &unk_100018650;
    v13 = v10;
    v33 = v13;
    v14 = notify_register_dispatch("com.apple.system.timezone", &out_token, v12, v32);

    if (v14)
    {
      v15 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v39 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Failed to register observer for the time zone change notification with status: (%u)", buf, 8u);
      }
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "workQueue"));
    v27 = _NSConcreteStackBlock;
    v28 = 3221225472;
    v29 = sub_100009964;
    v30 = &unk_100018650;
    v18 = v13;
    v31 = v18;
    v19 = notify_register_dispatch("com.apple.system.clock_set", &out_token, v17, &v27);

    if (v19)
    {
      v20 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v39 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Failed to register observer for the system clock change notification with status: (%u)", buf, 8u);
      }
    }
    v21 = IORegisterForSystemPower(v18, (IONotificationPortRef *)v18 + 7, (IOServiceInterestCallback)j__objc_msgSend_systemPowerChanged_notificationID_, (io_object_t *)v18 + 4);
    *((_DWORD *)v18 + 3) = v21;
    if (v21)
    {
      v22 = (IONotificationPort *)*((_QWORD *)v18 + 7);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance", v27, v28, v29, v30));
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "workQueue"));
      IONotificationPortSetDispatchQueue(v22, v24);

    }
    else
    {
      v25 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Failed to register for Power events!", buf, 2u);
      }
    }

  }
  return (WakingTimerScheduler *)v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009A4C;
  block[3] = &unk_100018670;
  block[4] = a1;
  if (qword_100021A38 != -1)
    dispatch_once(&qword_100021A38, block);
  return (id)qword_100021A30;
}

- (void)scheduleTimer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;

  v4 = a3;
  if (-[NSHashTable containsObject:](self->_timers, "containsObject:", v4))
  {
    v5 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Timer already scheduled", (uint8_t *)&v15, 2u);
    }
  }
  v6 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v15 = 134218242;
    v16 = v4;
    v17 = 2112;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Scheduling timer (%p) with identifier: (%@)", (uint8_t *)&v15, 0x16u);

  }
  -[NSHashTable addObject:](self->_timers, "addObject:", v4);
  v10 = objc_msgSend((id)objc_opt_class(self, v9), "now");
  objc_msgSend(v4, "setStartTime:", v10);
  v11 = (double)(unint64_t)objc_msgSend(v4, "startTime");
  objc_msgSend(v4, "delay");
  objc_msgSend(v4, "setEarliestFireTime:", (unint64_t)(v11 + v12 * 1000000000.0));
  v13 = (double)(unint64_t)objc_msgSend(v4, "earliestFireTime");
  objc_msgSend(v4, "gracePeriod");
  objc_msgSend(v4, "setDeadline:", (unint64_t)(v13 + v14 * 1000000000.0));
  -[WakingTimerScheduler evaluateTimers:](self, "evaluateTimers:", v10);

}

- (void)cancelTimer:(id)a3
{
  WakingTimer *v4;
  NSObject *v5;
  int v6;
  WakingTimer *v7;

  v4 = (WakingTimer *)a3;
  v5 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Cancelling timer (%p)", (uint8_t *)&v6, 0xCu);
  }
  -[NSHashTable removeObject:](self->_timers, "removeObject:", v4);
  if (self->_timerWithEarliestDeadline == v4)
    self->_timerWithEarliestDeadline = 0;
  -[WakingTimerScheduler evaluateTimers](self, "evaluateTimers");

}

+ (unint64_t)now
{
  return clock_gettime_nsec_np(_CLOCK_MONOTONIC);
}

- (void)handleTimeEvent
{
  self->_timerWithEarliestDeadline = 0;
  -[WakingTimerScheduler evaluateTimers](self, "evaluateTimers");
}

- (void)evaluateTimers
{
  uint64_t v3;
  id v4;

  if (-[NSHashTable count](self->_timers, "count"))
    v4 = objc_msgSend((id)objc_opt_class(self, v3), "now");
  else
    v4 = 0;
  -[WakingTimerScheduler evaluateTimers:](self, "evaluateTimers:", v4);
}

- (void)evaluateTimers:(unint64_t)a3
{
  void *v5;
  id v6;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  void *i;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  NSHashTable *v15;
  id v16;
  id v17;
  WakingTimer *v18;
  uint64_t v19;
  void *j;
  void *v21;
  id v22;
  WakingTimer *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint8_t buf[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD block[4];
  NSMutableArray *v33;
  int v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_timers, "allObjects"));
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        if ((unint64_t)objc_msgSend(v11, "earliestFireTime") < a3)
        {
          if (!v8)
            v8 = objc_opt_new(NSMutableArray);
          -[NSMutableArray addObject:](v8, "addObject:", v11);
          -[NSHashTable removeObject:](self->_timers, "removeObject:", v11);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  if (-[NSMutableArray count](v8, "count"))
  {
    v12 = sub_10000BBE0((uint64_t)"com.apple.MagicSwitch.WakingTimerScheduler.Fire");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "workQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A0E4;
    block[3] = &unk_100018698;
    v33 = v8;
    v34 = v12;
    dispatch_async(v14, block);

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v15 = self->_timers;
  v16 = -[NSHashTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
  if (!v16)
  {

LABEL_31:
    -[WakingTimerScheduler clearDispatchTimer](self, "clearDispatchTimer");
    -[WakingTimerScheduler cancelScheduledWake](self, "cancelScheduledWake");
    v18 = 0;
    goto LABEL_32;
  }
  v17 = v16;
  v26 = v5;
  v18 = 0;
  v19 = *(_QWORD *)v29;
  do
  {
    for (j = 0; j != v17; j = (char *)j + 1)
    {
      if (*(_QWORD *)v29 != v19)
        objc_enumerationMutation(v15);
      v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
      if (v18)
      {
        v22 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j), "deadline");
        if (v22 < (id)-[WakingTimer deadline](v18, "deadline"))
        {
          v23 = v21;

          v18 = v23;
        }
      }
      else
      {
        v18 = v21;
      }
    }
    v17 = -[NSHashTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
  }
  while (v17);

  v5 = v26;
  if (!v18)
    goto LABEL_31;
  if (v18 != self->_timerWithEarliestDeadline)
    -[WakingTimerScheduler scheduleTimerWithEarliestDeadline:now:](self, "scheduleTimerWithEarliestDeadline:now:", v18, a3);
LABEL_32:
  if (-[NSHashTable count](self->_timers, "count"))
  {
    if (!self->_requestedWakeDate)
    {
      v24 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "No wake scheduled despite there being a timer", buf, 2u);
      }
    }
    if (!self->_dispatchTimerScheduled)
    {
      v25 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Dispatch timer not running despite there being a timer", buf, 2u);
      }
    }
  }

}

- (void)scheduleTimerWithEarliestDeadline:(id)a3 now:(unint64_t)a4
{
  WakingTimer *v6;
  char *v7;
  double v8;
  uint64_t v9;
  NSObject *v10;
  dispatch_time_t v11;
  int v12;
  WakingTimer *v13;
  __int16 v14;
  double v15;
  __int16 v16;
  double v17;

  v6 = (WakingTimer *)a3;
  v7 = (char *)-[WakingTimer earliestFireTime](v6, "earliestFireTime") - a4;
  -[WakingTimer gracePeriod](v6, "gracePeriod");
  v9 = (unint64_t)(v8 * 1000000000.0);
  v10 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134218496;
    v13 = v6;
    v14 = 2048;
    v15 = (double)(unint64_t)v7 / 1000000000.0;
    v16 = 2048;
    v17 = (double)v9 / 1000000000.0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Scheduling wake for timer (%p) in (%.3f) sec with (%.3f) sec leeway", (uint8_t *)&v12, 0x20u);
  }
  v11 = dispatch_walltime(0, (int64_t)v7);
  dispatch_source_set_timer((dispatch_source_t)self->_dispatchTimer, v11, 0xFFFFFFFFFFFFFFFFLL, v9);
  self->_dispatchTimerScheduled = 1;
  -[WakingTimer gracePeriod](v6, "gracePeriod");
  -[WakingTimerScheduler scheduleWakeWithDelayBeforeFireTime:gracePeriod:](self, "scheduleWakeWithDelayBeforeFireTime:gracePeriod:", v7);
  self->_timerWithEarliestDeadline = v6;

}

- (void)clearDispatchTimer
{
  if (self->_dispatchTimerScheduled)
  {
    dispatch_source_set_timer((dispatch_source_t)self->_dispatchTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    self->_dispatchTimerScheduled = 0;
  }
}

- (void)scheduleWakeWithDelayBeforeFireTime:(unint64_t)a3 gracePeriod:(double)a4
{
  NSDate **p_requestedWakeDate;
  void *v7;
  void *v8;
  NSObject *v9;
  double v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  int v16;
  void *v17;
  __int16 v18;
  double v19;
  __int16 v20;
  int v21;
  _QWORD v22[3];
  _QWORD v23[3];

  p_requestedWakeDate = &self->_requestedWakeDate;
  if (self->_requestedWakeDate)
    -[WakingTimerScheduler cancelScheduledWake](self, "cancelScheduledWake");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(a3 / 0x3B9ACA00)));
  v8 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEBUG))
  {
    v9 = v8;
    objc_msgSend(v7, "timeIntervalSinceNow");
    v16 = 134218240;
    v17 = v7;
    v18 = 2048;
    v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "WakingTimerScheduler --- Scheduling wake for date (%p) in (%.3f) seconds", (uint8_t *)&v16, 0x16u);

  }
  v23[0] = v7;
  v22[0] = CFSTR("time");
  v22[1] = CFSTR("leeway");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  v22[2] = CFSTR("scheduledby");
  v23[1] = v11;
  v23[2] = CFSTR("com.apple.MagicSwitch.WakingTimerScheduler.IOPM");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 3));

  v13 = IOPMRequestSysWake(v12);
  if (v13)
  {
    v14 = v13;
    v15 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412802;
      v17 = v7;
      v18 = 2048;
      v19 = a4;
      v20 = 1024;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Failed to schedule wake at date (%@) with grace period (%f) with error: (%d)", (uint8_t *)&v16, 0x1Cu);
    }
  }
  else
  {
    objc_storeStrong((id *)p_requestedWakeDate, v7);
  }

}

+ (void)cancelScheduledWake:(id)a3
{
  const __CFDate *v3;
  NSObject *v4;
  IOReturn v5;
  IOReturn v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  int v12;
  const __CFDate *v13;
  __int16 v14;
  IOReturn v15;

  v3 = (const __CFDate *)a3;
  v4 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134217984;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "WakingTimerScheduler --- Cancelling wake for date: (%p)", (uint8_t *)&v12, 0xCu);
  }
  v5 = IOPMCancelScheduledPowerEvent(v3, CFSTR("com.apple.MagicSwitch.WakingTimerScheduler.IOPM"), CFSTR("wake"));
  if (v5)
  {
    v6 = v5;
    if (v5 == -536870160)
    {
      v7 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v3;
        v8 = "WakingTimerScheduler --- Failed to cancel wake for date (%@) with error: kIOReturnNotFound";
        v9 = v7;
        v10 = 12;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
      }
    }
    else
    {
      v11 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412546;
        v13 = v3;
        v14 = 1024;
        v15 = v6;
        v8 = "WakingTimerScheduler --- Failed to cancel wake for date (%@) with error: (%d)";
        v9 = v11;
        v10 = 18;
        goto LABEL_9;
      }
    }
  }

}

- (void)cancelScheduledWake
{
  NSDate *requestedWakeDate;

  if (self->_requestedWakeDate)
  {
    objc_msgSend((id)objc_opt_class(self, a2), "cancelScheduledWake:", self->_requestedWakeDate);
    requestedWakeDate = self->_requestedWakeDate;
    self->_requestedWakeDate = 0;

  }
}

- (void)systemPowerChanged:(unsigned int)a3 notificationID:(void *)a4
{
  IOReturn v7;
  IOReturn v8;
  NSObject *v9;
  _DWORD v10[2];
  __int16 v11;
  IOReturn v12;

  if (a3 == -536870288
    || (a3 == -536870144 || a3 == -536870272)
    && (-[WakingTimerScheduler evaluateTimers](self, "evaluateTimers"), a3 == -536870272))
  {
    v7 = IOAllowPowerChange(self->_systemPowerConnection, (intptr_t)a4);
    if (v7)
    {
      v8 = v7;
      v9 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109376;
        v10[1] = a3;
        v11 = 1024;
        v12 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Failed allow Power change (%u) with error: (%d)", (uint8_t *)v10, 0xEu);
      }
    }
  }
}

- (NSHashTable)timers
{
  return self->_timers;
}

- (void)setTimers:(id)a3
{
  objc_storeStrong((id *)&self->_timers, a3);
}

- (WakingTimer)timerWithEarliestDeadline
{
  return self->_timerWithEarliestDeadline;
}

- (void)setTimerWithEarliestDeadline:(id)a3
{
  self->_timerWithEarliestDeadline = (WakingTimer *)a3;
}

- (OS_dispatch_source)dispatchTimer
{
  return self->_dispatchTimer;
}

- (void)setDispatchTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchTimer, a3);
}

- (BOOL)dispatchTimerScheduled
{
  return self->_dispatchTimerScheduled;
}

- (void)setDispatchTimerScheduled:(BOOL)a3
{
  self->_dispatchTimerScheduled = a3;
}

- (NSDate)requestedWakeDate
{
  return self->_requestedWakeDate;
}

- (void)setRequestedWakeDate:(id)a3
{
  objc_storeStrong((id *)&self->_requestedWakeDate, a3);
}

- (unsigned)systemPowerConnection
{
  return self->_systemPowerConnection;
}

- (void)setSystemPowerConnection:(unsigned int)a3
{
  self->_systemPowerConnection = a3;
}

- (unsigned)systemPowerNotifier
{
  return self->_systemPowerNotifier;
}

- (void)setSystemPowerNotifier:(unsigned int)a3
{
  self->_systemPowerNotifier = a3;
}

- (IONotificationPort)systemPowerPort
{
  return self->_systemPowerPort;
}

- (void)setSystemPowerPort:(IONotificationPort *)a3
{
  self->_systemPowerPort = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedWakeDate, 0);
  objc_storeStrong((id *)&self->_dispatchTimer, 0);
  objc_storeStrong((id *)&self->_timers, 0);
}

@end
