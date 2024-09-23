@implementation BKWelcomeNotificationWarmingItem

- (void)requestAuthorizationFromAMS
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  id v9;

  if (!-[BKWelcomeNotificationWarmingItem featureEnabled](self, "featureEnabled"))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[BKNotificationManager sharedInstance](BKNotificationManager, "sharedInstance"));
    objc_msgSend(v9, "requestAuthorizationWithCompletion:", 0);
    goto LABEL_6;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults bu_groupUserDefaults](NSUserDefaults, "bu_groupUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("BKWelcomeNotificationWarmingItem.warmingSheetShown"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = objc_msgSend(v5, "launchedToTest");

  if ((v4 & 1) == 0 && (v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSUserNotificationAuthorizationTask engagementRequestForFullSheet](AMSUserNotificationAuthorizationTask, "engagementRequestForFullSheet"));
    -[BKWelcomeNotificationWarmingItem setNotificationAuthorizationPromise:](self, "setNotificationAuthorizationPromise:", v7);

    v9 = (id)objc_claimAutoreleasedReturnValue(-[BKWelcomeNotificationWarmingItem notificationAuthorizationPromise](self, "notificationAuthorizationPromise"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "continueWithBlock:", &stru_1008EAB00));
    -[BKWelcomeNotificationWarmingItem setNotificationAuthorizationPromise:](self, "setNotificationAuthorizationPromise:", v8);

LABEL_6:
  }
}

- (BKWelcomeNotificationWarmingItem)init
{
  BKWelcomeNotificationWarmingItem *v2;
  BKWelcomeNotificationWarmingItem *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKWelcomeNotificationWarmingItem;
  v2 = -[BKWelcomeNotificationWarmingItem init](&v5, "init");
  v3 = v2;
  if (v2)
    -[BKWelcomeNotificationWarmingItem requestAuthorizationFromAMS](v2, "requestAuthorizationFromAMS");
  return v3;
}

- (BOOL)featureEnabled
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults bu_groupUserDefaults](NSUserDefaults, "bu_groupUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("BKDisableNotificationWarmingSheet")) ^ 1;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolveNotificationAuthorizationPromiseNextRetry, 0);
  objc_storeStrong((id *)&self->_notificationAuthorizationPromise, 0);
}

- (id)resolveNotificationAuthorizationPromise
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v20;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeNotificationWarmingItem resolveNotificationAuthorizationPromiseNextRetry](self, "resolveNotificationAuthorizationPromiseNextRetry"));
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = v4;

  if (v5 <= 0.0)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[BKWelcomeNotificationWarmingItem notificationAuthorizationPromise](self, "notificationAuthorizationPromise"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v20 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject resultWithTimeout:error:](v9, "resultWithTimeout:error:", &v20, 5.0));
    v12 = v20;
    v13 = objc_msgSend(v11, "timeIntervalSinceNow");
    if (!v10 && v12 && v15 <= -5.0)
    {
      v16 = BSUIWelcomeScreenLog(v13, v14);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_1006A0058(v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 3.0));
      -[BKWelcomeNotificationWarmingItem setResolveNotificationAuthorizationPromiseNextRetry:](self, "setResolveNotificationAuthorizationPromiseNextRetry:", v18);

    }
  }
  else
  {
    v8 = BSUIWelcomeScreenLog(v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "A recent attempt to resolve the authorization status promise timed out. Assuming we still can't resolve it.", buf, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (BOOL)welcomeScreenShouldShow
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  int v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeNotificationWarmingItem resolveNotificationAuthorizationPromise](self, "resolveNotificationAuthorizationPromise"));
  v4 = 0;
  if (-[BKWelcomeNotificationWarmingItem featureEnabled](self, "featureEnabled") && v3)
  {
    if (objc_msgSend(v3, "authorizationStatus"))
    {
      v4 = 0;
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "request"));
      v4 = v5 != 0;

    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults bu_groupUserDefaults](NSUserDefaults, "bu_groupUserDefaults"));
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("BKWelcomeNotificationWarmingItem.warmingSheetShown"));

  v10 = BSUIWelcomeScreenLog(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
      v12 = CFSTR("Yes");
    else
      v12 = CFSTR("No");
    if (-[BKWelcomeNotificationWarmingItem featureEnabled](self, "featureEnabled"))
      v13 = CFSTR("Yes");
    else
      v13 = CFSTR("No");
    if (objc_msgSend(v3, "authorizationStatus"))
      v14 = CFSTR("No");
    else
      v14 = CFSTR("Yes");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "request"));
    v18 = 138544130;
    if (v15)
      v16 = CFSTR("Yes");
    else
      v16 = CFSTR("No");
    v19 = v12;
    v20 = 2114;
    v21 = v13;
    v22 = 2114;
    v23 = v14;
    v24 = 2114;
    v25 = v16;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "should display notification warming sheet: Already showed it in the past? %{public}@; Feature Enabled: %{public}@ "
      "; Authorization status is undertermined: %{public}@; Got a AMSEngagementRequest back: %{public}@; ",
      (uint8_t *)&v18,
      0x2Au);

  }
  return v4;
}

- (BOOL)welcomeScreenShouldDisplayNavigationBar
{
  return 1;
}

- (id)welcomeScreenViewControllerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  if (-[BKWelcomeNotificationWarmingItem featureEnabled](self, "featureEnabled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeNotificationWarmingItem resolveNotificationAuthorizationPromise](self, "resolveNotificationAuthorizationPromise"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "request"));
    objc_msgSend(v6, "setMetricsOverlay:", &off_10092F430);
    v7 = objc_alloc((Class)AMSUIEngagementTaskViewController);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
    v9 = objc_msgSend(v7, "initWithRequest:bag:", v6, v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startEngagement"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000F097C;
    v12[3] = &unk_1008EAB28;
    v13 = v4;
    objc_msgSend(v10, "addFinishBlock:", v12);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (AMSPromise)notificationAuthorizationPromise
{
  return self->_notificationAuthorizationPromise;
}

- (void)setNotificationAuthorizationPromise:(id)a3
{
  objc_storeStrong((id *)&self->_notificationAuthorizationPromise, a3);
}

- (NSDate)resolveNotificationAuthorizationPromiseNextRetry
{
  return self->_resolveNotificationAuthorizationPromiseNextRetry;
}

- (void)setResolveNotificationAuthorizationPromiseNextRetry:(id)a3
{
  objc_storeStrong((id *)&self->_resolveNotificationAuthorizationPromiseNextRetry, a3);
}

@end
