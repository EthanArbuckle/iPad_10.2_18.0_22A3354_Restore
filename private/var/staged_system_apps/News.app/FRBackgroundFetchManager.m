@implementation FRBackgroundFetchManager

- (void)addFetchable:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread")
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_10007D240();
  }
  if (-[FRBackgroundFetchManager backgroundFetchInProgress](self, "backgroundFetchInProgress")
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_10007D184();
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRBackgroundFetchManager fetchables](self, "fetchables"));
  objc_msgSend(v5, "addObject:", v4);

}

+ (double)timeSinceLastBackgroundFetch
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("lastBackgroundFetchDate")));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    v6 = v5;

  }
  else
  {
    v6 = 1.79769313e308;
  }

  return v6;
}

- (FRBackgroundFetchManager)initWithResolver:(id)a3 appConfigManager:(id)a4 privateDataContext:(id)a5 subscriptionController:(id)a6 privateDataUpdateCoordinator:(id)a7 todayAgent:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  FRBackgroundFetchManager *v20;
  FRBackgroundFetchManager *v21;
  uint64_t v22;
  FRBackgroundFetchable *fetchables;
  id obj;
  id obja;
  id v27;
  void *v29;
  objc_super v30;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  obj = a7;
  v18 = a7;
  v27 = a8;
  v19 = a8;
  v29 = v14;
  if (!v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007D0CC();
    if (v15)
      goto LABEL_6;
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007D014();
LABEL_6:
  if (!v16 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007CF5C();
    if (v17)
      goto LABEL_11;
  }
  else if (v17)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007CEA4();
LABEL_11:
  if (!v18 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007CDEC();
    if (v19)
      goto LABEL_16;
  }
  else if (v19)
  {
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007CD34();
LABEL_16:
  v30.receiver = self;
  v30.super_class = (Class)FRBackgroundFetchManager;
  v20 = -[FRBackgroundFetchManager init](&v30, "init", obj);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_resolver, a3);
    objc_storeStrong((id *)&v21->_appConfigManager, a4);
    objc_storeStrong((id *)&v21->_privateDataContext, a5);
    objc_storeStrong((id *)&v21->_subscriptionController, a6);
    objc_storeStrong((id *)&v21->_privateDataUpdateCoordinator, obja);
    objc_storeStrong((id *)&v21->_todayAgent, v27);
    v22 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    fetchables = v21->_fetchables;
    v21->_fetchables = (FRBackgroundFetchable *)v22;

  }
  return v21;
}

- (FRBackgroundFetchable)fetchables
{
  return self->_fetchables;
}

- (BOOL)backgroundFetchInProgress
{
  return self->_backgroundFetchInProgress;
}

- (void)peformBackgroundFetchWithReason:(int64_t)a3 timeout:(double)a4 completionHandler:(id)a5
{
  void (**v8)(id, uint64_t, _QWORD);
  _QWORD v9[5];
  void (**v10)(id, uint64_t, _QWORD);

  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  +[NSThread isMainThread](NSThread, "isMainThread");
  if (-[FRBackgroundFetchManager backgroundFetchInProgress](self, "backgroundFetchInProgress"))
  {
    if (v8)
      v8[2](v8, 2, 0);
  }
  else
  {
    -[FRBackgroundFetchManager setBackgroundFetchInProgress:](self, "setBackgroundFetchInProgress:", 1);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003C1E0;
    v9[3] = &unk_1000DB8F0;
    v9[4] = self;
    v10 = v8;
    -[FRBackgroundFetchManager _peformBackgroundFetchWithReason:timeout:completionHandler:](self, "_peformBackgroundFetchWithReason:timeout:completionHandler:", a3, v9, a4);

  }
}

- (void)_peformBackgroundFetchWithReason:(int64_t)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  id v9;
  _QWORD *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD *v16;
  id v17;
  dispatch_time_t v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD v25[4];
  NSObject *v26;
  FRBackgroundFetchManager *v27;
  id v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[3];
  char v36;
  _QWORD v37[4];
  _QWORD v38[4];
  _QWORD v39[4];
  id v40;
  id v41;

  v7 = a5;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v18 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10003C518;
  v39[3] = &unk_1000DB8F0;
  v9 = v8;
  v40 = v9;
  v17 = v7;
  v41 = v17;
  v10 = objc_retainBlock(v39);
  v11 = dispatch_group_create();
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 1;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 1;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = sub_1000185E4;
  v33[4] = sub_100018514;
  v34 = 0;
  dispatch_group_enter(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRBackgroundFetchManager appConfigManager](self, "appConfigManager"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10003C598;
  v25[3] = &unk_1000DB990;
  v29 = v38;
  v30 = v37;
  v13 = v11;
  v26 = v13;
  v27 = self;
  v31 = v35;
  v32 = v33;
  v14 = v9;
  v28 = v14;
  objc_msgSend(v12, "fetchAppConfigurationIfNeededWithCompletion:", v25);

  v15 = &_dispatch_main_q;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10003CCD8;
  v19[3] = &unk_1000DB9B8;
  v21 = v35;
  v22 = v33;
  v23 = v38;
  v24 = v37;
  v16 = v10;
  v20 = v16;
  FCDispatchGroupNotifyWithTimeout(v13, &_dispatch_main_q, v18, v19);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v38, 8);

}

- (TFResolver)resolver
{
  return self->_resolver;
}

- (void)setResolver:(id)a3
{
  objc_storeStrong((id *)&self->_resolver, a3);
}

- (FCNewsAppConfigurationManager)appConfigManager
{
  return self->_appConfigManager;
}

- (void)setAppConfigManager:(id)a3
{
  objc_storeStrong((id *)&self->_appConfigManager, a3);
}

- (FCPrivateDataContext)privateDataContext
{
  return self->_privateDataContext;
}

- (void)setPrivateDataContext:(id)a3
{
  objc_storeStrong((id *)&self->_privateDataContext, a3);
}

- (FCSubscriptionController)subscriptionController
{
  return self->_subscriptionController;
}

- (void)setSubscriptionController:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionController, a3);
}

- (FRPrivateDataUpdateCoordinator)privateDataUpdateCoordinator
{
  return self->_privateDataUpdateCoordinator;
}

- (void)setPrivateDataUpdateCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_privateDataUpdateCoordinator, a3);
}

- (FRTodayAgent)todayAgent
{
  return self->_todayAgent;
}

- (void)setTodayAgent:(id)a3
{
  objc_storeStrong((id *)&self->_todayAgent, a3);
}

- (void)setBackgroundFetchInProgress:(BOOL)a3
{
  self->_backgroundFetchInProgress = a3;
}

- (void)setFetchables:(id)a3
{
  objc_storeStrong((id *)&self->_fetchables, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchables, 0);
  objc_storeStrong((id *)&self->_todayAgent, 0);
  objc_storeStrong((id *)&self->_privateDataUpdateCoordinator, 0);
  objc_storeStrong((id *)&self->_subscriptionController, 0);
  objc_storeStrong((id *)&self->_privateDataContext, 0);
  objc_storeStrong((id *)&self->_appConfigManager, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
}

@end
