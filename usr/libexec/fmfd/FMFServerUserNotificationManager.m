@implementation FMFServerUserNotificationManager

+ (id)sharedInstance
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (qword_1000B3848 != -1)
    dispatch_once(&qword_1000B3848, &stru_10009AAC0);
  v2 = (void *)qword_1000B3840;
  if (!qword_1000B3840)
  {
    v3 = sub_100011D0C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1000649A4(v4, v5, v6, v7, v8, v9, v10, v11);

    v2 = (void *)qword_1000B3840;
  }
  return v2;
}

- (FMFServerUserNotificationManager)init
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_1000649D8(v4, v5, v6, v7, v8, v9, v10, v11);

  return 0;
}

- (id)initSingleton
{
  FMFServerUserNotificationManager *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FMFServerUserNotificationManager;
  v2 = -[FMFServerUserNotificationManager init](&v9, "init");
  if (v2)
  {
    v3 = sub_100011D0C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AOSUserNotificationMgr_iOS: initialize", v8, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[FMFServerUserNotificationManager setActiveUserNotifications:](v2, "setActiveUserNotifications:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[FMFServerUserNotificationManager setActiveCFNotificationsByCategory:](v2, "setActiveCFNotificationsByCategory:", v6);

    objc_storeStrong((id *)&qword_1000B3840, v2);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)qword_1000B3840;
  qword_1000B3840 = 0;

  v4.receiver = self;
  v4.super_class = (Class)FMFServerUserNotificationManager;
  -[FMFServerUserNotificationManager dealloc](&v4, "dealloc");
}

- (void)activateNotification:(id)a3
{
  id v4;
  void *v5;
  CFOptionFlags v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFUserNotification *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CFTimeInterval v25;
  CFUserNotificationRef v26;
  CFUserNotificationRef v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  _QWORD v37[5];
  SInt32 error;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (objc_msgSend(v4, "alertLevel") == (id)1)
    v6 = 3;
  else
    v6 = 0;
  if (objc_msgSend(v4, "category"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServerUserNotificationManager activeCFNotificationsByCategory](self, "activeCFNotificationsByCategory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "category")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServerUserNotificationManager activeUserNotifications](self, "activeUserNotifications"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServerUserNotificationManager activeCFNotificationsByCategory](self, "activeCFNotificationsByCategory"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "category")));
      objc_msgSend(v12, "removeObjectForKey:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServerUserNotificationManager activeUserNotifications](self, "activeUserNotifications"));
      objc_msgSend(v14, "removeObjectForKey:", v9);

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServerUserNotificationManager _xpcTransactionNameFor:](self, "_xpcTransactionNameFor:", v11));
      objc_msgSend(v15, "endTransaction:", v16);

      v17 = (__CFUserNotification *)objc_msgSend(v9, "unsignedLongValue");
      CFUserNotificationCancel(v17);
      if (v17)
        CFRelease(v17);

    }
  }
  if (objc_msgSend(v4, "showMessage"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultButtonTitle"));
    objc_msgSend(v5, "safelyMapKey:toObject:", kCFUserNotificationDefaultButtonTitleKey, v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alternateButtonTitle"));
    objc_msgSend(v5, "safelyMapKey:toObject:", kCFUserNotificationAlternateButtonTitleKey, v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msgText"));
    objc_msgSend(v5, "safelyMapKey:toObject:", kCFUserNotificationAlertMessageKey, v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msgTitle"));
    objc_msgSend(v5, "safelyMapKey:toObject:", kCFUserNotificationAlertHeaderKey, v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "showMsgInLockScreen")));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, kCFUserNotificationAlertTopMostKey);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "dismissMsgOnUnlock") ^ 1));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, SBUserNotificationDontDismissOnUnlock);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "dismissMsgOnLock")));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, SBUserNotificationDismissOnLock);

    objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBUserNotificationAllowMenuButtonDismissal);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBUserNotificationAllowInCarKey);
    error = 0;
    objc_msgSend(v4, "timeout");
    v26 = CFUserNotificationCreate(kCFAllocatorDefault, v25, v6, &error, (CFDictionaryRef)v5);
    if (v26)
    {
      v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServerUserNotificationManager activeUserNotifications](self, "activeUserNotifications"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v27));
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v4, v29);

      if (objc_msgSend(v4, "category"))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v27));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServerUserNotificationManager activeCFNotificationsByCategory](self, "activeCFNotificationsByCategory"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "category")));
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, v32);

      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServerUserNotificationManager _xpcTransactionNameFor:](self, "_xpcTransactionNameFor:", v4));
      objc_msgSend(v33, "beginTransaction:", v34);

      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100040E74;
      v37[3] = &unk_100099320;
      v37[4] = v27;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v37);
    }
    else
    {
      v35 = sub_100011D0C();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        sub_100064A0C(&error, v36);

    }
  }

}

- (id)_xpcTransactionNameFor:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Message-%lX"), a3);
}

- (NSMutableDictionary)activeUserNotifications
{
  return self->_activeUserNotifications;
}

- (void)setActiveUserNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_activeUserNotifications, a3);
}

- (NSMutableDictionary)activeCFNotificationsByCategory
{
  return self->_activeCFNotificationsByCategory;
}

- (void)setActiveCFNotificationsByCategory:(id)a3
{
  objc_storeStrong((id *)&self->_activeCFNotificationsByCategory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeCFNotificationsByCategory, 0);
  objc_storeStrong((id *)&self->_activeUserNotifications, 0);
}

@end
