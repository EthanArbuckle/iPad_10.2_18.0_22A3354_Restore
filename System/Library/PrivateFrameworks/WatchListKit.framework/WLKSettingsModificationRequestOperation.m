@implementation WLKSettingsModificationRequestOperation

- (WLKSettingsModificationRequestOperation)initWithModifications:(id)a3
{
  id v5;
  WLKSettingsModificationRequestOperation *v6;
  WLKSettingsModificationRequestOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WLKSettingsModificationRequestOperation;
  v6 = -[WLKNetworkRequestOperation initWithURLRequest:options:](&v9, sel_initWithURLRequest_options_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_modifications, a3);

  return v7;
}

- (void)prepareURLRequest:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v9 = 0;
  objc_msgSend((id)objc_opt_class(), "_requestURL:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v5);
    objc_msgSend(v7, "setHTTPMethod:", CFSTR("POST"));
    -[WLKSettingsModificationRequestOperation _postBody](self, "_postBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHTTPBody:", v8);

    objc_msgSend(v7, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
    v4[2](v4, v7, 0);

  }
  else
  {
    ((void (**)(id, void *, id))v4)[2](v4, 0, v6);
  }

}

+ (id)_requestURL:(id *)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DB1840], "app", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedURLForKey:", kBagKeyUpdateWatchListSettings);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_postBody
{
  NSObject *v3;
  NSDictionary *modifications;
  NSDictionary *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v10;
  uint8_t buf[4];
  NSDictionary *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WLKNetworkingLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    modifications = self->_modifications;
    *(_DWORD *)buf = 138412290;
    v12 = modifications;
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKSettingsModificationRequestOperation - posting: %@", buf, 0xCu);
  }

  v5 = self->_modifications;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 0, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = 0;
  if (!v10)
    v8 = v6;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifications, 0);
}

@end
