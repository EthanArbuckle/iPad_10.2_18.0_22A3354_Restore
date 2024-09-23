@implementation _OSInactivityNotificationManager

- (_OSInactivityNotificationManager)init
{
  _OSInactivityNotificationManager *v2;
  os_log_t v3;
  OS_os_log *log;
  UNUserNotificationCenter *v5;
  UNUserNotificationCenter *unCenter;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  _QWORD v10[4];
  _OSInactivityNotificationManager *v11;
  int out_token;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_OSInactivityNotificationManager;
  v2 = -[_OSInactivityNotificationManager init](&v13, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.osintelligence", "inactivity.notifications");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = (UNUserNotificationCenter *)objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:", CFSTR("com.apple.osintelligence.inactivity.notifications"));
    unCenter = v2->_unCenter;
    v2->_unCenter = v5;

    -[UNUserNotificationCenter setDelegate:](v2->_unCenter, "setDelegate:", v2);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](v2->_unCenter, "setWantsNotificationResponsesDelivered");
    out_token = 0;
    global_queue = dispatch_get_global_queue(-32768, 0);
    v8 = objc_claimAutoreleasedReturnValue(global_queue);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100007440;
    v10[3] = &unk_100060800;
    v11 = v2;
    notify_register_dispatch("com.apple.osintelligence.inactivity.notifications", &out_token, v8, v10);

  }
  return v2;
}

- (id)ttrURLforEnagedFrom:(id)a3 until:(id)a4 interrupted:(BOOL)a5 inactivityOptions:(int64_t)a6
{
  _BOOL4 v6;
  const __CFString *v9;
  id v10;
  id v11;
  const __CFString *v12;
  __CFString *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  OS_os_log *log;
  uint8_t buf[4];
  void *v27;

  v6 = a5;
  if ((a6 & 1) != 0)
    v9 = CFSTR("[Sleep Suppression]");
  else
    v9 = CFSTR("[Core Smart Power Nap]");
  v10 = a4;
  v11 = a3;
  if (v6)
    v12 = CFSTR("Potential False Suppression");
  else
    v12 = CFSTR("Potential Insufficient Suppression");
  if (v6)
    v13 = CFSTR("* What were you doing immediately prior to suppression?\n\n* Do you typically leave your device inactive at this time?\n\n* Was your device in a dimly-lit environment prior to suppression? If so, please describe the environment.");
  else
    v13 = CFSTR("* How much sooner than the start of suppression do you think you stopped using your device?\n\n* How much later than when suppression ended did you start using your device?\n\n* Do you typically leave your device inactive around this time?");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v9, v12));
  v15 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v15, "setDateStyle:", 0);
  objc_msgSend(v15, "setTimeStyle:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringFromDate:", v11));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringFromDate:", v10));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingFormat:", CFSTR(" (%@ - %@)"), v16, v17));

  v19 = objc_retainAutorelease(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("tap-to-radar://new?Title=%s&Classification=Serious Bug&ComponentID=1407046&ComponentName=OSIntelligence&ComponentVersion=Inactivity&Reproducible=Sometimes&Description=PLEASE ANSWER THESE QUESTIONS TO AID DEBUGGING:\n\n%s"), objc_msgSend(v19, "UTF8String"), -[__CFString UTF8String](v13, "UTF8String")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAddingPercentEncodingWithAllowedCharacters:", v21));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v22));
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v23;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "TTR URL is %@", buf, 0xCu);
  }

  return v23;
}

- (id)iconForOptions:(int64_t)a3
{
  const __CFString *v3;

  if ((a3 & 1) != 0)
    v3 = CFSTR("moon.circle.fill");
  else
    v3 = CFSTR("moon.circle");
  return (id)objc_claimAutoreleasedReturnValue(+[UNNotificationIcon iconForSystemImageNamed:](UNNotificationIcon, "iconForSystemImageNamed:", v3));
}

- (id)titleForOptions:(int64_t)a3
{
  if ((a3 & 1) != 0)
    return CFSTR("Sleep Suppression");
  else
    return CFSTR("Core Smart Power Nap");
}

- (id)inactivityEngagedContentUntil:(id)a3 inactivityOptions:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = objc_alloc_init((Class)UNMutableNotificationContent);
  objc_msgSend(v7, "setCategoryIdentifier:", CFSTR("engaged"));
  objc_msgSend(v7, "setShouldIgnoreDowntime:", 1);
  objc_msgSend(v7, "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(v7, "setShouldHideDate:", 0);
  objc_msgSend(v7, "setShouldSuppressScreenLightUp:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityNotificationManager titleForOptions:](self, "titleForOptions:", a4));
  objc_msgSend(v7, "setTitle:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityNotificationManager iconForOptions:](self, "iconForOptions:", a4));
  objc_msgSend(v7, "setIcon:", v9);

  v10 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v10, "setDateStyle:", 0);
  objc_msgSend(v10, "setTimeStyle:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  objc_msgSend(v10, "setLocale:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringFromDate:", v6));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Inactivity predicted until %@"), v12));
  objc_msgSend(v7, "setBody:", v13);

  objc_msgSend(v7, "setExpirationDate:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceDefines inactivityUserDefaults](OSIntelligenceDefines, "inactivityUserDefaults"));
  LODWORD(v12) = objc_msgSend(v14, "BOOLForKey:", CFSTR("showNotifications.ttrURL"));

  if ((_DWORD)v12)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityNotificationManager ttrURLforEnagedFrom:until:interrupted:inactivityOptions:](self, "ttrURLforEnagedFrom:until:interrupted:inactivityOptions:", v15, v6, 1, a4));
    objc_msgSend(v7, "setDefaultActionURL:", v16);

  }
  return v7;
}

- (id)inactivityPreviouslyEngagedContentFrom:(id)a3 until:(id)a4 inactivityOptions:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init((Class)UNMutableNotificationContent);
  objc_msgSend(v10, "setCategoryIdentifier:", CFSTR("engaged"));
  objc_msgSend(v10, "setShouldIgnoreDowntime:", 1);
  objc_msgSend(v10, "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(v10, "setShouldHideDate:", 1);
  objc_msgSend(v10, "setShouldSuppressScreenLightUp:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityNotificationManager titleForOptions:](self, "titleForOptions:", a5));
  objc_msgSend(v10, "setTitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityNotificationManager iconForOptions:](self, "iconForOptions:", a5));
  objc_msgSend(v10, "setIcon:", v12);

  v13 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v13, "setDateStyle:", 0);
  objc_msgSend(v13, "setTimeStyle:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  objc_msgSend(v13, "setLocale:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringFromDate:", v8));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringFromDate:", v9));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Inactivity was predicted from %@ until %@."), v15, v16));
  objc_msgSend(v10, "setBody:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceDefines inactivityUserDefaults](OSIntelligenceDefines, "inactivityUserDefaults"));
  objc_msgSend(v18, "doubleForKey:", CFSTR("showNowtifications.expirationDelay"));
  v20 = v19;

  v21 = 14400.0;
  if (v20 >= 1.0)
    v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateByAddingTimeInterval:", v21));
  objc_msgSend(v10, "setExpirationDate:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceDefines inactivityUserDefaults](OSIntelligenceDefines, "inactivityUserDefaults"));
  v24 = objc_msgSend(v23, "BOOLForKey:", CFSTR("showNotifications.ttrURL"));

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityNotificationManager ttrURLforEnagedFrom:until:interrupted:inactivityOptions:](self, "ttrURLforEnagedFrom:until:interrupted:inactivityOptions:", v8, v9, 0, a5));
    objc_msgSend(v10, "setDefaultActionURL:", v25);

  }
  return v10;
}

- (id)engagedUntilDateRequest:(id)a3 inactivityOptions:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityNotificationManager inactivityEngagedContentUntil:inactivityOptions:](self, "inactivityEngagedContentUntil:inactivityOptions:", a3));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-inactivityEngaged-%@"), v6, v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceDefines inactivityUserDefaults](OSIntelligenceDefines, "inactivityUserDefaults"));
    objc_msgSend(v9, "doubleForKey:", CFSTR("showNowtifications.displayDelta"));
    v11 = v10;

    v12 = 300.0;
    if (v11 >= 1.0)
      v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:repeats:](UNTimeIntervalNotificationTrigger, "triggerWithTimeInterval:repeats:", 0, v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", v8, v5, v13));
    objc_msgSend(v14, "setDestinations:", 2);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)previouslyEngagedFrom:(id)a3 until:(id)a4 inactivityOptions:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityNotificationManager inactivityPreviouslyEngagedContentFrom:until:inactivityOptions:](self, "inactivityPreviouslyEngagedContentFrom:until:inactivityOptions:", a3, v8, a5));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-inactivityPreviouslyEngaged-%@"), v10, v11));

    objc_msgSend(v8, "timeIntervalSinceNow");
    if (v13 <= 0.0)
      v14 = 0;
    else
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:repeats:](UNTimeIntervalNotificationTrigger, "triggerWithTimeInterval:repeats:", 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", v12, v9, v14));
    objc_msgSend(v15, "setDestinations:", 2);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)postEngagedUntilDate:(id)a3 inactivityOptions:(int64_t)a4
{
  id v6;
  void *v7;
  UNUserNotificationCenter *unCenter;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  -[_OSInactivityNotificationManager removeAllNotificationsForInactivityOptions:](self, "removeAllNotificationsForInactivityOptions:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityNotificationManager engagedUntilDateRequest:inactivityOptions:](self, "engagedUntilDateRequest:inactivityOptions:", v6, a4));
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_unCenter, "addNotificationRequest:withCompletionHandler:", v7, 0);
  unCenter = self->_unCenter;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_OSInactivityNotificationManager previouslyEngagedFrom:until:inactivityOptions:](self, "previouslyEngagedFrom:until:inactivityOptions:", v9, v6, a4));

  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](unCenter, "addNotificationRequest:withCompletionHandler:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));

  return v11;
}

- (void)removeAllNotifications
{
  -[_OSInactivityNotificationManager removeAllNotificationsForInactivityOptions:](self, "removeAllNotificationsForInactivityOptions:", 0x7FFFFFFFFFFFFFFFLL);
}

- (void)removeAllNotificationsForInactivityOptions:(int64_t)a3
{
  UNUserNotificationCenter *unCenter;
  UNUserNotificationCenter *v6;
  _QWORD v7[6];
  _QWORD v8[6];

  unCenter = self->_unCenter;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007FAC;
  v8[3] = &unk_1000608A0;
  v8[4] = self;
  v8[5] = a3;
  -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](unCenter, "getDeliveredNotificationsWithCompletionHandler:", v8);
  v6 = self->_unCenter;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000821C;
  v7[3] = &unk_1000608A0;
  v7[4] = self;
  v7[5] = a3;
  -[UNUserNotificationCenter getPendingNotificationRequestsWithCompletionHandler:](v6, "getPendingNotificationRequestsWithCompletionHandler:", v7);
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[UNUserNotificationCenter removeAllDeliveredNotifications](self->_unCenter, "removeAllDeliveredNotifications");
    -[UNUserNotificationCenter removeAllPendingNotificationRequests](self->_unCenter, "removeAllPendingNotificationRequests");
  }
}

- (id)currentlyInInactivityNotification:(id)a3
{
  id v4;
  UNUserNotificationCenter *unCenter;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_100008524;
  v13 = sub_100008534;
  v14 = 0;
  unCenter = self->_unCenter;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000853C;
  v8[3] = &unk_1000608C8;
  v8[4] = &v9;
  -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](unCenter, "getDeliveredNotificationsWithCompletionHandler:", v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (UNUserNotificationCenter)unCenter
{
  return self->_unCenter;
}

- (void)setUnCenter:(id)a3
{
  objc_storeStrong((id *)&self->_unCenter, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_unCenter, 0);
}

@end
