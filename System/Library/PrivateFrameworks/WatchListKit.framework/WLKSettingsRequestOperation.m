@implementation WLKSettingsRequestOperation

- (WLKSettingsRequestOperation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WLKSettingsRequestOperation;
  return -[WLKNetworkRequestOperation initWithURLRequest:options:](&v3, sel_initWithURLRequest_options_, 0, 0);
}

- (void)prepareURLRequest:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  __int16 v12;
  id v13;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v13 = 0;
  objc_msgSend((id)objc_opt_class(), "_requestURL:", &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (v5)
  {
    WLKNetworkSignpostLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_make_with_pointer(v7, self);

    WLKNetworkSignpostLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B515A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "Settings.URLRequest", ", (uint8_t *)&v12, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTimeoutInterval:", 5.0);
    v4[2](v4, v11, 0);

  }
  else
  {
    ((void (**)(id, void *, id))v4)[2](v4, 0, v6);
  }

}

- (void)processResponse
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  WLKDictionaryResponseProcessor *v7;
  void *v8;
  void *v9;
  NSDictionary **p_response;
  NSObject *v11;
  NSDictionary *v12;
  int v13;
  NSDictionary *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WLKNetworkSignpostLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  WLKNetworkSignpostLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v6, OS_SIGNPOST_INTERVAL_END, v4, "Settings.URLRequest", ", (uint8_t *)&v13, 2u);
  }

  v7 = objc_alloc_init(WLKDictionaryResponseProcessor);
  -[WLKNetworkRequestOperation data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKDictionaryResponseProcessor processResponseData:error:](v7, "processResponseData:error:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  p_response = &self->_response;
  objc_storeStrong((id *)&self->_response, v9);
  WLKNetworkingLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *p_response;
    v13 = 138412290;
    v14 = v12;
    _os_log_impl(&dword_1B515A000, v11, OS_LOG_TYPE_DEFAULT, "WLKSettingsRequestOperation - response: %@", (uint8_t *)&v13, 0xCu);
  }

}

+ (id)_requestURL:(id *)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DB1840], "app", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedURLForKey:", kBagKeyGetWatchListSettings);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
