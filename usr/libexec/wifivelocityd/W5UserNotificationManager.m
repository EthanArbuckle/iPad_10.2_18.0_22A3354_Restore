@implementation W5UserNotificationManager

- (W5UserNotificationManager)init
{
  uint64_t v2;
  W5UserNotificationManager *v3;
  UNUserNotificationCenter *v4;
  UNUserNotificationCenter *userNotificationCenter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)W5UserNotificationManager;
  v3 = -[W5UserNotificationManager init](&v7, "init");
  if (v3 && objc_opt_class(UNUserNotificationCenter, v2))
  {
    v4 = (UNUserNotificationCenter *)objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:", CFSTR("com.apple.wifivelocityd.usernotification"));
    userNotificationCenter = v3->_userNotificationCenter;
    v3->_userNotificationCenter = v4;

    -[UNUserNotificationCenter setDelegate:](v3->_userNotificationCenter, "setDelegate:", v3);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](v3->_userNotificationCenter, "setWantsNotificationResponsesDelivered");
    -[UNUserNotificationCenter requestAuthorizationWithOptions:completionHandler:](v3->_userNotificationCenter, "requestAuthorizationWithOptions:completionHandler:", 3, &stru_1000D5668);
    -[UNUserNotificationCenter removeAllDeliveredNotifications](v3->_userNotificationCenter, "removeAllDeliveredNotifications");
    -[UNUserNotificationCenter removeAllPendingNotificationRequests](v3->_userNotificationCenter, "removeAllPendingNotificationRequests");
  }
  return v3;
}

- (void)dispatchNotificationWithTitle:(id)a3 subtitle:(id)a4 body:(id)a5 type:(int64_t)a6 UUID:(id)a7 actionURL:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  NSObject *v38;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (+[W5FeatureAvailability isInternalBuild](W5FeatureAvailability, "isInternalBuild"))
  {
    v19 = objc_alloc_init((Class)UNMutableNotificationContent);
    -[NSObject setTitle:](v19, "setTitle:", v14);
    -[NSObject setSubtitle:](v19, "setSubtitle:", v15);
    -[NSObject setBody:](v19, "setBody:", v16);
    -[NSObject setShouldIgnoreDoNotDisturb:](v19, "setShouldIgnoreDoNotDisturb:", 1);
    -[NSObject setShouldIgnoreDowntime:](v19, "setShouldIgnoreDowntime:", 1);
    if (a6)
    {
      if ((a6 & 0xFFFFFFFFFFFFFFFDLL) == 1)
        -[NSObject setDefaultActionURL:](v19, "setDefaultActionURL:", v18);
    }
    else
    {
      -[NSObject setShouldSuppressDefaultAction:](v19, "setShouldSuppressDefaultAction:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationSound defaultSound](UNNotificationSound, "defaultSound"));
      -[NSObject setSound:](v19, "setSound:", v21);

      -[NSObject setInterruptionLevel:](v19, "setInterruptionLevel:", 3);
    }
    v22 = sub_10008F56C();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v31 = 136315906;
      v32 = "-[W5UserNotificationManager dispatchNotificationWithTitle:subtitle:body:type:UUID:actionURL:]";
      v33 = 2080;
      v34 = "W5UserNotificationManager.m";
      v35 = 1024;
      v36 = 80;
      v37 = 2114;
      v38 = v19;
      v30 = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v23, 0, "[wifivelocity] %s (%s:%u) Generated User Notification: %{public}@", &v31, v30);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));
    v25 = objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:](UNNotificationRequest, "requestWithIdentifier:content:trigger:destinations:", v24, v19, 0, 7));

    v26 = sub_10008F56C();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v31 = 136315906;
      v32 = "-[W5UserNotificationManager dispatchNotificationWithTitle:subtitle:body:type:UUID:actionURL:]";
      v33 = 2080;
      v34 = "W5UserNotificationManager.m";
      v35 = 1024;
      v36 = 83;
      v37 = 2114;
      v38 = v25;
      LODWORD(v28) = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v27, 0, "[wifivelocity] %s (%s:%u) Queueing User Notification Request: %{public}@", &v31, v28);
    }

    -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_userNotificationCenter, "addNotificationRequest:withCompletionHandler:", v25, &stru_1000D5688);
  }
  else
  {
    v20 = sub_10008F56C();
    v19 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v31 = 136315650;
      v32 = "-[W5UserNotificationManager dispatchNotificationWithTitle:subtitle:body:type:UUID:actionURL:]";
      v33 = 2080;
      v34 = "W5UserNotificationManager.m";
      v35 = 1024;
      v36 = 58;
      v29 = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v19, 0, "[wifivelocity] %s (%s:%u) suppressing user notification on non-internal build", (const char *)&v31, v29);
    }
  }

}

- (void)removeNotificationWithUUID:(id)a3
{
  UNUserNotificationCenter *userNotificationCenter;
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    userNotificationCenter = self->_userNotificationCenter;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UUIDString"));
    v6 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
    -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:](userNotificationCenter, "removeDeliveredNotificationsWithIdentifiers:", v5);

  }
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void)setUserNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_userNotificationCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
}

@end
