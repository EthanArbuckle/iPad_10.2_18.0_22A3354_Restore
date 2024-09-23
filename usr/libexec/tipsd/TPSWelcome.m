@implementation TPSWelcome

- (BOOL)stopWelcomeNotification
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v11[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("TPSCurrentWelcomeXPCActivityIdentifier")));
  v5 = v4;
  if (v4)
    xpc_activity_unregister((const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  v6 = -[TPSWelcome shouldShowWelcomeNotification](self, "shouldShowWelcomeNotification");
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[TPSLogger welcome](TPSLogger, "welcome"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Stop any welcome reminder flow.", v11, 2u);
    }

  }
  objc_msgSend(v3, "setObject:forKey:", &off_100021B98, CFSTR("TPSWelcomeNotificationReminderState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "majorVersion"));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("TPSWelcomeNotificationViewedVersion"));

  objc_msgSend(v3, "removeObjectForKey:", CFSTR("TPSWaitingToShowWelcomeNotification"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("TPSCurrentWelcomeXPCActivityIdentifier"));
  objc_msgSend(v3, "synchronize");

  return v6;
}

- (BOOL)shouldShowWelcomeNotification
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned int v8;
  int v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  void *v14;
  uint8_t v15[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("TPSWelcomeNotificationViewedVersion")));
  v5 = objc_msgSend(v4, "intValue");

  if ((v5 & 0x80000000) != 0)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "majorVersion"));
  v8 = objc_msgSend(v7, "intValue");

  if (v5 != v8)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[TPSLogger welcome](TPSLogger, "welcome"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Major version changed", v15, 2u);
    }

    objc_msgSend(v2, "setObject:forKey:", &off_100021B68, CFSTR("TPSWelcomeNotificationViewedVersion"));
    objc_msgSend(v2, "setObject:forKey:", &off_100021B80, CFSTR("TPSWelcomeNotificationReminderState"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("TPSNoMoreTipsContent"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("TPSWaitingToShowWelcomeNotification"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("TPSCurrentWelcomeXPCActivityIdentifier"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("TPSWelcomeNotificationStartDate"));
    objc_msgSend(v2, "synchronize");
    goto LABEL_7;
  }
  v9 = 1;
LABEL_8:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TPSDefaultsManager notificationDocument](TPSDefaultsManager, "notificationDocument"));

  if (v11
    || ((v9 | +[TPSNotificationController supportsWelcomeNotification](TPSNotificationController, "supportsWelcomeNotification") ^ 1) & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("TPSWelcomeNotificationReminderState")));
    v12 = objc_msgSend(v14, "unsignedIntegerValue") == 0;

  }
  return v12;
}

+ (void)resetWelcomeNotifications
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setObject:forKey:", &off_100021B50, CFSTR("TPSWelcomeNotificationViewedVersion"));
  objc_msgSend(v4, "synchronize");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "appGroupDefaults"));

  objc_msgSend(v3, "removeObjectForKey:", CFSTR("collectionStatusMap"));
  objc_msgSend(v3, "synchronize");

}

- (TPSWelcome)initWithDelegate:(id)a3 tipsManager:(id)a4 notificationController:(id)a5
{
  id v8;
  id v9;
  id v10;
  TPSWelcome *v11;
  TPSWelcome *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TPSWelcome;
  v11 = -[TPSWelcome init](&v17, "init");
  v12 = v11;
  if (v11)
  {
    -[TPSWelcome setDelegate:](v11, "setDelegate:", v8);
    objc_storeStrong((id *)&v12->_tipsManager, a4);
    objc_storeStrong((id *)&v12->_notificationController, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    if (+[TPSDefaultsManager resetDaemonData](TPSDefaultsManager, "resetDaemonData"))
    {
      objc_msgSend(v13, "setObject:forKey:", &off_100021B50, CFSTR("TPSWelcomeNotificationViewedVersion"));
      objc_msgSend(v13, "removeObjectForKey:", CFSTR("TPSWelcomeNotificationReminderState"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "appGroupDefaults"));

      objc_msgSend(v15, "removeObjectForKey:", CFSTR("collectionStatusMap"));
    }

  }
  return v12;
}

- (unint64_t)reminderState
{
  void *v2;
  void *v3;
  id v4;

  if (!+[TPSNotificationController supportsWelcomeNotification](TPSNotificationController, "supportsWelcomeNotification"))return 1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("TPSWelcomeNotificationReminderState")));
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return (unint64_t)v4;
}

- (void)reconnectWelcomeIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  const char *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v3 = a3;
  if (-[TPSWelcome shouldShowWelcomeNotification](self, "shouldShowWelcomeNotification")
    && -[TPSWelcome setupCompleted](self, "setupCompleted"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    if (objc_msgSend(v5, "BOOLForKey:", CFSTR("TPSWaitingToShowWelcomeNotification")))
    {
      -[TPSWelcome registerToNotifyWelcome](self, "registerToNotifyWelcome");
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("TPSCurrentWelcomeXPCActivityIdentifier")));
      if (v6 && !-[TPSWelcome welcomeXPCActivityScheduleInProgress](self, "welcomeXPCActivityScheduleInProgress"))
      {
        v7 = objc_claimAutoreleasedReturnValue(+[TPSLogger welcome](TPSLogger, "welcome"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Re-register for xpc_activity to show welcome notification", buf, 2u);
        }

        -[TPSWelcome setWelcomeXPCActivityScheduleInProgress:](self, "setWelcomeXPCActivityScheduleInProgress:", 1);
        v8 = objc_retainAutorelease(v6);
        v9 = (const char *)objc_msgSend(v8, "UTF8String");
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_10000758C;
        v10[3] = &unk_100020968;
        v10[4] = self;
        v11 = v8;
        xpc_activity_register(v9, XPC_ACTIVITY_CHECK_IN, v10);

      }
      else if (v3)
      {
        -[TPSWelcome scheduleWelcomeNotificationActivity](self, "scheduleWelcomeNotificationActivity");
      }

    }
  }
}

- (BOOL)isReminderCompleted
{
  return (id)-[TPSWelcome reminderState](self, "reminderState") == (id)1;
}

- (id)getCurrentWelcomeActivityCriteria
{
  xpc_object_t v2;
  double v3;
  int64_t v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  int64_t v13;
  int64_t v14;

  v2 = xpc_dictionary_create(0, 0, 0);
  +[TPSDefaultsManager welcomeNotificationDelay](TPSDefaultsManager, "welcomeNotificationDelay");
  if ((uint64_t)v3 >= 1)
    v4 = (uint64_t)v3;
  else
    v4 = 3 * XPC_ACTIVITY_INTERVAL_1_HOUR;
  +[TPSDefaultsManager welcomeNotificationGracePeriod](TPSDefaultsManager, "welcomeNotificationGracePeriod");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("TPSWelcomeNotificationStartDate")));

  v9 = objc_opt_class(NSDate);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v10, "timeIntervalSinceDate:", v8);
    v12 = v11;

    v4 = (uint64_t)((double)v4 - v12);
  }
  if ((uint64_t)v6 >= 1)
    v13 = (uint64_t)v6;
  else
    v13 = 2 * XPC_ACTIVITY_INTERVAL_1_HOUR;
  if (v4 >= 1)
    v14 = v4;
  else
    v14 = XPC_ACTIVITY_INTERVAL_30_MIN;
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_DELAY, v14);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_GRACE_PERIOD, v13);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);

  return v2;
}

- (void)scheduleWelcomeNotificationActivity
{
  void *v3;
  unsigned int v4;
  unsigned int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v8[16];
  uint8_t buf[16];

  if (!-[TPSWelcome reminderState](self, "reminderState")
    && !-[TPSWelcome welcomeXPCActivityScheduleInProgress](self, "welcomeXPCActivityScheduleInProgress")
    && -[TPSWelcome shouldShowWelcomeNotification](self, "shouldShowWelcomeNotification"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("TPSWaitingToShowWelcomeNotification"));

    if (v4)
    {
      -[TPSWelcome registerToNotifyWelcome](self, "registerToNotifyWelcome");
    }
    else
    {
      v5 = -[TPSWelcome setupCompleted](self, "setupCompleted");
      v6 = objc_claimAutoreleasedReturnValue(+[TPSLogger welcome](TPSLogger, "welcome"));
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v7)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User is not in setup, proceed to schedule welcome notification", buf, 2u);
        }

        -[TPSWelcome createWelcomeXPCActivity](self, "createWelcomeXPCActivity");
      }
      else
      {
        if (v7)
        {
          *(_WORD *)v8 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User currently in Setup, wait before registering for welcome notification", v8, 2u);
        }

      }
    }
  }
}

- (void)createWelcomeXPCActivity
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  TPSWelcome *v12;

  if (!-[TPSWelcome welcomeXPCActivityScheduleInProgress](self, "welcomeXPCActivityScheduleInProgress")
    && -[TPSWelcome shouldShowWelcomeNotification](self, "shouldShowWelcomeNotification"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("TPSCurrentWelcomeXPCActivityIdentifier")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("TPSWelcomeNotificationReminderState")));
    v6 = (int)objc_msgSend(v5, "intValue");

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.tipsd.showWelcomeNotification.reminderCount-%zd"), v6));
    if (objc_msgSend(v7, "isEqualToString:", v4))
    {
      -[TPSWelcome reconnectWelcomeIfNeeded:](self, "reconnectWelcomeIfNeeded:", 0);
    }
    else
    {
      -[TPSWelcome setWelcomeXPCActivityScheduleInProgress:](self, "setWelcomeXPCActivityScheduleInProgress:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSWelcome delegate](self, "delegate"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100007BDC;
      v9[3] = &unk_1000209B8;
      v10 = v3;
      v11 = v7;
      v12 = self;
      objc_msgSend(v8, "welcome:contentAvailableRemotelyWithCompletionHandler:", self, v9);

    }
  }
}

- (BOOL)setupCompleted
{
  int HasCompletedInitialRun;

  HasCompletedInitialRun = BYSetupAssistantHasCompletedInitialRun(self, a2);
  if (HasCompletedInitialRun)
    LOBYTE(HasCompletedInitialRun) = BYSetupAssistantNeedsToRun() ^ 1;
  return HasCompletedInitialRun;
}

- (void)registerToNotifyWelcome
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  if (-[TPSWelcome setupCompleted](self, "setupCompleted"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    if (-[TPSWelcome shouldShowWelcomeNotification](self, "shouldShowWelcomeNotification"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSWelcome tipsManager](self, "tipsManager"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "welcomeDocumentFromContentPackage:", 0));

      if (v5)
      {
        if ((objc_msgSend(v3, "BOOLForKey:", CFSTR("TPSWaitingToShowWelcomeNotification")) & 1) == 0)
        {
          objc_msgSend(v3, "setBool:forKey:", 1, CFSTR("TPSWaitingToShowWelcomeNotification"));
          objc_msgSend(v3, "synchronize");
        }
        v6 = objc_claimAutoreleasedReturnValue(+[TPSLogger welcome](TPSLogger, "welcome"));
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Register for empty lock screen for welcome notification", v8, 2u);
        }

        v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSWelcome delegate](self, "delegate"));
        objc_msgSend(v7, "welcome:notifyWelcomeDocument:", self, v5);

      }
    }
    else
    {
      objc_msgSend(v3, "setBool:forKey:", 0, CFSTR("TPSWaitingToShowWelcomeNotification"));
      objc_msgSend(v3, "synchronize");
    }

  }
}

- (void)welcomeNotificationDisplayed
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v3 = -[TPSWelcome reminderState](self, "reminderState");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setBool:forKey:", 0, CFSTR("TPSWaitingToShowWelcomeNotification"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v3 + 1));
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("TPSWelcomeNotificationReminderState"));

  v7 = objc_claimAutoreleasedReturnValue(+[TPSLogger welcome](TPSLogger, "welcome"));
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v3 == -1)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Schedule welcome notification", buf, 2u);
    }

    -[TPSWelcome scheduleWelcomeNotificationActivity](self, "scheduleWelcomeNotificationActivity");
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notification reminder ended", v15, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("TPSCurrentWelcomeXPCActivityIdentifier"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "majorVersion"));
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("TPSWelcomeNotificationViewedVersion"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v13, "synchronize");

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v14, "synchronize");

}

- (TPSWelcomeDelegate)delegate
{
  return (TPSWelcomeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)welcomeXPCActivityScheduleInProgress
{
  return self->_welcomeXPCActivityScheduleInProgress;
}

- (void)setWelcomeXPCActivityScheduleInProgress:(BOOL)a3
{
  self->_welcomeXPCActivityScheduleInProgress = a3;
}

- (TPSTipsManager)tipsManager
{
  return self->_tipsManager;
}

- (void)setTipsManager:(id)a3
{
  objc_storeStrong((id *)&self->_tipsManager, a3);
}

- (TPSNotificationController)notificationController
{
  return self->_notificationController;
}

- (void)setNotificationController:(id)a3
{
  objc_storeStrong((id *)&self->_notificationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationController, 0);
  objc_storeStrong((id *)&self->_tipsManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
