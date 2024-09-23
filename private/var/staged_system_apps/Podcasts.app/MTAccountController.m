@implementation MTAccountController

- (id)_activeAccountBlocking
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](ACAccountStore, "ams_sharedAccountStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_activeiTunesAccount"));

  return v3;
}

- (void)setActiveAccount:(id)a3
{
  id v4;
  NSObject *accountQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  MTAccountController *v9;

  v4 = a3;
  accountQueue = self->_accountQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B5F0;
  v7[3] = &unk_1004A6640;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(accountQueue, v7);

}

- (void)_updateActiveAccount
{
  void *v3;
  void *v4;
  NSObject *accountQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAccountController activeDsid](self, "activeDsid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringValue"));

  accountQueue = self->_accountQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012E8C;
  v7[3] = &unk_1004A6640;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accountQueue, v7);

}

- (MTAccountController)init
{
  MTAccountController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accountQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *callbackQueue;
  NSMutableSet *v7;
  NSMutableSet *inFlightAuthRequests;
  NSMutableSet *v9;
  NSMutableSet *declinedAuthRequests;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTAccountController;
  v2 = -[MTAccountController init](&v13, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.podcasts.MTAccountController.accountQueue", 0);
    accountQueue = v2->_accountQueue;
    v2->_accountQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.podcasts.MTAccountController.callbackQueue", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v5;

    -[MTAccountController _updateActiveAccount](v2, "_updateActiveAccount");
    v7 = objc_opt_new(NSMutableSet);
    inFlightAuthRequests = v2->_inFlightAuthRequests;
    v2->_inFlightAuthRequests = v7;

    v9 = objc_opt_new(NSMutableSet);
    declinedAuthRequests = v2->_declinedAuthRequests;
    v2->_declinedAuthRequests = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, "didChangeStoreAccount:", ACDAccountStoreDidChangeNotification, 0);

  }
  return v2;
}

- (BOOL)isUserLoggedIn
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTAccountController activeAccount](self, "activeAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_DSID"));
  v4 = v3 != 0;

  return v4;
}

- (id)activeDsid
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTAccountController activeAccount](self, "activeAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_DSID"));

  return v3;
}

- (id)activeAccount
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
  v9 = sub_10004674C;
  v10 = sub_100046A1C;
  v11 = 0;
  accountQueue = self->_accountQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000477D0;
  v5[3] = &unk_1004A6F38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accountQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)hasFetchedInitialAccount
{
  return self->_hasFetchedInitialAccount;
}

- (void)setHasFetchedInitialAccount:(BOOL)a3
{
  self->_hasFetchedInitialAccount = a3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MTAccountController;
  -[MTAccountController dealloc](&v4, "dealloc");
}

- (id)primaryUser
{
  return -[MTAccountController _activeAccount](self, "_activeAccount");
}

- (BOOL)isPrimaryUserActiveAccount
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount ams_DSID](self->__activeAccount, "ams_DSID"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAccountController activeDsid](self, "activeDsid"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount ams_DSID](self->__activeAccount, "ams_DSID"));
    v6 = objc_msgSend(v4, "isEqualToNumber:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)fetchActiveAccountWithCompletion:(id)a3
{
  id v4;
  NSObject *accountQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accountQueue = self->_accountQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C1C58;
  v7[3] = &unk_1004A63C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accountQueue, v7);

}

- (id)activeStorefront
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTAccountController activeAccount](self, "activeAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_storefront"));

  return v3;
}

- (id)activeEmail
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTAccountController activeAccount](self, "activeAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "username"));

  return v3;
}

- (id)activeFullName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTAccountController activeAccount](self, "activeAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_fullName"));

  return v3;
}

- (BOOL)activeAccountIsManagedAppleID
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTAccountController activeAccount](self, "activeAccount"));
  v3 = objc_msgSend(v2, "ams_isManagedAppleID");

  return v3;
}

- (void)didChangeStoreAccount:(id)a3
{
  id v4;

  if (+[MTAccountController iTunesAccountDidChangeForACAccountNotification:](MTAccountController, "iTunesAccountDidChangeForACAccountNotification:", a3))
  {
    -[MTAccountController _updateActiveAccount](self, "_updateActiveAccount");
    if (-[MTAccountController isUserLoggedIn](self, "isUserLoggedIn"))
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v4, "postNotificationName:object:", CFSTR("MTShouldCheckShowWelcomeNotification"), 0);

    }
    else
    {
      dispatch_async((dispatch_queue_t)self->_callbackQueue, &stru_1004A9C18);
    }
  }
}

+ (BOOL)iTunesAccountDidChangeForACAccountNotification:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5 = ACAccountTypeIdentifierKey;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", ACAccountTypeIdentifierKey));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v5));
    v9 = objc_msgSend(v8, "isEqualToString:", ACAccountTypeIdentifieriTunesStore);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

+ (void)openAccountsPanel
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", UIApplicationOpenSettingsURLString));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v2, "openURL:options:completionHandler:", v3, &__NSDictionary0__struct, 0);

}

- (void)promptAccountAuthenticationWithDebugReason:(id)a3 forced:(BOOL)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  BOOL v12;
  uint8_t buf[4];
  id v14;

  v6 = a3;
  v7 = _MTLogCategoryDefault(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Prompting for sign-in with reason %@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C211C;
  block[3] = &unk_1004A7698;
  v12 = a4;
  block[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)signOut
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTAccountController activeAccount](self, "activeAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAccountController activeAccount](self, "activeAccount"));
  objc_msgSend(v3, "removeAccount:withCompletionHandler:", v4, &stru_1004A9CA8);

}

- (ACAccount)accountOverride
{
  return self->_accountOverride;
}

- (void)setAccountOverride:(id)a3
{
  objc_storeStrong((id *)&self->_accountOverride, a3);
}

- (NSMutableSet)inFlightAuthRequests
{
  return self->_inFlightAuthRequests;
}

- (void)setInFlightAuthRequests:(id)a3
{
  objc_storeStrong((id *)&self->_inFlightAuthRequests, a3);
}

- (NSMutableSet)declinedAuthRequests
{
  return self->_declinedAuthRequests;
}

- (void)setDeclinedAuthRequests:(id)a3
{
  objc_storeStrong((id *)&self->_declinedAuthRequests, a3);
}

- (ACAccount)_activeAccount
{
  return self->__activeAccount;
}

- (void)set_activeAccount:(id)a3
{
  objc_storeStrong((id *)&self->__activeAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeAccount, 0);
  objc_storeStrong((id *)&self->_declinedAuthRequests, 0);
  objc_storeStrong((id *)&self->_inFlightAuthRequests, 0);
  objc_storeStrong((id *)&self->_accountOverride, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_accountQueue, 0);
}

@end
