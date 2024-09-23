@implementation WLKSubscriptionDataRequestOperation

- (WLKSubscriptionDataRequestOperation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WLKSubscriptionDataRequestOperation;
  return -[WLKNetworkRequestOperation initWithURLRequest:options:](&v3, sel_initWithURLRequest_options_, 0, 0);
}

- (void)prepareURLRequest:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void (**)(id, void *, _QWORD))a3;
  v7 = 0;
  objc_msgSend((id)objc_opt_class(), "_requestURL:", &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTimeoutInterval:", 15.0);
    v3[2](v3, v6, 0);

  }
  else
  {
    ((void (**)(id, void *, id))v3)[2](v3, 0, v5);
  }

}

- (void)processResponse
{
  WLKDictionaryResponseProcessor *v3;
  void *v4;
  void *v5;
  NSDictionary **p_response;
  NSObject *v7;
  NSDictionary *v8;
  int v9;
  NSDictionary *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(WLKDictionaryResponseProcessor);
  -[WLKNetworkRequestOperation data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKDictionaryResponseProcessor processResponseData:error:](v3, "processResponseData:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  p_response = &self->_response;
  objc_storeStrong((id *)&self->_response, v5);
  WLKNetworkingLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *p_response;
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1B515A000, v7, OS_LOG_TYPE_DEFAULT, "WLKSubscriptionDataRequestOperation - response: %@", (uint8_t *)&v9, 0xCu);
  }

}

+ (id)_requestURL:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.WatchListKit"));
  objc_msgSend(v3, "stringForKey:", CFSTR("SubscriptionSyncTestEndpointURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DB1840], "app");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "urlForKey:", CFSTR("tvSubscriptionStatus"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (NSDictionary)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
}

@end
