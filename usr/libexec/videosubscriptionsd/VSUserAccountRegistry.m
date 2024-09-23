@implementation VSUserAccountRegistry

- (VSUserAccountRegistry)init
{
  return -[VSUserAccountRegistry initWithDelegate:](self, "initWithDelegate:", 0);
}

- (VSUserAccountRegistry)initWithDelegate:(id)a3
{
  id v4;
  VSUserAccountRegistry *v5;
  VSUserAccountRegistry *v6;
  VSPreferences *v7;
  VSPreferences *preferences;
  NSOperationQueue *v9;
  NSOperationQueue *privateQueue;
  NSOperationQueue *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  id v15;
  VSRemoteNotifier *v16;
  VSRemoteNotifier *remoteNotifier;
  id v18;
  id v19;
  VSPrivacyFacade *v20;
  VSPrivacyFacade *privacyFacade;
  VSUserAccountPersistentContainer *v22;
  VSUserAccountPersistentContainer *container;
  uint64_t v24;
  NSDate *lastUpdateTime;
  _QWORD v27[4];
  VSUserAccountRegistry *v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)VSUserAccountRegistry;
  v5 = -[VSUserAccountRegistry init](&v29, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (VSPreferences *)objc_alloc_init((Class)VSPreferences);
    preferences = v6->_preferences;
    v6->_preferences = v7;

    v9 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    privateQueue = v6->_privateQueue;
    v6->_privateQueue = v9;

    v11 = v6->_privateQueue;
    v12 = (objc_class *)objc_opt_class(v6);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[NSOperationQueue setName:](v11, "setName:", v14);

    -[NSOperationQueue setMaxConcurrentOperationCount:](v6->_privateQueue, "setMaxConcurrentOperationCount:", 1);
    v15 = objc_alloc((Class)VSRemoteNotifier);
    v16 = (VSRemoteNotifier *)objc_msgSend(v15, "initWithNotificationName:", VSUserAccountsDidChangeNotification);
    remoteNotifier = v6->_remoteNotifier;
    v6->_remoteNotifier = v16;

    v18 = objc_alloc((Class)VSPrivacyFacade);
    v19 = objc_alloc_init((Class)VSPrivacyVoucherLockbox);
    v20 = (VSPrivacyFacade *)objc_msgSend(v18, "initWithVoucherLockbox:", v19);
    privacyFacade = v6->_privacyFacade;
    v6->_privacyFacade = v20;

    v22 = (VSUserAccountPersistentContainer *)objc_msgSend(objc_alloc((Class)VSUserAccountPersistentContainer), "initInMemory:", 0);
    container = v6->_container;
    v6->_container = v22;

    v6->_loadingStoresLock._os_unfair_lock_opaque = 0;
    v24 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    lastUpdateTime = v6->_lastUpdateTime;
    v6->_lastUpdateTime = (NSDate *)v24;

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100005314;
    v27[3] = &unk_100018720;
    v28 = v6;
    -[VSUserAccountRegistry _loadStoresAndMigrateIfRequiredWithCompletion:](v28, "_loadStoresAndMigrateIfRequiredWithCompletion:", v27);

  }
  return v6;
}

- (void)_setupObservers
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = WLKSettingsDidChangeNotification;
  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005508;
  v7[3] = &unk_100018748;
  objc_copyWeak(&v8, &location);
  v6 = objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v3, 0, v5, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)_loadStoresAndMigrateIfRequiredWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry privateQueue](self, "privateQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000561C;
  v7[3] = &unk_100018810;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

}

- (void)_subscriptionsForMigrationWithCompletion:(id)a3
{
  void (**v4)(id, _BOOL8, _QWORD);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint8_t *v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v4 = (void (**)(id, _BOOL8, _QWORD))a3;
  v5 = objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry delegate](self, "delegate"));
  v6 = (void *)v5;
  if (v5
    && (v7 = objc_opt_respondsToSelector(v5, "userAccountRegistry:willPerformMigrationIfRequiredWithBlock:"),
        (v7 & 1) != 0))
  {
    v11 = VSDefaultLogObject(v7, v8, v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Will invoke migration delegate method.", buf, 2u);
    }

    v13 = objc_alloc_init((Class)VSWaitGroup);
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    *(_QWORD *)buf = 0;
    v26 = buf;
    v27 = 0x3032000000;
    v28 = sub_100005970;
    v29 = sub_100005980;
    v30 = 0;
    objc_msgSend(v13, "enter");
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000061D8;
    v21[3] = &unk_100018838;
    v23 = &v31;
    v24 = buf;
    v14 = v13;
    v22 = v14;
    objc_msgSend(v6, "userAccountRegistry:willPerformMigrationIfRequiredWithBlock:", self, v21);
    if (objc_msgSend(v14, "waitWithMilliseconds:", 2000))
    {
      v15 = *((_BYTE *)v32 + 24) != 0;
      v16 = *((_QWORD *)v26 + 5);
    }
    else
    {
      v19 = VSErrorLogObject();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        sub_10000EC54();

      v15 = 0;
      v16 = 0;
    }
    v4[2](v4, v15, v16);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v31, 8);

  }
  else
  {
    v17 = VSErrorLogObject();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      sub_10000EC28();

    v4[2](v4, 0, 0);
  }

}

- (void)queryUserAccountsWithOptions:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForQueryRequestWithOptions:](self, "_predicateForQueryRequestWithOptions:", a3));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006398;
  v11[3] = &unk_100018888;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  -[VSUserAccountRegistry queryUserAccountsWithPredicate:completion:](self, "queryUserAccountsWithPredicate:completion:", v8, v11);

}

- (void)queryUserAccountsWithOptions:(int64_t)a3 sourceIdentifier:(id)a4 sourceType:(id)a5 deviceIdentifier:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[2];

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForQueryRequestWithOptions:](self, "_predicateForQueryRequestWithOptions:", a3));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForUserAccountWithDeviceIdentifier:sourceIdentifier:sourceType:](self, "_predicateForUserAccountWithDeviceIdentifier:sourceIdentifier:sourceType:", v13, v15, v14));

  v25[0] = v16;
  v25[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v18));

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100006608;
  v22[3] = &unk_100018888;
  v22[4] = self;
  v23 = (id)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection"));
  v24 = v12;
  v20 = v12;
  v21 = v23;
  -[VSUserAccountRegistry queryUserAccountsWithPredicate:completion:](self, "queryUserAccountsWithPredicate:completion:", v19, v22);

}

- (void)updateUserAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id *v10;
  id v11;
  id *v12;
  id v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  id v37;
  unsigned __int8 v38;
  unsigned __int8 v39;
  void *v40;
  void *v41;
  id *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  VSUserAccountRegistry *v49;
  id v50;
  unsigned __int8 v51;
  _OWORD v52[2];
  _QWORD v53[4];
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  uint8_t buf[4];
  id v60;

  v6 = a3;
  v7 = a4;
  if (-[VSUserAccountRegistry shouldAllowUserAccountUpdate:](self, "shouldAllowUserAccountUpdate:", v6))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry privateQueue](self, "privateQueue"));
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100006B64;
    v53[3] = &unk_100018650;
    v10 = &v54;
    v11 = v8;
    v54 = v11;
    v12 = &v55;
    v13 = v6;
    v55 = v13;
    objc_msgSend(v9, "addOperationWithBlock:", v53);

    v14 = -[VSUserAccountRegistry _isValidForUpdateQueryForCurrentTask:](self, "_isValidForUpdateQueryForCurrentTask:", v13);
    if (v14)
    {
      v18 = VSDefaultLogObject(v14, v15, v16, v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v60 = v13;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "user account update permitted: %@", buf, 0xCu);
      }

      v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accountProviderIdentifier"));
      v21 = objc_msgSend(v20, "length");
      if (v21)
      {
        v25 = VSDefaultLogObject(v21, v22, v23, v24);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "user account indicates an account provider identifier.", buf, 2u);
        }

        v27 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry privacyFacade](self, "privacyFacade"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
        v29 = v28;
        if (v28)
          objc_msgSend(v28, "auditToken");
        else
          memset(v52, 0, sizeof(v52));
        v38 = objc_msgSend(v27, "isAccessGrantedForAuditToken:", v52, &v54);

        if ((v38 & 1) != 0)
        {
          v39 = 1;
        }
        else
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection"));
          v39 = objc_msgSend(v40, "shouldAllowAccessForBooleanEntitlement:", VSEntitlementNameInternalSubscriptionService);

        }
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[VSAccountStore sharedAccountStore](VSAccountStore, "sharedAccountStore"));
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_100006C98;
        v46[3] = &unk_100018950;
        v20 = v20;
        v47 = v20;
        v51 = v39;
        v48 = v13;
        v49 = self;
        v50 = v7;
        objc_msgSend(v41, "fetchAccountsWithCompletionHandler:", v46);

        v10 = v42;
      }
      else
      {
        -[VSUserAccountRegistry insertUserAccount:completion:](self, "insertUserAccount:completion:", v13, v7);
      }
    }
    else
    {
      v20 = (id)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "signingIdentifier"));
      v34 = VSErrorLogObject();
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        sub_10000EC80();

      if (v7)
      {
        v36 = VSPublicError(1, 6, 0);
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_100007108;
        v43[3] = &unk_1000188B0;
        v44 = (id)objc_claimAutoreleasedReturnValue(v36);
        v45 = v7;
        v37 = v44;
        VSPerformCompletionHandler(v43);

      }
    }

    goto LABEL_26;
  }
  v30 = VSErrorLogObject();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    sub_10000ECE0();

  if (v7)
  {
    v32 = VSPublicError(1, 3, 0);
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_100006B54;
    v56[3] = &unk_1000188B0;
    v10 = &v58;
    v12 = &v57;
    v57 = (id)objc_claimAutoreleasedReturnValue(v32);
    v58 = v7;
    v11 = v57;
    VSPerformCompletionHandler(v56);
LABEL_26:

  }
}

- (void)deleteUserAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry privateQueue](self, "privateQueue"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100007298;
  v18[3] = &unk_100018650;
  v10 = v8;
  v19 = v10;
  v11 = v6;
  v20 = v11;
  objc_msgSend(v9, "addOperationWithBlock:", v18);

  if (-[VSUserAccountRegistry _isValidForDeleteQueryForCurrentTask](self, "_isValidForDeleteQueryForCurrentTask"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry createSaveContext](self, "createSaveContext"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000073E0;
    v14[3] = &unk_100018928;
    v13 = &v15;
    v15 = v7;
    -[VSUserAccountRegistry _deleteUserAccount:context:completion:](self, "_deleteUserAccount:context:completion:", v11, v12, v14);

  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100007390;
    v16[3] = &unk_1000188D8;
    v13 = &v17;
    v17 = v7;
    VSPerformCompletionHandler(v16);
  }

}

- (void)forceUpdateUserAccountsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id buf[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection"));
  v6 = objc_msgSend(v5, "shouldAllowAccessForBooleanEntitlement:", VSEntitlementNameInternalUserAccountServiceForceUpdate);

  if (v6)
  {
    v11 = VSDefaultLogObject(v7, v8, v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Forcefully updating user accounts", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry privateQueue](self, "privateQueue"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000076B0;
    v18[3] = &unk_100018978;
    objc_copyWeak(&v20, buf);
    v19 = v4;
    objc_msgSend(v13, "addOperationWithBlock:", v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak(buf);
  }
  else
  {
    v14 = VSErrorLogObject();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10000EE2C();

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100007750;
    v16[3] = &unk_1000188D8;
    v17 = v4;
    VSPerformCompletionHandler(v16);

  }
}

- (void)forceRefreshUserAccount:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id buf[2];

  v6 = a3;
  v7 = a4;
  v8 = -[VSUserAccountRegistry _isValidForUpdateQueryForCurrentTask:](self, "_isValidForUpdateQueryForCurrentTask:", v6);
  if (v8)
  {
    v12 = VSDefaultLogObject(v8, v9, v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Forcefully updating user account", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry privateQueue](self, "privateQueue"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100007928;
    v19[3] = &unk_1000189A0;
    objc_copyWeak(&v22, buf);
    v20 = v6;
    v21 = v7;
    objc_msgSend(v14, "addOperationWithBlock:", v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak(buf);
  }
  else
  {
    v15 = VSErrorLogObject();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10000EE58();

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000079D0;
    v17[3] = &unk_1000188D8;
    v18 = v7;
    VSPerformCompletionHandler(v17);

  }
}

- (void)queryUserAccountsWithPredicate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry createSaveContext](self, "createSaveContext"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007A90;
  v10[3] = &unk_1000189C8;
  v11 = v6;
  v9 = v6;
  -[VSUserAccountRegistry _queryUserAccountsWithPredicate:context:completion:](self, "_queryUserAccountsWithPredicate:context:completion:", v7, v8, v10);

}

- (void)insertUserAccount:(id)a3 completion:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007BB4;
  v7[3] = &unk_100018928;
  v8 = a4;
  v6 = v8;
  -[VSUserAccountRegistry _insertUserAccount:completion:](self, "_insertUserAccount:completion:", a3, v7);

}

- (void)fetchActiveSubscriptionsWithOptions:(id)a3 completionHandler:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;

  v5 = a4;
  v9 = VSDefaultLogObject(v5, v6, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[VSUserAccountRegistry fetchActiveSubscriptionsWithOptions:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100007DC8;
  v12[3] = &unk_1000189C8;
  v13 = v5;
  v11 = v5;
  -[VSUserAccountRegistry queryUserAccountsWithOptions:completion:](self, "queryUserAccountsWithOptions:completion:", 0, v12);

}

- (void)registerSubscription:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSValueTransformer valueTransformerForName:](NSValueTransformer, "valueTransformerForName:", VSSubscriptionValueTransformerName));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transformedValue:", v7));

  if (!v5)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("The [subscriptionTransformer transformedValue:subscription] parameter must not be nil."));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transformedValue:", v7));
  -[VSUserAccountRegistry updateUserAccount:completion:](self, "updateUserAccount:completion:", v6, 0);

}

- (void)removeSubscriptions:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  NSExceptionName v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    v9 = VSSubscriptionValueTransformerName;
    v21 = NSInvalidArgumentException;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSValueTransformer valueTransformerForName:](NSValueTransformer, "valueTransformerForName:", v9, v21));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "transformedValue:", v11));

        if (!v13)
          +[NSException raise:format:](NSException, "raise:format:", v21, CFSTR("The [subscriptionTransformer transformedValue:subscription] parameter must not be nil."));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "transformedValue:", v11));
        objc_msgSend(v5, "addObject:", v14);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v20, "setSignedOut:", 1);
        -[VSUserAccountRegistry updateUserAccount:completion:](self, "updateUserAccount:completion:", v20, 0);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v17);
  }

}

- (BOOL)saveContext:(id)a3 withError:(id *)a4
{
  id v5;
  unsigned __int8 v6;

  v5 = a3;
  if (objc_msgSend(v5, "hasChanges"))
    v6 = objc_msgSend(v5, "save:", a4);
  else
    v6 = 1;

  return v6;
}

- (id)createSaveContext
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry container](self, "container"));
  v3 = objc_msgSend(v2, "newBackgroundContext");

  objc_msgSend(v3, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
  objc_msgSend(v3, "setAutomaticallyMergesChangesFromParent:", 1);
  return v3;
}

- (BOOL)shouldAllowUserAccountUpdate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VSDevice currentDevice](VSDevice, "currentDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serialNumber"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceIdentifier"));
  if (!v6)
    objc_msgSend(v3, "setDeviceIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceIdentifier"));
  objc_msgSend(v3, "setFromCurrentDevice:", objc_msgSend(v7, "isEqual:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceIdentifier"));
  LOBYTE(v7) = v8 != 0;

  return (char)v7;
}

- (id)_updateRequestForAccount:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v4 = a3;
  v5 = -[VSUserAccountRegistry currentUpdateSessionIsForced](self, "currentUpdateSessionIsForced");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updateURL"));

  if (v6
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subscriptionBillingCycleEndDate")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now")),
        v9 = objc_msgSend(v7, "vs_isAfter:", v8) | v5,
        v8,
        v7,
        v9 == 1))
  {
    v10 = objc_msgSend(objc_alloc((Class)VSUserAccountUpdateRequest), "initWithUserAccount:", v4);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_setUpdateRequestManagerWithRequests:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)VSUserAccountUpdateManager), "initWithUserAccountUpdateRequests:", v4);

  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "updateUserAccounts");
  -[VSUserAccountRegistry setUpdateManager:](self, "setUpdateManager:", v5);

}

- (void)_forceRefreshAccount:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry privateQueue](self, "privateQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008A84;
  v7[3] = &unk_100018650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

}

- (void)_update
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry privateQueue](self, "privateQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008C98;
  v4[3] = &unk_100018A40;
  v4[4] = self;
  objc_msgSend(v3, "addOperationWithBlock:", v4);

}

- (void)resetTimer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[6];
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag vs_defaultBag](AMSBag, "vs_defaultBag"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "integerForKey:", VSAMSBagKeyMaximumUserAccountUpdateFrequency));

  v13 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueWithError:", &v13));
  v6 = v13;
  if (!v5)
  {
    v7 = VSErrorLogObject();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000EEE4();

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 43200.0));
  }
  objc_msgSend(v5, "doubleValue");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry privateQueue](self, "privateQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000090D8;
  v12[3] = &unk_100018AB8;
  v12[4] = self;
  v12[5] = v10;
  objc_msgSend(v11, "addOperationWithBlock:", v12);

}

- (void)_removeNonConnectedSignedOutUserAccounts
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry privateQueue](self, "privateQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000097F0;
  v4[3] = &unk_100018A40;
  v4[4] = self;
  objc_msgSend(v3, "addOperationWithBlock:", v4);

}

- (void)_insertUserAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  VSUserAccountRegistry *v21;
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  _QWORD *v30;
  _QWORD v31[5];
  id v32;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection"));
  if (-[VSUserAccountRegistry shouldAllowUserAccountUpdate:](self, "shouldAllowUserAccountUpdate:", v6))
  {
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = sub_100005970;
    v31[4] = sub_100005980;
    v32 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry createSaveContext](self, "createSaveContext"));
    v10 = objc_alloc_init((Class)VSWaitGroup);
    objc_msgSend(v10, "enter");
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100009EF0;
    v26[3] = &unk_100018B58;
    v26[4] = self;
    v11 = v9;
    v27 = v11;
    v30 = v31;
    v12 = v10;
    v28 = v12;
    v13 = v6;
    v29 = v13;
    -[VSUserAccountRegistry _persistentAccountsForUserAccount:context:completion:](self, "_persistentAccountsForUserAccount:context:completion:", v13, v11, v26);
    objc_msgSend(v12, "wait");
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000A1C8;
    v19[3] = &unk_100018B80;
    v25 = v31;
    v14 = v11;
    v20 = v14;
    v21 = self;
    v22 = v13;
    v23 = v8;
    v24 = v7;
    objc_msgSend(v14, "performBlock:", v19);

    _Block_object_dispose(v31, 8);
  }
  else
  {
    v15 = VSErrorLogObject();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10000EFC0();

    v17 = VSPublicError(1, 3, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    (*((void (**)(id, void *))v7 + 2))(v7, v18);

  }
}

- (void)_persistentAccountsForUserAccount:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sourceIdentifier"));
  v13 = objc_msgSend(v10, "sourceType");

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForUserAccountWithDeviceIdentifier:sourceIdentifier:sourceType:](self, "_predicateForUserAccountWithDeviceIdentifier:sourceIdentifier:sourceType:", v11, v12, v14));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000A618;
  v18[3] = &unk_100018BA8;
  v19 = v8;
  v20 = v9;
  v16 = v9;
  v17 = v8;
  -[VSUserAccountRegistry _queryPersistentUserAccountsWithPredicate:context:completion:](self, "_queryPersistentUserAccountsWithPredicate:context:completion:", v15, v17, v18);

}

- (void)_deduplicatePersistentUserAccounts:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _BOOL4 v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void (**v31)(id, void *, _QWORD);
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  __int128 buf;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  void *v43;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v11 = objc_msgSend(v8, "count");
  if ((unint64_t)v11 < 2)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v10[2](v10, v28, 0);

  }
  else
  {
    v15 = VSDefaultLogObject(v11, v12, v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v8, "count");
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Found %lu duplicate persistent user accounts that match the user account to insert.", (uint8_t *)&buf, 0xCu);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _sortForUserAccountModifiedTimeASC:](self, "_sortForUserAccountModifiedTimeASC:", 1));
    v43 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v43, 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sortedArrayUsingDescriptors:", v18));

    v20 = objc_msgSend(v19, "mutableCopy");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastObject"));
    v22 = v21 == 0;

    if (v22)
      +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("The [accountsToRemove lastObject] parameter must not be nil."));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastObject"));
    objc_msgSend(v20, "removeLastObject");
    v29 = (void *)v23;
    v30 = v19;
    v31 = v10;
    v32 = v8;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v39 = 0x3032000000;
    v40 = sub_100005970;
    v41 = sub_100005980;
    v42 = 0;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v24 = v20;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v34;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v34 != v26)
            objc_enumerationMutation(v24);
          -[VSUserAccountRegistry _deletePersistentUserAccount:withContext:completion:](self, "_deletePersistentUserAccount:withContext:completion:", v29, v30, v31, v32, _NSConcreteStackBlock, 3221225472, sub_10000AA90, &unk_100018BD0, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v27), &buf, (_QWORD)v33);
          v27 = (char *)v27 + 1;
        }
        while (v25 != v27);
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v25);
    }

    v10 = v31;
    v8 = v32;
    v31[2](v31, v29, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    _Block_object_dispose(&buf, 8);

  }
}

- (void)_deleteUserAccount:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sourceIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceIdentifier"));
  v13 = objc_msgSend(v10, "sourceType");

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForUserAccountWithDeviceIdentifier:sourceIdentifier:sourceType:](self, "_predicateForUserAccountWithDeviceIdentifier:sourceIdentifier:sourceType:", v12, v11, v14));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000ACA4;
  v18[3] = &unk_100018BF8;
  v19 = v8;
  v20 = v9;
  v18[4] = self;
  v16 = v8;
  v17 = v9;
  -[VSUserAccountRegistry _queryPersistentUserAccountsWithPredicate:context:completion:](self, "_queryPersistentUserAccountsWithPredicate:context:completion:", v15, v16, v18);

}

- (void)_deletePersistentUserAccount:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  VSUserAccountRegistry *v14;
  id v15;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000AE98;
  v11[3] = &unk_100018C20;
  v12 = a3;
  v13 = a4;
  v14 = self;
  v15 = a5;
  v8 = v15;
  v9 = v13;
  v10 = v12;
  objc_msgSend(v9, "performBlock:", v11);

}

- (void)_queryUserAccountsWithPredicate:(id)a3 context:(id)a4 completion:(id)a5
{
  -[VSUserAccountRegistry _queryUserAccountsWithPredicate:sorts:fetchLimit:context:completion:](self, "_queryUserAccountsWithPredicate:sorts:fetchLimit:context:completion:", a3, 0, 0, a4, a5);
}

- (void)_queryUserAccountsWithPredicate:(id)a3 sorts:(id)a4 fetchLimit:(id)a5 context:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000B130;
  v14[3] = &unk_100018BF8;
  v15 = a6;
  v16 = a7;
  v14[4] = self;
  v12 = v15;
  v13 = v16;
  -[VSUserAccountRegistry _queryPersistentUserAccountsWithPredicate:sorts:fetchLimit:context:completion:](self, "_queryPersistentUserAccountsWithPredicate:sorts:fetchLimit:context:completion:", a3, a4, a5, v12, v14);

}

- (void)_queryPersistentUserAccountsWithPredicate:(id)a3 context:(id)a4 completion:(id)a5
{
  -[VSUserAccountRegistry _queryPersistentUserAccountsWithPredicate:sorts:fetchLimit:context:completion:](self, "_queryPersistentUserAccountsWithPredicate:sorts:fetchLimit:context:completion:", a3, 0, 0, a4, a5);
}

- (void)_queryPersistentUserAccountsWithPredicate:(id)a3 sorts:(id)a4 fetchLimit:(id)a5 context:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000B3C8;
  v21[3] = &unk_100018C70;
  v25 = v14;
  v26 = a7;
  v22 = v15;
  v23 = v12;
  v24 = v13;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  v19 = v26;
  v20 = v15;
  -[VSUserAccountRegistry _loadStoresAndMigrateIfRequiredWithCompletion:](self, "_loadStoresAndMigrateIfRequiredWithCompletion:", v21);

}

- (void)_populatePersistentUserAccount:(id)a3 withUserAccount:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[VSDevice currentDevice](VSDevice, "currentDevice"));
  v11 = objc_msgSend(v10, "deviceType");

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000B8CC;
  v14[3] = &unk_100018C98;
  v15 = v7;
  v16 = v8;
  v17 = v11;
  v12 = v8;
  v13 = v7;
  objc_msgSend(v9, "performBlockAndWait:", v14);

}

- (id)_userAccountForPersistentUserAccount:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;

  v5 = a3;
  v40 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceIdentifier"));
  v7 = objc_msgSend(v5, "sourceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[VSDevice currentDevice](VSDevice, "currentDevice"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serialNumber"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceIdentifier"));
  v11 = objc_msgSend(v10, "isEqual:", v9);
  v12 = objc_alloc((Class)VSUserAccount);
  v13 = objc_msgSend(v5, "accountType");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "updateURL"));
  v15 = objc_msgSend(v12, "initWithAccountType:updateURL:sourceType:sourceIdentifier:", v13, v14, v7, v6);

  objc_msgSend(v15, "setRequiresSystemTrust:", objc_msgSend(v5, "requiresSystemTrust"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "providerID"));
  v17 = objc_msgSend(v16, "copy");
  objc_msgSend(v15, "setAccountProviderIdentifier:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountIdentifier"));
  objc_msgSend(v15, "setIdentifier:", v18);

  objc_msgSend(v15, "setSignedOut:", objc_msgSend(v5, "signedOut"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tierIdentifiers"));
  objc_msgSend(v15, "setTierIdentifiers:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "billingIdentifier"));
  v21 = objc_msgSend(v20, "copy");
  objc_msgSend(v15, "setBillingIdentifier:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "authenticationData"));
  v23 = objc_msgSend(v22, "copy");
  objc_msgSend(v15, "setAuthenticationData:", v23);

  objc_msgSend(v15, "setDeviceCategory:", +[VSUserAccount deviceCategoryFromDeviceType:](VSUserAccount, "deviceCategoryFromDeviceType:", objc_msgSend(v5, "deviceType")));
  objc_msgSend(v15, "setFromCurrentDevice:", v11);
  objc_msgSend(v15, "setKeychainItemHash:", objc_msgSend(v5, "keychainItemHash"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "modified"));
  objc_msgSend(v15, "setModified:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "created"));
  objc_msgSend(v15, "setCreated:", v25);

  objc_msgSend(v15, "setIsDeveloperCreated:", objc_msgSend(v5, "developer"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appleSubscription"));
  objc_msgSend(v15, "setAppleSubscription:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceIdentifier"));
  objc_msgSend(v15, "setDeviceIdentifier:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceName"));
  if (v28 || !(_DWORD)v11)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceName"));
    objc_msgSend(v15, "setDeviceName:", v29);
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[VSDevice currentDevice](VSDevice, "currentDevice"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "name"));
    objc_msgSend(v15, "setDeviceName:", v30);

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "billingCycleEndDate"));
  objc_msgSend(v15, "setSubscriptionBillingCycleEndDate:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "accountProviderIdentifier"));
  if (!objc_msgSend(v15, "sourceType") && objc_msgSend(v32, "length"))
  {
    if (!v32)
      +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("The accountProviderIdentifierOrNil parameter must not be nil."));
    v33 = v32;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForUserAccountWithDeviceIdentifier:sourceIdentifier:sourceType:](self, "_predicateForUserAccountWithDeviceIdentifier:sourceIdentifier:sourceType:", 0, v33, &off_100019370));
    v35 = objc_alloc_init((Class)VSSemaphore);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10000BFB0;
    v41[3] = &unk_100018D80;
    v42 = v33;
    v43 = v15;
    v44 = v35;
    v36 = v35;
    v37 = v33;
    -[VSUserAccountRegistry _queryPersistentUserAccountsWithPredicate:context:completion:](self, "_queryPersistentUserAccountsWithPredicate:context:completion:", v34, v40, v41);
    objc_msgSend(v36, "wait");

  }
  return v15;
}

- (id)_securityTaskForCurrentConnection
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));

  if (!v2)
    +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Attempted to get security task from non-XPC thread."));
  return +[VSSecurityTask securityTaskForCurrentConnection](VSSecurityTask, "securityTaskForCurrentConnection");
}

- (BOOL)_isValidForDeleteQueryForCurrentTask
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection"));
  v3 = objc_msgSend(v2, "shouldAllowAccessForBooleanEntitlement:", VSEntitlementNameInternalUserAccountServiceDelete);

  return v3;
}

- (BOOL)_isValidForUpdateQueryForCurrentTask:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  unsigned int v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection"));
  if ((objc_msgSend(v5, "shouldAllowAccessForBooleanEntitlement:", VSEntitlementNameInternalSubscriptionService) & 1) != 0)goto LABEL_2;
  if ((objc_msgSend(v5, "shouldAllowAccessForBooleanEntitlement:", VSEntitlementNameUserAccountService) & 1) == 0
    && (objc_msgSend(v5, "shouldAllowAccessForBooleanEntitlement:", VSEntitlementNameSmootSubscriptionService) & 1) == 0)
  {
    v12 = VSErrorLogObject();
    v10 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10000F4DC();
    goto LABEL_30;
  }
  v7 = objc_msgSend(v5, "shouldAllowAccessForBooleanEntitlement:", VSEntitlementNameSubscriptionServiceReadWriteWebSources);
  v8 = objc_msgSend(v4, "sourceType");
  if (!v7)
  {
    if (v8 == (id)2)
    {
      v11 = VSErrorLogObject();
      v10 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10000F37C();
    }
    else
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "signingIdentifier"));
      v10 = v13;
      if (v13)
      {
        v10 = v13;
        v14 = objc_msgSend(v4, "sourceType");
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sourceIdentifier"));
        v16 = objc_msgSend(v15, "isEqualToString:", v10);

        if (v14)
        {
          v17 = VSErrorLogObject();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            sub_10000F468(v4, v18);

        }
        if ((v16 & 1) == 0)
        {
          v19 = VSErrorLogObject();
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            sub_10000F3D4(v4, (uint64_t)v10, v20);

        }
        if (v14)
          v6 = 0;
        else
          v6 = v16;

        goto LABEL_31;
      }
      v21 = VSErrorLogObject();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_10000F3A8();

    }
LABEL_30:
    v6 = 0;
LABEL_31:

    goto LABEL_32;
  }
  if (v8 != (id)1)
  {
    v9 = VSErrorLogObject();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10000F308(v4, v10);
    goto LABEL_30;
  }
LABEL_2:
  v6 = 1;
LABEL_32:

  return v6;
}

- (id)prepareUserAccountsToVend:(id)a3 withSecurityTask:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    v12 = VSEntitlementNameInternalUserAccountService;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v14, "isFromCurrentDevice", (_QWORD)v16) & 1) == 0)
          objc_msgSend(v14, "setAuthenticationData:", 0);
        if ((objc_msgSend(v6, "shouldAllowAccessForBooleanEntitlement:", v12) & 1) == 0)
          objc_msgSend(v14, "setDeviceName:", 0);
        objc_msgSend(v7, "addObject:", v14);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)_sortForUserAccountModifiedTimeASC:(BOOL)a3
{
  return +[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("modified"), a3);
}

- (id)_sortForUserAccountBillingCycleEndDateASC:(BOOL)a3
{
  return +[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("billingCycleEndDate"), a3);
}

- (id)_predicateForFetchingZeroResults
{
  return +[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 0);
}

- (id)_predicateForFetchingAllResults
{
  return +[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1);
}

- (id)_predicateForIsSignedOut:(BOOL)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("signedOut"), objc_msgSend(v3, "intValue")));

  return v4;
}

- (id)_predicateForUserAccountFromDeviceID:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("deviceIdentifier"), a3);
}

- (id)_predicateForUserAccountFromCurrentDevice
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VSDevice currentDevice](VSDevice, "currentDevice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serialNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForUserAccountFromDeviceID:](self, "_predicateForUserAccountFromDeviceID:", v4));

  return v5;
}

- (id)_predicateForUserAccountFromSourceID:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("sourceIdentifier"), a3);
}

- (id)_predicateForUserAccountWithSourceType:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("sourceType"), objc_msgSend(a3, "integerValue"));
}

- (id)_predicateForUserAccountWithNonnullUpdateURL
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("updateURL"));
}

- (id)_predicateForUserAccountWithNonnullBillingCycleEndDate
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("billingCycleEndDate"));
}

- (id)_predicateForUserAccountWithDeviceIdentifier:(id)a3 sourceIdentifier:(id)a4 sourceType:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init((Class)NSMutableArray);
  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForUserAccountFromSourceID:](self, "_predicateForUserAccountFromSourceID:", v9));
    objc_msgSend(v11, "addObject:", v12);

  }
  if (v10)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForUserAccountWithSourceType:](self, "_predicateForUserAccountWithSourceType:", v10));
    objc_msgSend(v11, "addObject:", v13);

  }
  if (v8)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForUserAccountFromDeviceID:](self, "_predicateForUserAccountFromDeviceID:", v8));
    objc_msgSend(v11, "addObject:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v11));

  return v15;
}

- (id)_predicateForQueryRequestWithOptions:(int64_t)a3
{
  char v3;
  void *v5;
  unsigned __int8 v6;
  unsigned int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  void *v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  _QWORD v44[2];
  _QWORD v45[3];
  _QWORD v46[3];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection"));
  v6 = objc_msgSend(v5, "shouldAllowAccessForBooleanEntitlement:", VSEntitlementNameInternalUserAccountService);
  if ((objc_msgSend(v5, "shouldAllowAccessForBooleanEntitlement:", VSEntitlementNameSubscriptionServiceFetchFromAllSources) & 1) != 0)v7 = 1;
  else
    v7 = objc_msgSend(v5, "shouldAllowAccessForBooleanEntitlement:", VSEntitlementNameInternalSubscriptionService);
  if ((objc_msgSend(v5, "shouldAllowAccessForBooleanEntitlement:", VSEntitlementNameUserAccountService) & 1) != 0
    || (v8 = objc_msgSend(v5, "shouldAllowAccessForBooleanEntitlement:", VSEntitlementNameSmootSubscriptionService),
        ((v7 | v8) & 1) != 0))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForFetchingZeroResults](self, "_predicateForFetchingZeroResults"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForUserAccountWithSourceType:](self, "_predicateForUserAccountWithSourceType:", &off_100019370));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForFetchingZeroResults](self, "_predicateForFetchingZeroResults"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForUserAccountWithSourceType:](self, "_predicateForUserAccountWithSourceType:", &off_100019388));

    LODWORD(v13) = objc_msgSend(v5, "shouldAllowAccessForBooleanEntitlement:", VSEntitlementNameSubscriptionServiceReadWriteWebSources);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForFetchingZeroResults](self, "_predicateForFetchingZeroResults"));
    if ((_DWORD)v13)
    {
      v15 = objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForUserAccountWithSourceType:](self, "_predicateForUserAccountWithSourceType:", &off_1000193A0));

      v14 = (void *)v15;
    }
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "signingIdentifier"));
    if (v16)
      v17 = v7;
    else
      v17 = 1;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForFetchingAllResults](self, "_predicateForFetchingAllResults"));
    if ((v17 & 1) == 0)
    {
      v19 = objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForUserAccountFromSourceID:](self, "_predicateForUserAccountFromSourceID:", v16));

      v18 = (void *)v19;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForFetchingAllResults](self, "_predicateForFetchingAllResults"));
    if ((v3 & 1) == 0)
    {
      v21 = objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForUserAccountFromCurrentDevice](self, "_predicateForUserAccountFromCurrentDevice"));

      v20 = (void *)v21;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForFetchingAllResults](self, "_predicateForFetchingAllResults"));
    v39 = (void *)v16;
    if ((v6 & 1) == 0)
    {
      v23 = objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForIsSignedOut:](self, "_predicateForIsSignedOut:", 0));

      v22 = (void *)v23;
    }
    v46[0] = v18;
    v46[1] = v20;
    v46[2] = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 3));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v24));

    v45[0] = v41;
    v45[1] = v40;
    v45[2] = v14;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 3));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v26));

    v44[0] = v25;
    v44[1] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 2));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v28));

    v34 = VSDefaultLogObject(v30, v31, v32, v33);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v29;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "VSUserAccountRegistry Using Predicate: %@", buf, 0xCu);
    }

  }
  else
  {
    v36 = VSDefaultLogObject(v8, v9, v10, v11);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "VSUserAccountRegistry - No Internal or Minimum Entitlement, Returning Predicate NO", buf, 2u);
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForFetchingZeroResults](self, "_predicateForFetchingZeroResults"));
  }

  return v29;
}

- (void)updateManager:(id)a3 updateRequestDidFinish:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[4];
  NSObject *v33;
  uint8_t buf[4];
  id v35;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "updatedUserAccount"));
  if (-[VSUserAccountRegistry shouldAllowUserAccountUpdate:](self, "shouldAllowUserAccountUpdate:", v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "updateError"));

    if (v8)
    {
      v9 = VSErrorLogObject();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10000F568(v5, v10);
    }
    else
    {
      if (!v7)
        goto LABEL_8;
      v12 = objc_msgSend(v7, "sourceType");
      if (v12 == objc_msgSend(v6, "sourceType")
        && (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sourceIdentifier")),
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sourceIdentifier")),
            v15 = objc_msgSend(v13, "isEqual:", v14),
            v14,
            v13,
            v15))
      {
        v20 = VSDefaultLogObject(v16, v17, v18, v19);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v5;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Updated user account allowed for insert: %@", buf, 0xCu);
        }

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "updateURL"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "absoluteString"));
        objc_msgSend(v7, "setModifierIdentifier:", v23);

        v28 = VSDefaultLogObject(v24, v25, v26, v27);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "modifierIdentifier"));
          *(_DWORD *)buf = 138412290;
          v35 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Modifier identifier: %@", buf, 0xCu);

        }
        objc_msgSend(v7, "setModifierType:", VSMetricAccountUpdateValueModifierTypeJS);
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10000D300;
        v32[3] = &unk_100018720;
        v33 = v7;
        -[VSUserAccountRegistry _insertUserAccount:completion:](self, "_insertUserAccount:completion:", v33, v32);
        v10 = v33;
      }
      else
      {
        v31 = VSErrorLogObject();
        v10 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          sub_10000F508();
      }
    }
  }
  else
  {
    v11 = VSErrorLogObject();
    v10 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10000EFC0();
  }

LABEL_8:
}

- (void)updateManagerDidFinish:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VSUserAccountRegistry setUpdateManager:](self, "setUpdateManager:", 0);
  -[VSUserAccountRegistry setCurrentUpdateSessionIsForced:](self, "setCurrentUpdateSessionIsForced:", 0);
  -[VSUserAccountRegistry resetTimer](self, "resetTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry delegate](self, "delegate"));
  objc_msgSend(v5, "userAccountRegistry:didFinishUpdatingUserAccountsWithManager:", self, v4);

}

- (VSUserAccountRegistryDelegate)delegate
{
  return (VSUserAccountRegistryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_remoteNotifier, a3);
}

- (VSUserAccountPersistentContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (BOOL)currentUpdateSessionIsForced
{
  return self->_currentUpdateSessionIsForced;
}

- (void)setCurrentUpdateSessionIsForced:(BOOL)a3
{
  self->_currentUpdateSessionIsForced = a3;
}

- (VSUserAccountUpdateManager)updateManager
{
  return self->_updateManager;
}

- (void)setUpdateManager:(id)a3
{
  objc_storeStrong((id *)&self->_updateManager, a3);
}

- (WLKSettingsStore)sharedSettingsStore
{
  return self->_sharedSettingsStore;
}

- (void)setSharedSettingsStore:(id)a3
{
  objc_storeStrong((id *)&self->_sharedSettingsStore, a3);
}

- (VSPrivacyFacade)privacyFacade
{
  return self->_privacyFacade;
}

- (void)setPrivacyFacade:(id)a3
{
  objc_storeStrong((id *)&self->_privacyFacade, a3);
}

- (NSDate)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (void)setLastUpdateTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdateTime, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (BOOL)storesLoaded
{
  return self->_storesLoaded;
}

- (void)setStoresLoaded:(BOOL)a3
{
  self->_storesLoaded = a3;
}

- (os_unfair_lock_s)loadingStoresLock
{
  return self->_loadingStoresLock;
}

- (void)setLoadingStoresLock:(os_unfair_lock_s)a3
{
  self->_loadingStoresLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_lastUpdateTime, 0);
  objc_storeStrong((id *)&self->_privacyFacade, 0);
  objc_storeStrong((id *)&self->_sharedSettingsStore, 0);
  objc_storeStrong((id *)&self->_updateManager, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_remoteNotifier, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
