@implementation MRBaseComponentHandler

- (MRBaseComponentHandler)init
{
  char *v2;
  char *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  unsigned __int8 has_internal_content;
  double v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  dispatch_queue_t v19;
  void *v20;
  objc_super v22;
  uint8_t buf[4];
  uint64_t v24;

  v22.receiver = self;
  v22.super_class = (Class)MRBaseComponentHandler;
  v2 = -[MRBaseComponentHandler init](&v22, "init");
  v3 = v2;
  if (v2)
  {
    v2[21] = 0;
    *(_DWORD *)(v2 + 17) = 0;
    v4 = (void *)*((_QWORD *)v2 + 24);
    *((_QWORD *)v2 + 24) = 0;

    *(_QWORD *)(v3 + 28) = 0xF00000005;
    *((_WORD *)v3 + 11) = 1;
    v3[16] = 1;
    v5 = (void *)*((_QWORD *)v3 + 27);
    *((_QWORD *)v3 + 27) = 0;

    v3[24] = 0;
    v6 = (void *)*((_QWORD *)v3 + 20);
    *((_QWORD *)v3 + 20) = 0;

    v7 = (void *)*((_QWORD *)v3 + 29);
    *((_QWORD *)v3 + 29) = 0;

    v8 = (void *)*((_QWORD *)v3 + 31);
    *((_QWORD *)v3 + 31) = 0;

    v9 = (void *)*((_QWORD *)v3 + 30);
    *((_QWORD *)v3 + 30) = 0;

    v10 = (void *)MGCopyAnswer(CFSTR("DeviceClassNumber"), 0);
    *((_DWORD *)v3 + 9) = objc_msgSend(v10, "intValue");

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v11, "doubleForKey:", CFSTR("timeIntervalOverride"));
    v13 = v12;

    has_internal_content = os_variant_has_internal_content("com.apple.mobilerepaird");
    v15 = (double)XPC_ACTIVITY_INTERVAL_1_DAY;
    if ((has_internal_content & (v13 != 0.0)) != 0)
      v15 = v13;
    *((double *)v3 + 22) = v15;
    v16 = handleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *((_QWORD *)v3 + 22);
      *(_DWORD *)buf = 134217984;
      v24 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "the XPC time internal will be %f", buf, 0xCu);
    }

    v19 = dispatch_queue_create("com.apple.mobilerepaird.asyncqueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    v20 = (void *)*((_QWORD *)v3 + 1);
    *((_QWORD *)v3 + 1) = v19;

  }
  return (MRBaseComponentHandler *)v3;
}

- (void)createRepairFollowUp
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  const char *v13;

  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
    *(_DWORD *)buf = 138412546;
    v11 = v5;
    v12 = 2080;
    v13 = "-[MRBaseComponentHandler createRepairFollowUp]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);

  }
  if (self->displayFollowup)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[MRUINotificationHelper sharedSingleton](MRUINotificationHelper, "sharedSingleton"));
    -[NSObject createRepairFollowUpWithNotification:actionURL:repairTitle:infoText:itemID:timeInterval:componentName:](v6, "createRepairFollowUpWithNotification:actionURL:repairTitle:infoText:itemID:timeInterval:componentName:", self->displayNotification, self->linkedSensitiveURL, self->popUpNotificationTitle, self->followUpInfoMessage, self->componentFollowupClientID, self->componentName, self->timeIntervalOverride);
  }
  else
  {
    v7 = handleForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
      v9 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] followup skipped"), "-[MRBaseComponentHandler createRepairFollowUp]"));
      *(_DWORD *)buf = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

    }
  }

}

- (void)createFinishRepairFollowUpWithNotification:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const char *v19;

  v3 = a3;
  v5 = handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
    *(_DWORD *)buf = 138412546;
    v17 = v7;
    v18 = 2080;
    v19 = "-[MRBaseComponentHandler createFinishRepairFollowUpWithNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);

  }
  if (self->displayFollowup)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MRUINotificationHelper sharedSingleton](MRUINotificationHelper, "sharedSingleton"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("prefs:root=General&path=About/MAIN_PARTS_AND_SERVICE")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler finishRepairTitle](self, "finishRepairTitle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler finishRepairMessage](self, "finishRepairMessage"));
    -[NSObject createRepairFollowUpWithNotification:actionURL:repairTitle:infoText:itemID:timeInterval:componentName:](v8, "createRepairFollowUpWithNotification:actionURL:repairTitle:infoText:itemID:timeInterval:componentName:", v3, v10, v11, v12, self->finishRepairKey, self->componentName, 0.0);

  }
  else
  {
    v13 = handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
      v15 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] followup skipped"), "-[MRBaseComponentHandler createFinishRepairFollowUpWithNotification:]"));
      *(_DWORD *)buf = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

    }
  }

}

- (void)clearRepairFollowUp
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSString *finishRepairKey;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const char *v14;

  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
    *(_DWORD *)buf = 138412546;
    v12 = v5;
    v13 = 2080;
    v14 = "-[MRBaseComponentHandler clearRepairFollowUp]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRUINotificationHelper sharedSingleton](MRUINotificationHelper, "sharedSingleton"));
  objc_msgSend(v6, "clearRepairFollowUpForClientID:", self->componentFollowupClientID);

  if (self->finishRepairKey)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRUINotificationHelper sharedSingleton](MRUINotificationHelper, "sharedSingleton"));
    objc_msgSend(v7, "clearRepairFollowUpForClientID:", self->finishRepairKey);

    v8 = objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:", CFSTR("com.apple.Preferences"));
    finishRepairKey = self->finishRepairKey;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &finishRepairKey, 1));
    objc_msgSend(v8, "removeDeliveredNotificationsWithIdentifiers:", v9);

  }
}

- (BOOL)clearStateFile:(BOOL *)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  NSString *stateFilePath;
  unsigned __int8 v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  BOOL v16;
  void *v18;
  NSString *v19;
  void *v20;
  char *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const char *v26;

  v5 = handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
    *(_DWORD *)buf = 138412546;
    v24 = v7;
    v25 = 2080;
    v26 = "-[MRBaseComponentHandler clearStateFile:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = objc_msgSend(v8, "fileExistsAtPath:", self->stateFilePath);

  if (!v9)
  {
    v13 = 0;
LABEL_10:
    v16 = 1;
    if (!a3)
      goto LABEL_12;
LABEL_11:
    *a3 = v9;
    goto LABEL_12;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  stateFilePath = self->stateFilePath;
  v22 = 0;
  v12 = objc_msgSend(v10, "removeItemAtPath:error:", stateFilePath, &v22);
  v13 = v22;

  if ((v12 & 1) != 0)
    goto LABEL_10;
  v14 = handleForCategory(1);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
    v19 = self->stateFilePath;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
    v21 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("remove item at path %@ failed: %@"), v19, v20));
    *(_DWORD *)buf = 138412546;
    v24 = v18;
    v25 = 2112;
    v26 = v21;
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[%@][%@]", buf, 0x16u);

  }
  v16 = 0;
  if (a3)
    goto LABEL_11;
LABEL_12:

  return v16;
}

- (void)clearNSUserDefaults
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  __int16 v10;
  const char *v11;

  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
    v8 = 138412546;
    v9 = v5;
    v10 = 2080;
    v11 = "-[MRBaseComponentHandler clearNSUserDefaults]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%@][%s]", (uint8_t *)&v8, 0x16u);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "removeObjectForKey:", self->componentUnLockCheckCountKey);
  objc_msgSend(v6, "removeObjectForKey:", self->componentLastCheckTimeKey);
  objc_msgSend(v6, "removeObjectForKey:", self->componentHasDisplayedFollowUpKey);
  objc_msgSend(v6, "removeObjectForKey:", self->componentFirstUIDisplayedTimeKey);
  objc_msgSend(v6, "removeObjectForKey:", self->componentSUCaseKey);
  objc_msgSend(v6, "removeObjectForKey:", self->componentRetriggerCountKey);
  if (self->componentHasNotifiedServerKey)
    objc_msgSend(v6, "removeObjectForKey:");
  objc_msgSend(v6, "removeObjectForKey:", self->finishRepairKey);
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("hasDisplayedFollowupForBluetooth"));
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("hasDisplayedFollowupForWifi"));
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("hasDisplayedFollowupForBaseband"));
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("hasDisplayedFollowupForNFC"));
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("hasDisplayedFollowupForUWB"));
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("hasDisplayedFollowupForAudio"));
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("hasDisplayedFollowupForTrueDepthIR"));
  objc_msgSend(v6, "synchronize");
  v7 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
  objc_msgSend(v7, "removeObjectForKey:", self->componentFollowupClientID);

  -[MRBaseComponentHandler clearStateFile:](self, "clearStateFile:", 0);
}

- (void)popUpNotificationNowWithMessage
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  char *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  const char *v15;

  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
    *(_DWORD *)buf = 138412546;
    v13 = v5;
    v14 = 2080;
    v15 = "-[MRBaseComponentHandler popUpNotificationNowWithMessage]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);

  }
  if (!-[MRBaseComponentHandler displayModalPopup](self, "displayModalPopup"))
  {
    v9 = handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
      v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] SU case skipped popup"), "-[MRBaseComponentHandler popUpNotificationNowWithMessage]"));
      *(_DWORD *)buf = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

    }
    goto LABEL_9;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("settingsView"));

  if (!v7 || self->legacyPopup)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MRUINotificationHelper sharedSingleton](MRUINotificationHelper, "sharedSingleton"));
    -[NSObject popUpNotificationNowWithMessage:title:openSensitiveURL:componentName:legacyPopup:](v8, "popUpNotificationNowWithMessage:title:openSensitiveURL:componentName:legacyPopup:", self->popUpNotificationMessage, self->popUpNotificationTitle, self->linkedSensitiveURL, self->componentName, self->legacyPopup);
LABEL_9:

  }
}

- (void)scheduleNetworkActivity
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  _QWORD handler[5];
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  const char *v11;

  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
    *(_DWORD *)buf = 138412546;
    v9 = v5;
    v10 = 2080;
    v11 = "-[MRBaseComponentHandler scheduleNetworkActivity]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);

  }
  v6 = -[NSString UTF8String](self->componentNtwkActivityName, "UTF8String");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100006EF0;
  handler[3] = &unk_100018620;
  handler[4] = self;
  xpc_activity_register(v6, XPC_ACTIVITY_CHECK_IN, handler);
}

- (void)unlockCheckerActivityBody
{
  void *v3;
  void *v4;
  char *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double timeIntervalOverride;
  void *v15;
  char *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  char *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  char v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentUnLockCheckCountKey](self, "componentUnLockCheckCountKey"));
  v5 = (char *)objc_msgSend(v3, "integerForKey:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentHasNotifiedServerKey](self, "componentHasNotifiedServerKey"));
  v7 = objc_msgSend(v3, "BOOLForKey:", v6);

  if ((objc_msgSend(v3, "BOOLForKey:", self->componentDataCollectionPresentedKey) & 1) != 0)
    v8 = 1;
  else
    v8 = !-[MRBaseComponentHandler notifyServer](self, "notifyServer");
  v48 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v9, "timeIntervalSince1970");
  v11 = v10;

  objc_msgSend(v3, "doubleForKey:", self->componentLastCheckTimeKey);
  v13 = (double)(uint64_t)(v11 - v12);
  if (self->timeIntervalOverride <= v13)
    timeIntervalOverride = v13;
  else
    timeIntervalOverride = self->timeIntervalOverride;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentRetriggerCountKey](self, "componentRetriggerCountKey"));
  v16 = (char *)objc_msgSend(v3, "integerForKey:", v15);

  v17 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
  v18 = objc_msgSend(v17, "integerForKey:", self->componentFollowupClientID);

  if ((uint64_t)v5 < -[MRBaseComponentHandler componentfollowUpDisplaydays](self, "componentfollowUpDisplaydays"))
  {
    ++v5;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentUnLockCheckCountKey](self, "componentUnLockCheckCountKey"));
    objc_msgSend(v3, "setInteger:forKey:", v5, v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentLastCheckTimeKey](self, "componentLastCheckTimeKey"));
    objc_msgSend(v3, "setDouble:forKey:", v20, v11);

    objc_msgSend(v3, "synchronize");
  }
  v21 = handleForCategory(0);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Set count main body:%ld"), v5));
    *(_DWORD *)buf = 138412546;
    v50 = v23;
    v51 = 2112;
    v52 = v24;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

  }
  if (!-[MRBaseComponentHandler isSUCaseForComponent](self, "isSUCaseForComponent"))
  {
    if (v5 == (char *)-[MRBaseComponentHandler componentFollowupRetriggerdays](self, "componentFollowupRetriggerdays"))
    {
      v31 = handleForCategory(0);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] handling followup without notification"), "-[MRBaseComponentHandler unlockCheckerActivityBody]"));
        *(_DWORD *)buf = 138412546;
        v50 = v33;
        v51 = 2112;
        v52 = v34;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

      }
      -[MRBaseComponentHandler clearRepairFollowUp](self, "clearRepairFollowUp");
      -[MRBaseComponentHandler setDisplayNotification:](self, "setDisplayNotification:", 0);
      -[MRBaseComponentHandler createRepairFollowUp](self, "createRepairFollowUp");
    }
    else
    {
      if (v5 != (char *)-[MRBaseComponentHandler componentfollowUpDisplaydays](self, "componentfollowUpDisplaydays"))
        goto LABEL_30;
      v35 = handleForCategory(0);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] handling clear all followup"), "-[MRBaseComponentHandler unlockCheckerActivityBody]"));
        *(_DWORD *)buf = 138412546;
        v50 = v37;
        v51 = 2112;
        v52 = v38;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

      }
      -[MRBaseComponentHandler clearRepairFollowUp](self, "clearRepairFollowUp");
      -[MRBaseComponentHandler clearStateFile:](self, "clearStateFile:", 0);
    }
    v30 = v5;
    goto LABEL_29;
  }
  if ((uint64_t)v5 >= -[MRBaseComponentHandler componentfollowUpDisplaydays](self, "componentfollowUpDisplaydays"))
    v25 = v8;
  else
    v25 = 0;
  if (v25 == 1)
  {
    v26 = handleForCategory(0);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] SU handling clear all followup"), "-[MRBaseComponentHandler unlockCheckerActivityBody]"));
      *(_DWORD *)buf = 138412546;
      v50 = v28;
      v51 = 2112;
      v52 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

    }
    -[MRBaseComponentHandler clearRepairFollowUp](self, "clearRepairFollowUp");
    -[MRBaseComponentHandler clearStateFile:](self, "clearStateFile:", &v48);
    if (v48)
    {
      v30 = (char *)-[MRBaseComponentHandler componentfollowUpDisplaydays](self, "componentfollowUpDisplaydays");
LABEL_29:
      -[MRBaseComponentHandler sendAnalyticsForCount:](self, "sendAnalyticsForCount:", v30);
    }
  }
LABEL_30:
  if (v18)
  {
    if ((uint64_t)v16 <= -[MRBaseComponentHandler componentFollowupRetriggerdays](self, "componentFollowupRetriggerdays"))
    {
      ++v16;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentRetriggerCountKey](self, "componentRetriggerCountKey"));
      objc_msgSend(v3, "setInteger:forKey:", v16, v39);

    }
    if (v16 == (char *)-[MRBaseComponentHandler componentFollowupRetriggerdays](self, "componentFollowupRetriggerdays")
      && (uint64_t)v5 < -[MRBaseComponentHandler componentfollowUpDisplaydays](self, "componentfollowUpDisplaydays"))
    {
      v40 = handleForCategory(0);
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] handling followup retrigger"), "-[MRBaseComponentHandler unlockCheckerActivityBody]"));
        *(_DWORD *)buf = 138412546;
        v50 = v42;
        v51 = 2112;
        v52 = v43;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

      }
      -[MRBaseComponentHandler clearRepairFollowUp](self, "clearRepairFollowUp");
      -[MRBaseComponentHandler setDisplayNotification:](self, "setDisplayNotification:", 0);
      -[MRBaseComponentHandler createRepairFollowUp](self, "createRepairFollowUp");
    }
  }
  if (((-[MRBaseComponentHandler notifyServer](self, "notifyServer") & v8 ^ 1 | v7) & 1) == 0)
  {
    v44 = handleForCategory(0);
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] Scheduling network activity"), "-[MRBaseComponentHandler unlockCheckerActivityBody]"));
      *(_DWORD *)buf = 138412546;
      v50 = v46;
      v51 = 2112;
      v52 = v47;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

    }
    -[MRBaseComponentHandler scheduleNetworkActivity](self, "scheduleNetworkActivity");
  }
  if ((uint64_t)v5 < -[MRBaseComponentHandler componentfollowUpDisplaydays](self, "componentfollowUpDisplaydays")
    || (!-[MRBaseComponentHandler notifyServer](self, "notifyServer") | v7) != 1
    || ((!-[MRBaseComponentHandler isSUCaseForComponent](self, "isSUCaseForComponent") | v8) & 1) == 0)
  {
    -[MRBaseComponentHandler scheduleUnlockCheckerActivity:forFinishRepair:](self, "scheduleUnlockCheckerActivity:forFinishRepair:", 0, self->timeIntervalOverride - (double)((uint64_t)timeIntervalOverride % (uint64_t)self->timeIntervalOverride));
  }

}

- (void)unlockCheckerActivityBodyForFinishRepair
{
  void *v3;
  void *v4;
  char *v5;
  void *v6;
  char *v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double timeIntervalOverride;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSString *finishRepairKey;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentUnLockCheckCountKey](self, "componentUnLockCheckCountKey"));
  v5 = (char *)objc_msgSend(v3, "integerForKey:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentRetriggerCountKey](self, "componentRetriggerCountKey"));
  v7 = (char *)objc_msgSend(v3, "integerForKey:", v6);

  v8 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
  v9 = objc_msgSend(v8, "integerForKey:", CFSTR("clearFinishRepairFollowup"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v10, "timeIntervalSince1970");
  v12 = v11;

  objc_msgSend(v3, "doubleForKey:", self->componentLastCheckTimeKey);
  v14 = (double)(uint64_t)(v12 - v13);
  if (self->timeIntervalOverride <= v14)
    timeIntervalOverride = v14;
  else
    timeIntervalOverride = self->timeIntervalOverride;
  if ((uint64_t)v5 < -[MRBaseComponentHandler componentfollowUpDisplaydays](self, "componentfollowUpDisplaydays"))
  {
    ++v5;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentUnLockCheckCountKey](self, "componentUnLockCheckCountKey"));
    objc_msgSend(v3, "setInteger:forKey:", v5, v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentLastCheckTimeKey](self, "componentLastCheckTimeKey"));
    objc_msgSend(v3, "setDouble:forKey:", v17, v12);

  }
  v18 = handleForCategory(0);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Set count FinishRepair:%ld"), v5));
    *(_DWORD *)buf = 138412546;
    v43 = v20;
    v44 = 2112;
    v45 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

  }
  v22 = handleForCategory(0);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Retigger count:%ld"), v7));
    *(_DWORD *)buf = 138412546;
    v43 = v24;
    v44 = 2112;
    v45 = v25;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

  }
  if (v5 == (char *)-[MRBaseComponentHandler componentFollowupRetriggerdays](self, "componentFollowupRetriggerdays"))
  {
    v26 = handleForCategory(0);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] handling followup without notification"), "-[MRBaseComponentHandler unlockCheckerActivityBodyForFinishRepair]"));
      *(_DWORD *)buf = 138412546;
      v43 = v28;
      v44 = 2112;
      v45 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

    }
    if (self->finishRepairKey)
    {
      v30 = objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:", CFSTR("com.apple.Preferences"));
      finishRepairKey = self->finishRepairKey;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &finishRepairKey, 1));
      objc_msgSend(v30, "removeDeliveredNotificationsWithIdentifiers:", v31);

    }
  }
  else if ((uint64_t)v5 >= -[MRBaseComponentHandler componentfollowUpDisplaydays](self, "componentfollowUpDisplaydays"))
  {
    v32 = handleForCategory(0);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] handling clear all followup"), "-[MRBaseComponentHandler unlockCheckerActivityBodyForFinishRepair]"));
      *(_DWORD *)buf = 138412546;
      v43 = v34;
      v44 = 2112;
      v45 = v35;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

    }
    -[MRBaseComponentHandler clearRepairFollowUp](self, "clearRepairFollowUp");
    -[MRBaseComponentHandler sendAnalyticsForCount:](self, "sendAnalyticsForCount:", v5);
  }
  if (v9)
  {
    if ((uint64_t)v7 <= -[MRBaseComponentHandler componentFollowupRetriggerdays](self, "componentFollowupRetriggerdays"))
    {
      ++v7;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentRetriggerCountKey](self, "componentRetriggerCountKey"));
      objc_msgSend(v3, "setInteger:forKey:", v7, v36);

    }
    if (v7 == (char *)-[MRBaseComponentHandler componentFollowupRetriggerdays](self, "componentFollowupRetriggerdays")
      && (uint64_t)v5 < -[MRBaseComponentHandler componentfollowUpDisplaydays](self, "componentfollowUpDisplaydays"))
    {
      v37 = handleForCategory(0);
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] handling followup retrigger"), "-[MRBaseComponentHandler unlockCheckerActivityBodyForFinishRepair]"));
        *(_DWORD *)buf = 138412546;
        v43 = v39;
        v44 = 2112;
        v45 = v40;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

      }
      -[MRBaseComponentHandler clearRepairFollowUp](self, "clearRepairFollowUp");
      -[MRBaseComponentHandler createFinishRepairFollowUpWithNotification:](self, "createFinishRepairFollowUpWithNotification:", 0);
    }
  }
  if ((uint64_t)v5 < -[MRBaseComponentHandler componentfollowUpDisplaydays](self, "componentfollowUpDisplaydays"))
    -[MRBaseComponentHandler scheduleUnlockCheckerActivity:forFinishRepair:](self, "scheduleUnlockCheckerActivity:forFinishRepair:", 1, self->timeIntervalOverride - (double)((uint64_t)timeIntervalOverride % (uint64_t)self->timeIntervalOverride));

}

- (id)createCriteriaForUnlockCheckerWithInterval:(double)a3
{
  xpc_object_t v4;

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, 0);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_DELAY, (uint64_t)a3);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
  return v4;
}

- (void)scheduleUnlockCheckerActivity:(double)a3 forFinishRepair:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  const char *v11;
  void (*v12)(uint64_t, void *);
  void ***v13;
  void **v14;
  void **v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const char *v19;

  v4 = a4;
  v7 = handleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
    *(_DWORD *)buf = 138412546;
    v17 = v9;
    v18 = 2080;
    v19 = "-[MRBaseComponentHandler scheduleUnlockCheckerActivity:forFinishRepair:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);

  }
  if (-[MRBaseComponentHandler unlockCheckActivityRequired](self, "unlockCheckActivityRequired"))
  {
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentUnlockCheckerActivityName](self, "componentUnlockCheckerActivityName")));
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    if (v4)
    {
      v15 = _NSConcreteStackBlock;
      v12 = sub_100008290;
      v13 = &v15;
    }
    else
    {
      v14 = _NSConcreteStackBlock;
      v12 = sub_1000082F8;
      v13 = &v14;
    }
    v13[1] = (void **)3221225472;
    v13[2] = (void **)v12;
    v13[3] = (void **)&unk_100018648;
    v13[4] = (void **)&self->super.isa;
    *((double *)v13 + 5) = a3;
    xpc_activity_register(v11, XPC_ACTIVITY_CHECK_IN, v13);

  }
}

- (void)mainNonAuthRepairFlow
{
  MRBaseComponentHandler *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  char *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  unsigned int v18;
  unsigned int v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  char *v30;
  double v31;
  double v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  char *v36;
  uint64_t v37;
  NSObject *v38;
  id v39;
  char *v40;
  NSString *lastKnownComponentIdentifierValue;
  uint64_t v42;
  NSObject *v43;
  id v44;
  char *v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  const char *v49;

  v2 = self;
  objc_sync_enter(v2);
  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v2, "componentName"));
    *(_DWORD *)buf = 138412546;
    v47 = v5;
    v48 = 2080;
    v49 = "-[MRBaseComponentHandler mainNonAuthRepairFlow]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);

  }
  v6 = handleForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v2, "componentName"));
    v9 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] component non authentic"), "-[MRBaseComponentHandler mainNonAuthRepairFlow]"));
    *(_DWORD *)buf = 138412546;
    v47 = v8;
    v48 = 2112;
    v49 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentUnLockCheckCountKey](v2, "componentUnLockCheckCountKey"));
  v12 = objc_msgSend(v10, "integerForKey:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringForKey:", v2->lastKnownComponentIdentifierKey));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  LODWORD(v13) = objc_msgSend(v15, "BOOLForKey:", CFSTR("ForceDisableUIFlowForInternalBuild"));

  if ((os_variant_has_internal_content("com.apple.mobilerepaird") & v13 & 1) != 0
    || v2->disableUIForComponent)
  {
    -[MRBaseComponentHandler clearRepairFollowUp](v2, "clearRepairFollowUp");
    -[MRBaseComponentHandler clearNSUserDefaults](v2, "clearNSUserDefaults");
  }
  else
  {
    if ((uint64_t)v12 >= -[MRBaseComponentHandler componentfollowUpDisplaydays](v2, "componentfollowUpDisplaydays")
      && v14
      && v2->lastKnownComponentIdentifierValue
      && (objc_msgSend(v14, "isEqualToString:") & 1) == 0)
    {
      v2->displayNotification = 1;
      *(_WORD *)&v2->displayModalPopup = 1;
      -[MRBaseComponentHandler clearNSUserDefaults](v2, "clearNSUserDefaults");
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v17 = objc_msgSend(v16, "BOOLForKey:", v2->componentHasDisplayedFollowUpKey);
    v18 = objc_msgSend(v16, "BOOLForKey:", v2->componentHasNotifiedServerKey);
    v19 = objc_msgSend(v16, "BOOLForKey:", v2->componentDataCollectionPresentedKey);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v20, "timeIntervalSince1970");
    v22 = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentRetriggerCountKey](v2, "componentRetriggerCountKey"));
    v24 = objc_msgSend(v16, "integerForKey:", v23);

    if ((v17 & 1) != 0)
    {
      v25 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
      v26 = objc_msgSend(v25, "integerForKey:", v2->componentFollowupClientID);

      if (v26
        && (!v24
         || (uint64_t)v24 >= -[MRBaseComponentHandler componentFollowupRetriggerdays](v2, "componentFollowupRetriggerdays")&& v26 == (id)2))
      {
        -[MRBaseComponentHandler clearRepairFollowUp](v2, "clearRepairFollowUp");
      }
      v27 = handleForCategory(0);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = (id)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v2, "componentName"));
        v30 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] handling xpc/reboot case"), "-[MRBaseComponentHandler mainNonAuthRepairFlow]"));
        *(_DWORD *)buf = 138412546;
        v47 = v29;
        v48 = 2112;
        v49 = v30;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

      }
      objc_msgSend(v16, "doubleForKey:", v2->componentLastCheckTimeKey);
      v32 = (double)(uint64_t)(v22 - v31);
      if (v2->timeIntervalOverride <= v32)
      {
        -[MRBaseComponentHandler unlockCheckerActivityBody](v2, "unlockCheckerActivityBody");
      }
      else
      {
        v33 = handleForCategory(0);
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = (id)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v2, "componentName"));
          v36 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] scheduling unlock checker activity Interval:%f "), "-[MRBaseComponentHandler mainNonAuthRepairFlow]", v2->timeIntervalOverride - v32));
          *(_DWORD *)buf = 138412546;
          v47 = v35;
          v48 = 2112;
          v49 = v36;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

        }
        -[MRBaseComponentHandler scheduleUnlockCheckerActivity:forFinishRepair:](v2, "scheduleUnlockCheckerActivity:forFinishRepair:", 0, v2->timeIntervalOverride - v32);
      }
      if (((-[MRBaseComponentHandler notifyServer](v2, "notifyServer") & v19 ^ 1 | v18) & 1) == 0)
        -[MRBaseComponentHandler scheduleNetworkActivity](v2, "scheduleNetworkActivity");
    }
    else
    {
      v37 = handleForCategory(0);
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = (id)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v2, "componentName"));
        v40 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] starting Followup and notification"), "-[MRBaseComponentHandler mainNonAuthRepairFlow]"));
        *(_DWORD *)buf = 138412546;
        v47 = v39;
        v48 = 2112;
        v49 = v40;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

      }
      -[MRBaseComponentHandler clearNSUserDefaults](v2, "clearNSUserDefaults");
      -[MRBaseComponentHandler clearRepairFollowUp](v2, "clearRepairFollowUp");
      -[MRBaseComponentHandler createRepairFollowUp](v2, "createRepairFollowUp");
      -[MRBaseComponentHandler popUpNotificationNowWithMessage](v2, "popUpNotificationNowWithMessage");
      objc_msgSend(v16, "setBool:forKey:", 1, v2->componentHasDisplayedFollowUpKey);
      objc_msgSend(v16, "setInteger:forKey:", (uint64_t)v22, v2->componentFirstUIDisplayedTimeKey);
      lastKnownComponentIdentifierValue = v2->lastKnownComponentIdentifierValue;
      if (lastKnownComponentIdentifierValue)
        objc_msgSend(v16, "setObject:forKey:", lastKnownComponentIdentifierValue, v2->lastKnownComponentIdentifierKey);
      objc_msgSend(v16, "synchronize");
      -[MRBaseComponentHandler sendAnalyticsForCount:](v2, "sendAnalyticsForCount:", 0);
      if (((-[MRBaseComponentHandler notifyServer](v2, "notifyServer") & v19 ^ 1 | v18) & 1) == 0)
      {
        v42 = handleForCategory(0);
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v44 = (id)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v2, "componentName"));
          v45 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] Scheduling network activity"), "-[MRBaseComponentHandler mainNonAuthRepairFlow]"));
          *(_DWORD *)buf = 138412546;
          v47 = v44;
          v48 = 2112;
          v49 = v45;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

        }
        -[MRBaseComponentHandler scheduleNetworkActivity](v2, "scheduleNetworkActivity");
      }
      -[MRBaseComponentHandler scheduleUnlockCheckerActivity:forFinishRepair:](v2, "scheduleUnlockCheckerActivity:forFinishRepair:", 0, v2->timeIntervalOverride);
    }

  }
  objc_sync_exit(v2);

}

- (void)checkInAndHandleAuthStatus
{
  MRBaseComponentHandler *v2;
  unint64_t v3;
  void *v4;
  unsigned int v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  unsigned int v11;
  void *v12;
  void *v13;
  NSString *lastKnownComponentIdentifierValue;
  id v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  NSObject *asyncQueue;
  uint64_t v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  void *v33;
  _QWORD block[5];
  id v35;
  id location;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  NSString *finishRepairKey;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (unint64_t)objc_msgSend(v2->componentAuthHandler, "copyComponentStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_msgSend(v4, "BOOLForKey:", v2->finishRepairKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentRetriggerCountKey](v2, "componentRetriggerCountKey"));
  v10 = objc_msgSend(v4, "integerForKey:", v9);

  v11 = objc_msgSend(v4, "BOOLForKey:", v2->componentHasDisplayedFollowUpKey);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringForKey:", v2->lastKnownComponentIdentifierKey));

  if (v3 == 1)
  {
    -[MRBaseComponentHandler clearRepairFollowUp](v2, "clearRepairFollowUp");
    -[MRBaseComponentHandler sendAnalyticsForCount:](v2, "sendAnalyticsForCount:", 0x7FFFFFFFFFFFFFFFLL);
    -[MRBaseComponentHandler clearNSUserDefaults](v2, "clearNSUserDefaults");
  }
  else if (v3)
  {
    if (v3 == -3)
    {
      lastKnownComponentIdentifierValue = v2->lastKnownComponentIdentifierValue;
      if (lastKnownComponentIdentifierValue)
        objc_msgSend(v4, "setObject:forKey:", lastKnownComponentIdentifierValue, v2->lastKnownComponentIdentifierKey);
      if (v11)
      {
        -[MRBaseComponentHandler clearRepairFollowUp](v2, "clearRepairFollowUp");
        -[MRBaseComponentHandler createFinishRepairFollowUpWithNotification:](v2, "createFinishRepairFollowUpWithNotification:", objc_msgSend(v13, "isEqualToString:", v2->lastKnownComponentIdentifierValue) ^ 1);
        objc_msgSend(v4, "setBool:forKey:", 1, v2->finishRepairKey);
        v15 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
        objc_msgSend(v15, "removeObjectForKey:", CFSTR("clearFinishRepairFollowup"));
LABEL_28:

        goto LABEL_29;
      }
      if (!v5 || (objc_msgSend(v13, "isEqualToString:", v2->lastKnownComponentIdentifierValue) & 1) == 0)
      {
        -[MRBaseComponentHandler clearRepairFollowUp](v2, "clearRepairFollowUp");
        -[MRBaseComponentHandler clearNSUserDefaults](v2, "clearNSUserDefaults");
        -[MRBaseComponentHandler createFinishRepairFollowUpWithNotification:](v2, "createFinishRepairFollowUpWithNotification:", 1);
        objc_msgSend(v4, "setBool:forKey:", 1, v2->finishRepairKey);
        v15 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
        objc_msgSend(v15, "removeObjectForKey:", CFSTR("clearFinishRepairFollowup"));
        goto LABEL_28;
      }
      v23 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
      v24 = objc_msgSend(v23, "integerForKey:", CFSTR("clearFinishRepairFollowup"));

      if (v24
        && (!v10
         || (uint64_t)v10 >= -[MRBaseComponentHandler componentFollowupRetriggerdays](v2, "componentFollowupRetriggerdays")&& v24 == (id)2))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[MRUINotificationHelper sharedSingleton](MRUINotificationHelper, "sharedSingleton"));
        objc_msgSend(v25, "clearRepairFollowUpForClientID:", v2->finishRepairKey);

        v26 = objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:", CFSTR("com.apple.Preferences"));
        finishRepairKey = v2->finishRepairKey;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &finishRepairKey, 1));
        objc_msgSend(v26, "removeDeliveredNotificationsWithIdentifiers:", v27);

      }
      objc_msgSend(v4, "doubleForKey:", v2->componentLastCheckTimeKey);
      v29 = (double)(uint64_t)(v8 - v28);
      if (v2->timeIntervalOverride <= v29)
      {
        -[MRBaseComponentHandler unlockCheckerActivityBodyForFinishRepair](v2, "unlockCheckerActivityBodyForFinishRepair");
      }
      else
      {
        v30 = handleForCategory(0);
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = (id)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v2, "componentName"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] scheduling finish repair unlock checker activity Interval:%f "), "-[MRBaseComponentHandler checkInAndHandleAuthStatus]", v2->timeIntervalOverride - v29));
          *(_DWORD *)buf = 138412546;
          v38 = v32;
          v39 = 2112;
          v40 = v33;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

        }
        -[MRBaseComponentHandler scheduleUnlockCheckerActivity:forFinishRepair:](v2, "scheduleUnlockCheckerActivity:forFinishRepair:", 1, v2->timeIntervalOverride - v29);
      }
    }
    else if ((v3 & 0x8000000000000000) != 0)
    {
      v20 = handleForCategory(0);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (id)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v2, "componentName"));
        objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] IOREG Component Non authentic"), "-[MRBaseComponentHandler checkInAndHandleAuthStatus]"));
        sub_10000FC38();
      }

      -[MRBaseComponentHandler mainNonAuthRepairFlow](v2, "mainNonAuthRepairFlow");
    }
  }
  else
  {
    v16 = handleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = (id)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](v2, "componentName"));
      objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] IOREG Auth Component Not Populated"), "-[MRBaseComponentHandler checkInAndHandleAuthStatus]"));
      sub_10000FC38();
    }

    objc_initWeak(&location, v2);
    asyncQueue = v2->asyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000090AC;
    block[3] = &unk_100018670;
    objc_copyWeak(&v35, &location);
    block[4] = v2;
    dispatch_async(asyncQueue, block);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
LABEL_29:

  objc_sync_exit(v2);
}

- (void)sendAnalyticsForCount:(int64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  NSObject *v21;
  MRBaseComponentHandler *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;

  v9 = objc_msgSend(v5, "integerForKey:", self->componentFirstUIDisplayedTimeKey);
  if (!a3)
  {
    v13 = 0;
    v12 = 0;
    v14 = CFSTR("FirstUIDisplayed");
    goto LABEL_10;
  }
  v10 = v9;
  v11 = (uint64_t)v8;
  if (-[MRBaseComponentHandler componentFollowupRetriggerdays](self, "componentFollowupRetriggerdays") == a3)
  {
    v12 = 0;
    v13 = v11 - (_QWORD)v10;
    v14 = CFSTR("lockscreenCleared");
LABEL_10:
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000953C;
    v20[3] = &unk_100018698;
    v21 = v14;
    v22 = self;
    v23 = v12;
    v24 = v13;
    AnalyticsSendEventLazy(CFSTR("com.apple.corerepair.UI"), v20);
    v15 = v21;
    goto LABEL_11;
  }
  if (-[MRBaseComponentHandler componentfollowUpDisplaydays](self, "componentfollowUpDisplaydays") == a3)
  {
    v13 = 0;
    v12 = v11 - (_QWORD)v10;
    v14 = CFSTR("coreFollowUpCleared");
    goto LABEL_10;
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v10)
    {
      v12 = v11 - (_QWORD)v10;
      v14 = CFSTR("repairEvent");
      v13 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_10;
    }
    v17 = handleForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRBaseComponentHandler componentName](self, "componentName"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] auth never fail before, bogus repair event"), "-[MRBaseComponentHandler sendAnalyticsForCount:]"));
      *(_DWORD *)buf = 138412546;
      v26 = v18;
      v27 = 2112;
      v28 = v19;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

    }
  }
  else
  {
    v16 = handleForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10000FC84(self, a3);
  }
LABEL_11:

}

+ (void)handleComponentSUCase:(id)a3 lastAUthCheckBuildVersion:(id)a4 followUpItemID:(id)a5 queryString:(id)a6 suCasekey:(id)a7 startBuildVersion:(id)a8 componentAuth:(id)a9
{
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  NSObject *v36;
  unint64_t v37;
  uint64_t v38;
  NSObject *v39;
  _BOOL4 v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  id v47;
  void *v48;
  uint8_t buf[4];
  NSObject *v50;
  __int16 v51;
  void *v52;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = DMGetUserDataDisposition();
  v20 = handleForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if ((v19 & 2) != 0)
  {
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Update install case", buf, 2u);
    }

    v23 = DMGetPreviousBuildVersion();
    v21 = objc_claimAutoreleasedReturnValue(v23);
    v48 = (void *)DMCopyCurrentBuildVersion();
    v24 = handleForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v50 = v21;
      v51 = 2112;
      v52 = v48;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Old version is %@:%@", buf, 0x16u);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v27 = objc_msgSend(v26, "BOOLForKey:", v13);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringForKey:", v14));
    v29 = v28;
    if (v27)
    {
      v30 = handleForCategory(0);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v15;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[%@] User already seeing UI", buf, 0xCu);
      }

    }
    else if (!v28 || (objc_msgSend(v28, "isEqualToString:", v48) & 1) == 0)
    {
      v32 = handleForCategory(0);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v15;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[%@] first auth case", buf, 0xCu);
      }

      v34 = objc_msgSend(v18, "synchronouslycopyAuthStatus");
      if (v34 == (id)1)
      {
        v35 = handleForCategory(0);
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v15;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "[%@] is Trusted", buf, 0xCu);
        }

        objc_msgSend(v26, "setObject:forKey:", v48, v14);
        objc_msgSend(v26, "synchronize");
      }
      else
      {
        v37 = (unint64_t)v34;
        v47 = v16;
        v38 = handleForCategory(0);
        v39 = objc_claimAutoreleasedReturnValue(v38);
        v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
        if ((v37 & 0x8000000000000000) != 0)
        {
          if (v40)
          {
            *(_DWORD *)buf = 138412290;
            v50 = v15;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "[%@] is not Trusted", buf, 0xCu);
          }

          v41 = objc_msgSend(objc_alloc((Class)SBFBuildVersion), "initWithString:", v17);
          v16 = v47;
          v46 = v41;
          if (v21 && objc_msgSend(v41, "compareBuildVersionString:withPrecision:", v21, 2) == (id)1)
          {
            v42 = handleForCategory(0);
            v43 = objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v50 = v15;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "SU case for %@", buf, 0xCu);
            }

            objc_msgSend(v26, "setBool:forKey:", 1, v47);
          }
          else
          {
            v44 = handleForCategory(0);
            v45 = objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v50 = v21;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "ignoring setting the SU case: previousBuild:%@", buf, 0xCu);
            }

          }
          objc_msgSend(v26, "setObject:forKey:", v48, v14);
          objc_msgSend(v26, "synchronize");

        }
        else
        {
          if (v40)
          {
            *(_DWORD *)buf = 138412290;
            v50 = v15;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "[%@] Auth timeout", buf, 0xCu);
          }

          v16 = v47;
        }
      }
    }

  }
  else if (v22)
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v50) = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Skipping SU update check:%d", buf, 8u);
  }

}

+ (id)getHwRevision
{
  const __CFDictionary *v2;
  io_service_t MatchingService;
  io_object_t v4;
  void *CFProperty;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = IOServiceMatching("IOPlatformExpertDevice");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (MatchingService)
  {
    v4 = MatchingService;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("config-number"), kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", CFProperty, 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("/-")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v7));

      if ((unint64_t)objc_msgSend(v8, "count") >= 2)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 1));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v9));

LABEL_12:
        IOObjectRelease(v4);
        goto LABEL_13;
      }
    }
    else
    {
      v20 = handleForCategory(0);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_10000FD6C(v21, v22, v23, v24, v25, v26, v27, v28);

      v6 = 0;
      v8 = 0;
    }
    v10 = 0;
    goto LABEL_12;
  }
  v11 = handleForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    sub_10000FD38(v12, v13, v14, v15, v16, v17, v18, v19);

  CFProperty = 0;
  v10 = 0;
  v8 = 0;
  v6 = 0;
LABEL_13:

  return v10;
}

- (NSString)popUpNotificationMessage
{
  return self->popUpNotificationMessage;
}

- (void)setPopUpNotificationMessage:(id)a3
{
  objc_storeStrong((id *)&self->popUpNotificationMessage, a3);
}

- (NSString)popUpNotificationTitle
{
  return self->popUpNotificationTitle;
}

- (void)setPopUpNotificationTitle:(id)a3
{
  objc_storeStrong((id *)&self->popUpNotificationTitle, a3);
}

- (NSString)followUpInfoMessage
{
  return self->followUpInfoMessage;
}

- (void)setFollowUpInfoMessage:(id)a3
{
  objc_storeStrong((id *)&self->followUpInfoMessage, a3);
}

- (BOOL)unlockCheckActivityRequired
{
  return self->unlockCheckActivityRequired;
}

- (void)setUnlockCheckActivityRequired:(BOOL)a3
{
  self->unlockCheckActivityRequired = a3;
}

- (NSURL)linkedSensitiveURL
{
  return self->linkedSensitiveURL;
}

- (void)setLinkedSensitiveURL:(id)a3
{
  objc_storeStrong((id *)&self->linkedSensitiveURL, a3);
}

- (NSString)componentFollowupClientID
{
  return self->componentFollowupClientID;
}

- (void)setComponentFollowupClientID:(id)a3
{
  objc_storeStrong((id *)&self->componentFollowupClientID, a3);
}

- (NSString)componentUnLockCheckCountKey
{
  return self->componentUnLockCheckCountKey;
}

- (void)setComponentUnLockCheckCountKey:(id)a3
{
  objc_storeStrong((id *)&self->componentUnLockCheckCountKey, a3);
}

- (NSString)componentSUCaseKey
{
  return self->componentSUCaseKey;
}

- (void)setComponentSUCaseKey:(id)a3
{
  objc_storeStrong((id *)&self->componentSUCaseKey, a3);
}

- (BOOL)displayNotification
{
  return self->displayNotification;
}

- (void)setDisplayNotification:(BOOL)a3
{
  self->displayNotification = a3;
}

- (BOOL)notifyServer
{
  return self->notifyServer;
}

- (void)setNotifyServer:(BOOL)a3
{
  self->notifyServer = a3;
}

- (BOOL)displayModalPopup
{
  return self->displayModalPopup;
}

- (void)setDisplayModalPopup:(BOOL)a3
{
  self->displayModalPopup = a3;
}

- (BOOL)isSUCaseForComponent
{
  return self->isSUCaseForComponent;
}

- (void)setIsSUCaseForComponent:(BOOL)a3
{
  self->isSUCaseForComponent = a3;
}

- (BOOL)disableUIForComponent
{
  return self->disableUIForComponent;
}

- (void)setDisableUIForComponent:(BOOL)a3
{
  self->disableUIForComponent = a3;
}

- (NSString)componentLastCheckTimeKey
{
  return self->componentLastCheckTimeKey;
}

- (void)setComponentLastCheckTimeKey:(id)a3
{
  objc_storeStrong((id *)&self->componentLastCheckTimeKey, a3);
}

- (NSString)componentHasNotifiedServerKey
{
  return self->componentHasNotifiedServerKey;
}

- (void)setComponentHasNotifiedServerKey:(id)a3
{
  objc_storeStrong((id *)&self->componentHasNotifiedServerKey, a3);
}

- (NSString)componentHasDisplayedFollowUpKey
{
  return self->componentHasDisplayedFollowUpKey;
}

- (void)setComponentHasDisplayedFollowUpKey:(id)a3
{
  objc_storeStrong((id *)&self->componentHasDisplayedFollowUpKey, a3);
}

- (NSString)componentDataCollectionPresentedKey
{
  return self->componentDataCollectionPresentedKey;
}

- (void)setComponentDataCollectionPresentedKey:(id)a3
{
  objc_storeStrong((id *)&self->componentDataCollectionPresentedKey, a3);
}

- (NSString)componentFirstUIDisplayedTimeKey
{
  return self->componentFirstUIDisplayedTimeKey;
}

- (void)setComponentFirstUIDisplayedTimeKey:(id)a3
{
  objc_storeStrong((id *)&self->componentFirstUIDisplayedTimeKey, a3);
}

- (NSString)lastKnownComponentIdentifierKey
{
  return self->lastKnownComponentIdentifierKey;
}

- (void)setLastKnownComponentIdentifierKey:(id)a3
{
  objc_storeStrong((id *)&self->lastKnownComponentIdentifierKey, a3);
}

- (NSString)lastKnownComponentIdentifierValue
{
  return self->lastKnownComponentIdentifierValue;
}

- (void)setLastKnownComponentIdentifierValue:(id)a3
{
  objc_storeStrong((id *)&self->lastKnownComponentIdentifierValue, a3);
}

- (NSString)componentUnlockCheckerActivityName
{
  return self->componentUnlockCheckerActivityName;
}

- (void)setComponentUnlockCheckerActivityName:(id)a3
{
  objc_storeStrong((id *)&self->componentUnlockCheckerActivityName, a3);
}

- (int)componentFollowupRetriggerdays
{
  return self->componentFollowupRetriggerdays;
}

- (void)setComponentFollowupRetriggerdays:(int)a3
{
  self->componentFollowupRetriggerdays = a3;
}

- (int)componentfollowUpDisplaydays
{
  return self->componentfollowUpDisplaydays;
}

- (void)setComponentfollowUpDisplaydays:(int)a3
{
  self->componentfollowUpDisplaydays = a3;
}

- (NSString)componentForceKey
{
  return self->componentForceKey;
}

- (void)setComponentForceKey:(id)a3
{
  objc_storeStrong((id *)&self->componentForceKey, a3);
}

- (NSString)componentEnableNonAuthUIKey
{
  return self->componentEnableNonAuthUIKey;
}

- (void)setComponentEnableNonAuthUIKey:(id)a3
{
  objc_storeStrong((id *)&self->componentEnableNonAuthUIKey, a3);
}

- (double)timeIntervalOverride
{
  return self->timeIntervalOverride;
}

- (void)setTimeIntervalOverride:(double)a3
{
  self->timeIntervalOverride = a3;
}

- (NSString)componentNtwkActivityName
{
  return self->componentNtwkActivityName;
}

- (void)setComponentNtwkActivityName:(id)a3
{
  objc_storeStrong((id *)&self->componentNtwkActivityName, a3);
}

- (id)componentAuthHandler
{
  return self->componentAuthHandler;
}

- (void)setComponentAuthHandler:(id)a3
{
  objc_storeStrong(&self->componentAuthHandler, a3);
}

- (int64_t)componentId
{
  return self->componentId;
}

- (void)setComponentId:(int64_t)a3
{
  self->componentId = a3;
}

- (NSString)componentName
{
  return self->componentName;
}

- (void)setComponentName:(id)a3
{
  objc_storeStrong((id *)&self->componentName, a3);
}

- (BOOL)displayFollowup
{
  return self->displayFollowup;
}

- (void)setDisplayFollowup:(BOOL)a3
{
  self->displayFollowup = a3;
}

- (BOOL)legacyPopup
{
  return self->legacyPopup;
}

- (void)setLegacyPopup:(BOOL)a3
{
  self->legacyPopup = a3;
}

- (NSString)stateFilePath
{
  return self->stateFilePath;
}

- (void)setStateFilePath:(id)a3
{
  objc_storeStrong((id *)&self->stateFilePath, a3);
}

- (int)deviceClass
{
  return self->deviceClass;
}

- (void)setDeviceClass:(int)a3
{
  self->deviceClass = a3;
}

- (BOOL)supportsRepair
{
  return self->supportsRepair;
}

- (void)setSupportsRepair:(BOOL)a3
{
  self->supportsRepair = a3;
}

- (NSString)componentRetriggerCountKey
{
  return self->componentRetriggerCountKey;
}

- (void)setComponentRetriggerCountKey:(id)a3
{
  objc_storeStrong((id *)&self->componentRetriggerCountKey, a3);
}

- (NSString)finishRepairKey
{
  return self->finishRepairKey;
}

- (void)setFinishRepairKey:(id)a3
{
  objc_storeStrong((id *)&self->finishRepairKey, a3);
}

- (NSString)finishRepairMessage
{
  return self->finishRepairMessage;
}

- (void)setFinishRepairMessage:(id)a3
{
  objc_storeStrong((id *)&self->finishRepairMessage, a3);
}

- (NSString)finishRepairTitle
{
  return self->finishRepairTitle;
}

- (void)setFinishRepairTitle:(id)a3
{
  objc_storeStrong((id *)&self->finishRepairTitle, a3);
}

- (NSString)componentStatusKey
{
  return self->_componentStatusKey;
}

- (void)setComponentStatusKey:(id)a3
{
  objc_storeStrong((id *)&self->_componentStatusKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentStatusKey, 0);
  objc_storeStrong((id *)&self->finishRepairTitle, 0);
  objc_storeStrong((id *)&self->finishRepairMessage, 0);
  objc_storeStrong((id *)&self->finishRepairKey, 0);
  objc_storeStrong((id *)&self->componentRetriggerCountKey, 0);
  objc_storeStrong((id *)&self->stateFilePath, 0);
  objc_storeStrong((id *)&self->componentName, 0);
  objc_storeStrong(&self->componentAuthHandler, 0);
  objc_storeStrong((id *)&self->componentNtwkActivityName, 0);
  objc_storeStrong((id *)&self->componentEnableNonAuthUIKey, 0);
  objc_storeStrong((id *)&self->componentForceKey, 0);
  objc_storeStrong((id *)&self->componentUnlockCheckerActivityName, 0);
  objc_storeStrong((id *)&self->lastKnownComponentIdentifierValue, 0);
  objc_storeStrong((id *)&self->lastKnownComponentIdentifierKey, 0);
  objc_storeStrong((id *)&self->componentFirstUIDisplayedTimeKey, 0);
  objc_storeStrong((id *)&self->componentDataCollectionPresentedKey, 0);
  objc_storeStrong((id *)&self->componentHasDisplayedFollowUpKey, 0);
  objc_storeStrong((id *)&self->componentHasNotifiedServerKey, 0);
  objc_storeStrong((id *)&self->componentLastCheckTimeKey, 0);
  objc_storeStrong((id *)&self->componentSUCaseKey, 0);
  objc_storeStrong((id *)&self->componentUnLockCheckCountKey, 0);
  objc_storeStrong((id *)&self->componentFollowupClientID, 0);
  objc_storeStrong((id *)&self->linkedSensitiveURL, 0);
  objc_storeStrong((id *)&self->followUpInfoMessage, 0);
  objc_storeStrong((id *)&self->popUpNotificationTitle, 0);
  objc_storeStrong((id *)&self->popUpNotificationMessage, 0);
  objc_storeStrong((id *)&self->asyncQueue, 0);
}

@end
