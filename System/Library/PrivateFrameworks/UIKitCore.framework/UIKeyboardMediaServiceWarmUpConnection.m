@implementation UIKeyboardMediaServiceWarmUpConnection

void __59___UIKeyboardMediaServiceWarmUpConnection_sharedConnection__block_invoke()
{
  _UIKeyboardMediaServiceWarmUpConnection *v0;
  void *v1;

  v0 = objc_alloc_init(_UIKeyboardMediaServiceWarmUpConnection);
  v1 = (void *)_MergedGlobals_1244;
  _MergedGlobals_1244 = (uint64_t)v0;

}

void __49___UIKeyboardMediaServiceWarmUpConnection_warmUp__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v6[0] = *MEMORY[0x1E0D22CE8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[UIApplication _classicMode](UIApplication, "_classicMode"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6[1] = *MEMORY[0x1E0D22D00];
    v7[0] = v2;
    v7[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_alloc_init(MEMORY[0x1E0D23288]);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __49___UIKeyboardMediaServiceWarmUpConnection_warmUp__block_invoke_2;
    v5[3] = &unk_1E16BB768;
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "openApplication:options:withResult:", UIKeyboardMediaServiceBundleIdentifier, v3, v5);

  }
}

void __49___UIKeyboardMediaServiceWarmUpConnection_warmUp__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49___UIKeyboardMediaServiceWarmUpConnection_warmUp__block_invoke_3;
  v7[3] = &unk_1E16B1B50;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __49___UIKeyboardMediaServiceWarmUpConnection_warmUp__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (!*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.iMessageAppsViewService.warmup-connection"), 0);
    objc_msgSend(v2, "_setQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 8), v2);
    objc_initWeak(&location, *(id *)(a1 + 40));
    v3 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49___UIKeyboardMediaServiceWarmUpConnection_warmUp__block_invoke_4;
    v9[3] = &unk_1E16B1B28;
    v4 = v2;
    v10 = v4;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setInterruptionHandler:", v9);
    v7[0] = v3;
    v7[1] = 3221225472;
    v7[2] = __49___UIKeyboardMediaServiceWarmUpConnection_warmUp__block_invoke_5;
    v7[3] = &unk_1E16B3F40;
    objc_copyWeak(&v8, &location);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setInvalidationHandler:", v7);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0CF008);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setRemoteObjectInterface:", v5);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "resume");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "remoteObjectProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "warmUp");

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);

  }
}

uint64_t __49___UIKeyboardMediaServiceWarmUpConnection_warmUp__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __49___UIKeyboardMediaServiceWarmUpConnection_warmUp__block_invoke_5(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

@end
