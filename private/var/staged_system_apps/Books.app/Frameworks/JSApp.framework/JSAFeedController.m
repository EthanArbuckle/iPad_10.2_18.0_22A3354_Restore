@implementation JSAFeedController

- (JSAFeedController)initWithOptions:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  JSAFeedController *v9;
  JSAFeedController *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_attr_t initially_inactive;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *access;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v7 = a3;
  v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)JSAFeedController;
  v9 = -[JSAFeedController init](&v27, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_options, a3);
    v10->_didNotifyInitialContentReady = 0;
    v10->_didNotifyInitialContentReadyLock._os_unfair_lock_opaque = 0;
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_USER_INTERACTIVE, 0);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    initially_inactive = dispatch_queue_attr_make_initially_inactive(v14);
    v16 = objc_claimAutoreleasedReturnValue(initially_inactive);
    v17 = dispatch_queue_create("JSAFeedViewController.access", v16);
    access = v10->_access;
    v10->_access = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v10->_bridgeCompletion, a4);
    v20 = objc_opt_class(NSNumber, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("isRootFeed")));
    v22 = BUDynamicCast(v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v10->_isRootFeed = objc_msgSend(v23, "BOOLValue");

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("metadata")));
    sub_174CC((uint64_t)v10, v24);

    sub_17534((uint64_t)v10, 0);
    if (+[JSADevice isInternalBuild](JSADevice, "isInternalBuild"))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[JSAHotReloadController sharedController](JSAHotReloadController, "sharedController"));
      objc_msgSend(v25, "subscribe:", v10);

    }
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (+[JSADevice isInternalBuild](JSADevice, "isInternalBuild"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[JSAHotReloadController sharedController](JSAHotReloadController, "sharedController"));
    objc_msgSend(v3, "unsubscribe:", self);

  }
  dispatch_activate((dispatch_object_t)self->_access);
  v4.receiver = self;
  v4.super_class = (Class)JSAFeedController;
  -[JSAFeedController dealloc](&v4, "dealloc");
}

- (void)requestEntriesWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD *v14;
  OS_dispatch_queue *v15;
  OS_dispatch_queue *v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[5];
  OS_dispatch_queue *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  os_signpost_id_t v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  JSAFeedController *v35;

  v4 = a3;
  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v33 = "-[JSAFeedController requestEntriesWithCompletion:]";
    v34 = 2048;
    v35 = self;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s %p: start", buf, 0x16u);
  }

  v7 = JSASignpostFeedController();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_signpost_id_generate(v8);

  v10 = JSASignpostFeedController();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Request Entries", ", buf, 2u);
  }

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_179B8;
  v29[3] = &unk_9E8D8;
  v31 = v9;
  v13 = v4;
  v30 = v13;
  v14 = objc_retainBlock(v29);
  objc_initWeak((id *)buf, self);
  v15 = self->_access;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_17A74;
  v25[3] = &unk_9E928;
  v25[4] = self;
  objc_copyWeak(&v28, (id *)buf);
  v16 = v15;
  v26 = v16;
  v17 = v14;
  v27 = v17;
  v18 = objc_retainBlock(v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_17D34;
  v22[3] = &unk_9E950;
  v22[4] = self;
  v20 = v18;
  v23 = v20;
  v21 = v17;
  v24 = v21;
  objc_msgSend(v19, "enqueueBlock:file:line:", v22, CFSTR("JSAFeedController.m"), 166);

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);

}

- (void)requestCompleteDataForEntry:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[2];

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[JSAFeedController feed](self, "feed"));
  v12[0] = v7;
  v10 = objc_retainBlock(v6);

  v12[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));

  objc_msgSend(v8, "enqueueValueInvocation:method:arguments:file:line:", v9, CFSTR("requestEntryCompleteData"), v11, CFSTR("JSAFeedController.m"), 171);
}

- (BOOL)executeBehaviorNamed:(id)a3 forEntry:(id)a4 withArguments:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("MORE")))
  {
    v11 = objc_loadWeakRetained(&location);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "feed"));
    sub_181C4(v12, v8, v9, v10);

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_18318;
    v15[3] = &unk_9E978;
    objc_copyWeak(&v19, &location);
    v16 = v8;
    v17 = v9;
    v18 = v10;
    objc_msgSend(v13, "enqueueBlock:file:line:", v15, CFSTR("JSAFeedController.m"), 200);

    objc_destroyWeak(&v19);
  }
  objc_destroyWeak(&location);

  return 1;
}

- (void)reload
{
  sub_18370((uint64_t)self, 0);
}

- (void)updateContentWithData:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  JSAFeedController *v14;

  v4 = a3;
  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v12 = "-[JSAFeedController updateContentWithData:]";
    v13 = 2048;
    v14 = self;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s %p:", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_19000;
  v8[3] = &unk_9E888;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v4;
  v7 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)viewStateDidUpdate:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *viewState;
  _QWORD v8[4];
  id v9[2];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  JSAFeedController *v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v11 = "-[JSAFeedController viewStateDidUpdate:]";
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s %p: to %@", buf, 0x20u);
  }

  viewState = (void *)self->_viewState;
  self->_viewState = (int64_t)sub_191A8(self, v4);
  objc_initWeak((id *)buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_19238;
  v8[3] = &unk_9EA18;
  objc_copyWeak(v9, (id *)buf);
  v9[1] = viewState;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
  objc_destroyWeak(v9);
  objc_destroyWeak((id *)buf);

}

- (void)setFeedDataRequestPriority:(float)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  JSAFeedController *v16;
  __int16 v17;
  double v18;

  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v14 = "-[JSAFeedController setFeedDataRequestPriority:]";
    v15 = 2048;
    v16 = self;
    v17 = 2048;
    v18 = a3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s %p: => %0.1f", buf, 0x20u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[JSAFeedController feed](self, "feed"));
  *(float *)&v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9));
  v12 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  objc_msgSend(v7, "enqueueValueInvocation:method:arguments:file:line:", v8, CFSTR("setRequestsPriority"), v11, CFSTR("JSAFeedController.m"), 292);

}

- (void)pushViewController:(id)a3 :(BOOL)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  BOOL v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  JSAFeedController *v17;
  __int16 v18;
  id v19;

  v6 = a3;
  v7 = JSALog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v15 = "-[JSAFeedController pushViewController::]";
    v16 = 2048;
    v17 = self;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s %p: %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_19580;
  v10[3] = &unk_9EA40;
  objc_copyWeak(&v12, (id *)buf);
  v10[4] = self;
  v9 = v6;
  v11 = v9;
  v13 = a4;
  -[JSAFeedController _convertOrCreateViewController:completion:](self, "_convertOrCreateViewController:completion:", v9, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

}

- (void)replaceCurrentFeedViewController:(id)a3 :(BOOL)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  JSAFeedController *v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = JSALog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v13 = "-[JSAFeedController replaceCurrentFeedViewController::]";
    v14 = 2048;
    v15 = self;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s %p: %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1993C;
  v9[3] = &unk_9EA68;
  objc_copyWeak(&v10, (id *)buf);
  v11 = a4;
  -[JSAFeedController _convertOrCreateViewController:completion:](self, "_convertOrCreateViewController:completion:", v6, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);

}

- (void)presentViewController:(id)a3 :(BOOL)a4 :(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  JSAFeedController *v20;
  __int16 v21;
  id v22;

  v8 = a3;
  v9 = a5;
  v10 = JSALog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v18 = "-[JSAFeedController presentViewController:::]";
    v19 = 2048;
    v20 = self;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}s %p: %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_19B5C;
  v13[3] = &unk_9EA90;
  objc_copyWeak(&v15, (id *)buf);
  v16 = a4;
  v12 = v9;
  v14 = v12;
  -[JSAFeedController _convertOrCreateViewController:completion:](self, "_convertOrCreateViewController:completion:", v8, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

- (void)presentScreenshotViewController:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  JSAFeedController *v14;

  v4 = a3;
  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v12 = "-[JSAFeedController presentScreenshotViewController:]";
    v13 = 2048;
    v14 = self;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s %p", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_19D30;
  v8[3] = &unk_9E888;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v4;
  v7 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)slideInFeedViewController:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  JSAFeedController *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
    *(_DWORD *)buf = 136446722;
    v11 = "-[JSAFeedController slideInFeedViewController:]";
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s %p: %@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_19EF0;
  v8[3] = &unk_9EAB8;
  objc_copyWeak(&v9, (id *)buf);
  -[JSAFeedController _convertOrCreateViewController:completion:](self, "_convertOrCreateViewController:completion:", v4, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);

}

- (void)presentFeedViewControllerInPopover:(id)a3 :(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  JSAFeedController *v18;
  __int16 v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = JSALog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    *(_DWORD *)buf = 136446722;
    v16 = "-[JSAFeedController presentFeedViewControllerInPopover::]";
    v17 = 2048;
    v18 = self;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}s %p: %@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1A110;
  v12[3] = &unk_9EAE0;
  objc_copyWeak(&v14, (id *)buf);
  v11 = v7;
  v13 = v11;
  -[JSAFeedController _convertOrCreateViewController:completion:](self, "_convertOrCreateViewController:completion:", v6, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

- (void)popViewController:(BOOL)a3 :(id)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD *v10;
  _QWORD v11[4];
  _QWORD *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  JSAFeedController *v20;
  __int16 v21;
  _BOOL4 v22;

  v4 = a3;
  v6 = a4;
  v7 = JSALog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v18 = "-[JSAFeedController popViewController::]";
    v19 = 2048;
    v20 = self;
    v21 = 1024;
    v22 = v4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s %p: animated=%{BOOL}d", buf, 0x1Cu);
  }

  objc_initWeak((id *)buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1A380;
  v13[3] = &unk_9EB08;
  objc_copyWeak(&v15, (id *)buf);
  v16 = v4;
  v9 = v6;
  v14 = v9;
  v10 = objc_retainBlock(v13);
  if (v10)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v10[2])(v10);
    }
    else
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1A428;
      v11[3] = &unk_9DCD0;
      v12 = v10;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

    }
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

- (void)popToRootViewController:(BOOL)a3 :(id)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD *v10;
  _QWORD v11[4];
  _QWORD *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  JSAFeedController *v20;
  __int16 v21;
  _BOOL4 v22;

  v4 = a3;
  v6 = a4;
  v7 = JSALog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v18 = "-[JSAFeedController popToRootViewController::]";
    v19 = 2048;
    v20 = self;
    v21 = 1024;
    v22 = v4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s %p: animated=%{BOOL}d", buf, 0x1Cu);
  }

  objc_initWeak((id *)buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1A61C;
  v13[3] = &unk_9EB08;
  objc_copyWeak(&v15, (id *)buf);
  v16 = v4;
  v9 = v6;
  v14 = v9;
  v10 = objc_retainBlock(v13);
  if (v10)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v10[2])(v10);
    }
    else
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1A6C4;
      v11[3] = &unk_9DCD0;
      v12 = v10;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

    }
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

- (void)dismissViewController:(BOOL)a3 :(id)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD *v10;
  _QWORD v11[4];
  _QWORD *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  JSAFeedController *v20;
  __int16 v21;
  _BOOL4 v22;

  v4 = a3;
  v6 = a4;
  v7 = JSALog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v18 = "-[JSAFeedController dismissViewController::]";
    v19 = 2048;
    v20 = self;
    v21 = 1024;
    v22 = v4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s %p: animated=%{BOOL}d", buf, 0x1Cu);
  }

  objc_initWeak((id *)buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1A8B8;
  v13[3] = &unk_9EB08;
  objc_copyWeak(&v15, (id *)buf);
  v16 = v4;
  v9 = v6;
  v14 = v9;
  v10 = objc_retainBlock(v13);
  if (v10)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v10[2])(v10);
    }
    else
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1A944;
      v11[3] = &unk_9DCD0;
      v12 = v10;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

    }
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

- (void)presentCardsWithOptions:(id)a3 :(unint64_t)a4 :(id)a5 :(BOOL)a6 :(id)a7 :(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD block[4];
  _QWORD *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32[2];
  BOOL v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  JSAFeedController *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;

  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v18 = JSALog();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "count")));
    *(_DWORD *)buf = 136446978;
    v35 = "-[JSAFeedController presentCardsWithOptions::::::]";
    v36 = 2048;
    v37 = self;
    v38 = 2112;
    v39 = v20;
    v40 = 2112;
    v41 = v21;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "%{public}s %p: %@ of %@", buf, 0x2Au);

  }
  objc_initWeak((id *)buf, self);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1ABFC;
  v28[3] = &unk_9EB30;
  objc_copyWeak(v32, (id *)buf);
  v22 = v17;
  v29 = v22;
  v23 = v14;
  v30 = v23;
  v32[1] = (id)a4;
  v33 = a6;
  v24 = v16;
  v31 = v24;
  v25 = objc_retainBlock(v28);
  if (v25)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v25[2])(v25);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1AD24;
      block[3] = &unk_9DCD0;
      v27 = v25;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

  objc_destroyWeak(v32);
  objc_destroyWeak((id *)buf);

}

- (void)presentCards:(id)a3 :(unint64_t)a4 :(BOOL)a5 :(id)a6 :(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD block[4];
  _QWORD *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29[2];
  BOOL v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  JSAFeedController *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = JSALog();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count")));
    *(_DWORD *)buf = 136446978;
    v32 = "-[JSAFeedController presentCards:::::]";
    v33 = 2048;
    v34 = self;
    v35 = 2112;
    v36 = v17;
    v37 = 2112;
    v38 = v18;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "%{public}s %p: %@ of %@", buf, 0x2Au);

  }
  objc_initWeak((id *)buf, self);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1AFCC;
  v25[3] = &unk_9EB30;
  objc_copyWeak(v29, (id *)buf);
  v19 = v14;
  v26 = v19;
  v20 = v12;
  v27 = v20;
  v29[1] = (id)a4;
  v30 = a5;
  v21 = v13;
  v28 = v21;
  v22 = objc_retainBlock(v25);
  if (v22)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v22[2])(v22);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1B0F4;
      block[3] = &unk_9DCD0;
      v24 = v22;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

  objc_destroyWeak(v29);
  objc_destroyWeak((id *)buf);

}

- (void)appendToPresentedCards:(id)a3 :(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[4];
  _QWORD *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  JSAFeedController *v23;
  __int16 v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  v8 = JSALog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count")));
    *(_DWORD *)buf = 136446722;
    v21 = "-[JSAFeedController appendToPresentedCards::]";
    v22 = 2048;
    v23 = self;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}s %p: adding %@ cards", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1B334;
  v16[3] = &unk_9DDD8;
  objc_copyWeak(&v19, (id *)buf);
  v11 = v6;
  v17 = v11;
  v12 = v7;
  v18 = v12;
  v13 = objc_retainBlock(v16);
  if (v13)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v13[2])(v13);
    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1B398;
      v14[3] = &unk_9DCD0;
      v15 = v13;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);

    }
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

}

- (void)didLoadCardResource:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD *v8;
  _QWORD block[4];
  _QWORD *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  JSAFeedController *v17;
  __int16 v18;
  id v19;

  v4 = a3;
  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v15 = "-[JSAFeedController didLoadCardResource:]";
    v16 = 2048;
    v17 = self;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s %p: has loaded card resource: %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1B584;
  v11[3] = &unk_9E888;
  objc_copyWeak(&v13, (id *)buf);
  v7 = v4;
  v12 = v7;
  v8 = objc_retainBlock(v11);
  if (v8)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v8[2])(v8);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1B5E8;
      block[3] = &unk_9DCD0;
      v10 = v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

- (void)performRawActionModel:(id)a3 shouldReportFigaro:(BOOL)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD *v10;
  _QWORD v11[4];
  _QWORD *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  JSAFeedController *v20;
  __int16 v21;
  id v22;

  v6 = a3;
  v7 = JSALog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v18 = "-[JSAFeedController performRawActionModel:shouldReportFigaro:]";
    v19 = 2048;
    v20 = self;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s %p: performing FlowAction: %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1B7DC;
  v13[3] = &unk_9EB08;
  objc_copyWeak(&v15, (id *)buf);
  v9 = v6;
  v14 = v9;
  v16 = a4;
  v10 = objc_retainBlock(v13);
  if (v10)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v10[2])(v10);
    }
    else
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1B844;
      v11[3] = &unk_9DCD0;
      v12 = v10;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

    }
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

- (void)performRawFlowAction:(id)a3 shouldReportFigaro:(BOOL)a4
{
  -[JSAFeedController performRawActionModel:shouldReportFigaro:](self, "performRawActionModel:shouldReportFigaro:", a3, a4);
}

- (void)collectAndFlush:(BOOL)a3 accumulatedImpressionsWithCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _BYTE *v18;
  id v19;
  BOOL v20;
  id location;
  _BYTE buf[24];
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a4;
  v7 = JSALog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[JSAFeedController collectAndFlush:accumulatedImpressionsWithCompletion:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s %p", buf, 0x16u);
  }

  objc_initWeak(&location, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[JSAFeedController delegate](self, "delegate"));
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v23 = sub_1BAA0;
  v24 = sub_1BAB0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[JSAFeedController dataSource](self, "dataSource"));
  v25 = objc_msgSend(v10, "newAnalyticsSessionExtendingAssertionForFeedController:", self);

  if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v11 = JSALog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_72624();

  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1BAB8;
  v15[3] = &unk_9EBA8;
  objc_copyWeak(&v19, &location);
  v20 = a3;
  v16 = v9;
  v17 = v6;
  v18 = buf;
  v13 = v6;
  v14 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);

  objc_destroyWeak(&v19);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
}

- (void)collectVisibleImpressionsWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  _BYTE *v13;
  id v14;
  id location;
  _BYTE buf[24];
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[JSAFeedController collectVisibleImpressionsWithCompletion:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s %p", buf, 0x16u);
  }

  objc_initWeak(&location, self);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v17 = sub_1BAA0;
  v18 = sub_1BAB0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[JSAFeedController dataSource](self, "dataSource"));
  v19 = objc_msgSend(v7, "newAnalyticsSessionExtendingAssertionForFeedController:", self);

  if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v8 = JSALog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_72690();

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1BF48;
  block[3] = &unk_9EBD0;
  objc_copyWeak(&v14, &location);
  block[4] = self;
  v12 = v4;
  v13 = buf;
  v10 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v14);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
}

- (void)resetImpressions
{
  id v3;
  NSObject *v4;
  _QWORD *v5;
  _QWORD v6[4];
  _QWORD *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  JSAFeedController *v13;

  v3 = JSALog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v11 = "-[JSAFeedController resetImpressions]";
    v12 = 2048;
    v13 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s %p", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1C37C;
  v8[3] = &unk_9DF80;
  objc_copyWeak(&v9, (id *)buf);
  v5 = objc_retainBlock(v8);
  if (v5)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v5[2])(v5);
    }
    else
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1C3D8;
      v6[3] = &unk_9DCD0;
      v7 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

    }
  }

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)collectStatsWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  _BYTE *v13;
  id v14;
  id location;
  _BYTE buf[24];
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[JSAFeedController collectStatsWithCompletion:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s %p", buf, 0x16u);
  }

  objc_initWeak(&location, self);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v17 = sub_1BAA0;
  v18 = sub_1BAB0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[JSAFeedController dataSource](self, "dataSource"));
  v19 = objc_msgSend(v7, "newAnalyticsSessionExtendingAssertionForFeedController:", self);

  if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v8 = JSALog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_726FC();

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1C5F4;
  block[3] = &unk_9EBD0;
  objc_copyWeak(&v14, &location);
  block[4] = self;
  v12 = v4;
  v13 = buf;
  v10 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v14);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
}

- (void)dismissKeyboard
{
  id v3;
  NSObject *v4;
  _QWORD *v5;
  _QWORD v6[4];
  _QWORD *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  JSAFeedController *v13;

  v3 = JSALog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v11 = "-[JSAFeedController dismissKeyboard]";
    v12 = 2048;
    v13 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s %p", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1CA28;
  v8[3] = &unk_9DF80;
  objc_copyWeak(&v9, (id *)buf);
  v5 = objc_retainBlock(v8);
  if (v5)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v5[2])(v5);
    }
    else
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1CA88;
      v6[3] = &unk_9DCD0;
      v7 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

    }
  }

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)scrollToItem:(id)a3 :(BOOL)a4 :(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD *v12;
  _QWORD v13[4];
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  BOOL v18;
  BOOL v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  JSAFeedController *v23;
  __int16 v24;
  id v25;

  v8 = a3;
  v9 = JSALog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v21 = "-[JSAFeedController scrollToItem:::]";
    v22 = 2048;
    v23 = self;
    v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}s %p: %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1CC8C;
  v15[3] = &unk_9EC20;
  objc_copyWeak(&v17, (id *)buf);
  v11 = v8;
  v16 = v11;
  v18 = a4;
  v19 = a5;
  v12 = objc_retainBlock(v15);
  if (v12)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v12[2])(v12);
    }
    else
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1CCFC;
      v13[3] = &unk_9DCD0;
      v14 = v12;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

    }
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (void)requestToSetNavigationBarHidden:(BOOL)a3 :(BOOL)a4
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  _QWORD *v9;
  _QWORD block[4];
  _QWORD *v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  BOOL v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  JSAFeedController *v19;
  __int16 v20;
  _BOOL4 v21;

  v5 = a3;
  v7 = JSALog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v17 = "-[JSAFeedController requestToSetNavigationBarHidden::]";
    v18 = 2048;
    v19 = self;
    v20 = 1024;
    v21 = v5;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s %p: hidden=%{BOOL}d", buf, 0x1Cu);
  }

  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1CED8;
  v12[3] = &unk_9EC48;
  objc_copyWeak(&v13, (id *)buf);
  v14 = v5;
  v15 = a4;
  v9 = objc_retainBlock(v12);
  if (v9)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v9[2])(v9);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1CF40;
      block[3] = &unk_9DCD0;
      v11 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)renderSharableImage:(id)a3 :(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD v13[4];
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  JSAFeedController *v22;

  v6 = a3;
  v7 = a4;
  v8 = JSALog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v20 = "-[JSAFeedController renderSharableImage::]";
    v21 = 2048;
    v22 = self;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}s %p", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1D14C;
  v15[3] = &unk_9DDD8;
  objc_copyWeak(&v18, (id *)buf);
  v10 = v6;
  v16 = v10;
  v11 = v7;
  v17 = v11;
  v12 = objc_retainBlock(v15);
  if (v12)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v12[2])(v12);
    }
    else
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1D1B0;
      v13[3] = &unk_9DCD0;
      v14 = v12;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

    }
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

}

- (void)addAlphaOverrideToItem:(id)a3 :(double)a4 :(BOOL)a5 :(double)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[4];
  _QWORD *v16;
  _QWORD v17[4];
  id v18;
  id v19[3];
  BOOL v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  JSAFeedController *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  double v28;

  v10 = a3;
  v11 = JSALog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v22 = "-[JSAFeedController addAlphaOverrideToItem::::]";
    v23 = 2048;
    v24 = self;
    v25 = 2112;
    v26 = v10;
    v27 = 2048;
    v28 = a4;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}s %p: %@ alpha=%0.1g", buf, 0x2Au);
  }

  objc_initWeak((id *)buf, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1D3C8;
  v17[3] = &unk_9EC70;
  objc_copyWeak(v19, (id *)buf);
  v13 = v10;
  v18 = v13;
  v20 = a5;
  v19[1] = *(id *)&a4;
  v19[2] = *(id *)&a6;
  v14 = objc_retainBlock(v17);
  if (v14)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v14[2])(v14);
    }
    else
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1D438;
      v15[3] = &unk_9DCD0;
      v16 = v14;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);

    }
  }

  objc_destroyWeak(v19);
  objc_destroyWeak((id *)buf);

}

- (void)removeAlphaOverrideFromItem:(id)a3 :(BOOL)a4 :(double)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD *v12;
  _QWORD block[4];
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  id v17[2];
  BOOL v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  JSAFeedController *v22;
  __int16 v23;
  id v24;

  v8 = a3;
  v9 = JSALog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v20 = "-[JSAFeedController removeAlphaOverrideFromItem:::]";
    v21 = 2048;
    v22 = self;
    v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}s %p: %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1D634;
  v15[3] = &unk_9EC98;
  objc_copyWeak(v17, (id *)buf);
  v11 = v8;
  v16 = v11;
  v18 = a4;
  v17[1] = *(id *)&a5;
  v12 = objc_retainBlock(v15);
  if (v12)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v12[2])(v12);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1D6A4;
      block[3] = &unk_9DCD0;
      v14 = v12;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

  objc_destroyWeak(v17);
  objc_destroyWeak((id *)buf);

}

- (void)showLoadingView
{
  id v3;
  NSObject *v4;
  _QWORD *v5;
  _QWORD v6[4];
  _QWORD *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  JSAFeedController *v13;

  v3 = JSALog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v11 = "-[JSAFeedController showLoadingView]";
    v12 = 2048;
    v13 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s %p", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1D864;
  v8[3] = &unk_9DF80;
  objc_copyWeak(&v9, (id *)buf);
  v5 = objc_retainBlock(v8);
  if (v5)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v5[2])(v5);
    }
    else
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1D8C0;
      v6[3] = &unk_9DCD0;
      v7 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

    }
  }

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)hideLoadingView
{
  id v3;
  NSObject *v4;
  _QWORD *v5;
  _QWORD v6[4];
  _QWORD *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  JSAFeedController *v13;

  v3 = JSALog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v11 = "-[JSAFeedController hideLoadingView]";
    v12 = 2048;
    v13 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s %p", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1DA80;
  v8[3] = &unk_9DF80;
  objc_copyWeak(&v9, (id *)buf);
  v5 = objc_retainBlock(v8);
  if (v5)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v5[2])(v5);
    }
    else
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1DADC;
      v6[3] = &unk_9DCD0;
      v7 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

    }
  }

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)addWeakTriggerObserver:(id)a3 :(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[4];
  _QWORD *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  JSAFeedController *v22;
  __int16 v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = JSALog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v20 = "-[JSAFeedController addWeakTriggerObserver::]";
    v21 = 2048;
    v22 = self;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}s %p: %@", buf, 0x20u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[JSManagedValue managedValueWithValue:](JSManagedValue, "managedValueWithValue:", v7));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1DCC0;
  v16[3] = &unk_9E208;
  v16[4] = self;
  v11 = v6;
  v17 = v11;
  v12 = v10;
  v18 = v12;
  v13 = objc_retainBlock(v16);
  if (v13)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v13[2])(v13);
    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1E0F8;
      v14[3] = &unk_9DCD0;
      v15 = v13;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);

    }
  }

}

- (void)notifyScrollViewReachedTheBottom
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1E1AC;
  v3[3] = &unk_9DF80;
  objc_copyWeak(&v4, &location);
  sub_1E22C(self, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)notifyOnAppear
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1E410;
  v3[3] = &unk_9DF80;
  objc_copyWeak(&v4, &location);
  sub_1E22C(self, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)notifyDidAppear
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1E4E4;
  v3[3] = &unk_9DF80;
  objc_copyWeak(&v4, &location);
  sub_1E22C(self, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)notifyOnDisappear
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1E5B8;
  v3[3] = &unk_9DF80;
  objc_copyWeak(&v4, &location);
  sub_1E22C(self, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)notifyInitialContentReady
{
  os_unfair_lock_s *p_didNotifyInitialContentReadyLock;
  _QWORD *v4;
  _QWORD v5[4];
  id v6;
  id location;
  _QWORD v8[2];
  uint64_t (*v9)(uint64_t);
  void *v10;
  JSAFeedController *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  p_didNotifyInitialContentReadyLock = &self->_didNotifyInitialContentReadyLock;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v9 = sub_1E734;
  v10 = &unk_9E0D8;
  v11 = self;
  v12 = &v13;
  v4 = v8;
  os_unfair_lock_lock_with_options(p_didNotifyInitialContentReadyLock, 0x10000);
  v9((uint64_t)v4);
  os_unfair_lock_unlock(p_didNotifyInitialContentReadyLock);

  if (*((_BYTE *)v14 + 24))
  {
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1E758;
    v5[3] = &unk_9DF80;
    objc_copyWeak(&v6, &location);
    sub_1E22C(self, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v13, 8);
}

- (void)allContentReady
{
  -[JSAFeedController notifyInitialContentReady](self, "notifyInitialContentReady");
}

- (void)notifyParentCardWillDismissWithReason:(id)a3 targetFeed:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1E8D0;
  v10[3] = &unk_9DDD8;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v11 = v8;
  v9 = v7;
  v12 = v9;
  sub_1E22C(self, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)notifyAnalyticsVisibilityDidAppear
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1EABC;
  v3[3] = &unk_9DF80;
  objc_copyWeak(&v4, &location);
  sub_1E22C(self, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)notifyAnalyticsVisibilityWillDisappear
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[JSAFeedController dataSource](self, "dataSource"));
  v4 = objc_msgSend(v3, "newAnalyticsSessionAssertionForFeedController:", self);

  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1EBCC;
  v6[3] = &unk_9E888;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  sub_1E22C(self, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)notifyOnMessageActionTriggered:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[JSAFeedController feed](self, "feed"));
  v8 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  objc_msgSend(v5, "enqueueValueInvocation:method:arguments:file:line:", v6, CFSTR("onMessageActionTriggered"), v7, CFSTR("JSAFeedController.m"), 901);
}

- (UIViewController)viewController
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  const char *v9;

  v3 = JSALog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446210;
    v9 = "-[JSAFeedController viewController]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[JSAFeedController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostViewControllerForFeedController:", self));

  return (UIViewController *)v6;
}

- (NSDictionary)metrics
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  const char *v9;

  v3 = JSALog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446210;
    v9 = "-[JSAFeedController metrics]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[JSAFeedController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metricsForFeedController:", self));

  return (NSDictionary *)v6;
}

- (BSUIDynamicValue)currentStackName
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  const char *v9;

  v3 = JSALog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446210;
    v9 = "-[JSAFeedController currentStackName]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[JSAFeedController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentStackNameForFeedController:", self));

  return (BSUIDynamicValue *)v6;
}

- (BOOL)hasPresentingFeed
{
  id v3;
  NSObject *v4;
  void *v5;
  unsigned __int8 v6;
  int v8;
  const char *v9;
  __int16 v10;
  JSAFeedController *v11;

  v3 = JSALog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = "-[JSAFeedController hasPresentingFeed]";
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s %p", (uint8_t *)&v8, 0x16u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[JSAFeedController dataSource](self, "dataSource"));
  v6 = objc_msgSend(v5, "isPresentedForFeedController:", self);

  return v6;
}

- (id)analyticsTracker
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  JSAFeedController *v11;

  v3 = JSALog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = "-[JSAFeedController analyticsTracker]";
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s %p", (uint8_t *)&v8, 0x16u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[JSAFeedController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "analyticsTrackerForFeedController:", self));

  return v6;
}

- (void)setFeedBridged:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  JSAFeedController *v17;

  v3 = a3;
  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "-[JSAFeedController setFeedBridged:]";
    v16 = 2048;
    v17 = self;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s %p", buf, 0x16u);
  }

  if (self->_feedBridged != v3)
  {
    self->_feedBridged = v3;
    if (v3)
    {
      dispatch_activate((dispatch_object_t)self->_access);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[JSAFeedController bridgeCompletion](self, "bridgeCompletion"));
      v9 = -[JSAFeedController feedBridged](self, "feedBridged");
      if (v9)
      {
        self = (JSAFeedController *)objc_claimAutoreleasedReturnValue(-[JSAFeedController feed](self, "feed"));
        v10 = -[JSAFeedController isObject](self, "isObject");
      }
      else
      {
        v10 = 0;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10));
      v13 = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
      objc_msgSend(v7, "enqueueValueCall:arguments:file:line:", v8, v12, CFSTR("JSAFeedController.m"), 951);

      if (v9)
    }
  }
}

- (void)hotReloadControllerWillReloadScript:(id)a3 completion:(id)a4
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1F4D8;
  v5[3] = &unk_9E2F8;
  v5[4] = self;
  v6 = a4;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)hotReloadControllerDidReloadScript:(id)a3 completion:(id)a4
{
  sub_18370((uint64_t)self, a4);
}

- (void)tearDownWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  JSValue *bridgeCompletion;
  JSValue *feed;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _BYTE *v15;
  id v16;
  id location;
  _BYTE buf[24];
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  JSValue *v21;

  v4 = a3;
  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[JSAFeedController tearDownWithCompletion:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s %p", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v19 = sub_1BAA0;
  v20 = sub_1BAB0;
  v21 = self->_feed;
  bridgeCompletion = self->_bridgeCompletion;
  self->_bridgeCompletion = 0;

  feed = self->_feed;
  self->_feed = 0;

  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    objc_initWeak(&location, self);
    global_queue = dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue(global_queue);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1FFEC;
    v13[3] = &unk_9EE20;
    v15 = buf;
    objc_copyWeak(&v16, &location);
    v14 = v4;
    dispatch_async(v10, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v11 = objc_retainBlock(v4);
    v12 = v11;
    if (v11)
      (*((void (**)(id))v11 + 2))(v11);

  }
  _Block_object_dispose(buf, 8);

}

- (void)_convertOrCreateViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id location;
  _QWORD block[4];
  id v29;
  id v30;

  v6 = a3;
  v7 = a4;
  v9 = objc_opt_class(UIViewController, v8);
  v10 = BUDynamicCast(v9, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v13 = v11;
  if (v11)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_20498;
    block[3] = &unk_9E630;
    v30 = v7;
    v29 = v11;
    v14 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    v15 = objc_opt_class(NSDictionary, v12);
    v16 = BUDynamicCast(v15, v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (!v17)
    {
      v18 = JSALog();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_72768((uint64_t)v6, v19);

    }
    objc_initWeak(&location, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_204DC;
    v22[3] = &unk_9EE98;
    objc_copyWeak(&v26, &location);
    v22[4] = self;
    v23 = v17;
    v24 = v6;
    v25 = v7;
    v20 = v7;
    v21 = v17;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v22);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

}

- (NSDictionary)options
{
  return self->_options;
}

- (NSArray)entries
{
  return self->_entries;
}

- (JSAFeedControllerDataSource)dataSource
{
  return (JSAFeedControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (JSAFeedControllerDelegate)delegate
{
  return (JSAFeedControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isRootFeed
{
  return self->_isRootFeed;
}

- (JSAFeedMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (int64_t)viewState
{
  return self->_viewState;
}

- (BOOL)abandoned
{
  return self->_abandoned;
}

- (void)setAbandoned:(BOOL)a3
{
  self->_abandoned = a3;
}

- (id)requestEntriesCompletionBlock
{
  return self->_requestEntriesCompletionBlock;
}

- (void)setRequestEntriesCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)feedBridged
{
  return self->_feedBridged;
}

- (OS_dispatch_queue)access
{
  return self->_access;
}

- (void)setAccess:(id)a3
{
  objc_storeStrong((id *)&self->_access, a3);
}

- (JSValue)bridgeCompletion
{
  return self->_bridgeCompletion;
}

- (void)setBridgeCompletion:(id)a3
{
  objc_storeStrong((id *)&self->_bridgeCompletion, a3);
}

- (JSValue)feed
{
  return self->_feed;
}

- (void)setFeed:(id)a3
{
  objc_storeStrong((id *)&self->_feed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feed, 0);
  objc_storeStrong((id *)&self->_bridgeCompletion, 0);
  objc_storeStrong((id *)&self->_access, 0);
  objc_storeStrong(&self->_requestEntriesCompletionBlock, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
