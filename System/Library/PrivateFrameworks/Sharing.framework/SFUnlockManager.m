@implementation SFUnlockManager

+ (id)sharedUnlockManager
{
  if (sharedUnlockManager_onceToken != -1)
    dispatch_once(&sharedUnlockManager_onceToken, &__block_literal_global_11);
  return (id)sharedUnlockManager_manager;
}

void __38__SFUnlockManager_sharedUnlockManager__block_invoke()
{
  SFUnlockManager *v0;
  void *v1;

  v0 = objc_alloc_init(SFUnlockManager);
  v1 = (void *)sharedUnlockManager_manager;
  sharedUnlockManager_manager = (uint64_t)v0;

}

- (SFUnlockManager)init
{
  SFUnlockManager *v2;
  SFUnlockManager *v3;
  OS_dispatch_source *stateRequestTimer;
  dispatch_queue_t v5;
  OS_dispatch_queue *delegateQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFUnlockManager;
  v2 = -[SFUnlockManager init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    stateRequestTimer = v2->_stateRequestTimer;
    v2->_stateRequestTimer = 0;

    v5 = dispatch_queue_create("com.apple.sharing.sfunlock.delegate-queue", 0);
    delegateQueue = v3->_delegateQueue;
    v3->_delegateQueue = (OS_dispatch_queue *)v5;

  }
  return v3;
}

- (void)enableUnlockWithDevice:(id)a3 fromKey:(BOOL)a4 withPasscode:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  BOOL v18;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke;
    v14[3] = &unk_1E482F108;
    v14[4] = self;
    v17 = v12;
    v15 = v10;
    v18 = a4;
    v16 = v11;
    objc_msgSend(v13, "unlockManagerWithCompletionHandler:", v14);

  }
}

void __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke_2;
    v18[3] = &unk_1E482EE00;
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = *(id *)(a1 + 56);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(unsigned __int8 *)(a1 + 64);
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke_4;
    v16[3] = &unk_1E482F0E0;
    v9 = *(_QWORD *)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 48);
    v17 = *(id *)(a1 + 56);
    objc_msgSend(v7, "enableUnlockWithDevice:fromKey:withPasscode:completionHandler:", v9, v8, v10, v16);

    v11 = v19;
  }
  else
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke_6;
    v13[3] = &unk_1E482E0F0;
    v15 = *(id *)(a1 + 56);
    v14 = v5;
    dispatch_async(v12, v13);

    v11 = v15;
  }

}

void __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke_3;
  v7[3] = &unk_1E482E0F0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke_5;
  block[3] = &unk_1E482F0B8;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __81__SFUnlockManager_enableUnlockWithDevice_fromKey_withPasscode_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)disableUnlockWithDevice:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__SFUnlockManager_disableUnlockWithDevice___block_invoke;
  v6[3] = &unk_1E482EC68;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "unlockManagerWithCompletionHandler:", v6);

}

void __43__SFUnlockManager_disableUnlockWithDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_89);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__SFUnlockManager_disableUnlockWithDevice___block_invoke_90;
    v8[3] = &unk_1E482F150;
    v9 = v7;
    -[NSObject disableUnlockWithDevice:completionHandler:](v6, "disableUnlockWithDevice:completionHandler:", v9, v8);

  }
  else
  {
    auto_unlock_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1A2830000, v6, OS_LOG_TYPE_DEFAULT, "Error retrieving connection proxy = %@", buf, 0xCu);
    }
  }

}

void __43__SFUnlockManager_disableUnlockWithDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  auto_unlock_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Disabling unlock failed: XPC connection error = %@", (uint8_t *)&v4, 0xCu);
  }

}

void __43__SFUnlockManager_disableUnlockWithDevice___block_invoke_90(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  auto_unlock_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("NO");
    v9 = 138412802;
    if (a2)
      v8 = CFSTR("YES");
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_1A2830000, v6, OS_LOG_TYPE_DEBUG, "Disabled unlock with device = %@, success = %@, error = %@", (uint8_t *)&v9, 0x20u);
  }

}

- (void)unlockEnabledWithDevice:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke;
    v9[3] = &unk_1E482F178;
    v9[4] = self;
    v11 = v7;
    v10 = v6;
    objc_msgSend(v8, "unlockManagerWithCompletionHandler:", v9);

  }
}

void __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke_2;
    v16[3] = &unk_1E482EE00;
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = *(id *)(a1 + 48);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke_4;
    v14[3] = &unk_1E482F0E0;
    v8 = *(_QWORD *)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = *(id *)(a1 + 48);
    objc_msgSend(v7, "unlockEnabledWithDevice:completionHandler:", v8, v14);

    v9 = v17;
  }
  else
  {
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke_6;
    v11[3] = &unk_1E482E0F0;
    v13 = *(id *)(a1 + 48);
    v12 = v5;
    dispatch_async(v10, v11);

    v9 = v13;
  }

}

void __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke_3;
  v7[3] = &unk_1E482E0F0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke_5;
  block[3] = &unk_1E482F0B8;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __61__SFUnlockManager_unlockEnabledWithDevice_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)establishStashBagWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E482EE50;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "unlockManagerWithCompletionHandler:", v6);

  }
}

void __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke_2;
    v18[3] = &unk_1E482EE00;
    v7 = *(void **)(a1 + 40);
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = v7;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke_4;
    v16[3] = &unk_1E482F0E0;
    v9 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = v9;
    objc_msgSend(v8, "establishStashBagWithCompletionHandler:", v16);

    v10 = v19;
  }
  else
  {
    v11 = *(void **)(a1 + 40);
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke_6;
    v13[3] = &unk_1E482E0F0;
    v15 = v11;
    v14 = v5;
    dispatch_async(v12, v13);

    v10 = v15;
  }

}

void __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E482E0F0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke_5;
  block[3] = &unk_1E482F0B8;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __58__SFUnlockManager_establishStashBagWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)establishStashBagWithManifest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *delegateQueue;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_2;
      v13[3] = &unk_1E482F178;
      v13[4] = self;
      v15 = v7;
      v14 = v6;
      objc_msgSend(v8, "unlockManagerWithCompletionHandler:", v13);

      v9 = v15;
    }
    else
    {
      auto_unlock_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A2830000, v11, OS_LOG_TYPE_DEFAULT, "establishStashBagWithManifest: Missing manifest data handler", buf, 2u);
      }

      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke;
      block[3] = &unk_1E482DCC0;
      v17 = v7;
      dispatch_async(delegateQueue, block);
      v9 = v17;
    }

  }
  else
  {
    auto_unlock_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2830000, v10, OS_LOG_TYPE_DEFAULT, "establishStashBagWithManifest: Missing completion handler", buf, 2u);
    }

  }
}

void __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2D50];
  v6[0] = CFSTR("Missing manifest data handler");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("SFUnlockErrorDomian"), 112, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v4);

}

void __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_3;
    v16[3] = &unk_1E482EE00;
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = *(id *)(a1 + 48);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_5;
    v14[3] = &unk_1E482F0E0;
    v8 = *(_QWORD *)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = *(id *)(a1 + 48);
    objc_msgSend(v7, "establishStashBagWithManifest:completionHandler:", v8, v14);

    v9 = v17;
  }
  else
  {
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_7;
    v11[3] = &unk_1E482E0F0;
    v13 = *(id *)(a1 + 48);
    v12 = v5;
    dispatch_async(v10, v11);

    v9 = v13;
  }

}

void __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_4;
  v7[3] = &unk_1E482E0F0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_6;
  block[3] = &unk_1E482F0B8;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __67__SFUnlockManager_establishStashBagWithManifest_completionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)unlockStateForDevice:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  OS_dispatch_source *v11;
  OS_dispatch_source *stateRequestTimer;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke;
    v17[3] = &unk_1E482E0F0;
    v10 = v7;
    v17[4] = self;
    v18 = v10;
    -[SFUnlockManager timerWithBlock:](self, "timerWithBlock:", v17);
    v11 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();
    stateRequestTimer = self->_stateRequestTimer;
    self->_stateRequestTimer = v11;

    dispatch_resume((dispatch_object_t)self->_stateRequestTimer);
    +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_2;
    v14[3] = &unk_1E482F178;
    v14[4] = self;
    v16 = v10;
    v15 = v6;
    objc_msgSend(v13, "unlockManagerWithCompletionHandler:", v14);

  }
}

uint64_t __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2D50];
  v8[0] = CFSTR("sharingd never responded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("SFUnlockErrorDomian"), 113, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v5);

  return objc_msgSend(*(id *)(a1 + 32), "cancelStateRequestTimer");
}

void __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_3;
    v19[3] = &unk_1E482EE00;
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = *(id *)(a1 + 48);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_5;
    v17[3] = &unk_1E482F1F0;
    v8 = *(_QWORD *)(a1 + 40);
    v17[4] = *(_QWORD *)(a1 + 32);
    v18 = *(id *)(a1 + 48);
    objc_msgSend(v7, "unlockStateForDevice:completionHandler:", v8, v17);

    v9 = v20;
  }
  else
  {
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_7;
    block[3] = &unk_1E482F1A0;
    v16 = *(id *)(a1 + 48);
    v11 = v5;
    v12 = *(_QWORD *)(a1 + 32);
    v14 = v11;
    v15 = v12;
    dispatch_async(v10, block);

    v9 = v16;
  }

}

void __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_4;
  block[3] = &unk_1E482F1A0;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v7;
  v12 = v6;
  v8 = v3;
  dispatch_async(v5, block);

}

uint64_t __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "cancelStateRequestTimer");
}

void __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_6;
  v12[3] = &unk_1E482F1C8;
  v9 = v7;
  v13 = v5;
  v14 = v6;
  v15 = *(_QWORD *)(a1 + 32);
  v16 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(v8, v12);

}

uint64_t __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "cancelStateRequestTimer");
}

uint64_t __58__SFUnlockManager_unlockStateForDevice_completionHandler___block_invoke_7(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "cancelStateRequestTimer");
}

- (id)timerWithBlock:(id)a3
{
  NSObject *delegateQueue;
  id v4;
  NSObject *v5;
  dispatch_time_t v6;

  delegateQueue = self->_delegateQueue;
  v4 = a3;
  v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, delegateQueue);
  v6 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_source_set_event_handler(v5, v4);

  return v5;
}

- (void)cancelStateRequestTimer
{
  NSObject *stateRequestTimer;
  OS_dispatch_source *v4;

  stateRequestTimer = self->_stateRequestTimer;
  if (stateRequestTimer)
  {
    dispatch_source_cancel(stateRequestTimer);
    v4 = self->_stateRequestTimer;
    self->_stateRequestTimer = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateRequestTimer, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

@end
