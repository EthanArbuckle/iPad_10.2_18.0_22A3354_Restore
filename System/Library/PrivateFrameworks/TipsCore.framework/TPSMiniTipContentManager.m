@implementation TPSMiniTipContentManager

- (TPSMiniTipContentManager)init
{
  TPSMiniTipContentManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *clientQueue;
  TPSServiceConnection *v6;
  TPSServiceConnection *serviceProxy;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TPSMiniTipContentManager;
  v2 = -[TPSMiniTipContentManager init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.tips.TPSMiniTipContentManager", v3);
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(TPSServiceConnection);
    serviceProxy = v2->_serviceProxy;
    v2->_serviceProxy = v6;

    TPSMiniTipContentManagerServiceInterfaceServerInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSServiceConnection setRemoteInterfaceInstance:](v2->_serviceProxy, "setRemoteInterfaceInstance:", v8);

  }
  return v2;
}

- (void)invalidate
{
  -[TPSServiceConnection invalidate](self->_serviceProxy, "invalidate");
}

- (void)contentWithContentIdentifiers:(id)a3 bundleID:(id)a4 context:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[TPSMiniTipContentManager _contentWithContentIDCompletionOnClientQueue:](self, "_contentWithContentIDCompletionOnClientQueue:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __93__TPSMiniTipContentManager_contentWithContentIdentifiers_bundleID_context_completionHandler___block_invoke;
  v21[3] = &unk_1E395B330;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v25 = v13;
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __93__TPSMiniTipContentManager_contentWithContentIdentifiers_bundleID_context_completionHandler___block_invoke_2;
  v19[3] = &unk_1E395B358;
  v20 = v25;
  v15 = v25;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  -[TPSMiniTipContentManager _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v21, v19);

}

uint64_t __93__TPSMiniTipContentManager_contentWithContentIdentifiers_bundleID_context_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "contentWithContentIdentifiers:bundleID:context:completionHandler:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __93__TPSMiniTipContentManager_contentWithContentIdentifiers_bundleID_context_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)validateAndPrepareContentForDisplay:(id)a3 bundleID:(id)a4 context:(id)a5 synchronous:(BOOL)a6 skipUsageCheck:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id *v26;
  id *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD aBlock[4];
  id v41;
  id v42;
  id v43;
  id v44;
  BOOL v45;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke;
  aBlock[3] = &unk_1E395B380;
  v19 = v14;
  v41 = v19;
  v20 = v15;
  v42 = v20;
  v21 = v16;
  v43 = v21;
  v45 = a7;
  v22 = v17;
  v44 = v22;
  v23 = _Block_copy(aBlock);
  v38[0] = v18;
  v38[1] = 3221225472;
  v38[2] = __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke_2;
  v38[3] = &unk_1E395B358;
  v24 = v22;
  v39 = v24;
  v25 = _Block_copy(v38);
  if (v10)
  {
    v36[0] = v18;
    v36[1] = 3221225472;
    v36[2] = __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke_3;
    v36[3] = &unk_1E395B3A8;
    v26 = &v37;
    v37 = v23;
    v34[0] = v18;
    v34[1] = 3221225472;
    v34[2] = __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke_4;
    v34[3] = &unk_1E395B358;
    v27 = &v35;
    v35 = v25;
    v28 = v25;
    -[TPSMiniTipContentManager _performSyncWithProxyHandler:errorHandler:](self, "_performSyncWithProxyHandler:errorHandler:", v36, v34);
  }
  else
  {
    v32[0] = v18;
    v32[1] = 3221225472;
    v32[2] = __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke_5;
    v32[3] = &unk_1E395B3A8;
    v26 = &v33;
    v33 = v23;
    v30[0] = v18;
    v30[1] = 3221225472;
    v30[2] = __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke_6;
    v30[3] = &unk_1E395B358;
    v27 = &v31;
    v31 = v25;
    v29 = v25;
    -[TPSMiniTipContentManager _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v32, v30);
  }

}

uint64_t __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "validateAndPrepareContentForDisplay:bundleID:context:skipUsageCheck:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

uint64_t __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)personalizationFailedForContentID:(id)a3 bundleID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__TPSMiniTipContentManager_personalizationFailedForContentID_bundleID_context___block_invoke;
  v14[3] = &unk_1E395B3D0;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[TPSMiniTipContentManager _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v14, &__block_literal_global_3);

}

uint64_t __79__TPSMiniTipContentManager_personalizationFailedForContentID_bundleID_context___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "personalizationFailedForContentID:bundleID:context:", a1[4], a1[5], a1[6]);
}

- (void)hintDisplayedForIdentifier:(id)a3 correlationID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__TPSMiniTipContentManager_hintDisplayedForIdentifier_correlationID_context___block_invoke;
  v14[3] = &unk_1E395B3D0;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[TPSMiniTipContentManager _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v14, &__block_literal_global_3);

}

uint64_t __77__TPSMiniTipContentManager_hintDisplayedForIdentifier_correlationID_context___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "hintDisplayedForIdentifier:correlationID:context:", a1[4], a1[5], a1[6]);
}

- (void)hintDismissedForIdentifier:(id)a3 bundleID:(id)a4 context:(id)a5 reason:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  int64_t v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__TPSMiniTipContentManager_hintDismissedForIdentifier_bundleID_context_reason___block_invoke;
  v16[3] = &unk_1E395B458;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v20 = a6;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[TPSMiniTipContentManager _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v16, &__block_literal_global_4);

}

uint64_t __79__TPSMiniTipContentManager_hintDismissedForIdentifier_bundleID_context_reason___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "hintDismissedForIdentifier:bundleID:context:reason:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)restartTrackingForContentIdentifiers:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__TPSMiniTipContentManager_restartTrackingForContentIdentifiers___block_invoke;
  v6[3] = &unk_1E395B4A0;
  v7 = v4;
  v5 = v4;
  -[TPSMiniTipContentManager _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v6, &__block_literal_global_5);

}

uint64_t __65__TPSMiniTipContentManager_restartTrackingForContentIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "restartTrackingForContentIdentifiers:", *(_QWORD *)(a1 + 32));
}

- (void)_performSyncWithProxyHandler:(id)a3 errorHandler:(id)a4
{
  TPSServiceConnection *serviceProxy;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a3;
  serviceProxy = self->_serviceProxy;
  v7 = a4;
  -[TPSServiceConnection connection](serviceProxy, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10[2](v10, v9);

}

- (void)_performWithProxyHandler:(id)a3 errorHandler:(id)a4
{
  TPSServiceConnection *serviceProxy;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a3;
  serviceProxy = self->_serviceProxy;
  v7 = a4;
  -[TPSServiceConnection connection](serviceProxy, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10[2](v10, v9);

}

- (id)_actionCompletionOnClientQueue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__TPSMiniTipContentManager__actionCompletionOnClientQueue___block_invoke;
  v8[3] = &unk_1E395B510;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = (void *)objc_msgSend(v8, "copy");

  return v6;
}

void __59__TPSMiniTipContentManager__actionCompletionOnClientQueue___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  char v17;

  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__TPSMiniTipContentManager__actionCompletionOnClientQueue___block_invoke_2;
  v13[3] = &unk_1E395B4E8;
  v10 = *(id *)(a1 + 40);
  v15 = v8;
  v16 = v10;
  v17 = a2;
  v14 = v7;
  v11 = v8;
  v12 = v7;
  dispatch_async(v9, v13);

}

uint64_t __59__TPSMiniTipContentManager__actionCompletionOnClientQueue___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (id)_contentWithContentIDCompletionOnClientQueue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__TPSMiniTipContentManager__contentWithContentIDCompletionOnClientQueue___block_invoke;
  v8[3] = &unk_1E395B560;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = (void *)objc_msgSend(v8, "copy");

  return v6;
}

void __73__TPSMiniTipContentManager__contentWithContentIDCompletionOnClientQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__TPSMiniTipContentManager__contentWithContentIDCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_1E395B538;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __73__TPSMiniTipContentManager__contentWithContentIDCompletionOnClientQueue___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (TPSServiceConnection)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProxy, a3);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

@end
