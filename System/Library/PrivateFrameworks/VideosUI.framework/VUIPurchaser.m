@implementation VUIPurchaser

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_15 != -1)
    dispatch_once(&sharedInstance_onceToken_15, &__block_literal_global_72);
  return (id)sharedInstance_purchaser;
}

void __30__VUIPurchaser_sharedInstance__block_invoke()
{
  VUIPurchaser *v0;
  void *v1;

  v0 = objc_alloc_init(VUIPurchaser);
  v1 = (void *)sharedInstance_purchaser;
  sharedInstance_purchaser = (uint64_t)v0;

}

- (VUIPurchaser)init
{
  VUIPurchaser *v2;
  uint64_t v3;
  NSMutableSet *purchasingParamsSet;
  void *v5;
  void *v6;
  uint64_t v7;
  AMSUIPurchaseQueue *purchaseUIQueue;
  SSEventMonitor *v9;
  SSEventMonitor *eventMonitor;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VUIPurchaser;
  v2 = -[VUIPurchaser init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    purchasingParamsSet = v2->_purchasingParamsSet;
    v2->_purchasingParamsSet = (NSMutableSet *)v3;

    objc_msgSend(MEMORY[0x1E0CFD9E8], "vui_defaultBag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDEA8]), "initWithBag:", v5);
    _os_feature_enabled_impl();
    objc_msgSend(v6, "setPurchaseTaskClass:", objc_opt_class());
    objc_msgSend(v6, "setDelegate:", v2);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFDEA0]), "initWithConfiguration:", v6);
    purchaseUIQueue = v2->_purchaseUIQueue;
    v2->_purchaseUIQueue = (AMSUIPurchaseQueue *)v7;

    v9 = (SSEventMonitor *)objc_alloc_init(MEMORY[0x1E0DAF520]);
    eventMonitor = v2->_eventMonitor;
    v2->_eventMonitor = v9;

    -[SSEventMonitor setDelegate:](v2->_eventMonitor, "setDelegate:", v2);
  }
  return v2;
}

- (void)enqueuePurchase:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD aBlock[5];
  id v23;
  _QWORD v24[4];
  id v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[VUIPurchaser setInterruptedPurchaseRequest:](self, "setInterruptedPurchaseRequest:", v7);
  objc_msgSend(v7, "purchase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v9;
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - enqueue purchase %@", buf, 0xCu);
  }

  v11 = _Block_copy(v6);
  v12 = (void *)_completion;
  _completion = (uint64_t)v11;

  -[VUIPurchaser purchaseUIQueue](self, "purchaseUIQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enquePurchases:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __47__VUIPurchaser_enqueuePurchase_withCompletion___block_invoke;
  v24[3] = &unk_1E9F9E5B8;
  v17 = v6;
  v25 = v17;
  objc_msgSend(v15, "addErrorBlock:", v24);
  aBlock[0] = v16;
  aBlock[1] = 3221225472;
  aBlock[2] = __47__VUIPurchaser_enqueuePurchase_withCompletion___block_invoke_17;
  aBlock[3] = &unk_1E9F9E5E0;
  aBlock[4] = self;
  v23 = v17;
  v18 = v17;
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __47__VUIPurchaser_enqueuePurchase_withCompletion___block_invoke_19;
  v20[3] = &unk_1E9F9E608;
  v21 = _Block_copy(aBlock);
  v19 = v21;
  objc_msgSend(v15, "addSuccessBlock:", v20);

}

void __47__VUIPurchaser_enqueuePurchase_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - purchase failed %@", (uint8_t *)&v6, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __47__VUIPurchaser_enqueuePurchase_withCompletion___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setInterruptedPurchaseRequest:", 0);
  objc_msgSend(v3, "purchase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - purchase succeeded %@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __47__VUIPurchaser_enqueuePurchase_withCompletion___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)postCrossProcessNotificationWithBuyParams:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("VUIStoreAcquisitionCrossProcessNotificationKeyError"));
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, CFSTR("VUIStoreAcquisitionCrossProcessNotificationKeyBuyParams"));
  VUIDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - Posting VUIStoreAcquisitionCrossProcessNotification with buy params: %@, error: %@", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "vui_postNotificationName:object:userInfo:", CFSTR("com.apple.VideosUI.StoreAcquisitionCrossProcessNotification"), 0, v8);

}

- (BOOL)isPurchaseInProgress
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = -[NSMutableSet count](self->_purchasingParamsSet, "count");
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = v2;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - isPurchaseInProgress: %ld", (uint8_t *)&v5, 0xCu);
  }

  return v2 != 0;
}

- (BOOL)isPurchasing:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  const char *v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSMutableSet containsObject:](self->_purchasingParamsSet, "containsObject:", v4);
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "Not Purchasing";
    if (v5)
      v7 = "Purchasing";
    v9 = 136315394;
    v10 = v7;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - %s: %@", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (void)rememberPurchasing:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - rememberPurchasing: %@", (uint8_t *)&v6, 0xCu);
  }

  -[NSMutableSet addObject:](self->_purchasingParamsSet, "addObject:", v4);
}

- (void)forgetPurchasing:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - forgetPurchasing: %@", (uint8_t *)&v6, 0xCu);
  }

  -[NSMutableSet removeObject:](self->_purchasingParamsSet, "removeObject:", v4);
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  VUIDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "logKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - handle auth request %@ for purchase %@", buf, 0x16u);

  }
  v16 = MEMORY[0x1E0C809B0];
  v17 = __62__VUIPurchaser_purchase_handleAuthenticateRequest_completion___block_invoke;
  v18 = &unk_1E9F99D58;
  v19 = v8;
  v20 = v9;
  v13 = (void *)MEMORY[0x1E0CB3978];
  v14 = v9;
  v15 = v8;
  if (objc_msgSend(v13, "isMainThread", v16, 3221225472))
    v17((uint64_t)&v16);
  else
    dispatch_async(MEMORY[0x1E0C80D38], &v16);

}

void __62__VUIPurchaser_purchase_handleAuthenticateRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  +[VUIApplicationRouter topMostVisibleViewController](VUIApplicationRouter, "topMostVisibleViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDDF0]), "initWithRequest:presentingViewController:", *(_QWORD *)(a1 + 32), v2);
  objc_msgSend(v3, "performAuthentication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__VUIPurchaser_purchase_handleAuthenticateRequest_completion___block_invoke_2;
  v5[3] = &unk_1E9F9B350;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "addFinishBlock:", v5);

}

void __62__VUIPurchaser_purchase_handleAuthenticateRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "authenticationResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - finished auth request: %@, %@", (uint8_t *)&v10, 0x16u);

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  VUIDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "logKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - handle dialog request %@ for purchase %@", buf, 0x16u);

  }
  v16 = MEMORY[0x1E0C809B0];
  v17 = __56__VUIPurchaser_purchase_handleDialogRequest_completion___block_invoke;
  v18 = &unk_1E9F99D58;
  v19 = v8;
  v20 = v9;
  v13 = (void *)MEMORY[0x1E0CB3978];
  v14 = v9;
  v15 = v8;
  if (objc_msgSend(v13, "isMainThread", v16, 3221225472))
    v17((uint64_t)&v16);
  else
    dispatch_async(MEMORY[0x1E0C80D38], &v16);

}

void __56__VUIPurchaser_purchase_handleDialogRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  +[VUIApplicationRouter topMostVisibleViewController](VUIApplicationRouter, "topMostVisibleViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDDE0]), "initWithRequest:presentingViewController:", *(_QWORD *)(a1 + 32), v2);
  objc_msgSend(v3, "present");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__VUIPurchaser_purchase_handleDialogRequest_completion___block_invoke_2;
  v5[3] = &unk_1E9F9C668;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "addFinishBlock:", v5);

}

void __56__VUIPurchaser_purchase_handleDialogRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "selectedActionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locateActionWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "style");

  VUIDefaultLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134218498;
    v15 = v10;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - finished dialog with actionStyle %ld for request: %@, %@", (uint8_t *)&v14, 0x20u);
  }

  if ((unint64_t)(v10 - 1) <= 1)
  {
    VUIDefaultLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - User canceled purchase dialog", (uint8_t *)&v14, 2u);
    }

  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);

}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  VUIDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "logKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - handle engagement request %@ for purchase %@", buf, 0x16u);

  }
  v16 = MEMORY[0x1E0C809B0];
  v17 = __60__VUIPurchaser_purchase_handleEngagementRequest_completion___block_invoke;
  v18 = &unk_1E9F99D58;
  v19 = v8;
  v20 = v9;
  v13 = (void *)MEMORY[0x1E0CB3978];
  v14 = v9;
  v15 = v8;
  if (objc_msgSend(v13, "isMainThread", v16, 3221225472))
    v17((uint64_t)&v16);
  else
    dispatch_async(MEMORY[0x1E0C80D38], &v16);

}

void __60__VUIPurchaser_purchase_handleEngagementRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[VUIApplicationRouter topMostVisibleViewController](VUIApplicationRouter, "topMostVisibleViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CFD9E8], "vui_defaultBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDE60]), "initWithRequest:bag:presentingViewController:", *(_QWORD *)(a1 + 32), v2, v5);
  objc_msgSend(v3, "presentEngagement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addFinishBlock:", *(_QWORD *)(a1 + 40));

}

- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  -[VUIPurchaser purchase:handleAuthenticateRequest:completion:](self, "purchase:handleAuthenticateRequest:completion:", a4, a3, a6);
}

- (void)handleDialogRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  -[VUIPurchaser purchase:handleDialogRequest:completion:](self, "purchase:handleDialogRequest:completion:", a4, a3, a6);
}

- (void)handleEngagementRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  -[VUIPurchaser purchase:handleEngagementRequest:completion:](self, "purchase:handleEngagementRequest:completion:", a4, a3, a6);
}

- (void)setInterruptedPurchaseRequest:(id)a3
{
  VUIPurchaseRequest *v5;
  VUIPurchaser *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (VUIPurchaseRequest *)a3;
  v6 = self;
  objc_sync_enter(v6);
  if (v6->_interruptedPurchaseRequest != v5)
  {
    if (v5)
    {
      VUIDefaultLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[VUIPurchaseRequest purchase](v5, "purchase");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uniqueIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v9;
        _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - Remember request [%@] for interrupted case", (uint8_t *)&v12, 0xCu);

      }
    }
    else
    {
      VUIDefaultLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[VUIPurchaseRequest purchase](v6->_interruptedPurchaseRequest, "purchase");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uniqueIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v11;
        _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - Forget request [%@] for interrupted case", (uint8_t *)&v12, 0xCu);

      }
    }

    objc_storeStrong((id *)&v6->_interruptedPurchaseRequest, a3);
  }
  objc_sync_exit(v6);

}

- (VUIPurchaseRequest)interruptedPurchaseRequest
{
  VUIPurchaser *v2;
  VUIPurchaseRequest *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_interruptedPurchaseRequest;
  objc_sync_exit(v2);

  return v3;
}

- (void)didCompleteInterruptedBuyWithResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  id v28;
  void *v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v31 = (uint64_t)v6;
    v32 = 2112;
    v33 = (uint64_t)v7;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - Received interrupted buy completion event [%@], error: %@", buf, 0x16u);
  }

  -[VUIPurchaseRequest purchase](self->_interruptedPurchaseRequest, "purchase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "buyParams");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIPurchaser _getAdamIdFromBuyParams:](self, "_getAdamIdFromBuyParams:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = objc_msgSend(v12, "longLongValue");
    objc_msgSend(v6, "vui_dictionaryForKey:", CFSTR("metrics"));
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject vui_arrayForKey:](v15, "vui_arrayForKey:", CFSTR("itemIds"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v16 = objc_claimAutoreleasedReturnValue();
    v28 = v7;
    if (v16)
    {
      v17 = (void *)v16;
      v29 = 0;
      v18 = 0;
    }
    else
    {
      objc_msgSend(v6, "vui_arrayForKey:", CFSTR("songList"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "vui_numberForKey:", CFSTR("songId"));
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v17 = (void *)v20;
        v29 = v19;
      }
      else
      {
        objc_msgSend(v6, "vui_arrayForKey:", CFSTR("app-list"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "vui_numberForKey:", CFSTR("item-id"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v21;
        v18 = v22;
      }
    }
    v23 = objc_msgSend(v17, "longLongValue");
    VUIDefaultLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v31 = v14;
      v32 = 2048;
      v33 = v23;
      _os_log_impl(&dword_1D96EE000, v24, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - saved interrupted buy [%li], incoming buy [%li] ", buf, 0x16u);
    }

    VUIDefaultLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    if (v23 && v14 && v14 == v23)
    {
      if (v26)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v25, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - Interrupted buy completed!", buf, 2u);
      }

      v7 = v28;
      -[VUIPurchaseRequest handleRequestCompletionWithResult:andError:](self->_interruptedPurchaseRequest, "handleRequestCompletionWithResult:andError:", v6, v28);
    }
    else
    {
      if (v26)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v25, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - Not the buy completion for which we were interrupted", buf, 2u);
      }

      v7 = v28;
    }

  }
  else
  {
    VUIDefaultLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - No saved interrupted purchase request", buf, 2u);
    }
  }

}

- (id)_getAdamIdFromBuyParams:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v4, "setQuery:", v3);
    objc_msgSend(v4, "queryItems");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v10, "name", (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("salableAdamId"));

          if ((v12 & 1) != 0)
          {
            objc_msgSend(v10, "value");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_12:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)eventMonitor:(id)a3 receivedEventWithName:(id)a4 userInfo:(id)a5
{
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  BOOL v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _BOOL4 v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  NSObject *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  _BOOL4 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  VUIDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v7;
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - Received SS event [%@]", buf, 0xCu);
  }

  if (-[NSObject isEqualToString:](v7, "isEqualToString:", *MEMORY[0x1E0DAFA38]))
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("response"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      VUIDefaultLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - No payload in ss purchase completion event", buf, 2u);
      }
      goto LABEL_19;
    }
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, &v33);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v33;
    if (v12)
    {
      v13 = v12;
      VUIDefaultLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v13;
        _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - Failed to unarchive data with error: %@", buf, 0xCu);
      }

      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      VUIDefaultLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v16 = "VUIPurchaser - ss event payload has invalid response type";
        goto LABEL_17;
      }
LABEL_18:

LABEL_19:
      goto LABEL_20;
    }
    -[NSObject error](v11, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      VUIDefaultLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v16 = "VUIPurchaser - SS event success notification receieved an unexpected error";
LABEL_17:
        _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    v17 = -[VUIPurchaser _isInterruptedPurchaseFulfilledBySSPurchaseResponse:](self, "_isInterruptedPurchaseFulfilledBySSPurchaseResponse:", v11);
    VUIDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (!v17)
    {
      if (!v18)
        goto LABEL_18;
      *(_WORD *)buf = 0;
      v16 = "VUIPurchaser - Not the buy completion for which we were interrupted";
      goto LABEL_17;
    }
    if (v18)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - Interrupted buy completed!", buf, 2u);
    }

    -[NSObject URLResponse](v11, "URLResponse");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bodyData");
    v20 = objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v32 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v20, 0, 0, &v32);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v32;
    }
    else
    {
      v21 = 0;
      v22 = 0;
    }
    -[NSObject error](v11, "error");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v21)
      v25 = 0;
    else
      v25 = v22;
    if (v23)
      v25 = (void *)v23;
    v13 = v25;

    -[NSObject domain](v13, "domain");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)v20;
    if ((objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0DDC120]) & 1) != 0)
    {
      v27 = -[NSObject code](v13, "code");

      if (v27 == 16)
      {
        v28 = 1;
        goto LABEL_43;
      }
    }
    else
    {

    }
    objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0DDC1D8]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v29 != 0;

    if (!v22 && !v13 && !v29 && v21)
    {
      -[VUIPurchaseRequest handleRequestCompletionWithResult:andError:](self->_interruptedPurchaseRequest, "handleRequestCompletionWithResult:andError:", v21, 0);
      v22 = 0;
LABEL_46:

      goto LABEL_18;
    }
LABEL_43:
    VUIDefaultLogObject();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v35 = v13;
      v36 = 2112;
      v37 = v22;
      v38 = 1024;
      v39 = v28;
      _os_log_impl(&dword_1D96EE000, v30, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - Error finishing interrupted purchse: [%@] plist error [%@] Was cancelled [%d]", buf, 0x1Cu);
    }

    -[VUIPurchaser setInterruptedPurchaseRequest:](self, "setInterruptedPurchaseRequest:", 0);
    goto LABEL_46;
  }
LABEL_20:

}

- (BOOL)_isInterruptedPurchaseFulfilledBySSPurchaseResponse:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  const char *v15;
  int v17;
  NSObject *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "purchase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      v15 = "VUIPurchaser - Interrupted purchase not valid ss response";
LABEL_13:
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v17, 2u);
    }
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  if (!self->_interruptedPurchaseRequest)
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      v15 = "VUIPurchaser - No interrupted purchase request";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  objc_msgSend(v4, "buyParameters");
  v6 = objc_claimAutoreleasedReturnValue();
  -[VUIPurchaseRequest purchase](self->_interruptedPurchaseRequest, "purchase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buyParams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  VUIDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412546;
    v18 = v6;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIPurchaser - buyParams [%@], interruptedBuyParams[%@] ", (uint8_t *)&v17, 0x16u);
  }

  -[VUIPurchaser _getAdamIdFromBuyParams:](self, "_getAdamIdFromBuyParams:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPurchaser _getAdamIdFromBuyParams:](self, "_getAdamIdFromBuyParams:", v9);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = 0;
  if (v11 && v12)
    v14 = objc_msgSend(v11, "isEqualToString:", v12);

LABEL_15:
  return v14;
}

- (NSMutableSet)purchasingParamsSet
{
  return self->_purchasingParamsSet;
}

- (void)setPurchasingParamsSet:(id)a3
{
  objc_storeStrong((id *)&self->_purchasingParamsSet, a3);
}

- (AMSUIPurchaseQueue)purchaseUIQueue
{
  return self->_purchaseUIQueue;
}

- (void)setPurchaseUIQueue:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseUIQueue, a3);
}

- (SSEventMonitor)eventMonitor
{
  return self->_eventMonitor;
}

- (void)setEventMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_eventMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventMonitor, 0);
  objc_storeStrong((id *)&self->_purchaseUIQueue, 0);
  objc_storeStrong((id *)&self->_purchasingParamsSet, 0);
  objc_storeStrong((id *)&self->_interruptedPurchaseRequest, 0);
}

@end
