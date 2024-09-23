@implementation AccountStoreFMF

- (void)dealloc
{
  objc_super v3;

  -[AccountStoreFMF setCurrentActiveAccount:](self, "setCurrentActiveAccount:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AccountStoreFMF;
  -[AccountStoreFMF dealloc](&v3, "dealloc");
}

- (void)loadExistingAccounts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  int v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AccountStoreFMF accountsList](self, "accountsList"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[AccountStoreFMF setAccountsList:](self, "setAccountsList:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AppleAccountManager sharedInstance](AppleAccountManager, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fmfACAccount"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AccountStoreFMF _accountFromACAccount:](self, "_accountFromACAccount:", v6));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[AccountStoreFMF accountsList](self, "accountsList"));
      objc_msgSend(v8, "addObject:", v7);

      -[AccountStoreFMF setCurrentActiveAccount:](self, "setCurrentActiveAccount:", v7);
    }
    v9 = sub_10001C4E8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[AccountStoreFMF accountsList](self, "accountsList"));
      v15 = 134217984;
      v16 = objc_msgSend(v11, "count");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Found %ld FMF accounts in store", (uint8_t *)&v15, 0xCu);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AccountStoreFMF currentActiveAccount](self, "currentActiveAccount"));
    v13 = v12 == 0;

    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[AccountStoreFMF currentActiveAccount](self, "currentActiveAccount"));
      -[AccountStoreFMF _tokensForAccount:](self, "_tokensForAccount:", v14);

    }
  }
}

- (id)accounts
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  _QWORD v8[5];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AccountStoreFMF accountsList](self, "accountsList"));
  v4 = objc_msgSend(v3, "copy");

  if (-[AccountStoreFMF refreshAuthTokens](self, "refreshAuthTokens"))
  {
    v5 = sub_10001C4E8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Looks like some auth tokens were not read successfully the last time. Re-reading them...", buf, 2u);
    }

    -[AccountStoreFMF setRefreshAuthTokens:](self, "setRefreshAuthTokens:", 0);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001454C;
    v8[3] = &unk_1000552A0;
    v8[4] = self;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);
  }
  return v4;
}

- (void)addAccount:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccountStoreFMF accountsList](self, "accountsList"));
  objc_msgSend(v5, "addObject:", v4);

  -[AccountStoreFMF saveChanges](self, "saveChanges");
}

- (void)removeAccount:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccountStoreFMF accountsList](self, "accountsList"));
  objc_msgSend(v5, "removeObject:", v4);

  -[AccountStoreFMF saveChanges](self, "saveChanges");
}

- (void)_tokensForAccount:(id)a3
{
  id v4;

  v4 = a3;
  -[AccountStoreFMF _fetchAppAuthToken:](self, "_fetchAppAuthToken:", v4);
  -[AccountStoreFMF _fetchInternalAuthToken:](self, "_fetchInternalAuthToken:", v4);

}

- (void)_fetchAppAuthToken:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v4 = a3;
  v5 = objc_alloc_init((Class)ACAccountStore);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AppleAccountManager sharedInstance](AppleAccountManager, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fmfACAccount"));

  v18 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "credentialForAccount:error:", v7, &v18));
  v9 = v18;
  if (!v8)
  {
    v10 = sub_10001C4E8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100033E9C((uint64_t)v7, v11);

  }
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "credentialItemForKey:", ACFindMyFriendsAppTokenKey));
  v13 = (void *)v12;
  if (v9 || !v12)
  {
    v14 = sub_10001C4E8();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "username"));
      v17 = objc_msgSend(v4, "appAuthTokenStatus");
      *(_DWORD *)buf = 138412802;
      v20 = v16;
      v21 = 2048;
      v22 = v17;
      v23 = 2112;
      v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Could not retrieve app token for FMF account %@(%ld). Error : %@", buf, 0x20u);

    }
    objc_msgSend(v4, "setAppAuthTokenStatus:", 1);
    -[AccountStoreFMF setRefreshAuthTokens:](self, "setRefreshAuthTokens:", 1);
  }
  else
  {
    objc_msgSend(v4, "setAppAuthToken:", v12);
    objc_msgSend(v4, "setAppAuthTokenStatus:", 0);
  }

}

- (void)_fetchInternalAuthToken:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  v4 = a3;
  v5 = objc_alloc_init((Class)ACAccountStore);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AppleAccountManager sharedInstance](AppleAccountManager, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fmfACAccount"));

  v16 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "credentialForAccount:error:", v7, &v16));
  v9 = v16;
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "credentialItemForKey:", ACFindMyFriendsTokenKey));
  v11 = (void *)v10;
  if (v9 || !v10)
  {
    v12 = sub_10001C4E8();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "username"));
      v15 = objc_msgSend(v4, "appAuthTokenStatus");
      *(_DWORD *)buf = 138412802;
      v18 = v14;
      v19 = 2048;
      v20 = v15;
      v21 = 2112;
      v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Could not retrieve internal token for FMF account %@ (%ld) Error : %@", buf, 0x20u);

    }
    objc_msgSend(v4, "setInternalAuthTokenStatus:", 2);
    -[AccountStoreFMF setRefreshAuthTokens:](self, "setRefreshAuthTokens:", 1);
  }
  else
  {
    objc_msgSend(v4, "setInternalAuthToken:", v10);
    objc_msgSend(v4, "setInternalAuthTokenStatus:", 0);
  }

}

- (id)_accountFromACAccount:(id)a3
{
  id v3;
  FMFAccount *v4;
  void *v5;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(FMFAccount);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentAccount"));

    -[FMFAccount applyPropertiesFromACAccount:includingTokens:](v4, "applyPropertiesFromACAccount:includingTokens:", v5, 0);
    -[Account setIsActive:](v4, "setIsActive:", 1);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSMutableArray)accountsList
{
  return self->_accountsList;
}

- (void)setAccountsList:(id)a3
{
  objc_storeStrong((id *)&self->_accountsList, a3);
}

- (BOOL)refreshAuthTokens
{
  return self->_refreshAuthTokens;
}

- (void)setRefreshAuthTokens:(BOOL)a3
{
  self->_refreshAuthTokens = a3;
}

- (FMFAccount)currentActiveAccount
{
  return self->_currentActiveAccount;
}

- (void)setCurrentActiveAccount:(id)a3
{
  objc_storeStrong((id *)&self->_currentActiveAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentActiveAccount, 0);
  objc_storeStrong((id *)&self->_accountsList, 0);
}

@end
