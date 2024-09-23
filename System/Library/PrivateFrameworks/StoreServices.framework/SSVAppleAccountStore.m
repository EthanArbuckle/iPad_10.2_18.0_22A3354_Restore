@implementation SSVAppleAccountStore

- (SSVAppleAccountStore)init
{
  SSVAppleAccountStore *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v5;
  NSObject *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSVAppleAccountStore;
  v2 = -[SSVAppleAccountStore init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.StoreServices.SSVAppleAccountStore", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_dispatchQueue;
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v5, v6);

  }
  return v2;
}

+ (id)sharedAccountStore
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SSVAppleAccountStore_sharedAccountStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAccountStore_sOnce != -1)
    dispatch_once(&sharedAccountStore_sOnce, block);
  return (id)sharedAccountStore_sStore;
}

void __42__SSVAppleAccountStore_sharedAccountStore__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedAccountStore_sStore;
  sharedAccountStore_sStore = (uint64_t)v1;

}

- (ACAccount)primaryAppleAccount
{
  NSObject *dispatchQueue;
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
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__SSVAppleAccountStore_primaryAppleAccount__block_invoke;
  v5[3] = &unk_1E47B8718;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ACAccount *)v3;
}

void __43__SSVAppleAccountStore_primaryAppleAccount__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  if (!v3)
  {
    v4 = *(void **)(v2 + 8);
    if (!v4)
    {
      v5 = SSVAccountsFramework();
      v6 = objc_alloc_init((Class)SSVWeakLinkedClassForString(CFSTR("ACAccountStore"), v5));
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 8);
      *(_QWORD *)(v7 + 8) = v6;

      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)SSVAccountsFramework();
        objc_msgSend(v9, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__accountStoreDidChangeNotification_, *(_QWORD *)SSVWeakLinkedSymbolForString("ACAccountStoreDidChangeNotification", v10), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

      }
      SSVAppleAccountFramework();
      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    }
    objc_msgSend(v4, "aa_primaryAppleAccount");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 24);
    *(_QWORD *)(v12 + 24) = v11;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (void)_accountStoreDidChangeNotification:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SSVAppleAccountStore__accountStoreDidChangeNotification___block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_barrier_async(dispatchQueue, block);
}

void __59__SSVAppleAccountStore__accountStoreDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAppleAccount, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
