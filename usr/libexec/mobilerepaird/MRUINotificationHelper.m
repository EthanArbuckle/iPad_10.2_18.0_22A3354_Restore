@implementation MRUINotificationHelper

- (MRUINotificationHelper)init
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;

  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = NSStringFromSelector("sharedSingleton");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Use +[%@ %@] instead of -%@."), v6, v8, v10);

  return 0;
}

- (id)_init
{
  MRUINotificationHelper *v2;
  MRUINotificationHelper *v3;
  dispatch_queue_t v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *clientIDtoFollowupItemCache;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MRUINotificationHelper;
  v2 = -[MRUINotificationHelper init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v2->delay = 0;
    v4 = dispatch_queue_create("com.apple.mobilerepaird.notificationq", 0);
    v5 = (void *)qword_10001EAE0;
    qword_10001EAE0 = (uint64_t)v4;

    v6 = objc_opt_new(NSMutableDictionary);
    clientIDtoFollowupItemCache = v3->clientIDtoFollowupItemCache;
    v3->clientIDtoFollowupItemCache = v6;

  }
  return v3;
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BCF0;
  block[3] = &unk_1000185F8;
  block[4] = a1;
  if (qword_10001EAF0 != -1)
    dispatch_once(&qword_10001EAF0, block);
  return (id)qword_10001EAE8;
}

- (void)createRepairFollowUpWithNotification:(BOOL)a3 actionURL:(id)a4 repairTitle:(id)a5 infoText:(id)a6 itemID:(id)a7 timeInterval:(double)a8 componentName:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  MRUINotificationHelper *v32;
  BOOL v33;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v20 = qword_10001EAE0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BE40;
  block[3] = &unk_100018778;
  v33 = a3;
  v27 = v15;
  v28 = v16;
  v29 = v17;
  v30 = v18;
  v31 = v19;
  v32 = self;
  v21 = v19;
  v22 = v18;
  v23 = v17;
  v24 = v16;
  v25 = v15;
  dispatch_sync(v20, block);

}

- (void)popUpNotificationNowWithMessage:(id)a3 title:(id)a4 openSensitiveURL:(id)a5 componentName:(id)a6 legacyPopup:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  MRUINotificationHelper *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  NSObject *v20;
  char v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  int delay;
  dispatch_semaphore_t v26;
  dispatch_time_t v27;
  NSObject *v28;
  NSObject *v29;
  _QWORD block[4];
  dispatch_semaphore_t v31;
  id v32;
  id v33;
  id v34;
  BOOL v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  int v39;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = self;
  objc_sync_enter(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v18 = objc_msgSend(v17, "BOOLForKey:", CFSTR("settingsView"));

  v19 = handleForCategory(0);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v37) = v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, " value is:%d", buf, 8u);
  }

  if (!v18 || v7)
  {
    v21 = BYSetupAssistantNeedsToRun();
    while ((v21 & 1) != 0)
    {
      v22 = objc_autoreleasePoolPush();
      v21 = BYSetupAssistantNeedsToRun();
      objc_autoreleasePoolPop(v22);
      sleep(3u);
    }
    v23 = handleForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      delay = v16->delay;
      *(_DWORD *)buf = 138412546;
      v37 = v13;
      v38 = 1024;
      v39 = delay;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Displaying %@ notification after %d delay", buf, 0x12u);
    }

    v26 = dispatch_semaphore_create(0);
    v27 = dispatch_time(0, 1000000000 * v16->delay);
    v28 = qword_10001EAE0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C564;
    block[3] = &unk_1000187A0;
    v35 = v7;
    v31 = v26;
    v32 = v13;
    v33 = v12;
    v34 = v14;
    v29 = v26;
    dispatch_after(v27, v28, block);
    dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
    v16->delay += 5;

  }
  objc_sync_exit(v16);

}

- (void)clearRepairFollowUpForClientID:(id)a3
{
  NSMutableDictionary *clientIDtoFollowupItemCache;
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;

  clientIDtoFollowupItemCache = self->clientIDtoFollowupItemCache;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](clientIDtoFollowupItemCache, "objectForKeyedSubscript:", v4));
  if (v5)
  {
    v17 = 0;
    v6 = objc_msgSend(0, "clearNotificationForItem:error:", v5, &v17);
    v7 = v17;
    if ((v6 & 1) == 0)
    {
      v8 = handleForCategory(1);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10000FFD4(v7);

    }
  }
  else
  {
    v7 = 0;
  }
  v10 = objc_msgSend(objc_alloc((Class)FLFollowUpController), "initWithClientIdentifier:", CFSTR("com.apple.mobilerepair"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v4, 0));

  v16 = v7;
  v12 = objc_msgSend(v10, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v11, &v16);
  v13 = v16;

  if ((v12 & 1) == 0)
  {
    v14 = handleForCategory(1);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10000FF58(v13);

  }
}

- (void)updateFollowupsToNewLocale
{
  dispatch_sync((dispatch_queue_t)qword_10001EAE0, &stru_1000187C0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->clientIDtoFollowupItemCache, 0);
}

@end
