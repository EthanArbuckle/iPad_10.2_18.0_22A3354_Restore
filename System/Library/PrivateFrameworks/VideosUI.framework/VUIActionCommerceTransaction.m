@implementation VUIActionCommerceTransaction

- (VUIActionCommerceTransaction)initWithActionRef:(id)a3 contextData:(id)a4 appContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  VUIActionCommerceTransaction *v11;
  VUIActionCommerceTransaction *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VUIActionCommerceTransaction;
  v11 = -[VUIActionCommerceTransaction init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    -[VUIActionCommerceTransaction setCommerceActionRef:](v11, "setCommerceActionRef:", v8);
    objc_storeStrong((id *)&v12->_contextData, a4);
    objc_storeWeak((id *)&v12->_appContext, v10);
    +[VUIActionCommerceInterruptedTransactionManager sharedInstance](VUIActionCommerceInterruptedTransactionManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLastInterruptedOfferDetails:", 0);

  }
  return v12;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);
  VUITransactionOffer *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint8_t v12[16];

  v5 = (void (**)(id, _QWORD))a4;
  v6 = -[VUITransactionOffer initWithDictionary:]([VUITransactionOffer alloc], "initWithDictionary:", self->_contextData);
  WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  +[VUIPurchaser sharedInstance](VUIPurchaser, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITransactionOffer buyParams](v6, "buyParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isPurchasing:", v9);

  if (v10)
  {
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "PurchaseAction - performWithTargetResponder: ending early because purchase with buyParams already exists", v12, 2u);
    }

    if (v5)
      v5[2](v5, 0);
  }
  else
  {
    -[VUIActionCommerceTransaction _startTransactionOfOffer:withAppContext:andCompletionHandler:](self, "_startTransactionOfOffer:withAppContext:andCompletionHandler:", v6, WeakRetained, v5);
  }

}

- (id)_preflightManagerForTransactionOffer:(id)a3 purchaseType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  VUIVideosPlayable *v17;

  v5 = a3;
  +[VUIPreflightManager defaultPreflightManager](VUIPreflightManager, "defaultPreflightManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIApplicationRouter topPresentedViewController](VUIApplicationRouter, "topPresentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appWindow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "rootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "setPresentingController:", v7);
  objc_msgSend(v6, "setRestrictionsCheckType:", 2);
  if (v5)
  {
    objc_msgSend(v5, "videosPlayables");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v5, "videosPlayables");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "offer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("playbackMetadata"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11
        || (objc_msgSend(v11, "objectForKey:", CFSTR("ratingDomain")),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v16,
            !v16))
      {
        if (a4 == 1)
          objc_msgSend(v6, "setIsSubscriptionPurchaseWithoutPlayback:", 1);
        goto LABEL_7;
      }
      v17 = [VUIVideosPlayable alloc];
      v12 = -[VUIVideosPlayable initWithDictionary:andMetadataDictionary:](v17, "initWithDictionary:andMetadataDictionary:", MEMORY[0x1E0C9AA70], v11);
    }
    v13 = (void *)v12;
    objc_msgSend(v6, "setVideosPlayable:", v12);

LABEL_7:
  }

  return v6;
}

- (void)_startTransactionOfOffer:(id)a3 withAppContext:(id)a4 andCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  int64_t v11;
  _BOOL4 v12;
  char v13;
  NSObject *v14;
  NSString *commerceActionRef;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  int64_t v28;
  char v29;
  BOOL v30;
  uint8_t buf[4];
  NSString *v32;
  __int16 v33;
  int64_t v34;
  __int16 v35;
  _BOOL4 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = +[VUIPurchaseRequest getPurchaseTypeFromActionRef:](VUIPurchaseRequest, "getPurchaseTypeFromActionRef:", self->_commerceActionRef);
  v12 = +[VUIPurchaseRequest shouldPlayWhenDoneForActionRef:](VUIPurchaseRequest, "shouldPlayWhenDoneForActionRef:", self->_commerceActionRef);
  v13 = objc_msgSend(v8, "initiateFamilySetup");
  VUIDefaultLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    commerceActionRef = self->_commerceActionRef;
    *(_DWORD *)buf = 138412802;
    v32 = commerceActionRef;
    v33 = 2048;
    v34 = v11;
    v35 = 1024;
    v36 = v12;
    _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "PurchaseAction - _amsStartPurchaseFlowForOffer: [%@], type: %ld, shouldPlayWhenDone: %d", buf, 0x1Cu);
  }

  objc_msgSend(v8, "buyParams");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIPurchaser sharedInstance](VUIPurchaser, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rememberPurchasing:", v16);

  -[VUIActionCommerceTransaction _preflightManagerForTransactionOffer:purchaseType:](self, "_preflightManagerForTransactionOffer:purchaseType:", v8, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke;
  v23[3] = &unk_1E9FA4FF0;
  v23[4] = self;
  v24 = v8;
  v27 = v10;
  v28 = v11;
  v25 = v16;
  v26 = v9;
  v29 = v13;
  v30 = v12;
  v19 = v9;
  v20 = v10;
  v21 = v16;
  v22 = v8;
  objc_msgSend(v18, "preflightWithOptions:completion:", 1, v23);

}

void __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  VUIPurchaseRequest *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  __int16 v15;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_notifyDidStartPurchaseType:transactionOffer:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));
  if ((a2 & 1) != 0)
  {
    v4 = -[VUIPurchaseRequest initWithBuyParams:ofPurchaseType:]([VUIPurchaseRequest alloc], "initWithBuyParams:ofPurchaseType:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_93;
    v8[3] = &unk_1E9FA4FC8;
    v9 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 40);
    v5 = *(id *)(a1 + 64);
    v11 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 72);
    v13 = v5;
    v14 = v6;
    v12 = *(id *)(a1 + 56);
    v15 = *(_WORD *)(a1 + 80);
    -[VUIPurchaseRequest enqueueWithCompletion:](v4, "enqueueWithCompletion:", v8);

  }
  else
  {
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "PurchaseAction - Purchase restricted", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRANSACTION_RESTRICTED_CONTENT"), 0, 0);
    v4 = (VUIPurchaseRequest *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_notifyDidEndPurchaseType:transactionOffer:withError:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), v4);
  }

}

void __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_93(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  int8x16_t v26;
  _QWORD block[2];
  void (*v28)(uint64_t);
  void *v29;
  int8x16_t v30;
  id v31;
  id v32;
  uint64_t v33;
  char v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[VUIPurchaser sharedInstance](VUIPurchaser, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "forgetPurchasing:", *(_QWORD *)(a1 + 32));

  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_93_cold_1((uint64_t)v6, v9);

    objc_msgSend(*(id *)(a1 + 40), "videosPlayables");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sharedWatchId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "groupActivitiesManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isSharedWatchIdValidForCurrentSession:", v16);

    VUIDefaultLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v21)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, "PurchaseAction - Leaving session due to failed purchase flow", buf, 2u);
      }

      +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
      v20 = objc_claimAutoreleasedReturnValue();
      -[NSObject groupActivitiesManager](v20, "groupActivitiesManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "leaveSession");

    }
    else if (v21)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, "PurchaseAction - Not leaving session because the active session is different than the upsell session", buf, 2u);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    v28 = __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_95;
    v29 = &unk_1E9FA4FA0;
    v23 = *(id *)(a1 + 64);
    v24 = *(_QWORD *)(a1 + 72);
    v32 = v23;
    v33 = v24;
    v26 = *(int8x16_t *)(a1 + 40);
    v25 = (id)v26.i64[0];
    v30 = vextq_s8(v26, v26, 8uLL);
    v31 = v6;
    v34 = 0;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v28((uint64_t)block);
    else
      dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v5;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "PurchaseAction - Purchase server response [%@]", buf, 0xCu);
    }

    v10 = *(_QWORD *)(a1 + 64);
    v12 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 56);
    if (*(_QWORD *)(a1 + 72) == 1)
      objc_msgSend(v11, "_handleSubscriptionCompletionForOffer:appContext:shouldInitiateFamilySetup:serverResponse:completionHandler:", v12, v13, *(unsigned __int8 *)(a1 + 80), v5, v10);
    else
      objc_msgSend(v11, "_handleBuyCompletionForOffer:appContext:shouldPlayWhenDone:serverResponse:completionHandler:", v12, v13, *(unsigned __int8 *)(a1 + 81), v5, v10);
  }

}

void __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_95(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  void *v12;
  _QWORD v13[4];
  void *v14;
  _QWORD aBlock[5];
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_2;
  aBlock[3] = &unk_1E9FA4F78;
  v3 = *(id *)(a1 + 56);
  v4 = *(void **)(a1 + 40);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 64);
  v18 = v3;
  v19 = v5;
  v16 = v4;
  v17 = *(id *)(a1 + 48);
  v6 = _Block_copy(aBlock);
  v7 = v6;
  if (*(_BYTE *)(a1 + 72))
  {
    v13[0] = v2;
    v13[1] = 3221225472;
    v13[2] = __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_3;
    v13[3] = &unk_1E9F98E68;
    v8 = &v14;
    v14 = v6;
    v9 = v6;
    +[VUIApplicationRouter dismissOrPopLastViewControllerWithCompletion:](VUIApplicationRouter, "dismissOrPopLastViewControllerWithCompletion:", v13);
  }
  else
  {
    v11[0] = v2;
    v11[1] = 3221225472;
    v11[2] = __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_4;
    v11[3] = &unk_1E9F98E68;
    v8 = &v12;
    v12 = v6;
    v10 = v6;
    +[VUIApplicationRouter dismissOrPopViewControllerWithId:completion:](VUIApplicationRouter, "dismissOrPopViewControllerWithId:completion:", CFSTR("CommerceViewControllerIdentifier"), v11);
  }

}

uint64_t __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_2(uint64_t result)
{
  _QWORD *v1;

  if (*(_QWORD *)(result + 56))
  {
    v1 = (_QWORD *)result;
    objc_msgSend(*(id *)(result + 32), "_notifyDidEndPurchaseType:transactionOffer:withError:", *(_QWORD *)(result + 64), v1[5], v1[6]);
    return (*(uint64_t (**)(void))(v1[7] + 16))();
  }
  return result;
}

uint64_t __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_handleBuyCompletionForOffer:(id)a3 appContext:(id)a4 shouldPlayWhenDone:(BOOL)a5 serverResponse:(id)a6 completionHandler:(id)a7
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD block[2];
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  VUIActionCommerceTransaction *v18;
  id v19;

  v9 = a3;
  v10 = a7;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v15 = __124__VUIActionCommerceTransaction__handleBuyCompletionForOffer_appContext_shouldPlayWhenDone_serverResponse_completionHandler___block_invoke;
  v16 = &unk_1E9F99778;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v11 = (void *)MEMORY[0x1E0CB3978];
  v12 = v10;
  v13 = v9;
  if (objc_msgSend(v11, "isMainThread"))
    v15((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __124__VUIActionCommerceTransaction__handleBuyCompletionForOffer_appContext_shouldPlayWhenDone_serverResponse_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  int8x16_t v6;
  _QWORD v7[4];
  int8x16_t v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CC2358], "sharedCloudController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateJaliscoMediaLibraryWithReason:completionHandler:", 1, 0);

  +[VUIPurchaser sharedInstance](VUIPurchaser, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "buyParams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postCrossProcessNotificationWithBuyParams:error:", v4, 0);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __124__VUIActionCommerceTransaction__handleBuyCompletionForOffer_appContext_shouldPlayWhenDone_serverResponse_completionHandler___block_invoke_2;
  v7[3] = &unk_1E9F99778;
  v6 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  v9 = *(id *)(a1 + 48);
  +[VUIApplicationRouter dismissOrPopViewControllerWithId:completion:](VUIApplicationRouter, "dismissOrPopViewControllerWithId:completion:", CFSTR("CommerceViewControllerIdentifier"), v7);

}

void __124__VUIActionCommerceTransaction__handleBuyCompletionForOffer_appContext_shouldPlayWhenDone_serverResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[16];

  objc_msgSend(*(id *)(a1 + 32), "_notifyDidEndPurchaseType:transactionOffer:withError:", 0, *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 40), "sharedWatchUrl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject groupActivitiesManager](v3, "groupActivitiesManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleCommerceSharedWatchUrl:", v2);

  }
  else
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "PurchaseAction - BuyRentFlow:: GroupActivity no shared watch url!", v6, 2u);
    }
  }

  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);

}

- (void)_handleSubscriptionCompletionForOffer:(id)a3 appContext:(id)a4 shouldInitiateFamilySetup:(BOOL)a5 serverResponse:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  VUIActionCommerceTransaction *v21;
  id v22;
  id v23;
  BOOL v24;

  v11 = a3;
  v12 = a4;
  v13 = a7;
  objc_msgSend(MEMORY[0x1E0DC8788], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke;
  v19[3] = &unk_1E9FA5090;
  v20 = v11;
  v21 = self;
  v22 = v12;
  v23 = v13;
  v24 = a5;
  v15 = v12;
  v16 = v13;
  v17 = v11;
  objc_msgSend(v14, "fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:", 0, 3, 0, v19);

  objc_msgSend(MEMORY[0x1E0DC8858], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fetchSubscriptionData:completion:", 1, &__block_literal_global_160);

}

void __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD block[2];
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  char v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "PurchaseAction - UTS Subscription state refreshed. error: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v10 = __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke_100;
  v11 = &unk_1E9FA5068;
  v12 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v15 = v6;
  v13 = v7;
  v14 = v8;
  v16 = *(_BYTE *)(a1 + 64);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v10((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke_100(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;
  id v8;
  id v9;
  char v10;

  +[VUIPurchaser sharedInstance](VUIPurchaser, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "buyParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postCrossProcessNotificationWithBuyParams:error:", v3, 0);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke_2;
  v6[3] = &unk_1E9F9D690;
  v9 = *(id *)(a1 + 56);
  v5 = *(int8x16_t *)(a1 + 32);
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  v8 = *(id *)(a1 + 48);
  v10 = *(_BYTE *)(a1 + 64);
  +[VUIApplicationRouter dismissOrPopViewControllerWithId:completion:](VUIApplicationRouter, "dismissOrPopViewControllerWithId:completion:", CFSTR("CommerceViewControllerIdentifier"), v6);

}

void __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  char v11;

  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_notifyDidEndPurchaseType:transactionOffer:withError:", 1, *(_QWORD *)(a1 + 40), 0);
    v3 = *(void **)(a1 + 32);
    v2 = *(void **)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke_3;
    v6[3] = &unk_1E9FA5040;
    v7 = v2;
    v4 = *(id *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 32);
    v8 = v4;
    v9 = v5;
    v11 = *(_BYTE *)(a1 + 64);
    v10 = *(id *)(a1 + 56);
    objc_msgSend(v3, "_showUIConfirmationForSubTransaction:completion:", v7, v6);

  }
}

uint64_t __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  VUIFamilyInviteManager *v21;
  void *v22;
  NSObject *v23;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPostPlayActive");

  objc_msgSend(*(id *)(a1 + 32), "sharedWatchUrl");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    if (v3)
    {
      -[NSObject vui_URLByAddingQueryParamWithName:value:](v4, "vui_URLByAddingQueryParamWithName:value:", CFSTR("postPlay"), CFSTR("true"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "vui_URLByAddingQueryParamWithName:value:", CFSTR("binge"), CFSTR("true"));
      v5 = objc_claimAutoreleasedReturnValue();

    }
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "groupActivitiesManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "handleCommerceSharedWatchUrl:", v5);

  }
  else
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "PurchaseAction - SubscriptionFlow:: GroupActivity no shared watch url!", buf, 2u);
    }
    v9 = 0;
  }

  if ((v9 & 1) == 0 && ((v3 ^ 1) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "videosPlayables");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "videosPlayables");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      VUIDefaultLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "canonicalID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v30 = v15;
        _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "PurchaseAction - Resolving playable for id %@", buf, 0xCu);

      }
      objc_msgSend(v13, "canonicalID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "showCanonicalID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mediaType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke_105;
      v25[3] = &unk_1E9FA5018;
      v19 = *(id *)(a1 + 40);
      v20 = *(_QWORD *)(a1 + 48);
      v26 = v19;
      v27 = v20;
      v28 = v13;
      v21 = v13;
      +[VUIPlayableResolver playableForCanonicalID:showID:mediaType:completion:](VUIPlayableResolver, "playableForCanonicalID:showID:mediaType:completion:", v16, v17, v18, v25);

      v22 = v26;
LABEL_18:

      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }
  if (*(_BYTE *)(a1 + 64))
  {
    VUIDefaultLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v23, OS_LOG_TYPE_DEFAULT, "PurchaseAction - SubscriptionFlow showing family invite manager", buf, 2u);
    }

    v21 = objc_alloc_init(VUIFamilyInviteManager);
    objc_msgSend(*(id *)(a1 + 32), "buyParams");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIFamilyInviteManager presentFamilySetupScreenWithBuyParams:](v21, "presentFamilySetupScreenWithBuyParams:", v22);
    goto LABEL_18;
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke_105(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  VUIMediaInfo *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "canonicalID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v9;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "PurchaseAction - Finished resolving playable for id %@", buf, 0xCu);

    }
    v10 = [VUIMediaInfo alloc];
    v21 = v5;
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = v5;
    objc_msgSend(v11, "arrayWithObjects:count:", &v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[VUIMediaInfo initWithPlaybackContext:videosPlayables:imageProxies:storeDictionary:](v10, "initWithPlaybackContext:videosPlayables:imageProxies:storeDictionary:", 5, v13, 0, 0);
    -[NSObject setAppContext:](v8, "setAppContext:", *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setUserPlaybackInitiationDate:openURLCompletionDate:](v8, "setUserPlaybackInitiationDate:openURLCompletionDate:", v14, 0);

    -[NSObject setIntent:](v8, "setIntent:", 1);
    v15 = *(_QWORD *)(a1 + 40);
    if (v15)
      v16 = objc_msgSend(*(id *)(v15 + 8), "isEqualToString:", CFSTR("actionRefRentWatchNow"));
    else
      v16 = 0;
    objc_msgSend(v12, "sharedWatchId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "groupActivitiesManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isSharedWatchIdValidForCurrentSession:", v17);

    +[VUIActionPlay playMediaInfo:watchType:isRentAndWatchNow:](VUIActionPlay, "playMediaInfo:watchType:isRentAndWatchNow:", v8, v20, v16);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke_105_cold_1(a1, (uint64_t)v6, v8);
  }

}

void __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke_114(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      LOWORD(v10) = 0;
      v7 = "PurchaseAction - SubscriptionFlow successfully refreshed subscription store";
      v8 = v5;
      v9 = 2;
LABEL_6:
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v6)
  {
    v10 = 138412290;
    v11 = v4;
    v7 = "PurchaseAction - SubscriptionFlow error refreshing subscriptions from finance: %@";
    v8 = v5;
    v9 = 12;
    goto LABEL_6;
  }

}

- (void)_showUIConfirmationForSubTransaction:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t *);
  void *v18;
  VUIActionCommerceTransaction *v19;
  id v20;
  id v21;
  id v22;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "notificationTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  objc_msgSend(v7, "notificationBody");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v10, "copy");
  v16 = MEMORY[0x1E0C809B0];
  v17 = __80__VUIActionCommerceTransaction__showUIConfirmationForSubTransaction_completion___block_invoke;
  v18 = &unk_1E9F997A0;
  v19 = self;
  v20 = v9;
  v21 = v11;
  v22 = v6;
  v12 = (void *)MEMORY[0x1E0CB3978];
  v13 = v6;
  v14 = v11;
  v15 = v9;
  if (objc_msgSend(v12, "isMainThread", v16, 3221225472))
    v17(&v16);
  else
    dispatch_async(MEMORY[0x1E0C80D38], &v16);

}

uint64_t __80__VUIActionCommerceTransaction__showUIConfirmationForSubTransaction_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend((id)objc_opt_class(), "displayConfirmationUIWithTitle:andBody:completion:", a1[5], a1[6], a1[7]);
}

- (void)_notifyDidStartPurchaseType:(int64_t)a3 transactionOffer:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint8_t buf[4];
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = a3;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "PurchaseAction - _notifyPurchaseDidStart, type:%ld", buf, 0xCu);
  }

  objc_msgSend(v5, "buyParams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIPurchaser sharedInstance](VUIPurchaser, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rememberPurchasing:", v7);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("TransactionID");
  v12 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("VUIPurchaseOrSubscribeRequestDidStartNotification"), 0, v10);

}

- (void)_notifyDidEndPurchaseType:(int64_t)a3 transactionOffer:(id)a4 withError:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString **v14;
  __CFString *v15;
  void *v16;
  int v17;
  int64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  VUIDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 134218242;
    v18 = a3;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "PurchaseAction - _notifyPurchaseDidEnd, type:%ld, error:%@", (uint8_t *)&v17, 0x16u);
  }

  objc_msgSend(v7, "buyParams");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIPurchaser sharedInstance](VUIPurchaser, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "forgetPurchasing:", v10);
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("TransactionID"));
  if (v8)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("Error"));
  objc_msgSend(v7, "canonicalIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("CanonicalIDs"));
  v14 = VUIPurchaseRequestDidFinishNotification;
  if (a3 == 1)
    v14 = VUISubscribeRequestDidFinishNotification;
  v15 = *v14;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotificationName:object:userInfo:", v15, 0, v12);

  if (!v8)
    objc_msgSend(v11, "setInterruptedPurchaseRequest:", 0);

}

+ (void)displayConfirmationUIWithTitle:(id)a3 andBody:(id)a4 completion:(id)a5
{
  if (a5)
    (*((void (**)(id))a5 + 2))(a5);
}

+ (void)displayConfirmationUIWithTitle:(id)a3 andBody:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "displayConfirmationUIWithTitle:andBody:completion:", v6, v5, 0);

}

+ (BOOL)isTransactionInProgressForBuyParams:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[VUIPurchaser sharedInstance](VUIPurchaser, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPurchasing:", v3);

  return v5;
}

- (void)_recordLog:(id)a3 withBuyParams:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a4;
  v7 = a3;
  -[VUIActionCommerceTransaction commerceActionRef](self, "commerceActionRef");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("commerce transaction failure - "), "stringByAppendingString:", v8);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9;
  else
    v10 = &stru_1E9FF3598;
  v20[0] = v10;
  v19[0] = CFSTR("message");
  v19[1] = CFSTR("errorCode");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend(v7, "code");

  objc_msgSend(v11, "numberWithLong:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = &stru_1E9FF3598;
  v19[2] = CFSTR("buyParams");
  if (v6)
    v16 = v6;
  else
    v16 = &stru_1E9FF3598;
  v20[1] = v15;
  v20[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "recordLog:", v17);
}

+ (id)extractSalableAdamIDFromBuyParams:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = v3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("&"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "componentsSeparatedByString:", CFSTR("="));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByRemovingPercentEncoding");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "lastObject");
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v13, "stringByRemovingPercentEncoding");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v14, v12);
      LOBYTE(v13) = objc_msgSend(v12, "isEqualToString:", CFSTR("salableAdamId"));

      if ((v13 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_msgSend(v4, "objectForKey:", CFSTR("salableAdamId"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSString)commerceActionRef
{
  return self->_commerceActionRef;
}

- (void)setCommerceActionRef:(id)a3
{
  objc_storeStrong((id *)&self->_commerceActionRef, a3);
}

- (NSDictionary)contextData
{
  return self->_contextData;
}

- (void)setContextData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (VUIAppContext)appContext
{
  return (VUIAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (void)setAppContext:(id)a3
{
  objc_storeWeak((id *)&self->_appContext, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_contextData, 0);
  objc_storeStrong((id *)&self->_commerceActionRef, 0);
}

void __93__VUIActionCommerceTransaction__startTransactionOfOffer_withAppContext_andCompletionHandler___block_invoke_93_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D96EE000, a2, OS_LOG_TYPE_ERROR, "PurchaseAction - Purchase failed: %@", (uint8_t *)&v2, 0xCu);
}

void __140__VUIActionCommerceTransaction__handleSubscriptionCompletionForOffer_appContext_shouldInitiateFamilySetup_serverResponse_completionHandler___block_invoke_105_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 48), "canonicalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1D96EE000, a3, OS_LOG_TYPE_ERROR, "PurchaseAction - Failed to resolve playable for id %@, with error %@", (uint8_t *)&v6, 0x16u);

}

@end
