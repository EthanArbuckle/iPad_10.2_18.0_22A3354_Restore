@implementation SSVURLCache

- (id)cachedConnectionResponseForRequestProperties:(id)a3
{
  return -[SSVURLCache cachedConnectionResponseForRequestProperties:cachedResponse:](self, "cachedConnectionResponseForRequestProperties:cachedResponse:", a3, 0);
}

- (SSVURLCache)initWithConfiguration:(id)a3
{
  id v5;
  SSVURLCache *v6;
  SSVURLCache *v7;
  void *v8;
  __CFDictionary *Mutable;
  uint64_t v10;
  _CFURLCache *v11;

  v5 = a3;
  v6 = -[SSVURLCache init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    -[SSVURLCacheConfiguration sessionIdentifier](v7->_configuration, "sessionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if (-[SSVURLCacheConfiguration supportsProcessSharing](v7->_configuration, "supportsProcessSharing"))
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0C930A0], (const void *)*MEMORY[0x1E0C9AE50]);
      v7->_cacheStorageSession = (__CFURLStorageSession *)_CFURLStorageSessionCreate();
      CFRelease(Mutable);
    }
    if (v7->_cacheStorageSession)
    {
      v10 = _CFURLStorageSessionCopyCache();
      if (v10)
      {
        v11 = (_CFURLCache *)v10;
        CFURLCacheSetMemoryCapacity();
        v7->_urlCache = v11;
      }
    }

  }
  return v7;
}

- (SSVURLCache)init
{
  SSVURLCache *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessSerialQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSVURLCache;
  v2 = -[SSVURLCache init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.StoreServices.SSVURLCache.accessQueue", 0);
    accessSerialQueue = v2->_accessSerialQueue;
    v2->_accessSerialQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (id)cachedConnectionResponseForRequestProperties:(id)a3 cachedResponse:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SSURLConnectionResponse *v10;
  void *v11;
  SSURLConnectionResponse *v12;
  void *v13;
  void *v14;
  SSMetricsPageEvent *v15;
  SSURLConnectionResponse *v16;

  v6 = (void *)objc_msgSend(a3, "copyURLRequest");
  if (!v6)
  {
    v8 = 0;
LABEL_10:
    v12 = 0;
    if (!a4)
      goto LABEL_12;
LABEL_11:
    *a4 = objc_retainAutorelease(v8);
    goto LABEL_12;
  }
  -[SSVURLCache cachedResponseForRequest:](self, "cachedResponseForRequest:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_10;
  objc_msgSend(v7, "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = [SSURLConnectionResponse alloc];
    objc_msgSend(v8, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SSURLConnectionResponse initWithURLResponse:bodyData:](v10, "initWithURLResponse:bodyData:", v9, v11);

    objc_msgSend(v8, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("metrics-page-event-body-dictionary"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = -[SSMetricsMutableEvent initWithBodyDictionary:]([SSMetricsPageEvent alloc], "initWithBodyDictionary:", v14);
      if (v15)
        -[SSURLConnectionResponse setMetricsPageEvent:](v12, "setMetricsPageEvent:", v15);

    }
  }
  else
  {
    v12 = 0;
  }

  if (a4)
    goto LABEL_11;
LABEL_12:
  v16 = v12;

  return v16;
}

- (id)cachedResponseForRequest:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *accessSerialQueue;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD block[7];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "_CFURLRequest");
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  v24 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SSVURLCache_cachedResponseForRequest___block_invoke;
  block[3] = &unk_1E47B9F00;
  block[5] = &v19;
  block[6] = v5;
  block[4] = self;
  dispatch_sync(accessSerialQueue, block);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", "_SSVURLCPEB", 11, 0);
  objc_msgSend((id)v20[5], "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToData:", v7);

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB34F0]);
    objc_msgSend((id)v20[5], "response");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v20[5], "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "initWithResponse:data:userInfo:storagePolicy:", v11, v12, v13, objc_msgSend((id)v20[5], "storagePolicy"));
    v15 = (void *)v20[5];
    v20[5] = v14;

  }
  v16 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v16;
}

void __40__SSVURLCache_cachedResponseForRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    v2 = CFURLCacheCopyResponseForRequest();
    if (v2)
    {
      v3 = (const void *)v2;
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB34F0]), "_initWithCFCachedURLResponse:", v2);
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      CFRelease(v3);
    }
  }
}

- (void)dealloc
{
  __CFURLStorageSession *cacheStorageSession;
  _CFURLCache *urlCache;
  objc_super v5;

  cacheStorageSession = self->_cacheStorageSession;
  if (cacheStorageSession)
    CFRelease(cacheStorageSession);
  urlCache = self->_urlCache;
  if (urlCache)
    CFRelease(urlCache);
  v5.receiver = self;
  v5.super_class = (Class)SSVURLCache;
  -[SSVURLCache dealloc](&v5, sel_dealloc);
}

- (void)configureRequest:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "_CFURLRequest");
  if (self->_cacheStorageSession)
    _CFURLRequestSetStorageSession();
}

- (void)loadMemoryCacheFromDisk
{
  NSObject *accessSerialQueue;
  _QWORD block[5];

  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SSVURLCache_loadMemoryCacheFromDisk__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(accessSerialQueue, block);
}

uint64_t __38__SSVURLCache_loadMemoryCacheFromDisk__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (result)
    return _CFURLCacheLoadMemoryFromDiskNow();
  return result;
}

- (void)removeAllCachedResponses
{
  NSObject *accessSerialQueue;
  _QWORD block[5];

  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SSVURLCache_removeAllCachedResponses__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(accessSerialQueue, block);
}

uint64_t __39__SSVURLCache_removeAllCachedResponses__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (result)
    return CFURLCacheRemoveAllCachedResponses();
  return result;
}

- (void)saveMemoryCacheToDisk
{
  NSObject *accessSerialQueue;
  _QWORD block[5];

  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SSVURLCache_saveMemoryCacheToDisk__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(accessSerialQueue, block);
}

uint64_t __36__SSVURLCache_saveMemoryCacheToDisk__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (result)
    return _CFURLCachePersistMemoryToDiskNow();
  return result;
}

- (void)storeCachedResponse:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *accessSerialQueue;
  _QWORD block[4];
  id v18;
  SSVURLCache *v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB34F0]);
    objc_msgSend(v6, "response");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", "_SSVURLCPEB", 11, 0);
    objc_msgSend(v6, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "initWithResponse:data:userInfo:storagePolicy:", v11, v12, v13, objc_msgSend(v6, "storagePolicy"));

    v6 = (id)v14;
  }
  if (self->_urlCache)
  {
    v15 = objc_msgSend(objc_retainAutorelease(v7), "_CFURLRequest");
    objc_msgSend(v6, "_CFCachedURLResponse");
    CFURLCacheAddCachedResponseForRequest();
    accessSerialQueue = self->_accessSerialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__SSVURLCache_storeCachedResponse_forRequest___block_invoke;
    block[3] = &unk_1E47B9F28;
    v18 = v6;
    v19 = self;
    v20 = v15;
    dispatch_async(accessSerialQueue, block);

  }
}

void __46__SSVURLCache_storeCachedResponse_forRequest___block_invoke(uint64_t a1)
{
  double Current;
  void *v3;
  void *v4;
  uint64_t v5;
  const void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  while (CFAbsoluteTimeGetCurrent() - Current < 3.0)
  {
    v4 = (void *)MEMORY[0x1A8585BF8]();
    v5 = CFURLCacheCopyResponseForRequest();
    if (v5)
    {
      v6 = (const void *)v5;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34F0]), "_initWithCFCachedURLResponse:", v5);
      CFRelease(v6);
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v7, "userInfo");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 == v13 || objc_msgSend(v8, "isEqualToDictionary:"))
    {
      objc_msgSend(v7, "data");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v3)
      {

        objc_autoreleasePoolPop(v4);
        break;
      }
      v11 = v10;
      v12 = objc_msgSend(v10, "isEqualToData:", v3);

      objc_autoreleasePoolPop(v4);
      if ((v12 & 1) != 0)
        break;
    }
    else
    {

      objc_autoreleasePoolPop(v4);
    }
  }

}

- (void)storeConnectionResponse:(id)a3 forRequestProperties:(id)a4
{
  -[SSVURLCache storeConnectionResponse:forRequestProperties:userInfo:](self, "storeConnectionResponse:forRequestProperties:userInfo:", a3, a4, 0);
}

- (void)storeConnectionResponse:(id)a3 forRequestProperties:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v20, "URLResponse");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "copyURLRequest");

  if (v11 && v10)
  {
    objc_msgSend(v20, "metricsPageEvent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bodyDictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v8)
    {
      v15 = objc_msgSend(v8, "mutableCopy");
      v16 = (void *)v15;
      if (!v14)
      {
LABEL_10:
        v17 = objc_alloc(MEMORY[0x1E0CB34F0]);
        objc_msgSend(v20, "bodyData");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v17, "initWithResponse:data:userInfo:storagePolicy:", v10, v18, v16, 0);

        -[SSVURLCache storeCachedResponse:forRequest:](self, "storeCachedResponse:forRequest:", v19, v11);
        goto LABEL_11;
      }
      if (v15)
      {
LABEL_9:
        objc_msgSend(v16, "setObject:forKey:", v14, CFSTR("metrics-page-event-body-dictionary"));
        goto LABEL_10;
      }
    }
    else if (!v13)
    {
      v16 = 0;
      goto LABEL_10;
    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    goto LABEL_9;
  }
LABEL_11:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_accessSerialQueue, 0);
}

@end
