@implementation ICURLRequestRegistry

+ (id)sharedRegistry
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ICURLRequestRegistry_sharedRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRegistry_onceToken != -1)
    dispatch_once(&sharedRegistry_onceToken, block);
  return (id)sharedRegistry_sharedRegistry;
}

- (void)registerHandler:(id)a3 forIncomingRequestsWithAction:(id)a4 scheme:(id)a5
{
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id aBlock;

  aBlock = a3;
  v8 = (__CFString *)a4;
  v9 = (__CFString *)a5;
  if (v9)
    v10 = v9;
  else
    v10 = CFSTR("*");
  -[ICURLRequestRegistry requestHandlers](self, "requestHandlers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    v12 = (void *)objc_opt_new();
  if (!v8)
    v8 = CFSTR("*");
  v13 = _Block_copy(aBlock);
  objc_msgSend(v12, "setObject:forKey:", v13, v8);

  -[ICURLRequestRegistry requestHandlers](self, "requestHandlers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v12, v10);

}

- (NSMutableDictionary)requestHandlers
{
  NSMutableDictionary *requestHandlers;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  requestHandlers = self->_requestHandlers;
  if (!requestHandlers)
  {
    v4 = (NSMutableDictionary *)objc_opt_new();
    v5 = self->_requestHandlers;
    self->_requestHandlers = v4;

    requestHandlers = self->_requestHandlers;
  }
  return requestHandlers;
}

- (id)popActiveRequest
{
  void *v3;
  void *v4;
  void *v5;

  -[ICURLRequestRegistry activeRequests](self, "activeRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICURLRequestRegistry popRequest:](self, "popRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)popRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    -[ICURLRequestRegistry activeRequests](self, "activeRequests");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

  }
  return v4;
}

- (NSMutableArray)activeRequests
{
  NSMutableArray *activeRequests;
  NSMutableArray *v4;
  NSMutableArray *v5;

  activeRequests = self->_activeRequests;
  if (!activeRequests)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    v5 = self->_activeRequests;
    self->_activeRequests = v4;

    activeRequests = self->_activeRequests;
  }
  return activeRequests;
}

void __38__ICURLRequestRegistry_sharedRegistry__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedRegistry_sharedRegistry;
  sharedRegistry_sharedRegistry = (uint64_t)v1;

}

- (void)removeHandlerForIncomingRequestsWithAction:(id)a3 scheme:(id)a4
{
  const __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  __CFString *v12;

  v6 = (const __CFString *)a3;
  v7 = (__CFString *)a4;
  if (v7)
    v8 = v7;
  else
    v8 = CFSTR("*");
  if (v6)
    v9 = v6;
  else
    v9 = CFSTR("*");
  v12 = (__CFString *)v9;
  -[ICURLRequestRegistry requestHandlers](self, "requestHandlers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectForKey:", v12);

}

- (id)handlerForIncomingRequestWithAction:(id)a3 scheme:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  -[ICURLRequestRegistry requestHandlers](self, "requestHandlers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    -[ICURLRequestRegistry requestHandlers](self, "requestHandlers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("*"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "objectForKey:", v6);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v11 = (void *)v15;
    }
    else
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("*"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        objc_msgSend(v14, "objectForKey:", CFSTR("*"));
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
    }
    v16 = (uint64_t)_Block_copy(v11);
LABEL_7:
    v12 = (void *)v16;

    goto LABEL_8;
  }
  v11 = v10;
  v12 = _Block_copy(v10);
LABEL_8:

  return v12;
}

- (void)registerOutgoingRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICURLRequestRegistry activeRequests](self, "activeRequests");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (id)popRequestWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ICURLRequestRegistry activeRequests](self, "activeRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectMatchingKey:value:", CFSTR("uniqueID"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICURLRequestRegistry popRequest:](self, "popRequest:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setActiveRequests:(id)a3
{
  objc_storeStrong((id *)&self->_activeRequests, a3);
}

- (void)setRequestHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_requestHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestHandlers, 0);
  objc_storeStrong((id *)&self->_activeRequests, 0);
}

@end
