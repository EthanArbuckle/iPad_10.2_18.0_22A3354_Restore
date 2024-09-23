@implementation MSDCloudManager

- (MSDCloudManager)init
{
  MSDCloudManager *v2;
  MSDCloudManager *v3;
  CKAccountInfo *accountInfo;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *serialQueue;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MSDCloudManager;
  v2 = -[MSDCloudManager init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    accountInfo = v2->_accountInfo;
    v2->_accountInfo = 0;

    v3->_subscriptionFailure = 0;
    v3->_isAccountCheckInProgress = 0;
    v3->_accountCheckLock._os_unfair_lock_opaque = 0;
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.mediasetupd.CloudManager", v6);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v3, "_handleCKAccountStatusChanged:", CKAccountChangedNotification, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, "_handleCKAccountStatusChanged:", CKIdentityUpdateNotification, 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CKAccountChangedNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CKIdentityUpdateNotification, 0);

  v5.receiver = self;
  v5.super_class = (Class)MSDCloudManager;
  -[MSDCloudManager dealloc](&v5, "dealloc");
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E5C0;
  block[3] = &unk_1000488C0;
  block[4] = a1;
  if (qword_100052780 != -1)
    dispatch_once(&qword_100052780, block);
  return (id)qword_100052778;
}

- (void)addSubscriptionForDatabase:(id)a3
{
  id v4;
  id v5;
  const __CFString *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id from;
  id location;

  v4 = a3;
  v5 = objc_msgSend(v4, "databaseScope");
  if (v5 == (id)2)
  {
    v6 = CFSTR("com.apple.msd.privateDatabaseSubscription");
    goto LABEL_5;
  }
  if (v5 == (id)3)
  {
    v6 = CFSTR("com.apple.msd.sharedDatabaseSubscription");
LABEL_5:
    objc_initWeak(&location, self);
    objc_initWeak(&from, v4);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001E760;
    v11[3] = &unk_100049DB0;
    objc_copyWeak(&v12, &location);
    objc_copyWeak(&v13, &from);
    objc_msgSend(v4, "addSubscriptionForDatabaseWithIdentifier:completion:", v6, v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    goto LABEL_11;
  }
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_10001FACC();

  v9 = sub_10002E034();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_10001FA44(v4, v10);

LABEL_11:
}

- (void)isCloudKitAccessAvailable:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  NSObject *v8;
  uint8_t buf[4];
  const char *v10;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001EBD8;
    v7[3] = &unk_100049DD8;
    v8 = v3;
    objc_msgSend(v4, "accountInfoWithCompletionHandler:", v7);

    v5 = v8;
  }
  else
  {
    v6 = sub_10002E034();
    v5 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[MSDCloudManager isCloudKitAccessAvailable:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s, nil completion handler", buf, 0xCu);
    }
  }

}

+ (NSString)pushTopic
{
  return (NSString *)objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingString:", CFSTR("com.apple.mediasetupd"));
}

+ (void)handlePushNotification:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  Block_layout *v20;
  id v21;
  id v22;
  int v23;
  void *v24;

  v3 = a3;
  v4 = sub_10002E034();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling a CloudKit push notification", (uint8_t *)&v23, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CKNotification notificationFromRemoteNotificationDictionary:](CKNotification, "notificationFromRemoteNotificationDictionary:", v6));

  if (v7)
  {
    v8 = objc_opt_class(CKDatabaseNotification);
    v9 = v7;
    if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    v12 = sub_10002E034();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = v13;
    if (!v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10001FBDC();
      goto LABEL_22;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = CKDatabaseScopeString(-[NSObject databaseScope](v11, "databaseScope"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v23 = 138412290;
      v24 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "A CloudKit database changed in DatabaseScope = %@", (uint8_t *)&v23, 0xCu);

    }
    v17 = -[NSObject databaseScope](v11, "databaseScope");
    if (v17 == (id)1)
    {
      v22 = sub_10002E034();
      v14 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10001FC08();
      goto LABEL_22;
    }
    if (v17 == (id)3)
    {
      v14 = objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sharedCloudDatabase](v14, "sharedCloudDatabase"));
      v19 = v18;
      v20 = &stru_100049E18;
      goto LABEL_21;
    }
    if (v17 == (id)2)
    {
      v14 = objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject privateCloudDatabase](v14, "privateCloudDatabase"));
      v19 = v18;
      v20 = &stru_100049DF8;
LABEL_21:
      objc_msgSend(v18, "refreshDatabase:completion:", 0, v20);

LABEL_22:
    }
  }
  else
  {
    v21 = sub_10002E034();
    v11 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10001FB5C(v3, v11);
  }

}

+ (BOOL)shouldEnablePushTopic
{
  return +[MSDeviceInfo deviceCanManageMultiUser](MSDeviceInfo, "deviceCanManageMultiUser");
}

- (void)_checkAccountStatus
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001F168;
  v3[3] = &unk_100049E68;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "accountInfoWithCompletionHandler:", v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_handleAccountStatusUnsupported
{
  void *v2;
  id v3;

  -[MSDCloudManager setAccountInfo:](self, "setAccountInfo:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  objc_msgSend(v2, "setObject:forDefault:", &__kCFBooleanFalse, CFSTR("CKAccountSupportsManatee"));

  v3 = (id)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  objc_msgSend(v3, "clearPrivateAndSharedLocalData");

}

- (void)_handleDeviceSupportsEncryption:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  id v13;
  void *v14;
  __int16 v15;
  __int16 v16;

  v4 = a3;
  if (-[CKAccountInfo isEqual:](self->_accountInfo, "isEqual:", v4))
  {
    v5 = sub_10002E034();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 0;
      v7 = "AccountInfo is the same, skipping update";
      v8 = (uint8_t *)&v16;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else if ((objc_msgSend(v4, "hasValidCredentials") & 1) != 0)
  {
    -[MSDCloudManager setAccountInfo:](self, "setAccountInfo:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForDefault:", CFSTR("CKAccountSupportsManatee")));
    v11 = objc_msgSend(v10, "BOOLValue");

    if (!v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
      objc_msgSend(v14, "setObject:forDefault:", &__kCFBooleanTrue, CFSTR("CKAccountSupportsManatee"));

      v6 = objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](MSDDataController, "sharedInstance"));
      -[NSObject refreshDataForReason:completion:](v6, "refreshDataForReason:completion:", 6, &stru_100049E88);
      goto LABEL_12;
    }
    v12 = sub_10002E034();
    v6 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 0;
      v7 = "Manatee enabled on device, skipping data refresh";
      v8 = (uint8_t *)&v15;
      goto LABEL_8;
    }
  }
  else
  {
    v13 = sub_10002E034();
    v6 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10001FDB8();
  }
LABEL_12:

}

- (void)_handleCKAccountStatusChanged:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *serialQueue;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  void *v12;

  v4 = a3;
  v5 = sub_10002E034();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received notification %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F870;
  block[3] = &unk_1000489C0;
  objc_copyWeak(&v10, (id *)buf);
  dispatch_async(serialQueue, block);
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);

}

- (void)_withAccountCheckLock:(id)a3
{
  os_unfair_lock_s *p_accountCheckLock;
  void (**v4)(_QWORD);

  p_accountCheckLock = &self->_accountCheckLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_accountCheckLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_accountCheckLock);
}

- (CKAccountInfo)accountInfo
{
  return self->_accountInfo;
}

- (void)setAccountInfo:(id)a3
{
  objc_storeStrong((id *)&self->_accountInfo, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_accountInfo, 0);
}

@end
