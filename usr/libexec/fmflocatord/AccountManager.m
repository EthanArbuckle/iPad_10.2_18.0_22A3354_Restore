@implementation AccountManager

- (void)dealloc
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = sub_10001C4E8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100034C70(self, v5);

  v6 = (void *)qword_100069758;
  qword_100069758 = 0;

  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("AccountStoreUpdatedAccountNotification"), 0);
  v7.receiver = self;
  v7.super_class = (Class)AccountManager;
  -[AccountManager dealloc](&v7, "dealloc");
}

+ (id)sharedInstance
{
  void *v2;
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  if (qword_100069760 != -1)
    dispatch_once(&qword_100069760, &stru_100055DD8);
  v2 = (void *)qword_100069758;
  if (!qword_100069758)
  {
    v3 = sub_10001C4E8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "*** The AccountManager singleton seems to have been deallocated. This is unexpected & damaging.", v6, 2u);
    }

    v2 = (void *)qword_100069758;
  }
  return v2;
}

- (AccountManager)init
{
  id v3;
  NSObject *v4;

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100034E24();

  return 0;
}

- (id)initSingleton
{
  AccountManager *v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  AccountStoreFMF *v8;
  void *v9;
  objc_super v11;
  void *v12;
  AccountStoreFMF *v13;

  v11.receiver = self;
  v11.super_class = (Class)AccountManager;
  v2 = -[AccountManager init](&v11, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v5 = (objc_class *)objc_opt_class(FMFAccount, v4);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v12 = v7;
    v8 = objc_alloc_init(AccountStoreFMF);
    v13 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    -[AccountManager setAccountToStoreMapping:](v2, "setAccountToStoreMapping:", v9);

    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "storeUpdatedAnAccount:", CFSTR("AccountStoreUpdatedAccountNotification"), 0);
    objc_storeStrong((id *)&qword_100069758, v2);

  }
  return v2;
}

- (void)loadExistingAccounts
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AccountManager accountToStoreMapping](self, "accountToStoreMapping"));
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &stru_100055DF8);

}

- (NSArray)accounts
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AccountManager accountToStoreMapping](self, "accountToStoreMapping"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D998;
  v7[3] = &unk_100055350;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  return (NSArray *)v5;
}

- (void)addAccount:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  AccountManager *v20;
  const __CFString *v21;
  void *v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccountManager accountToStoreMapping](self, "accountToStoreMapping"));
  v7 = (objc_class *)objc_opt_class(v4, v6);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueId"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AccountManager _existingAccountInStore:withUniqueId:](self, "_existingAccountInStore:withUniqueId:", v10, v11));

  objc_msgSend(v4, "setIsActive:", 1);
  if ((objc_msgSend(v4, "supportsMultipleActiveAccounts") & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accounts"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001DC14;
    v18[3] = &unk_100055328;
    v19 = v12;
    v20 = self;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v18);

  }
  if (!v12)
    goto LABEL_8;
  if ((objc_msgSend(v12, "isActive") & 1) == 0)
  {
    objc_msgSend(v10, "removeAccount:", v12);
LABEL_8:
    objc_msgSend(v10, "addAccount:", v4);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100055E18);
    goto LABEL_9;
  }
  v14 = objc_msgSend(v12, "hasSameRelevantInfoAs:", v4);
  objc_msgSend(v12, "copyInfoFromAccount:", v4);
  objc_msgSend(v10, "saveChanges");
  if ((v14 & 1) == 0)
  {
    v21 = CFSTR("account");
    v22 = v12;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001DCD8;
    v16[3] = &unk_100055230;
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v15 = v17;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);

  }
LABEL_9:

}

- (void)deactivateAccount:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  _QWORD block[4];
  NSObject *v17;
  uint8_t buf[4];
  id v19;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccountManager accountToStoreMapping](self, "accountToStoreMapping"));
    v7 = (objc_class *)objc_opt_class(v4, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v9));

    v11 = sub_10001C4E8();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Deactivating account %@", buf, 0xCu);
      }

      objc_msgSend(v4, "setIsActive:", 0);
      objc_msgSend(v10, "saveChanges");
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001DF00;
      block[3] = &unk_100055230;
      v17 = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      v13 = v17;
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = (id)objc_opt_class(v4, v14);
      v15 = v19;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Tried to deactivate an account of unknown type : %@", buf, 0xCu);

    }
  }

}

- (void)deactivateAccountOfType:(Class)a3 havingUniqueId:(id)a4
{
  id v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  _QWORD block[4];
  NSObject *v20;
  uint8_t buf[4];
  Class v22;
  __int16 v23;
  id v24;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AccountManager accountToStoreMapping](self, "accountToStoreMapping"));
  v8 = NSStringFromClass(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v9));

  if (!v10)
  {
    v15 = sub_10001C4E8();
    v13 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)buf = 138412290;
    v22 = a3;
    v16 = "Tried to deactivate an account of unknown type : %@";
    v17 = v13;
    v18 = 12;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
    goto LABEL_12;
  }
  v11 = sub_10001C4E8();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (!v6)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v16 = "Cannot find account to deactivate since uniqueId to search is nil";
    v17 = v13;
    v18 = 2;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v22 = a3;
    v23 = 2112;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Deactivating accounts of type %@ with unique id %@", buf, 0x16u);
  }

  v14 = objc_claimAutoreleasedReturnValue(-[AccountManager _existingAccountInStore:withUniqueId:](self, "_existingAccountInStore:withUniqueId:", v10, v6));
  v13 = v14;
  if (v14)
  {
    -[NSObject setIsActive:](v14, "setIsActive:", 0);
    objc_msgSend(v10, "saveChanges");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001E1D0;
    block[3] = &unk_100055230;
    v13 = v13;
    v20 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
LABEL_12:

}

- (void)deactivateAllAccountsOfType:(Class)a3
{
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  Class v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AccountManager accountToStoreMapping](self, "accountToStoreMapping"));
  v5 = NSStringFromClass(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v6));

  v8 = sub_10001C4E8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Deactivating all accounts of type %@", (uint8_t *)&v12, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accounts"));
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", &stru_100055E58);

    objc_msgSend(v7, "saveChanges");
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Tried to deactivate an account of unknown type : %@", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (void)removeInactiveAccount:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  int v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccountManager accountToStoreMapping](self, "accountToStoreMapping"));
  v7 = (objc_class *)objc_opt_class(v4, v6);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v9));

  if (objc_msgSend(v4, "isActive"))
  {
    v11 = sub_10001C4E8();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueId"));
      v16 = 138412290;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Trying to remove an active account : %@", (uint8_t *)&v16, 0xCu);

    }
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accounts"));
    v15 = objc_msgSend(v14, "containsObject:", v4);

    if (v15)
      objc_msgSend(v10, "removeAccount:", v4);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100055E78);
    objc_msgSend(v10, "saveChanges");
  }

}

- (id)activeAccountsOfType:(Class)a3
{
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  Class v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AccountManager accountToStoreMapping](self, "accountToStoreMapping"));
  v5 = NSStringFromClass(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v6));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accounts"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001E85C;
    v13[3] = &unk_1000552A0;
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v14 = v9;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

  }
  else
  {
    v10 = sub_10001C4E8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Tried to fetch accounts of unknown type : %@", buf, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (id)allAccountsOfType:(Class)a3
{
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  int v13;
  Class v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AccountManager accountToStoreMapping](self, "accountToStoreMapping"));
  v5 = NSStringFromClass(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v6));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accounts"));
    v9 = objc_msgSend(v8, "copy");

  }
  else
  {
    v10 = sub_10001C4E8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Tried to fetch accounts of unknown type : %@", (uint8_t *)&v13, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (id)accountOfType:(Class)a3 withUniqueId:(id)a4
{
  id v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AccountManager accountToStoreMapping](self, "accountToStoreMapping"));
  v8 = NSStringFromClass(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AccountManager _existingAccountInStore:withUniqueId:](self, "_existingAccountInStore:withUniqueId:", v10, v6));
  return v11;
}

- (id)_existingAccountInStore:(id)a3 withUniqueId:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accounts"));
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_10001EB58;
  v18 = sub_10001EB68;
  v19 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001EB70;
  v11[3] = &unk_100055EA0;
  v8 = v6;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)saveUpdatesToAccount:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  const __CFString *v14;
  id v15;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccountManager accountToStoreMapping](self, "accountToStoreMapping"));
    v7 = (objc_class *)objc_opt_class(v4, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v9));

    objc_msgSend(v10, "saveChanges");
    v14 = CFSTR("account");
    v15 = v4;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001ED30;
    v12[3] = &unk_100055230;
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v11 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);

  }
}

- (void)providerUpdatedAccount:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccountManager accountToStoreMapping](self, "accountToStoreMapping"));
  v7 = (objc_class *)objc_opt_class(v4, v6);

  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v9));

  objc_msgSend(v10, "saveChanges");
}

- (void)storeUpdatedAnAccount:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("account")));

  if (v4)
  {
    v8 = CFSTR("account");
    v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001EF2C;
    v6[3] = &unk_100055230;
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
    v5 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

  }
}

- (NSDictionary)accountToStoreMapping
{
  return self->_accountToStoreMapping;
}

- (void)setAccountToStoreMapping:(id)a3
{
  objc_storeStrong((id *)&self->_accountToStoreMapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountToStoreMapping, 0);
}

@end
