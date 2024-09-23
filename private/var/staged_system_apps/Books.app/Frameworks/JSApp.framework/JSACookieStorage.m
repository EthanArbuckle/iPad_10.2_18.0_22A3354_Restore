@implementation JSACookieStorage

+ (JSACookieStorage)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_28384;
  block[3] = &unk_9E1B8;
  block[4] = a1;
  if (qword_BA060 != -1)
    dispatch_once(&qword_BA060, block);
  return (JSACookieStorage *)(id)qword_BA068;
}

- (JSACookieStorage)init
{
  JSACookieStorage *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  NSURL *defaultURL;
  id v11;
  BUCoalescingCallBlock *v12;
  BUCoalescingCallBlock *updateCookiesCoalescingCallBlock;
  void *v14;
  void *v15;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v17;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id location;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)JSACookieStorage;
  v2 = -[JSACookieStorage init](&v25, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INTERACTIVE, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.iBooks.JSACookieStorage", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://www.apple.com/")));
    defaultURL = v2->_defaultURL;
    v2->_defaultURL = (NSURL *)v9;

    objc_initWeak(&location, v2);
    v11 = objc_alloc((Class)BUCoalescingCallBlock);
    v19 = _NSConcreteStackBlock;
    v20 = 3221225472;
    v21 = sub_285D8;
    v22 = &unk_9F178;
    objc_copyWeak(&v23, &location);
    v12 = (BUCoalescingCallBlock *)objc_msgSend(v11, "initWithNotifyBlock:blockDescription:", &v19, CFSTR("JSACookieStorage"));
    updateCookiesCoalescingCallBlock = v2->_updateCookiesCoalescingCallBlock;
    v2->_updateCookiesCoalescingCallBlock = v12;

    -[BUCoalescingCallBlock setCoalescingDelay:](v2->_updateCookiesCoalescingCallBlock, "setCoalescingDelay:", 0.2, v19, v20, v21, v22);
    sub_286BC((uint64_t)v2, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSHTTPCookieStorage sharedHTTPCookieStorage](NSHTTPCookieStorage, "sharedHTTPCookieStorage"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, "notificationHandler:", NSHTTPCookieManagerCookiesChangedNotification, v15);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_28748, AMSAccountCookiesChangedNotificationName, 0, (CFNotificationSuspensionBehavior)0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
    objc_msgSend(v17, "addObserver:accountTypes:", v2, 1);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  objc_msgSend(v5, "removeObserver:accountTypes:", self, 1);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[JSACookieStorage invalidationTimers](self, "invalidationTimers"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10), "invalidate");
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[JSACookieStorage setInvalidationTimers:](self, "setInvalidationTimers:", 0);
  v11.receiver = self;
  v11.super_class = (Class)JSACookieStorage;
  -[JSACookieStorage dealloc](&v11, "dealloc");
}

- (void)notificationHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = JSALog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[JSACookieStorage] Received NSHTTPCookieStorage changed notification", v6, 2u);
  }

  if (self)
    -[BUCoalescingCallBlock signalWithCompletion:](self->_updateCookiesCoalescingCallBlock, "signalWithCompletion:", 0);
}

- (NSDictionary)activeCookiesForDefaultURL
{
  NSDictionary *activeCookiesForDefaultURL;

  activeCookiesForDefaultURL = self->_activeCookiesForDefaultURL;
  if (!activeCookiesForDefaultURL)
  {
    self->_activeCookiesForDefaultURL = (NSDictionary *)&__NSDictionary0__struct;

    activeCookiesForDefaultURL = self->_activeCookiesForDefaultURL;
  }
  return activeCookiesForDefaultURL;
}

- (void)setCookie:(id)a3 :(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;
  void *v20;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)NSHTTPCookie);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "jsa_initWithScriptingCookie:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localStoreAccount"));

  v20 = v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  objc_msgSend(v11, "ams_addCookies:", v12);

  if (objc_msgSend(v11, "isDirty"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore bu_sharedAccountStore](ACAccountStore, "bu_sharedAccountStore"));
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ams_saveAccount:verifyCredentials:", v11, 0));

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_28BCC;
    v18[3] = &unk_9F1A0;
    v18[4] = self;
    v19 = v6;
    v15 = v6;
    objc_msgSend(v14, "resultWithCompletion:", v18);

  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_28C8C;
    v16[3] = &unk_9DCA8;
    v17 = v6;
    v14 = v6;
    sub_286BC((uint64_t)self, v16);
    v15 = v17;
  }

}

- (void)deleteCookie:(id)a3 :(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[3];
  _QWORD v22[3];

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  if (!v8)
    goto LABEL_6;
  v9 = (void *)v8;
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
  if (!v10)
  {

    goto LABEL_6;
  }
  v11 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));

  if (!v12)
  {
LABEL_6:
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
    objc_msgSend(v18, "enqueueValueCall:arguments:file:line:", v7, 0, CFSTR("JSACookieStorage.m"), 148);

    goto LABEL_7;
  }
  v21[0] = NSHTTPCookieName;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v22[0] = v13;
  v21[1] = NSHTTPCookieDomain;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
  v22[1] = v14;
  v21[2] = NSHTTPCookiePath;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
  v22[2] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 3));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore bu_sharedAccountStore](ACAccountStore, "bu_sharedAccountStore"));
  objc_msgSend(v17, "ams_removeCookiesMatchingProperties:error:", v16, 0);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_28EEC;
  v19[3] = &unk_9DCA8;
  v20 = v7;
  sub_286BC((uint64_t)self, v19);

LABEL_7:
}

- (void)registerOnCookieStorageChange:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Registering on cookie storage change", v8, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[JSManagedValue managedValueWithValue:](JSManagedValue, "managedValueWithValue:", v4));
  -[JSACookieStorage setCookieStorageChangeHandler:](self, "setCookieStorageChangeHandler:", v7);

}

- (void)unregisterOnCookieStorageChange
{
  -[JSACookieStorage setCookieStorageChangeHandler:](self, "setCookieStorageChangeHandler:", 0);
}

- (void)_handleCookieDidExpire:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = JSALog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[JSACookieStorage] A cookie has expired", v6, 2u);
  }

  if (self)
    -[BUCoalescingCallBlock signalWithCompletion:](self->_updateCookiesCoalescingCallBlock, "signalWithCompletion:", 0);
}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[JSACookieStorage] Received account changed notification", v7, 2u);
  }

  if (self)
    -[BUCoalescingCallBlock signalWithCompletion:](self->_updateCookiesCoalescingCallBlock, "signalWithCompletion:", 0);
}

- (NSURL)defaultURL
{
  return self->_defaultURL;
}

- (NSArray)invalidationTimers
{
  return self->_invalidationTimers;
}

- (void)setInvalidationTimers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)indexedCookies
{
  return self->_indexedCookies;
}

- (void)setIndexedCookies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (JSManagedValue)cookieStorageChangeHandler
{
  return (JSManagedValue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCookieStorageChangeHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BUCoalescingCallBlock)updateCookiesCoalescingCallBlock
{
  return self->_updateCookiesCoalescingCallBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateCookiesCoalescingCallBlock, 0);
  objc_storeStrong((id *)&self->_cookieStorageChangeHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_indexedCookies, 0);
  objc_storeStrong((id *)&self->_invalidationTimers, 0);
  objc_storeStrong((id *)&self->_defaultURL, 0);
  objc_storeStrong((id *)&self->_activeCookiesForDefaultURL, 0);
}

@end
