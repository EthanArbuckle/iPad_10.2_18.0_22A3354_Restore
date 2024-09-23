@implementation PNDConnection

+ (NSObject)statusLock
{
  if (qword_10000C3A8 != -1)
    dispatch_once(&qword_10000C3A8, &stru_100008368);
  return (id)qword_10000C3A0;
}

+ (BOOL)isChangingPasscode
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "statusLock"));
  objc_sync_enter(v2);
  v3 = byte_10000C398;
  objc_sync_exit(v2);

  return v3;
}

+ (void)setIsChangingPasscode:(BOOL)a3
{
  void *v5;
  int v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "statusLock"));
  objc_sync_enter(v5);
  byte_10000C398 = a3;
  v6 = byte_10000C399;
  objc_sync_exit(v5);

  if (v6 && !a3)
  {
    v7 = _MCLogObjects[6];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Handling postponed keep-alive deletion notification", v8, 2u);
    }
    objc_msgSend(a1, "shutdown");
  }
}

+ (void)setPendingKeepAliveDeletion:(BOOL)a3
{
  id obj;

  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "statusLock"));
  objc_sync_enter(obj);
  byte_10000C399 = a3;
  objc_sync_exit(obj);

}

+ (void)registerKeepAliveFileDeleteNotification
{
  uint64_t v3;
  id v4;
  int v5;
  NSObject *v6;
  dispatch_source_t v7;
  void *v8;
  _QWORD v9[4];
  int v10;
  _QWORD handler[5];
  uint8_t buf[16];

  v3 = MCPasscodeNagKeepAliveFilePath(a1, a2);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v3));
  v5 = open((const char *)objc_msgSend(v4, "cStringUsingEncoding:", 1), 0x8000);

  if (v5 < 0)
  {
    v6 = _MCLogObjects[6];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Could not open file at Keep-Alive file!", buf, 2u);
    }
    objc_msgSend(a1, "shutdown");
  }
  v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v5, 1uLL, (dispatch_queue_t)&_dispatch_main_q);
  v8 = (void *)qword_10000C390;
  qword_10000C390 = (uint64_t)v7;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000051E0;
  handler[3] = &unk_100008388;
  handler[4] = a1;
  dispatch_source_set_event_handler((dispatch_source_t)qword_10000C390, handler);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000052B0;
  v9[3] = &unk_1000083A8;
  v10 = v5;
  dispatch_source_set_cancel_handler((dispatch_source_t)qword_10000C390, v9);
  dispatch_activate((dispatch_object_t)qword_10000C390);
}

+ (void)shutdown
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];
  uint8_t v7[16];
  uint8_t buf[16];

  v2 = _MCLogObjects[6];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "passcodenagd is shutting down...", buf, 2u);
  }
  if (qword_10000C390)
  {
    v3 = _MCLogObjects[6];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cancelling Keep-Alive observer...", v7, 2u);
    }
    dispatch_source_cancel((dispatch_source_t)qword_10000C390);
  }
  v4 = _MCLogObjects[6];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Closing any pending notification...", v6, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCUserNotificationManager sharedManager](MCUserNotificationManager, "sharedManager"));
  objc_msgSend(v5, "cancelNotificationsWithIdentifier:completionBlock:", CFSTR("passcodenagd-user-notification-id"), &stru_1000083C8);

}

+ (void)registerSpringboardNotification
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  uint32_t v5;
  NSObject *v6;
  _QWORD v7[5];
  int out_token;
  uint8_t buf[4];
  uint32_t v10;

  out_token = 0;
  global_queue = dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005550;
  v7[3] = &unk_1000083E8;
  v7[4] = a1;
  v5 = notify_register_dispatch("com.apple.springboard.homescreenunlocked", &out_token, v4, v7);

  if (v5)
  {
    v6 = _MCLogObjects[6];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Could not register for homescreen unlocked darwin notification error %{public}d", buf, 8u);
    }
  }
}

+ (void)registerLockStateChangedNotification
{
  dispatch_queue_global_t global_queue;
  NSObject *v3;
  uint32_t v4;
  NSObject *v5;
  int out_token;
  uint8_t buf[4];
  uint32_t v8;

  out_token = 0;
  global_queue = dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue(global_queue);
  v4 = notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &out_token, v3, &stru_100008428);

  if (v4)
  {
    v5 = _MCLogObjects[6];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Could not register for MBK lock state changed darwin notification error %{public}d", buf, 8u);
    }
  }
}

+ (void)registerLanguageChangedNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1000057C4, CFSTR("com.apple.language.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

+ (void)_checkPasscodeCompliance
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v3 = qword_10000C388;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000058BC;
  v5[3] = &unk_100008478;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v4, "getPasscodeComplianceWarningLastLockDate:completionBlock:", v3, v5);

}

+ (void)notifyCDPThatPasscodeChangedTo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v9 = objc_msgSend(v8, "unlockScreenTypeForPasscode:outSimplePasscodeType:", v7, 0);

  v10 = objc_msgSend(a1, "_cdpSecretTypeFromUnlockScreenType:", v9);
  v11 = objc_alloc_init((Class)CDPContext);
  objc_msgSend(v11, "setType:", 6);
  v12 = objc_msgSend(objc_alloc((Class)CDPStateController), "initWithContext:", v11);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100005D20;
  v14[3] = &unk_1000084A0;
  v15 = v6;
  v13 = v6;
  objc_msgSend(v12, "localSecretChangedTo:secretType:completion:", v7, v10, v14);

}

+ (unint64_t)_cdpSecretTypeFromUnlockScreenType:(int)a3
{
  if ((a3 - 1) >= 2)
    return 2;
  else
    return 3;
}

@end
