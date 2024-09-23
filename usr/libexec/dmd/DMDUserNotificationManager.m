@implementation DMDUserNotificationManager

+ (DMDUserNotificationManager)sharedManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006C9A0;
  block[3] = &unk_1000BA638;
  block[4] = a1;
  if (qword_1000EBAE0 != -1)
    dispatch_once(&qword_1000EBAE0, block);
  return (DMDUserNotificationManager *)(id)qword_1000EBAD8;
}

- (DMDUserNotificationManager)init
{
  DMDUserNotificationManager *v2;
  void *v3;
  uint64_t v4;
  NSOperationQueue *v5;
  id v6;
  _QWORD v8[4];
  DMDUserNotificationManager *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DMDUserNotificationManager;
  v2 = -[DMDUserNotificationManager init](&v10, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v4 = MCAppWhitelistDidChangeNotification;
    v5 = objc_opt_new(NSOperationQueue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10006CAA8;
    v8[3] = &unk_1000BBEA0;
    v9 = v2;
    v6 = objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, v5, v8);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[DMDUserNotificationManager cancelAllNotificationsWithCompletionBlock:](self, "cancelAllNotificationsWithCompletionBlock:", 0);
  v4.receiver = self;
  v4.super_class = (Class)DMDUserNotificationManager;
  -[DMDUserNotificationManager dealloc](&v4, "dealloc");
}

- (void)mainQueueDidReceiveAppWhitelistChangedNotification
{
  id v2;
  NSObject *v3;

  v2 = sub_10006CBB8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  dispatch_barrier_sync(v3, &stru_1000BBEC0);

}

- (void)cancelAllNotificationsWithCompletionBlock:(id)a3
{
  -[DMDUserNotificationManager cancelNotificationEntriesMatchingPredicate:completionBlock:](self, "cancelNotificationEntriesMatchingPredicate:completionBlock:", &stru_1000BBF00, a3);
}

- (void)cancelNotificationEntriesMatchingPredicate:(id)a3 completionBlock:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10006D0C8;
    v7[3] = &unk_1000BBF50;
    v8 = v5;
    v9 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

  }
}

- (void)displayUserNotificationWithTitle:(id)a3 message:(id)a4 defaultButtonText:(id)a5 alternateButtonText:(id)a6 otherButtonText:(id)a7 displayOnLockScreen:(BOOL)a8 displayInAppWhitelistModes:(BOOL)a9 dismissAfterTimeInterval:(double)a10 assertion:(id)a11 completionBlock:(id)a12
{
  -[DMDUserNotificationManager displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:displayOnLockScreen:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:](self, "displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:displayOnLockScreen:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:", 0, a3, a4, a5, a6, a7, a10);
}

- (void)displayUserNotificationWithIdentifier:(id)a3 title:(id)a4 message:(id)a5 defaultButtonText:(id)a6 alternateButtonText:(id)a7 otherButtonText:(id)a8 displayOnLockScreen:(BOOL)a9 displayInAppWhitelistModes:(BOOL)a10 dismissAfterTimeInterval:(double)a11 assertion:(id)a12 completionBlock:(id)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  unsigned int v26;
  DMDUserNotificationQueueEntry *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  NSObject *v32;
  DMDUserNotificationQueueEntry *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  _QWORD block[4];
  DMDUserNotificationQueueEntry *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint8_t buf[16];

  v38 = a3;
  v19 = a4;
  v20 = a5;
  v37 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a12;
  v24 = a13;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v26 = objc_msgSend(v25, "appWhitelistState");

  if (a10 || !v26 || v26 == 6)
  {
    v27 = objc_opt_new(DMDUserNotificationQueueEntry);
    -[DMDUserNotificationQueueEntry setTitle:](v27, "setTitle:", v19);
    -[DMDUserNotificationQueueEntry setMessage:](v27, "setMessage:", v20);
    -[DMDUserNotificationQueueEntry setDefaultButtonText:](v27, "setDefaultButtonText:", v37);
    -[DMDUserNotificationQueueEntry setAlternateButtonText:](v27, "setAlternateButtonText:", v21);
    -[DMDUserNotificationQueueEntry setOtherButtonText:](v27, "setOtherButtonText:", v22);
    -[DMDUserNotificationQueueEntry setDisplayOnLockScreen:](v27, "setDisplayOnLockScreen:", a9);
    -[DMDUserNotificationQueueEntry setDisplayInAppWhitelistModes:](v27, "setDisplayInAppWhitelistModes:", a10);
    -[DMDUserNotificationQueueEntry setDismissAfterTimeInterval:](v27, "setDismissAfterTimeInterval:", a11);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10006D710;
    v41[3] = &unk_1000BB878;
    v28 = v23;
    v42 = v28;
    v43 = v24;
    -[DMDUserNotificationQueueEntry setCompletionBlock:](v27, "setCompletionBlock:", v41);
    v29 = v19;
    v30 = v38;
    -[DMDUserNotificationQueueEntry setIdentifier:](v27, "setIdentifier:", v38);
    objc_msgSend(v28, "park");
    v31 = sub_10006CBB8();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006D754;
    block[3] = &unk_1000BA4B0;
    v40 = v27;
    v33 = v27;
    dispatch_barrier_async(v32, block);

    v34 = v20;
    v35 = v29;
    v36 = v37;
  }
  else
  {
    v36 = v37;
    v34 = v20;
    v35 = v19;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not displaying notification in limited apps mode.", buf, 2u);
    }
    v30 = v38;
    if (v24)
      (*((void (**)(id, uint64_t))v24 + 2))(v24, 3);
  }

}

- (void)promptUserToLogIntoiTunesWithTitle:(id)a3 message:(id)a4 assertion:(id)a5 completionBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = sub_10006CBB8();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10006DE0C;
  v19[3] = &unk_1000BB4F8;
  v20 = v9;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v9;
  v18 = v12;
  dispatch_async(v14, v19);

}

@end
