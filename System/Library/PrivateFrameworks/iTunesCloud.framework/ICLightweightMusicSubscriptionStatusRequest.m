@implementation ICLightweightMusicSubscriptionStatusRequest

- (ICLightweightMusicSubscriptionStatusRequest)initWithRequestContext:(id)a3
{
  id v4;
  ICLightweightMusicSubscriptionStatusRequest *v5;
  uint64_t v6;
  ICStoreRequestContext *requestContext;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICLightweightMusicSubscriptionStatusRequest;
  v5 = -[ICRequestOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    requestContext = v5->_requestContext;
    v5->_requestContext = (ICStoreRequestContext *)v6;

  }
  return v5;
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__ICLightweightMusicSubscriptionStatusRequest_performRequestWithResponseHandler___block_invoke;
  v6[3] = &unk_1E43915E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ICRequestOperation performRequestWithCompletionHandler:](self, "performRequestWithCompletionHandler:", v6);

}

- (void)execute
{
  ICMusicSubscriptionStatusRequest *v3;
  ICMusicSubscriptionStatusRequestOperation *v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  ICLightweightMusicSubscriptionStatusRequest *v8;
  __int16 v9;
  ICMusicSubscriptionStatusRequest *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = -[ICMusicSubscriptionStatusRequest initWithStoreRequestContext:]([ICMusicSubscriptionStatusRequest alloc], "initWithStoreRequestContext:", self->_requestContext);
  -[ICMusicSubscriptionStatusRequest setAllowsFallbackToExpiredStatus:](v3, "setAllowsFallbackToExpiredStatus:", 0);
  -[ICMusicSubscriptionStatusRequest setAllowsFallbackToStatusNeedingReload:](v3, "setAllowsFallbackToStatusNeedingReload:", 0);
  -[ICMusicSubscriptionStatusRequest setShouldIgnoreCache:](v3, "setShouldIgnoreCache:", 1);
  -[ICMusicSubscriptionStatusRequest setShouldReturnLastKnownStatusOnly:](v3, "setShouldReturnLastKnownStatusOnly:", 0);
  -[ICMusicSubscriptionStatusRequest setShouldBypassEnforcementOfPrivacyAcknowledgement:](v3, "setShouldBypassEnforcementOfPrivacyAcknowledgement:", 1);
  v4 = -[ICMusicSubscriptionStatusRequestOperation initWithRequest:]([ICMusicSubscriptionStatusRequestOperation alloc], "initWithRequest:", v3);
  -[ICMusicSubscriptionStatusRequestOperation setAllowsFuseHeaderEnrichment:](v4, "setAllowsFuseHeaderEnrichment:", 0);
  -[ICMusicSubscriptionStatusRequestOperation setShouldRequestLightweightStatus:](v4, "setShouldRequestLightweightStatus:", 1);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__ICLightweightMusicSubscriptionStatusRequest_execute__block_invoke;
  v6[3] = &unk_1E4389AD0;
  v6[4] = self;
  -[ICMusicSubscriptionStatusRequestOperation setResponseHandler:](v4, "setResponseHandler:", v6);
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing lightweight subscription status request. Extended request: %{public}@.", buf, 0x16u);
  }

  -[ICAsyncOperation enqueueChildOperation:](self, "enqueueChildOperation:", v4);
}

- (void)_finishWithExtendedSubscriptionStatusResponse:(id)a3 error:(id)a4
{
  id v6;
  ICLightweightMusicSubscriptionStatusResponse *v7;
  ICLightweightMusicSubscriptionStatusResponse *response;
  id v9;

  v9 = a4;
  if (a3)
  {
    v6 = a3;
    v7 = -[ICLightweightMusicSubscriptionStatusResponse _initWithExtendedSubscriptionStatusResponse:]([ICLightweightMusicSubscriptionStatusResponse alloc], "_initWithExtendedSubscriptionStatusResponse:", v6);

    response = self->_response;
    self->_response = v7;

  }
  -[ICRequestOperation finishWithError:](self, "finishWithError:", v9);

}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setRequestContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

uint64_t __54__ICLightweightMusicSubscriptionStatusRequest_execute__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithExtendedSubscriptionStatusResponse:error:", a2, a3);
}

uint64_t __81__ICLightweightMusicSubscriptionStatusRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312), a2);
}

@end
