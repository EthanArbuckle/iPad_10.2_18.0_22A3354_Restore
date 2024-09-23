@implementation WLKUTSNetworkRequestOperation

void __51__WLKUTSNetworkRequestOperation_prepareURLRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  os_signpost_id_t v9;
  void *v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  WLKNetworkSignpostLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(a1 + 32), "signpostIdentifier");
  if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B515A000, v7, OS_SIGNPOST_INTERVAL_END, v9, "NetworkRequest.Config", ", v11, 2u);
    }
  }

  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 392), "URLRequestWithConfiguration:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 400) = objc_msgSend(v5, "environmentHash");
  }
  else
  {
    v10 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setRequestProperties:(id)a3
{
  objc_storeStrong((id *)&self->_requestProperties, a3);
}

- (void)prepareURLRequest:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  WLKNetworkSignpostLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[WLKNetworkRequestOperation signpostIdentifier](self, "signpostIdentifier");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B515A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "NetworkRequest.Config", ", buf, 2u);
    }
  }

  +[WLKConfigurationManager sharedInstance](WLKConfigurationManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__WLKUTSNetworkRequestOperation_prepareURLRequest___block_invoke;
  v10[3] = &unk_1E68A9250;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:", 0, 4, 0, v10);

}

- (WLKUTSNetworkRequestOperation)initWithRequestProperties:(id)a3
{
  id v4;
  WLKUTSNetworkRequestOperation *v5;
  WLKUTSNetworkRequestOperation *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WLKUTSNetworkRequestOperation;
  v5 = -[WLKNetworkRequestOperation initWithURLRequest:options:](&v8, sel_initWithURLRequest_options_, 0, objc_msgSend(v4, "options"));
  v6 = v5;
  if (v5)
    -[WLKUTSNetworkRequestOperation setRequestProperties:](v5, "setRequestProperties:", v4);

  return v6;
}

- (void)handleResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allHeaderFields");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "wlk_caseInsensitiveValueForKey:", CFSTR("X-Apple-utsk-expired"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[WLKConfigurationManager sharedInstance](WLKConfigurationManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:", 0, 3, 0, &__block_literal_global_46);

    v16.receiver = self;
    v16.super_class = (Class)WLKUTSNetworkRequestOperation;
    -[WLKNetworkRequestOperation handleResult:error:](&v16, sel_handleResult_error_, v6, v7);
  }
  else
  {
    objc_msgSend(v8, "allHeaderFields");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "wlk_caseInsensitiveValueForKey:", CFSTR("X-Apple-utsk"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "length"))
    {
      +[WLKConfigurationManager sharedInstance](WLKConfigurationManager, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_setUtsk:", v13);

    }
    v15.receiver = self;
    v15.super_class = (Class)WLKUTSNetworkRequestOperation;
    -[WLKNetworkRequestOperation handleResult:error:](&v15, sel_handleResult_error_, v6, v7);

  }
}

- (void)configureSession
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WLKUTSNetworkRequestOperation;
  -[WLKNetworkRequestOperation configureSession](&v2, sel_configureSession);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

- (WLKUTSNetworkRequestOperation)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WLKUTSNetworkRequestOperation"), CFSTR("-init is not supported"));

  return 0;
}

- (id)shortDescription
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[WLKNetworkRequestOperation identifier](self, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1E68AA228;
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  if ((unint64_t)-[__CFString length](v6, "length") >= 7)
  {
    -[WLKNetworkRequestOperation identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "substringToIndex:", 7);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v8;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  -[WLKUTSNetworkRequestOperation requestProperties](self, "requestProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shortDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ %@"), v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __52__WLKUTSNetworkRequestOperation_handleResult_error___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  WLKNetworkingLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B515A000, v0, OS_LOG_TYPE_DEFAULT, "WLKUTSNetworkRequestOperation - X-Apple-utsk-expired is set to true. Fetches init/config", v1, 2u);
  }

}

- (id)responseDictionary
{
  NSDictionary *responseDictionary;
  WLKDictionaryResponseProcessor *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *v11;

  responseDictionary = self->_responseDictionary;
  if (!responseDictionary)
  {
    v4 = objc_alloc_init(WLKDictionaryResponseProcessor);
    -[WLKNetworkRequestOperation data](self, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLKDictionaryResponseProcessor processResponseData:error:](v4, "processResponseData:error:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "wlk_dictionaryForKey:", CFSTR("data"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (void *)v7;
    else
      v9 = v6;
    v10 = v9;
    v11 = self->_responseDictionary;
    self->_responseDictionary = v10;

    responseDictionary = self->_responseDictionary;
  }
  return responseDictionary;
}

- (WLKURLRequestProperties)requestProperties
{
  return self->_requestProperties;
}

- (unint64_t)environmentHash
{
  return self->_environmentHash;
}

- (void)setEnvironmentHash:(unint64_t)a3
{
  self->_environmentHash = a3;
}

- (BOOL)didHandleInvalidConfig
{
  return self->_didHandleInvalidConfig;
}

- (void)setDidHandleInvalidConfig:(BOOL)a3
{
  self->_didHandleInvalidConfig = a3;
}

@end
