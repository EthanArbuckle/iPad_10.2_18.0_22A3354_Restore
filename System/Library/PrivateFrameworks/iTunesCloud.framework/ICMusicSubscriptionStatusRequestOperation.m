@implementation ICMusicSubscriptionStatusRequestOperation

void __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  +[ICClientInfo defaultInfo](ICClientInfo, "defaultInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientInfo:", v3);

  if (objc_msgSend(*(id *)(a1 + 32), "shouldBypassEnforcementOfPrivacyAcknowledgement"))
    objc_msgSend(v4, "setPersonalizationStyle:", 2);

}

void __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(void);
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  char v32;
  __int16 v33;
  char v34;
  char v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5
    && ((objc_msgSend(*(id *)(a1 + 32), "allowsFallbackToExpiredStatus") & 1) != 0
     || (objc_msgSend((id)v5, "isExpired") & 1) == 0))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "allowsFallbackToStatusNeedingReload") & 1) != 0)
      LOBYTE(v7) = 1;
    else
      v7 = objc_msgSend((id)v5, "needsReload") ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "shouldReturnLastKnownStatusOnly"))
  {
    v8 = (uint64_t)v6;
    if (!(v5 | v8))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7008, 0);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      v37 = v10;
      v38 = 2114;
      v39 = v5;
      v40 = 2114;
      v41 = v8;
      v42 = 2114;
      v43 = v11;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Returning last known subscription status %{public}@ with error %{public}@ for: %{public}@", buf, 0x2Au);
    }

    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_14:
    v12();
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v8);

    goto LABEL_25;
  }
  if (!v5
    || !*(_BYTE *)(a1 + 80)
    || (objc_msgSend((id)v5, "isExpired") & 1) != 0
    || (objc_msgSend((id)v5, "needsReload") & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "shouldBypassEnforcementOfPrivacyAcknowledgement") & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 48), "identity"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:](ICPrivacyInfo, "sharedPrivacyInfoForUserIdentity:", v13), v14 = (void *)objc_claimAutoreleasedReturnValue(), v15 = objc_msgSend(v14, "privacyAcknowledgementRequiredForMusic"), v14, v13, !v15))
    {
      +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_7;
      v25[3] = &unk_1E438B398;
      v19 = *(void **)(a1 + 48);
      v25[4] = *(_QWORD *)(a1 + 40);
      v26 = v19;
      v29 = *(id *)(a1 + 56);
      v32 = v7;
      v20 = (id)v5;
      v33 = *(_WORD *)(a1 + 81);
      v21 = *(_QWORD *)(a1 + 72);
      v27 = v20;
      v31 = v21;
      v28 = *(id *)(a1 + 32);
      v34 = *(_BYTE *)(a1 + 83);
      v30 = *(id *)(a1 + 64);
      v35 = *(_BYTE *)(a1 + 80);
      objc_msgSend(v18, "getBagForRequestContext:withCompletionHandler:", v26, v25);

      goto LABEL_25;
    }
    v16 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v37 = v17;
      _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Aborted fetching subscription status because privacy link needs to be displayed first.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7007, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_14;
  }
  v22 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = *(_QWORD *)(a1 + 40);
    v24 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v37 = v23;
    v38 = 2114;
    v39 = v5;
    v40 = 2114;
    v41 = v24;
    _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Using cached subscription status %{public}@ for: %{public}@", buf, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6);
LABEL_25:

}

void __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  if (*(_QWORD *)(a1 + 32))
  {
    v5 = a3;
    v6 = (id)objc_msgSend(a2, "copy");
    objc_msgSend(v6, "setFinalResponse:", 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)setAllowsFuseHeaderEnrichment:(BOOL)a3
{
  self->_allowsFuseHeaderEnrichment = a3;
}

- (ICMusicSubscriptionStatusRequestOperation)initWithRequest:(id)a3
{
  id v4;
  ICMusicSubscriptionStatusRequestOperation *v5;
  uint64_t v6;
  ICMusicSubscriptionStatusRequest *request;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICMusicSubscriptionStatusRequestOperation;
  v5 = -[ICAsyncOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    request = v5->_request;
    v5->_request = (ICMusicSubscriptionStatusRequest *)v6;

  }
  return v5;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)execute
{
  ICMusicSubscriptionStatusRequest *v3;
  void *v4;
  _BOOL4 shouldRequestLightweightStatus;
  BOOL v6;
  void *v8;
  int v9;
  NSObject *v10;
  BOOL v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  ICMusicSubscriptionStatusRequest *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  ICMusicSubscriptionStatusRequest *v22;
  char v23;
  _QWORD v25[4];
  ICMusicSubscriptionStatusRequest *v26;
  ICMusicSubscriptionStatusRequestOperation *v27;
  id v28;
  id v29;
  id v30;
  SEL v31;
  BOOL v32;
  BOOL v33;
  char v34;
  BOOL v35;
  _QWORD v36[4];
  ICMusicSubscriptionStatusRequest *v37;
  _QWORD v38[4];
  id v39;
  uint8_t buf[4];
  ICMusicSubscriptionStatusRequestOperation *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = self->_request;
  v4 = (void *)MEMORY[0x1A1AFA8D0](self->_responseHandler);
  shouldRequestLightweightStatus = self->_shouldRequestLightweightStatus;
  v6 = -[ICMusicSubscriptionStatusRequest shouldIgnoreCache](v3, "shouldIgnoreCache");
  if (!shouldRequestLightweightStatus && self->_allowsFuseHeaderEnrichment)
  {
    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isPhoneNumberAccessRestricted");

    if (!v9)
    {
      v23 = 1;
      goto LABEL_11;
    }
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v41 = self;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Loading carrier bundling status is not allowed because phone number access is restricted.", buf, 0xCu);
    }

  }
  v23 = 0;
LABEL_11:
  v11 = !v6;
  v12 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke;
  v38[3] = &unk_1E438EEE8;
  v13 = v4;
  v39 = v13;
  v14 = (void *)MEMORY[0x1A1AFA8D0](v38);
  -[ICMusicSubscriptionStatusRequest storeRequestContext](v3, "storeRequestContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v12;
  v36[1] = 3221225472;
  v36[2] = __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_2;
  v36[3] = &unk_1E4390188;
  v16 = v3;
  v37 = v16;
  v17 = (void *)objc_msgSend(v15, "copyWithBlock:", v36);

  +[ICMusicSubscriptionStatusCache sharedCache](ICMusicSubscriptionStatusCache, "sharedCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v12;
  v25[1] = 3221225472;
  v25[2] = __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_3;
  v25[3] = &unk_1E438B3C0;
  v26 = v16;
  v27 = self;
  v28 = v17;
  v29 = v14;
  v32 = v11;
  v33 = shouldRequestLightweightStatus;
  v34 = v23;
  v35 = !shouldRequestLightweightStatus;
  v30 = v13;
  v31 = a2;
  v19 = v13;
  v20 = v14;
  v21 = v17;
  v22 = v16;
  objc_msgSend(v18, "getCachedSubscriptionStatusResponseForRequestContext:completion:", v21, v25);

}

- (void)_performSubscriptionStatusURLRequestWithRequestContext:(id)a3 subscriptionStatusURL:(id)a4 allowsAuthentication:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  ICStoreURLRequest *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  BOOL v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[ICStoreURLRequest initWithURL:requestContext:]([ICStoreURLRequest alloc], "initWithURL:requestContext:", v11, v10);
  -[ICURLRequest setMaxRetryCount:](v13, "setMaxRetryCount:", 0);
  +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __154__ICMusicSubscriptionStatusRequestOperation__performSubscriptionStatusURLRequestWithRequestContext_subscriptionStatusURL_allowsAuthentication_completion___block_invoke;
  v18[3] = &unk_1E438B3E8;
  v18[4] = self;
  v19 = v10;
  v22 = a5;
  v20 = v11;
  v21 = v12;
  v15 = v11;
  v16 = v12;
  v17 = v10;
  objc_msgSend(v14, "enqueueDataRequest:withCompletionHandler:", v13, v18);

}

- (void)_cacheAccountEligibilityWithStatus:(id)a3 requestContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  char v16;
  uint64_t v17;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "identityStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v7, "getPropertiesForUserIdentity:error:", v8, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;

  v11 = objc_msgSend(v6, "statusType");
  v12 = v11 == 1;
  if (v10 || v12 != objc_msgSend(v9, "isSubscriptionStatusEnabled"))
  {
    +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __95__ICMusicSubscriptionStatusRequestOperation__cacheAccountEligibilityWithStatus_requestContext___block_invoke;
    v15[3] = &__block_descriptor_33_e41_v16__0__ICMutableUserIdentityProperties_8l;
    v16 = v12;
    objc_msgSend(v13, "updatePropertiesForUserIdentity:usingBlock:", v14, v15);

  }
}

- (BOOL)_carrierBundleStatusIsValidForCachedSubscriptionStatus:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v13;

  v5 = a3;
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPhoneNumberAccessRestricted");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicSubscriptionStatusRequestOperation.m"), 417, CFSTR("Phone number access is restricted."));

  }
  if ((unint64_t)(objc_msgSend(v5, "carrierBundlingStatusType") - 1) > 2)
  {
    v11 = 0;
  }
  else
  {
    +[ICTelephonyController sharedController](ICTelephonyController, "sharedController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "phoneNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "phoneNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == v10)
      v11 = 1;
    else
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

  }
  return v11;
}

- (ICMusicSubscriptionStatusRequest)request
{
  return self->_request;
}

- (BOOL)allowsFuseHeaderEnrichment
{
  return self->_allowsFuseHeaderEnrichment;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (BOOL)shouldRequestLightweightStatus
{
  return self->_shouldRequestLightweightStatus;
}

- (void)setShouldRequestLightweightStatus:(BOOL)a3
{
  self->_shouldRequestLightweightStatus = a3;
}

uint64_t __95__ICMusicSubscriptionStatusRequestOperation__cacheAccountEligibilityWithStatus_requestContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSubscriptionStatusEnabled:", *(unsigned __int8 *)(a1 + 32));
}

void __154__ICMusicSubscriptionStatusRequestOperation__performSubscriptionStatusURLRequestWithRequestContext_subscriptionStatusURL_allowsAuthentication_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  ICMusicSubscriptionStatusResponse *v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v45 = v8;
      v46 = 2114;
      v47 = v9;
      v48 = 2114;
      v49 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Subscription status load failed for %{public}@ due to response error: %{public}@", buf, 0x20u);
    }

    v10 = 0;
    v11 = v6;
    goto LABEL_25;
  }
  objc_msgSend(v5, "parsedBodyDictionary");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v29 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = *(_QWORD *)(a1 + 32);
      v31 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v45 = v30;
      v46 = 2114;
      v47 = v31;
      _os_log_impl(&dword_1A03E3000, v29, OS_LOG_TYPE_ERROR, "%{public}@ Subscription status load failed for %{public}@ due to invalid response.", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v13 = (void *)v12;
  v14 = os_log_create("com.apple.amp.iTunesCloud", "Subscription_Oversize");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v45 = v15;
    v46 = 2114;
    v47 = v16;
    v48 = 2114;
    v49 = v13;
    _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Received subscription status response for %{public}@: %{public}@", buf, 0x20u);
  }

  v43 = 0;
  v17 = +[ICMusicSubscriptionStatusResponse isValidSubscriptionStatusResponseDictionary:error:](ICMusicSubscriptionStatusResponse, "isValidSubscriptionStatusResponseDictionary:error:", v13, &v43);
  v11 = v43;
  if (!v17)
  {
    v32 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = *(_QWORD *)(a1 + 32);
      v34 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v45 = v33;
      v46 = 2114;
      v47 = v34;
      v48 = 2114;
      v49 = v11;
      _os_log_impl(&dword_1A03E3000, v32, OS_LOG_TYPE_ERROR, "%{public}@ Failed parsing subscription status response for %{public}@ with error: %{public}@.", buf, 0x20u);
    }

LABEL_23:
    v10 = 0;
    goto LABEL_25;
  }
  v10 = -[ICMusicSubscriptionStatusResponse initWithResponseDictionary:expirationDate:]([ICMusicSubscriptionStatusResponse alloc], "initWithResponseDictionary:expirationDate:", v13, 0);
  -[ICMusicSubscriptionStatusResponse subscriptionStatus](v10, "subscriptionStatus");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "statusType") == 1 || objc_msgSend(v18, "reasonType") != 4)
  {

    v11 = 0;
LABEL_25:
    v35 = *(_QWORD *)(a1 + 56);
    if (v35)
      (*(void (**)(uint64_t, ICMusicSubscriptionStatusResponse *, id))(v35 + 16))(v35, v10, v11);
    goto LABEL_27;
  }
  objc_msgSend(*(id *)(a1 + 40), "authenticationProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (*(_BYTE *)(a1 + 64)
    && (objc_msgSend(v19, "interactionLevel") != 1
     || (objc_msgSend(v18, "acceptSilentAuth"),
         v21 = (void *)objc_claimAutoreleasedReturnValue(),
         v22 = objc_msgSend(v21, "BOOLValue"),
         v21,
         v22)))
  {
    _ICLogCategorySubscription();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = *(_QWORD *)(a1 + 32);
      v25 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v45 = v24;
      v46 = 2114;
      v47 = v25;
      _os_log_impl(&dword_1A03E3000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Received invalid token response for %{public}@, authenticating...", buf, 0x16u);
    }

    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __154__ICMusicSubscriptionStatusRequestOperation__performSubscriptionStatusURLRequestWithRequestContext_subscriptionStatusURL_allowsAuthentication_completion___block_invoke_36;
    v39[3] = &unk_1E438E350;
    v26 = *(_QWORD *)(a1 + 40);
    v39[4] = *(_QWORD *)(a1 + 32);
    v42 = *(id *)(a1 + 56);
    v40 = *(id *)(a1 + 40);
    v41 = *(id *)(a1 + 48);
    objc_msgSend(v20, "performAuthenticationUsingRequestContext:withCompletionHandler:", v26, v39);

    v27 = 0;
    v28 = 1;
  }
  else
  {
    _ICLogCategorySubscription();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = *(_QWORD *)(a1 + 32);
      v38 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v45 = v37;
      v46 = 2114;
      v47 = v38;
      _os_log_impl(&dword_1A03E3000, v36, OS_LOG_TYPE_ERROR, "%{public}@ Received invalid token response but not allowed to authenticate for: %{public}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7901, 0);
    v27 = objc_claimAutoreleasedReturnValue();

    v28 = 0;
    v10 = 0;
  }

  v11 = (id)v27;
  if ((v28 & 1) == 0)
    goto LABEL_25;
LABEL_27:

}

void __154__ICMusicSubscriptionStatusRequestOperation__performSubscriptionStatusURLRequestWithRequestContext_subscriptionStatusURL_allowsAuthentication_completion___block_invoke_36(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_performSubscriptionStatusURLRequestWithRequestContext:subscriptionStatusURL:allowsAuthentication:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
  }
  else
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Authentication failed with error: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7901, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = *(_QWORD *)(a1 + 56);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v5);
  }

}

void __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  char v34;
  char v35;
  char v36;
  char v37;
  void *v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v40 = v9;
      v41 = 2114;
      v42 = v10;
      v43 = 2114;
      v44 = v6;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Subscription status load failed for %{public}@ due to URL bag load failure: %{public}@", buf, 0x20u);
    }

    if (*(_BYTE *)(a1 + 88))
      v11 = *(_QWORD *)(a1 + 48);
    else
      v11 = 0;
    (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v11, v6);
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "serverCorrelationKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serverEnvironment");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v40 = v12;
      v41 = 2114;
      v42 = v5;
      v43 = 2114;
      v44 = v13;
      v45 = 2114;
      v46 = v14;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully loaded bag: %{public}@ (serverCorrelationKey: %{public}@; serverEnvironment: %{public}@).",
        buf,
        0x2Au);

    }
    objc_msgSend(v5, "urlForBagKey:", CFSTR("getSubscriptionStatusSrv"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 89))
    {
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("minimal"), CFSTR("true"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ic_URLByAppendingQueryItems:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v18;
    }
    if (v15)
    {
      v19 = *(void **)(a1 + 32);
      v20 = *(_QWORD *)(a1 + 40);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_13;
      v26[3] = &unk_1E438B370;
      v33 = *(_QWORD *)(a1 + 80);
      v26[4] = v19;
      v34 = *(_BYTE *)(a1 + 88);
      v27 = *(id *)(a1 + 48);
      v35 = *(_BYTE *)(a1 + 90);
      v28 = *(id *)(a1 + 56);
      v29 = v5;
      v30 = *(id *)(a1 + 40);
      v36 = *(_BYTE *)(a1 + 91);
      v31 = *(id *)(a1 + 64);
      v32 = *(id *)(a1 + 72);
      v37 = *(_BYTE *)(a1 + 92);
      objc_msgSend(v19, "_performSubscriptionStatusURLRequestWithRequestContext:subscriptionStatusURL:allowsAuthentication:completion:", v20, v15, 1, v26);

    }
    else
    {
      v21 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = *(_QWORD *)(a1 + 32);
        v23 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v40 = v22;
        v41 = 2114;
        v42 = v23;
        _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Subscription status load failed for %{public}@ due to missing the key in the bag.", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_BYTE *)(a1 + 88))
        v25 = *(_QWORD *)(a1 + 48);
      else
        v25 = 0;
      (*(void (**)(_QWORD, uint64_t, void *))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v25, v24);
      objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v24);

    }
  }

}

void __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  void *v29;
  void *v30;
  void *v31;
  char v32;
  unint64_t v33;
  uint64_t v34;
  BOOL v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  ICMusicSubscriptionCarrierBundlingEligibilityOperation *v42;
  id v43;
  uint64_t v44;
  id v45;
  void (**v46)(_QWORD, _QWORD, _QWORD);
  void *v47;
  unint64_t v48;
  unint64_t v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  id v55;
  id v56;
  char v57;
  BOOL v58;
  char v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 | v6)
  {
    if (v5)
    {
      v7 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 32));

  }
  if (*(_BYTE *)(a1 + 96))
  {
    v5 = (unint64_t)*(id *)(a1 + 40);
    v7 = 1;
  }
  else
  {
    v7 = 0;
    v5 = 0;
  }
LABEL_8:
  if (!*(_BYTE *)(a1 + 97))
    goto LABEL_28;
  if (objc_msgSend(*(id *)(a1 + 48), "reason") != 1)
  {
    objc_msgSend(*(id *)(a1 + 56), "stringForBagKey:", CFSTR("fuseCarrierMccMncList"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
    {
      v10 = v9;
      v11 = objc_msgSend(v10, "length");
      v12 = v11 - 2;
      if (v11 >= 2
        && objc_msgSend(v10, "hasPrefix:", CFSTR("\"))
        && objc_msgSend(v10, "hasSuffix:", CFSTR("\")))
      {
        objc_msgSend(v10, "substringWithRange:", 1, v12);
        v13 = objc_claimAutoreleasedReturnValue();

        v10 = (id)v13;
      }
      objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(","));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    if (objc_msgSend(v14, "count"))
    {
      v47 = v9;
      v48 = v6;
      +[ICTelephonyController sharedController](ICTelephonyController, "sharedController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "mobileSubscriberCountryCode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "mobileSubscriberNetworkCode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v14, "containsObject:", v18);
      if ((v19 & 1) == 0)
      {
        v20 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          v65 = v21;
          v66 = 2114;
          v67 = v16;
          v68 = 2114;
          v69 = v17;
          _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping loading of carrier bundling status because the combination (MCC: %{public}@, MNC: %{public}@) for the current active SIM card is not in the allow list.", buf, 0x20u);
        }

      }
      v22 = v19 ^ 1;

      v9 = v47;
      v6 = v48;
    }
    else
    {
      v22 = 0;
    }

    if (((v7 | v22) & 1) == 0)
      goto LABEL_34;
LABEL_28:
    if (!v5)
    {
LABEL_39:
      v24 = 0;
LABEL_40:
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);

      goto LABEL_64;
    }
    if ((v7 & 1) == 0)
    {
      objc_msgSend((id)v5, "subscriptionStatus");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_cacheAccountEligibilityWithStatus:requestContext:", v23, *(_QWORD *)(a1 + 64));

    }
LABEL_31:
    v24 = (void *)objc_msgSend((id)v5, "copy");
    objc_msgSend(v24, "setFinalResponse:", 1);
    if ((v7 & 1) == 0 && *(_BYTE *)(a1 + 98))
    {
      +[ICMusicSubscriptionStatusCache sharedCache](ICMusicSubscriptionStatusCache, "sharedCache");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setCachedSubscriptionStatusResponse:forRequestContext:completion:", v24, *(_QWORD *)(a1 + 64), 0);

    }
    goto LABEL_40;
  }
  if ((v7 & 1) != 0)
  {
    if (!v5)
      goto LABEL_39;
    goto LABEL_31;
  }
LABEL_34:
  if (!v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
    goto LABEL_64;
  }
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_27;
  v60[3] = &unk_1E438B318;
  v63 = *(id *)(a1 + 80);
  v26 = (id)v5;
  v61 = v26;
  v27 = (id)v6;
  v62 = v27;
  v28 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AFA8D0](v60);
  objc_msgSend(v26, "subscriptionStatus");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 32), "_cacheAccountEligibilityWithStatus:requestContext:", v30, *(_QWORD *)(a1 + 64));
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "hasCellularDataCapability");

  if ((v32 & 1) == 0)
  {
    objc_msgSend(v30, "setCarrierBundlingStatusType:", 3);
    v36 = 0;
LABEL_60:
    ((void (**)(_QWORD, void *, BOOL))v28)[2](v28, v30, !v36);
    v41 = 0;
    goto LABEL_61;
  }
  v33 = objc_msgSend(v30, "carrierBundlingStatusType") - 1;
  v34 = objc_msgSend(*(id *)(a1 + 48), "carrierBundleProvisioningStyle");
  v49 = v6;
  if (v34 == 1)
  {
    v36 = v33 >= 2 && objc_msgSend(v30, "statusType") != 1;
    if (objc_msgSend(v30, "carrierBundlingStatusType") == 2)
    {
      v35 = objc_msgSend(v30, "statusType") == 0;
      goto LABEL_50;
    }
  }
  else
  {
    if (v34 == 2)
    {
      v35 = 0;
      v36 = 1;
      goto LABEL_50;
    }
    v36 = 0;
  }
  v35 = 0;
LABEL_50:
  if (*(_BYTE *)(a1 + 99))
  {
    objc_msgSend(*(id *)(a1 + 40), "subscriptionStatus");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37
      && objc_msgSend(*(id *)(a1 + 32), "_carrierBundleStatusIsValidForCachedSubscriptionStatus:", v37))
    {
      if (v33 >= 2)
        objc_msgSend(v30, "setCarrierBundlingStatusType:", objc_msgSend(v37, "carrierBundlingStatusType"));
      objc_msgSend(v37, "cellularOperatorName");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setCellularOperatorName:", v38);

      objc_msgSend(v37, "phoneNumber");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setPhoneNumber:", v39);

      objc_msgSend(v37, "sessionIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setSessionIdentifier:", v40);

    }
    if (v35)
      goto LABEL_57;
    goto LABEL_59;
  }
  if (!v35)
  {
LABEL_59:
    v6 = v49;
    goto LABEL_60;
  }
LABEL_57:
  v41 = 1;
  v6 = v49;
LABEL_61:
  v42 = -[ICMusicSubscriptionCarrierBundlingEligibilityOperation initWithRequestContext:]([ICMusicSubscriptionCarrierBundlingEligibilityOperation alloc], "initWithRequestContext:", *(_QWORD *)(a1 + 64));
  if (objc_msgSend(*(id *)(a1 + 48), "reason") == 1)
    -[ICMusicSubscriptionCarrierBundlingEligibilityOperation setDeepLink:](v42, "setDeepLink:", 1);
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_2_30;
  v50[3] = &unk_1E438B348;
  v57 = v41;
  v56 = v28;
  v51 = v30;
  v58 = v36;
  v59 = *(_BYTE *)(a1 + 98);
  v52 = v26;
  v43 = *(id *)(a1 + 64);
  v44 = *(_QWORD *)(a1 + 32);
  v53 = v43;
  v54 = v44;
  v55 = v27;
  v45 = v30;
  v46 = v28;
  -[ICMusicSubscriptionCarrierBundlingEligibilityOperation setResponseHandler:](v42, "setResponseHandler:", v50);
  objc_msgSend(*(id *)(a1 + 32), "enqueueChildOperation:", v42);

LABEL_64:
}

void __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_27(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  if (*(_QWORD *)(a1 + 48))
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    v7 = (id)objc_msgSend(v5, "copy");
    objc_msgSend(v7, "setSubscriptionStatus:", v6);

    objc_msgSend(v7, "setFinalResponse:", a3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_2_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  v5 = a3;
  if (v19)
  {
    v6 = objc_msgSend(v19, "carrierBundlingStatusType");
    v7 = v6;
    if (*(_BYTE *)(a1 + 80) && v6 == 1)
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v19, "cellularProviderName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCellularOperatorName:", v9);

    v10 = *(void **)(a1 + 32);
    objc_msgSend(v19, "phoneNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPhoneNumber:", v11);

    if (v7 == 1)
    {
      if (!objc_msgSend(*(id *)(a1 + 32), "statusType") || objc_msgSend(*(id *)(a1 + 32), "statusType") == 2)
      {
        v12 = 2;
LABEL_20:
        objc_msgSend(*(id *)(a1 + 32), "setCarrierBundlingStatusType:", v12);
        goto LABEL_21;
      }
      if (objc_msgSend(*(id *)(a1 + 32), "carrierBundlingStatusType") == 2)
      {
LABEL_21:
        if (objc_msgSend(v19, "isFamilySubscription"))
          objc_msgSend(*(id *)(a1 + 32), "setReasonType:", 2);
        objc_msgSend(v19, "SMSSessionIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          objc_msgSend(v19, "headerEnrichmentSessionIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(*(id *)(a1 + 32), "setSessionIdentifier:", v13);
        if (*(_BYTE *)(a1 + 80) && v7 != 1)
          (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
        goto LABEL_28;
      }
    }
    objc_msgSend(v5, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("ICError")))
    {
      v16 = objc_msgSend(v5, "code");

      if (v16 == -7201)
      {
        v12 = 3;
        goto LABEL_20;
      }
    }
    else
    {

    }
    v12 = v7;
    goto LABEL_20;
  }
  objc_msgSend(v5, "msv_underlyingError");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("ICMusicSubscriptionCarrierBundlingServerError")))
    objc_msgSend(*(id *)(a1 + 32), "setCarrierBundlingErrorCode:", objc_msgSend(v13, "code"));
  objc_msgSend(*(id *)(a1 + 32), "setCarrierBundlingStatusType:", 0);
  if (*(_BYTE *)(a1 + 80))
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

LABEL_28:
  if (*(_BYTE *)(a1 + 81) && !*(_BYTE *)(a1 + 80))
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  if (*(_BYTE *)(a1 + 82))
  {
    v17 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(v17, "setSubscriptionStatus:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v17, "setFinalResponse:", 1);
    +[ICMusicSubscriptionStatusCache sharedCache](ICMusicSubscriptionStatusCache, "sharedCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCachedSubscriptionStatusResponse:forRequestContext:completion:", v17, *(_QWORD *)(a1 + 48), 0);

  }
  objc_msgSend(*(id *)(a1 + 56), "finishWithError:", *(_QWORD *)(a1 + 64));

}

@end
