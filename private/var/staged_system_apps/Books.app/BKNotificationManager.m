@implementation BKNotificationManager

- (void)getAuthorizationStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKNotificationManager center](self, "center"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000638E8;
  v7[3] = &unk_1008ED010;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getNotificationSettingsWithCompletionHandler:", v7);

}

- (BKNotificationManager)init
{
  BKNotificationManager *v2;
  uint64_t v3;
  NSMutableArray *reauthorizationCompletions;
  uint64_t v5;
  UNUserNotificationCenter *center;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UNUserNotificationCenter *v11;
  void *v12;
  UNUserNotificationCenter *v13;
  BKNotificationManager *v14;
  void *v15;
  _QWORD v17[4];
  BKNotificationManager *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)BKNotificationManager;
  v2 = -[BKNotificationManager init](&v19, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    reauthorizationCompletions = v2->_reauthorizationCompletions;
    v2->_reauthorizationCompletions = (NSMutableArray *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
    center = v2->_center;
    v2->_center = (UNUserNotificationCenter *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKAchievementsNotificationController categoryIdentifier](BKAchievementsNotificationController, "categoryIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:](UNNotificationCategory, "categoryWithIdentifier:actions:intentIdentifiers:options:", v7, &__NSArray0__struct, &__NSArray0__struct, 1));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationCategory YearInReviewNotificationCategoryIdentifier](UNNotificationCategory, "YearInReviewNotificationCategoryIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:](UNNotificationCategory, "categoryWithIdentifier:actions:intentIdentifiers:options:", v9, &__NSArray0__struct, &__NSArray0__struct, 1));

    v11 = v2->_center;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v10, 0));
    -[UNUserNotificationCenter setNotificationCategories:](v11, "setNotificationCategories:", v12);

    -[UNUserNotificationCenter setDelegate:](v2->_center, "setDelegate:", v2);
    v13 = v2->_center;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000A680;
    v17[3] = &unk_1008ECFC0;
    v14 = v2;
    v18 = v14;
    -[UNUserNotificationCenter getNotificationSettingsWithCompletionHandler:](v13, "getNotificationSettingsWithCompletionHandler:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "addObserver:selector:name:object:", v14, "_applicationWillEnterForeground:", UIApplicationWillEnterForegroundNotification, 0);

  }
  return v2;
}

- (UNUserNotificationCenter)center
{
  return self->_center;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063F38;
  block[3] = &unk_1008E7458;
  block[4] = a1;
  if (qword_1009F5138 != -1)
    dispatch_once(&qword_1009F5138, block);
  return (id)qword_1009F5140;
}

- (void)_applicationWillEnterForeground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKNotificationManager statusController](self, "statusController", a3));
  objc_msgSend(v4, "checkAndReportOptInStatus");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKNotificationManager reauthorizationCompletions](self, "reauthorizationCompletions"));
  if (objc_msgSend(v5, "count"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[BKNotificationManager] [Reauthorization] Returned from Settings app", buf, 2u);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[BKNotificationManager setReauthorizationCompletions:](self, "setReauthorizationCompletions:", v6);

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10016F6EC;
    v7[3] = &unk_1008E98D0;
    v7[4] = v5;
    -[BKNotificationManager getAuthorizationStatusWithCompletion:](self, "getAuthorizationStatusWithCompletion:", v7);
  }

}

- (void)getAuthorizationStatusWithCompletionValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKNotificationManager center](self, "center"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016F900;
  v7[3] = &unk_1008ECFC0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getNotificationSettingsWithCompletionHandler:", v7);

}

- (void)requestAuthorizationWithCompletionValue:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10016FA70;
  v5[3] = &unk_1008E77C8;
  v6 = a3;
  v4 = v6;
  -[BKNotificationManager requestAuthorizationWithCompletion:](self, "requestAuthorizationWithCompletion:", v5);

}

- (void)requestAuthorizationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKNotificationManager center](self, "center"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016FBDC;
  v7[3] = &unk_1008EA2C0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "requestAuthorizationWithOptions:completionHandler:", 38, v7);

}

- (void)requestReauthorizationWithCompletion:(id)a3
{
  id v3;
  _QWORD v4[4];
  BKNotificationManager *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10016FCD0;
  v4[3] = &unk_1008ECFE8;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[BKNotificationManager getAuthorizationStatusWithCompletion:](v5, "getAuthorizationStatusWithCompletion:", v4);

}

- (void)handleNotificationResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "notification"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "request"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "content"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "categoryIdentifier"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v7;
    v23 = 2112;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Processing incoming notification: %@, category ID: %@", buf, 0x16u);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKAchievementsNotificationController categoryIdentifier](BKAchievementsNotificationController, "categoryIdentifier"));
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionIdentifier"));
    v12 = objc_msgSend(v11, "isEqualToString:", UNNotificationDefaultActionIdentifier);

    if (v12)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
        *(_DWORD *)buf = 138412290;
        v22 = v13;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Requested to open achievement sheet: %@", buf, 0xCu);

      }
      -[BKNotificationManager _emitNotificationEngagementEventForResponse:](self, "_emitNotificationEngagementEventForResponse:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10017037C;
      v19[3] = &unk_1008ED038;
      v20 = v7;
      objc_msgSend(v14, "requestPrimaryOrBookScene:", v19);

    }
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationCategory YearInReviewNotificationCategoryIdentifier](UNNotificationCategory, "YearInReviewNotificationCategoryIdentifier"));
    v16 = objc_msgSend(v8, "isEqualToString:", v15);

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionIdentifier"));
      v18 = objc_msgSend(v17, "isEqualToString:", UNNotificationDefaultActionIdentifier);

      if (v18)
        +[JSAApplication openYearInReview](JSAApplication, "openYearInReview");
    }
    else if (objc_msgSend(v8, "isEqualToString:", BDSPriceTrackerNotificationCategoryIdentifier))
    {
      -[BKNotificationManager handlePriceTrackingNotificationResponse:content:](self, "handlePriceTrackingNotificationResponse:content:", v4, v7);
    }
  }

}

- (void)handlePriceTrackingNotificationResponse:(id)a3 content:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionIdentifier"));
  v8 = objc_msgSend(v7, "isEqualToString:", UNNotificationDefaultActionIdentifier);

  if ((v8 & 1) != 0)
  {
    v9 = objc_opt_class(NSString);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", BDSPriceTrackerNotificationDeepLinkURLKey));
    v12 = BUDynamicCast(v9, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v13));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412290;
        v17 = v14;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[PriceTracking] opening notification deep link URL %@...", (uint8_t *)&v16, 0xCu);
      }
      objc_msgSend(v15, "openURL:options:completionHandler:", v14, &__NSDictionary0__struct, &stru_1008ED058);

    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1006A2D18();
    }

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A2D5C(v5);
  }

}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  (*((void (**)(id, uint64_t))a5 + 2))(a5, 26);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  void (**v7)(void);

  v7 = (void (**)(void))a5;
  -[BKNotificationManager handleNotificationResponse:](self, "handleNotificationResponse:", a4);
  v7[2]();

}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  +[JSAApplication openNotificationSettingsPage](JSAApplication, "openNotificationSettingsPage", a3, a4);
}

- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v9 = CFSTR("settings");
  v10 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("UNUserNotificationCenterDidChangeSettings"), v6, v8);
}

- (void)_emitNotificationEngagementEventForResponse:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "notification"));
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "request"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "content"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKAchievementsNotificationController titleKeyFromNotificationUserInfo:](BKAchievementsNotificationController, "titleKeyFromNotificationUserInfo:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "body"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKAchievementsNotificationController messageKeyFromNotificationUserInfo:](BKAchievementsNotificationController, "messageKeyFromNotificationUserInfo:", v5));
  v9 = objc_msgSend(objc_alloc((Class)BANotificationData), "initWithNotificationContentID:notificationID:notificationType:recoType:goalType:titleCode:title:messageCode:message:", 0, v15, 2, 0, +[BKAchievementsNotificationController goalTypeFromNotificationUserInfo:](BKAchievementsNotificationController, "goalTypeFromNotificationUserInfo:", v5), v6, v16, v8, v7);
  v10 = objc_msgSend(objc_alloc((Class)BANotificationEngagementData), "initWithActionType:actionUrl:targetID:targetType:", 1, &stru_10091C438, &__NSArray0__struct, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "primaryAnalyticsController"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "applicationTracker"));
  objc_msgSend(v13, "emitNotificationEngagementEventWithTracker:engagementData:notificationData:", v14, v10, v9);

}

- (NSMutableArray)reauthorizationCompletions
{
  return self->_reauthorizationCompletions;
}

- (void)setReauthorizationCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_reauthorizationCompletions, a3);
}

- (void)setCenter:(id)a3
{
  objc_storeStrong((id *)&self->_center, a3);
}

- (BKNotificationOptInStatusController)statusController
{
  return self->_statusController;
}

- (void)setStatusController:(id)a3
{
  objc_storeStrong((id *)&self->_statusController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusController, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_reauthorizationCompletions, 0);
}

@end
