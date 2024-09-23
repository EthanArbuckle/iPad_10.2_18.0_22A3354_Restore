@implementation SSURLRequestProperties

- (SSURLRequestProperties)init
{
  return -[SSURLRequestProperties initWithURLRequest:](self, "initWithURLRequest:", 0);
}

void __40__SSURLRequestProperties_copyURLRequest__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  BOOL v4;
  double v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "setAllHTTPHeaderFields:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
  objc_msgSend(*(id *)(a1 + 32), "setCachePolicy:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
  objc_msgSend(*(id *)(a1 + 32), "setHTTPBody:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80));
  objc_msgSend(*(id *)(a1 + 32), "setHTTPBodyStream:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
  objc_msgSend(*(id *)(a1 + 32), "setHTTPMethod:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104));
  objc_msgSend(*(id *)(a1 + 32), "setNetworkServiceType:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 144));
  v2 = *(double *)(*(_QWORD *)(a1 + 40) + 176);
  v3 = 10.0;
  if (v2 >= 10.0)
    v3 = *(double *)(*(_QWORD *)(a1 + 40) + 176);
  v4 = v2 < 2.22044605e-16;
  v5 = 60.0;
  if (!v4)
    v5 = v3;
  objc_msgSend(*(id *)(a1 + 32), "setTimeoutInterval:", v5);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 208), "count"))
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 208), "objectAtIndex:", 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setURL:", v7);

  }
}

- (id)copyURLRequest
{
  id v3;
  NSObject *dispatchQueue;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  SSURLRequestProperties *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A8]);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__SSURLRequestProperties_copyURLRequest__block_invoke;
  v8[3] = &unk_1E47B8768;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_sync(dispatchQueue, v8);
  v6 = v5;

  return v6;
}

- (SSURLRequestProperties)initWithURLRequest:(id)a3
{
  id v4;
  SSURLRequestProperties *v5;
  SSURLRequestProperties *v6;
  uint64_t v7;
  NSData *httpBody;
  uint64_t v9;
  NSInputStream *httpBodyStream;
  uint64_t v11;
  NSDictionary *httpHeaders;
  uint64_t v13;
  NSString *httpMethod;
  double v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSArray *urls;
  NSString *v20;

  v4 = a3;
  v5 = -[SSURLRequestProperties _initCommon](self, "_initCommon");
  v6 = v5;
  if (v5)
  {
    v5->_allowedRetryCount = -1;
    v5->_requiresExtendedValidationCertificates = -1;
    v5->_shouldDecodeResponse = 1;
    v5->_shouldSetCookies = 1;
    if (v4)
    {
      v5->_cachePolicy = objc_msgSend(v4, "cachePolicy");
      objc_msgSend(v4, "HTTPBody");
      v7 = objc_claimAutoreleasedReturnValue();
      httpBody = v6->_httpBody;
      v6->_httpBody = (NSData *)v7;

      objc_msgSend(v4, "HTTPBodyStream");
      v9 = objc_claimAutoreleasedReturnValue();
      httpBodyStream = v6->_httpBodyStream;
      v6->_httpBodyStream = (NSInputStream *)v9;

      objc_msgSend(v4, "allHTTPHeaderFields");
      v11 = objc_claimAutoreleasedReturnValue();
      httpHeaders = v6->_httpHeaders;
      v6->_httpHeaders = (NSDictionary *)v11;

      objc_msgSend(v4, "HTTPMethod");
      v13 = objc_claimAutoreleasedReturnValue();
      httpMethod = v6->_httpMethod;
      v6->_httpMethod = (NSString *)v13;

      objc_msgSend(v4, "timeoutInterval");
      v6->_timeoutInterval = v15;
      v16 = objc_alloc(MEMORY[0x1E0C99D20]);
      objc_msgSend(v4, "URL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "initWithObjects:", v17, 0);
      urls = v6->_urls;
      v6->_urls = (NSArray *)v18;

    }
    else
    {
      v5->_cachePolicy = 0;
      v20 = v5->_httpMethod;
      v5->_httpMethod = (NSString *)CFSTR("GET");

      v6->_timeoutInterval = 60.0;
    }
  }

  return v6;
}

- (id)_initCommon
{
  SSURLRequestProperties *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dispatchQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSURLRequestProperties;
  v2 = -[SSURLRequestProperties init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.storeservices.SSURLRequestProperties", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgentComponents, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong(&self->_urlBagURLBlock, 0);
  objc_storeStrong((id *)&self->_urlBagKey, 0);
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_httpMethod, 0);
  objc_storeStrong((id *)&self->_httpHeaders, 0);
  objc_storeStrong((id *)&self->_httpBodyStream, 0);
  objc_storeStrong((id *)&self->_httpBody, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientAuditTokenData, 0);
  objc_storeStrong((id *)&self->_clientAuditBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalMetrics, 0);
}

- (SSURLRequestProperties)initWithURL:(id)a3
{
  id v4;
  SSURLRequestProperties *v5;
  uint64_t v6;
  NSArray *urls;

  v4 = a3;
  v5 = -[SSURLRequestProperties initWithURLRequest:](self, "initWithURLRequest:", 0);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v4, 0);
    urls = v5->_urls;
    v5->_urls = (NSArray *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  NSObject *dispatchQueue;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  SSURLRequestProperties *v11;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSURLRequestProperties.m"), 222, CFSTR("Only keyed coding is supported"));

  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SSURLRequestProperties_encodeWithCoder___block_invoke;
  block[3] = &unk_1E47B8768;
  v10 = v5;
  v11 = self;
  v8 = v5;
  dispatch_sync(dispatchQueue, block);

}

uint64_t __42__SSURLRequestProperties_encodeWithCoder___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("additionalMetrics"));
  objc_msgSend(*(id *)(a1 + 32), "encodeInteger:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("retry"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("btstrpcll"));
  objc_msgSend(*(id *)(a1 + 32), "encodeInteger:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("cache"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("srcappid"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("srcapp"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), CFSTR("client"));
  objc_msgSend(*(id *)(a1 + 32), "encodeInt64:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72), CFSTR("exclen"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80), CFSTR("body"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96), CFSTR("headers"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104), CFSTR("method"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 112), CFSTR("itunes"));
  objc_msgSend(*(id *)(a1 + 32), "encodeInt64:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120), CFSTR("kbsynctype"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 128), CFSTR("large"));
  objc_msgSend(*(id *)(a1 + 32), "encodeInteger:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136), CFSTR("mds"));
  objc_msgSend(*(id *)(a1 + 32), "encodeInteger:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 144), CFSTR("srvtype"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 152), CFSTR("params"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 160), CFSTR("reqcell"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 161) != 0, CFSTR("requireev"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 162), CFSTR("requireext"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 163), CFSTR("requireHTTPS"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 164), CFSTR("decode"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 166), CFSTR("nocell"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 165), CFSTR("disablecell"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 167), CFSTR("disableReversePush"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 168), CFSTR("disableReversePushSampling"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 169), CFSTR("procptcl"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 170), CFSTR("sectok"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 171), CFSTR("cookies"));
  objc_msgSend(*(id *)(a1 + 32), "encodeDouble:forKey:", CFSTR("timeout"), *(double *)(*(_QWORD *)(a1 + 40) + 176));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 184), CFSTR("bagkey"));
  objc_msgSend(*(id *)(a1 + 32), "encodeInteger:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 192), CFSTR("bagtype"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 208), CFSTR("urls"));
  return objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 216), CFSTR("uacomps"));
}

- (SSURLRequestProperties)initWithCoder:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  const __CFString *v39;
  uint64_t v40;
  SSURLRequestProperties *v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v53;
  _QWORD v54[3];

  v54[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSURLRequestProperties.m"), 262, CFSTR("Only keyed coding is supported"));

  }
  v6 = -[SSURLRequestProperties _initCommon](self, "_initCommon");
  if (!v6)
    goto LABEL_28;
  if (!objc_msgSend(v5, "containsValueForKey:", CFSTR("properties")))
  {
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, objc_opt_class(), 0);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("additionalMetrics"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v6 + 1);
    *((_QWORD *)v6 + 1) = v16;

    *((_BYTE *)v6 + 24) = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("btstrpcll"));
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("srcappid"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v6 + 5);
    *((_QWORD *)v6 + 5) = v18;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("srcapp"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)*((_QWORD *)v6 + 6);
    *((_QWORD *)v6 + 6) = v20;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("client"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)*((_QWORD *)v6 + 7);
    *((_QWORD *)v6 + 7) = v22;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("body"));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)*((_QWORD *)v6 + 10);
    *((_QWORD *)v6 + 10) = v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v54[0] = objc_opt_class();
    v54[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setWithArray:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v28, CFSTR("headers"));
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)*((_QWORD *)v6 + 12);
    *((_QWORD *)v6 + 12) = v29;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("method"));
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)*((_QWORD *)v6 + 13);
    *((_QWORD *)v6 + 13) = v31;

    *((_BYTE *)v6 + 112) = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("itunes"));
    *((_BYTE *)v6 + 128) = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("large"));
    *((_QWORD *)v6 + 17) = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("mds"));
    *((_QWORD *)v6 + 18) = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("srvtype"));
    *((_BYTE *)v6 + 160) = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("reqcell"));
    *((_BYTE *)v6 + 161) = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("requireev"));
    *((_BYTE *)v6 + 162) = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("requireext"));
    *((_BYTE *)v6 + 163) = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("requireHTTPS"));
    *((_BYTE *)v6 + 164) = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("decode"));
    *((_BYTE *)v6 + 166) = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("nocell"));
    *((_BYTE *)v6 + 165) = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("disablecell"));
    *((_BYTE *)v6 + 167) = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("disableReversePush"));
    *((_BYTE *)v6 + 168) = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("disableReversePushSampling"));
    *((_BYTE *)v6 + 169) = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("procptcl"));
    *((_BYTE *)v6 + 170) = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("sectok"));
    *((_BYTE *)v6 + 171) = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("cookies"));
    objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("timeout"));
    *((_QWORD *)v6 + 22) = v33;
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bagkey"));
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)*((_QWORD *)v6 + 23);
    *((_QWORD *)v6 + 23) = v34;

    *((_QWORD *)v6 + 24) = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("bagtype"));
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("uacomps"));
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)*((_QWORD *)v6 + 27);
    *((_QWORD *)v6 + 27) = v36;

    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("retryCount")))
      v38 = CFSTR("retryCount");
    else
      v38 = CFSTR("retry");
    *((_QWORD *)v6 + 2) = objc_msgSend(v5, "decodeIntegerForKey:", v38);
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("cachePolicy")))
      v39 = CFSTR("cachePolicy");
    else
      v39 = CFSTR("cache");
    *((_QWORD *)v6 + 4) = objc_msgSend(v5, "decodeIntegerForKey:", v39);
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("expectedlength")))
      v40 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("expectedlength"));
    else
      v40 = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("exclen"));
    *((_QWORD *)v6 + 9) = v40;
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("kbsync")))
      v42 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("kbsync"));
    else
      v42 = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("kbsynctype"));
    *((_QWORD *)v6 + 15) = v42;
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("query")))
      v43 = CFSTR("query");
    else
      v43 = CFSTR("params");
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, v43);
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)*((_QWORD *)v6 + 19);
    *((_QWORD *)v6 + 19) = v44;

    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("urls")))
    {
      v46 = (void *)MEMORY[0x1E0C99E60];
      v47 = objc_opt_class();
      v48 = objc_opt_class();
      objc_msgSend(v46, "setWithObjects:", v47, v48, objc_opt_class(), 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v49, CFSTR("urls"));
      v50 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v49, 0);
    }
    v51 = (void *)*((_QWORD *)v6 + 26);
    *((_QWORD *)v6 + 26) = v50;

    goto LABEL_27;
  }
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("properties"));
  v7 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)v6 + 1, *(id *)(v7 + 8));
    *((_QWORD *)v6 + 2) = *(_QWORD *)(v7 + 16);
    *((_BYTE *)v6 + 24) = *(_BYTE *)(v7 + 24);
    *((_QWORD *)v6 + 4) = *(_QWORD *)(v7 + 32);
    objc_storeStrong((id *)v6 + 5, *(id *)(v7 + 40));
    objc_storeStrong((id *)v6 + 6, *(id *)(v7 + 48));
    objc_storeStrong((id *)v6 + 7, *(id *)(v7 + 56));
    *((_QWORD *)v6 + 9) = *(_QWORD *)(v7 + 72);
    objc_storeStrong((id *)v6 + 10, *(id *)(v7 + 80));
    objc_storeStrong((id *)v6 + 11, *(id *)(v7 + 88));
    objc_storeStrong((id *)v6 + 12, *(id *)(v7 + 96));
    objc_storeStrong((id *)v6 + 13, *(id *)(v7 + 104));
    *((_BYTE *)v6 + 112) = *(_BYTE *)(v7 + 112);
    *((_QWORD *)v6 + 15) = *(_QWORD *)(v7 + 120);
    *((_BYTE *)v6 + 128) = *(_BYTE *)(v7 + 128);
    *((_QWORD *)v6 + 17) = *(_QWORD *)(v7 + 136);
    *((_QWORD *)v6 + 18) = *(_QWORD *)(v7 + 144);
    objc_storeStrong((id *)v6 + 19, *(id *)(v7 + 152));
    *((_BYTE *)v6 + 160) = *(_BYTE *)(v7 + 160);
    *((_BYTE *)v6 + 161) = *(_BYTE *)(v7 + 161);
    *((_BYTE *)v6 + 162) = *(_BYTE *)(v7 + 162);
    *((_BYTE *)v6 + 163) = *(_BYTE *)(v7 + 163);
    *((_BYTE *)v6 + 164) = *(_BYTE *)(v7 + 164);
    *((_BYTE *)v6 + 165) = *(_BYTE *)(v7 + 165);
    *((_BYTE *)v6 + 166) = *(_BYTE *)(v7 + 166);
    *((_BYTE *)v6 + 167) = *(_BYTE *)(v7 + 167);
    *((_BYTE *)v6 + 168) = *(_BYTE *)(v7 + 168);
    *((_BYTE *)v6 + 169) = *(_BYTE *)(v7 + 169);
    *((_BYTE *)v6 + 170) = *(_BYTE *)(v7 + 170);
    *((_BYTE *)v6 + 171) = *(_BYTE *)(v7 + 171);
    *((_QWORD *)v6 + 22) = *(_QWORD *)(v7 + 176);
    objc_storeStrong((id *)v6 + 23, *(id *)(v7 + 184));
    *((_QWORD *)v6 + 24) = *(_QWORD *)(v7 + 192);
    v8 = MEMORY[0x1A8585DF0](*(_QWORD *)(v7 + 200));
    v9 = (void *)*((_QWORD *)v6 + 25);
    *((_QWORD *)v6 + 25) = v8;

    objc_storeStrong((id *)v6 + 26, *(id *)(v7 + 208));
    objc_storeStrong((id *)v6 + 27, *(id *)(v7 + 216));
LABEL_27:

LABEL_28:
    v41 = (SSURLRequestProperties *)v6;
    goto LABEL_29;
  }

  v41 = 0;
LABEL_29:

  return v41;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__24;
  v13 = __Block_byref_object_dispose__24;
  v14 = -[SSURLRequestProperties _initCommon](+[SSMutableURLRequestProperties allocWithZone:](SSMutableURLRequestProperties, "allocWithZone:"), "_initCommon");
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SSURLRequestProperties_mutableCopyWithZone___block_invoke;
  block[3] = &unk_1E47BC3F0;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __46__SSURLRequestProperties_mutableCopyWithZone___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 8), *(id *)(a1[4] + 8));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 16) = *(_QWORD *)(a1[4] + 16);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 24) = *(_BYTE *)(a1[4] + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 32) = *(_QWORD *)(a1[4] + 32);
  v2 = objc_msgSend(*(id *)(a1[4] + 40), "copyWithZone:", a1[6]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = objc_msgSend(*(id *)(a1[4] + 48), "copyWithZone:", a1[6]);
  v6 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  v7 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v5;

  v8 = objc_msgSend(*(id *)(a1[4] + 56), "copyWithZone:", a1[6]);
  v9 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  v10 = *(void **)(v9 + 56);
  *(_QWORD *)(v9 + 56) = v8;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 72) = *(_QWORD *)(a1[4] + 72);
  v11 = objc_msgSend(*(id *)(a1[4] + 80), "copyWithZone:", a1[6]);
  v12 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  v13 = *(void **)(v12 + 80);
  *(_QWORD *)(v12 + 80) = v11;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 88), *(id *)(a1[4] + 88));
  v14 = objc_msgSend(*(id *)(a1[4] + 96), "copyWithZone:", a1[6]);
  v15 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  v16 = *(void **)(v15 + 96);
  *(_QWORD *)(v15 + 96) = v14;

  v17 = objc_msgSend(*(id *)(a1[4] + 104), "copyWithZone:", a1[6]);
  v18 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  v19 = *(void **)(v18 + 104);
  *(_QWORD *)(v18 + 104) = v17;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 112) = *(_BYTE *)(a1[4] + 112);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 120) = *(_QWORD *)(a1[4] + 120);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 128) = *(_BYTE *)(a1[4] + 128);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 136) = *(_QWORD *)(a1[4] + 136);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 144) = *(_QWORD *)(a1[4] + 144);
  v20 = objc_msgSend(*(id *)(a1[4] + 152), "copyWithZone:", a1[6]);
  v21 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  v22 = *(void **)(v21 + 152);
  *(_QWORD *)(v21 + 152) = v20;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 160) = *(_BYTE *)(a1[4] + 160);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 161) = *(_BYTE *)(a1[4] + 161);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 162) = *(_BYTE *)(a1[4] + 162);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 163) = *(_BYTE *)(a1[4] + 163);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 164) = *(_BYTE *)(a1[4] + 164);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 165) = *(_BYTE *)(a1[4] + 165);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 166) = *(_BYTE *)(a1[4] + 166);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 167) = *(_BYTE *)(a1[4] + 167);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 168) = *(_BYTE *)(a1[4] + 168);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 169) = *(_BYTE *)(a1[4] + 169);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 170) = *(_BYTE *)(a1[4] + 170);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 171) = *(_BYTE *)(a1[4] + 171);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 176) = *(_QWORD *)(a1[4] + 176);
  v23 = objc_msgSend(*(id *)(a1[4] + 184), "copyWithZone:", a1[6]);
  v24 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  v25 = *(void **)(v24 + 184);
  *(_QWORD *)(v24 + 184) = v23;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 192) = *(_QWORD *)(a1[4] + 192);
  v26 = objc_msgSend(*(id *)(a1[4] + 200), "copyWithZone:", a1[6]);
  v27 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  v28 = *(void **)(v27 + 200);
  *(_QWORD *)(v27 + 200) = v26;

  v29 = objc_msgSend(*(id *)(a1[4] + 208), "copyWithZone:", a1[6]);
  v30 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  v31 = *(void **)(v30 + 208);
  *(_QWORD *)(v30 + 208) = v29;

  v32 = objc_msgSend(*(id *)(a1[4] + 216), "copyWithZone:", a1[6]);
  v33 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  v34 = *(void **)(v33 + 216);
  *(_QWORD *)(v33 + 216) = v32;

}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  NSObject *dispatchQueue;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  SSURLRequestProperties *v10;

  v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__SSURLRequestProperties_copyXPCEncoding__block_invoke;
  v8[3] = &unk_1E47B8768;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_sync(dispatchQueue, v8);
  v6 = v5;

  return v6;
}

uint64_t __41__SSURLRequestProperties_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "33", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "0", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "27", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 24));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "1", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "25", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "2", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "3", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "5", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "6", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "7", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "8", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "9", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 112));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "28", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "24", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 128));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "30", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "12", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 144));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "13", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 152));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "29", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 160));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "15", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 161) != 0);
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "31", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 162));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "26", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 163));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "4", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 164));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "11", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 165));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "10", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 166));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "32", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 167));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "34", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 168));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "14", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 169));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "23", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 170));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "17", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 171));
  xpc_dictionary_set_double(*(xpc_object_t *)(a1 + 32), "18", *(double *)(*(_QWORD *)(a1 + 40) + 176));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "19", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 184));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "20", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 192));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "22", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 216));
  return SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "21", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 208));
}

- (SSURLRequestProperties)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSURLRequestProperties *v6;
  uint64_t v8;
  uint64_t v9;
  NSDictionary *additionalMetrics;
  uint64_t v11;
  uint64_t v12;
  NSString *clientAuditBundleIdentifier;
  uint64_t v14;
  uint64_t v15;
  NSData *clientAuditTokenData;
  uint64_t v17;
  uint64_t v18;
  NSString *clientIdentifier;
  uint64_t v20;
  uint64_t v21;
  NSData *httpBody;
  uint64_t v23;
  uint64_t v24;
  NSDictionary *httpHeaders;
  uint64_t v26;
  uint64_t v27;
  NSString *httpMethod;
  uint64_t v29;
  uint64_t v30;
  NSDictionary *requestParameters;
  uint64_t v32;
  uint64_t v33;
  NSString *urlBagKey;
  uint64_t v35;
  uint64_t v36;
  NSArray *userAgentComponents;
  uint64_t v38;
  NSArray *v39;
  NSArray *urls;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v6 = -[SSURLRequestProperties _initCommon](self, "_initCommon");
    if (!v6)
      goto LABEL_5;
    v8 = objc_opt_class();
    v9 = SSXPCDictionaryCopyObjectWithClass(v5, "33", v8);
    additionalMetrics = v6->_additionalMetrics;
    v6->_additionalMetrics = (NSDictionary *)v9;

    v6->_allowedRetryCount = xpc_dictionary_get_int64(v5, "0");
    v6->_allowsBootstrapCellularData = xpc_dictionary_get_BOOL(v5, "27");
    v6->_cachePolicy = xpc_dictionary_get_int64(v5, "1");
    v11 = objc_opt_class();
    v12 = SSXPCDictionaryCopyObjectWithClass(v5, "25", v11);
    clientAuditBundleIdentifier = v6->_clientAuditBundleIdentifier;
    v6->_clientAuditBundleIdentifier = (NSString *)v12;

    v14 = objc_opt_class();
    v15 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v14);
    clientAuditTokenData = v6->_clientAuditTokenData;
    v6->_clientAuditTokenData = (NSData *)v15;

    v17 = objc_opt_class();
    v18 = SSXPCDictionaryCopyObjectWithClass(v5, "3", v17);
    clientIdentifier = v6->_clientIdentifier;
    v6->_clientIdentifier = (NSString *)v18;

    v6->_expectedContentLength = xpc_dictionary_get_int64(v5, "5");
    v20 = objc_opt_class();
    v21 = SSXPCDictionaryCopyObjectWithClass(v5, "6", v20);
    httpBody = v6->_httpBody;
    v6->_httpBody = (NSData *)v21;

    v23 = objc_opt_class();
    v24 = SSXPCDictionaryCopyObjectWithClass(v5, "7", v23);
    httpHeaders = v6->_httpHeaders;
    v6->_httpHeaders = (NSDictionary *)v24;

    v26 = objc_opt_class();
    v27 = SSXPCDictionaryCopyObjectWithClass(v5, "8", v26);
    httpMethod = v6->_httpMethod;
    v6->_httpMethod = (NSString *)v27;

    v6->_isITunesStoreRequest = xpc_dictionary_get_BOOL(v5, "9");
    v6->_kbsyncType = xpc_dictionary_get_int64(v5, "28");
    v6->_largeDownload = xpc_dictionary_get_BOOL(v5, "24");
    v6->_machineDataStyle = xpc_dictionary_get_int64(v5, "30");
    v6->_networkServiceType = xpc_dictionary_get_int64(v5, "12");
    v29 = objc_opt_class();
    v30 = SSXPCDictionaryCopyObjectWithClass(v5, "13", v29);
    requestParameters = v6->_requestParameters;
    v6->_requestParameters = (NSDictionary *)v30;

    v6->_requiresCellularDataNetwork = xpc_dictionary_get_BOOL(v5, "29");
    v6->_requiresExtendedValidationCertificates = xpc_dictionary_get_BOOL(v5, "15");
    v6->_requiresExternal = xpc_dictionary_get_BOOL(v5, "31");
    v6->_requiresHTTPS = xpc_dictionary_get_BOOL(v5, "26");
    v6->_shouldDecodeResponse = xpc_dictionary_get_BOOL(v5, "4");
    v6->_shouldDisableCellular = xpc_dictionary_get_BOOL(v5, "11");
    v6->_shouldDisableCellularFallback = xpc_dictionary_get_BOOL(v5, "10");
    v6->_shouldDisableReversePush = xpc_dictionary_get_BOOL(v5, "32");
    v6->_shouldDisableReversePushSampling = xpc_dictionary_get_BOOL(v5, "34");
    v6->_shouldProcessProtocol = xpc_dictionary_get_BOOL(v5, "14");
    v6->_shouldSendSecureToken = xpc_dictionary_get_BOOL(v5, "23");
    v6->_shouldSetCookies = xpc_dictionary_get_BOOL(v5, "17");
    v6->_timeoutInterval = xpc_dictionary_get_double(v5, "18");
    v32 = objc_opt_class();
    v33 = SSXPCDictionaryCopyObjectWithClass(v5, "19", v32);
    urlBagKey = v6->_urlBagKey;
    v6->_urlBagKey = (NSString *)v33;

    v6->_urlBagType = xpc_dictionary_get_int64(v5, "20");
    v35 = objc_opt_class();
    v36 = SSXPCDictionaryCopyObjectWithClass(v5, "22", v35);
    userAgentComponents = v6->_userAgentComponents;
    v6->_userAgentComponents = (NSArray *)v36;

    xpc_dictionary_get_value(v5, "21");
    self = (SSURLRequestProperties *)objc_claimAutoreleasedReturnValue();
    v38 = objc_opt_class();
    v39 = (NSArray *)SSXPCCreateNSArrayFromXPCEncodedArray(self, v38);
    urls = v6->_urls;
    v6->_urls = v39;

  }
  else
  {
    v6 = 0;
  }

LABEL_5:
  return v6;
}

- (NSDictionary)additionalMetrics
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__SSURLRequestProperties_additionalMetrics__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __43__SSURLRequestProperties_additionalMetrics__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (int64_t)allowedRetryCount
{
  NSObject *dispatchQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__SSURLRequestProperties_allowedRetryCount__block_invoke;
  v5[3] = &unk_1E47B8718;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__SSURLRequestProperties_allowedRetryCount__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = result;
  v2 = *(_QWORD *)(result + 32);
  v3 = *(_QWORD *)(v2 + 16);
  if (v3 == -1)
  {
    result = objc_msgSend(*(id *)(v2 + 104), "caseInsensitiveCompare:", CFSTR("post"));
    v4 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 8);
    if (result)
      *(_QWORD *)(v4 + 24) = 6;
    else
      *(_QWORD *)(v4 + 24) = 0;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v3;
  }
  return result;
}

- (unint64_t)cachePolicy
{
  NSObject *dispatchQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__SSURLRequestProperties_cachePolicy__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__SSURLRequestProperties_cachePolicy__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (NSString)clientIdentifier
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__SSURLRequestProperties_clientIdentifier__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __42__SSURLRequestProperties_clientIdentifier__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

- (int64_t)expectedContentLength
{
  NSObject *dispatchQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__SSURLRequestProperties_expectedContentLength__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__SSURLRequestProperties_expectedContentLength__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 72);
  return result;
}

- (NSData)HTTPBody
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SSURLRequestProperties_HTTPBody__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

void __34__SSURLRequestProperties_HTTPBody__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 80));
}

- (NSDictionary)HTTPHeaders
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__SSURLRequestProperties_HTTPHeaders__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __37__SSURLRequestProperties_HTTPHeaders__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 96));
}

- (NSString)HTTPMethod
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__SSURLRequestProperties_HTTPMethod__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __36__SSURLRequestProperties_HTTPMethod__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 104));
}

- (BOOL)isITunesStoreRequest
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__SSURLRequestProperties_isITunesStoreRequest__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__SSURLRequestProperties_isITunesStoreRequest__block_invoke(uint64_t result)
{
  uint64_t v1;
  BOOL v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 112))
    v2 = 1;
  else
    v2 = *(_QWORD *)(v1 + 184) != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (int64_t)machineDataStyle
{
  NSObject *dispatchQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__SSURLRequestProperties_machineDataStyle__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__SSURLRequestProperties_machineDataStyle__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 136);
  return result;
}

- (unint64_t)networkServiceType
{
  NSObject *dispatchQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 3;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__SSURLRequestProperties_networkServiceType__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__SSURLRequestProperties_networkServiceType__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 144);
  return result;
}

- (NSDictionary)requestParameters
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__SSURLRequestProperties_requestParameters__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __43__SSURLRequestProperties_requestParameters__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 152));
}

- (BOOL)shouldProcessProtocol
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__SSURLRequestProperties_shouldProcessProtocol__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__SSURLRequestProperties_shouldProcessProtocol__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 169);
  return result;
}

- (BOOL)shouldSendSecureToken
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__SSURLRequestProperties_shouldSendSecureToken__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__SSURLRequestProperties_shouldSendSecureToken__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 170);
  return result;
}

- (BOOL)shouldSetCookies
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__SSURLRequestProperties_shouldSetCookies__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__SSURLRequestProperties_shouldSetCookies__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 171);
  return result;
}

- (NSString)clientAuditBundleIdentifier
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__SSURLRequestProperties_clientAuditBundleIdentifier__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __53__SSURLRequestProperties_clientAuditBundleIdentifier__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (NSData)clientAuditTokenData
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__SSURLRequestProperties_clientAuditTokenData__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

void __46__SSURLRequestProperties_clientAuditTokenData__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

- (NSString)clientBundleIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __int128 v9;

  -[SSURLRequestProperties clientAuditBundleIdentifier](self, "clientAuditBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    -[SSURLRequestProperties clientAuditTokenData](self, "clientAuditTokenData", 0, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (v5 == 32)
    {
      -[SSURLRequestProperties clientAuditTokenData](self, "clientAuditTokenData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "getBytes:length:", &v9, 32);

      v7 = CPCopyBundleIdentifierFromAuditToken();
      v3 = (void *)v7;
    }
  }
  return (NSString *)v3;
}

- (double)timeoutInterval
{
  NSObject *dispatchQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0x404E000000000000;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__SSURLRequestProperties_timeoutInterval__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __41__SSURLRequestProperties_timeoutInterval__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 176);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSString)URLBagKey
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__SSURLRequestProperties_URLBagKey__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __35__SSURLRequestProperties_URLBagKey__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 184));
}

- (NSURL)URL
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__SSURLRequestProperties_URL__block_invoke;
  v5[3] = &unk_1E47B8718;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

void __29__SSURLRequestProperties_URL__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "objectAtIndex:", 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;
  }
  else
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;
  }

}

- (NSArray)userAgentComponents
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__SSURLRequestProperties_userAgentComponents__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __45__SSURLRequestProperties_userAgentComponents__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 216));
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)SSURLRequestProperties;
  -[SSURLRequestProperties description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSURLRequestProperties URLs](self, "URLs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSURLRequestProperties requestParameters](self, "requestParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSURLRequestProperties HTTPHeaders](self, "HTTPHeaders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: URLs: %@; Parameters: %@; Headers: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  int64_t v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  char v32;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[SSURLRequestProperties allowedRetryCount](self, "allowedRetryCount"),
        v5 == objc_msgSend(v4, "allowedRetryCount"))
    && (v6 = -[SSURLRequestProperties cachePolicy](self, "cachePolicy"), v6 == objc_msgSend(v4, "cachePolicy"))
    && (v7 = -[SSURLRequestProperties networkServiceType](self, "networkServiceType"),
        v7 == objc_msgSend(v4, "networkServiceType"))
    && (-[SSURLRequestProperties timeoutInterval](self, "timeoutInterval"),
        v9 = v8,
        objc_msgSend(v4, "timeoutInterval"),
        v9 == v10))
  {
    v11 = -[SSURLRequestProperties URLBagType](self, "URLBagType");
    v12 = v11 == objc_msgSend(v4, "URLBagType");
  }
  else
  {
    v12 = 0;
  }
  -[SSURLRequestProperties HTTPMethod](self, "HTTPMethod");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "HTTPMethod");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v12)
  {
    if (v13 == (void *)v14)
      v16 = 1;
    else
      v16 = objc_msgSend(v13, "isEqualToString:", v14);
  }
  else
  {
    v16 = 0;
  }
  -[SSURLRequestProperties URLs](self, "URLs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URLs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v17, "count");
  if (v16)
  {
    v20 = v19;
    v21 = objc_msgSend(v18, "count");
    v22 = objc_msgSend(v17, "count");
    v23 = v20 == v21;
    v24 = v20 == v21;
    if (v23)
    {
      v25 = v22;
      if (v22 >= 1)
      {
        v26 = 1;
        do
        {
          objc_msgSend(v17, "objectAtIndex:", v26 - 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndex:", v26 - 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v27, "isEqual:", v28);

          if (!v24)
            break;
        }
        while (v26++ < v25);
      }
    }
  }
  else
  {
    v24 = 0;
  }
  -[SSURLRequestProperties userAgentComponents](self, "userAgentComponents");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userAgentComponents");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    if (v30 == v31)
      v32 = 1;
    else
      v32 = objc_msgSend(v30, "isEqualToArray:", v31);
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (BOOL)allowsBootstrapCellularData
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__SSURLRequestProperties_allowsBootstrapCellularData__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__SSURLRequestProperties_allowsBootstrapCellularData__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (BOOL)canBeResolved
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__SSURLRequestProperties_canBeResolved__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__SSURLRequestProperties_canBeResolved__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;

  v1 = result;
  v2 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v2 + 184) || *(_QWORD *)(v2 + 200))
  {
    v3 = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(v2 + 208), "count");
    v3 = result != 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = v3;
  return result;
}

- (NSInputStream)HTTPBodyStream
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__SSURLRequestProperties_HTTPBodyStream__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSInputStream *)v3;
}

void __40__SSURLRequestProperties_HTTPBodyStream__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
}

- (BOOL)isLargeDownload
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__SSURLRequestProperties_isLargeDownload__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__SSURLRequestProperties_isLargeDownload__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 128);
  return result;
}

- (int64_t)KBSyncType
{
  NSObject *dispatchQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__SSURLRequestProperties_KBSyncType__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__SSURLRequestProperties_KBSyncType__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 120);
  return result;
}

- (BOOL)requiresCellularDataNetwork
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__SSURLRequestProperties_requiresCellularDataNetwork__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__SSURLRequestProperties_requiresCellularDataNetwork__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 160);
  return result;
}

- (BOOL)requiresExtendedValidationCertificates
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__SSURLRequestProperties_requiresExtendedValidationCertificates__block_invoke;
  v5[3] = &unk_1E47B8718;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __64__SSURLRequestProperties_requiresExtendedValidationCertificates__block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  char v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(v1 + 161);
  if (v2 == 255)
    v3 = *(_BYTE *)(v1 + 112);
  else
    v3 = v2 != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v3;
  return result;
}

- (BOOL)requiresExternal
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__SSURLRequestProperties_requiresExternal__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__SSURLRequestProperties_requiresExternal__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 162);
  return result;
}

- (BOOL)requiresHTTPS
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__SSURLRequestProperties_requiresHTTPS__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__SSURLRequestProperties_requiresHTTPS__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 163);
  return result;
}

- (BOOL)shouldAddKBSyncData
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__SSURLRequestProperties_shouldAddKBSyncData__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__SSURLRequestProperties_shouldAddKBSyncData__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 120) != 0;
  return result;
}

- (BOOL)shouldDecodeResponse
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__SSURLRequestProperties_shouldDecodeResponse__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__SSURLRequestProperties_shouldDecodeResponse__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 164);
  return result;
}

- (BOOL)shouldDisableCellular
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__SSURLRequestProperties_shouldDisableCellular__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__SSURLRequestProperties_shouldDisableCellular__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 165);
  return result;
}

- (BOOL)shouldDisableCellularFallback
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__SSURLRequestProperties_shouldDisableCellularFallback__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__SSURLRequestProperties_shouldDisableCellularFallback__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 166);
  return result;
}

- (BOOL)shouldDisableReversePush
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SSURLRequestProperties_shouldDisableReversePush__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__SSURLRequestProperties_shouldDisableReversePush__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 167);
  return result;
}

- (BOOL)shouldDisableReversePushSampling
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__SSURLRequestProperties_shouldDisableReversePushSampling__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__SSURLRequestProperties_shouldDisableReversePushSampling__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 168);
  return result;
}

- (int64_t)URLBagType
{
  NSObject *dispatchQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__SSURLRequestProperties_URLBagType__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__SSURLRequestProperties_URLBagType__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 192);
  return result;
}

- (id)URLBagURLBlock
{
  NSObject *dispatchQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__233;
  v10 = __Block_byref_object_dispose__234;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__SSURLRequestProperties_URLBagURLBlock__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (void *)MEMORY[0x1A8585DF0](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__SSURLRequestProperties_URLBagURLBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A8585DF0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 200));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)URLs
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__SSURLRequestProperties_URLs__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __30__SSURLRequestProperties_URLs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
