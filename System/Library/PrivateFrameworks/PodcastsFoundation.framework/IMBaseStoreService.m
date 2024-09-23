@implementation IMBaseStoreService

- (IMBaseStoreService)initWithConcurrentOperationCount:(int64_t)a3 requestEncodingType:(unint64_t)a4
{
  IMBaseStoreService *v6;
  uint64_t v7;
  NSURLSessionConfiguration *configuration;
  IMURLSession *v9;
  IMURLSession *amsUrlSession;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IMBaseStoreService;
  v6 = -[IMBaseStoreService init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v7 = objc_claimAutoreleasedReturnValue();
    configuration = v6->_configuration;
    v6->_configuration = (NSURLSessionConfiguration *)v7;

    if (a3 != -1)
      -[NSURLSessionConfiguration setHTTPMaximumConnectionsPerHost:](v6->_configuration, "setHTTPMaximumConnectionsPerHost:", a3);
    v9 = -[AMSURLSession initWithConfiguration:]([IMURLSession alloc], "initWithConfiguration:", v6->_configuration);
    amsUrlSession = v6->_amsUrlSession;
    v6->_amsUrlSession = v9;

    -[IMURLSession setFollowsRedirects:](v6->_amsUrlSession, "setFollowsRedirects:", objc_msgSend((id)objc_opt_class(), "shouldFollowRedirects"));
    v6->_encodingType = a4;
    if (a4 == 1)
      v6->_personalizeRequests = 1;
  }
  return v6;
}

+ (BOOL)shouldFollowRedirects
{
  return 1;
}

- (void)setPersonalizeRequests:(BOOL)a3
{
  self->_personalizeRequests = a3;
}

- (void)performDataRequest:(id)a3 account:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL wantsJSSignature;
  unint64_t encodingType;
  IMURLRequestEncoder *v13;
  void *v14;
  uint64_t v15;
  IMMediaRequestEncoder *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  BOOL v22;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  wantsJSSignature = self->_wantsJSSignature;
  encodingType = self->_encodingType;
  if (encodingType == 1)
  {
    v16 = [IMMediaRequestEncoder alloc];
    -[IMBaseStoreService bag](self, "bag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[IMMediaRequestEncoder initWithBag:session:](v16, "initWithBag:session:", v14, self->_amsUrlSession);
  }
  else
  {
    if (encodingType)
    {
      v17 = 0;
      goto LABEL_7;
    }
    v13 = [IMURLRequestEncoder alloc];
    -[IMBaseStoreService bag](self, "bag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[IMURLRequestEncoder initWithBag:](v13, "initWithBag:", v14);
  }
  v17 = (void *)v15;

LABEL_7:
  objc_msgSend(v17, "setPersonalizeRequests:", -[IMBaseStoreService personalizeRequests](self, "personalizeRequests"));
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __58__IMBaseStoreService_performDataRequest_account_callback___block_invoke;
  v19[3] = &unk_1E54D33E8;
  v22 = wantsJSSignature;
  v19[4] = self;
  objc_copyWeak(&v21, &location);
  v18 = v10;
  v20 = v18;
  objc_msgSend(v17, "prepareRequest:account:completion:", v8, v9, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (BOOL)personalizeRequests
{
  return self->_personalizeRequests;
}

- (id)bag
{
  return +[IMURLBag sharedInstance](IMURLBag, "sharedInstance");
}

- (IMURLSession)amsUrlSession
{
  return self->_amsUrlSession;
}

- (IMBaseStoreService)init
{
  return -[IMBaseStoreService initWithConcurrentOperationCount:requestEncodingType:](self, "initWithConcurrentOperationCount:requestEncodingType:", -1, 0);
}

- (void)setURLProtocolDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMBaseStoreService amsUrlSession](self, "amsUrlSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

+ (BOOL)isValidResponseJson:(id)a3 response:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  BOOL v12;
  id v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    _IMStoreLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v15 = 138543362;
      v16 = v9;
      v11 = "performUrlRequest completed with error %{public}@";
LABEL_9:
      _os_log_impl(&dword_1A904E000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v15, 0xCu);
    }
  }
  else if (v8 && (objc_msgSend(v8, "statusCode") < 200 || objc_msgSend(v8, "statusCode") >= 300))
  {
    _IMStoreLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v15 = 134217984;
      v16 = (id)objc_msgSend(v8, "statusCode");
      v11 = "performUrlRequest completed with bad status code: %ld";
      goto LABEL_9;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = 1;
      goto LABEL_11;
    }
    _IMStoreLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v15 = 138543362;
      v16 = (id)objc_opt_class();
      v14 = v16;
      _os_log_impl(&dword_1A904E000, v10, OS_LOG_TYPE_ERROR, "Recived non-dictionary response. Discarding. (%{public}@)", (uint8_t *)&v15, 0xCu);

    }
  }

  v12 = 0;
LABEL_11:

  return v12;
}

- (void)performUrlRequest:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__IMBaseStoreService_performUrlRequest_callback___block_invoke;
  v8[3] = &unk_1E54D0F20;
  v9 = v6;
  v7 = v6;
  -[IMBaseStoreService performDataRequest:callback:](self, "performDataRequest:callback:", a3, v8);

}

void __49__IMBaseStoreService_performUrlRequest_callback___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (*(_QWORD *)(a1 + 32))
  {
    if (+[IMBaseStoreService isValidResponseJson:response:error:](IMBaseStoreService, "isValidResponseJson:response:error:", v9, v10, v11))
    {
      v12 = v9;
    }
    else
    {
      v12 = 0;
    }
    (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v12);
  }

}

- (void)performDataRequest:(id)a3 callback:(id)a4
{
  -[IMBaseStoreService performDataRequest:account:callback:](self, "performDataRequest:account:callback:", a3, 0, a4);
}

void __58__IMBaseStoreService_performDataRequest_account_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "signRequest:", v5);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "amsUrlSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v8);

  v9 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v9, "amsUrlSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataTaskPromiseWithRequest:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__IMBaseStoreService_performDataRequest_account_callback___block_invoke_2;
  v12[3] = &unk_1E54D33C0;
  objc_copyWeak(&v14, &location);
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v11, "resultWithTimeout:completion:", v12, 60.0);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __58__IMBaseStoreService_performDataRequest_account_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t isKindOfClass;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained && !objc_msgSend(WeakRetained, "state"))
  {
    if (!*(_QWORD *)(a1 + 32))
      goto LABEL_6;
    objc_msgSend(v5, "response");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "response");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v6)
        goto LABEL_20;
    }
    else
    {
      v12 = 0;
      if (v6)
        goto LABEL_20;
    }
    objc_msgSend(v5, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v5, "data");
      isKindOfClass = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)isKindOfClass, "length"))
      {

LABEL_19:
        v6 = 0;
        goto LABEL_20;
      }
    }
    objc_msgSend(v5, "object");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (v14 | v12) == 0;

    if (v13)
    {

      if (!v15)
        goto LABEL_19;
    }
    else if (!v15)
    {
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.podcasts.IMBaseStoreService"), 1, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
    v16 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "object");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, uint64_t, id))(v16 + 16))(v16, v17, v18, v12, v6);

    goto LABEL_6;
  }
  _IMStoreLogCategoryDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_1A904E000, v9, OS_LOG_TYPE_ERROR, "Discarding response for invalidated session", v19, 2u);
  }

LABEL_6:
}

- (void)cancelAllRequests
{
  IMURLSession *v3;
  IMURLSession *amsUrlSession;
  IMURLSession *v5;

  v5 = self->_amsUrlSession;
  v3 = -[AMSURLSession initWithConfiguration:]([IMURLSession alloc], "initWithConfiguration:", self->_configuration);
  amsUrlSession = self->_amsUrlSession;
  self->_amsUrlSession = v3;

  -[IMURLSession invalidateAndCancel](v5, "invalidateAndCancel");
}

- (void)signRequest:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  const void *v24;
  void *v25;
  CC_LONG v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;

  objc_msgSend(v5, "appendFormat:", CFSTR("%.0f"), v8);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("X-JS-TIMESTAMP=%.0f"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v9);

  objc_msgSend(v3, "valueForHTTPHeaderField:", CFSTR("X-Apple-Store-Front"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v5, "appendString:", v10);
  v11 = (void *)MEMORY[0x1E0CB3998];
  objc_msgSend(v3, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsWithURL:resolvingAgainstBaseURL:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = v13;
  objc_msgSend(v13, "query");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSURLUtil queryStringToQueryDictionary:](NSURLUtil, "queryStringToQueryDictionary:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend((id)objc_opt_class(), "signatureQueryParams");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v34;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(v15, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v20));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend(v5, "appendString:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v18);
  }

  v22 = objc_retainAutorelease(v5);
  v23 = objc_msgSend(v22, "UTF8String");
  if (v23)
  {
    v24 = (const void *)v23;
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 20);
    v26 = objc_msgSend(v22, "length");
    v27 = objc_retainAutorelease(v25);
    CC_SHA1(v24, v26, (unsigned __int8 *)objc_msgSend(v27, "mutableBytes"));
    objc_msgSend(v27, "setLength:", 16);
    v28 = objc_retainAutorelease(v27);
    fd3fa4R8(3, objc_msgSend(v28, "mutableBytes"));
    objc_msgSend(v28, "base64EncodedStringWithOptions:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("X-JS-SP-TOKEN=%@"), v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v30);

    }
  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR("; "));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forHTTPHeaderField:", v31, CFSTR("Cookie"));

  }
}

+ (id)signatureQueryParams
{
  if (signatureQueryParams_predicate != -1)
    dispatch_once(&signatureQueryParams_predicate, &__block_literal_global_17);
  return (id)signatureQueryParams_signatureQueryParams;
}

void __42__IMBaseStoreService_signatureQueryParams__block_invoke()
{
  void *v0;

  v0 = (void *)signatureQueryParams_signatureQueryParams;
  signatureQueryParams_signatureQueryParams = (uint64_t)&unk_1E5539600;

}

- (BOOL)wantsJSSignature
{
  return self->_wantsJSSignature;
}

- (void)setWantsJSSignature:(BOOL)a3
{
  self->_wantsJSSignature = a3;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURLSessionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (unint64_t)encodingType
{
  return self->_encodingType;
}

- (void)setEncodingType:(unint64_t)a3
{
  self->_encodingType = a3;
}

- (void)setAmsUrlSession:(id)a3
{
  objc_storeStrong((id *)&self->_amsUrlSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amsUrlSession, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_callback, 0);
}

@end
