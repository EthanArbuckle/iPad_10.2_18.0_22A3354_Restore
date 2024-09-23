@implementation CFHelper

- (void)writeTimezone:(id)a3
{
  id v4;
  uint64_t v5;
  OS_os_log *logs;
  uint64_t v7;

  v4 = objc_retainAutorelease(a3);
  v5 = tzlink(objc_msgSend(v4, "UTF8String"));
  if ((_DWORD)v5)
  {
    logs = self->logs;
    if (os_log_type_enabled((os_log_t)logs, OS_LOG_TYPE_ERROR))
      sub_1000025E0((os_log_t)logs);
  }
  else
  {
    TMSetAutomaticTimeZoneEnabled(v5);
    TMSetAutomaticTimeEnabled(0, v7);
    CFPreferencesSetAppValue(CFSTR("timezone"), v4, CFSTR("com.apple.preferences.datetime"));
    CFPreferencesSetAppValue(CFSTR("timezoneset"), kCFBooleanTrue, CFSTR("com.apple.preferences.datetime"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.preferences.datetime"));
    +[NSTimeZone resetSystemTimeZone](NSTimeZone, "resetSystemTimeZone");
  }

}

- (void)writeTzAuto
{
  TMSetAutomaticTimeEnabled(1, a2);
  TMSetAutomaticTimeZoneEnabled(1);
  CFPreferencesSetAppValue(CFSTR("automatic-time"), 0, CFSTR("com.apple.preferences.datetime"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.preferences.datetime"));
}

- (BOOL)readTzAuto
{
  return TMIsAutomaticTimeZoneEnabled(self, a2) != 0;
}

- (id)readTimezone
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));

  return v3;
}

- (id)readUTCOffset
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v2, "secondsFromGMT")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringValue"));

  return v4;
}

- (void)readDST:(id *)a3 :(id *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextDaylightSavingTimeTransition"));

  if (v16)
  {
    objc_msgSend(v16, "timeIntervalSince1970");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
    v10 = objc_msgSend(v9, "isDaylightSavingTime");

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
    v12 = v11;
    if (v10)
    {
      objc_msgSend(v11, "daylightSavingTimeOffset");
      v14 = -v13;
    }
    else
    {
      objc_msgSend(v11, "daylightSavingTimeOffsetForDate:", v16);
      v14 = v15;
    }

  }
  else
  {
    v14 = 0.0;
    v8 = 0;
  }
  *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.0f"), v8));
  *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.0f"), *(_QWORD *)&v14));

}

- (void)write24HrMode:(__CFBoolean *)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;

  CFPreferencesSetValue(CFSTR("AppleICUForce24HourTime"), a3, kCFPreferencesAnyApplication, CFSTR("mobile"), kCFPreferencesCurrentHost);
  CFPreferencesSynchronize(kCFPreferencesAnyApplication, CFSTR("mobile"), kCFPreferencesCurrentHost);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("AppleTimePreferencesChangedNotification"), 0, 0, 1u);
}

- (id)read24HrMode
{
  id v3;
  void *v4;
  NSObject *logs;
  void *v6;
  unsigned int v7;
  void *v8;

  v3 = objc_alloc_init((Class)NSDateFormatter);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  objc_msgSend(v3, "setLocale:", v4);

  objc_msgSend(v3, "setLocalizedDateFormatFromTemplate:", CFSTR("j"));
  logs = self->logs;
  if (os_log_type_enabled(logs, OS_LOG_TYPE_DEBUG))
    sub_100002620(logs, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateFormat"));
  v7 = objc_msgSend(v6, "containsString:", CFSTR("H"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v7));
  return v8;
}

- (CFHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CFHelper;
  return -[CFHelper init](&v3, "init");
}

- (CFHelper)initWithLog:(id)a3
{
  id v4;
  CFHelper *v5;
  CFHelper *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CFHelper;
  v5 = -[CFHelper init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    if (v4)
      v7 = v4;
    else
      v7 = &_os_log_default;
    objc_storeStrong((id *)&v5->logs, v7);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->logs, 0);
}

@end
