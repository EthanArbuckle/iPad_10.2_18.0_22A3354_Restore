@implementation STUConcreteUserNotificationPrimitives

- (void)dealloc
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteUserNotificationPrimitives notifications](self, "notifications"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "cancel");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)STUConcreteUserNotificationPrimitives;
  -[STUConcreteUserNotificationPrimitives dealloc](&v8, "dealloc");
}

- (STUConcreteUserNotificationPrimitives)initWithNotificationCenter:(id)a3
{
  id v5;
  STUConcreteUserNotificationPrimitives *v6;
  STUConcreteUserNotificationPrimitives *v7;
  uint64_t v8;
  NSHashTable *notifications;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STUConcreteUserNotificationPrimitives;
  v6 = -[STUConcreteUserNotificationPrimitives init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_notificationCenter, a3);
    -[UNUserNotificationCenter setDelegate:](v7->_notificationCenter, "setDelegate:", v7);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](v7->_notificationCenter, "setWantsNotificationResponsesDelivered");
    v8 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    notifications = v7->_notifications;
    v7->_notifications = (NSHashTable *)v8;

    -[STUConcreteUserNotificationPrimitives buildNotificationCategories](v7, "buildNotificationCategories");
  }

  return v7;
}

- (STUConcreteUserNotificationPrimitives)init
{
  id v3;
  STUConcreteUserNotificationPrimitives *v4;

  v3 = objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:queue:", CFSTR("com.apple.studentd.notifications"), &_dispatch_main_q);
  v4 = -[STUConcreteUserNotificationPrimitives initWithNotificationCenter:](self, "initWithNotificationCenter:", v3);

  return v4;
}

- (void)buildNotificationCategories
{
  void *v2;
  NSBundle *v3;
  void *v4;
  void *v5;
  void *v6;
  NSBundle *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:](UNNotificationCategory, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("com.apple.studentd.informative"), &__NSArray0__struct, &__NSArray0__struct, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationActionIcon iconWithSystemImageName:](UNNotificationActionIcon, "iconWithSystemImageName:", CFSTR("checkmark.circle")));
  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Accept"), &stru_1000CDD50, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationActionIcon iconWithSystemImageName:](UNNotificationActionIcon, "iconWithSystemImageName:", CFSTR("multiply.circle")));
  v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Decline"), &stru_1000CDD50, 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:icon:](UNNotificationAction, "actionWithIdentifier:title:options:icon:", CFSTR("com.apple.studentd.remote-connect.accept"), v5, 1, v16));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:icon:](UNNotificationAction, "actionWithIdentifier:title:options:icon:", CFSTR("com.apple.studentd.remote-connect.decline"), v9, 1, v6));
  v19[0] = v10;
  v19[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:](UNNotificationCategory, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("com.apple.studentd.remote-connect"), v12, &__NSArray0__struct, 0));

  v18[0] = v2;
  v18[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v14));
  -[UNUserNotificationCenter setNotificationCategories:](self->_notificationCenter, "setNotificationCategories:", v15);

}

- (id)postInformativeNotificationWithTitle:(id)a3 subtitle:(id)a4
{
  return -[STUConcreteUserNotificationPrimitives postNotificationWithTitle:subtitle:categoryIdentifier:cancelValue:sound:actionHandler:](self, "postNotificationWithTitle:subtitle:categoryIdentifier:cancelValue:sound:actionHandler:", a3, a4, CFSTR("com.apple.studentd.informative"), 0, 0, &stru_1000CA1F0);
}

- (id)postRemoteConnectionNotificationWithInstructorName:(id)a3 actionHandler:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  NSBundle *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = CRKIsOSX();
  v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v8)
    v12 = CFSTR("Allow control of your Mac");
  else
    v12 = CFSTR("Allow control of your iPad");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1000CDD50, 0));

  CRKIsOSX();
  v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("“%@” will be able to view your screen, open apps, and navigate to pages in Books and Safari."), &stru_1000CDD50, 0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v6));

  v18 = objc_msgSend((id)objc_opt_class(self), "makeRemoteAttendanceNotificationSound");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteUserNotificationPrimitives postNotificationWithTitle:subtitle:categoryIdentifier:cancelValue:sound:actionHandler:](self, "postNotificationWithTitle:subtitle:categoryIdentifier:cancelValue:sound:actionHandler:", v13, v17, CFSTR("com.apple.studentd.remote-connect"), 0, v19, v7));

  return v20;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _BYTE v21[128];

  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  v20 = -1;
  if ((objc_msgSend((id)objc_opt_class(self), "actionValueForResponse:action:", v7, &v20) & 1) != 0)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteUserNotificationPrimitives notifications](self, "notifications", 0));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v13), "receiveResponse:withValue:", v7, v20);
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v11);
    }

    v8[2](v8);
  }
  else
  {
    v14 = sub_100020FFC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10007B10C(v15);

  }
}

- (void)userNotificationWantsToDeregister:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteUserNotificationPrimitives notificationCenter](self, "notificationCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v12 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  objc_msgSend(v5, "removePendingNotificationRequestsWithIdentifiers:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteUserNotificationPrimitives notificationCenter](self, "notificationCenter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  v11 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  objc_msgSend(v8, "removeDeliveredNotificationsWithIdentifiers:", v10);

}

- (void)userNotificationWantsToReregister:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  STUConcreteUserNotificationPrimitives *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteUserNotificationPrimitives notificationCenter](self, "notificationCenter"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000211EC;
  v7[3] = &unk_1000CA268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "getDeliveredNotificationsWithCompletionHandler:", v7);

}

- (id)postNotificationWithTitle:(id)a3 subtitle:(id)a4 categoryIdentifier:(id)a5 cancelValue:(int64_t)a6 sound:(id)a7 actionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  STUConcreteUserNotification *v21;
  void *v22;
  UNMutableNotificationContent *v23;
  void *v24;
  void *v25;

  v14 = a8;
  v15 = a7;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = objc_msgSend((id)objc_opt_class(self), "makeNotificationIdentifierWithCategoryIdentifier:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = -[STUConcreteUserNotification initWithIdentifier:cancelValue:actionHandler:]([STUConcreteUserNotification alloc], "initWithIdentifier:cancelValue:actionHandler:", v20, a6, v14);

  -[STUConcreteUserNotification setDelegate:](v21, "setDelegate:", self);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteUserNotificationPrimitives notifications](self, "notifications"));
  objc_msgSend(v22, "addObject:", v21);

  v23 = objc_opt_new(UNMutableNotificationContent);
  -[UNMutableNotificationContent setTitle:](v23, "setTitle:", v18);

  -[UNMutableNotificationContent setBody:](v23, "setBody:", v17);
  -[UNMutableNotificationContent setShouldIgnoreDoNotDisturb:](v23, "setShouldIgnoreDoNotDisturb:", 0);
  -[UNMutableNotificationContent setCategoryIdentifier:](v23, "setCategoryIdentifier:", v16);

  -[UNMutableNotificationContent setSound:](v23, "setSound:", v15);
  -[UNMutableNotificationContent setShouldSuppressDefaultAction:](v23, "setShouldSuppressDefaultAction:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", v20, v23, 0));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteUserNotificationPrimitives notificationCenter](self, "notificationCenter"));
  objc_msgSend(v25, "addNotificationRequest:withCompletionHandler:", v24, &stru_1000CA2A8);

  return v21;
}

+ (BOOL)actionValueForResponse:(id)a3 action:(int64_t *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  BOOL v12;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "notification"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "request"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "content"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "categoryIdentifier"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionIdentifier"));
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.studentd.informative")) & 1) == 0)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.studentd.remote-connect")))
    {
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.studentd.remote-connect.accept")) & 1) != 0)
      {
        v11 = 1;
        goto LABEL_3;
      }
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.studentd.remote-connect.decline")))
      {
        v11 = 2;
        goto LABEL_3;
      }
    }
    v12 = 0;
    goto LABEL_10;
  }
  v11 = 0;
LABEL_3:
  *a4 = v11;
  v12 = 1;
LABEL_10:

  return v12;
}

+ (id)makeNotificationIdentifierWithCategoryIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v3, v4));

  return v5;
}

+ (id)makeRemoteAttendanceNotificationSound
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UNMutableNotificationSound soundWithAlertType:](UNMutableNotificationSound, "soundWithAlertType:", 2));
  objc_msgSend(v2, "setShouldRepeat:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentToneIdentifierForAlertType:topic:", 28, CFSTR("Classroom")));
  objc_msgSend(v2, "setToneIdentifier:", v4);
  v5 = objc_msgSend(v2, "copy");

  return v5;
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (NSHashTable)notifications
{
  return self->_notifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end
