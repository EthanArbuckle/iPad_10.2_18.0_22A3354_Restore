@implementation VIOSessionDailyUsageMonitor

- (VIOSessionDailyUsageMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  VIOSessionDailyUsageMonitor *v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  VIOSessionDailyUsageEntry *v9;
  uint64_t v10;
  VIOSessionDailyUsageEntry *currentEntry;
  id v12;
  NSObject *v13;
  VIOSessionDailyUsageEntry *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  objc_super v24;
  uint8_t buf[4];
  VIOSessionDailyUsageMonitor *v26;
  __int16 v27;
  VIOSessionDailyUsageEntry *v28;

  v24.receiver = self;
  v24.super_class = (Class)VIOSessionDailyUsageMonitor;
  v4 = -[VIOSessionMonitor initWithStateManager:platformController:](&v24, "initWithStateManager:platformController:", a3, a4);
  if (v4)
  {
    v5 = sub_1008760A8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class(v4);
      v8 = NSStringFromClass(v7);
      v9 = (VIOSessionDailyUsageEntry *)objc_claimAutoreleasedReturnValue(v8);
      *(_DWORD *)buf = 134349314;
      v26 = v4;
      v27 = 2112;
      v28 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Enabling %@", buf, 0x16u);

    }
    v10 = objc_claimAutoreleasedReturnValue(+[VIOSessionDailyUsageEntry loadOrCreateEntry](VIOSessionDailyUsageEntry, "loadOrCreateEntry"));
    currentEntry = v4->_currentEntry;
    v4->_currentEntry = (VIOSessionDailyUsageEntry *)v10;

    v12 = sub_1008760A8();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = v4->_currentEntry;
      *(_DWORD *)buf = 134349314;
      v26 = v4;
      v27 = 2112;
      v28 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] Loaded current entry: %@", buf, 0x16u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "addObserver:selector:name:object:", v4, "calendarDayChangedNotification:", NSCalendarDayChangedNotification, 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](v4, "session"));
    objc_msgSend(v16, "_addObserver:", v4);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](v4, "session"));
    v18 = objc_msgSend(v17, "state");

    if (v18 == (id)1)
    {
      -[VIOSessionDailyUsageMonitor startUsageLimitTimer](v4, "startUsageLimitTimer");
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageMonitor currentEntry](v4, "currentEntry"));
      objc_msgSend(v19, "timeRemaining");
      v21 = v20;

      if (v21 == 0.0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor stateManager](v4, "stateManager"));
        objc_msgSend(v22, "recordSessionDisableEvent:", 2);

      }
    }
  }
  return v4;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  VIOSessionDailyUsageMonitor *v12;
  __int16 v13;
  void *v14;

  v3 = sub_1008760A8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 134349314;
    v12 = self;
    v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Disabling %@", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](self, "session"));
  objc_msgSend(v8, "_removeObserver:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "removeObserver:", self);

  -[VIOSessionDailyUsageMonitor stopUsageLimitTimer](self, "stopUsageLimitTimer");
  v10.receiver = self;
  v10.super_class = (Class)VIOSessionDailyUsageMonitor;
  -[VIOSessionDailyUsageMonitor dealloc](&v10, "dealloc");
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageMonitor currentEntry](self, "currentEntry"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p currentEntry: %@>"), v5, self, v6));

  return (NSString *)v7;
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL(MapsConfig_OpticalHeadingSessionThrottlerEnableDailyUsageMonitor, off_1014B35E8);
}

- (BOOL)shouldDisableVIOSession
{
  const char *label;
  const char *v4;
  BOOL v5;
  void *v6;
  double v7;
  BOOL v8;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  char *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v10 = sub_1004318FC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v15 = 136316418;
        v16 = "-[VIOSessionDailyUsageMonitor shouldDisableVIOSession]";
        v17 = 2080;
        v18 = "VIOSessionDailyUsageMonitor.m";
        v19 = 1024;
        v20 = 88;
        v21 = 2080;
        v22 = "dispatch_get_main_queue()";
        v23 = 2080;
        v24 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v25 = 2080;
        v26 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v15,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v12 = sub_1004318FC();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v15 = 138412290;
          v16 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);

        }
      }
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageMonitor currentEntry](self, "currentEntry"));
  objc_msgSend(v6, "timeRemaining");
  v8 = v7 == 0.0;

  return v8;
}

- (void)startUsageLimitTimer
{
  const char *label;
  const char *v4;
  BOOL v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _BYTE location[12];
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v23 = sub_1004318FC();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136316418;
        *(_QWORD *)&location[4] = "-[VIOSessionDailyUsageMonitor startUsageLimitTimer]";
        v31 = 2080;
        v32 = "VIOSessionDailyUsageMonitor.m";
        v33 = 1024;
        v34 = 97;
        v35 = 2080;
        v36 = "dispatch_get_main_queue()";
        v37 = 2080;
        v38 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v39 = 2080;
        v40 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          location,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v25 = sub_1004318FC();
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)location = 138412290;
          *(_QWORD *)&location[4] = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);

        }
      }
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](self, "session"));
  v7 = objc_msgSend(v6, "isVIORunning");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageMonitor currentEntry](self, "currentEntry"));
  objc_msgSend(v8, "setIsRunningVIO:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageMonitor currentEntry](self, "currentEntry"));
  objc_msgSend(v9, "timeRemaining");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageMonitor currentEntry](self, "currentEntry"));
  objc_msgSend(v12, "timeMultiplier");
  v14 = v13;

  v15 = v11 / v14;
  if (v15 <= 0.0)
  {
    v20 = sub_1008760A8();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)location = 134349056;
      *(_QWORD *)&location[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}p] Daily usage limit reached; disabling VIO session for the rest of the day",
        location,
        0xCu);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor stateManager](self, "stateManager"));
    objc_msgSend(v22, "recordSessionDisableEvent:", 2);

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageMonitor currentEntry](self, "currentEntry"));
    objc_msgSend(v17, "setLastStartDate:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageMonitor currentEntry](self, "currentEntry"));
    objc_msgSend(v18, "save");

    objc_initWeak((id *)location, self);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100876854;
    v28[3] = &unk_1011AE190;
    objc_copyWeak(&v29, (id *)location);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v28, v15));
    -[VIOSessionDailyUsageMonitor setUsageLimitTimer:](self, "setUsageLimitTimer:", v19);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)location);
  }
}

- (void)stopUsageLimitTimer
{
  const char *label;
  const char *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  char *v34;
  int v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v30 = sub_1004318FC();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v35 = 136316418;
        v36 = "-[VIOSessionDailyUsageMonitor stopUsageLimitTimer]";
        v37 = 2080;
        v38 = "VIOSessionDailyUsageMonitor.m";
        v39 = 1024;
        v40 = 125;
        v41 = 2080;
        v42 = "dispatch_get_main_queue()";
        v43 = 2080;
        v44 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v45 = 2080;
        v46 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v35,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v32 = sub_1004318FC();
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v35 = 138412290;
          v36 = v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v35, 0xCu);

        }
      }
    }
  }
  -[VIOSessionDailyUsageMonitor setUsageLimitTimer:](self, "setUsageLimitTimer:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageMonitor currentEntry](self, "currentEntry"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastStartDate"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageMonitor currentEntry](self, "currentEntry"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageMonitor currentEntry](self, "currentEntry"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastStartDate"));
    objc_msgSend(v9, "timeIntervalSinceDate:", v11);
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageMonitor currentEntry](self, "currentEntry"));
    objc_msgSend(v14, "timeMultiplier");
    v16 = v15;
    objc_msgSend(v8, "currentUsage");
    objc_msgSend(v8, "setCurrentUsage:", v17 + v13 * v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageMonitor currentEntry](self, "currentEntry"));
    objc_msgSend(v18, "currentUsage");
    v19 = 0.0;
    if (v20 > 0.0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageMonitor currentEntry](self, "currentEntry"));
      objc_msgSend(v21, "currentUsage");
      v19 = v22;

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageMonitor currentEntry](self, "currentEntry"));
    objc_msgSend(v23, "dailyUsageLimit");
    if (v19 >= v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageMonitor currentEntry](self, "currentEntry"));
      objc_msgSend(v25, "dailyUsageLimit");
      v19 = v26;

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageMonitor currentEntry](self, "currentEntry"));
    objc_msgSend(v27, "setCurrentUsage:", v19);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageMonitor currentEntry](self, "currentEntry"));
    objc_msgSend(v28, "setLastStartDate:", 0);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageMonitor currentEntry](self, "currentEntry"));
    objc_msgSend(v29, "save");

  }
}

- (void)calendarDayChangedNotification:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD block[4];
  id v14;
  _BYTE location[12];
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;

  v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label == v6 || (label ? (v7 = v6 == 0) : (v7 = 1), !v7 && !strcmp(label, v6)))
  {
    v8 = sub_1004318FC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136316162;
      *(_QWORD *)&location[4] = "-[VIOSessionDailyUsageMonitor calendarDayChangedNotification:]";
      v16 = 2080;
      v17 = "VIOSessionDailyUsageMonitor.m";
      v18 = 1024;
      v19 = 141;
      v20 = 2080;
      v21 = "dispatch_get_main_queue()";
      v22 = 2080;
      v23 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion not on queue failed: %s/%s", location, 0x30u);

    }
    if (sub_100A70734())
    {
      v10 = sub_1004318FC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)location = 138412290;
        *(_QWORD *)&location[4] = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);

      }
    }
  }
  objc_initWeak((id *)location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100876F44;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v14, (id *)location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)location);

}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  _QWORD block[4];
  id v6[2];
  id location;

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100877130;
  block[3] = &unk_1011B72B0;
  v6[1] = (id)a4;
  objc_copyWeak(v6, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (VIOSessionDailyUsageEntry)currentEntry
{
  return self->_currentEntry;
}

- (void)setCurrentEntry:(id)a3
{
  objc_storeStrong((id *)&self->_currentEntry, a3);
}

- (GCDTimer)usageLimitTimer
{
  return self->_usageLimitTimer;
}

- (void)setUsageLimitTimer:(id)a3
{
  objc_storeStrong((id *)&self->_usageLimitTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageLimitTimer, 0);
  objc_storeStrong((id *)&self->_currentEntry, 0);
}

@end
