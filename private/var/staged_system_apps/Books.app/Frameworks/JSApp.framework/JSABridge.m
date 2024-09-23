@implementation JSABridge

- (JSABridge)init
{
  JSABridge *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *bootstrapQueue;
  JSAPendingExecutionRecordQueue *v15;
  JSAPendingExecutionRecordQueue *launchExecutionRecordQueue;
  JSAPendingExecutionRecordQueue *v17;
  JSAPendingExecutionRecordQueue *generalExecutionRecordQueue;
  JSAPackageProvisioner *v19;
  JSAPackageProvisioner *launchPackageProvisioner;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)JSABridge;
  v2 = -[JSABridge init](&v22, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INTERACTIVE, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("JSABridge.accessQueue", v6);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INTERACTIVE, 0);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("JSABridge.accessQueue", v12);
    bootstrapQueue = v2->_bootstrapQueue;
    v2->_bootstrapQueue = (OS_dispatch_queue *)v13;

    v15 = objc_alloc_init(JSAPendingExecutionRecordQueue);
    launchExecutionRecordQueue = v2->_launchExecutionRecordQueue;
    v2->_launchExecutionRecordQueue = v15;

    v17 = objc_alloc_init(JSAPendingExecutionRecordQueue);
    generalExecutionRecordQueue = v2->_generalExecutionRecordQueue;
    v2->_generalExecutionRecordQueue = v17;

    v19 = -[JSAPackageProvisioner initWithLaunching:onQueue:]([JSAPackageProvisioner alloc], "initWithLaunching:onQueue:", 1, v2->_bootstrapQueue);
    launchPackageProvisioner = v2->_launchPackageProvisioner;
    v2->_launchPackageProvisioner = v19;

  }
  return v2;
}

+ (JSABridge)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_209A8;
  block[3] = &unk_9E1B8;
  block[4] = a1;
  if (qword_BA030 != -1)
    dispatch_once(&qword_BA030, block);
  return (JSABridge *)(id)qword_BA038;
}

- (void)bootstrapWithObjectRegistrations:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *bootstrapQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;

  v4 = a3;
  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "JSABridge bootstrapping for %{public}@", buf, 0xCu);

  }
  bootstrapQueue = self->_bootstrapQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_20B0C;
  v11[3] = &unk_9DCF8;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_sync(bootstrapQueue, v11);

}

- (void)initializeEnvironmentWithDataSource:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  JSAWindowManager *v16;
  AMSPromise *v17;
  NSObject *bootstrapQueue;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;

  v6 = a3;
  v7 = a4;
  +[JSAMetricsAppLaunchEvent markJSBootstrapStartTime](JSAMetricsAppLaunchEvent, "markJSBootstrapStartTime");
  v8 = JSALog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
    *(_DWORD *)buf = 138543362;
    v25 = v11;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "JSABridge initializing environment for %{public}@", buf, 0xCu);

  }
  +[JSAHarConfiguration setup](JSAHarConfiguration, "setup");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v13 = objc_msgSend(v12, "BOOLForKey:", CFSTR("BKHotReloadEnabled"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[JSAHotReloadController sharedController](JSAHotReloadController, "sharedController"));
    objc_msgSend(v14, "startWithCompletion:", 0);

  }
  -[JSABridge setDataSource:](self, "setDataSource:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowProviderForBridge:", self));
  v16 = -[JSAWindowManager initWithWindowProvider:]([JSAWindowManager alloc], "initWithWindowProvider:", v15);
  -[JSABridge setWindowManager:](self, "setWindowManager:", v16);

  v17 = objc_opt_new(AMSPromise);
  -[JSABridge setPackagePromise:](self, "setPackagePromise:", v17);

  bootstrapQueue = self->_bootstrapQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_20D74;
  block[3] = &unk_9EED8;
  v22 = v6;
  v23 = v7;
  block[4] = self;
  v19 = v6;
  v20 = v7;
  dispatch_async(bootstrapQueue, block);

}

- (void)startProvisioningPackage
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = JSALog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Start provisioning package for launch", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[JSABridge launchPackageProvisioner](self, "launchPackageProvisioner"));
  objc_msgSend(v5, "provisionWithCompletionHandler:", &stru_9EF18);

}

- (void)checkForUpgradeWithCompletion:(id)a3
{
  id v4;
  JSAPackageProvisioner *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = -[JSAPackageProvisioner initWithLaunching:]([JSAPackageProvisioner alloc], "initWithLaunching:", 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_212F0;
  v7[3] = &unk_9EF40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[JSAPackageProvisioner provisionWithCompletionHandler:](v5, "provisionWithCompletionHandler:", v7);

}

- (void)upgradePackage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  JSAPackageProvisioner *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v6;
    v9 = JSALog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "version"));
      *(_DWORD *)buf = 136446466;
      v25 = "-[JSABridge upgradePackage:completion:]";
      v26 = 2114;
      v27 = v11;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}s upgrading to given package with version %{public}@", buf, 0x16u);

    }
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_217AC;
    v21[3] = &unk_9E2F8;
    v22 = v8;
    v23 = v7;
    v12 = v7;
    v13 = (JSAPackageProvisioner *)v8;
    -[JSABridge setupWithPackage:completion:](self, "setupWithPackage:completion:", v13, v21);

    v14 = v22;
  }
  else
  {
    v15 = JSALog();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[JSABridge pendingPackageVersion](self, "pendingPackageVersion"));
      *(_DWORD *)buf = 136446466;
      v25 = "-[JSABridge upgradePackage:completion:]";
      v26 = 2114;
      v27 = v17;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "%{public}s upgrading to pending package with last known version %{public}@", buf, 0x16u);

    }
    v13 = -[JSAPackageProvisioner initWithLaunching:]([JSAPackageProvisioner alloc], "initWithLaunching:", 0);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_218A0;
    v19[3] = &unk_9EF40;
    v19[4] = self;
    v20 = v7;
    v18 = v7;
    -[JSAPackageProvisioner provisionWithCompletionHandler:](v13, "provisionWithCompletionHandler:", v19);
    v14 = v20;
  }

}

- (void)setupWithPackage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  unsigned int v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  intptr_t v19;
  dispatch_queue_global_t global_queue;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD block[5];
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;

  v6 = a3;
  v7 = a4;
  v8 = JSALog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v6;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "JSABridge loadScriptFromPackage: %@", buf, 0xCu);
  }

  -[JSABridge setIsLoadingScript:](self, "setIsLoadingScript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[JSABridge currentPackage](self, "currentPackage"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v6));
    -[JSABridge setPackagePromise:](self, "setPackagePromise:", v11);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[JSABridge packagePromise](self, "packagePromise"));
    v13 = objc_msgSend(v12, "isFinished");

    if ((v13 & 1) != 0)
      goto LABEL_8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[JSABridge packagePromise](self, "packagePromise"));
    objc_msgSend(v11, "finishWithResult:", v6);
  }

LABEL_8:
  -[JSABridge setCurrentPackage:](self, "setCurrentPackage:", v6);
  v14 = -[JSABridge isScriptLoaded](self, "isScriptLoaded");
  if (v14)
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_9EF60);
  v15 = objc_alloc_init((Class)AMSPromise);
  -[JSABridge setTemplateRegistrationPromise:](self, "setTemplateRegistrationPromise:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[JSABridge templateBundleRegistrar](self, "templateBundleRegistrar"));
  if (!v16)
  {
    v17 = JSALog();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      sub_729C4();

  }
  if (v14)
    v19 = 25;
  else
    v19 = 33;
  global_queue = dispatch_get_global_queue(v19, 0);
  v21 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_21E38;
  block[3] = &unk_9E208;
  block[4] = self;
  v22 = v6;
  v31 = v22;
  v32 = v15;
  v23 = v15;
  dispatch_async(v21, block);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[JSABridge environment](self, "environment"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_21E98;
  v27[3] = &unk_9EF88;
  v27[4] = self;
  v28 = v22;
  v29 = v7;
  v25 = v7;
  v26 = v22;
  objc_msgSend(v24, "loadScriptFromPackage:completion:", v26, v27);

}

- (void)enqueueBlock:(id)a3 file:(id)a4 line:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  JSAPendingExecutionRecord *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  int64_t v20;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = JSALog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_retainBlock(v8);
      v15 = 138543874;
      v16 = v12;
      v17 = 2114;
      v18 = v9;
      v19 = 2048;
      v20 = a5;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "JSABridge enqueue block '%{public}@' from %{public}@:%li", (uint8_t *)&v15, 0x20u);

    }
    v13 = -[JSAPendingExecutionRecord initWithBlock:]([JSAPendingExecutionRecord alloc], "initWithBlock:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[JSABridge generalExecutionRecordQueue](self, "generalExecutionRecordQueue"));
    objc_msgSend(v14, "enqueueRecord:", v13);

    sub_21FFC(self, 0);
  }

}

- (void)enqueueBlockPrefersSync:(id)a3 file:(id)a4 line:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  JSAPendingExecutionRecord *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  int64_t v20;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = JSALog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_retainBlock(v8);
      v15 = 138543874;
      v16 = v12;
      v17 = 2114;
      v18 = v9;
      v19 = 2048;
      v20 = a5;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "JSABridge enqueue block sync '%{public}@' from %{public}@:%li", (uint8_t *)&v15, 0x20u);

    }
    v13 = -[JSAPendingExecutionRecord initWithBlock:]([JSAPendingExecutionRecord alloc], "initWithBlock:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[JSABridge generalExecutionRecordQueue](self, "generalExecutionRecordQueue"));
    objc_msgSend(v14, "enqueueRecord:", v13);

    sub_21FFC(self, 1);
  }

}

- (void)enqueueBlockForInitialLaunch:(id)a3 file:(id)a4 line:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  JSAPendingExecutionRecord *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  int64_t v23;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = JSALog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_retainBlock(v8);
      v18 = 138543874;
      v19 = v12;
      v20 = 2114;
      v21 = v9;
      v22 = 2048;
      v23 = a5;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "JSABridge enqueue block for initial launch '%{public}@' from %{public}@:%li", (uint8_t *)&v18, 0x20u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[JSABridge launchExecutionRecordQueue](self, "launchExecutionRecordQueue"));
    v14 = v13;
    if (v13)
      v15 = v13;
    else
      v15 = (id)objc_claimAutoreleasedReturnValue(-[JSABridge generalExecutionRecordQueue](self, "generalExecutionRecordQueue"));
    v16 = v15;

    v17 = -[JSAPendingExecutionRecord initWithBlock:]([JSAPendingExecutionRecord alloc], "initWithBlock:", v8);
    objc_msgSend(v16, "enqueueRecord:", v17);
    sub_21FFC(self, 0);

  }
}

- (void)enqueueValueCall:(id)a3 arguments:(id)a4 file:(id)a5 line:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  JSAPendingExecutionRecord *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  int64_t v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    v13 = JSALog();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134349826;
      v18 = v10;
      v19 = 2048;
      v20 = objc_msgSend(v11, "count");
      v21 = 2114;
      v22 = v12;
      v23 = 2048;
      v24 = a6;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "JSABridge enqueue value call '%{public}p' with %lu args from %{public}@:%li", (uint8_t *)&v17, 0x2Au);
    }

    v15 = -[JSAPendingExecutionRecord initWithValue:method:arguments:type:]([JSAPendingExecutionRecord alloc], "initWithValue:method:arguments:type:", v10, 0, v11, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[JSABridge generalExecutionRecordQueue](self, "generalExecutionRecordQueue"));
    objc_msgSend(v16, "enqueueRecord:", v15);

    sub_21FFC(self, 0);
  }

}

- (void)enqueueValueInvocation:(id)a3 method:(id)a4 arguments:(id)a5 file:(id)a6 line:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  JSAPendingExecutionRecord *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  int64_t v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    v16 = JSALog();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 134350082;
      v21 = v12;
      v22 = 2114;
      v23 = v13;
      v24 = 2048;
      v25 = objc_msgSend(v14, "count");
      v26 = 2114;
      v27 = v15;
      v28 = 2048;
      v29 = a7;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "JSABridge enqueue value invocation '%{public}p' for '%{public}@' with %lu args from %{public}@:%li", (uint8_t *)&v20, 0x34u);
    }

    v18 = -[JSAPendingExecutionRecord initWithValue:method:arguments:type:]([JSAPendingExecutionRecord alloc], "initWithValue:method:arguments:type:", v12, v13, v14, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[JSABridge generalExecutionRecordQueue](self, "generalExecutionRecordQueue"));
    objc_msgSend(v19, "enqueueRecord:", v18);

    sub_21FFC(self, 0);
  }

}

- (void)enqueueManagedValueCall:(id)a3 arguments:(id)a4 file:(id)a5 line:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  JSAPendingExecutionRecord *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  int64_t v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    v13 = JSALog();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134349826;
      v18 = v10;
      v19 = 2048;
      v20 = objc_msgSend(v11, "count");
      v21 = 2114;
      v22 = v12;
      v23 = 2048;
      v24 = a6;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "JSABridge enqueue managed value call '%{public}p' with %lu args from %{public}@:%li", (uint8_t *)&v17, 0x2Au);
    }

    v15 = -[JSAPendingExecutionRecord initWithManagedValue:method:arguments:type:]([JSAPendingExecutionRecord alloc], "initWithManagedValue:method:arguments:type:", v10, 0, v11, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[JSABridge generalExecutionRecordQueue](self, "generalExecutionRecordQueue"));
    objc_msgSend(v16, "enqueueRecord:", v15);

    sub_21FFC(self, 0);
  }

}

- (void)enqueueManagedValueInvocation:(id)a3 method:(id)a4 arguments:(id)a5 file:(id)a6 line:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  JSAPendingExecutionRecord *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  int64_t v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    v16 = JSALog();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 134350082;
      v21 = v12;
      v22 = 2114;
      v23 = v13;
      v24 = 2048;
      v25 = objc_msgSend(v14, "count");
      v26 = 2114;
      v27 = v15;
      v28 = 2048;
      v29 = a7;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "JSABridge enqueue managed value invocation '%{public}p' for '%{public}@' with %lu args from %{public}@:%li", (uint8_t *)&v20, 0x34u);
    }

    v18 = -[JSAPendingExecutionRecord initWithManagedValue:method:arguments:type:]([JSAPendingExecutionRecord alloc], "initWithManagedValue:method:arguments:type:", v12, v13, v14, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[JSABridge generalExecutionRecordQueue](self, "generalExecutionRecordQueue"));
    objc_msgSend(v19, "enqueueRecord:", v18);

    sub_21FFC(self, 0);
  }

}

- (JSAPendingExecutionRecordQueue)generalExecutionRecordQueue
{
  return self->_generalExecutionRecordQueue;
}

- (JSAEnvironment)environment
{
  if (qword_BA040 != -1)
    dispatch_once(&qword_BA040, &stru_9EFA8);
  return (JSAEnvironment *)(id)qword_BA048;
}

- (JSAWindowManager)windowManager
{
  return (JSAWindowManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWindowManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (JSAPackage)currentPackage
{
  return (JSAPackage *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentPackage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (AMSPromise)packagePromise
{
  return (AMSPromise *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPackagePromise:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (AMSPromise)templateRegistrationPromise
{
  return (AMSPromise *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTemplateRegistrationPromise:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)pendingPackageVersion
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPendingPackageVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (JSABridgeTemplateBundleRegistering)templateBundleRegistrar
{
  return (JSABridgeTemplateBundleRegistering *)objc_loadWeakRetained((id *)&self->_templateBundleRegistrar);
}

- (void)setTemplateBundleRegistrar:(id)a3
{
  objc_storeWeak((id *)&self->_templateBundleRegistrar, a3);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (OS_dispatch_queue)bootstrapQueue
{
  return self->_bootstrapQueue;
}

- (void)setBootstrapQueue:(id)a3
{
  objc_storeStrong((id *)&self->_bootstrapQueue, a3);
}

- (JSAPendingExecutionRecordQueue)launchExecutionRecordQueue
{
  return self->_launchExecutionRecordQueue;
}

- (void)setLaunchExecutionRecordQueue:(id)a3
{
  objc_storeStrong((id *)&self->_launchExecutionRecordQueue, a3);
}

- (void)setGeneralExecutionRecordQueue:(id)a3
{
  objc_storeStrong((id *)&self->_generalExecutionRecordQueue, a3);
}

- (JSABridgeDataSource)dataSource
{
  return (JSABridgeDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (id)_beforeJSAppLaunchBlock
{
  return self->__beforeJSAppLaunchBlock;
}

- (void)set_beforeJSAppLaunchBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDate)lastScriptCacheDate
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLastScriptCacheDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (JSAPackageProvisioner)launchPackageProvisioner
{
  return (JSAPackageProvisioner *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLaunchPackageProvisioner:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (BOOL)isLoadingScript
{
  return self->_isLoadingScript;
}

- (void)setIsLoadingScript:(BOOL)a3
{
  self->_isLoadingScript = a3;
}

- (BOOL)isScriptLoaded
{
  return self->_isScriptLoaded;
}

- (void)setIsScriptLoaded:(BOOL)a3
{
  self->_isScriptLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchPackageProvisioner, 0);
  objc_storeStrong((id *)&self->_lastScriptCacheDate, 0);
  objc_storeStrong(&self->__beforeJSAppLaunchBlock, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_generalExecutionRecordQueue, 0);
  objc_storeStrong((id *)&self->_launchExecutionRecordQueue, 0);
  objc_storeStrong((id *)&self->_bootstrapQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_destroyWeak((id *)&self->_templateBundleRegistrar);
  objc_storeStrong((id *)&self->_pendingPackageVersion, 0);
  objc_storeStrong((id *)&self->_templateRegistrationPromise, 0);
  objc_storeStrong((id *)&self->_packagePromise, 0);
  objc_storeStrong((id *)&self->_currentPackage, 0);
  objc_storeStrong((id *)&self->_windowManager, 0);
}

@end
