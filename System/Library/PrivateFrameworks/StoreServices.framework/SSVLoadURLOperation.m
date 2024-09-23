@implementation SSVLoadURLOperation

- (id)_initSSVLoadURLOperation
{
  SSVLoadURLOperation *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dispatchQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSVLoadURLOperation;
  v2 = -[SSVLoadURLOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.StoreServices.SSVLoadURLOperation", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v2->_iTunesStoreRequest = 1;
    v2->_shouldSuppressCookies = 0;
    v2->_shouldSuppressUserInfo = 0;
    v2->_attribution = 0;
    v2->_recordsMetrics = 1;
  }
  return v2;
}

- (SSVLoadURLOperation)initWithData:(id)a3 fromOperation:(id)a4
{
  id v7;
  id v8;
  id *v9;
  SSVLoadURLOperation *v10;
  uint64_t v11;
  SSMetricsPageEvent *metricsPageEvent;
  uint64_t v13;
  NSString *storeFrontSuffix;
  uint64_t v15;
  NSURLRequest *urlRequest;

  v7 = a3;
  v8 = a4;
  v9 = -[SSVLoadURLOperation _initSSVLoadURLOperation](self, "_initSSVLoadURLOperation");
  v10 = (SSVLoadURLOperation *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 35, a3);
    v10->_iTunesStoreRequest = objc_msgSend(v8, "isITunesStoreRequest");
    v10->_shouldSuppressCookies = objc_msgSend(v8, "shouldSuppressCookies");
    v10->_shouldSuppressUserInfo = objc_msgSend(v8, "shouldSuppressUserInfo");
    objc_msgSend(v8, "metricsPageEvent");
    v11 = objc_claimAutoreleasedReturnValue();
    metricsPageEvent = v10->_metricsPageEvent;
    v10->_metricsPageEvent = (SSMetricsPageEvent *)v11;

    v10->_recordsMetrics = objc_msgSend(v8, "recordsMetrics");
    objc_msgSend(v8, "storeFrontSuffix");
    v13 = objc_claimAutoreleasedReturnValue();
    storeFrontSuffix = v10->_storeFrontSuffix;
    v10->_storeFrontSuffix = (NSString *)v13;

    objc_msgSend(v8, "URLRequest");
    v15 = objc_claimAutoreleasedReturnValue();
    urlRequest = v10->_urlRequest;
    v10->_urlRequest = (NSURLRequest *)v15;

  }
  return v10;
}

- (SSVLoadURLOperation)initWithURL:(id)a3
{
  void *v4;
  SSVLoadURLOperation *v5;

  objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SSVLoadURLOperation initWithURLRequest:](self, "initWithURLRequest:", v4);

  return v5;
}

- (SSVLoadURLOperation)initWithURLRequest:(id)a3
{
  id v4;
  SSVLoadURLOperation *v5;
  uint64_t v6;
  NSURLRequest *urlRequest;

  v4 = a3;
  v5 = -[SSVLoadURLOperation _initSSVLoadURLOperation](self, "_initSSVLoadURLOperation");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    urlRequest = v5->_urlRequest;
    v5->_urlRequest = (NSURLRequest *)v6;

  }
  return v5;
}

- (SSVLoadURLOperation)initWithURLRequestProperties:(id)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  SSVLoadURLOperation *v14;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0CB37A8]);
  objc_msgSend(v5, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "cachePolicy");
  objc_msgSend(v5, "timeoutInterval");
  v9 = (void *)objc_msgSend(v6, "initWithURL:cachePolicy:timeoutInterval:", v7, v8);

  objc_msgSend(v5, "HTTPBody");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHTTPBody:", v10);

  objc_msgSend(v5, "HTTPMethod");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHTTPMethod:", v11);

  objc_msgSend(v9, "setNetworkServiceType:", objc_msgSend(v5, "networkServiceType"));
  objc_msgSend(v5, "HTTPHeaders");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__SSVLoadURLOperation_initWithURLRequestProperties___block_invoke;
  v16[3] = &unk_1E47BA5D8;
  v13 = v9;
  v17 = v13;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v16);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(objc_retainAutorelease(v13), "_CFURLRequest");
    if ((objc_msgSend(v5, "shouldDecodeResponse") & 1) == 0)
      _CFURLRequestSetProtocolProperty();
  }
  v14 = -[SSVLoadURLOperation initWithURLRequest:](self, "initWithURLRequest:", v13);
  if (v14)
  {
    -[SSVLoadURLOperation setITunesStoreRequest:](v14, "setITunesStoreRequest:", objc_msgSend(v5, "isITunesStoreRequest"));
    -[SSVLoadURLOperation setMachineDataStyle:](v14, "setMachineDataStyle:", objc_msgSend(v5, "machineDataStyle"));
    objc_storeStrong((id *)&v14->_requestProperties, a3);
  }

  return v14;
}

uint64_t __52__SSVLoadURLOperation_initWithURLRequestProperties___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

- (NSCachedURLResponse)cachedURLResponse
{
  id v2;
  void *v3;
  void *v4;

  v2 = -[SSVLoadURLOperation _newURLRequestWithRedirectURL:](self, "_newURLRequestWithRedirectURL:", 0);
  objc_msgSend(MEMORY[0x1E0CB3990], "sharedURLCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedResponseForRequest:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSCachedURLResponse *)v4;
}

- (void)configureWithURLBag:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__SSVLoadURLOperation_configureWithURLBag___block_invoke;
  v6[3] = &unk_1E47B8768;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVLoadURLOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __43__SSVLoadURLOperation_configureWithURLBag___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 432), *(id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 440);
  *(_QWORD *)(v2 + 440) = 0;

}

- (void)configureWithURLBagDictionary:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__SSVLoadURLOperation_configureWithURLBagDictionary___block_invoke;
  v6[3] = &unk_1E47B8768;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVLoadURLOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __53__SSVLoadURLOperation_configureWithURLBagDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  SSVURLBagInterpreter *v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 432);
  *(_QWORD *)(v2 + 432) = 0;

  v4 = -[SSVURLBagInterpreter initWithURLBagDictionary:]([SSVURLBagInterpreter alloc], "initWithURLBagDictionary:", *(_QWORD *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 440);
  *(_QWORD *)(v5 + 440) = v4;

}

+ (id)currentAcceptLanguage
{
  void *v2;
  __CFString *v3;
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  NSObject *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  _BYTE *v33;
  uint64_t v34;
  _BYTE v35[22];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!+[SSDevice deviceIsAudioAccessory](SSDevice, "deviceIsAudioAccessory"))
    goto LABEL_26;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("AppleLanguageCodeSetup"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v3)
  {
    if (!v4)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v19 = v18 | 2;
    else
      v19 = v18;
    objc_msgSend(v5, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      v19 &= 2u;
    if (v19)
    {
      *(_DWORD *)v35 = 138543362;
      *(_QWORD *)&v35[4] = objc_opt_class();
      v21 = *(id *)&v35[4];
      LODWORD(v34) = 12;
      v33 = v35;
      v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
      {
LABEL_25:

LABEL_26:
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults", v33);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKey:", CFSTR("AppleLanguages"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "firstObject");
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v22, 4, v35, v34, *(_OWORD *)v35);
      v20 = objc_claimAutoreleasedReturnValue();
      free(v22);
      SSFileLog(v5, CFSTR("%@"), v23, v24, v25, v26, v27, v28, (uint64_t)v20);
    }

    goto LABEL_25;
  }
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    v7 &= 2u;
  if (v7)
  {
    v9 = (void *)objc_opt_class();
    v10 = v9;
    SSHashIfNeeded(v3);
    *(_DWORD *)v35 = 138543618;
    *(_QWORD *)&v35[4] = v9;
    *(_WORD *)&v35[12] = 2114;
    *(_QWORD *)&v35[14] = objc_claimAutoreleasedReturnValue();
    LODWORD(v34) = 22;
    v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11)
      goto LABEL_27;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, v35, v34);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v11);
    SSFileLog(v5, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v8);
  }

LABEL_27:
  if (v3)
    v30 = v3;
  else
    v30 = CFSTR("en");
  v31 = v30;

  return v31;
}

- (SSVURLDataConsumer)dataConsumer
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__10;
  v9 = __Block_byref_object_dispose__10;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__SSVLoadURLOperation_dataConsumer__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SSVURLDataConsumer *)v2;
}

void __35__SSVLoadURLOperation_dataConsumer__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 264));
}

- (void)dispatchAsync:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_dispatchQueue, a3);
}

- (void)dispatchSync:(id)a3
{
  dispatch_sync((dispatch_queue_t)self->_dispatchQueue, a3);
}

- (id)expiredOutputBlock
{
  return 0;
}

- (BOOL)isITunesStoreRequest
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__SSVLoadURLOperation_isITunesStoreRequest__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __43__SSVLoadURLOperation_isITunesStoreRequest__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 288);
  return result;
}

- (int64_t)machineDataStyle
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__SSVLoadURLOperation_machineDataStyle__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __39__SSVLoadURLOperation_machineDataStyle__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 304);
  return result;
}

- (SSMetricsPageEvent)metricsPageEvent
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__10;
  v9 = __Block_byref_object_dispose__10;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__SSVLoadURLOperation_metricsPageEvent__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SSMetricsPageEvent *)v2;
}

void __39__SSVLoadURLOperation_metricsPageEvent__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 312));
}

- (id)outputBlock
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__23;
  v9 = __Block_byref_object_dispose__24;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__SSVLoadURLOperation_outputBlock__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (void *)MEMORY[0x1A8585DF0](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __34__SSVLoadURLOperation_outputBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)prepareRequestBlock
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__23;
  v9 = __Block_byref_object_dispose__24;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__SSVLoadURLOperation_prepareRequestBlock__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (void *)MEMORY[0x1A8585DF0](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __42__SSVLoadURLOperation_prepareRequestBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)recordsMetrics
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__SSVLoadURLOperation_recordsMetrics__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __37__SSVLoadURLOperation_recordsMetrics__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 344);
  return result;
}

- (NSString)referrerApplicationName
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__10;
  v9 = __Block_byref_object_dispose__10;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__SSVLoadURLOperation_referrerApplicationName__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __46__SSVLoadURLOperation_referrerApplicationName__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)referrerURLString
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__10;
  v9 = __Block_byref_object_dispose__10;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__SSVLoadURLOperation_referrerURLString__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __40__SSVLoadURLOperation_referrerURLString__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (SSVFairPlaySAPSession)SAPSession
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__10;
  v9 = __Block_byref_object_dispose__10;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__SSVLoadURLOperation_SAPSession__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SSVFairPlaySAPSession *)v2;
}

void __33__SSVLoadURLOperation_SAPSession__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 392));
}

- (SSVSAPSignaturePolicy)SAPSignaturePolicy
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__10;
  v9 = __Block_byref_object_dispose__10;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__SSVLoadURLOperation_SAPSignaturePolicy__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SSVSAPSignaturePolicy *)v2;
}

void __41__SSVLoadURLOperation_SAPSignaturePolicy__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 400), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setDataConsumer:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__SSVLoadURLOperation_setDataConsumer___block_invoke;
  v6[3] = &unk_1E47B8768;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVLoadURLOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __39__SSVLoadURLOperation_setDataConsumer___block_invoke(uint64_t a1)
{
  id v1;
  id *v2;

  v1 = *(id *)(a1 + 40);
  v2 = (id *)(*(_QWORD *)(a1 + 32) + 264);
  if (*v2 != v1)
    objc_storeStrong(v2, v1);
}

- (void)setITunesStoreRequest:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__SSVLoadURLOperation_setITunesStoreRequest___block_invoke;
  v3[3] = &unk_1E47B9850;
  v3[4] = self;
  v4 = a3;
  -[SSVLoadURLOperation dispatchAsync:](self, "dispatchAsync:", v3);
}

uint64_t __45__SSVLoadURLOperation_setITunesStoreRequest___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 288) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setMachineDataStyle:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__SSVLoadURLOperation_setMachineDataStyle___block_invoke;
  v3[3] = &unk_1E47BA600;
  v3[4] = self;
  v3[5] = a3;
  -[SSVLoadURLOperation dispatchAsync:](self, "dispatchAsync:", v3);
}

uint64_t __43__SSVLoadURLOperation_setMachineDataStyle___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 304) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setOutputBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__SSVLoadURLOperation_setOutputBlock___block_invoke;
  v6[3] = &unk_1E47B8AC0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVLoadURLOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __38__SSVLoadURLOperation_setOutputBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 320) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 320);
    *(_QWORD *)(v5 + 320) = v4;

  }
}

- (void)setPrepareRequestBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__SSVLoadURLOperation_setPrepareRequestBlock___block_invoke;
  v6[3] = &unk_1E47B8AC0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVLoadURLOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __46__SSVLoadURLOperation_setPrepareRequestBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 328) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 328);
    *(_QWORD *)(v5 + 328) = v4;

  }
}

- (void)setRecordsMetrics:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__SSVLoadURLOperation_setRecordsMetrics___block_invoke;
  v3[3] = &unk_1E47B9850;
  v3[4] = self;
  v4 = a3;
  -[SSVLoadURLOperation dispatchAsync:](self, "dispatchAsync:", v3);
}

uint64_t __41__SSVLoadURLOperation_setRecordsMetrics___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 344) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setReferrerApplicationName:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__SSVLoadURLOperation_setReferrerApplicationName___block_invoke;
  v6[3] = &unk_1E47B8768;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVLoadURLOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __50__SSVLoadURLOperation_setReferrerApplicationName___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 360) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 360);
    *(_QWORD *)(v5 + 360) = v4;

  }
}

- (void)setReferrerURLString:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__SSVLoadURLOperation_setReferrerURLString___block_invoke;
  v6[3] = &unk_1E47B8768;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVLoadURLOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __44__SSVLoadURLOperation_setReferrerURLString___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 368) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 368);
    *(_QWORD *)(v5 + 368) = v4;

  }
}

- (void)setSAPSession:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__SSVLoadURLOperation_setSAPSession___block_invoke;
  v6[3] = &unk_1E47B8768;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVLoadURLOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __37__SSVLoadURLOperation_setSAPSession___block_invoke(uint64_t a1)
{
  id v1;
  id *v2;

  v1 = *(id *)(a1 + 40);
  v2 = (id *)(*(_QWORD *)(a1 + 32) + 392);
  if (*v2 != v1)
    objc_storeStrong(v2, v1);
}

- (void)setSAPSignaturePolicy:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__SSVLoadURLOperation_setSAPSignaturePolicy___block_invoke;
  v6[3] = &unk_1E47B8768;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVLoadURLOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __45__SSVLoadURLOperation_setSAPSignaturePolicy___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 400) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 400);
    *(_QWORD *)(v5 + 400) = v4;

  }
}

- (void)setStoreFrontSuffix:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__SSVLoadURLOperation_setStoreFrontSuffix___block_invoke;
  v6[3] = &unk_1E47B8768;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVLoadURLOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __43__SSVLoadURLOperation_setStoreFrontSuffix___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 416) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 416);
    *(_QWORD *)(v5 + 416) = v4;

  }
}

- (NSString)storeFrontSuffix
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__10;
  v9 = __Block_byref_object_dispose__10;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__SSVLoadURLOperation_storeFrontSuffix__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __39__SSVLoadURLOperation_storeFrontSuffix__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 416));
}

- (NSURL)URL
{
  return -[NSURLRequest URL](self->_urlRequest, "URL");
}

- (NSURLRequest)URLRequest
{
  return self->_urlRequest;
}

- (NSHTTPURLResponse)URLResponse
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__10;
  v9 = __Block_byref_object_dispose__10;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__SSVLoadURLOperation_URLResponse__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSHTTPURLResponse *)v2;
}

void __34__SSVLoadURLOperation_URLResponse__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSVLoadURLOperation;
  -[SSVLoadURLOperation cancel](&v3, sel_cancel);
  -[SSVLoadURLOperation _stopRunLoop](self, "_stopRunLoop");
}

- (void)main
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  if (self->_inputData)
  {
    -[SSVLoadURLOperation _finishWithData:](self, "_finishWithData:");
  }
  else
  {
    v3 = -[SSVLoadURLOperation shouldSuppressUserInfo](self, "shouldSuppressUserInfo");
    if ((v3 & 1) == 0)
      v3 = -[SSVLoadURLOperation _createAuthKitSession](self, "_createAuthKitSession");
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 1;
    v4 = MEMORY[0x1E0C809B0];
    while (*((_BYTE *)v8 + 24))
    {
      v5 = (void *)MEMORY[0x1A8585BF8](v3);
      -[SSVLoadURLOperation _runOnce](self, "_runOnce");
      v6[0] = v4;
      v6[1] = 3221225472;
      v6[2] = __27__SSVLoadURLOperation_main__block_invoke;
      v6[3] = &unk_1E47B8680;
      v6[4] = self;
      v6[5] = &v7;
      -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v6);
      objc_autoreleasePoolPop(v5);
    }
    _Block_object_dispose(&v7, 8);
  }
  -[SSVLoadURLOperation setPrepareRequestBlock:](self, "setPrepareRequestBlock:", 0);
}

uint64_t __27__SSVLoadURLOperation_main__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 408);
  return result;
}

- (NSNumber)metricsLoadURLSessionDuration
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[SSVLoadURLOperation delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SSVLoadURLOperation delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metricsLoadURLSessionDuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSNumber *)v6;
}

- (NSNumber)metricsLoadURLSamplingPercentage
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[SSVLoadURLOperation delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SSVLoadURLOperation delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metricsLoadURLSamplingPercentage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSNumber *)v6;
}

- (NSNumber)metricsLoadURLSamplingPercentageCachedResponses
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[SSVLoadURLOperation delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SSVLoadURLOperation delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metricsLoadURLSamplingPercentageCachedResponses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSNumber *)v6;
}

- (SSURLRequestProperties)requestProperties
{
  return self->_requestProperties;
}

- (NSData)rawResponseData
{
  return (NSData *)self->_dataBuffer;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithEvent:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  NSObject *v23;
  void *v24;
  int v25;
  int v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  SSMachineDataRequest *v44;
  SSMachineDataRequest *v45;
  NSURL *v46;
  NSURL *redirectURL;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  int *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  _QWORD v61[5];
  id v62;
  uint64_t *v63;
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  BOOL shouldRetry;
  _QWORD v69[5];
  id v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t *v73;
  uint64_t *v74;
  uint64_t *v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  char v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t (*v108)(uint64_t, uint64_t);
  void (*v109)(uint64_t);
  id v110;
  int v111;
  id v112;
  __int16 v113;
  id v114;
  __int16 v115;
  id v116;
  __int16 v117;
  void *v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v60 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    -[SSVLoadURLOperation _finishWithOutput:error:](self, "_finishWithOutput:error:", 0, v12);
    -[SSVLoadURLOperation _stopRunLoop](self, "_stopRunLoop");
    goto LABEL_41;
  }
  v13 = v10;
  v105 = 0;
  v106 = &v105;
  v107 = 0x3032000000;
  v108 = __Block_byref_object_copy__10;
  v109 = __Block_byref_object_dispose__10;
  v110 = 0;
  v101 = 0;
  v102 = &v101;
  v103 = 0x2020000000;
  v104 = 0;
  v95 = 0;
  v96 = &v95;
  v97 = 0x3032000000;
  v98 = __Block_byref_object_copy__10;
  v99 = __Block_byref_object_dispose__10;
  v100 = 0;
  v89 = 0;
  v90 = &v89;
  v91 = 0x3032000000;
  v92 = __Block_byref_object_copy__10;
  v93 = __Block_byref_object_dispose__10;
  v94 = 0;
  v83 = 0;
  v84 = &v83;
  v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__10;
  v87 = __Block_byref_object_dispose__10;
  v88 = 0;
  v77 = 0;
  v78 = &v77;
  v79 = 0x3032000000;
  v80 = __Block_byref_object_copy__10;
  v81 = __Block_byref_object_dispose__10;
  v82 = 0;
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __66__SSVLoadURLOperation_URLSession_task_didCompleteWithEvent_error___block_invoke;
  v69[3] = &unk_1E47BA628;
  v69[4] = self;
  v70 = v11;
  v71 = &v105;
  v72 = &v101;
  v73 = &v95;
  v74 = &v89;
  v75 = &v83;
  v76 = &v77;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v69);
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  shouldRetry = self->_shouldRetry;
  if (v96[5])
  {
    if (v84[5])
    {
      objc_msgSend((id)v78[5], "allHeaderFields");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      HeaderValueForKey(v14, CFSTR("X-Apple-ActionSignature"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15
        || (objc_msgSend((id)v84[5], "dataToSignWithURLResponse:responseData:", v78[5], v90[5]),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v15, 0), v18 = objc_msgSend((id)v96[5], "verifyData:withSignature:error:", v16, v17, 0), v17, v16, v15, (v18 & 1) == 0))
      {
        SSError((uint64_t)CFSTR("SSErrorDomain"), 122, 0, 0);
        v37 = (id)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        *((_BYTE *)v66 + 24) = 0;
        goto LABEL_38;
      }
    }
  }
  v19 = (void *)v78[5];
  if (v19 && *((_BYTE *)v102 + 24))
  {
    objc_msgSend(v19, "allHeaderFields");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    HeaderValueForKey(v58, CFSTR("X-Set-Apple-Store-Front"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v59, "length"))
      goto LABEL_25;
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = objc_msgSend(v20, "shouldLog");
    v22 = objc_msgSend(v20, "shouldLogToDisk");
    objc_msgSend(v20, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v22)
      v25 = v21 | 2;
    else
      v25 = v21;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      v26 = v25;
    else
      v26 = v25 & 2;
    if (v26)
    {
      v10 = v13;
      v27 = (id)objc_opt_class();
      objc_msgSend((id)v78[5], "URL");
      v57 = (id)objc_claimAutoreleasedReturnValue();
      +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "activeAccount");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "hashedDescription");
      v28 = (id)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v59);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = 138544130;
      v112 = v27;
      v113 = 2114;
      v114 = v57;
      v115 = 2114;
      v116 = v28;
      v117 = 2114;
      v118 = v29;
      LODWORD(v54) = 42;
      v53 = &v111;
      v30 = (void *)_os_log_send_and_compose_impl();

      if (!v30)
      {
LABEL_24:

        +[SSDevice currentDevice](SSDevice, "currentDevice");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "originalRequest");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v78[5];
        +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "activeAccount");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setStoreFrontIdentifier:forRequest:response:account:", v59, v40, v41, v43);

LABEL_25:
        v44 = [SSMachineDataRequest alloc];
        v45 = -[SSMachineDataRequest initWithURLResponse:](v44, "initWithURLResponse:", v78[5]);
        if (v45
          && -[SSVLoadURLOperation _shouldRetryAfterMachineDataRequest:](self, "_shouldRetryAfterMachineDataRequest:", v45))
        {
          objc_msgSend((id)v78[5], "URL");
          v46 = (NSURL *)objc_claimAutoreleasedReturnValue();
          redirectURL = self->_redirectURL;
          self->_redirectURL = v46;

          *((_BYTE *)v66 + 24) = 1;
          self->_shouldRetry = 1;
        }

        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v30, 4, &v111, v54);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      free(v30);
      SSFileLog(v20, CFSTR("%@"), v31, v32, v33, v34, v35, v36, (uint64_t)v24);
    }
    else
    {
      v10 = v13;
    }

    goto LABEL_24;
  }
LABEL_29:
  v48 = (void *)v106[5];
  v49 = (void *)v90[5];
  if (v48)
  {
    v50 = v78[5];
    v64 = 0;
    objc_msgSend(v48, "objectForData:response:error:", v49, v50, &v64);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v37 = v64;
    if (!v38)
      goto LABEL_33;
  }
  else
  {
    v38 = v49;
    v37 = 0;
    if (!v38)
    {
LABEL_33:
      if (*((_BYTE *)v102 + 24))
      {
        SSVProtocolRedirectURLForResponse((void *)v78[5], (void *)v90[5]);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v51;
        if (v51)
        {
          v61[0] = MEMORY[0x1E0C809B0];
          v61[1] = 3221225472;
          v61[2] = __66__SSVLoadURLOperation_URLSession_task_didCompleteWithEvent_error___block_invoke_37;
          v61[3] = &unk_1E47BA650;
          v61[4] = self;
          v62 = v51;
          v63 = &v65;
          -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v61);

        }
      }
      v38 = 0;
    }
  }
LABEL_38:
  if (!*((_BYTE *)v66 + 24))
    -[SSVLoadURLOperation _finishWithOutput:error:](self, "_finishWithOutput:error:", v38, v37);
  -[SSVLoadURLOperation _stopRunLoop](self, "_stopRunLoop", v53);
  _Block_object_dispose(&v65, 8);

  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v83, 8);

  _Block_object_dispose(&v89, 8);
  _Block_object_dispose(&v95, 8);

  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v105, 8);

LABEL_41:
}

void __66__SSVLoadURLOperation_URLSession_task_didCompleteWithEvent_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 312);
  if (v3)
  {
    objc_msgSend(v3, "setReferringAppName:", *(_QWORD *)(v2 + 360));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "setReferringURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 368));
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    objc_msgSend(v4, "setResponseEndTime:");

    v2 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    if (v6)
    {
      objc_msgSend(*(id *)(v2 + 312), "setCachedResponse:", objc_msgSend(v6, "cachedResponse"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "setConnectionReused:", objc_msgSend(*(id *)(a1 + 40), "connectionReused"));
      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
      objc_msgSend(*(id *)(a1 + 40), "clientCorrelationKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setClientCorrelationKey:", v8);

      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
      objc_msgSend(*(id *)(a1 + 40), "connectionEndTime");
      objc_msgSend(v9, "setConnectionEndTime:");
      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
      objc_msgSend(*(id *)(a1 + 40), "connectionStartTime");
      objc_msgSend(v10, "setConnectionStartTime:");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "setConnectionStartNStatRXBytes:", objc_msgSend(*(id *)(a1 + 40), "connectionStartNStatRXBytes"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "setConnectionStartNStatTXBytes:", objc_msgSend(*(id *)(a1 + 40), "connectionStartNStatTXBytes"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "setConnectionStopNStatRXBytes:", objc_msgSend(*(id *)(a1 + 40), "connectionStopNStatRXBytes"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "setConnectionStopNStatTXBytes:", objc_msgSend(*(id *)(a1 + 40), "connectionStopNStatTXBytes"));
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
      objc_msgSend(*(id *)(a1 + 40), "domainLookupEndTime");
      objc_msgSend(v11, "setDomainLookupEndTime:");
      v12 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
      objc_msgSend(*(id *)(a1 + 40), "domainLookupStartTime");
      objc_msgSend(v12, "setDomainLookupStartTime:");
      v13 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
      objc_msgSend(*(id *)(a1 + 40), "fetchStartTime");
      objc_msgSend(v13, "setFetchStartTime:");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "setRedirectCount:", objc_msgSend(*(id *)(a1 + 40), "redirectCount"));
      v14 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
      objc_msgSend(*(id *)(a1 + 40), "redirectEndTime");
      objc_msgSend(v14, "setRedirectEndTime:");
      v15 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
      objc_msgSend(*(id *)(a1 + 40), "redirectStartTime");
      objc_msgSend(v15, "setRedirectStartTime:");
      v16 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
      objc_msgSend(*(id *)(a1 + 40), "requestStartTime");
      objc_msgSend(v16, "setRequestStartTime:");
      v17 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
      objc_msgSend(*(id *)(a1 + 40), "responseEndTime");
      objc_msgSend(v17, "setResponseEndTime:");
      v18 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
      objc_msgSend(*(id *)(a1 + 40), "responseStartTime");
      objc_msgSend(v18, "setResponseStartTime:");
      v19 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
      objc_msgSend(*(id *)(a1 + 40), "secureConnectionStartTime");
      objc_msgSend(v19, "setSecureConnectionStartTime:");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "setXPSamplingForced:", objc_msgSend(*(id *)(a1 + 40), "xpSamplingForced"));
      v20 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
      objc_msgSend(*(id *)(a1 + 40), "xpSessionDuration");
      objc_msgSend(v20, "setXPSessionDuration:");
      v21 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
      objc_msgSend(*(id *)(a1 + 40), "xpSamplingPercentageUsers");
      objc_msgSend(v21, "setXPSamplingPercentageUsers:");
      v22 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
      objc_msgSend(*(id *)(a1 + 40), "xpSamplingPercentageCachedResponses");
      objc_msgSend(v22, "setXPSamplingPercentageCachedResponses:");
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(v2 + 264));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 288);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 392));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 256));
  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(void **)(v23 + 440);
  objc_msgSend(*(id *)(v23 + 376), "URL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "mescalSignaturePolicyForResponseURL:", v25);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v28 = *(void **)(v27 + 40);
  *(_QWORD *)(v27 + 40) = v26;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 376));
  v29 = *(_QWORD *)(a1 + 32);
  v30 = *(void **)(v29 + 256);
  *(_QWORD *)(v29 + 256) = 0;

}

void __66__SSVLoadURLOperation_URLSession_task_didCompleteWithEvent_error___block_invoke_37(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 336);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 336);
    *(_QWORD *)(v4 + 336) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 336);
  }
  if ((unint64_t)objc_msgSend(v2, "count") <= 4
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "addObject:", *(_QWORD *)(a1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 352), *(id *)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v6 + 352))
    {
      *(_BYTE *)(v6 + 408) = 1;
      v6 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(v6 + 408);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  void (**v8)(id, uint64_t, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a5;
  v8 = (void (**)(id, uint64_t, void *))a6;
  objc_msgSend(v15, "protectionSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "authenticationMethod");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SSVLoadURLOperation isITunesStoreRequest](self, "isITunesStoreRequest")
    && objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB32C8]))
  {
    if ((objc_msgSend(MEMORY[0x1E0CFDA48], "QAMode") & 1) == 0
      && (objc_msgSend(MEMORY[0x1E0CFDA48], "ignoreServerTrustEvaluation") & 1) == 0
      && !SSDebugShouldIgnoreExtendedValidation())
    {
      v13 = 0;
      v14 = 1;
      goto LABEL_9;
    }
    v11 = (void *)MEMORY[0x1E0CB39A8];
    objc_msgSend(v15, "protectionSpace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "credentialForTrust:", objc_msgSend(v12, "serverTrust"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
  }
  else
  {
    objc_msgSend(v15, "sender");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v14 = objc_opt_respondsToSelector() & 1;
  }

LABEL_9:
  v8[2](v8, v14, v13);

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, id);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, id))a7;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __95__SSVLoadURLOperation_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
  v22[3] = &unk_1E47B8718;
  v22[4] = self;
  v22[5] = &v23;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v22);
  if (v14)
  {
    if (*((_BYTE *)v24 + 24))
    {
      +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "activeAccount");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      +[SSVCookieStorage sharedStorage](SSVCookieStorage, "sharedStorage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setCookiesForHTTPResponse:account:", v14, v18);

    }
    objc_msgSend(v15, "URL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SSVLoadURLOperation _newURLRequestWithRedirectURL:](self, "_newURLRequestWithRedirectURL:", v20);

    v15 = v21;
  }
  v16[2](v16, v15);
  _Block_object_dispose(&v23, 8);

}

void __95__SSVLoadURLOperation_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 312);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSince1970");
    objc_msgSend(v3, "setRequestStartTime:");

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(v2 + 288);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__SSVLoadURLOperation_URLSession_dataTask_didReceiveData___block_invoke;
  v8[3] = &unk_1E47B8768;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v8);

}

uint64_t __58__SSVLoadURLOperation_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "appendData:", *(_QWORD *)(a1 + 40));
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *(*v19)(uint64_t);
  void *v20;
  SSVLoadURLOperation *v21;
  id v22;
  _QWORD v23[5];
  id v24;

  v8 = a5;
  v9 = (void (**)(id, uint64_t))a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;
  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __80__SSVLoadURLOperation_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  v23[3] = &unk_1E47B8768;
  v23[4] = self;
  v13 = v11;
  v24 = v13;
  -[SSVLoadURLOperation dispatchAsync:](self, "dispatchAsync:", v23);
  if (-[SSVLoadURLOperation isITunesStoreRequest](self, "isITunesStoreRequest"))
  {
    v17 = v12;
    v18 = 3221225472;
    v19 = __80__SSVLoadURLOperation_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2;
    v20 = &unk_1E47B8768;
    v21 = self;
    v22 = v8;
    -[SSVLoadURLOperation dispatchAsync:](self, "dispatchAsync:", &v17);
    +[SSAccountStore defaultStore](SSAccountStore, "defaultStore", v17, v18, v19, v20, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activeAccount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[SSVCookieStorage sharedStorage](SSVCookieStorage, "sharedStorage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCookiesForHTTPResponse:account:", v13, v15);

  }
  v9[2](v9, 1);

}

void __80__SSVLoadURLOperation_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 312))
  {
    objc_msgSend((id)v2, "_applyResponseToMetrics:", *(_QWORD *)(a1 + 40));
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSince1970");
    objc_msgSend(v3, "setResponseStartTime:");

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 376), *(id *)(a1 + 40));
}

void *__80__SSVLoadURLOperation_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *result;
  char v4;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(void **)(v2 + 248);
  if (result)
  {
    v4 = 0;
    result = (void *)objc_msgSend(result, "handleResponse:forRequest:shouldRetry:", *(_QWORD *)(a1 + 40), *(_QWORD *)(v2 + 456), &v4);
    if (v4)
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 408) = 1;
  }
  return result;
}

- (void)_configureWithURLBagInterpreter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__SSVLoadURLOperation__configureWithURLBagInterpreter___block_invoke;
  v6[3] = &unk_1E47B8768;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVLoadURLOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __55__SSVLoadURLOperation__configureWithURLBagInterpreter___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 440) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 440);
    *(_QWORD *)(v5 + 440) = v4;

    v7 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v7 + 416))
    {
      objc_msgSend(*(id *)(v7 + 440), "storeFrontSuffix");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 416);
      *(_QWORD *)(v9 + 416) = v8;

    }
  }
}

- (void)_addMachineDataHeadersToRequest:(id)a3 withAccountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__SSVLoadURLOperation__addMachineDataHeadersToRequest_withAccountIdentifier___block_invoke;
  v10[3] = &unk_1E47B87B8;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v10);

}

void __77__SSVLoadURLOperation__addMachineDataHeadersToRequest_withAccountIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 304);
  switch(v3)
  {
    case 3:
LABEL_7:
      v7 = *(void **)(a1 + 48);
      v6 = -1;
      goto LABEL_8;
    case 2:
      v8 = *(void **)(v2 + 440);
      objc_msgSend(*(id *)(a1 + 48), "URL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v8) = objc_msgSend(v8, "shouldSendAnonymousMachineIdentifierForURL:", v9);

      if (!(_DWORD)v8)
        return;
      goto LABEL_7;
    case 1:
      v4 = *(void **)(a1 + 40);
      if (v4)
      {
        v5 = *(void **)(a1 + 48);
        v6 = objc_msgSend(v4, "unsignedLongLongValue");
        v7 = v5;
LABEL_8:
        SSVAnisetteAddHeadersToURLRequest(v7, v6, 0);
      }
      break;
  }
}

- (void)_addSAPSignatureToRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  SSVLoadURLOperation *v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__10;
  v28 = __Block_byref_object_dispose__10;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__10;
  v22 = __Block_byref_object_dispose__10;
  v23 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __49__SSVLoadURLOperation__addSAPSignatureToRequest___block_invoke;
  v13 = &unk_1E47BA678;
  v14 = self;
  v16 = &v24;
  v5 = v4;
  v15 = v5;
  v17 = &v18;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", &v10);
  v6 = (void *)v25[5];
  if (v6 && v19[5])
  {
    objc_msgSend(v6, "dataToSignWithURLRequest:", v5, v10, v11, v12, v13, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend((id)v19[5], "signatureWithData:error:", v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        objc_msgSend(v5, "setValue:forHTTPHeaderField:", v9, CFSTR("X-Apple-ActionSignature"));

    }
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

}

void __49__SSVLoadURLOperation__addSAPSignatureToRequest___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 400);
  if (!v2)
    return;
  v3 = objc_msgSend(v2, "policyType");
  if (v3 == 2)
  {
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 400), "copy");
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;
  }
  else
  {
    if (v3 != 1)
      goto LABEL_7;
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
    objc_msgSend(*(id *)(a1 + 40), "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mescalSignaturePolicyForRequestURL:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
LABEL_7:
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 392);
    if (v12)
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v14 = v12;
      v15 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v14;

    }
    else if (*(_QWORD *)(v11 + 440))
    {
      +[SSVFairPlaySAPSession sharedDefaultSession](SSVFairPlaySAPSession, "sharedDefaultSession");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

    }
  }
}

- (void)_applyResponseToMetrics:(id)a3
{
  id v4;
  SSMetricsPageEvent *metricsPageEvent;
  void *v6;
  void *v7;
  SSMetricsPageEvent *v8;
  void *v9;
  SSMetricsPageEvent *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "allHeaderFields");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  metricsPageEvent = self->_metricsPageEvent;
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsBaseEvent setPageURL:](metricsPageEvent, "setPageURL:", v7);

  v8 = self->_metricsPageEvent;
  HeaderValueForKey(v12, CFSTR("X-Apple-Application-Instance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsPageEvent setServerApplicationInstance:](v8, "setServerApplicationInstance:", v9);

  v10 = self->_metricsPageEvent;
  HeaderValueForKey(v12, CFSTR("Apple-Timing-App"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsPageEvent setServerTiming:](v10, "setServerTiming:", v11);

}

- (void)_createAuthKitSession
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__SSVLoadURLOperation__createAuthKitSession__block_invoke;
  v2[3] = &unk_1E47B8790;
  v2[4] = self;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v2);
}

void __44__SSVLoadURLOperation__createAuthKitSession__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = SSVAuthKitFramework();
  v3 = objc_alloc_init((Class)SSVWeakLinkedClassForString(CFSTR("AKAppleIDSession"), v2));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 248);
  *(_QWORD *)(v4 + 248) = v3;

}

- (id)_dataForCachedResponse:(_CFCachedURLResponse *)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)CFCachedURLResponseCopyReceiverDataArray();
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == 1)
    {
      objc_msgSend(v3, "objectAtIndex:", 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v5 = v3;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v12;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v12 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(v4, "appendData:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), (_QWORD)v11);
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v7);
      }

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_finishWithData:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = 0;
  -[SSVLoadURLOperation _outputForData:error:](self, "_outputForData:error:", a3, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  -[SSVLoadURLOperation _finishWithOutput:error:](self, "_finishWithOutput:error:", v4, v5);

}

- (void)_finishWithOutput:(id)a3 error:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[SSVLoadURLOperation outputBlock](self, "outputBlock");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v9, v6);
    -[SSVLoadURLOperation _releaseOutputBlocks](self, "_releaseOutputBlocks");
  }

}

- (void)_loadURLBagInterpreter
{
  void *v3;
  SSURLBag *v4;
  SSVURLBagInterpreter *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SSVURLBagInterpreter *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[SSVLoadURLOperation bag](self, "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SSVLoadURLOperation bag](self, "bag");
    v4 = (SSURLBag *)objc_claimAutoreleasedReturnValue();
    v5 = -[SSVURLBagInterpreter initWithSSBag:]([SSVURLBagInterpreter alloc], "initWithSSBag:", v4);
    goto LABEL_17;
  }
  v4 = self->_urlBag;
  if (!v4)
  {
    +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[SSURLBag initWithURLBagContext:]([SSURLBag alloc], "initWithURLBagContext:", v6);
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      v9 &= 2u;
    if (v9)
    {
      LODWORD(v21) = 138412290;
      *(_QWORD *)((char *)&v21 + 4) = objc_opt_class();
      v11 = *(id *)((char *)&v21 + 4);
      LODWORD(v20) = 12;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v21, v20, v21);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog(v7, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v10);
    }

    goto LABEL_15;
  }
LABEL_16:
  v5 = -[SSVURLBagInterpreter initWithURLBag:]([SSVURLBagInterpreter alloc], "initWithURLBag:", v4);
LABEL_17:
  v19 = v5;

  if (v19)
    -[SSVLoadURLOperation _configureWithURLBagInterpreter:](self, "_configureWithURLBagInterpreter:", v19);

}

- (id)_newURLRequestWithRedirectURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  AKAppleIDSession *authKitSession;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  id v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[NSURLRequest mutableCopy](self->_urlRequest, "mutableCopy");
  objc_msgSend(v5, "setHTTPShouldUsePipelining:", 1);
  if (v4)
    objc_msgSend(v5, "setURL:", v4);
  v6 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "_CFURLRequest");
  CFURLRequestSetShouldStartSynchronously();
  objc_msgSend(v6, "valueForHTTPHeaderField:", CFSTR("Accept-Language"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend((id)objc_opt_class(), "currentAcceptLanguage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forHTTPHeaderField:", v8, CFSTR("Accept-Language"));

  }
  objc_msgSend(v6, "valueForHTTPHeaderField:", CFSTR("User-Agent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    SSVDefaultUserAgent();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v6, "setValue:forHTTPHeaderField:", v10, CFSTR("User-Agent"));

  }
  v11 = SSViTunesStoreFramework();
  objc_msgSend(SSVWeakLinkedClassForString(CFSTR("ISNetworkObserver"), v11), "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "connectionTypeHeader");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "length"))
    objc_msgSend(v6, "setValue:forHTTPHeaderField:", v13, CFSTR("X-Apple-Connection-Type"));
  if (-[SSVLoadURLOperation isITunesStoreRequest](self, "isITunesStoreRequest"))
  {
    if (-[SSVLoadURLOperation shouldSuppressUserInfo](self, "shouldSuppressUserInfo"))
    {
      v14 = 0;
    }
    else
    {
      +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "activeAccount");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v14, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[SSVLoadURLOperation shouldSuppressUserInfo](self, "shouldSuppressUserInfo"))
    {
      objc_msgSend(v6, "valueForHTTPHeaderField:", CFSTR("X-Dsid"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17 && v16)
      {
        objc_msgSend(v16, "stringValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setValue:forHTTPHeaderField:", v18, CFSTR("X-Dsid"));

      }
      objc_msgSend(v6, "valueForHTTPHeaderField:", CFSTR("iCloud-DSID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        +[SSVAppleAccountStore sharedAccountStore](SSVAppleAccountStore, "sharedAccountStore");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "primaryAppleAccount");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "aa_personID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          objc_msgSend(v6, "setValue:forHTTPHeaderField:", v22, CFSTR("iCloud-DSID"));

      }
    }
    if (objc_msgSend(v14, "isNewCustomer"))
    {
      objc_msgSend(v6, "URL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      URLByAppendingQueryParameter(v23, CFSTR("newCustomer"), CFSTR("true"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "setURL:", v24);
    }
    if (SSDebugShouldSendCacheBuster())
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "UUIDString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v6, "URL");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        URLByAppendingQueryParameter(v27, CFSTR("buster"), v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "setURL:", v28);
      }

    }
    if (!-[SSVLoadURLOperation shouldSuppressCookies](self, "shouldSuppressCookies"))
    {
      +[SSVCookieStorage sharedStorage](SSVCookieStorage, "sharedStorage");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "cookieHeadersForURL:account:", v30, v14);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __53__SSVLoadURLOperation__newURLRequestWithRedirectURL___block_invoke;
      v60[3] = &unk_1E47BA5D8;
      v61 = v6;
      objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", v60);

    }
    objc_msgSend(v6, "setHTTPShouldHandleCookies:", 0);
    objc_msgSend(v6, "valueForHTTPHeaderField:", CFSTR("X-Apple-Store-Front"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32)
    {
      SSVStoreFrontIdentifierForAccount(v14);
      v33 = objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        v34 = (void *)v33;
        -[SSVLoadURLOperation storeFrontSuffix](self, "storeFrontSuffix");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          objc_msgSend(v34, "stringByAppendingString:", v35);
          v36 = objc_claimAutoreleasedReturnValue();

          v34 = (void *)v36;
        }
        objc_msgSend(v6, "setValue:forHTTPHeaderField:", v34, CFSTR("X-Apple-Store-Front"));

      }
    }
    if ((SSIsAppStoreDaemon() & 1) == 0)
    {
      +[SSDevice currentDevice](SSDevice, "currentDevice");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "valueForHTTPHeaderField:", CFSTR("X-Apple-Software-Cuid"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v38)
      {
        objc_msgSend(v37, "softwareLibraryIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "setValue:forHTTPHeaderField:", v39, CFSTR("X-Apple-Software-Cuid"));

      }
    }
    authKitSession = self->_authKitSession;
    if (authKitSession)
    {
      v54 = v16;
      v55 = v4;
      v41 = v14;
      -[AKAppleIDSession appleIDHeadersForRequest:](authKitSession, "appleIDHeadersForRequest:", v6);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v44; ++i)
          {
            if (*(_QWORD *)v57 != v45)
              objc_enumerationMutation(v42);
            v47 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
            objc_msgSend(v42, "objectForKeyedSubscript:", v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setValue:forHTTPHeaderField:", v48, v47);

          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
        }
        while (v44);
      }

      v14 = v41;
      v16 = v54;
      v4 = v55;
    }
    -[SSVLoadURLOperation _addMachineDataHeadersToRequest:withAccountIdentifier:](self, "_addMachineDataHeadersToRequest:withAccountIdentifier:", v6, v16);
    -[SSVLoadURLOperation _addSAPSignatureToRequest:](self, "_addSAPSignatureToRequest:", v6);
    -[SSVLoadURLOperation mainDocumentURL](self, "mainDocumentURL");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      -[SSVLoadURLOperation mainDocumentURL](self, "mainDocumentURL");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMainDocumentURL:", v50);

    }
    objc_msgSend(v6, "setAttribution:", -[SSVLoadURLOperation attribution](self, "attribution"));

  }
  -[SSVLoadURLOperation prepareRequestBlock](self, "prepareRequestBlock");
  v51 = objc_claimAutoreleasedReturnValue();
  v52 = (void *)v51;
  if (v51)
    (*(void (**)(uint64_t, id))(v51 + 16))(v51, v6);

  return v6;
}

void __53__SSVLoadURLOperation__newURLRequestWithRedirectURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "valueForHTTPHeaderField:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("; %@"), v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v8;
  }
  objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", v5, v9);

}

- (id)_outputForData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  if (!v6)
  {
    v9 = 0;
    v10 = 0;
    if (!a4)
      goto LABEL_10;
    goto LABEL_8;
  }
  -[SSVLoadURLOperation dataConsumer](self, "dataConsumer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__10;
    v18 = __Block_byref_object_dispose__10;
    v19 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __44__SSVLoadURLOperation__outputForData_error___block_invoke;
    v13[3] = &unk_1E47B8680;
    v13[4] = self;
    v13[5] = &v14;
    -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v13);
    v8 = v15[5];
    v12 = 0;
    objc_msgSend(v7, "objectForData:response:error:", v6, v8, &v12);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v12;
    _Block_object_dispose(&v14, 8);

  }
  else
  {
    v9 = v6;
    v10 = 0;
  }

  if (a4)
  {
LABEL_8:
    if (!v9)
      *a4 = objc_retainAutorelease(v10);
  }
LABEL_10:

  return v9;
}

void __44__SSVLoadURLOperation__outputForData_error___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 376));
}

- (void)_releaseOutputBlocks
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __43__SSVLoadURLOperation__releaseOutputBlocks__block_invoke;
  v2[3] = &unk_1E47B8790;
  v2[4] = self;
  -[SSVLoadURLOperation dispatchAsync:](self, "dispatchAsync:", v2);
}

void __43__SSVLoadURLOperation__releaseOutputBlocks__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 320);
  *(_QWORD *)(v1 + 320) = 0;

}

- (void)_runOnce
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[3];
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__10;
  v21 = __Block_byref_object_dispose__10;
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __31__SSVLoadURLOperation__runOnce__block_invoke;
  v12[3] = &unk_1E47BA6A0;
  v12[4] = self;
  v5 = v3;
  v13 = v5;
  v14 = &v25;
  v15 = &v17;
  v16 = v23;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v12);
  if (*((_BYTE *)v26 + 24))
    -[SSVLoadURLOperation _loadURLBagInterpreter](self, "_loadURLBagInterpreter");
  v6 = -[SSVLoadURLOperation _newURLRequestWithRedirectURL:](self, "_newURLRequestWithRedirectURL:", v18[5]);
  +[SSURLSessionManager sharedManager](SSURLSessionManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataTaskWithRequest:delegate:", v6, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __31__SSVLoadURLOperation__runOnce__block_invoke_2;
  v11[3] = &unk_1E47B8790;
  v11[4] = self;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v11);
  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v9, &__block_literal_global_4);
  objc_msgSend(v8, "resume");
  -[SSVLoadURLOperation performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__stopIfCancelled, 0, 0.0);
  -[SSVLoadURLOperation _runRunLoopUntilStopped](self, "_runRunLoopUntilStopped");
  objc_msgSend(v8, "cancel");
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__stopIfCancelled, 0);
  dispatch_async(v9, &__block_literal_global_78);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __31__SSVLoadURLOperation__runOnce__block_invoke_5;
  v10[3] = &unk_1E47B8790;
  v10[4] = self;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v10);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);
}

void __31__SSVLoadURLOperation__runOnce__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  SSMetricsPageEvent *v10;
  uint64_t v11;
  void *v12;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 256);
  *(_QWORD *)(v3 + 256) = v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 384), *(id *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v5 + 288) || *(_QWORD *)(v5 + 440))
    goto LABEL_10;
  if (*(_QWORD *)(v5 + 304) == 2)
    goto LABEL_4;
  v6 = *(void **)(v5 + 400);
  if (v6)
  {
    v7 = objc_msgSend(v6, "policyType");
    if (v7 == 2)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 392) == 0;
    }
    else if (v7 == 1)
    {
LABEL_4:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }
LABEL_10:
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 352));
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 352);
  *(_QWORD *)(v8 + 352) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 408) = 0;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 344))
  {
    v10 = objc_alloc_init(SSMetricsPageEvent);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 312);
    *(_QWORD *)(v11 + 312) = v10;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
}

void __31__SSVLoadURLOperation__runOnce__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timeIntervalSince1970");
    objc_msgSend(v1, "setRequestStartTime:");

  }
}

void __31__SSVLoadURLOperation__runOnce__block_invoke_3()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("SSVNetworkingDidStartNotification"), 0);

}

void __31__SSVLoadURLOperation__runOnce__block_invoke_4()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("SSVNetworkingDidStopNotification"), 0);

}

void __31__SSVLoadURLOperation__runOnce__block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 256);
  *(_QWORD *)(v2 + 256) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 384);
  *(_QWORD *)(v4 + 384) = 0;

}

- (int)_runRunLoopUntilStopped
{
  void *v3;
  const __CFString *v4;
  void *v5;
  CFRunLoopRunResult v6;

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__keepAliveTimer_, 0, 0, 1.79769313e308);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_stopped = 0;
  v4 = (const __CFString *)*MEMORY[0x1E0C9B280];
  do
  {
    v5 = (void *)MEMORY[0x1A8585BF8]();
    v6 = CFRunLoopRunInMode(v4, 10.0, 0);
    objc_autoreleasePoolPop(v5);
  }
  while (!self->_stopped && (v6 - 1) > 1);
  objc_msgSend(v3, "invalidate");

  return v6;
}

- (BOOL)_shouldRetryAfterMachineDataRequest:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  uint64_t v6;
  NSObject *v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  SSVLoadURLOperation *v12;
  _QWORD *v13;
  uint64_t *v14;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD *v17;
  _QWORD v18[3];
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (v4)
  {
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v19 = 0;
    v5 = dispatch_semaphore_create(0);
    v6 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59__SSVLoadURLOperation__shouldRetryAfterMachineDataRequest___block_invoke;
    v15[3] = &unk_1E47BA6E8;
    v17 = v18;
    v7 = v5;
    v16 = v7;
    objc_msgSend(v4, "startWithCompletionBlock:", v15);
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __59__SSVLoadURLOperation__shouldRetryAfterMachineDataRequest___block_invoke_2;
    v10[3] = &unk_1E47BA710;
    v13 = v18;
    v14 = &v20;
    v11 = v4;
    v12 = self;
    -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v10);

    _Block_object_dispose(v18, 8);
    v8 = *((_BYTE *)v21 + 24) != 0;
  }
  else
  {
    v8 = 0;
  }
  _Block_object_dispose(&v20, 8);

  return v8;
}

intptr_t __59__SSVLoadURLOperation__shouldRetryAfterMachineDataRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __59__SSVLoadURLOperation__shouldRetryAfterMachineDataRequest___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "actionName");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("RP"));

    v4 = *(_QWORD *)(a1 + 40);
    if (v3)
    {
      *(_QWORD *)(v4 + 296) = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
    else
    {
      ++*(_QWORD *)(v4 + 296);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 296) < 2;
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  result = objc_msgSend(*(id *)(a1 + 32), "protocolVersion");
  if (result)
  {
    if (result != 1)
      return result;
    v6 = 3;
  }
  else
  {
    v6 = 1;
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 304) = v6;
  return result;
}

- (void)_stopIfCancelled
{
  if (-[SSVLoadURLOperation isCancelled](self, "isCancelled"))
    -[SSVLoadURLOperation _stopRunLoop](self, "_stopRunLoop");
}

- (void)_stopRunLoop
{
  uint64_t v3;
  void *v4;
  __CFRunLoop *v5;
  const void *v6;
  _QWORD block[5];
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__10;
  v13 = __Block_byref_object_dispose__10;
  v14 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__SSVLoadURLOperation__stopRunLoop__block_invoke;
  v8[3] = &unk_1E47B8680;
  v8[4] = self;
  v8[5] = &v9;
  -[SSVLoadURLOperation dispatchSync:](self, "dispatchSync:", v8);
  v4 = (void *)v10[5];
  if (v4)
  {
    v5 = (__CFRunLoop *)objc_msgSend(v4, "getCFRunLoop");
    v6 = (const void *)*MEMORY[0x1E0C9B280];
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __35__SSVLoadURLOperation__stopRunLoop__block_invoke_2;
    block[3] = &unk_1E47B8790;
    block[4] = self;
    CFRunLoopPerformBlock(v5, v6, block);
    CFRunLoopWakeUp(v5);
    CFRunLoopStop(v5);
  }
  _Block_object_dispose(&v9, 8);

}

void __35__SSVLoadURLOperation__stopRunLoop__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 384));
}

uint64_t __35__SSVLoadURLOperation__stopRunLoop__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 424) = 1;
  return result;
}

- (SSVLoadURLOperationDelegate)delegate
{
  return (SSVLoadURLOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SSBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (BOOL)shouldSuppressCookies
{
  return self->_shouldSuppressCookies;
}

- (void)setShouldSuppressCookies:(BOOL)a3
{
  self->_shouldSuppressCookies = a3;
}

- (BOOL)shouldSuppressUserInfo
{
  return self->_shouldSuppressUserInfo;
}

- (void)setShouldSuppressUserInfo:(BOOL)a3
{
  self->_shouldSuppressUserInfo = a3;
}

- (NSURL)mainDocumentURL
{
  return (NSURL *)objc_getProperty(self, a2, 488, 1);
}

- (void)setMainDocumentURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 488);
}

- (unint64_t)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(unint64_t)a3
{
  self->_attribution = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainDocumentURL, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong((id *)&self->_urlBagInterpreter, 0);
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_storeFrontSuffix, 0);
  objc_storeStrong((id *)&self->_sapSignaturePolicy, 0);
  objc_storeStrong((id *)&self->_sapSession, 0);
  objc_storeStrong((id *)&self->_runLoop, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_referrerURLString, 0);
  objc_storeStrong((id *)&self->_referrerApplicationName, 0);
  objc_storeStrong((id *)&self->_redirectURL, 0);
  objc_storeStrong((id *)&self->_protocolRedirectURLs, 0);
  objc_storeStrong(&self->_prepareRequestBlock, 0);
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_metricsPageEvent, 0);
  objc_storeStrong((id *)&self->_inputData, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_dataConsumer, 0);
  objc_storeStrong((id *)&self->_dataBuffer, 0);
  objc_storeStrong((id *)&self->_authKitSession, 0);
}

@end
