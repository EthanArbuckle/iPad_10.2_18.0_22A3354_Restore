@implementation ASKProfilePictureStore

+ (ASKProfilePictureStore)sharedStore
{
  if (sharedStore_onceToken != -1)
    dispatch_once(&sharedStore_onceToken, &__block_literal_global_2);
  return (ASKProfilePictureStore *)(id)sharedStore_instance;
}

void __37__ASKProfilePictureStore_sharedStore__block_invoke(id a1)
{
  ASKProfilePictureStore *v1;
  void *v2;

  v1 = objc_alloc_init(ASKProfilePictureStore);
  v2 = (void *)sharedStore_instance;
  sharedStore_instance = (uint64_t)v1;

}

- (ASKProfilePictureStore)init
{
  ASKProfilePictureStore *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *notificationQueue;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ASKProfilePictureStore;
  v2 = -[ASKProfilePictureStore init](&v16, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("ShelfKit.ASKProfilePictureStore.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("ShelfKit.ASKProfilePictureStore.notificationQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v8 = ACDAccountStoreDidChangeNotification;
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "appleAccountsDidChange:", ACDAccountStoreDidChangeNotification, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, "storeAccountsDidChange:", v8, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, "profilePictureStoreDidChange:", AAUIProfilePictureStoreDidChangeNotification, 0);

    objc_initWeak(&location, v2);
    v11 = objc_claimAutoreleasedReturnValue(-[ASKProfilePictureStore accessQueue](v2, "accessQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __30__ASKProfilePictureStore_init__block_invoke;
    v13[3] = &unk_3727C0;
    objc_copyWeak(&v14, &location);
    dispatch_async(v11, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __30__ASKProfilePictureStore_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "configureProfilePictureStoreAndNotifyIfNeeded");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ASKProfilePictureStore;
  -[ASKProfilePictureStore dealloc](&v4, "dealloc");
}

- (void)configureProfilePictureStoreAndNotifyIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  unsigned int v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  int v20;
  int v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;

  v3 = objc_claimAutoreleasedReturnValue(-[ASKProfilePictureStore accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](ACAccountStore, "ams_sharedAccountStore"));
  -[ASKProfilePictureStore setAccountStore:](self, "setAccountStore:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASKProfilePictureStore accountStore](self, "accountStore"));
  v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_primaryAppleAccount"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "username"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASKProfilePictureStore accountStore](self, "accountStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_activeiTunesAccount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "username"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASKProfilePictureStore primaryAccountName](self, "primaryAccountName"));
  v11 = objc_msgSend(v10, "length");
  if (v11 == objc_msgSend(v6, "length"))
  {
    v12 = 0;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASKProfilePictureStore primaryAccountName](self, "primaryAccountName"));
    v12 = objc_msgSend(v13, "isEqualToString:", v6) ^ 1;

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASKProfilePictureStore storeAccountName](self, "storeAccountName"));
  v15 = objc_msgSend(v14, "length");
  if (v15 == objc_msgSend(v9, "length"))
  {
    v16 = 0;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASKProfilePictureStore storeAccountName](self, "storeAccountName"));
    v16 = objc_msgSend(v17, "isEqualToString:", v9) ^ 1;

  }
  if (objc_msgSend(v6, "length") && objc_msgSend(v9, "length"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASKProfilePictureStore profilePictureStore](self, "profilePictureStore"));
    v19 = v18 == 0;
    v20 = 1;
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASKProfilePictureStore profilePictureStore](self, "profilePictureStore"));
    v20 = 0;
    v19 = v18 != 0;
  }

  v21 = v12 | v16;
  if ((v21 & 1) != 0 || v19)
  {
    -[ASKProfilePictureStore setPrimaryAccountName:](self, "setPrimaryAccountName:", v6);
    -[ASKProfilePictureStore setStoreAccountName:](self, "setStoreAccountName:", v9);
    if (v20)
    {
      v22 = objc_alloc((Class)AAUIProfilePictureStore);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ASKProfilePictureStore accountStore](self, "accountStore"));
      v24 = objc_msgSend(v22, "initWithAppleAccount:store:", v26, v23);
      -[ASKProfilePictureStore setProfilePictureStore:](self, "setProfilePictureStore:", v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ASKProfilePictureStore profilePictureStore](self, "profilePictureStore"));
      objc_msgSend(v25, "setMonogramType:", 0);

      if (!v21)
        goto LABEL_18;
      goto LABEL_17;
    }
    -[ASKProfilePictureStore setProfilePictureStore:](self, "setProfilePictureStore:", 0);
    if (v21)
LABEL_17:
      -[ASKProfilePictureStore notifyIfNeeded](self, "notifyIfNeeded");
  }
LABEL_18:

}

- (void)notifyIfNeeded
{
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  v3 = objc_claimAutoreleasedReturnValue(-[ASKProfilePictureStore accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  if (-[ASKProfilePictureStore hasRequestedImages](self, "hasRequestedImages"))
  {
    objc_initWeak(&location, self);
    v4 = objc_claimAutoreleasedReturnValue(-[ASKProfilePictureStore notificationQueue](self, "notificationQueue"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __40__ASKProfilePictureStore_notifyIfNeeded__block_invoke;
    v5[3] = &unk_3727C0;
    objc_copyWeak(&v6, &location);
    dispatch_async(v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __40__ASKProfilePictureStore_notifyIfNeeded__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("ASKProfilePictureStoreDidChange"), WeakRetained);

}

- (void)appleAccountsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[ASKProfilePictureStore accessQueue](self, "accessQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __49__ASKProfilePictureStore_appleAccountsDidChange___block_invoke;
  v6[3] = &unk_3727C0;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __49__ASKProfilePictureStore_appleAccountsDidChange___block_invoke(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = objc_alloc_init((Class)ACAccountStore);
  objc_msgSend(WeakRetained, "setAccountStore:", v1);

  objc_msgSend(WeakRetained, "setProfilePictureStore:", 0);
  objc_msgSend(WeakRetained, "configureProfilePictureStoreAndNotifyIfNeeded");

}

- (void)storeAccountsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[ASKProfilePictureStore accessQueue](self, "accessQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __49__ASKProfilePictureStore_storeAccountsDidChange___block_invoke;
  v6[3] = &unk_3727C0;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __49__ASKProfilePictureStore_storeAccountsDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "configureProfilePictureStoreAndNotifyIfNeeded");

}

- (void)profilePictureStoreDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[ASKProfilePictureStore accessQueue](self, "accessQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __55__ASKProfilePictureStore_profilePictureStoreDidChange___block_invoke;
  v6[3] = &unk_3727C0;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __55__ASKProfilePictureStore_profilePictureStoreDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notifyIfNeeded");

}

- (void)profilePictureForAccountOwnerWithoutMonogramFallbackWithPictureDiameter:(double)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v7 = objc_claimAutoreleasedReturnValue(-[ASKProfilePictureStore accessQueue](self, "accessQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __109__ASKProfilePictureStore_profilePictureForAccountOwnerWithoutMonogramFallbackWithPictureDiameter_completion___block_invoke;
  v9[3] = &unk_372860;
  objc_copyWeak(v11, &location);
  v11[1] = *(id *)&a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __109__ASKProfilePictureStore_profilePictureForAccountOwnerWithoutMonogramFallbackWithPictureDiameter_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(double *)(a1 + 48);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "profilePictureStore"));
  objc_msgSend(v4, "setPictureDiameter:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "profilePictureStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "profilePictureForAccountOwnerWithoutMonogramFallback"));

  objc_msgSend(WeakRetained, "_markAsHasRequestedImages");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __109__ASKProfilePictureStore_profilePictureForAccountOwnerWithoutMonogramFallbackWithPictureDiameter_completion___block_invoke_2;
  v9[3] = &unk_372838;
  v7 = *(id *)(a1 + 32);
  v10 = v6;
  v11 = v7;
  v8 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

}

uint64_t __109__ASKProfilePictureStore_profilePictureForAccountOwnerWithoutMonogramFallbackWithPictureDiameter_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_markAsHasRequestedImages
{
  if (!-[ASKProfilePictureStore hasRequestedImages](self, "hasRequestedImages"))
    -[ASKProfilePictureStore setHasRequestedImages:](self, "setHasRequestedImages:", 1);
}

- (AAUIProfilePictureStore)profilePictureStore
{
  return self->_profilePictureStore;
}

- (void)setProfilePictureStore:(id)a3
{
  objc_storeStrong((id *)&self->_profilePictureStore, a3);
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (ACAccount)storeAccount
{
  return self->_storeAccount;
}

- (void)setStoreAccount:(id)a3
{
  objc_storeStrong((id *)&self->_storeAccount, a3);
}

- (ACAccount)primaryAccount
{
  return self->_primaryAccount;
}

- (void)setPrimaryAccount:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAccount, a3);
}

- (NSString)primaryAccountName
{
  return self->_primaryAccountName;
}

- (void)setPrimaryAccountName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)storeAccountName
{
  return self->_storeAccountName;
}

- (void)setStoreAccountName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationQueue, a3);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (BOOL)hasRequestedImages
{
  return self->_hasRequestedImages;
}

- (void)setHasRequestedImages:(BOOL)a3
{
  self->_hasRequestedImages = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_storeAccountName, 0);
  objc_storeStrong((id *)&self->_primaryAccountName, 0);
  objc_storeStrong((id *)&self->_primaryAccount, 0);
  objc_storeStrong((id *)&self->_storeAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_profilePictureStore, 0);
}

@end
