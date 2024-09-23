@implementation TMDaemonCore

- (void)executeCommand:(id)a3 withHandler:(id)a4
{
  id v7;
  unsigned __int8 v8;
  char v9;
  NSObject *v10;
  _QWORD v11[7];
  char v12;

  v7 = -[TMMonotonicClock machTime](-[TMDaemonCore clock](self, "clock"), "machTime");
  v8 = sub_10000656C(self, (uint64_t)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMCommand")));
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMRtcTime"))
    || !objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMMachTime")))
  {
    v9 = 0;
  }
  else
  {
    if ((v8 & 1) == 0)
    {
      v10 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
        sub_10001B708(a3, v10);
    }
    v7 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMMachTime")), "unsignedLongLongValue");
    v9 = 1;
    v8 = 1;
  }
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMRtcTime"))
    && objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMMachTime"))
    && (!objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMCommand")), "isEqualToString:", CFSTR("TMSetSourceTime"))|| (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMSource")), "isEqualToString:", CFSTR("NTP")) & 1) == 0)&& os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
  {
    sub_10001B6A8();
    if ((v8 & 1) != 0)
      goto LABEL_14;
  }
  else if ((v8 & 1) != 0)
  {
LABEL_14:
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000D178;
    v11[3] = &unk_100028C30;
    v12 = v9;
    v11[4] = self;
    v11[5] = a3;
    v11[6] = a4;
    -[TMMonotonicClock montonicTimeForMachTime:toQueue:withCompletionHandler:](-[TMDaemonCore clock](self, "clock"), "montonicTimeForMachTime:toQueue:withCompletionHandler:", v7, -[TMDaemonCore workloop](self, "workloop"), v11);
    return;
  }
  sub_100005638((NSDictionary *)self, a3, (uint64_t)a4);
}

- (TMMonotonicClock)clock
{
  return self->_clock;
}

- (void)rtcDidReset
{
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v4[5];

  ++self->_rtcResetCount;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("TMRTCResetNotification"), 0, 0, 0);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000AB2C;
  v4[3] = &unk_100028BA0;
  v4[4] = self;
  AnalyticsSendEventLazy(CFSTR("com.apple.timed.rtcDidReset"), v4);
}

- (void)setAccurateThresholds:(BOOL)a3
{
  -[TMPreferences setAccurateThresholds:](self->_prefs, "setAccurateThresholds:", a3);
}

- (void)handleShutdown
{
  if (!-[TMDaemonCore isSystemTimeSet](self, "isSystemTimeSet"))
    -[TMDaemonCore testAndApplySystemTime](self, "testAndApplySystemTime");
}

- (TMDaemonCore)initWithTimeZoneRules:(id)a3 monotonicClock:(id)a4 preferences:(id)a5 workloop:(id)a6
{
  TMDaemonCore *v11;
  double v12;
  TMCache *v13;
  NSObject *v14;
  NSUUID *v15;
  NSObject *v16;
  NSObject *v17;
  NSUUID *v18;
  unsigned int v19;
  double v20;
  NSData *v21;
  TMTimeSynthesizer *v22;
  TMTimeSynthesizer *STF;
  TMTimeSynthesizer *v24;
  TMTimeSynthesizer *v25;
  double v26;
  double v27;
  double v28;
  TMTimeSynthesizer *timeSynthesizer;
  NSObject *v30;
  TMBackgroundNtpSource *v31;
  objc_super v33;
  uint8_t buf[4];
  NSUUID *v35;
  __int16 v36;
  unsigned int v37;

  v33.receiver = self;
  v33.super_class = (Class)TMDaemonCore;
  v11 = -[TMDaemonCore init](&v33, "init");
  if (v11)
  {
    v11->_prefs = (TMPreferences *)a5;
    v11->_pendingSetupTimeHandlers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v11->_timeProviders = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    -[TMPreferences settimeofdayThreshold](v11->_prefs, "settimeofdayThreshold");
    v11->_settimeofdayThreshold = v12;
    v11->_workloop = (OS_dispatch_workloop *)a6;
    -[TMDaemonCore setClock:](v11, "setClock:", a4);
    v13 = -[TMCache initWithPath:clock:]([TMCache alloc], "initWithPath:clock:", CFSTR("/var/db/timed/com.apple.timed.plist"), -[TMDaemonCore clock](v11, "clock"));
    v11->cache = v13;
    if (-[TMCache isValid](v13, "isValid"))
    {
      v14 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Loading data from cache.", buf, 2u);
      }
      v15 = 0;
    }
    else
    {
      if (-[TMCache systemTimeSet](v11->cache, "systemTimeSet"))
      {
        v15 = -[TMCache filesystemTimestampOfPath:](v11->cache, "filesystemTimestampOfPath:", CFSTR("/var/db/timed/com.apple.timed.plist"));
      }
      else
      {
        v16 = qword_100033718;
        if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Cache was never used to set the clock, discarding filesystem timestamp.", buf, 2u);
        }
        v15 = 0;
      }
      -[TMCache emptyPath:](v11->cache, "emptyPath:", CFSTR("/var/db/timed/com.apple.timed.plist"));
      xpc_activity_unregister("com.apple.timed.check-active");
    }
    if (-[NSUUID isEqual:](-[TMCache bootUUID](v11->cache, "bootUUID"), "isEqual:", sub_10000B0C8((uint64_t)v11)))
    {
      v17 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
      {
        v18 = -[TMCache bootUUID](v11->cache, "bootUUID");
        v19 = -[TMCache rtcResetCount](v11->cache, "rtcResetCount");
        *(_DWORD *)buf = 138412546;
        v35 = v18;
        v36 = 1024;
        v37 = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Boot UUID matches. Keeping RTC reset count. UUID:%@ Count:%u", buf, 0x12u);
      }
      v11->_rtcResetCount += -[TMCache rtcResetCount](v11->cache, "rtcResetCount");
    }
    if (-[TMCache rtcReset](v11->cache, "rtcReset"))
      -[TMDaemonCore rtcDidReset](v11, "rtcDidReset");
    v11->_systemTimeSet = -[TMCache systemTimeSet](v11->cache, "systemTimeSet");
    -[TMCache accessoryUnc_s](v11->cache, "accessoryUnc_s");
    v11->_accessoryUnc_s = v20;
    sub_10000B1C0((uint64_t)v11);
    v21 = -[TMCache STF](v11->cache, "STF");
    if (v21)
    {
      v22 = +[TMTimeSynthesizer newSynthesizerFromDataRepresentation:](TMTimeSynthesizer, "newSynthesizerFromDataRepresentation:", v21);
      v11->_STF = v22;
      if (!-[NSString isEqualToString:](-[TMTimeSynthesizer name](v22, "name"), "isEqualToString:", CFSTR("STF")))
        -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("TMDaemonCore.m"), 265, CFSTR("Cached STF name mismatch"));
    }
    STF = v11->_STF;
    -[TMPreferences RTCWakeUncertainty](v11->_prefs, "RTCWakeUncertainty");
    -[TMTimeSynthesizer inflateHistoricalDataBy:](STF, "inflateHistoricalDataBy:");
    if (-[TMCache TDTF](v11->cache, "TDTF"))
    {
      v24 = +[TMTimeSynthesizer newSynthesizerFromDataRepresentation:](TMTimeSynthesizer, "newSynthesizerFromDataRepresentation:");
      v11->_timeSynthesizer = v24;
      if (!-[NSString isEqualToString:](-[TMTimeSynthesizer name](v24, "name"), "isEqualToString:", CFSTR("TDTF")))
        -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("TMDaemonCore.m"), 272, CFSTR("Cached synthesizer name mismatch"));
    }
    else
    {
      v25 = [TMTimeSynthesizer alloc];
      -[TMPreferences RTCFrequencyTolerance](v11->_prefs, "RTCFrequencyTolerance");
      v27 = v26;
      -[TMPreferences RTCFrequencyNoiseDensity](v11->_prefs, "RTCFrequencyNoiseDensity");
      v11->_timeSynthesizer = -[TMTimeSynthesizer initWithClockAccuracy:noiseDensity:name:](v25, "initWithClockAccuracy:noiseDensity:name:", CFSTR("TDTF"), v27, v28);
    }
    timeSynthesizer = v11->_timeSynthesizer;
    -[TMPreferences RTCWakeUncertainty](v11->_prefs, "RTCWakeUncertainty");
    -[TMTimeSynthesizer inflateHistoricalDataBy:](timeSynthesizer, "inflateHistoricalDataBy:");
    -[TMDaemonCore addTimeProvider:forKey:](v11, "addTimeProvider:forKey:", v11->_timeSynthesizer, CFSTR("Filtered"));
    v11->_timeZoneManager = -[TMTimeZoneManager initWithRules:delegate:]([TMTimeZoneManager alloc], "initWithRules:delegate:", a3, v11);
    if (-[TMPreferences shouldUseFilesystemTimestamp](v11->_prefs, "shouldUseFilesystemTimestamp") && v15)
    {
      v30 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v15;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Injecting filesystem timestamp: %@", buf, 0xCu);
      }
      -[TMDaemonCore setSourceTime:](v11, "setSourceTime:", v15);
    }
    v31 = objc_alloc_init(TMBackgroundNtpSource);
    v11->_ntpSource = v31;
    -[TMBackgroundNtpSource setPreferences:](v31, "setPreferences:", v11->_prefs);
    -[TMCache lastNTPFetchAttempt](v11->cache, "lastNTPFetchAttempt");
    -[TMBackgroundNtpSource setLastFetchAttempt:](v11->_ntpSource, "setLastFetchAttempt:");
    -[TMBackgroundNtpSource setClock:](v11->_ntpSource, "setClock:", -[TMDaemonCore clock](v11, "clock"));
    -[TMBackgroundNtpSource setDaemonCore:](v11->_ntpSource, "setDaemonCore:", v11);
    sub_10000B1F4(v11);
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  self->bootUUID = 0;
  self->_plugins = 0;

  self->_pendingSetupTimeHandlers = 0;
  self->_timeProviders = 0;
  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", self);

  self->_timeZoneManager = 0;
  self->_timeSynthesizer = 0;

  self->_STF = 0;
  self->_ntpSource = 0;
  -[TMDaemonCore setClock:](self, "setClock:", 0);

  self->_prefs = 0;
  self->cache = 0;
  v3.receiver = self;
  v3.super_class = (Class)TMDaemonCore;
  -[TMDaemonCore dealloc](&v3, "dealloc");
}

- (void)addPlugin:(id)a3
{
  NSMutableSet *plugins;

  plugins = self->_plugins;
  if (!plugins)
  {
    plugins = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    self->_plugins = plugins;
  }
  -[NSMutableSet addObject:](plugins, "addObject:", a3);
}

- (void)testAndApplySystemTime
{
  if (self)
  {
    if (-[TMDaemonCore isAutomaticTimeEnabled](self, "isAutomaticTimeEnabled"))
      sub_10000BA28((id *)&self->super.isa, 6);
  }
}

- (void)setSystemTimeSet:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableArray *pendingSetupTimeHandlers;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = a3;
  if (self->_systemTimeSet != a3)
  {
    self->_systemTimeSet = a3;
    sub_10000B1F4(self);
  }
  if (v3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    pendingSetupTimeHandlers = self->_pendingSetupTimeHandlers;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pendingSetupTimeHandlers, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(pendingSetupTimeHandlers);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i) + 16))();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pendingSetupTimeHandlers, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
    -[NSMutableArray removeAllObjects](self->_pendingSetupTimeHandlers, "removeAllObjects");
  }
}

- (BOOL)isSystemTimeZoneSet
{
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  return CFPreferencesGetAppBooleanValue(CFSTR("timezoneset"), CFSTR("com.apple.preferences.datetime"), &keyExistsAndHasValidFormat) != 0;
}

- (void)setSystemTimeZoneSet:(BOOL)a3
{
  CFPreferencesSetAppValue(CFSTR("timezoneset"), +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3), CFSTR("com.apple.preferences.datetime"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.preferences.datetime"));
}

- (void)setAutomaticTimeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;

  v3 = a3;
  v5 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "disabled";
    if (v3)
      v6 = "enabled";
    v7 = 136315138;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received automatic time %s\n", (uint8_t *)&v7, 0xCu);
  }
  -[TMPreferences setAutomaticTimeEnabled:](self->_prefs, "setAutomaticTimeEnabled:", v3);
  if (v3)
  {
    -[TMDaemonCore testAndApplySystemTime](self, "testAndApplySystemTime");
    sub_10000EBFC(self, &stru_100028CC0);
    -[TMTimeSynthesizer reset](self->_STF, "reset");
  }
}

- (BOOL)isAutomaticTimeEnabled
{
  return -[TMPreferences isAutomaticTimeEnabled](self->_prefs, "isAutomaticTimeEnabled");
}

- (void)setAutomaticTimeZoneEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  unsigned __int8 v7;
  _QWORD v8[4];
  uint8_t buf[4];
  const char *v10;

  v3 = a3;
  v5 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "disabled";
    if (v3)
      v6 = "enabled";
    *(_DWORD *)buf = 136315138;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received automatic time zone %s\n", buf, 0xCu);
  }
  v7 = -[TMDaemonCore isAutomaticTimeZoneEnabled](self, "isAutomaticTimeZoneEnabled");
  -[TMPreferences setAutomaticTimeZoneEnabled:](self->_prefs, "setAutomaticTimeZoneEnabled:", v3);
  sub_10000EDDC((uint64_t)self);
  if (v3 && (v7 & 1) == 0)
  {
    -[TMMonotonicClock coarseMonotonicTime](-[TMDaemonCore clock](self, "clock"), "coarseMonotonicTime");
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000EE64;
    v8[3] = &unk_100028CE8;
    -[TMDaemonCore executeCommand:withHandler:](self, "executeCommand:withHandler:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", CFSTR("TMResetTimeZone"), CFSTR("TMCommand"), CFSTR("AutomaticTimeZoneEnabled"), CFSTR("TMResetTimeZoneReason"), +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("TMRtcTime"), 0), v8);
  }
}

- (BOOL)isAutomaticTimeZoneEnabled
{
  return -[TMPreferences isAutomaticTimeZoneEnabled](self->_prefs, "isAutomaticTimeZoneEnabled");
}

- (void)checkActiveTimeSourceRequired
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EF8C;
  block[3] = &unk_100028DB0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)-[TMDaemonCore workloop](self, "workloop"), block);
}

- (void)setSourceTime:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000F8F4;
  v3[3] = &unk_100028E18;
  v3[4] = a3;
  v3[5] = self;
  dispatch_async((dispatch_queue_t)-[TMDaemonCore workloop](self, "workloop"), v3);
}

- (void)setSourceAvailable:(id)a3
{
  const __CFString *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[5];
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;

  v5 = (const __CFString *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMSource"));
  v6 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received source available from \"%@\"\n", buf, 0xCu);
  }
  v7 = qword_100033720;
  if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMSource"));
    objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
    *(_DWORD *)buf = 138412802;
    v12 = CFSTR("available");
    v13 = 2112;
    v14 = v8;
    v15 = 2048;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f", buf, 0x20u);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000101A4;
  v10[3] = &unk_100028BA0;
  v10[4] = a3;
  AnalyticsSendEventLazy(CFSTR("com.apple.timed.sourceAvailableCommand"), v10);
  sub_10000B314(self, (uint64_t)"sourceWillBecomeAvailable:", (uint64_t)v5);
  -[TMTimeZoneManager setSourceAvailable:](self->_timeZoneManager, "setSourceAvailable:", v5);
}

- (void)setSourceUnavailable:(id)a3
{
  const __CFString *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[5];
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;

  v5 = (const __CFString *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMSource"));
  v6 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received source unavailable from \"%@\"\n", buf, 0xCu);
  }
  v7 = qword_100033720;
  if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMSource"));
    objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
    *(_DWORD *)buf = 138412802;
    v12 = CFSTR("unavailable");
    v13 = 2112;
    v14 = v8;
    v15 = 2048;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f", buf, 0x20u);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100010454;
  v10[3] = &unk_100028BA0;
  v10[4] = a3;
  AnalyticsSendEventLazy(CFSTR("com.apple.timed.sourceUnavailableCommand"), v10);
  -[TMTimeZoneManager setSourceUnavailable:](self->_timeZoneManager, "setSourceUnavailable:", v5);
  sub_10000B314(self, (uint64_t)"sourceBecameUnavailable:", (uint64_t)v5);
}

- (void)setSourceTimeZone:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  TMTimeZone *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;

  v5 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = (const __CFString *)objc_msgSend(a3, "objectForKey:", CFSTR("TMTimeZone"));
    v15 = 2112;
    v16 = objc_msgSend(a3, "objectForKey:", CFSTR("TMSource"));
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received timezone \"%@\" from \"%@\"\n", buf, 0x16u);
  }
  v6 = qword_100033720;
  if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMSource"));
    objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
    v9 = v8;
    v10 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMTimeZone"));
    *(_DWORD *)buf = 138413058;
    v14 = CFSTR("TZ");
    v15 = 2112;
    v16 = v7;
    v17 = 2048;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f,tz,%@", buf, 0x2Au);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100010794;
  v12[3] = &unk_100028BA0;
  v12[4] = a3;
  AnalyticsSendEventLazy(CFSTR("com.apple.timed.timeZoneCommand"), v12);
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMSource")), "isEqualToString:", CFSTR("Location")))sub_10000B314(self, (uint64_t)"locationProvidedTimeZone:", (uint64_t)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMTimeZone")));
  v11 = -[TMTimeZone initWithDictionary:]([TMTimeZone alloc], "initWithDictionary:", a3);
  -[TMTimeZoneManager setSourceTimeZone:](self->_timeZoneManager, "setSourceTimeZone:", v11);

}

- (void)setRequiresActiveBBTime:(BOOL)a3
{
  _BOOL4 requiresActiveBBTime;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v6[4];
  BOOL v7;

  requiresActiveBBTime = self->_requiresActiveBBTime;
  self->_requiresActiveBBTime = a3;
  if (requiresActiveBBTime != a3)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("TMBBTimeActiveNotification"), 0, 0, 0);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100010A90;
    v6[3] = &unk_100028E38;
    v7 = a3;
    AnalyticsSendEventLazy(CFSTR("com.apple.timed.proactiveGPSTime"), v6);
  }
}

- (void)resetTime
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010FDC;
  block[3] = &unk_100028DB0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)-[TMDaemonCore workloop](self, "workloop"), block);
}

- (void)resetTimeZone:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[6];
  uint8_t buf[4];
  const __CFString *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;

  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("TMResetTimeZoneReason"));
  v6 = qword_100033720;
  if (os_log_type_enabled((os_log_t)qword_100033720, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMSource"));
    objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
    *(_DWORD *)buf = 138413058;
    v11 = CFSTR("reset_tz");
    v12 = 2112;
    v13 = v7;
    v14 = 2048;
    v15 = v8;
    v16 = 2112;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f,reason,%@", buf, 0x2Au);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100011240;
  v9[3] = &unk_100028F00;
  v9[4] = v5;
  v9[5] = a3;
  AnalyticsSendEventLazy(CFSTR("com.apple.timed.resetTimeZoneCommand"), v9);
  -[TMTimeZoneManager reset:](self->_timeZoneManager, "reset:", v5);
}

- (void)timeZoneManager:(id)a3 didReset:(id)a4
{
  __CFNotificationCenter *DarwinNotifyCenter;

  sub_10000B1C0((uint64_t)self);
  sub_10000B314(self, (uint64_t)"timeZoneWasReset:", (uint64_t)a4);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("AutomaticTimeZoneUpdateNeeded"), 0, 0, 1u);
  sub_10000EDDC((uint64_t)self);
}

- (void)timeZoneManager:(id)a3 didComputeResult:(id)a4
{
  if ((objc_msgSend(a3, "isEqual:", self->_timeZoneManager) & 1) == 0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TMDaemonCore.m"), 1651, CFSTR("Got unexpected callback from manager %@"), a3);
  sub_10000CE58((id *)&self->super.isa, (__CFString *)objc_msgSend(a4, "olsonName"));
  sub_10000B1C0((uint64_t)self);
}

- (void)timeZoneManager:(id)a3 shouldFetch:(id)a4
{
  sub_10000B1C0((uint64_t)self);
  sub_10000B314(self, (uint64_t)"fetch:", (uint64_t)a4);
  sub_10000EDDC((uint64_t)self);
}

- (TMTimeZone)computedTimeZone
{
  NSObject *v3;
  TMTimeZoneManager *timeZoneManager;
  int v6;
  TMTimeZoneManager *v7;

  v3 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
  {
    timeZoneManager = self->_timeZoneManager;
    v6 = 138412290;
    v7 = timeZoneManager;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Asked for computed time zone: %@", (uint8_t *)&v6, 0xCu);
  }
  return -[TMTimeZoneManager currentTimeZone](self->_timeZoneManager, "currentTimeZone");
}

- (TMTimeProvider)timeProvider
{
  TMTimeProvider *v2;

  v2 = (TMTimeProvider *)-[NSMutableDictionary objectForKeyedSubscript:](self->_timeProviders, "objectForKeyedSubscript:", -[TMPreferences providerName](self->_prefs, "providerName"));
  if (!v2 && os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_FAULT))
    sub_10001BAF0();
  return v2;
}

- (void)addTimeProvider:(id)a3 forKey:(id)a4
{
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_timeProviders, "objectForKeyedSubscript:", a4)
    && os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
  {
    sub_10001BB5C();
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_timeProviders, "setObject:forKeyedSubscript:", a3, a4);
}

- (BOOL)isSystemTimeSet
{
  return self->_systemTimeSet;
}

- (OS_dispatch_workloop)workloop
{
  return self->_workloop;
}

- (double)accessoryUnc_s
{
  return self->_accessoryUnc_s;
}

- (void)setAccessoryUnc_s:(double)a3
{
  self->_accessoryUnc_s = a3;
}

- (unsigned)rtcResetCount
{
  return self->_rtcResetCount;
}

- (BOOL)requiresActiveBBTime
{
  return self->_requiresActiveBBTime;
}

- (void)setClock:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

@end
