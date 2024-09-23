@implementation ICRadioURLRequest

- (ICRadioURLRequest)initWithURLRequest:(id)a3 requestContext:(id)a4
{
  ICRadioURLRequest *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICRadioURLRequest;
  result = -[ICStoreURLRequest initWithURLRequest:requestContext:](&v5, sel_initWithURLRequest_requestContext_, a3, a4);
  if (result)
    result->_protocolVersion = 5;
  return result;
}

- (void)buildStoreURLRequestWithURLRequest:(id)a3 builderProperties:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  objc_super v18;
  _QWORD v19[5];
  id v20;
  id v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  _QWORD v23[4];
  id v24;
  ICRadioURLRequest *v25;
  id v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __92__ICRadioURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke;
  v23[3] = &unk_1E4390530;
  v12 = v8;
  v24 = v12;
  v25 = self;
  v13 = v9;
  v26 = v13;
  v14 = v10;
  v27 = v14;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AFA8D0](v23);
  -[ICRadioURLRequest radioContentDictionaryCreationBlock](self, "radioContentDictionaryCreationBlock");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __92__ICRadioURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke_12;
    v19[3] = &unk_1E4390558;
    v19[4] = self;
    v20 = v13;
    v21 = v16;
    v22 = v15;
    v18.receiver = self;
    v18.super_class = (Class)ICRadioURLRequest;
    -[ICStoreURLRequest buildStoreURLRequestWithURLRequest:builderProperties:completionHandler:](&v18, sel_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler_, v12, v20, v19);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7101, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v15)[2](v15, 0, v17);

  }
}

- (void)_decorateHeaderPropertiesForURLRequest:(id)a3 withBuilderProperties:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  NSNumber *privateListeningEnabled;
  const __CFString *v16;
  NSNumber *delegatedPrivateListeningEnabled;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v6 = a4;
  -[ICStoreURLRequest storeRequestContext](self, "storeRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICRadioURLRequest protocolVersion](self, "protocolVersion");
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "buildVersion");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = &stru_1E4391778;
  if (v11)
    v13 = (const __CFString *)v11;
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%ld/%@"), v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setValue:forHTTPHeaderField:", v14, CFSTR("X-Apple-Radio-Client-Version"));
  privateListeningEnabled = self->_privateListeningEnabled;
  if (privateListeningEnabled)
  {
    if (-[NSNumber BOOLValue](privateListeningEnabled, "BOOLValue"))
      v16 = CFSTR("true");
    else
      v16 = CFSTR("false");
    objc_msgSend(v23, "setValue:forHTTPHeaderField:", v16, CFSTR("X-Apple-Private-Listening"));
  }
  delegatedPrivateListeningEnabled = self->_delegatedPrivateListeningEnabled;
  if (delegatedPrivateListeningEnabled)
  {
    if (-[NSNumber BOOLValue](delegatedPrivateListeningEnabled, "BOOLValue"))
      v18 = CFSTR("true");
    else
      v18 = CFSTR("false");
    objc_msgSend(v23, "setValue:forHTTPHeaderField:", v18, CFSTR("X-Apple-Enqueuer-Private-Listening"));
  }
  objc_msgSend(v6, "URLBag");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "radioConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "URL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21 && objc_msgSend(v20, "shouldIncludeHTTPHeaderField:forRequestURL:", CFSTR("X-Guid"), v21))
  {
    objc_msgSend(v8, "deviceGUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      objc_msgSend(v23, "setValue:forHTTPHeaderField:", v22, CFSTR("X-Guid"));

  }
}

- (BOOL)isBackgroundRadioRequest
{
  return self->_backgroundRadioRequest;
}

- (void)setBackgroundRadioRequest:(BOOL)a3
{
  self->_backgroundRadioRequest = a3;
}

- (NSNumber)isPrivateListeningEnabled
{
  return self->_privateListeningEnabled;
}

- (void)setPrivateListeningEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSNumber)isDelegatedPrivateListeningEnabled
{
  return self->_delegatedPrivateListeningEnabled;
}

- (void)setDelegatedPrivateListeningEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(int64_t)a3
{
  self->_protocolVersion = a3;
}

- (id)radioContentDictionaryCreationBlock
{
  return self->_radioContentDictionaryCreationBlock;
}

- (void)setRadioContentDictionaryCreationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_radioContentDictionaryCreationBlock, 0);
  objc_storeStrong((id *)&self->_delegatedPrivateListeningEnabled, 0);
  objc_storeStrong((id *)&self->_privateListeningEnabled, 0);
}

void __92__ICRadioURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (*(_QWORD *)(a1 + 56))
    {
      v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218499;
        v19 = v8;
        v20 = 2113;
        v21 = v5;
        v22 = 2114;
        v23 = v6;
        _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "<ICStoreURLRequest %p> encountered error building url request contentDictionary=%{private}@ error=%{public}@", buf, 0x20u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }
  else
  {
    v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = objc_msgSend(*(id *)(a1 + 40), "protocolVersion");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("version"));

    if (v5)
      objc_msgSend(v10, "setObject:forKey:", v5, CFSTR("content"));
    if (objc_msgSend(*(id *)(a1 + 40), "isBackgroundRadioRequest"))
      objc_msgSend(v10, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("is-async"));
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v10, 200, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      MSVGzipCompressData();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "length"))
      {
        objc_msgSend(v9, "setHTTPBody:", v14);
        objc_msgSend(v9, "setValue:forHTTPHeaderField:", CFSTR("gzip"), CFSTR("Content-Encoding"));
      }
      else
      {
        objc_msgSend(v9, "setHTTPBody:", v13);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "_decorateHeaderPropertiesForURLRequest:withBuilderProperties:", v9, *(_QWORD *)(a1 + 48));
    v15 = *(_QWORD *)(a1 + 48);
    v16 = *(_QWORD *)(a1 + 56);
    v17.receiver = *(id *)(a1 + 40);
    v17.super_class = (Class)ICRadioURLRequest;
    objc_msgSendSuper2(&v17, sel_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler_, v9, v15, v16);

  }
}

void __92__ICRadioURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;

  if (a2)
  {
    v3 = (id)objc_msgSend(a2, "mutableCopy");
    objc_msgSend(*(id *)(a1 + 32), "_decorateHeaderPropertiesForURLRequest:withBuilderProperties:", v3, *(_QWORD *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

@end
