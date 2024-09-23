@implementation SKUIGiftPurchaseRequest

- (SKUIGiftPurchaseRequest)initWithDonation:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIGiftPurchaseRequest *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  SKUIURLConnectionRequest *request;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIGiftPurchaseRequest initWithDonation:configuration:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIGiftPurchaseRequest;
  v16 = -[SKUIGiftPurchaseRequest init](&v22, sel_init);
  if (v16)
  {
    objc_msgSend(v7, "donationPurchaseURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "HTTPBodyDictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftPurchaseRequest _requestWithURL:bodyDictionary:](v16, "_requestWithURL:bodyDictionary:", v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    request = v16->_request;
    v16->_request = (SKUIURLConnectionRequest *)v19;

  }
  return v16;
}

- (SKUIGiftPurchaseRequest)initWithGift:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIGiftPurchaseRequest *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  SKUIURLConnectionRequest *request;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIGiftPurchaseRequest initWithGift:configuration:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIGiftPurchaseRequest;
  v16 = -[SKUIGiftPurchaseRequest init](&v22, sel_init);
  if (v16)
  {
    objc_msgSend(v7, "giftPurchaseURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "HTTPBodyDictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftPurchaseRequest _requestWithURL:bodyDictionary:](v16, "_requestWithURL:bodyDictionary:", v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    request = v16->_request;
    v16->_request = (SKUIURLConnectionRequest *)v19;

  }
  return v16;
}

- (void)purchaseWithCompletionBlock:(id)a3
{
  id v4;
  SKUIURLConnectionRequest *request;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  request = self->_request;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SKUIGiftPurchaseRequest_purchaseWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E73A9160;
  v8 = v4;
  v6 = v4;
  -[SKUIURLConnectionRequest startWithConnectionResponseBlock:](request, "startWithConnectionResponseBlock:", v7);

}

void __55__SKUIGiftPurchaseRequest_purchaseWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(a2, "bodyData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("status"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v7, "integerValue"))
      {
        v9 = 0;
      }
      else
      {
        objc_msgSend(v6, "objectForKey:", CFSTR("dialog"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = 0;
        }
        else
        {
          objc_msgSend(v6, "objectForKey:", CFSTR("userPresentableErrorMessage"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v9 = v10;
          else
            v9 = 0;

        }
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    objc_msgSend(v11, "localizedDescription");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_requestWithURL:(id)a3 bodyDictionary:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  SKUIURLConnectionRequest *v10;

  v5 = (objc_class *)MEMORY[0x1E0DAF5C8];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithURL:", v7);

  objc_msgSend(v8, "setAllowedRetryCount:", 0);
  objc_msgSend(v8, "setITunesStoreRequest:", 1);
  objc_msgSend(v8, "setKBSyncType:", 2);
  objc_msgSend(v8, "setRequestParameters:", v6);

  objc_msgSend(v8, "setShouldProcessProtocol:", 1);
  objc_msgSend(v8, "setShouldSendSecureToken:", 1);
  SSVDefaultUserAgent();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forHTTPHeaderField:", v9, CFSTR("User-Agent"));

  objc_msgSend(v8, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v8, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v10 = -[SSURLConnectionRequest initWithRequestProperties:]([SKUIURLConnectionRequest alloc], "initWithRequestProperties:", v8);
  -[SSURLConnectionRequest setShouldMescalSign:](v10, "setShouldMescalSign:", 1);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)initWithDonation:(uint64_t)a3 configuration:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithGift:(uint64_t)a3 configuration:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
