@implementation NotesCIDURLProtocol

+ (void)registerDataProvider:(id)a3 forCIDURL:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t block;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;

  block = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __54__NotesCIDURLProtocol_registerDataProvider_forCIDURL___block_invoke;
  v14 = &__block_descriptor_40_e5_v8__0l;
  v15 = a1;
  v5 = registerDataProvider_forCIDURL__onceToken;
  v6 = a4;
  v7 = a3;
  v9 = v7;
  if (v5 == -1)
  {
    v8 = v7;
  }
  else
  {
    dispatch_once(&registerDataProvider_forCIDURL__onceToken, &block);
    v8 = v9;
  }
  objc_msgSend((id)s_providersByCID, "setObject:forKeyedSubscript:", v8, v6, v9, block, v12, v13, v14, v15);

}

void __54__NotesCIDURLProtocol_registerDataProvider_forCIDURL___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB39D0], "registerClass:", *(_QWORD *)(a1 + 32));
  v1 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2 = (void *)s_providersByCID;
  s_providersByCID = (uint64_t)v1;

}

+ (void)unregisterDataProviderForCIDURL:(id)a3
{
  objc_msgSend((id)s_providersByCID, "removeObjectForKey:", a3);
}

+ (BOOL)canInitWithRequest:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("cid"));

  return v5;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  return a3;
}

- (void)startLoading
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;

  -[NSURLProtocol request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSURLProtocol client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)s_providersByCID, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v17 = 0;
    v18 = 0;
    v16 = 0;
    v8 = objc_msgSend(v6, "getData:mimeType:error:", &v18, &v17, &v16);
    v9 = v18;
    v10 = v17;
    v11 = v16;
    if (v9 && (v8 & 1) != 0)
    {
      v12 = objc_alloc(MEMORY[0x1E0CB39E8]);
      -[NSURLProtocol request](self, "request");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "URL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v12, "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v14, v10, objc_msgSend(v9, "length"), 0);

      objc_msgSend(v5, "URLProtocol:didReceiveResponse:cacheStoragePolicy:", self, v15, 2);
      objc_msgSend(v5, "URLProtocol:didLoadData:", self, v9);
      objc_msgSend(v5, "URLProtocolDidFinishLoading:", self);

      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NotesCIDURLProtocolErrorDomain"), 100, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v10 = 0;
  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NotesCIDURLProtocolErrorDomain"), 100, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "URLProtocol:didFailWithError:", self, v11);
LABEL_9:

}

@end
