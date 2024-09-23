@implementation SBKRequest

- (SBKRequest)initWithRequestURL:(id)a3
{
  id v5;
  SBKRequest *v6;
  void *v7;
  uint64_t v8;
  NSString *action;
  void *v10;
  uint64_t v11;
  NSDictionary *headers;
  id v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBKRequest;
  v6 = -[SBKRequest init](&v15, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = objc_claimAutoreleasedReturnValue();
    action = v6->_action;
    v6->_action = (NSString *)v8;

    objc_storeStrong((id *)&v6->_requestURL, a3);
    -[SBKRequest _defaultHeaderFields](v6, "_defaultHeaderFields");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "mutableCopy");
    headers = v6->_headers;
    v6->_headers = (NSDictionary *)v11;

    v13 = objc_alloc_init(MEMORY[0x24BEC8C08]);
    objc_msgSend(v13, "setShouldPostFooterSectionChanged:", 0);
    objc_msgSend(v13, "setShouldProcessDialogs:", 0);
    objc_msgSend(v13, "setShouldTriggerDownloads:", 0);
    -[SBKRequest setResponseDataProvider:](v6, "setResponseDataProvider:", v13);

  }
  return v6;
}

- (id)description
{
  void *v3;
  NSURL *requestURL;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBKRequest;
  -[SBKRequest description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  requestURL = self->_requestURL;
  objc_msgSend((id)objc_opt_class(), "_methodStringForMethod:", self->_method);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@ [%@] URL = %@, shouldAuthenticate = %d, arguments = %@, headers = %@, bodyData = %@ "), requestURL, v5, self->_action, self->_shouldAuthenticate, self->_arguments, self->_headers, self->_bodyData);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)timeoutInterval
{
  return 60.0;
}

- (id)descriptionWithoutHeaderFields
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBKRequest;
  -[SBKRequest description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_methodStringForMethod:", self->_method);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@ [%@]"), v4, self->_action);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setValue:(id)a3 forHeaderField:(id)a4
{
  -[NSDictionary setObject:forKey:](self->_headers, "setObject:forKey:", a3, a4);
}

- (void)setValue:(id)a3 forArgument:(id)a4
{
  id v6;
  NSDictionary *arguments;
  NSDictionary *v8;
  NSDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  arguments = self->_arguments;
  if (!arguments)
  {
    v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v9 = self->_arguments;
    self->_arguments = v8;

    arguments = self->_arguments;
  }
  -[NSDictionary setObject:forKey:](arguments, "setObject:forKey:", v10, v6);

}

- (void)setBodyData:(id)a3
{
  NSData *v4;
  uint64_t v5;
  NSData *bodyData;

  v4 = (NSData *)a3;
  if (objc_msgSend((id)objc_opt_class(), "bodyContentEncodingType") == 1)
  {
    -[NSData SBKDataByDeflatingWithGZip](v4, "SBKDataByDeflatingWithGZip");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (NSData *)v5;
  }
  bodyData = self->_bodyData;
  self->_bodyData = v4;

}

- (void)setBodyDataWithPropertyList:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  id *v8;
  uint64_t *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_msgSend((id)objc_opt_class(), "bodyContentType");
  if (v6 == 2)
  {
    v7 = (void *)MEMORY[0x24BDD1770];
    v17 = 0;
    v8 = (id *)&v17;
    v9 = &v17;
    v10 = v5;
    v11 = 100;
  }
  else
  {
    if (v6 != 3)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKRequest.m"), 119, CFSTR("Invalid bodyContentType requested for propertyList"));

      v12 = 0;
      goto LABEL_10;
    }
    v7 = (void *)MEMORY[0x24BDD1770];
    v18 = 0;
    v8 = (id *)&v18;
    v9 = &v18;
    v10 = v5;
    v11 = 200;
  }
  objc_msgSend(v7, "dataWithPropertyList:format:options:error:", v10, v11, 0, v9, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *v8;
  if (!v13)
  {
LABEL_10:
    -[SBKRequest setBodyData:](self, "setBodyData:", v12);
    goto LABEL_11;
  }
  v14 = v13;
  v15 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v14;
    _os_log_impl(&dword_21E4FD000, v15, OS_LOG_TYPE_DEFAULT, "ERROR: failed to serialize property list with error = %@", buf, 0xCu);
  }

LABEL_11:
}

- (id)copyRequestProperties
{
  void *v3;
  void *v4;
  NSDictionary *headers;
  uint64_t v6;
  id v7;
  NSDictionary *arguments;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F30]), "initWithURL:", self->_requestURL);
  objc_msgSend((id)objc_opt_class(), "_methodStringForMethod:", self->_method);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHTTPMethod:", v4);

  headers = self->_headers;
  v6 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __35__SBKRequest_copyRequestProperties__block_invoke;
  v20[3] = &unk_24E2A8330;
  v7 = v3;
  v21 = v7;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](headers, "enumerateKeysAndObjectsUsingBlock:", v20);
  arguments = self->_arguments;
  v15 = v6;
  v16 = 3221225472;
  v17 = __35__SBKRequest_copyRequestProperties__block_invoke_2;
  v18 = &unk_24E2A8330;
  v9 = v7;
  v19 = v9;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](arguments, "enumerateKeysAndObjectsUsingBlock:", &v15);
  if (-[SBKRequest includeDeviceGUID](self, "includeDeviceGUID", v15, v16, v17, v18))
  {
    objc_msgSend(MEMORY[0x24BEC8B88], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forRequestParameter:", v11, CFSTR("guid"));

  }
  objc_msgSend(v9, "setHTTPBody:", self->_bodyData);
  -[SBKRequest timeoutInterval](self, "timeoutInterval");
  objc_msgSend(v9, "setTimeoutInterval:");
  v12 = v19;
  v13 = v9;

  return v13;
}

- (id)canonicalResponseForResponse:(id)a3
{
  return a3;
}

- (BOOL)acceptsGzipEncoding
{
  return 1;
}

- (id)_defaultHeaderFields
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBKRequest acceptsGzipEncoding](self, "acceptsGzipEncoding"))
    objc_msgSend(v3, "setObject:forKey:", CFSTR("gzip"), CFSTR("Accept-Encoding"));
  v4 = (void *)objc_opt_class();
  objc_msgSend(v4, "_contentEncodingTypeStringForBodyContentEncodingType:", objc_msgSend((id)objc_opt_class(), "bodyContentEncodingType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("Content-Encoding"));
  v6 = (void *)objc_opt_class();
  objc_msgSend(v6, "_contentTypeStringForBodyContentType:", objc_msgSend((id)objc_opt_class(), "bodyContentType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("Content-Type"));

  return v3;
}

- (id)newURLOperation
{
  +[SBKTransactionURLOperation operationWithRequest:delegate:](SBKTransactionURLOperation, "operationWithRequest:delegate:", self, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newURLOperationWithDelegate:(id)a3
{
  +[SBKTransactionURLOperation operationWithRequest:delegate:](SBKTransactionURLOperation, "operationWithRequest:delegate:", self, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SBKTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (BOOL)isConcurrent
{
  return self->_concurrent;
}

- (int64_t)method
{
  return self->_method;
}

- (void)setMethod:(int64_t)a3
{
  self->_method = a3;
}

- (BOOL)shouldAuthenticate
{
  return self->_shouldAuthenticate;
}

- (void)setShouldAuthenticate:(BOOL)a3
{
  self->_shouldAuthenticate = a3;
}

- (BOOL)includeDeviceGUID
{
  return self->_includeDeviceGUID;
}

- (void)setIncludeDeviceGUID:(BOOL)a3
{
  self->_includeDeviceGUID = a3;
}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (ISDataProvider)responseDataProvider
{
  return self->_responseDataProvider;
}

- (void)setResponseDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_responseDataProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_responseDataProvider, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_requestURL, 0);
}

uint64_t __35__SBKRequest_copyRequestProperties__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

uint64_t __35__SBKRequest_copyRequestProperties__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forRequestParameter:", a3, a2);
}

+ (id)requestWithRequestURL:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  v4 = objc_opt_class();
  if (v4 == objc_opt_class())
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("subclass must implement"));
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRequestURL:", v3);

  return v5;
}

+ (int64_t)bodyContentType
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("SBKRequestBodyContentType-TextXML"));

  if (v3)
    return 2;
  else
    return 3;
}

+ (int64_t)bodyContentEncodingType
{
  void *v2;
  unsigned int v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("SBKRequestBodyContentType-EncodeGzip"));

  return v3;
}

+ (id)_methodStringForMethod:(int64_t)a3
{
  if (a3 == 1)
    return CFSTR("POST");
  else
    return CFSTR("GET");
}

+ (id)_contentEncodingTypeStringForBodyContentEncodingType:(int64_t)a3
{
  if (a3 == 1)
    return CFSTR("gzip");
  else
    return 0;
}

+ (id)_contentTypeStringForBodyContentType:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("text/plain; charset=UTF-8");
  if (a3 == 2)
    v3 = CFSTR("text/xml; charset=UTF-8");
  if (a3 == 3)
    return CFSTR("application/x-plist");
  else
    return (id)v3;
}

@end
