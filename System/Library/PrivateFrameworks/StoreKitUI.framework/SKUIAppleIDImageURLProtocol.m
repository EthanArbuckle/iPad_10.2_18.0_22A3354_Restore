@implementation SKUIAppleIDImageURLProtocol

+ (BOOL)canInitWithRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    +[SKUIAppleIDImageURLProtocol canInitWithRequest:].cold.1();
  }
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", CFSTR("x-apple-identity-image"));
  return (char)v4;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  return a3;
}

- (void)startLoading
{
  OUTLINED_FUNCTION_1();
}

void __43__SKUIAppleIDImageURLProtocol_startLoading__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_startLoading");

}

- (void)_startLoading
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIImage *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  -[NSURLProtocol request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "query");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "copyDictionaryForQueryString:unescapedValues:", v21, 1);
  objc_msgSend(v5, "objectForKey:", CFSTR("firstName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("lastName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("email"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("dsid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v9, "longLongValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  SKUIGetFamilyMemberImage(v6, v7, v8, v10);
  v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
  -[NSURLProtocol client](self, "client");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v13 = objc_alloc(MEMORY[0x1E0C92C88]);
    -[NSURLProtocol request](self, "request");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URL");
    v20 = v8;
    v15 = v7;
    v16 = v6;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v13, "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v17, CFSTR("image/png"), -1, 0);

    objc_msgSend(v12, "URLProtocol:didReceiveResponse:cacheStoragePolicy:", self, v18, 1);
    UIImagePNGRepresentation(v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLProtocol:didLoadData:", self, v19);

    v6 = v16;
    v7 = v15;
    v8 = v20;
    objc_msgSend(v12, "URLProtocolDidFinishLoading:", self);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKUIErrorDomain"), 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLProtocol:didFailWithError:", self, v18);
  }

}

+ (void)canInitWithRequest:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "+[SKUIAppleIDImageURLProtocol canInitWithRequest:]";
  OUTLINED_FUNCTION_1();
}

@end
