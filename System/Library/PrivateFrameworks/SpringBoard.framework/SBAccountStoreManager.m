@implementation SBAccountStoreManager

- (SBAccountStoreManager)init
{
  SBAccountStoreManager *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  ACAccountStore *v5;
  ACAccountStore *accountStore;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBAccountStoreManager;
  v2 = -[SBAccountStoreManager init](&v9, sel_init);
  if (v2)
  {
    v3 = BSDispatchQueueCreateWithQualityOfService();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v5;

    -[SBAccountStoreManager _updatePrimaryAppleAccount](v2, "_updatePrimaryAppleAccount");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__accountStoreDidChange_, *MEMORY[0x1E0C8F1C0], 0);

  }
  return v2;
}

- (void)_updatePrimaryAppleAccount
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SBAccountStoreManager__updatePrimaryAppleAccount__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __51__SBAccountStoreManager__updatePrimaryAppleAccount__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updatePrimaryAppleAccount");
}

- (void)_queue_updatePrimaryAppleAccount
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[SBAccountStoreManager accountStore](self, "accountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__SBAccountStoreManager__queue_updatePrimaryAppleAccount__block_invoke;
  v6[3] = &unk_1E8E9E820;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __57__SBAccountStoreManager__queue_updatePrimaryAppleAccount__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setPrimaryAppleAccount:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("SBAccountStoreManagerPrimaryAppleAccountDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (ACAccount)primaryAppleAccount
{
  return self->_primaryAppleAccount;
}

- (void)setPrimaryAppleAccount:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAppleAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAppleAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
