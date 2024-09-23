@implementation CDDWatchUpdateController

- (CDDWatchUpdateController)initWithCDDinstance:(id)a3
{
  id v5;
  CDDWatchUpdateController *v6;
  CDDWatchUpdateController *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *watchupdateQueue;
  uint64_t v12;
  OS_os_log *log;
  OS_dispatch_source *timer;
  void *v15;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CDDWatchUpdateController;
  v6 = -[CDDWatchUpdateController init](&v18, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->cdd, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("com.apple.watchUpdates", v9);
    watchupdateQueue = v7->watchupdateQueue;
    v7->watchupdateQueue = (OS_dispatch_queue *)v10;

    v12 = objc_claimAutoreleasedReturnValue(-[CDDWatchUpdateController watchUpdateLog](v7, "watchUpdateLog"));
    log = v7->log;
    v7->log = (OS_os_log *)v12;

    timer = v7->timer;
    v7->timer = 0;

    -[CDDWatchUpdateController loadDefaults](v7, "loadDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "addObserver:selector:name:object:", v7, "timeZoneOrTimeChanged:", NSSystemTimeZoneDidChangeNotification, 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)sub_100005890, CFSTR("SignificantTimeChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    if (!notify_register_dispatch("com.apple.coreduetd.watchischarging", &v7->watchchargetoken, (dispatch_queue_t)v7->watchupdateQueue, &stru_100038A28))
    {
      notify_set_state(v7->watchchargetoken, 0);
      notify_post("com.apple.coreduetd.watchischarging");
    }
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("SignificantTimeChangeNotification"), 0);
  notify_cancel(self->watchchargetoken);
  v5.receiver = self;
  v5.super_class = (Class)CDDWatchUpdateController;
  -[CDDWatchUpdateController dealloc](&v5, "dealloc");
}

- (id)watchUpdateLog
{
  if (qword_100040E48 != -1)
    dispatch_once(&qword_100040E48, &stru_100038A48);
  return (id)qword_100040E40;
}

- (int64_t)hoursBetween:(id)a3 and:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "components:fromDate:toDate:options:", 32, v6, v5, 0));

  v9 = (uint64_t)objc_msgSend(v8, "hour");
  if (v9 >= 0)
    v10 = v9;
  else
    v10 = -v9;

  return v10;
}

- (void)loadDefaults
{
  NSUserDefaults *v3;
  NSUserDefaults *pushLimits;
  NSUserDefaults *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *log;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;

  v3 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.coreduet.complications.pushLimits"));
  pushLimits = self->pushLimits;
  self->pushLimits = v3;

  v5 = self->pushLimits;
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v5, "objectForKey:", CFSTR("lastResetDate")));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryRepresentation](self->pushLimits, "dictionaryRepresentation"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDDWatchUpdateController nextResetTime](self, "nextResetTime"));
      log = self->log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v10 = log;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDDWatchUpdateController formatDate:](self, "formatDate:", v6));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CDDWatchUpdateController formatDate:](self, "formatDate:", v8));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("complicationPushLimits")));
        v19 = 138412802;
        v20 = v11;
        v21 = 2112;
        v22 = v12;
        v23 = 2112;
        v24 = v13;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Last reset time: %@\n Next reset time: %@\n Push limits: %@\n", (uint8_t *)&v19, 0x20u);

      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v15 = -[CDDWatchUpdateController hoursBetween:and:](self, "hoursBetween:and:", v6, v14);

      if (v15 >= 25)
      {
        v16 = self->log;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v19) = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "More than 24 hours since last reset => forcing now.\n", (uint8_t *)&v19, 2u);
        }
        -[CDDWatchUpdateController resetPushLimits](self, "resetPushLimits");
      }
      -[CDDWatchUpdateController setupNextResetTimer:](self, "setupNextResetTimer:", v8);

    }
    else
    {
      v18 = self->log;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Initializing push limit defaults.\n", (uint8_t *)&v19, 2u);
      }
      -[CDDWatchUpdateController resetPushLimits](self, "resetPushLimits");
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDDWatchUpdateController nextResetTime](self, "nextResetTime"));
      -[CDDWatchUpdateController setupNextResetTimer:](self, "setupNextResetTimer:", v7);
    }

  }
  else
  {
    v17 = self->log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10002251C(v17);
  }
}

- (id)nextResetTime
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar calendarWithIdentifier:](NSCalendar, "calendarWithIdentifier:", NSCalendarIdentifierGregorian));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
  objc_msgSend(v3, "setTimeZone:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startOfDayForDate:", v2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 32, 5, v5, 0));
  if (objc_msgSend(v2, "compare:", v6) == (id)-1)
    v7 = v6;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, 1, v6, 0));
  v8 = v7;

  return v8;
}

- (id)formatDate:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-LLL-dd HH:mm:ss ZZZZ"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
  objc_msgSend(v4, "setTimeZone:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromDate:", v3));
  return v6;
}

- (void)timeZoneOrTimeChanged:(id)a3
{
  OS_dispatch_queue *watchupdateQueue;
  _QWORD *v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;
  id v11;

  watchupdateQueue = self->watchupdateQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005F94;
  v8[3] = &unk_100038A70;
  v8[4] = self;
  v4 = v8;
  v5 = watchupdateQueue;
  v6 = (void *)os_transaction_create("cd_dispatch_async_tx");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000067FC;
  block[3] = &unk_100038A98;
  v10 = v6;
  v11 = v4;
  v7 = v6;
  dispatch_async(v5, block);

}

- (void)setupNextResetTimer:(id)a3
{
  id v4;
  double v5;
  NSObject *timer;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  NSObject *log;
  NSObject *v14;
  void *v15;
  _QWORD handler[5];
  timespec when;
  uint8_t buf[4];
  void *v19;

  v4 = a3;
  objc_msgSend(v4, "timeIntervalSince1970");
  when.tv_sec = (uint64_t)v5;
  when.tv_nsec = 0;
  timer = self->timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v7 = self->timer;
    self->timer = 0;

  }
  v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->watchupdateQueue);
  v9 = self->timer;
  self->timer = v8;

  v10 = self->timer;
  v11 = dispatch_walltime(&when, 0);
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
  v12 = self->timer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100006338;
  handler[3] = &unk_100038A70;
  handler[4] = self;
  dispatch_source_set_event_handler(v12, handler);
  dispatch_resume((dispatch_object_t)self->timer);
  log = self->log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v14 = log;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CDDWatchUpdateController formatDate:](self, "formatDate:", v4));
    *(_DWORD *)buf = 138412290;
    v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Next reset time: %@\n", buf, 0xCu);

  }
}

- (void)dailyResetTimer
{
  OS_dispatch_queue *watchupdateQueue;
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;
  id v10;

  watchupdateQueue = self->watchupdateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006410;
  v7[3] = &unk_100038A70;
  v7[4] = self;
  v3 = v7;
  v4 = watchupdateQueue;
  v5 = (void *)os_transaction_create("cd_dispatch_async_tx");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000067FC;
  block[3] = &unk_100038A98;
  v9 = v5;
  v10 = v3;
  v6 = v5;
  dispatch_async(v4, block);

}

- (void)resetPushLimits
{
  NSObject *log;
  NSUserDefaults *pushLimits;
  NSObject *v5;
  void *v6;
  NSUserDefaults *v7;
  void *v8;
  int v9;
  void *v10;

  log = self->log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    pushLimits = self->pushLimits;
    v5 = log;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](pushLimits, "objectForKey:", CFSTR("complicationPushLimits")));
    v9 = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resetting complication push limits, currently: %@\n", (uint8_t *)&v9, 0xCu);

  }
  -[NSUserDefaults removeObjectForKey:](self->pushLimits, "removeObjectForKey:", CFSTR("complicationPushLimits"));
  v7 = self->pushLimits;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[NSUserDefaults setObject:forKey:](v7, "setObject:forKey:", v8, CFSTR("lastResetDate"));

  -[NSUserDefaults synchronize](self->pushLimits, "synchronize");
  notify_post(kComplicationPushLimitsResetNotification);
}

- (void)receiveWatchfaceInfo:(id)a3 device:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  OS_dispatch_queue *watchupdateQueue;
  _QWORD *v9;
  NSObject *v10;
  void *v11;
  id v12;
  int watchchargetoken;
  _QWORD v14[5];
  _QWORD block[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", &off_10003B098));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", &off_10003B0B0));

  if ((uint64_t)objc_msgSend(v6, "integerValue") >= 90 && objc_msgSend(v7, "BOOLValue"))
  {
    watchupdateQueue = self->watchupdateQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100006724;
    v14[3] = &unk_100038A70;
    v14[4] = self;
    v9 = v14;
    v10 = watchupdateQueue;
    v11 = (void *)os_transaction_create("cd_dispatch_async_tx");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000067FC;
    block[3] = &unk_100038A98;
    v16 = v11;
    v17 = v9;
    v12 = v11;
    dispatch_async(v10, block);

  }
  watchchargetoken = self->watchchargetoken;
  if (watchchargetoken)
  {
    notify_set_state(watchchargetoken, objc_msgSend(v7, "BOOLValue"));
    notify_post("com.apple.coreduetd.watchischarging");
  }

}

- (NSArray)activeComplications
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeComplications, 0);
  objc_storeStrong((id *)&self->timer, 0);
  objc_storeStrong((id *)&self->log, 0);
  objc_storeStrong((id *)&self->pushLimits, 0);
  objc_storeStrong((id *)&self->watchupdateQueue, 0);
  objc_storeStrong((id *)&self->cdd, 0);
}

@end
