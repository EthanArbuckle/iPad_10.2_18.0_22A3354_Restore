@implementation ICStorePlatformRequestOperation

- (ICStorePlatformRequestOperation)initWithPlatformRequest:(id)a3
{
  id v4;
  void *v5;
  ICStorePlatformRequestOperation *v6;

  v4 = a3;
  +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICStorePlatformRequestOperation initWithPlatformRequest:usingURLSession:](self, "initWithPlatformRequest:usingURLSession:", v4, v5);

  return v6;
}

- (ICStorePlatformRequestOperation)initWithPlatformRequest:(id)a3 usingURLSession:(id)a4
{
  id v6;
  id v7;
  ICStorePlatformRequestOperation *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *accessQueue;
  uint64_t v11;
  ICStorePlatformRequest *platformRequest;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICStorePlatformRequestOperation;
  v8 = -[ICAsyncOperation init](&v14, sel_init);
  if (v8)
  {
    v9 = dispatch_queue_create("com.apple.iTunesCloud.ICStorePlatformRequestOperation.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v8->_accessQueue;
    v8->_accessQueue = (OS_dispatch_queue *)v9;

    v11 = objc_msgSend(v6, "copy");
    platformRequest = v8->_platformRequest;
    v8->_platformRequest = (ICStorePlatformRequest *)v11;

    objc_storeStrong((id *)&v8->_urlSession, a4);
    -[ICStorePlatformRequestOperation setQualityOfService:](v8, "setQualityOfService:", objc_msgSend(v6, "qualityOfService"));
  }

  return v8;
}

- (void)cancel
{
  NSObject *accessQueue;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICStorePlatformRequestOperation;
  -[ICStorePlatformRequestOperation cancel](&v5, sel_cancel);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ICStorePlatformRequestOperation_cancel__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)execute
{
  int64_t v3;
  id v4;

  if (-[ICStorePlatformRequestOperation isCancelled](self, "isCancelled"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7004, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICStorePlatformRequestOperation _finishWithResponse:error:](self, "_finishWithResponse:error:", 0, v4);

  }
  else
  {
    objc_storeStrong((id *)&self->_strongSelf, self);
    v3 = -[ICStorePlatformRequest personalizationStyle](self->_platformRequest, "personalizationStyle");
    if ((unint64_t)(v3 - 1) >= 2)
    {
      if (!v3)
        -[ICStorePlatformRequestOperation _executeUnpersonalized](self, "_executeUnpersonalized");
    }
    else
    {
      -[ICStorePlatformRequestOperation _executePersonalized](self, "_executePersonalized");
    }
  }
}

- (void)finishWithError:(id)a3
{
  ICStorePlatformRequestOperation *strongSelf;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICStorePlatformRequestOperation;
  -[ICAsyncOperation finishWithError:](&v5, sel_finishWithError_, a3);
  strongSelf = self->_strongSelf;
  self->_strongSelf = 0;

}

- (void)_enqueueDataRequest:(id)a3
{
  id v4;
  NSObject *accessQueue;
  uint64_t v6;
  id v7;
  ICURLSession *urlSession;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  -[ICStorePlatformRequest retryDelay](self->_platformRequest, "retryDelay");
  objc_msgSend(v4, "setRetryDelay:");
  accessQueue = self->_accessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__ICStorePlatformRequestOperation__enqueueDataRequest___block_invoke;
  block[3] = &unk_1E4391110;
  block[4] = self;
  v7 = v4;
  v13 = v7;
  dispatch_barrier_async(accessQueue, block);
  urlSession = self->_urlSession;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __55__ICStorePlatformRequestOperation__enqueueDataRequest___block_invoke_2;
  v10[3] = &unk_1E438E870;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  -[ICURLSession enqueueDataRequest:withCompletionHandler:](urlSession, "enqueueDataRequest:withCompletionHandler:", v9, v10);

}

- (void)_executePersonalized
{
  void *v3;
  void *v4;
  _QWORD v5[6];

  -[ICStorePlatformRequestOperation _requestContext](self, "_requestContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__ICStorePlatformRequestOperation__executePersonalized__block_invoke;
  v5[3] = &unk_1E438E8D8;
  v5[4] = self;
  v5[5] = v3;
  objc_msgSend(v4, "getBagForRequestContext:withCompletionHandler:", v3, v5);

}

- (void)_executeUnpersonalized
{
  void *v3;
  void *v4;
  _QWORD v5[6];

  -[ICStorePlatformRequestOperation _requestContext](self, "_requestContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__ICStorePlatformRequestOperation__executeUnpersonalized__block_invoke;
  v5[3] = &unk_1E438E8D8;
  v5[4] = self;
  v5[5] = v3;
  objc_msgSend(v4, "getBagForRequestContext:withCompletionHandler:", v3, v5);

}

- (void)_finishWithResponse:(id)a3 error:(id)a4
{
  id v6;
  void (**responseHandler)(id, id, id);
  id v8;
  id v9;

  v6 = a4;
  responseHandler = (void (**)(id, id, id))self->_responseHandler;
  v9 = v6;
  if (responseHandler)
  {
    responseHandler[2](responseHandler, a3, v6);
    v8 = self->_responseHandler;
    self->_responseHandler = 0;

    v6 = v9;
  }
  -[ICStorePlatformRequestOperation finishWithError:](self, "finishWithError:", v6);

}

- (id)_requestContext
{
  int64_t v3;
  ICStoreURLResponseAuthenticationProvider *v4;
  uint64_t v5;
  ICURLResponseAuthenticationProvider *v6;
  ICURLResponseAuthenticationProvider *v7;
  void *v8;
  ICURLResponseAuthenticationProvider *v9;
  void *v10;
  _QWORD v12[4];
  ICURLResponseAuthenticationProvider *v13;

  v3 = -[ICStorePlatformRequest personalizationStyle](self->_platformRequest, "personalizationStyle");
  if (v3)
  {
    if (v3 == 1)
    {
      v4 = [ICStoreURLResponseAuthenticationProvider alloc];
      v5 = 1;
    }
    else
    {
      if (v3 != 2)
      {
        v7 = 0;
        goto LABEL_10;
      }
      v4 = [ICStoreURLResponseAuthenticationProvider alloc];
      v5 = 2;
    }
    v6 = -[ICURLResponseAuthenticationProvider initWithUserInteractionLevel:](v4, "initWithUserInteractionLevel:", v5);
  }
  else
  {
    v6 = objc_alloc_init(ICURLResponseAuthenticationProvider);
  }
  v7 = v6;
LABEL_10:
  -[ICStorePlatformRequest requestContext](self->_platformRequest, "requestContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__ICStorePlatformRequestOperation__requestContext__block_invoke;
  v12[3] = &unk_1E4390188;
  v13 = v7;
  v9 = v7;
  v10 = (void *)objc_msgSend(v8, "copyWithBlock:", v12);

  return v10;
}

- (id)_URLRequestWithBaseURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[ICStorePlatformRequest queryItems](self->_platformRequest, "queryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (-[ICStorePlatformRequest shouldIgnoreCache](self->_platformRequest, "shouldIgnoreCache"))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("buster"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

  }
  objc_msgSend(v4, "ic_URLByAppendingQueryItems:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v10);
  -[ICStorePlatformRequest HTTPHeaders](self->_platformRequest, "HTTPHeaders");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAllHTTPHeaderFields:", v12);

  -[ICStorePlatformRequest timeoutInterval](self->_platformRequest, "timeoutInterval");
  objc_msgSend(v11, "setTimeoutInterval:");

  return v11;
}

- (ICStorePlatformRequest)platformRequest
{
  return self->_platformRequest;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_platformRequest, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_activeURLRequest, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

uint64_t __50__ICStorePlatformRequestOperation__requestContext__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAuthenticationProvider:", *(_QWORD *)(a1 + 32));
}

void __57__ICStorePlatformRequestOperation__executeUnpersonalized__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  ICStoreURLRequest *v10;
  void *v11;
  id v12;

  if (a2)
  {
    objc_msgSend(a2, "urlForBagKey:", CFSTR("storeplatform-lookup-url-unpersonalized"));
    v4 = objc_claimAutoreleasedReturnValue();
    v12 = (id)v4;
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "_URLRequestWithBaseURL:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSince1970");
      v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%.0f"), v8, v12);

      objc_msgSend(v5, "setValue:forHTTPHeaderField:", v9, CFSTR("X-JS-TIMESTAMP"));
      v10 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v5, *(_QWORD *)(a1 + 40));
      +[ICJSSignConfiguration storePlatformConfiguration](ICJSSignConfiguration, "storePlatformConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICStoreURLRequest setJSSignConfiguration:](v10, "setJSSignConfiguration:", v11);

      -[ICStoreURLRequest setShouldUseMescalSigning:](v10, "setShouldUseMescalSigning:", 0);
      objc_msgSend(*(id *)(a1 + 32), "_enqueueDataRequest:", v10);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_finishWithResponse:error:", 0, v5);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_finishWithResponse:error:", 0, a3);
  }
}

void __55__ICStorePlatformRequestOperation__executePersonalized__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  ICStoreURLRequest *v6;
  void *v7;
  id v8;

  if (a2)
  {
    objc_msgSend(a2, "urlForBagKey:", CFSTR("storeplatform-lookup-url"));
    v4 = objc_claimAutoreleasedReturnValue();
    v8 = (id)v4;
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "_URLRequestWithBaseURL:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v5, *(_QWORD *)(a1 + 40));
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("storePlatform/%@"), CFSTR("storeplatform-lookup-url"), v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICURLRequest enableLoadURLMetricsWithRequestName:](v6, "enableLoadURLMetricsWithRequestName:", v7);

      objc_msgSend(*(id *)(a1 + 32), "_enqueueDataRequest:", v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_finishWithResponse:error:", 0, v5);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_finishWithResponse:error:", 0, a3);
  }
}

void __55__ICStorePlatformRequestOperation__enqueueDataRequest___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 296), *(id *)(a1 + 40));
}

void __55__ICStorePlatformRequestOperation__enqueueDataRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  ICStorePlatformResponse *v10;
  void *v11;
  ICStorePlatformResponse *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  id v19;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 288);
  v14 = MEMORY[0x1E0C809B0];
  v16 = __55__ICStorePlatformRequestOperation__enqueueDataRequest___block_invoke_3;
  v17 = &unk_1E4391110;
  v15 = 3221225472;
  v18 = v7;
  v19 = v8;
  dispatch_barrier_async(v9, &v14);
  if (v5)
  {
    v10 = [ICStorePlatformResponse alloc];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "itemIdentifiers", v14, v15, v16, v17, v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ICStorePlatformResponse initWithURLResponse:requestedItemIdentifiers:](v10, "initWithURLResponse:requestedItemIdentifiers:", v5, v11);

    if (v12)
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -7102, v6, CFSTR("Failed to run SP lookup"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v13 = v6;
    v12 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_finishWithResponse:error:", v12, v13, v14, v15, v16, v17, v18);

}

void __55__ICStorePlatformRequestOperation__enqueueDataRequest___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 296);
  if (v3 == v2)
  {
    *(_QWORD *)(v1 + 296) = 0;

  }
}

uint64_t __41__ICStorePlatformRequestOperation_cancel__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 296))
    return objc_msgSend(*(id *)(v1 + 312), "cancelRequest:");
  return result;
}

@end
