@implementation JSAStore

+ (id)getInstance
{
  return +[JSAStore sharedInstance](JSAStore, "sharedInstance");
}

- (JSAStore)init
{
  JSAStore *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *accountQueue;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *callbackQueue;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *restrictionsQueue;
  JSAAccount *v15;
  JSAAccount *account;
  uint64_t v17;
  NSArray *accountHandlers;
  NSMutableArray *v19;
  NSMutableArray *observers;
  void *v21;
  uint64_t v22;
  NSString *storeFrontIdentifier;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)JSAStore;
  v2 = -[JSAStore init](&v32, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("JSAStore.Account", v4);
    accountQueue = v2->_accountQueue;
    v2->_accountQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("JSAStore.Callback", v8);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("JSAStore.Restrictions", v12);
    restrictionsQueue = v2->_restrictionsQueue;
    v2->_restrictionsQueue = (OS_dispatch_queue *)v13;

    v2->_accessLock._os_unfair_lock_opaque = 0;
    v15 = -[JSAAccount initWithDelegate:]([JSAAccount alloc], "initWithDelegate:", v2);
    account = v2->_account;
    v2->_account = v15;

    v17 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    accountHandlers = v2->_accountHandlers;
    v2->_accountHandlers = (NSArray *)v17;

    v19 = objc_opt_new(NSMutableArray);
    observers = v2->_observers;
    v2->_observers = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "currentStorefront"));
    storeFrontIdentifier = v2->_storeFrontIdentifier;
    v2->_storeFrontIdentifier = (NSString *)v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
    objc_msgSend(v24, "addObserver:", v2);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
    v2->_allowsAccountModification = objc_msgSend(v25, "isAccountModificationAllowed");

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
    v2->_allowsErotica = objc_msgSend(v26, "isExplicitContentAllowed");

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
    v2->_allowsStore = objc_msgSend(v27, "isBookStoreAllowed");

    v2->_isRunningInStoreDemoMode = +[UIApplication isRunningInStoreDemoMode](UIApplication, "isRunningInStoreDemoMode");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[JSAAccountController sharedController](JSAAccountController, "sharedController"));
    objc_msgSend(v28, "addObserver:", v2);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
    objc_msgSend(v29, "addObserver:accountTypes:", v2, 1);

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v30, "addObserver:selector:name:object:", v2, "_updateRestrictionsAndNotifyIfNeeded", UIApplicationWillEnterForegroundNotification, 0);

    -[JSAStore _updateRestrictionsAndNotifyIfNeeded](v2, "_updateRestrictionsAndNotifyIfNeeded");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  objc_msgSend(v4, "removeObserver:accountTypes:", self, 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
  objc_msgSend(v5, "removeObserver:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[JSAAccountController sharedController](JSAAccountController, "sharedController"));
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)JSAStore;
  -[JSAStore dealloc](&v7, "dealloc");
}

+ (JSAStore)sharedInstance
{
  if (qword_BA050 != -1)
    dispatch_once(&qword_BA050, &stru_9F150);
  return (JSAStore *)(id)qword_BA058;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  -[NSMutableArray addObject:](self->_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_accessLock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  -[NSMutableArray removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_accessLock);
}

- (NSString)storeFrontIdentifier
{
  NSObject *accountQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_26E5C;
  v10 = sub_26E6C;
  v11 = 0;
  accountQueue = self->_accountQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_26E74;
  v5[3] = &unk_9E0D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accountQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (NSString)platform
{
  void *v2;
  void *v3;
  char *v4;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v2, "userInterfaceIdiom") == (char *)&dword_0 + 1)
  {

    return (NSString *)CFSTR("iPad");
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = (char *)objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (_BYTE *)&dword_4 + 1)
    return (NSString *)CFSTR("iPad");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (!v7)
    return (NSString *)CFSTR("iPhone");
  v8 = JSALog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_72B30(v9);

  return 0;
}

- (JSAAccount)account
{
  NSObject *accountQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_26E5C;
  v10 = sub_26E6C;
  v11 = 0;
  accountQueue = self->_accountQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_27034;
  v5[3] = &unk_9E0D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accountQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (JSAAccount *)v3;
}

- (void)accountControllerDidAttemptSignOut:(uint64_t)a1
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (a1)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(id *)(a1 + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v7, "storeDidAttemptSignOut:") & 1) != 0)
            objc_msgSend(v7, "storeDidAttemptSignOut:", a1, (_QWORD)v8);
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)accountControllerWillAttemptSignOut:(uint64_t)a1
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (a1)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(id *)(a1 + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v7, "storeWillAttemptSignOut:") & 1) != 0)
            objc_msgSend(v7, "storeWillAttemptSignOut:", a1, (_QWORD)v8);
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)registerOnStorefrontChange:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  JSManagedValue *v7;
  JSManagedValue *storefrontChangeHandler;
  int v9;
  const char *v10;

  v4 = a3;
  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446210;
    v10 = "-[JSAStore registerOnStorefrontChange:]";
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v9, 0xCu);
  }

  v7 = (JSManagedValue *)objc_claimAutoreleasedReturnValue(+[JSManagedValue managedValueWithValue:](JSManagedValue, "managedValueWithValue:", v4));
  storefrontChangeHandler = self->_storefrontChangeHandler;
  self->_storefrontChangeHandler = v7;

}

- (void)unregisterOnStorefrontChange
{
  JSManagedValue *storefrontChangeHandler;

  storefrontChangeHandler = self->_storefrontChangeHandler;
  self->_storefrontChangeHandler = 0;

}

- (void)registerOnAccountChange:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;

  v4 = a3;
  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v12 = "-[JSAStore registerOnAccountChange:]";
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[JSAStore callbackQueue](self, "callbackQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_2749C;
  v9[3] = &unk_9DCF8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

- (void)unregisterOnAccountChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[JSAStore callbackQueue](self, "callbackQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_27594;
  v7[3] = &unk_9DCF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)registerOnRestrictionChange:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  JSManagedValue *v7;
  JSManagedValue *restrictionHandler;
  int v9;
  const char *v10;

  v4 = a3;
  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446210;
    v10 = "-[JSAStore registerOnRestrictionChange:]";
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v9, 0xCu);
  }

  v7 = (JSManagedValue *)objc_claimAutoreleasedReturnValue(+[JSManagedValue managedValueWithValue:](JSManagedValue, "managedValueWithValue:", v4));
  restrictionHandler = self->_restrictionHandler;
  self->_restrictionHandler = v7;

}

- (void)unregisterOnRestrictionChange
{
  JSManagedValue *restrictionHandler;

  restrictionHandler = self->_restrictionHandler;
  self->_restrictionHandler = 0;

}

- (BOOL)isAuthenticated
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[JSAStore account](self, "account"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[JSAStore account](self, "account"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIdentifier"));
    v6 = objc_msgSend(v5, "length") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_updateRestrictionsAndNotifyIfNeeded
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[JSAStore restrictionsQueue](self, "restrictionsQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_27808;
  v4[3] = &unk_9DF80;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  NSObject *accountQueue;
  _QWORD block[4];
  id v9;
  id buf[2];

  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[Store] account store did change", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  accountQueue = self->_accountQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_27F84;
  block[3] = &unk_9DF80;
  objc_copyWeak(&v9, buf);
  dispatch_async(accountQueue, block);
  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

- (void)accountControllerDidAttemptSignIn:(id)a3
{
  NSObject *accountQueue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  accountQueue = self->_accountQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_28198;
  v5[3] = &unk_9DF80;
  objc_copyWeak(&v6, &location);
  dispatch_async(accountQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (BOOL)allowsAccountModification
{
  return self->_allowsAccountModification;
}

- (BOOL)allowsErotica
{
  return self->_allowsErotica;
}

- (BOOL)allowsStore
{
  return self->_allowsStore;
}

- (BOOL)isRunningInStoreDemoMode
{
  return self->_isRunningInStoreDemoMode;
}

- (OS_dispatch_queue)accountQueue
{
  return self->_accountQueue;
}

- (void)setAccountQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accountQueue, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (OS_dispatch_queue)restrictionsQueue
{
  return self->_restrictionsQueue;
}

- (void)setRestrictionsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_restrictionsQueue, a3);
}

- (NSArray)accountHandlers
{
  return self->_accountHandlers;
}

- (void)setAccountHandlers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (JSManagedValue)restrictionHandler
{
  return self->_restrictionHandler;
}

- (void)setRestrictionHandler:(id)a3
{
  objc_storeStrong((id *)&self->_restrictionHandler, a3);
}

- (JSManagedValue)storefrontChangeHandler
{
  return self->_storefrontChangeHandler;
}

- (void)setStorefrontChangeHandler:(id)a3
{
  objc_storeStrong((id *)&self->_storefrontChangeHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontChangeHandler, 0);
  objc_storeStrong((id *)&self->_restrictionHandler, 0);
  objc_storeStrong((id *)&self->_accountHandlers, 0);
  objc_storeStrong((id *)&self->_restrictionsQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_accountQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end
