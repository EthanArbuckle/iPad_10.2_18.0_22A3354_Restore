@implementation SSVSAPSignatureDataSource

- (SSVSAPSignatureDataSource)initWithURLRequest:(id)a3
{
  id v5;
  SSVSAPSignatureDataSource *v6;
  SSVSAPSignatureDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSVSAPSignatureDataSource;
  v6 = -[SSVSAPSignatureDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_request, a3);

  return v7;
}

- (SSVSAPSignatureDataSource)initWithURLRequestProperties:(id)a3
{
  id v5;
  SSVSAPSignatureDataSource *v6;
  SSVSAPSignatureDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSVSAPSignatureDataSource;
  v6 = -[SSVSAPSignatureDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_requestProperties, a3);

  return v7;
}

- (SSVSAPSignatureDataSource)initWithURLResponse:(id)a3 bodyData:(id)a4
{
  id v7;
  id v8;
  SSVSAPSignatureDataSource *v9;
  SSVSAPSignatureDataSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SSVSAPSignatureDataSource;
  v9 = -[SSVSAPSignatureDataSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bodyData, a4);
    objc_storeStrong((id *)&v10->_response, a3);
  }

  return v10;
}

- (NSData)HTTPBody
{
  NSData *bodyData;
  void *request;

  bodyData = self->_bodyData;
  if (bodyData)
    return bodyData;
  if (self->_request)
  {
    request = self->_request;
LABEL_6:
    objc_msgSend(request, "HTTPBody");
    request = (void *)objc_claimAutoreleasedReturnValue();
    return (NSData *)request;
  }
  request = self->_requestProperties;
  if (request)
    goto LABEL_6;
  return (NSData *)request;
}

- (NSString)HTTPMethod
{
  void *request;

  request = self->_request;
  if (request || (request = self->_requestProperties) != 0)
  {
    objc_msgSend(request, "HTTPMethod");
    request = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)request;
}

- (id)valueForHTTPHeader:(id)a3
{
  id v4;
  NSURLRequest *request;
  uint64_t v6;
  void *v7;
  SSURLRequestProperties *requestProperties;
  NSHTTPURLResponse *response;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__74;
  v20 = __Block_byref_object_dispose__74;
  v21 = 0;
  if (v4)
  {
    request = self->_request;
    if (request)
    {
      -[NSURLRequest allHTTPHeaderFields](request, "allHTTPHeaderFields");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      requestProperties = self->_requestProperties;
      if (requestProperties)
      {
        -[SSURLRequestProperties HTTPHeaders](requestProperties, "HTTPHeaders");
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        response = self->_response;
        if (!response)
        {
          v10 = 0;
          goto LABEL_10;
        }
        -[NSHTTPURLResponse allHeaderFields](response, "allHeaderFields");
        v6 = objc_claimAutoreleasedReturnValue();
      }
    }
    v10 = (void *)v6;
LABEL_10:
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __48__SSVSAPSignatureDataSource_valueForHTTPHeader___block_invoke;
    v13[3] = &unk_1E47C0110;
    v14 = v4;
    v15 = &v16;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v13);

    v7 = (void *)v17[5];
    goto LABEL_11;
  }
  v7 = 0;
LABEL_11:
  v11 = v7;
  _Block_object_dispose(&v16, 8);

  return v11;
}

void __48__SSVSAPSignatureDataSource_valueForHTTPHeader___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a3;
  if (!objc_msgSend(a2, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

- (id)valueForQueryParameter:(id)a3
{
  id v4;
  void *request;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__74;
  v19 = __Block_byref_object_dispose__74;
  v20 = 0;
  if (v4)
  {
    request = self->_request;
    if (request || (request = self->_requestProperties) != 0 || (request = self->_response) != 0)
    {
      objc_msgSend(request, "URL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v6, 0);
        objc_msgSend(v7, "queryItems");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __52__SSVSAPSignatureDataSource_valueForQueryParameter___block_invoke;
        v12[3] = &unk_1E47C0138;
        v13 = v4;
        v14 = &v15;
        objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

      }
    }
    v9 = (void *)v16[5];
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __52__SSVSAPSignatureDataSource_valueForQueryParameter___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_msgSend(v11, "value");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a4 = 1;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
}

@end
