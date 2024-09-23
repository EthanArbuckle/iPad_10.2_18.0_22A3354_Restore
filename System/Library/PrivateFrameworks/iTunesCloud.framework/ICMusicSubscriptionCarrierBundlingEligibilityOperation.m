@implementation ICMusicSubscriptionCarrierBundlingEligibilityOperation

- (ICMusicSubscriptionCarrierBundlingEligibilityOperation)initWithRequestContext:(id)a3
{
  id v5;
  ICMusicSubscriptionCarrierBundlingEligibilityOperation *v6;
  ICMusicSubscriptionCarrierBundlingEligibilityOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICMusicSubscriptionCarrierBundlingEligibilityOperation;
  v6 = -[ICAsyncOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_requestContext, a3);

  return v7;
}

- (void)execute
{
  void *v4;
  int v5;
  ICStoreRequestContext *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *cellularProviderName;
  NSString *v11;
  NSString *mobileSubscriberCountryCode;
  NSString *v13;
  NSString *mobileSubscriberNetworkCode;
  NSString *v15;
  NSString *phoneNumber;
  NSString *v17;
  NSString *IMEI;
  id v19;
  ICStoreRequestContext *v20;
  void *v21;
  _QWORD v22[5];
  ICStoreRequestContext *v23;
  id v24;

  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPhoneNumberAccessRestricted");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicSubscriptionCarrierBundlingEligibilityOperation.m"), 47, CFSTR("Phone number access is restricted."));

  }
  v6 = self->_requestContext;
  v7 = (void *)MEMORY[0x1A1AFA8D0](self->_responseHandler);
  +[ICTelephonyController sharedController](ICTelephonyController, "sharedController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "providerName");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  cellularProviderName = self->_cellularProviderName;
  self->_cellularProviderName = v9;

  objc_msgSend(v8, "mobileSubscriberCountryCode");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  mobileSubscriberCountryCode = self->_mobileSubscriberCountryCode;
  self->_mobileSubscriberCountryCode = v11;

  objc_msgSend(v8, "mobileSubscriberNetworkCode");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  mobileSubscriberNetworkCode = self->_mobileSubscriberNetworkCode;
  self->_mobileSubscriberNetworkCode = v13;

  objc_msgSend(v8, "phoneNumber");
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  phoneNumber = self->_phoneNumber;
  self->_phoneNumber = v15;

  objc_msgSend(v8, "IMEI");
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  IMEI = self->_IMEI;
  self->_IMEI = v17;

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __65__ICMusicSubscriptionCarrierBundlingEligibilityOperation_execute__block_invoke;
  v22[3] = &unk_1E438C628;
  v22[4] = self;
  v23 = v6;
  v24 = v7;
  v19 = v7;
  v20 = v6;
  -[ICMusicSubscriptionCarrierBundlingEligibilityOperation _sendPreflightRequestWithCompletionHandler:](self, "_sendPreflightRequestWithCompletionHandler:", v22);

}

- (void)_finishEnrichmentWithBodyDictionary:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  ICStoreRequestContext *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  id v14;
  id v15;
  ICStoreRequestContext *v16;
  _QWORD v17[5];
  ICStoreRequestContext *v18;
  id v19;
  NSString *v20;
  NSString *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = self->_requestContext;
  v9 = self->_cellularProviderName;
  v10 = self->_phoneNumber;
  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __112__ICMusicSubscriptionCarrierBundlingEligibilityOperation__finishEnrichmentWithBodyDictionary_completionHandler___block_invoke;
  v17[3] = &unk_1E438C678;
  v17[4] = self;
  v18 = v8;
  v19 = v6;
  v20 = v9;
  v21 = v10;
  v22 = v7;
  v12 = v10;
  v13 = v9;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  objc_msgSend(v11, "getBagForRequestContext:withCompletionHandler:", v16, v17);

}

- (id)_newDefaultRequestBodyDictionary
{
  id v3;
  void *v4;
  void *v5;
  NSString *cellularProviderName;
  NSString *mobileSubscriberCountryCode;
  NSString *mobileSubscriberNetworkCode;
  NSString *IMEI;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[ICRequestContext deviceInfo](self->_requestContext, "deviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("guid"));
  cellularProviderName = self->_cellularProviderName;
  if (cellularProviderName)
    objc_msgSend(v3, "setObject:forKey:", cellularProviderName, CFSTR("carrier"));
  mobileSubscriberCountryCode = self->_mobileSubscriberCountryCode;
  if (mobileSubscriberCountryCode)
    objc_msgSend(v3, "setObject:forKey:", mobileSubscriberCountryCode, CFSTR("MCC"));
  mobileSubscriberNetworkCode = self->_mobileSubscriberNetworkCode;
  if (mobileSubscriberNetworkCode)
    objc_msgSend(v3, "setObject:forKey:", mobileSubscriberNetworkCode, CFSTR("MNC"));
  IMEI = self->_IMEI;
  if (IMEI)
    objc_msgSend(v3, "setObject:forKey:", IMEI, CFSTR("IMEI"));

  return v3;
}

- (id)_newDefaultRequestBodyDictionaryWithResponseCode:(int64_t)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  v7 = -[ICMusicSubscriptionCarrierBundlingEligibilityOperation _newDefaultRequestBodyDictionary](self, "_newDefaultRequestBodyDictionary");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("responseCode"));

  if (v6)
  {
    objc_msgSend(v6, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("error-domain"));
    v10 = objc_msgSend(v6, "code");
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("error-code"));

    }
    objc_msgSend(v6, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2D50]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("error-title"));
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2D68]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v7, "setObject:forKey:", v14, CFSTR("error-message"));
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v16, CFSTR("error-underlying"));

    }
  }

  return v7;
}

- (void)_sendEnrichmentRequestWithURL:(id)a3 preflightResponse:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICStoreRequestContext *v11;
  BOOL deepLink;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  ICURLRequest *v20;
  id v21;
  id v22;
  ICStoreRequestContext *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  ICMusicSubscriptionCarrierBundlingEligibilityOperation *v27;
  ICStoreRequestContext *v28;
  id v29;
  id v30;
  BOOL v31;
  uint8_t buf[4];
  ICMusicSubscriptionCarrierBundlingEligibilityOperation *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self->_requestContext;
  deepLink = self->_deepLink;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v8);
  objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v13, "setValue:forHTTPHeaderField:", CFSTR("text/xml; charset=utf-8"), CFSTR("Content-Type"));
  objc_msgSend(v13, "setValue:forHTTPHeaderField:", CFSTR("ValidateMobile"), CFSTR("SOAPAction"));
  objc_msgSend(v9, "headerEnrichmentMessage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "dataUsingEncoding:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHTTPBody:", v16);

  }
  +[ICURLSessionManager sharedSessionManager](ICURLSessionManager, "sharedSessionManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sessionWithIdentifier:creationBlock:", CFSTR("com.apple.iTunesCloud.ICMusicSubscriptionCarrierBundlingEligibilityOperation"), &__block_literal_global_14906);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v33 = self;
    _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_INFO, "%{public}@ Sending header enrichment request.", buf, 0xCu);
  }

  v20 = -[ICURLRequest initWithURLRequest:requestContext:]([ICURLRequest alloc], "initWithURLRequest:requestContext:", v13, v11);
  -[ICURLRequest setCancelOnHTTPErrors:](v20, "setCancelOnHTTPErrors:", 0);
  -[ICURLRequest setMaxRetryCount:](v20, "setMaxRetryCount:", 0);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __124__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendEnrichmentRequestWithURL_preflightResponse_completionHandler___block_invoke_63;
  v25[3] = &unk_1E438C708;
  v26 = v8;
  v27 = self;
  v29 = v9;
  v30 = v10;
  v28 = v11;
  v31 = deepLink;
  v21 = v9;
  v22 = v10;
  v23 = v11;
  v24 = v8;
  objc_msgSend(v18, "enqueueDataRequest:withCompletionHandler:", v20, v25);

}

- (void)_sendPreflightRequestWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSString *phoneNumber;
  ICStoreRequestContext *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  id v14;
  id v15;
  ICStoreRequestContext *v16;
  _QWORD v17[5];
  ICStoreRequestContext *v18;
  id v19;
  NSString *v20;
  NSString *v21;
  id v22;

  v4 = a3;
  v5 = -[ICMusicSubscriptionCarrierBundlingEligibilityOperation _newDefaultRequestBodyDictionary](self, "_newDefaultRequestBodyDictionary");
  v6 = v5;
  phoneNumber = self->_phoneNumber;
  if (phoneNumber)
    objc_msgSend(v5, "setObject:forKey:", phoneNumber, CFSTR("phoneNumber"));
  if (self->_deepLink)
    objc_msgSend(v6, "setObject:forKey:", CFSTR("true"), CFSTR("deepLink"));
  v8 = self->_requestContext;
  v9 = self->_cellularProviderName;
  v10 = self->_phoneNumber;
  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __101__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendPreflightRequestWithCompletionHandler___block_invoke;
  v17[3] = &unk_1E438C678;
  v17[4] = self;
  v18 = v8;
  v19 = v6;
  v20 = v9;
  v21 = v10;
  v22 = v4;
  v12 = v10;
  v13 = v9;
  v14 = v6;
  v15 = v4;
  v16 = v8;
  objc_msgSend(v11, "getBagForRequestContext:withCompletionHandler:", v16, v17);

}

- (void)_sendSilentSMSRequestWithMessage:(id)a3 number:(id)a4 preflightResponse:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  ICStoreRequestContext *requestContext;
  ICStoreRequestContext *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  ICStoreRequestContext *v29;
  _QWORD v30[5];
  ICStoreRequestContext *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  ICMusicSubscriptionCarrierBundlingEligibilityOperation *v38;
  __int16 v39;
  ICStoreRequestContext *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[ICTelephonyController sharedController](ICTelephonyController, "sharedController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v15 = objc_msgSend(v14, "sendSMSWithText:toPhoneNumber:error:", v10, v11, &v36);
  v16 = v36;

  v17 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  v18 = v17;
  if (v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v38 = self;
      _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_INFO, "%{public}@ Silent SMS succeeded.", buf, 0xCu);
    }
    v19 = 200;
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      requestContext = self->_requestContext;
      *(_DWORD *)buf = 138543618;
      v38 = self;
      v39 = 2114;
      v40 = requestContext;
      _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Failed to send silent SMS for %{public}@.", buf, 0x16u);
    }
    v19 = 460;
  }

  v21 = self->_requestContext;
  objc_msgSend(v12, "headerEnrichmentSessionIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[ICMusicSubscriptionCarrierBundlingEligibilityOperation _newDefaultRequestBodyDictionaryWithResponseCode:error:](self, "_newDefaultRequestBodyDictionaryWithResponseCode:error:", v19, v16);
  v24 = v23;
  if (v22)
    objc_msgSend(v23, "setObject:forKey:", v22, CFSTR("sessionId"));
  if (self->_deepLink)
    objc_msgSend(v24, "setObject:forKey:", CFSTR("true"), CFSTR("deepLink"));
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __134__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendSilentSMSRequestWithMessage_number_preflightResponse_completionHandler___block_invoke;
  v30[3] = &unk_1E438C758;
  v30[4] = self;
  v31 = v21;
  v32 = v10;
  v33 = v11;
  v34 = v12;
  v35 = v13;
  v25 = v12;
  v26 = v11;
  v27 = v10;
  v28 = v13;
  v29 = v21;
  -[ICMusicSubscriptionCarrierBundlingEligibilityOperation _finishEnrichmentWithBodyDictionary:completionHandler:](self, "_finishEnrichmentWithBodyDictionary:completionHandler:", v24, v30);

}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (BOOL)isDeepLink
{
  return self->_deepLink;
}

- (void)setDeepLink:(BOOL)a3
{
  self->_deepLink = a3;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_IMEI, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_mobileSubscriberNetworkCode, 0);
  objc_storeStrong((id *)&self->_mobileSubscriberCountryCode, 0);
  objc_storeStrong((id *)&self->_cellularProviderName, 0);
}

void __134__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendSilentSMSRequestWithMessage_number_preflightResponse_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  id v13;
  double v14;
  double v15;
  NSObject *v16;
  uint64_t v17;
  dispatch_time_t v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  double v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
LABEL_6:
    v12 = *(_QWORD *)(a1 + 72);
    if (v12)
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v7);
    goto LABEL_15;
  }
  objc_msgSend(v5, "error");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v7 = (void *)v8;
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(double *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v27 = v10;
      v28 = 2114;
      v29 = v11;
      v30 = 2114;
      v31 = v7;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to error in response body: %{public}@", buf, 0x20u);
    }

    goto LABEL_6;
  }
  v13 = v5;
  if (objc_msgSend(v13, "needsSilentSMS"))
  {
    objc_msgSend(v13, "delayInterval");
    v15 = v14;
    v16 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v27 = v17;
      v28 = 2050;
      v29 = v15;
      _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_INFO, "%{public}@ Performing delayed retry after %{public}f seconds: still needs silent SMS.", buf, 0x16u);
    }

    v18 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __134__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendSilentSMSRequestWithMessage_number_preflightResponse_completionHandler___block_invoke_81;
    block[3] = &unk_1E438DD78;
    block[4] = *(_QWORD *)(a1 + 32);
    v22 = *(id *)(a1 + 48);
    v23 = *(id *)(a1 + 56);
    v24 = *(id *)(a1 + 64);
    v25 = *(id *)(a1 + 72);
    dispatch_after(v18, v19, block);

  }
  else
  {
    v20 = *(_QWORD *)(a1 + 72);
    if (v20)
      (*(void (**)(uint64_t, id, _QWORD))(v20 + 16))(v20, v13, 0);
  }

  v7 = 0;
LABEL_15:

}

uint64_t __134__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendSilentSMSRequestWithMessage_number_preflightResponse_completionHandler___block_invoke_81(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendSilentSMSRequestWithMessage:number:preflightResponse:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __101__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendPreflightRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  ICStoreURLRequest *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  const __CFString *v27;
  _QWORD v28[5];
  id v29;
  const __CFString *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v11 = CFSTR("fuseHeaderEnrichment");
    objc_msgSend(v5, "urlForBagKey:", CFSTR("fuseHeaderEnrichment"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = *(_QWORD *)(a1 + 48);
      v34 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v13, 0, &v34);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v34;
      v16 = v15;
      if (!v14 || v15)
      {
        v17 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          v36 = v18;
          v37 = 2114;
          v38 = CFSTR("fuseHeaderEnrichment");
          v39 = 2114;
          v40 = v16;
          _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Encountered error trying to serialize body data for %{public}@: %{public}@.", buf, 0x20u);
        }

      }
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v12);
      objc_msgSend(v19, "setHTTPMethod:", CFSTR("POST"));
      objc_msgSend(v19, "setHTTPBody:", v14);
      objc_msgSend(v19, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
      v20 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v36 = v21;
        _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_INFO, "%{public}@ Sending preflight request.", buf, 0xCu);
      }

      v22 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v19, *(_QWORD *)(a1 + 40));
      -[ICStoreURLRequest setAnisetteVersion:](v22, "setAnisetteVersion:", 2);
      -[ICURLRequest setMaxRetryCount:](v22, "setMaxRetryCount:", 0);
      +[ICURLSessionManager highPrioritySession](ICURLSessionManager, "highPrioritySession");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __101__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendPreflightRequestWithCompletionHandler___block_invoke_79;
      v28[3] = &unk_1E438C730;
      v24 = *(void **)(a1 + 40);
      v28[4] = *(_QWORD *)(a1 + 32);
      v29 = v24;
      v33 = *(id *)(a1 + 72);
      v30 = CFSTR("fuseHeaderEnrichment");
      v31 = *(id *)(a1 + 56);
      v32 = *(id *)(a1 + 64);
      objc_msgSend(v23, "enqueueDataRequest:withCompletionHandler:", v22, v28);

    }
    else
    {
      v25 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = *(_QWORD *)(a1 + 32);
        v27 = *(const __CFString **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v36 = v26;
        v37 = 2114;
        v38 = v27;
        _os_log_impl(&dword_1A03E3000, v25, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to missing the key in the bag.", buf, 0x16u);
      }

      if (!*(_QWORD *)(a1 + 72))
        goto LABEL_20;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }

LABEL_20:
    goto LABEL_21;
  }
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(const __CFString **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v36 = v8;
    v37 = 2114;
    v38 = v9;
    v39 = 2114;
    v40 = v6;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to URL bag load failure: %{public}@", buf, 0x20u);
  }

  v10 = *(_QWORD *)(a1 + 72);
  if (v10)
    (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v6);
LABEL_21:

}

void __101__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendPreflightRequestWithCompletionHandler___block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  ICMusicSubscriptionCarrierBundlingEligibilityResponse *v16;
  double v17;
  dispatch_time_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(void);
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(v5, "parsedBodyDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v15 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        v27 = v14;
        v28 = 2114;
        v29 = v15;
        v30 = 2114;
        v31 = v11;
        _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Got carrier bundling response for %{public}@ with body: %{public}@", buf, 0x20u);
      }

      v16 = -[ICMusicSubscriptionCarrierBundlingEligibilityResponse initWithEligibilityDictionary:cellularProviderName:phoneNumber:]([ICMusicSubscriptionCarrierBundlingEligibilityResponse alloc], "initWithEligibilityDictionary:cellularProviderName:phoneNumber:", v11, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
      if (-[ICMusicSubscriptionCarrierBundlingEligibilityResponse wantsDelayedRetry](v16, "wantsDelayedRetry"))
      {
        -[ICMusicSubscriptionCarrierBundlingEligibilityResponse delayInterval](v16, "delayInterval");
        v18 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
        dispatch_get_global_queue(0, 0);
        v19 = objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __101__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendPreflightRequestWithCompletionHandler___block_invoke_80;
        v24[3] = &unk_1E4390EF8;
        v24[4] = *(_QWORD *)(a1 + 32);
        v25 = *(id *)(a1 + 72);
        dispatch_after(v18, v19, v24);

LABEL_18:
LABEL_19:

        goto LABEL_20;
      }
      v23 = *(_QWORD *)(a1 + 72);
      if (!v23)
        goto LABEL_18;
      v22 = *(void (**)(void))(v23 + 16);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v20 = *(_QWORD *)(a1 + 32);
        v21 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v27 = v20;
        v28 = 2114;
        v29 = v21;
        _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to invalid response.", buf, 0x16u);
      }

      if (!*(_QWORD *)(a1 + 72))
        goto LABEL_19;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
      v16 = (ICMusicSubscriptionCarrierBundlingEligibilityResponse *)objc_claimAutoreleasedReturnValue();
      v22 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    }
    v22();
    goto LABEL_18;
  }
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v27 = v8;
    v28 = 2114;
    v29 = v9;
    v30 = 2114;
    v31 = v6;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ error while issuing preflight request: %{public}@", buf, 0x20u);
  }

  v10 = *(_QWORD *)(a1 + 72);
  if (v10)
    (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v6);
LABEL_20:

}

uint64_t __101__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendPreflightRequestWithCompletionHandler___block_invoke_80(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendPreflightRequestWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

void __124__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendEnrichmentRequestWithURL_preflightResponse_completionHandler___block_invoke_63(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "urlResponse");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (id)v7;
    v9 = 0;
LABEL_3:
    objc_msgSend(*(id *)(a1 + 56), "headerEnrichmentSessionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bodyData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 4);
    else
      v12 = 0;
    v16 = (void *)objc_msgSend(*(id *)(a1 + 40), "_newDefaultRequestBodyDictionaryWithResponseCode:error:", objc_msgSend(v8, "statusCode"), v9);
    v17 = v16;
    if (v12)
      objc_msgSend(v16, "setObject:forKey:", v12, CFSTR("responseMessage"));
    if (v10)
      objc_msgSend(v17, "setObject:forKey:", v10, CFSTR("sessionId"));
    if (*(_BYTE *)(a1 + 72))
      objc_msgSend(v17, "setObject:forKey:", CFSTR("true"), CFSTR("deepLink"));
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __124__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendEnrichmentRequestWithURL_preflightResponse_completionHandler___block_invoke_75;
    v28[3] = &unk_1E438C6E0;
    v18 = *(void **)(a1 + 48);
    v29 = *(id *)(a1 + 40);
    v30 = v18;
    v33 = *(id *)(a1 + 64);
    v31 = *(id *)(a1 + 32);
    v32 = *(id *)(a1 + 56);
    objc_msgSend(v29, "_finishEnrichmentWithBodyDictionary:completionHandler:", v17, v28);

    goto LABEL_16;
  }
  objc_msgSend(v6, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0CB32E8];
  v15 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

  if (v15)
  {
    v9 = (void *)objc_msgSend(v6, "copy");
    if (!v9)
      goto LABEL_23;
  }
  else
  {
    objc_msgSend(v6, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "domain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", v14);

    if (v22)
      v9 = (void *)objc_msgSend(v20, "copy");
    else
      v9 = 0;

    if (!v9)
      goto LABEL_23;
  }
  v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C92C18]), "initWithURL:statusCode:HTTPVersion:headerFields:", *(_QWORD *)(a1 + 32), 400, CFSTR("HTTP/1.1"), 0);
  if (v23)
  {
    v8 = (id)v23;
    goto LABEL_3;
  }
LABEL_23:
  v8 = v6;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7601, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v25 = *(_QWORD *)(a1 + 40);
    v26 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v35 = v25;
    v36 = 2114;
    v37 = v26;
    v38 = 2114;
    v39 = v8;
    _os_log_impl(&dword_1A03E3000, v24, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ because header enrichment failed with error: %{public}@.", buf, 0x20u);
  }

  v27 = *(_QWORD *)(a1 + 64);
  if (v27)
    (*(void (**)(uint64_t, _QWORD, id))(v27 + 16))(v27, 0, v8);
LABEL_16:

}

void __124__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendEnrichmentRequestWithURL_preflightResponse_completionHandler___block_invoke_75(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  id v13;
  double v14;
  double v15;
  NSObject *v16;
  uint64_t v17;
  dispatch_time_t v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  double v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
LABEL_6:
    v12 = *(_QWORD *)(a1 + 64);
    if (v12)
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v7);
    goto LABEL_15;
  }
  objc_msgSend(v5, "error");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v7 = (void *)v8;
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(double *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v26 = v10;
      v27 = 2114;
      v28 = v11;
      v29 = 2114;
      v30 = v7;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to error in response body: %{public}@", buf, 0x20u);
    }

    goto LABEL_6;
  }
  v13 = v5;
  if (objc_msgSend(v13, "needsHeaderEnrichment"))
  {
    objc_msgSend(v13, "delayInterval");
    v15 = v14;
    v16 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v26 = v17;
      v27 = 2050;
      v28 = v15;
      _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_INFO, "%{public}@ Performing delayed retry after %{public}f seconds: still needs header enrichment.", buf, 0x16u);
    }

    v18 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __124__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendEnrichmentRequestWithURL_preflightResponse_completionHandler___block_invoke_76;
    v21[3] = &unk_1E4390EA8;
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = *(id *)(a1 + 48);
    v23 = *(id *)(a1 + 56);
    v24 = *(id *)(a1 + 64);
    dispatch_after(v18, v19, v21);

  }
  else
  {
    v20 = *(_QWORD *)(a1 + 64);
    if (v20)
      (*(void (**)(uint64_t, id, _QWORD))(v20 + 16))(v20, v13, 0);
  }

  v7 = 0;
LABEL_15:

}

uint64_t __124__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendEnrichmentRequestWithURL_preflightResponse_completionHandler___block_invoke_76(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendEnrichmentRequestWithURL:preflightResponse:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

ICURLSession *__124__ICMusicSubscriptionCarrierBundlingEligibilityOperation__sendEnrichmentRequestWithURL_preflightResponse_completionHandler___block_invoke()
{
  void *v0;
  ICURLSession *v1;

  objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setHTTPShouldSetCookies:", 1);
  objc_msgSend(v0, "setHTTPShouldUsePipelining:", 1);
  objc_msgSend(v0, "set_CTDataConnectionServiceType:", *MEMORY[0x1E0CA7368]);
  objc_msgSend(v0, "setAllowsCellularAccess:", 1);
  v1 = -[ICURLSession initWithConfiguration:]([ICURLSession alloc], "initWithConfiguration:", v0);

  return v1;
}

void __112__ICMusicSubscriptionCarrierBundlingEligibilityOperation__finishEnrichmentWithBodyDictionary_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  ICStoreURLRequest *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  const __CFString *v27;
  _QWORD v28[5];
  id v29;
  const __CFString *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v11 = CFSTR("fuseHeaderEnrichmentResponse");
    objc_msgSend(v5, "urlForBagKey:", CFSTR("fuseHeaderEnrichmentResponse"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = *(_QWORD *)(a1 + 48);
      v35 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v13, 0, &v35);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v35;
      v16 = v15;
      if (!v14 || v15)
      {
        v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          v37 = v18;
          v38 = 2114;
          v39 = CFSTR("fuseHeaderEnrichmentResponse");
          v40 = 2114;
          v41 = v16;
          _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Encountered error trying to serialize body data for %{public}@: %{public}@.", buf, 0x20u);
        }

      }
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v12);
      objc_msgSend(v19, "setHTTPMethod:", CFSTR("POST"));
      objc_msgSend(v19, "setHTTPBody:", v14);
      objc_msgSend(v19, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
      v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v37 = v21;
        _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_INFO, "%{public}@ Sending header enrichment response.", buf, 0xCu);
      }

      v22 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v19, *(_QWORD *)(a1 + 40));
      -[ICURLRequest setMaxRetryCount:](v22, "setMaxRetryCount:", 0);
      +[ICURLSessionManager highPrioritySession](ICURLSessionManager, "highPrioritySession");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __112__ICMusicSubscriptionCarrierBundlingEligibilityOperation__finishEnrichmentWithBodyDictionary_completionHandler___block_invoke_19;
      v28[3] = &unk_1E438C650;
      v24 = *(void **)(a1 + 40);
      v28[4] = *(_QWORD *)(a1 + 32);
      v29 = v24;
      v34 = *(id *)(a1 + 72);
      v30 = CFSTR("fuseHeaderEnrichmentResponse");
      v31 = *(id *)(a1 + 56);
      v32 = *(id *)(a1 + 64);
      v33 = *(id *)(a1 + 48);
      objc_msgSend(v23, "enqueueDataRequest:withCompletionHandler:", v22, v28);

    }
    else
    {
      v25 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = *(_QWORD *)(a1 + 32);
        v27 = *(const __CFString **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v37 = v26;
        v38 = 2114;
        v39 = v27;
        _os_log_impl(&dword_1A03E3000, v25, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to missing the key in the bag.", buf, 0x16u);
      }

      if (!*(_QWORD *)(a1 + 72))
        goto LABEL_20;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }

LABEL_20:
    goto LABEL_21;
  }
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(const __CFString **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v37 = v8;
    v38 = 2114;
    v39 = v9;
    v40 = 2114;
    v41 = v6;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to URL bag load failure: %{public}@", buf, 0x20u);
  }

  v10 = *(_QWORD *)(a1 + 72);
  if (v10)
    (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v6);
LABEL_21:

}

void __112__ICMusicSubscriptionCarrierBundlingEligibilityOperation__finishEnrichmentWithBodyDictionary_completionHandler___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  ICMusicSubscriptionCarrierBundlingEligibilityResponse *v16;
  double v17;
  dispatch_time_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD block[5];
  id v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(v5, "parsedBodyDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v15 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        v31 = v14;
        v32 = 2114;
        v33 = v15;
        v34 = 2114;
        v35 = v11;
        _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Got carrier bundling response for %{public}@ with body: %{public}@", buf, 0x20u);
      }

      v16 = -[ICMusicSubscriptionCarrierBundlingEligibilityResponse initWithEligibilityDictionary:cellularProviderName:phoneNumber:]([ICMusicSubscriptionCarrierBundlingEligibilityResponse alloc], "initWithEligibilityDictionary:cellularProviderName:phoneNumber:", v11, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
      if (-[ICMusicSubscriptionCarrierBundlingEligibilityResponse wantsDelayedRetry](v16, "wantsDelayedRetry"))
      {
        -[ICMusicSubscriptionCarrierBundlingEligibilityResponse delayInterval](v16, "delayInterval");
        v18 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
        dispatch_get_global_queue(0, 0);
        v19 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __112__ICMusicSubscriptionCarrierBundlingEligibilityOperation__finishEnrichmentWithBodyDictionary_completionHandler___block_invoke_21;
        block[3] = &unk_1E4390E58;
        block[4] = *(_QWORD *)(a1 + 32);
        v28 = *(id *)(a1 + 72);
        v29 = *(id *)(a1 + 80);
        dispatch_after(v18, v19, block);

      }
      else
      {
        -[ICMusicSubscriptionCarrierBundlingEligibilityResponse error](v16, "error");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v24 = *(_QWORD *)(a1 + 32);
            v25 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138543874;
            v31 = v24;
            v32 = 2114;
            v33 = v25;
            v34 = 2114;
            v35 = v22;
            _os_log_impl(&dword_1A03E3000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to error in response body: %{public}@", buf, 0x20u);
          }

          v16 = 0;
        }
        v26 = *(_QWORD *)(a1 + 80);
        if (v26)
          (*(void (**)(uint64_t, ICMusicSubscriptionCarrierBundlingEligibilityResponse *, void *))(v26 + 16))(v26, v16, v22);

      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v20 = *(_QWORD *)(a1 + 32);
        v21 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v31 = v20;
        v32 = 2114;
        v33 = v21;
        _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to invalid response.", buf, 0x16u);
      }

      if (!*(_QWORD *)(a1 + 80))
        goto LABEL_23;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
      v16 = (ICMusicSubscriptionCarrierBundlingEligibilityResponse *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    }

LABEL_23:
    goto LABEL_24;
  }
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v31 = v8;
    v32 = 2114;
    v33 = v9;
    v34 = 2114;
    v35 = v6;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ error while sending header enrichment response: %{public}@", buf, 0x20u);
  }

  v10 = *(_QWORD *)(a1 + 80);
  if (v10)
    (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v6);
LABEL_24:

}

uint64_t __112__ICMusicSubscriptionCarrierBundlingEligibilityOperation__finishEnrichmentWithBodyDictionary_completionHandler___block_invoke_21(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishEnrichmentWithBodyDictionary:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __65__ICMusicSubscriptionCarrierBundlingEligibilityOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD, _QWORD);
  uint64_t v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  void (**v43)(_QWORD, _QWORD, _QWORD);
  _QWORD v44[5];
  id v45;
  id v46;
  void (**v47)(_QWORD, _QWORD, _QWORD);
  _QWORD v48[5];
  id v49;
  id v50;
  uint64_t *v51;
  uint64_t *v52;
  _QWORD v53[4];
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  id *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v61 = 0;
  v62 = (id *)&v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__14963;
  v65 = __Block_byref_object_dispose__14964;
  v66 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__14963;
  v59 = __Block_byref_object_dispose__14964;
  v7 = a3;
  v60 = v7;
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(v6, "error");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v56[5];
    v56[5] = v10;

    if (!v56[5])
      goto LABEL_9;
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      v15 = v56[5];
      *(_DWORD *)buf = 138543874;
      v68 = v13;
      v69 = 2114;
      v70 = v14;
      v71 = 2114;
      v72 = v15;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to error in response body: %{public}@", buf, 0x20u);
    }

    v8 = (id)v56[5];
    if (!v8)
    {
LABEL_9:
      if ((unint64_t)(objc_msgSend(v6, "carrierBundlingStatusType") - 1) < 4)
        objc_storeStrong(v62 + 5, a2);
      v16 = MEMORY[0x1E0C809B0];
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __65__ICMusicSubscriptionCarrierBundlingEligibilityOperation_execute__block_invoke_5;
      v53[3] = &unk_1E438C5D8;
      v17 = v6;
      v54 = v17;
      v18 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AFA8D0](v53);
      v48[0] = v16;
      v48[1] = 3221225472;
      v48[2] = __65__ICMusicSubscriptionCarrierBundlingEligibilityOperation_execute__block_invoke_2;
      v48[3] = &unk_1E438C600;
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(void **)(a1 + 40);
      v51 = &v55;
      v48[4] = v19;
      v49 = v20;
      v52 = &v61;
      v50 = *(id *)(a1 + 48);
      v21 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AFA8D0](v48);
      if (objc_msgSend(v17, "needsHeaderEnrichment"))
      {
        objc_msgSend(v17, "headerEnrichmentURL");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v44[0] = v16;
          v44[1] = 3221225472;
          v44[2] = __65__ICMusicSubscriptionCarrierBundlingEligibilityOperation_execute__block_invoke_9;
          v44[3] = &unk_1E4390EA8;
          v44[4] = *(_QWORD *)(a1 + 32);
          v23 = v22;
          v45 = v23;
          v46 = v17;
          v47 = v21;
          ((void (**)(_QWORD, _QWORD *))v18)[2](v18, v44);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7601, 0);
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = (void *)v56[5];
          v56[5] = v27;

          v29 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v30 = *(_QWORD *)(a1 + 32);
            v31 = *(_QWORD *)(a1 + 40);
            v32 = v56[5];
            *(_DWORD *)buf = 138543874;
            v68 = v30;
            v69 = 2114;
            v70 = v31;
            v71 = 2114;
            v72 = v32;
            _os_log_impl(&dword_1A03E3000, v29, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to missing header enrichment URL in response body: %{public}@", buf, 0x20u);
          }

          v21[2](v21, 0, v56[5]);
          v23 = 0;
        }
      }
      else
      {
        if (!objc_msgSend(v17, "needsSilentSMS"))
        {
          v26 = *(_QWORD *)(a1 + 48);
          if (v26)
            (*(void (**)(uint64_t, id, _QWORD))(v26 + 16))(v26, v62[5], 0);
          objc_msgSend(*(id *)(a1 + 32), "finishWithError:", 0);
          goto LABEL_29;
        }
        objc_msgSend(v17, "silentSMSMessage");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "silentSMSNumber");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v24;
        if (v23 && v24)
        {
          v39[0] = v16;
          v39[1] = 3221225472;
          v39[2] = __65__ICMusicSubscriptionCarrierBundlingEligibilityOperation_execute__block_invoke_11;
          v39[3] = &unk_1E438DD78;
          v39[4] = *(_QWORD *)(a1 + 32);
          v40 = v23;
          v41 = v25;
          v42 = v17;
          v43 = v21;
          ((void (**)(_QWORD, _QWORD *))v18)[2](v18, v39);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7601, 0);
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = (void *)v56[5];
          v56[5] = v33;

          v35 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v36 = *(_QWORD *)(a1 + 32);
            v37 = *(_QWORD *)(a1 + 40);
            v38 = v56[5];
            *(_DWORD *)buf = 138543874;
            v68 = v36;
            v69 = 2114;
            v70 = v37;
            v71 = 2114;
            v72 = v38;
            _os_log_impl(&dword_1A03E3000, v35, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to missing silent SMS message or number in response body: %{public}@", buf, 0x20u);
          }

          v21[2](v21, 0, v56[5]);
        }

      }
LABEL_29:

      goto LABEL_30;
    }
  }
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v8);
    v8 = (id)v56[5];
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v8);
LABEL_30:
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
}

void __65__ICMusicSubscriptionCarrierBundlingEligibilityOperation_execute__block_invoke_5(uint64_t a1, void *a2)
{
  double v3;
  dispatch_time_t v4;
  NSObject *v5;
  void (**block)(void);

  block = a2;
  objc_msgSend(*(id *)(a1 + 32), "delayInterval");
  if (v3 <= 0.00000011920929)
  {
    block[2]();
  }
  else
  {
    v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_after(v4, v5, block);

  }
}

void __65__ICMusicSubscriptionCarrierBundlingEligibilityOperation_execute__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  v8 = *(_QWORD *)(a1 + 56);
  if (!*(_QWORD *)(*(_QWORD *)(v8 + 8) + 40))
  {
    objc_msgSend(v6, "error");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      goto LABEL_6;
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v17 = 138543874;
      v18 = v13;
      v19 = 2114;
      v20 = v14;
      v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Carrier bundling eligibility operation failed for %{public}@ due to error in response body: %{public}@", (uint8_t *)&v17, 0x20u);
    }

    v8 = *(_QWORD *)(a1 + 56);
    if (!*(_QWORD *)(*(_QWORD *)(v8 + 8) + 40))
    {
LABEL_6:
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
      v8 = *(_QWORD *)(a1 + 56);
    }
  }
  v16 = *(_QWORD *)(a1 + 48);
  if (v16)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v16 + 16))(v16, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(v8 + 8) + 40));
    v8 = *(_QWORD *)(a1 + 56);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", *(_QWORD *)(*(_QWORD *)(v8 + 8) + 40));

}

uint64_t __65__ICMusicSubscriptionCarrierBundlingEligibilityOperation_execute__block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendEnrichmentRequestWithURL:preflightResponse:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __65__ICMusicSubscriptionCarrierBundlingEligibilityOperation_execute__block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendSilentSMSRequestWithMessage:number:preflightResponse:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

@end
