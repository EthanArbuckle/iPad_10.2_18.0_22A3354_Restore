@implementation WBSHideMyEmailManager

- (WBSHideMyEmailManager)init
{
  WBSHideMyEmailManager *v2;
  WBSPrimaryAppleAccountObserver *v3;
  WBSPrimaryAppleAccountObserver *accountObserver;
  uint64_t v5;
  WBSCloudSubscriptionFeatureAvailabilityObserver *provisionNewHideMyEmailAvailabilityObserver;
  AKPrivateEmailController *v7;
  AKPrivateEmailController *privateEmailController;
  WBSHideMyEmailManager *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WBSHideMyEmailManager;
  v2 = -[WBSHideMyEmailManager init](&v11, sel_init);
  if (v2)
  {
    v3 = (WBSPrimaryAppleAccountObserver *)objc_alloc_init(MEMORY[0x1E0D8A180]);
    accountObserver = v2->_accountObserver;
    v2->_accountObserver = v3;

    objc_msgSend(MEMORY[0x1E0D8A0D0], "provisionNewHideMyEmailAvailabilityObserver");
    v5 = objc_claimAutoreleasedReturnValue();
    provisionNewHideMyEmailAvailabilityObserver = v2->_provisionNewHideMyEmailAvailabilityObserver;
    v2->_provisionNewHideMyEmailAvailabilityObserver = (WBSCloudSubscriptionFeatureAvailabilityObserver *)v5;

    v7 = (AKPrivateEmailController *)objc_alloc_init(MEMORY[0x1E0D00258]);
    privateEmailController = v2->_privateEmailController;
    v2->_privateEmailController = v7;

    v9 = v2;
  }

  return v2;
}

- (void)_performOperation:(unint64_t)a3 withURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  WBSPrimaryAppleAccountObserver *accountObserver;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  WBSHideMyEmailManager *v23;
  id v24;
  unint64_t v25;

  v8 = a5;
  objc_msgSend(a4, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = WBS_LOG_CHANNEL_PREFIXHideMyEmail();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[WBSHideMyEmailManager _performOperation:withURL:completionHandler:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  accountObserver = self->_accountObserver;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke;
  v21[3] = &unk_1E5443E80;
  v24 = v8;
  v25 = a3;
  v22 = v9;
  v23 = self;
  v19 = v8;
  v20 = v9;
  -[WBSPrimaryAppleAccountObserver getPrimaryAppleAccountAltDSIDWithCompletionHandler:](accountObserver, "getPrimaryAppleAccountAltDSIDWithCompletionHandler:", v21);

}

void __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  WBSHideMyEmailRecord *v12;
  WBSHideMyEmailRecord *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  void *v18;
  uint64_t v19;
  int8x16_t v20;
  _QWORD v21[4];
  int8x16_t v22;
  id v23;

  v3 = a2;
  if (objc_msgSend(v3, "length"))
  {
    v4 = WBS_LOG_CHANNEL_PREFIXHideMyEmail();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_cold_4(v4, v5, v6, v7, v8, v9, v10, v11);
    objc_msgSend(*(id *)(a1 + 32), "safari_highLevelDomainFromHost");
    v12 = (WBSHideMyEmailRecord *)objc_claimAutoreleasedReturnValue();
    if (-[WBSHideMyEmailRecord isEqualToString:](v12, "isEqualToString:", CFSTR("icloud.com")))
    {
      v13 = -[WBSHideMyEmailRecord initWithDomain:state:privateEmailAddress:]([WBSHideMyEmailRecord alloc], "initWithDomain:state:privateEmailAddress:", *(_QWORD *)(a1 + 32), 2, 0);
      v14 = WBS_LOG_CHANNEL_PREFIXHideMyEmail();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_cold_2(v14);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
    else
    {
      v16 = WBS_LOG_CHANNEL_PREFIXHideMyEmail();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_cold_3(a1, v16);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_4;
      v21[3] = &unk_1E5443E58;
      v20 = *(int8x16_t *)(a1 + 32);
      v17 = (id)v20.i64[0];
      v22 = vextq_s8(v20, v20, 8uLL);
      v23 = *(id *)(a1 + 48);
      v18 = (void *)MEMORY[0x1A85D45E4](v21);
      v19 = *(_QWORD *)(a1 + 56);
      if (v19 == 1)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "fetchPrivateEmailForAltDSID:withKey:completion:", v3, *(_QWORD *)(a1 + 32), v18);
      }
      else if (!v19)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "lookupPrivateEmailForAltDSID:withKey:completion:", v3, *(_QWORD *)(a1 + 32), v18);
      }

    }
  }
  else
  {
    v12 = -[WBSHideMyEmailRecord initWithDomain:state:privateEmailAddress:]([WBSHideMyEmailRecord alloc], "initWithDomain:state:privateEmailAddress:", *(_QWORD *)(a1 + 32), 3, 0);
    v15 = WBS_LOG_CHANNEL_PREFIXHideMyEmail();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_cold_1(v15);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  WBSHideMyEmailRecord *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "safari_matchesErrorDomain:andCode:", *MEMORY[0x1E0D00040], -6003);
    v9 = WBS_LOG_CHANNEL_PREFIXHideMyEmail();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_4_cold_2(v10, v11, v12, v13, v14, v15, v16, v17);
      v18 = *(void **)(a1 + 40);
      v19 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_5;
      v23[3] = &unk_1E5441DA8;
      v24 = v18;
      v25 = *(id *)(a1 + 48);
      objc_msgSend(v19, "getFeatureAvailabilityWithCompletionHandler:", v23);

    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_4_cold_3(v10, v7);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    objc_msgSend(v5, "privateEmailAddress");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[WBSHideMyEmailRecord initWithDomain:state:privateEmailAddress:]([WBSHideMyEmailRecord alloc], "initWithDomain:state:privateEmailAddress:", *(_QWORD *)(a1 + 40), 0, v20);
    v22 = WBS_LOG_CHANNEL_PREFIXHideMyEmail();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_4_cold_1(v22);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_5(uint64_t a1, int a2)
{
  WBSHideMyEmailRecord *v4;
  uint64_t v5;
  WBSHideMyEmailRecord *v6;
  NSObject *v7;

  v4 = [WBSHideMyEmailRecord alloc];
  if (a2)
    v5 = 1;
  else
    v5 = 2;
  v6 = -[WBSHideMyEmailRecord initWithDomain:state:privateEmailAddress:](v4, "initWithDomain:state:privateEmailAddress:", *(_QWORD *)(a1 + 32), v5, 0);
  v7 = WBS_LOG_CHANNEL_PREFIXHideMyEmail();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_5_cold_1(a2, v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)getRecordForURL:(id)a3 completionHandler:(id)a4
{
  -[WBSHideMyEmailManager _performOperation:withURL:completionHandler:](self, "_performOperation:withURL:completionHandler:", 0, a3, a4);
}

- (void)provisionRecordForURL:(id)a3 completionHandler:(id)a4
{
  -[WBSHideMyEmailManager _performOperation:withURL:completionHandler:](self, "_performOperation:withURL:completionHandler:", 1, a3, a4);
}

+ (WBSHideMyEmailManager)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_15);
  return (WBSHideMyEmailManager *)(id)sharedManager_sharedInstance;
}

void __38__WBSHideMyEmailManager_sharedManager__block_invoke()
{
  WBSHideMyEmailManager *v0;
  void *v1;

  v0 = objc_alloc_init(WBSHideMyEmailManager);
  v1 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = (uint64_t)v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateEmailController, 0);
  objc_storeStrong((id *)&self->_provisionNewHideMyEmailAvailabilityObserver, 0);
  objc_storeStrong((id *)&self->_accountObserver, 0);
}

- (void)_performOperation:(uint64_t)a3 withURL:(uint64_t)a4 completionHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A840B000, a1, a3, "Performing Hide My Email operation. Looking up primary account altDSID.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_7_0(a1);
  v2 = OUTLINED_FUNCTION_2_6();
  WBSHideMyEmailRecordStateStringForRecordState(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_3(&dword_1A840B000, v4, v5, "Primary altDSID not available or empty. Returning record with state: %@.", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_1();
}

void __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_7_0(a1);
  v2 = OUTLINED_FUNCTION_2_6();
  WBSHideMyEmailRecordStateStringForRecordState(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_3(&dword_1A840B000, v4, v5, "Domain matches entry on quirks list. Returning record with state: %@.", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_1();
}

void __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  __CFString *v3;
  __CFString *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 56))
    v3 = CFSTR("Fetch (Provision New)");
  else
    v3 = CFSTR("Lookup (Get Existing)");
  v4 = v3;
  OUTLINED_FUNCTION_2_4();
  _os_log_debug_impl(&dword_1A840B000, a2, OS_LOG_TYPE_DEBUG, "Domain not found on quirks list. Starting AuthKit operation: %@.", v5, 0xCu);

  OUTLINED_FUNCTION_2_1();
}

void __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A840B000, a1, a3, "Found primary account altDSID. Verifying domain eligibility against quirks list.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_4_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_7_0(a1);
  v2 = OUTLINED_FUNCTION_2_6();
  WBSHideMyEmailRecordStateStringForRecordState(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_3(&dword_1A840B000, v4, v5, "Hide My Email record exists. Returning record with state: %@.", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_1();
}

void __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_4_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A840B000, a1, a3, "Hide My Email record does not exist in local cache. Looking up whether account is eligible to create a new record.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_4_cold_3(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_7_0(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  _os_log_error_impl(&dword_1A840B000, v3, OS_LOG_TYPE_ERROR, "Failed to get Hide My Email record with error: %{public}@.", v5, 0xCu);

  OUTLINED_FUNCTION_2_1();
}

void __69__WBSHideMyEmailManager__performOperation_withURL_completionHandler___block_invoke_5_cold_1(char a1, NSObject *a2)
{
  __CFString *v3;
  __CFString *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  __CFString *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v3 = CFSTR("YES");
  v4 = v3;
  v5 = a2;
  v6 = OUTLINED_FUNCTION_2_6();
  WBSHideMyEmailRecordStateStringForRecordState(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v4;
  v10 = 2112;
  v11 = v7;
  _os_log_debug_impl(&dword_1A840B000, a2, OS_LOG_TYPE_DEBUG, "Eligibility to create a new record: %@. Returning record with state: %@.", (uint8_t *)&v8, 0x16u);

}

@end
