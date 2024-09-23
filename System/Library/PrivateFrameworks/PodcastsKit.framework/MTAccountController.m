@implementation MTAccountController

- (MTAccountController)init
{
  MTAccountController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accountQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *callbackQueue;
  uint64_t v7;
  NSMutableSet *inFlightAuthRequests;
  uint64_t v9;
  NSMutableSet *declinedAuthRequests;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTAccountController;
  v2 = -[MTAccountController init](&v13, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.podcasts.MTAccountController.accountQueue", 0);
    accountQueue = v2->_accountQueue;
    v2->_accountQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.podcasts.MTAccountController.callbackQueue", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v5;

    -[MTAccountController _updateActiveAccount](v2, "_updateActiveAccount");
    v7 = objc_opt_new();
    inFlightAuthRequests = v2->_inFlightAuthRequests;
    v2->_inFlightAuthRequests = (NSMutableSet *)v7;

    v9 = objc_opt_new();
    declinedAuthRequests = v2->_declinedAuthRequests;
    v2->_declinedAuthRequests = (NSMutableSet *)v9;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel_didChangeStoreAccount_, *MEMORY[0x24BDB41E0], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MTAccountController;
  -[MTAccountController dealloc](&v4, sel_dealloc);
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
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  accountQueue = self->_accountQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__MTAccountController_activeAccount__block_invoke;
  v5[3] = &unk_24FD62878;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accountQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __36__MTAccountController_activeAccount__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  if (!v2)
    v2 = *(void **)(v1 + 56);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__MTAccountController_setActiveAccount___block_invoke;
  v7[3] = &unk_24FD62EF0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(accountQueue, v7);

}

void __40__MTAccountController_setActiveAccount___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _MTLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_22FB0C000, v2, OS_LOG_TYPE_DEFAULT, "MTAccountController: Setting active account: %@", (uint8_t *)&v4, 0xCu);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 56), *(id *)(a1 + 32));
}

- (BOOL)isPrimaryUserActiveAccount
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[ACAccount ams_DSID](self->__activeAccount, "ams_DSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MTAccountController activeDsid](self, "activeDsid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACAccount ams_DSID](self->__activeAccount, "ams_DSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__MTAccountController_fetchActiveAccountWithCompletion___block_invoke;
  v7[3] = &unk_24FD62F40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accountQueue, v7);

}

void __56__MTAccountController_fetchActiveAccountWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasFetchedInitialAccount") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_updateActiveAccount");
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__MTAccountController_fetchActiveAccountWithCompletion___block_invoke_2;
    block[3] = &unk_24FD62F18;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __56__MTAccountController_fetchActiveAccountWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)activeDsid
{
  void *v2;
  void *v3;

  -[MTAccountController activeAccount](self, "activeAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_DSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)activeStorefront
{
  void *v2;
  void *v3;

  -[MTAccountController activeAccount](self, "activeAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_storefront");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)activeEmail
{
  void *v2;
  void *v3;

  -[MTAccountController activeAccount](self, "activeAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)activeFullName
{
  void *v2;
  void *v3;

  -[MTAccountController activeAccount](self, "activeAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_fullName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isUserLoggedIn
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MTAccountController activeAccount](self, "activeAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_DSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)activeAccountIsManagedAppleID
{
  void *v2;
  char v3;

  -[MTAccountController activeAccount](self, "activeAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "postNotificationName:object:", CFSTR("MTShouldCheckShowWelcomeNotification"), 0);

    }
  }
}

- (id)_activeAccountBlocking
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiTunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateActiveAccount
{
  void *v3;
  void *v4;
  NSObject *accountQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  -[MTAccountController activeDsid](self, "activeDsid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  accountQueue = self->_accountQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__MTAccountController__updateActiveAccount__block_invoke;
  v7[3] = &unk_24FD62EF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accountQueue, v7);

}

void __43__MTAccountController__updateActiveAccount__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint8_t v7[16];

  _MTLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_22FB0C000, v2, OS_LOG_TYPE_DEFAULT, "MTAccountController: updating active account", v7, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_activeAccountBlocking");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_DSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 40);
  if (v6 | v5 && (objc_msgSend((id)v6, "isEqualToString:", v5) & 1) == 0)
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_8);
  objc_msgSend(*(id *)(a1 + 32), "setActiveAccount:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setHasFetchedInitialAccount:", 1);

}

void __43__MTAccountController__updateActiveAccount__block_invoke_17()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("AccountDSIDChangedNotification"), 0);

}

+ (BOOL)iTunesAccountDidChangeForACAccountNotification:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDB40B8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDB40B8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDB4180]);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)hasFetchedInitialAccount
{
  return self->_hasFetchedInitialAccount;
}

- (void)setHasFetchedInitialAccount:(BOOL)a3
{
  self->_hasFetchedInitialAccount = a3;
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
