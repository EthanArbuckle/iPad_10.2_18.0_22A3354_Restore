@implementation TILinguisticAssetDownloadClient

- (id)_newXPCConnection
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.TextInput.rdt"), 4096);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE04B9B8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);

  +[TILinguisticAssetDownloadClient _dispatchQueue](TILinguisticAssetDownloadClient, "_dispatchQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setQueue:", v4);

  objc_msgSend(v2, "resume");
  return v2;
}

- (void)requestLinguisticAssetsForLanguage:(id)a3 completion:(id)a4
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
    +[TILinguisticAssetDownloadClient _dispatchQueue](TILinguisticAssetDownloadClient, "_dispatchQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __81__TILinguisticAssetDownloadClient_requestLinguisticAssetsForLanguage_completion___block_invoke;
    v9[3] = &unk_1E243A628;
    v9[4] = self;
    v11 = v7;
    v10 = v6;
    TIDispatchAsync(v8, v9);

  }
}

- (void)addLinguisticAssetsAssertionForLanguage:(id)a3 assertionID:(id)a4 region:(id)a5 clientID:(id)a6 withHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  +[TILinguisticAssetDownloadClient _dispatchQueue](TILinguisticAssetDownloadClient, "_dispatchQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __115__TILinguisticAssetDownloadClient_addLinguisticAssetsAssertionForLanguage_assertionID_region_clientID_withHandler___block_invoke;
  v23[3] = &unk_1E243A388;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22 = v16;
  TIDispatchAsync(v17, v23);

}

- (void)removeLinguisticAssetsAssertionWithIdentifier:(id)a3 forClientID:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[TILinguisticAssetDownloadClient _dispatchQueue](TILinguisticAssetDownloadClient, "_dispatchQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __105__TILinguisticAssetDownloadClient_removeLinguisticAssetsAssertionWithIdentifier_forClientID_withHandler___block_invoke;
  v15[3] = &unk_1E243A3B0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  TIDispatchAsync(v11, v15);

}

- (void)fetchAssetUpdateStatusForInputModeIdentifier:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  +[TILinguisticAssetDownloadClient _dispatchQueue](TILinguisticAssetDownloadClient, "_dispatchQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89__TILinguisticAssetDownloadClient_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke;
  v11[3] = &unk_1E243A628;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  TIDispatchAsync(v8, v11);

}

- (void)updateAssetForInputModeIdentifier:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  +[TILinguisticAssetDownloadClient _dispatchQueue](TILinguisticAssetDownloadClient, "_dispatchQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__TILinguisticAssetDownloadClient_updateAssetForInputModeIdentifier_callback___block_invoke;
  v11[3] = &unk_1E243A628;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  TIDispatchAsync(v8, v11);

}

void __78__TILinguisticAssetDownloadClient_updateAssetForInputModeIdentifier_callback___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newXPCConnection");
  +[TILinguisticAssetDownloadClient _internalUpdateAssetRequestHandler:connection:](TILinguisticAssetDownloadClient, "_internalUpdateAssetRequestHandler:connection:", *(_QWORD *)(a1 + 48), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__TILinguisticAssetDownloadClient_updateAssetForInputModeIdentifier_callback___block_invoke_2;
  v7[3] = &unk_1E243A720;
  v4 = v3;
  v8 = v4;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "updateAssetForInputModeIdentifier:callback:", *(_QWORD *)(a1 + 40), v4);

}

uint64_t __78__TILinguisticAssetDownloadClient_updateAssetForInputModeIdentifier_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __89__TILinguisticAssetDownloadClient_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newXPCConnection");
  +[TILinguisticAssetDownloadClient _internalFetchAssetUpdateStatusRequestHandler:connection:](TILinguisticAssetDownloadClient, "_internalFetchAssetUpdateStatusRequestHandler:connection:", *(_QWORD *)(a1 + 48), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__TILinguisticAssetDownloadClient_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke_2;
  v7[3] = &unk_1E243A720;
  v4 = v3;
  v8 = v4;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "fetchAssetUpdateStatusForInputModeIdentifier:callback:", *(_QWORD *)(a1 + 40), v4);

}

uint64_t __89__TILinguisticAssetDownloadClient_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __105__TILinguisticAssetDownloadClient_removeLinguisticAssetsAssertionWithIdentifier_forClientID_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newXPCConnection");
  +[TILinguisticAssetDownloadClient _internalAssertionRequestHandlerForHandler:connection:](TILinguisticAssetDownloadClient, "_internalAssertionRequestHandlerForHandler:connection:", *(_QWORD *)(a1 + 56), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __105__TILinguisticAssetDownloadClient_removeLinguisticAssetsAssertionWithIdentifier_forClientID_withHandler___block_invoke_2;
  v7[3] = &unk_1E243A720;
  v4 = v3;
  v8 = v4;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "removeLinguisticAssetsAssertionWithIdentifier:forClientID:withHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4);
  else
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);

}

uint64_t __105__TILinguisticAssetDownloadClient_removeLinguisticAssetsAssertionWithIdentifier_forClientID_withHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __115__TILinguisticAssetDownloadClient_addLinguisticAssetsAssertionForLanguage_assertionID_region_clientID_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newXPCConnection");
  +[TILinguisticAssetDownloadClient _internalAssertionRequestHandlerForHandler:connection:](TILinguisticAssetDownloadClient, "_internalAssertionRequestHandlerForHandler:connection:", *(_QWORD *)(a1 + 72), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __115__TILinguisticAssetDownloadClient_addLinguisticAssetsAssertionForLanguage_assertionID_region_clientID_withHandler___block_invoke_2;
  v7[3] = &unk_1E243A720;
  v4 = v3;
  v8 = v4;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "addLinguisticAssetsAssertionForLanguage:assertionID:region:clientID:withHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v4);
  else
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);

}

uint64_t __115__TILinguisticAssetDownloadClient_addLinguisticAssetsAssertionForLanguage_assertionID_region_clientID_withHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__TILinguisticAssetDownloadClient_requestLinguisticAssetsForLanguage_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newXPCConnection");
  +[TILinguisticAssetDownloadClient _internalHandlerForHandler:connection:](TILinguisticAssetDownloadClient, "_internalHandlerForHandler:connection:", *(_QWORD *)(a1 + 48), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__TILinguisticAssetDownloadClient_requestLinguisticAssetsForLanguage_completion___block_invoke_2;
  v10[3] = &unk_1E243A720;
  v5 = v3;
  v11 = v5;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __81__TILinguisticAssetDownloadClient_requestLinguisticAssetsForLanguage_completion___block_invoke_3;
    v8[3] = &unk_1E243A360;
    v9 = v5;
    objc_msgSend(v6, "requestLinguisticAssetsForLanguage:completion:", v7, v8);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v5 + 2))(v5, -1, 0);
  }

}

uint64_t __81__TILinguisticAssetDownloadClient_requestLinguisticAssetsForLanguage_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__TILinguisticAssetDownloadClient_requestLinguisticAssetsForLanguage_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)_dispatchQueue
{
  if (_dispatchQueue_onceToken != -1)
    dispatch_once(&_dispatchQueue_onceToken, &__block_literal_global_5824);
  return (id)_dispatchQueue_queue;
}

+ (id)_internalHandlerForHandler:(id)a3 connection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v5 = a3;
  objc_initWeak(&location, a4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__TILinguisticAssetDownloadClient__internalHandlerForHandler_connection___block_invoke;
  v10[3] = &unk_1E243A2E8;
  v11 = v5;
  v6 = v5;
  objc_copyWeak(&v12, &location);
  v7 = (void *)MEMORY[0x18D783768](v10);
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v8;
}

+ (id)_internalAssertionRequestHandlerForHandler:(id)a3 connection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v5 = a3;
  objc_initWeak(&location, a4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__TILinguisticAssetDownloadClient__internalAssertionRequestHandlerForHandler_connection___block_invoke;
  v10[3] = &unk_1E243A310;
  v11 = v5;
  v6 = v5;
  objc_copyWeak(&v12, &location);
  v7 = (void *)MEMORY[0x18D783768](v10);
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v8;
}

+ (id)_internalFetchAssetUpdateStatusRequestHandler:(id)a3 connection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v5 = a3;
  objc_initWeak(&location, a4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__TILinguisticAssetDownloadClient__internalFetchAssetUpdateStatusRequestHandler_connection___block_invoke;
  v10[3] = &unk_1E243A2E8;
  v11 = v5;
  v6 = v5;
  objc_copyWeak(&v12, &location);
  v7 = (void *)MEMORY[0x18D783768](v10);
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v8;
}

+ (id)_internalUpdateAssetRequestHandler:(id)a3 connection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v5 = a3;
  objc_initWeak(&location, a4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__TILinguisticAssetDownloadClient__internalUpdateAssetRequestHandler_connection___block_invoke;
  v10[3] = &unk_1E243A338;
  v11 = v5;
  v6 = v5;
  objc_copyWeak(&v12, &location);
  v7 = (void *)MEMORY[0x18D783768](v10);
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v8;
}

void __81__TILinguisticAssetDownloadClient__internalUpdateAssetRequestHandler_connection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

void __92__TILinguisticAssetDownloadClient__internalFetchAssetUpdateStatusRequestHandler_connection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

void __89__TILinguisticAssetDownloadClient__internalAssertionRequestHandlerForHandler_connection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

void __73__TILinguisticAssetDownloadClient__internalHandlerForHandler_connection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

void __49__TILinguisticAssetDownloadClient__dispatchQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.TextInput.linguistic-asset-download-client", v2);
  v1 = (void *)_dispatchQueue_queue;
  _dispatchQueue_queue = (uint64_t)v0;

}

@end
