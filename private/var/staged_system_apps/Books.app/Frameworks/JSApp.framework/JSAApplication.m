@implementation JSAApplication

- (JSAApplication)init
{
  JSAApplication *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)JSAApplication;
  v2 = -[JSAApplication init](&v20, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infoDictionary"));

    if (v4)
    {
      v6 = objc_opt_class(NSString, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCFBundleIdentifierKey));
      v8 = BUDynamicCast(v6, v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)v9;
      if (v9)
        v11 = (__CFString *)v9;
      else
        v11 = &stru_A2730;
      objc_storeStrong((id *)&v2->_identifier, v11);

      v13 = objc_opt_class(NSString, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", _kCFBundleShortVersionStringKey));
      v15 = BUDynamicCast(v13, v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)v16;
      if (v16)
        v18 = (__CFString *)v16;
      else
        v18 = &stru_A2730;
      objc_storeStrong((id *)&v2->_version, v18);

    }
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[JSManagedValue value](self->_onUnhandledPromiseRejection, "value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "virtualMachine"));
  objc_msgSend(v5, "removeManagedReference:withOwner:", self->_onUnhandledPromiseRejection, self);

  v6.receiver = self;
  v6.super_class = (Class)JSAApplication;
  -[JSAApplication dealloc](&v6, "dealloc");
}

- (NSDate)lastScriptCacheDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastScriptCacheDate"));

  return (NSDate *)v3;
}

- (JSValue)onUnhandledPromiseRejection
{
  return -[JSManagedValue value](self->_onUnhandledPromiseRejection, "value");
}

- (void)setOnUnhandledPromiseRejection:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  const OpaqueJSContext *v8;
  JSObjectRef v9;
  JSManagedValue *onUnhandledPromiseRejection;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  JSManagedValue *v29;
  _BYTE v30[24];

  v4 = a3;
  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v30 = 136446210;
    *(_QWORD *)&v30[4] = "-[JSAApplication setOnUnhandledPromiseRejection:]";
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", v30, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "context"));
  v8 = (const OpaqueJSContext *)objc_msgSend(v7, "JSGlobalContextRef");
  *(_QWORD *)v30 = 0;
  v9 = JSValueToObject(v8, (JSValueRef)objc_msgSend(v4, "JSValueRef"), (JSValueRef *)v30);
  if (*(_QWORD *)v30)
  {
    onUnhandledPromiseRejection = (JSManagedValue *)objc_claimAutoreleasedReturnValue(+[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", *(_QWORD *)v30, v7));
    v11 = JSALog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_72AC8((uint64_t)onUnhandledPromiseRejection, v12, v13, v14, v15, v16, v17, v18);
  }
  else
  {
    JSGlobalContextSetUnhandledRejectionCallback(v8, v9, v30);
    if (!*(_QWORD *)v30)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[JSManagedValue value](self->_onUnhandledPromiseRejection, "value"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "context"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "virtualMachine"));
      objc_msgSend(v28, "removeManagedReference:withOwner:", self->_onUnhandledPromiseRejection, self);

      v29 = (JSManagedValue *)objc_claimAutoreleasedReturnValue(+[JSManagedValue managedValueWithValue:andOwner:](JSManagedValue, "managedValueWithValue:andOwner:", v4, self));
      onUnhandledPromiseRejection = self->_onUnhandledPromiseRejection;
      self->_onUnhandledPromiseRejection = v29;
      goto LABEL_10;
    }
    onUnhandledPromiseRejection = (JSManagedValue *)objc_claimAutoreleasedReturnValue(+[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", *(_QWORD *)v30, v7));
    v19 = JSALog();
    v12 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_72A60((uint64_t)onUnhandledPromiseRejection, v12, v20, v21, v22, v23, v24, v25);
  }

LABEL_10:
}

- (void)openExternalURL:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;

  v4 = a3;
  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v23 = "-[JSAApplication openExternalURL:]";
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s url=%@", buf, 0x16u);
  }

  if (v4)
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v4));
  else
    v7 = 0;
  if (objc_msgSend(v7, "jsa_isSafeExternalURL"))
  {
    v16 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
    v17 = FBSOpenApplicationOptionKeyUnlockDevice;
    v19 = &__kCFBooleanTrue;
    v20 = &__kCFBooleanTrue;
    v18 = FBSOpenApplicationOptionKeyLaunchOrigin;
    v9 = (objc_class *)objc_opt_class(self, v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v21 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v16, 3));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace", v16, v17, v18, v19, v20));
    objc_msgSend(v13, "openSensitiveURL:withOptions:", v7, v12);

LABEL_10:
    goto LABEL_11;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication jsa_sharedApplicationIfNotExtension](UIApplication, "jsa_sharedApplicationIfNotExtension"));
  v15 = objc_msgSend(v14, "canOpenURL:", v7);

  if (v15)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication jsa_sharedApplicationIfNotExtension](UIApplication, "jsa_sharedApplicationIfNotExtension"));
    objc_msgSend(v12, "jsa_openExternalURL:options:completionHandler:", v7, &__NSDictionary0__struct, 0);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)downloadAndCacheScript:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;

  v3 = a3;
  v4 = JSALog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v11 = "-[JSAApplication downloadAndCacheScript:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_24620;
  v8[3] = &unk_9F048;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "checkForUpgradeWithCompletion:", v8);

}

- (void)reloadWithNewCacheIfAvailable:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  const char *v10;

  v3 = a3;
  v4 = JSALog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v10 = "-[JSAApplication reloadWithNewCacheIfAvailable:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_24898;
  block[3] = &unk_9DCA8;
  v8 = v3;
  v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)reloadWithNewCache:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  const char *v10;

  v3 = a3;
  v4 = JSALog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v10 = "-[JSAApplication reloadWithNewCache:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_24C6C;
  block[3] = &unk_9DCA8;
  v8 = v3;
  v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

+ (void)didFinishLaunchingWithMetrics:(BOOL)a3
{
  _BOOL4 v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;

  v3 = a3;
  v4 = BUIsRunningTests(a1);
  if (v4)
    v5 = &__NSDictionary0__struct;
  else
    v5 = 0;
  if ((v4 & 1) != 0
    || !v3
    || (+[JSAMetricsAppLaunchEvent markLaunchEndTime](JSAMetricsAppLaunchEvent, "markLaunchEndTime"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[JSAMetricsAppLaunchEvent consumePendingLaunchEvent](JSAMetricsAppLaunchEvent, "consumePendingLaunchEvent")), v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metricsDictionary")), v6, v5))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_24FD8;
    v10[3] = &unk_9E3B8;
    v11 = v5;
    v8 = v5;
    objc_msgSend(v7, "enqueueBlockForInitialLaunch:file:line:", v10, CFSTR("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/JSApp/JSApp/API/Application/JSAApplication.m"), 189);

  }
  else
  {
    v9 = JSALog();
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v13 = "+[JSAApplication didFinishLaunchingWithMetrics:]";
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s iBooks probably just loaded a new version of javascript", buf, 0xCu);
    }
  }

}

+ (void)willEnterForeground
{
  sub_25230((uint64_t)a1, CFSTR("onEnteringForeground"), &__NSArray0__struct, 0);
}

+ (void)didBecomeActive
{
  sub_25230((uint64_t)a1, CFSTR("initiateBecomingActive"), &__NSArray0__struct, 0);
}

+ (void)willResignActive
{
  sub_25230((uint64_t)a1, CFSTR("onResigningActive"), &__NSArray0__struct, 0);
}

+ (void)didEnterBackground
{
  sub_25230((uint64_t)a1, CFSTR("onEnteringBackground"), &__NSArray0__struct, 0);
}

+ (void)willTerminate
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "environment"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "context"));
  v5 = sub_25174((uint64_t)a1, CFSTR("onTerminate"), &__NSArray0__struct, v4);

}

+ (void)openProductPagesWithIds:(id)a3 contentTypes:(id)a4 focusedIndex:(unint64_t)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, uint64_t);
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[2];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = JSALog();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsJoinedByString:", CFSTR(",")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
    *(_DWORD *)buf = 136446978;
    v31 = "+[JSAApplication openProductPagesWithIds:contentTypes:focusedIndex:options:]";
    v32 = 2112;
    v33 = v15;
    v34 = 2112;
    v35 = v16;
    v36 = 2112;
    v37 = v12;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}s ids=[%@], focusedIndex=%@, options=%@", buf, 0x2Au);

  }
  if (objc_msgSend(v10, "count"))
  {
    if (objc_msgSend(v11, "count"))
    {
      v17 = objc_msgSend(v10, "count");
      if (v17 == objc_msgSend(v11, "count"))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count")));
        v23 = _NSConcreteStackBlock;
        v24 = 3221225472;
        v25 = sub_25728;
        v26 = &unk_9F070;
        v27 = v18;
        v28 = v11;
        objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v23);
        v29[0] = v18;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5, v23, v24, v25, v26, v27));
        v29[1] = v19;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));
        v21 = sub_257F4((uint64_t)a1, v20, v12);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

        sub_25230((uint64_t)a1, CFSTR("openProductPagesWithInfo"), v22, 0);
      }
    }
  }

}

+ (void)openWriteReviewPageWithURL:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = JSALog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v16 = "+[JSAApplication openWriteReviewPageWithURL:options:]";
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}s url=%@, options=%@", buf, 0x20u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
  if (objc_msgSend(v10, "length"))
  {
    v14 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    v12 = sub_257F4((uint64_t)a1, v11, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    sub_25230((uint64_t)a1, CFSTR("openWriteReviewPageWithURL"), v13, 0);
  }

}

+ (void)openAccountSummaryPage
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = JSALog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446210;
    v6 = "+[JSAApplication openAccountSummaryPage]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v5, 0xCu);
  }

  sub_25230((uint64_t)a1, CFSTR("openAccountSummaryPage"), 0, 0);
}

+ (void)openNotificationSettingsPage
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = JSALog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446210;
    v6 = "+[JSAApplication openNotificationSettingsPage]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v5, 0xCu);
  }

  sub_25230((uint64_t)a1, CFSTR("openNotificationSettingsPage"), 0, 0);
}

+ (void)openAchievementSheet:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  char *v16;
  uint8_t buf[4];
  const char *v18;

  v4 = a3;
  v6 = objc_opt_class(NSNumber, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("achievementKind")));
  v8 = BUDynamicCast(v6, v7);
  v9 = (char *)objc_claimAutoreleasedReturnValue(v8);

  v10 = JSALog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v9;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Opening achievement sheet for achievementKind %@", buf, 0xCu);
  }

  if (v9)
  {
    v16 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    v13 = sub_257F4((uint64_t)a1, v12, v4);
    v14 = objc_claimAutoreleasedReturnValue(v13);

    sub_25230((uint64_t)a1, CFSTR("openAchievementSheet"), v14, 0);
  }
  else
  {
    v15 = JSALog();
    v14 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v18 = "+[JSAApplication openAchievementSheet:]";
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}s Ignoring achievement notification without achievementKind", buf, 0xCu);
    }
  }

}

+ (void)openYearInReview
{
  id v2;
  NSObject *v3;
  NSURLComponents *v4;
  void *v5;
  int v6;
  const char *v7;

  v2 = JSALog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446210;
    v7 = "+[JSAApplication openYearInReview]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v6, 0xCu);
  }

  v4 = objc_opt_new(NSURLComponents);
  -[NSURLComponents setScheme:](v4, "setScheme:", CFSTR("https"));
  -[NSURLComponents setHost:](v4, "setHost:", CFSTR("books.apple.com"));
  -[NSURLComponents setPath:](v4, "setPath:", CFSTR("/year-in-review"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v4, "URL"));
  if (v5)
    +[JSAApplication openURL:referrerURL:referrerApplicationName:options:](JSAApplication, "openURL:referrerURL:referrerApplicationName:options:", v5, 0, 0, 0);

}

+ (void)openURL:(id)a3 referrerURL:(id)a4 referrerApplicationName:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = JSALog();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136447234;
    v21 = "+[JSAApplication openURL:referrerURL:referrerApplicationName:options:]";
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v11;
    v26 = 2112;
    v27 = v12;
    v28 = 2112;
    v29 = v13;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%{public}s url=%@, referrer=%@, referrerApplicationName=%@, options=%@", (uint8_t *)&v20, 0x34u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));
  objc_msgSend(v16, "addObject:", v17);

  if (v11)
  {
    objc_msgSend(v16, "addObject:", v11);
    if (v12)
      goto LABEL_5;
LABEL_9:
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v16, "addObject:", v19);

    if (!v13)
      goto LABEL_7;
    goto LABEL_6;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  objc_msgSend(v16, "addObject:", v18);

  if (!v12)
    goto LABEL_9;
LABEL_5:
  objc_msgSend(v16, "addObject:", v12);
  if (v13)
LABEL_6:
    objc_msgSend(v16, "addObject:", v13);
LABEL_7:
  sub_25230((uint64_t)a1, CFSTR("openURL"), v16, 0);

}

+ (void)searchForTerm:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  NSURLComponents *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;

  v3 = a3;
  v4 = JSALog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v13 = "+[JSAApplication searchForTerm:]";
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s term=%@", buf, 0x16u);
  }

  v6 = objc_opt_new(NSURLComponents);
  -[NSURLComponents setHost:](v6, "setHost:", &stru_A2730);
  -[NSURLComponents setScheme:](v6, "setScheme:", CFSTR("itms-bookss"));
  v7 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("action"), CFSTR("search"));
  v8 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("term"), v3, v7);
  v11[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  -[NSURLComponents setQueryItems:](v6, "setQueryItems:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v6, "URL"));
  if (v10)
    +[JSAApplication openURL:referrerURL:referrerApplicationName:options:](JSAApplication, "openURL:referrerURL:referrerApplicationName:options:", v10, 0, 0, 0);

}

+ (void)recordNativeEvent:(id)a3
{
  _objc_msgSend(a1, "recordNativeEvent:additionalInfo:", a3, 0);
}

+ (void)recordNativeEvent:(id)a3 additionalInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v6 = a3;
  v7 = a4;
  v10[0] = v6;
  v8 = v7;
  if (!v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v10[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  sub_25230((uint64_t)a1, CFSTR("onRecordNativeEvent"), v9, 0);

  if (!v7)
}

+ (id)purchaseEventFieldsWithPageId:(id)a3 pageType:(id)a4 pageContext:(id)a5 topic:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_2642C;
  v32 = sub_2643C;
  v33 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_26444;
  v21[3] = &unk_9F098;
  v27 = a1;
  v15 = v10;
  v22 = v15;
  v16 = v11;
  v23 = v16;
  v17 = v12;
  v24 = v17;
  v18 = v13;
  v25 = v18;
  v26 = &v28;
  objc_msgSend(v14, "enqueueBlockPrefersSync:file:line:", v21, CFSTR("JSAApplication.m"), 344);

  v19 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v19;
}

+ (void)getODPTopGenre:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2669C;
  v5[3] = &unk_9F0C0;
  v6 = a3;
  v4 = v6;
  sub_25230((uint64_t)a1, CFSTR("getTopGenreFromODPRanker"), &__NSArray0__struct, v5);

}

+ (void)appendPageHistory:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  v12 = a3;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_2680C;
  v10[3] = &unk_9F0C0;
  v11 = v6;
  v9 = v6;
  sub_25230((uint64_t)a1, CFSTR("appendPageHistory"), v8, v10);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_onUnhandledPromiseRejection, 0);
}

@end
