@implementation WBSCloudSubscriptionFeatureAvailabilityObserver

- (void)_requestFeatureObjectBlockingQueueUntilResponse:(BOOL)a3
{
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  NSString *featureIdentifier;
  NSString *v9;
  NSObject *queue;
  _QWORD v11[5];
  BOOL v12;
  uint8_t buf[4];
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = -[WBSCloudSubscriptionFeatureAvailabilityObserver _overridenAvailability](self, "_overridenAvailability");
  v6 = WBS_LOG_CHANNEL_PREFIXAppleAccount();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      featureIdentifier = self->_featureIdentifier;
      *(_DWORD *)buf = 138412290;
      v14 = featureIdentifier;
      _os_log_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_INFO, "Found local override for cloud subscription feature %@. Skipping availability lookup.", buf, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      v9 = self->_featureIdentifier;
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_INFO, "Requesting feature availability for cloud subscription feature %@", buf, 0xCu);
    }
    queue = self->_queue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __99__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureObjectBlockingQueueUntilResponse___block_invoke;
    v11[3] = &unk_1E4B2A8E8;
    v12 = a3;
    v11[4] = self;
    dispatch_async(queue, v11);
  }
}

uint64_t __94__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureEligibilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void);

  v2 = a1 + 32;
  v3 = objc_msgSend(*(id *)(a1 + 32), "_overridenAvailability");
  v4 = WBS_LOG_CHANNEL_PREFIXAppleAccount();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __94__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureEligibilityWithCompletionHandler___block_invoke_cold_1(v2, v4, v6, v7, v8, v9, v10, v11);
    v12 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (v5)
      __94__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureEligibilityWithCompletionHandler___block_invoke_cold_2(v2);
    v12 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v12();
}

- (BOOL)_overridenAvailability
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(CFSTR("WBSCloudFeatureOverride."), "stringByAppendingString:", self->_featureIdentifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", v2);

  return v4;
}

- (void)_requestFeatureEligibilityBlockingQueueUntilResponse:(BOOL)a3
{
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  NSString *featureIdentifier;
  NSString *v9;
  NSObject *queue;
  _QWORD v11[5];
  BOOL v12;
  uint8_t buf[4];
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = -[WBSCloudSubscriptionFeatureAvailabilityObserver _overridenAvailability](self, "_overridenAvailability");
  v6 = WBS_LOG_CHANNEL_PREFIXAppleAccount();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      featureIdentifier = self->_featureIdentifier;
      *(_DWORD *)buf = 138412290;
      v14 = featureIdentifier;
      _os_log_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_INFO, "Found local override for cloud subscription feature %@. Skipping eligibility lookup.", buf, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      v9 = self->_featureIdentifier;
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_INFO, "Requesting feature eligibility for cloud subscription feature %@", buf, 0xCu);
    }
    queue = self->_queue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __104__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureEligibilityBlockingQueueUntilResponse___block_invoke;
    v11[3] = &unk_1E4B2A8E8;
    v11[4] = self;
    v12 = a3;
    dispatch_async(queue, v11);
  }
}

void __104__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureEligibilityBlockingQueueUntilResponse___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[5];
  char v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXAppleAccount();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __104__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureEligibilityBlockingQueueUntilResponse___block_invoke_3_cold_1(v7, v5);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    _os_log_impl(&dword_1A3D90000, v7, OS_LOG_TYPE_INFO, "Did receive feature eligibility for cloud subscription feature %@", buf, 0xCu);
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    *(_BYTE *)(v9 + 40) = a2;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v10 = *(NSObject **)(v9 + 8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __104__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureEligibilityBlockingQueueUntilResponse___block_invoke_13;
    v11[3] = &unk_1E4B2A8E8;
    v11[4] = v9;
    v12 = a2;
    dispatch_async(v10, v11);
  }

}

void __104__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureEligibilityBlockingQueueUntilResponse___block_invoke_3_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v5, v6, "Failed to get cloud feature eligibility: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

+ (WBSCloudSubscriptionFeatureAvailabilityObserver)porcupineAvailabilityObserver
{
  if (porcupineAvailabilityObserver_onceToken != -1)
    dispatch_once(&porcupineAvailabilityObserver_onceToken, &__block_literal_global_22);
  return (WBSCloudSubscriptionFeatureAvailabilityObserver *)(id)porcupineAvailabilityObserver_porcupineAvailabilityObserver;
}

void __104__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureEligibilityBlockingQueueUntilResponse___block_invoke(uint64_t a1)
{
  dispatch_block_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 40))
      v2 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &__block_literal_global_11);
    else
      v2 = 0;
    v3 = (void *)MEMORY[0x1E0D116A0];
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(MEMORY[0x1E0CB34D0], "safari_safariApplicationPlatformBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __104__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureEligibilityBlockingQueueUntilResponse___block_invoke_3;
    v7[3] = &unk_1E4B2BD08;
    v7[4] = *(_QWORD *)(a1 + 32);
    v6 = v2;
    v8 = v6;
    objc_msgSend(v3, "getFeatureEligibilityForFeatureWithId:bundleId:completion:", v4, v5, v7);

    if (v6)
      dispatch_block_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  }
}

void __80__WBSCloudSubscriptionFeatureAvailabilityObserver_porcupineAvailabilityObserver__block_invoke()
{
  WBSCloudSubscriptionFeatureAvailabilityObserver *v0;
  void *v1;

  v0 = -[WBSCloudSubscriptionFeatureAvailabilityObserver initWithFeatureIdentifier:]([WBSCloudSubscriptionFeatureAvailabilityObserver alloc], "initWithFeatureIdentifier:", CFSTR("networking.privacy.subscriber"));
  v1 = (void *)porcupineAvailabilityObserver_porcupineAvailabilityObserver;
  porcupineAvailabilityObserver_porcupineAvailabilityObserver = (uint64_t)v0;

}

- (WBSCloudSubscriptionFeatureAvailabilityObserver)initWithFeatureIdentifier:(id)a3
{
  id v4;
  WBSCloudSubscriptionFeatureAvailabilityObserver *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  NSString *featureIdentifier;
  void *v10;
  uint64_t v11;
  FeatureChangeObserver *changeObserverToken;
  NSObject *v13;
  WBSCloudSubscriptionFeatureAvailabilityObserver *v14;
  _QWORD v16[4];
  id v17;
  objc_super v18;
  id location[2];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WBSCloudSubscriptionFeatureAvailabilityObserver;
  v5 = -[WBSCloudSubscriptionFeatureAvailabilityObserver init](&v18, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.WBSCloudSubscriptionFeatureAvailabilityObserver", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    v8 = objc_msgSend(v4, "copy");
    featureIdentifier = v5->_featureIdentifier;
    v5->_featureIdentifier = (NSString *)v8;

    if (!CloudSubscriptionFeaturesLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)location = xmmword_1E4B2BD68;
      v20 = 0;
      CloudSubscriptionFeaturesLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (CloudSubscriptionFeaturesLibraryCore_frameworkLibrary)
    {
      objc_initWeak(location, v5);
      v10 = (void *)MEMORY[0x1E0D116A0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __77__WBSCloudSubscriptionFeatureAvailabilityObserver_initWithFeatureIdentifier___block_invoke;
      v16[3] = &unk_1E4B2BC78;
      objc_copyWeak(&v17, location);
      objc_msgSend(v10, "registerForFeatureChangeNotificationsUsingBlock:", v16);
      v11 = objc_claimAutoreleasedReturnValue();
      changeObserverToken = v5->_changeObserverToken;
      v5->_changeObserverToken = (FeatureChangeObserver *)v11;

      -[WBSCloudSubscriptionFeatureAvailabilityObserver _requestFeatureObjectBlockingQueueUntilResponse:](v5, "_requestFeatureObjectBlockingQueueUntilResponse:", 1);
      -[WBSCloudSubscriptionFeatureAvailabilityObserver _requestFeatureEligibilityBlockingQueueUntilResponse:](v5, "_requestFeatureEligibilityBlockingQueueUntilResponse:", 1);
      objc_destroyWeak(&v17);
      objc_destroyWeak(location);
    }
    else
    {
      v13 = WBS_LOG_CHANNEL_PREFIXAppleAccount();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1A3D90000, v13, OS_LOG_TYPE_INFO, "Running in an environment where CloudSubscriptionFeatures framework is not available.", (uint8_t *)location, 2u);
      }
    }
    v14 = v5;
  }

  return v5;
}

void __99__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureObjectBlockingQueueUntilResponse___block_invoke(uint64_t a1)
{
  dispatch_block_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  if (*(_BYTE *)(a1 + 40))
    v2 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &__block_literal_global_18);
  else
    v2 = 0;
  v3 = (void *)MEMORY[0x1E0D116A0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __99__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureObjectBlockingQueueUntilResponse___block_invoke_3;
  v7[3] = &unk_1E4B2BCC0;
  v7[4] = v4;
  v6 = v2;
  v8 = v6;
  objc_msgSend(v3, "requestFeatureWithId:completion:", v5, v7);
  if (v6)
    dispatch_block_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)getFeatureEligibilityWithCompletionHandler:(id)a3
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
  v7[2] = __94__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureEligibilityWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __99__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureObjectBlockingQueueUntilResponse___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = WBS_LOG_CHANNEL_PREFIXAppleAccount();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __99__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureObjectBlockingQueueUntilResponse___block_invoke_3_cold_1(v8, v6);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138412290;
    v18 = v9;
    _os_log_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_INFO, "Did receive feature availability for cloud subscription feature %@", buf, 0xCu);
  }
  v10 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    v11 = *(void **)(v10 + 32);
    *(_QWORD *)(v10 + 32) = v5;
    v12 = v5;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v13 = *(NSObject **)(v10 + 8);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __99__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureObjectBlockingQueueUntilResponse___block_invoke_7;
    v15[3] = &unk_1E4B2A118;
    v15[4] = v10;
    v16 = v5;
    v14 = v5;
    dispatch_async(v13, v15);

  }
}

void __77__WBSCloudSubscriptionFeatureAvailabilityObserver_initWithFeatureIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_requestFeatureObjectBlockingQueueUntilResponse:", 0);
  objc_msgSend(WeakRetained, "_requestFeatureEligibilityBlockingQueueUntilResponse:", 0);

}

void __99__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureObjectBlockingQueueUntilResponse___block_invoke_7(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

uint64_t __104__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureEligibilityBlockingQueueUntilResponse___block_invoke_13(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 40) = *(_BYTE *)(result + 40);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_changeObserverToken)
    objc_msgSend(MEMORY[0x1E0D116A0], "unregisterForFeatureChangeNotificationsUsingObserver:");
  v3.receiver = self;
  v3.super_class = (Class)WBSCloudSubscriptionFeatureAvailabilityObserver;
  -[WBSCloudSubscriptionFeatureAvailabilityObserver dealloc](&v3, sel_dealloc);
}

- (void)getFeatureAvailabilityWithCompletionHandler:(id)a3
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
  v7[2] = __95__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureAvailabilityWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __95__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureAvailabilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  char v11;
  NSObject *v12;

  v2 = a1 + 32;
  if (objc_msgSend(*(id *)(a1 + 32), "_overridenAvailability"))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXAppleAccount();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __95__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureAvailabilityWithCompletionHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v10 = *(id *)(*(_QWORD *)v2 + 32);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = objc_msgSend(v10, "canUse");
    }
    else if (v10)
    {
      v11 = objc_msgSend(v10, "status") == 0;
    }
    else
    {
      v11 = 0;
    }
    v12 = WBS_LOG_CHANNEL_PREFIXAppleAccount();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __95__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureAvailabilityWithCompletionHandler___block_invoke_cold_2(v2, v11);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

+ (WBSCloudSubscriptionFeatureAvailabilityObserver)provisionNewHideMyEmailAvailabilityObserver
{
  if (provisionNewHideMyEmailAvailabilityObserver_onceToken != -1)
    dispatch_once(&provisionNewHideMyEmailAvailabilityObserver_onceToken, &__block_literal_global_20);
  return (WBSCloudSubscriptionFeatureAvailabilityObserver *)(id)provisionNewHideMyEmailAvailabilityObserver_hideMyEmailAvailabilityObserver;
}

void __94__WBSCloudSubscriptionFeatureAvailabilityObserver_provisionNewHideMyEmailAvailabilityObserver__block_invoke()
{
  WBSCloudSubscriptionFeatureAvailabilityObserver *v0;
  void *v1;

  v0 = -[WBSCloudSubscriptionFeatureAvailabilityObserver initWithFeatureIdentifier:]([WBSCloudSubscriptionFeatureAvailabilityObserver alloc], "initWithFeatureIdentifier:", CFSTR("mail.hide-my-email.create"));
  v1 = (void *)provisionNewHideMyEmailAvailabilityObserver_hideMyEmailAvailabilityObserver;
  provisionNewHideMyEmailAvailabilityObserver_hideMyEmailAvailabilityObserver = (uint64_t)v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureObject, 0);
  objc_storeStrong((id *)&self->_changeObserverToken, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __99__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureObjectBlockingQueueUntilResponse___block_invoke_3_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v5, v6, "Failed to get cloud feature object: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

void __95__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureAvailabilityWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A3D90000, a2, a3, "Found local override for cloud feature %@. Returning feature availble: YES", a5, a6, a7, a8, 2u);
}

void __95__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureAvailabilityWithCompletionHandler___block_invoke_cold_2(uint64_t a1, char a2)
{
  __CFString *v2;
  __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = CFSTR("NO");
  if ((a2 & 1) != 0)
    v2 = CFSTR("YES");
  v3 = v2;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_4(&dword_1A3D90000, v4, v5, "Returning cloud feature %@ availability from CloudSubscriptionFeatures: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_1();
}

void __94__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureEligibilityWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A3D90000, a2, a3, "Found local override for cloud feature %@. Returning feature eligible: YES", a5, a6, a7, a8, 2u);
}

void __94__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureEligibilityWithCompletionHandler___block_invoke_cold_2(uint64_t a1)
{
  __CFString *v1;
  __CFString *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  if (*(_BYTE *)(*(_QWORD *)a1 + 40))
    v1 = CFSTR("YES");
  else
    v1 = CFSTR("NO");
  v2 = v1;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_4(&dword_1A3D90000, v3, v4, "Returning cloud feature %@ eligibility from CloudSubscriptionFeatures: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_1();
}

@end
