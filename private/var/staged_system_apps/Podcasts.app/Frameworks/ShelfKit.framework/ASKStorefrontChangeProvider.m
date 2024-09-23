@implementation ASKStorefrontChangeProvider

- (ASKStorefrontChangeProvider)initWithBlock:(id)a3
{
  id v4;
  ASKStorefrontChangeProvider *v5;
  id v6;
  id v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *notifyQueue;
  uint64_t v10;
  ACAccountStore *accountStore;
  NSObject *v12;
  _QWORD block[4];
  ASKStorefrontChangeProvider *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ASKStorefrontChangeProvider;
  v5 = -[ASKStorefrontChangeProvider init](&v16, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = v5->_block;
    v5->_block = v6;

    v8 = dispatch_queue_create("ASKStorefrontChangeProvider", 0);
    notifyQueue = v5->_notifyQueue;
    v5->_notifyQueue = (OS_dispatch_queue *)v8;

    v10 = objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](ACAccountStore, "ams_sharedAccountStore"));
    accountStore = v5->_accountStore;
    v5->_accountStore = (ACAccountStore *)v10;

    v12 = objc_claimAutoreleasedReturnValue(-[ASKStorefrontChangeProvider notifyQueue](v5, "notifyQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __45__ASKStorefrontChangeProvider_initWithBlock___block_invoke;
    block[3] = &unk_3726D0;
    v15 = v5;
    dispatch_async(v12, block);

  }
  return v5;
}

void __45__ASKStorefrontChangeProvider_initWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accountStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_localiTunesAccount"));
  objc_msgSend(*(id *)(a1 + 32), "setLocalAccount:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accountStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_activeiTunesAccount"));
  objc_msgSend(*(id *)(a1 + 32), "setActiveAccount:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "accountStoreDidChange:", ACDAccountStoreDidChangeNotification, 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ASKStorefrontChangeProvider;
  -[ASKStorefrontChangeProvider dealloc](&v4, "dealloc");
}

- (BOOL)hasStorefrontChangedFromAccount:(id)a3 toAccount:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unsigned __int8 v12;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "ams_storefront"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_storefront"));

  if (v6 && v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v6, "componentsSeparatedByString:", CFSTR(" ")));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v7, "componentsSeparatedByString:", CFSTR(" ")));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

    if (v9 | v11)
      v12 = objc_msgSend((id)v9, "isEqual:", v11);
    else
      v12 = 1;

  }
  else if (v6 | v7)
  {
    v12 = objc_msgSend((id)v6, "isEqual:", v7);
  }
  else
  {
    v12 = 1;
  }

  return v12 ^ 1;
}

- (BOOL)hasManagedStateChangedFromAccount:(id)a3 toAccount:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  unsigned __int8 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  unsigned __int8 v15;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "accountPropertyForKey:", CFSTR("isManagedAppleID")));
  v8 = objc_opt_class(NSNumber, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    v9 = v6;
  else
    v9 = 0;

  v10 = objc_msgSend(v9, "BOOLValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountPropertyForKey:", CFSTR("isManagedAppleID")));

  v13 = objc_opt_class(NSNumber, v12);
  if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
    v14 = v11;
  else
    v14 = 0;

  v15 = objc_msgSend(v14, "BOOLValue");
  return v10 ^ v15;
}

- (void)accountStoreDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[ASKStorefrontChangeProvider notifyQueue](self, "notifyQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __53__ASKStorefrontChangeProvider_accountStoreDidChange___block_invoke;
  block[3] = &unk_3726D0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __53__ASKStorefrontChangeProvider_accountStoreDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(void);
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localAccount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accountStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_localiTunesAccount"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "activeAccount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accountStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_activeiTunesAccount"));

  if ((objc_msgSend(*(id *)(a1 + 32), "hasStorefrontChangedFromAccount:toAccount:", v8, v3) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "hasManagedStateChangedFromAccount:toAccount:", v4, v6))
  {
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "block"));
    v7[2]();

  }
  objc_msgSend(*(id *)(a1 + 32), "setLocalAccount:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setActiveAccount:", v6);

}

- (id)block
{
  return self->_block;
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (ACAccount)localAccount
{
  return self->_localAccount;
}

- (void)setLocalAccount:(id)a3
{
  objc_storeStrong((id *)&self->_localAccount, a3);
}

- (ACAccount)activeAccount
{
  return self->_activeAccount;
}

- (void)setActiveAccount:(id)a3
{
  objc_storeStrong((id *)&self->_activeAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAccount, 0);
  objc_storeStrong((id *)&self->_localAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
