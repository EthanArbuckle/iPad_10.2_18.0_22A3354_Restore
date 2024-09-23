@implementation BatteryIntelligenceNotificationManager

- (BatteryIntelligenceNotificationManager)init
{
  BatteryIntelligenceNotificationManager *v3;
  os_log_t v4;
  OS_os_log *log;
  UNUserNotificationCenter *v6;
  UNUserNotificationCenter *unCenter;
  BatteryIntelligenceNotificationManager *v8;
  objc_super v10;

  if (os_variant_has_internal_ui("com.apple.batteryintelligence", a2))
  {
    v10.receiver = self;
    v10.super_class = (Class)BatteryIntelligenceNotificationManager;
    v3 = -[BatteryIntelligenceNotificationManager init](&v10, "init");
    if (v3)
    {
      v4 = os_log_create("com.apple.batteryintelligence", "notifications");
      log = v3->_log;
      v3->_log = (OS_os_log *)v4;

      v6 = (UNUserNotificationCenter *)objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:", CFSTR("com.apple.batteryintelligence-notifications"));
      unCenter = v3->_unCenter;
      v3->_unCenter = v6;

      -[UNUserNotificationCenter setDelegate:](v3->_unCenter, "setDelegate:", v3);
      -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](v3->_unCenter, "setWantsNotificationResponsesDelivered");
    }
    self = v3;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CCF8;
  block[3] = &unk_10002C5E0;
  block[4] = a1;
  if (qword_100035218 != -1)
    dispatch_once(&qword_100035218, block);
  return (id)qword_100035220;
}

- (id)timeStringFromDuration:(double)a3
{
  NSString *v3;
  signed int v4;
  unsigned int v5;
  uint64_t v7;

  if (a3 >= 60.0)
  {
    if (a3 >= 3600.0)
    {
      if (a3 >= 7200.0)
      {
        v4 = vcvtmd_s64_f64(a3);
        v5 = v4 % 3600 + ((-30583 * (v4 % 3600)) >> 16);
        v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.0f hours, %.0d minutes"), a3 / 3600.0, ((__int16)v5 >> 5) + ((unsigned __int16)(v5 & 0x8000) >> 15));
      }
      else
      {
        v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("1 hour, %.0f minutes"), (a3 + -3600.0) / 60.0, v7);
      }
    }
    else
    {
      v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.0f minutes"), a3 / 60.0, v7);
    }
  }
  else
  {
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.0f seconds"), *(_QWORD *)&a3, v7);
  }
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)tt80NotificationContentWithDuration:(double)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = objc_alloc_init((Class)UNMutableNotificationContent);
  objc_msgSend(v5, "setTitle:", CFSTR("Charge Time"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryIntelligenceNotificationManager timeStringFromDuration:](self, "timeStringFromDuration:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("It will take %@ to charge to 80%%."), v6));
  objc_msgSend(v5, "setBody:", v7);

  objc_msgSend(v5, "setCategoryIdentifier:", CFSTR("tt80Category"));
  objc_msgSend(v5, "setShouldIgnoreDowntime:", 1);
  objc_msgSend(v5, "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(v5, "setShouldHideDate:", 0);
  objc_msgSend(v5, "setShouldSuppressScreenLightUp:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationIcon iconForSystemImageNamed:](UNNotificationIcon, "iconForSystemImageNamed:", CFSTR("bolt.fill")));
  objc_msgSend(v5, "setIcon:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 57600.0));
  objc_msgSend(v5, "setExpirationDate:", v9);

  return v5;
}

- (id)tt80NotificationRequestWithDuration:(double)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryIntelligenceNotificationManager tt80NotificationContentWithDuration:](self, "tt80NotificationContentWithDuration:", a3));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("tt80-%@"), v4));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", v5, v3, 0));
    objc_msgSend(v6, "setDestinations:", 15);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)postTT80NotificationWithDuration:(double)a3
{
  NSObject *v5;
  UNUserNotificationCenter *unCenter;
  _QWORD v7[4];
  id v8;
  id location[2];

  if ((_os_feature_enabled_impl("batteryintelligence", "TimeTo80Notification") & 1) != 0)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[BatteryIntelligenceNotificationManager tt80NotificationRequestWithDuration:](self, "tt80NotificationRequestWithDuration:", a3));
    objc_initWeak(location, self);
    unCenter = self->_unCenter;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000D15C;
    v7[3] = &unk_10002C658;
    objc_copyWeak(&v8, location);
    -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](unCenter, "addNotificationRequest:withCompletionHandler:", v5, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(location);
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(-[BatteryIntelligenceNotificationManager log](self, "log"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "TT80 notification is not enabled!", (uint8_t *)location, 2u);
    }
  }

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
