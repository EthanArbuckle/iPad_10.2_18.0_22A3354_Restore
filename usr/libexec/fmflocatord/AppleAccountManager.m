@implementation AppleAccountManager

+ (id)sharedInstance
{
  void *v2;
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  if (qword_100069770 != -1)
    dispatch_once(&qword_100069770, &stru_100055EC0);
  v2 = (void *)qword_100069768;
  if (!qword_100069768)
  {
    v3 = sub_10001C4E8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "*** The AppleAccountManager singleton seems to have been deallocated. This is unexpected & damaging.", v6, 2u);
    }

    v2 = (void *)qword_100069768;
  }
  return v2;
}

- (AppleAccountManager)init
{
  id v3;
  NSObject *v4;

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100034FE4(v4);

  return 0;
}

- (id)initSingleton
{
  AppleAccountManager *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AppleAccountManager;
  v2 = -[AppleAccountManager init](&v5, "init");
  if (v2)
  {
    objc_storeStrong((id *)&qword_100069768, v2);
    v3 = objc_alloc_init((Class)ACAccountStore);
    -[AppleAccountManager setAccountStore:](v2, "setAccountStore:", v3);

  }
  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v6;

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100034C70(self, v4);

  v5 = (void *)qword_100069768;
  qword_100069768 = 0;

  v6.receiver = self;
  v6.super_class = (Class)AppleAccountManager;
  -[AppleAccountManager dealloc](&v6, "dealloc");
}

- (void)syncFMFAccountInfo
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v19;
  FMFAccount *v20;
  void *v21;
  uint8_t v22[16];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AppleAccountManager iCloudACAccount](self, "iCloudACAccount"));
  v3 = v2;
  if (v2)
  {
    if ((objc_msgSend(v2, "isProvisionedForDataclass:", CFSTR("com.apple.Dataclass.ShareLocation")) & 1) != 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[AccountManager sharedInstance](AccountManager, "sharedInstance"));
      v6 = objc_msgSend(v4, "allAccountsOfType:", objc_opt_class(FMFAccount, v5));
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

      if (objc_msgSend(v7, "count"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
        v9 = v8;
        if (v8)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dsid"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aa_personID"));
          v12 = objc_msgSend(v10, "isEqualToString:", v11);

          if ((v12 & 1) != 0)
          {
LABEL_15:
            v20 = objc_alloc_init(FMFAccount);
            -[FMFAccount copyInfoFromAccount:](v20, "copyInfoFromAccount:", v9);
            -[FMFAccount applyPropertiesFromACAccount:includingTokens:](v20, "applyPropertiesFromACAccount:includingTokens:", v3, 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[AccountManager sharedInstance](AccountManager, "sharedInstance"));
            objc_msgSend(v21, "addAccount:", v20);

            goto LABEL_16;
          }
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[StartupRegisterManager sharedInstance](StartupRegisterManager, "sharedInstance"));
          objc_msgSend(v13, "eventDidOccur:", 1);

        }
      }
      else
      {
        v9 = 0;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[StartupRegisterManager sharedInstance](StartupRegisterManager, "sharedInstance"));
      objc_msgSend(v19, "eventDidOccur:", 0);

      goto LABEL_15;
    }
    v18 = sub_10001C4E8();
    v16 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "ShareLocation is not provisioned in the iCloud account", v22, 2u);
    }
  }
  else
  {
    v14 = sub_10001C4E8();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Deleting FMF acount", buf, 2u);
    }

    v16 = objc_claimAutoreleasedReturnValue(+[AccountManager sharedInstance](AccountManager, "sharedInstance"));
    -[NSObject deactivateAllAccountsOfType:](v16, "deactivateAllAccountsOfType:", objc_opt_class(FMFAccount, v17));
  }

LABEL_16:
}

- (id)iCloudACAccount
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AppleAccountManager accountStore](self, "accountStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "aa_primaryAppleAccount"));

  return v3;
}

- (id)fmfACAccount
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AppleAccountManager iCloudACAccount](self, "iCloudACAccount"));
  if (objc_msgSend(v3, "isProvisionedForDataclass:", CFSTR("com.apple.Dataclass.ShareLocation")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppleAccountManager iCloudACAccount](self, "iCloudACAccount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_fmfAccount"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)iCloudAccountChanged:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[16];

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "iCloudAccountChanged notification - looking for changes in fmf accounts", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AppleAccountManager sharedInstance](AppleAccountManager, "sharedInstance"));
  v6 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F78C;
  block[3] = &unk_100055230;
  v9 = v5;
  v7 = v5;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)requestAuthenticationShouldForce:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AppleAccountManager iCloudACAccount](self, "iCloudACAccount"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AppleAccountManager accountStore](self, "accountStore"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001F85C;
    v9[3] = &unk_100055EE8;
    v9[4] = self;
    v10 = v6;
    objc_msgSend(v8, "renewCredentialsForAccount:force:reason:completion:", v7, v4, 0, v9);

  }
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
