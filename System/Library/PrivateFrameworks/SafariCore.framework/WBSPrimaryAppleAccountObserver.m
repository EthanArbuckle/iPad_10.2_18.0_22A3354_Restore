@implementation WBSPrimaryAppleAccountObserver

uint64_t __78__WBSPrimaryAppleAccountObserver_getPrimaryAppleAccountWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

void __98__WBSPrimaryAppleAccountObserver_getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v3 = (id *)getACAccountDataclassBookmarksSymbolLoc_ptr;
  v9 = getACAccountDataclassBookmarksSymbolLoc_ptr;
  if (!getACAccountDataclassBookmarksSymbolLoc_ptr)
  {
    v4 = (void *)AccountsLibrary();
    v3 = (id *)dlsym(v4, "ACAccountDataclassBookmarks");
    v7[3] = (uint64_t)v3;
    getACAccountDataclassBookmarksSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v6, 8);
  if (!v3)
    __98__WBSPrimaryAppleAccountObserver_getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler___block_invoke_cold_1();
  v5 = *v3;
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v1, objc_msgSend(v2, "isEnabledForDataclass:", v5, v6));

}

- (void)_registerForUpdates
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1B2621000, v3, OS_LOG_TYPE_ERROR, "Failed to register for account updates: %{public}@", (uint8_t *)&v5, 0xCu);

}

- (void)_setAccountOnInternalQueue:(id)a3
{
  ACAccount *v4;
  ACAccount *primaryAppleAccount;
  ACAccount *v6;
  NSString *v7;
  NSString *primaryAppleAccountAltDSID;
  id v9;

  v4 = (ACAccount *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  primaryAppleAccount = self->_primaryAppleAccount;
  self->_primaryAppleAccount = v4;
  v6 = v4;

  -[ACAccount aa_altDSID](self->_primaryAppleAccount, "aa_altDSID");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  primaryAppleAccountAltDSID = self->_primaryAppleAccountAltDSID;
  self->_primaryAppleAccountAltDSID = v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "postNotificationName:object:", CFSTR("WBSPrimaryAppleAccountDidChangeNotification"), self);
}

uint64_t __38__WBSPrimaryAppleAccountObserver_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerForUpdates");
}

+ (WBSPrimaryAppleAccountObserver)sharedObserver
{
  if (sharedObserver_onceToken != -1)
    dispatch_once(&sharedObserver_onceToken, &__block_literal_global_48);
  return (WBSPrimaryAppleAccountObserver *)(id)sharedObserver_sharedObserver;
}

- (void)getPrimaryAppleAccountWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__WBSPrimaryAppleAccountObserver_getPrimaryAppleAccountWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E649B910;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __48__WBSPrimaryAppleAccountObserver_sharedObserver__block_invoke()
{
  WBSPrimaryAppleAccountObserver *v0;
  void *v1;

  v0 = objc_alloc_init(WBSPrimaryAppleAccountObserver);
  v1 = (void *)sharedObserver_sharedObserver;
  sharedObserver_sharedObserver = (uint64_t)v0;

}

- (WBSPrimaryAppleAccountObserver)init
{
  WBSPrimaryAppleAccountObserver *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  NSObject *v5;
  WBSPrimaryAppleAccountObserver *v6;
  WBSPrimaryAppleAccountObserver *v7;
  _QWORD block[4];
  WBSPrimaryAppleAccountObserver *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WBSPrimaryAppleAccountObserver;
  v2 = -[WBSPrimaryAppleAccountObserver init](&v11, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.SafariCore.WBSPrimaryAppleAccountObserver", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__WBSPrimaryAppleAccountObserver_init__block_invoke;
    block[3] = &unk_1E649B768;
    v6 = v2;
    v10 = v6;
    dispatch_async(v5, block);
    v7 = v6;

  }
  return v2;
}

- (void)getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __98__WBSPrimaryAppleAccountObserver_getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E649B910;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)getPrimaryAppleAccountAltDSIDWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__WBSPrimaryAppleAccountObserver_getPrimaryAppleAccountAltDSIDWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E649B910;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __85__WBSPrimaryAppleAccountObserver_getPrimaryAppleAccountAltDSIDWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)_setAccountIfPrimary:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *queue;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  getAAAccountClassPrimary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "aa_isAccountClass:", v5);

  if (v6)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__WBSPrimaryAppleAccountObserver__setAccountIfPrimary___block_invoke;
    v8[3] = &unk_1E649B6D8;
    v8[4] = self;
    v9 = v4;
    dispatch_async(queue, v8);

  }
}

uint64_t __55__WBSPrimaryAppleAccountObserver__setAccountIfPrimary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAccountOnInternalQueue:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isCurrentAppleIDManaged
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__WBSPrimaryAppleAccountObserver_isCurrentAppleIDManaged__block_invoke;
  v5[3] = &unk_1E649BA10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__WBSPrimaryAppleAccountObserver_isCurrentAppleIDManaged__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "aa_isManagedAppleID");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isUsingICloud
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__WBSPrimaryAppleAccountObserver_isUsingICloud__block_invoke;
  v5[3] = &unk_1E649BA10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__WBSPrimaryAppleAccountObserver_isUsingICloud__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 24) != 0;
  return result;
}

- (void)accountWasRemoved:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *queue;
  _QWORD block[5];

  v4 = a3;
  getAAAccountClassPrimary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "aa_isAccountClass:", v5);

  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__WBSPrimaryAppleAccountObserver_accountWasRemoved___block_invoke;
    block[3] = &unk_1E649B768;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __52__WBSPrimaryAppleAccountObserver_accountWasRemoved___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAccountOnInternalQueue:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAppleAccountAltDSID, 0);
  objc_storeStrong((id *)&self->_primaryAppleAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __98__WBSPrimaryAppleAccountObserver_getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler___block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getACAccountDataclassBookmarks(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("WBSPrimaryAppleAccountObserver.m"), 15, CFSTR("%s"), OUTLINED_FUNCTION_1_5());

  __break(1u);
}

@end
