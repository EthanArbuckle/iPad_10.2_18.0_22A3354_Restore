@implementation ServiceProviderMgr

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v6;

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100033910(self, v4);

  v5 = (void *)qword_100069588;
  qword_100069588 = 0;

  v6.receiver = self;
  v6.super_class = (Class)ServiceProviderMgr;
  -[ServiceProviderMgr dealloc](&v6, "dealloc");
}

+ (id)sharedInstance
{
  void *v2;
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  if (qword_100069590 != -1)
    dispatch_once(&qword_100069590, &stru_100055278);
  v2 = (void *)qword_100069588;
  if (!qword_100069588)
  {
    v3 = sub_10001C4E8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "*** The ServiceProviderMgr singleton seems to have been deallocated. This is unexpected & damaging.", v6, 2u);
    }

    v2 = (void *)qword_100069588;
  }
  return v2;
}

- (ServiceProviderMgr)init
{
  id v3;
  NSObject *v4;

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_1000339DC(v4);

  return 0;
}

- (id)initSingleton
{
  uint64_t v2;
  ServiceProviderMgr *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSDictionary *accountTypeToServiceProviderType;
  uint64_t v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSDictionary *v16;
  void *v17;
  objc_super v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;

  v19.receiver = self;
  v19.super_class = (Class)ServiceProviderMgr;
  v3 = -[ServiceProviderMgr init](&v19, "init");
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class(FMFAccount, v2);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v22 = v6;
    v23 = objc_opt_class(FMFServiceProvider, v7);
    v8 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    accountTypeToServiceProviderType = v3->_accountTypeToServiceProviderType;
    v3->_accountTypeToServiceProviderType = (NSDictionary *)v8;

    if (+[FMFGainsboroughServiceProvider isSimulationActive](FMFGainsboroughServiceProvider, "isSimulationActive"))
    {
      v11 = (objc_class *)objc_opt_class(FMFAccount, v10);
      v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v20 = v13;
      v21 = objc_opt_class(FMFGainsboroughServiceProvider, v14);
      v15 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
      v16 = v3->_accountTypeToServiceProviderType;
      v3->_accountTypeToServiceProviderType = (NSDictionary *)v15;

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[ServiceProviderMgr setAccountUUIDToServiceProvider:](v3, "setAccountUUIDToServiceProvider:", v17);

    objc_storeStrong((id *)&qword_100069588, v3);
  }
  return v3;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  uint8_t buf[4];
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AccountManager sharedInstance](AccountManager, "sharedInstance"));
  objc_msgSend(v4, "loadExistingAccounts");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AccountManager sharedInstance](AccountManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accounts"));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000A604;
  v12[3] = &unk_1000552A0;
  v12[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);
  -[ServiceProviderMgr startGlobalManagers](self, "startGlobalManagers");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProviderMgr accountUUIDToServiceProvider](self, "accountUUIDToServiceProvider"));
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &stru_1000552E0);

  v8 = sub_10001C4E8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProviderMgr accountUUIDToServiceProvider](self, "accountUUIDToServiceProvider"));
    v11 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 134217984;
    v14 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Total %ld service providers at startup", buf, 0xCu);

  }
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "accountListDidChange", CFSTR("AccountListDidChangeNotification"), 0);

}

- (void)stop
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("AccountListDidChangeNotification"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProviderMgr accountUUIDToServiceProvider](self, "accountUUIDToServiceProvider"));
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &stru_100055300);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProviderMgr accountUUIDToServiceProvider](self, "accountUUIDToServiceProvider"));
  objc_msgSend(v4, "removeAllObjects");

  -[ServiceProviderMgr stopGlobalManagers](self, "stopGlobalManagers");
}

- (void)startGlobalManagers
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AppleAccountManager sharedInstance](AppleAccountManager, "sharedInstance"));
  objc_msgSend(v2, "syncFMFAccountInfo");

  v3 = (id)objc_claimAutoreleasedReturnValue(+[FMFFencesMgr sharedInstance](FMFFencesMgr, "sharedInstance"));
  objc_msgSend(v3, "start");

}

- (void)stopGlobalManagers
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[FMFFencesMgr sharedInstance](FMFFencesMgr, "sharedInstance"));
  objc_msgSend(v2, "stop");

}

- (void)accountListDidChange
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  ServiceProviderMgr *v17;
  uint8_t buf[4];
  id v19;

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Account list changed. Recalculating service providers...", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AccountManager sharedInstance](AccountManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accounts"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProviderMgr accountUUIDToServiceProvider](self, "accountUUIDToServiceProvider"));
  v8 = objc_msgSend(v7, "mutableCopy");

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000AA14;
  v15[3] = &unk_100055328;
  v9 = v8;
  v16 = v9;
  v17 = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v15);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000AC10;
  v14[3] = &unk_100055350;
  v14[4] = self;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v14);
  v10 = sub_10001C4E8();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProviderMgr accountUUIDToServiceProvider](self, "accountUUIDToServiceProvider"));
    v13 = objc_msgSend(v12, "count");
    *(_DWORD *)buf = 134217984;
    v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Total %ld service providers now", buf, 0xCu);

  }
}

- (id)serviceProviderForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProviderMgr accountUUIDToServiceProvider](self, "accountUUIDToServiceProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
  return v7;
}

- (NSDictionary)accountTypeToServiceProviderType
{
  return self->_accountTypeToServiceProviderType;
}

- (NSMutableDictionary)accountUUIDToServiceProvider
{
  return self->_accountUUIDToServiceProvider;
}

- (void)setAccountUUIDToServiceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accountUUIDToServiceProvider, a3);
}

- (id)buddyCompletionObserverToken
{
  return self->_buddyCompletionObserverToken;
}

- (void)setBuddyCompletionObserverToken:(id)a3
{
  objc_storeStrong(&self->_buddyCompletionObserverToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_buddyCompletionObserverToken, 0);
  objc_storeStrong((id *)&self->_accountUUIDToServiceProvider, 0);
  objc_storeStrong((id *)&self->_accountTypeToServiceProviderType, 0);
}

@end
