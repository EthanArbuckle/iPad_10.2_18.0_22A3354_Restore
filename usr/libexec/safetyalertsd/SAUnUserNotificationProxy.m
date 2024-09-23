@implementation SAUnUserNotificationProxy

- (SAUnUserNotificationProxy)initWithQueue:(id)a3
{
  id v5;
  SAUnUserNotificationProxy *v6;
  BOOL v7;
  UNUserNotificationCenter *v8;
  UNUserNotificationCenter *notificationCenter;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SAUnUserNotificationProxy;
  v6 = -[SAUnUserNotificationProxy init](&v11, "init");
  if (*((_BYTE *)SAPlatformInfo::instance((SAPlatformInfo *)v6) + 9))
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (UNUserNotificationCenter *)objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:queue:", CFSTR("com.apple.safetyalerts"), v5);
    notificationCenter = v6->_notificationCenter;
    v6->_notificationCenter = v8;

    -[UNUserNotificationCenter setDelegate:](v6->_notificationCenter, "setDelegate:", v6);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](v6->_notificationCenter, "setWantsNotificationResponsesDelivered");
  }

  return v6;
}

- (void)postNotification:(id)a3 withSilence:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UNUserNotificationCenter *notificationCenter;
  _QWORD v13[5];

  v6 = a3;
  if (v6)
  {
    v7 = objc_alloc_init((Class)UNMutableNotificationContent);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedUserNotificationStringForKey:arguments:](NSString, "localizedUserNotificationStringForKey:arguments:", CFSTR("Safety Alerts Test"), 0));
    objc_msgSend(v7, "setTitle:", v8);

    objc_msgSend(v7, "setBody:", v6);
    if (!a4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationSound defaultSound](UNNotificationSound, "defaultSound"));
      objc_msgSend(v7, "setSound:", v9);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationIcon iconNamed:](UNNotificationIcon, "iconNamed:", CFSTR("emergency-20")));
    objc_msgSend(v7, "setIcon:", v10);

    objc_msgSend(v7, "setThreadIdentifier:", CFSTR("com.apple.safetyalerts"));
    objc_msgSend(v7, "setCategoryIdentifier:", CFSTR("com.apple.safetyalerts"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:](UNNotificationRequest, "requestWithIdentifier:content:trigger:destinations:", CFSTR("com.apple.safetyalerts"), v7, 0, 7));
    notificationCenter = self->_notificationCenter;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000613CC;
    v13[3] = &unk_1000F44F8;
    v13[4] = v11;
    -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](notificationCenter, "addNotificationRequest:withCompletionHandler:", v11, v13);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end
