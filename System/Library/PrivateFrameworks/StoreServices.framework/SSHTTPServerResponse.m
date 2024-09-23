@implementation SSHTTPServerResponse

- (SSHTTPServerResponse)initWithStatusCode:(signed __int16)a3
{
  SSHTTPServerResponse *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSHTTPServerResponse;
  result = -[SSHTTPServerResponse init](&v5, sel_init);
  if (result)
    result->_statusCode = a3;
  return result;
}

- (void)setBodyWithBag:(id)a3
{
  id v4;
  NSData *body;
  void *v6;
  uint64_t (*v7)(void *);
  void *v8;
  id v9;
  NSData *v10;
  NSData *v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  body = self->_body;
  self->_body = 0;

  if (v4)
  {
    if (objc_msgSend(MEMORY[0x1E0CB38B0], "propertyList:isValidForFormat:", v4, 100))
    {
      v6 = (void *)SSViTunesStoreFramework();
      v7 = (uint64_t (*)(void *))SSVWeakLinkedSymbolForString("ISCopyGzippedDataForData", v6);
      v26 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 100, 0, &v26);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v26;
      v10 = (NSData *)v7(v8);
      v11 = self->_body;
      self->_body = v10;

      if (v9)
      {
LABEL_6:
        +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v13 = objc_msgSend(v12, "shouldLog");
        if (objc_msgSend(v12, "shouldLogToDisk"))
          v14 = v13 | 2;
        else
          v14 = v13;
        objc_msgSend(v12, "OSLogObject");
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          v14 &= 2u;
        if (v14)
        {
          v16 = (void *)objc_opt_class();
          v27 = 138543618;
          v28 = v16;
          v29 = 2112;
          v30 = v9;
          v17 = v16;
          LODWORD(v25) = 22;
          v18 = (void *)_os_log_send_and_compose_impl();

          if (!v18)
          {
LABEL_17:

            goto LABEL_18;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v18, 4, &v27, v25);
          v15 = objc_claimAutoreleasedReturnValue();
          free(v18);
          SSFileLog(v12, CFSTR("%@"), v19, v20, v21, v22, v23, v24, (uint64_t)v15);
        }

        goto LABEL_17;
      }
    }
  }
  if (!self->_body)
  {
    v9 = 0;
    goto LABEL_6;
  }
LABEL_18:

}

- (id)bagFromBody
{
  void *v3;
  uint64_t (*v4)(NSData *);
  NSData *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  id v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (void *)SSViTunesStoreFramework();
  v4 = (uint64_t (*)(NSData *))SSVWeakLinkedSymbolForString("ISCopyDecompressedGZipDataForData", v3);
  v5 = (NSData *)v4(self->_body);
  if (!v5)
  {
    v5 = self->_body;
    if (!v5)
    {
      v6 = 0;
      goto LABEL_17;
    }
  }
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, &v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v23;
  if (v7)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v10 &= 2u;
    if (v10)
    {
      v12 = (void *)objc_opt_class();
      v24 = 138543618;
      v25 = v12;
      v26 = 2112;
      v27 = v7;
      v13 = v12;
      LODWORD(v22) = 22;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, &v24, v22);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v14);
      SSFileLog(v8, CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:

LABEL_17:
  return v6;
}

- (__CFHTTPMessage)copyHTTPMessage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFAllocator *v13;
  int v14;
  __CFHTTPMessage *Response;
  _QWORD v17[5];

  -[SSHTTPServerResponse headers](self, "headers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = v6;

  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("close"), CFSTR("Connection"));
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Content-Type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("text/html"), CFSTR("Content-Type"));
  -[SSHTTPServerResponse body](self, "body");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    -[SSHTTPServerResponse body](self, "body");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v11, "length"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("Content-Length"));

  }
  else
  {
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("Content-Length"));
  }
  v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v14 = -[SSHTTPServerResponse statusCode](self, "statusCode");
  Response = CFHTTPMessageCreateResponse(v13, v14, 0, (CFStringRef)*MEMORY[0x1E0C930E8]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __39__SSHTTPServerResponse_copyHTTPMessage__block_invoke;
  v17[3] = &__block_descriptor_40_e35_v32__0__NSString_8__NSString_16_B24l;
  v17[4] = Response;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v17);
  CFHTTPMessageSetBody(Response, (CFDataRef)-[SSHTTPServerResponse body](self, "body"));

  return Response;
}

void __39__SSHTTPServerResponse_copyHTTPMessage__block_invoke(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  CFHTTPMessageSetHeaderFieldValue(*(CFHTTPMessageRef *)(a1 + 32), a2, a3);
}

- (NSData)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_headers, a3);
}

- (signed)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(signed __int16)a3
{
  self->_statusCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

@end
