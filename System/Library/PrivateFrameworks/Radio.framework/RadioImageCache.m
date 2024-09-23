@implementation RadioImageCache

- (RadioImageCache)init
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("RadioImageCacheInitializationException"), CFSTR("Do not use -init. Use +sharedCache instead."));

  return 0;
}

- (id)_init
{
  RadioImageCache *v2;
  NSOperationQueue *v3;
  NSOperationQueue *imageRequestQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RadioImageCache;
  v2 = -[RadioImageCache init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    imageRequestQueue = v2->_imageRequestQueue;
    v2->_imageRequestQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_imageRequestQueue, "setMaxConcurrentOperationCount:", 5);
    -[NSOperationQueue setName:](v2->_imageRequestQueue, "setName:", CFSTR("com.apple.Radio.RadioImageCache.imageRequestQueue"));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSOperationQueue cancelAllOperations](self->_imageRequestQueue, "cancelAllOperations");
  v3.receiver = self;
  v3.super_class = (Class)RadioImageCache;
  -[RadioImageCache dealloc](&v3, sel_dealloc);
}

- (id)cachedImageDataForRadioArtwork:(id)a3 MIMEType:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[RadioImageCache _requestForRadioArtwork:](self, "_requestForRadioArtwork:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[RadioImageCache _cachedResponseForRequest:](self, "_cachedResponseForRequest:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (a4)
    {
      objc_msgSend(v7, "response");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "MIMEType");
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "data");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x24BDBCE50]);
  }

  return v10;
}

- (id)cachedImageDataForStation:(id)a3 withExactSize:(CGSize)a4 MIMEType:(id *)a5
{
  double height;
  double width;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v14;

  height = a4.height;
  width = a4.width;
  objc_msgSend(a3, "artworkCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bestArtworkForPointSize:", width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "pointSize");
  if (width == v12 && height == v11)
  {
    -[RadioImageCache cachedImageDataForRadioArtwork:MIMEType:](self, "cachedImageDataForRadioArtwork:MIMEType:", v10, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)loadImageForRadioArtwork:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;
  _QWORD block[4];
  id v17;

  v6 = a3;
  v7 = a4;
  -[RadioImageCache _requestForRadioArtwork:](self, "_requestForRadioArtwork:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDD1478]);
    objc_initWeak(&location, v9);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __66__RadioImageCache_loadImageForRadioArtwork_withCompletionHandler___block_invoke_2;
    v11[3] = &unk_24CA2E1B0;
    objc_copyWeak(&v14, &location);
    v13 = v7;
    v12 = v8;
    objc_msgSend(v9, "addExecutionBlock:", v11);
    -[NSOperationQueue addOperation:](self->_imageRequestQueue, "addOperation:", v9);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__RadioImageCache_loadImageForRadioArtwork_withCompletionHandler___block_invoke;
    block[3] = &unk_24CA2E138;
    v17 = v7;
    dispatch_async(v10, block);

    v9 = v17;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)loadImageForStation:(id)a3 withSize:(CGSize)a4 completionHandler:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  id v11;

  height = a4.height;
  width = a4.width;
  v9 = a5;
  objc_msgSend(a3, "artworkCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bestArtworkForPointSize:", width, height);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[RadioImageCache loadImageForRadioArtwork:withCompletionHandler:](self, "loadImageForRadioArtwork:withCompletionHandler:", v11, v9);
}

- (void)_removeAllCachedImages
{
  if (objc_msgSend((id)objc_opt_class(), "_sharedCFURLCache"))
    CFURLCacheRemoveAllCachedResponses();
}

- (id)_cachedResponseForRequest:(id)a3
{
  uint64_t v3;
  const void *v4;
  void *v5;

  objc_msgSend(objc_retainAutorelease(a3), "_CFURLRequest");
  if (objc_msgSend((id)objc_opt_class(), "_sharedCFURLCache") && (v3 = CFURLCacheCopyResponseForRequest()) != 0)
  {
    v4 = (const void *)v3;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7438]), "_initWithCFCachedURLResponse:", v3);
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_requestForRadioArtwork:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  const void *v6;

  objc_msgSend(a3, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB7458]), "initWithURL:", v3);
    v5 = objc_msgSend((id)objc_opt_class(), "_newSharedCacheStorageSession");
    if (v5)
    {
      v6 = (const void *)v5;
      v4 = objc_retainAutorelease(v4);
      objc_msgSend(v4, "_CFURLRequest");
      _CFURLRequestSetStorageSession();
      CFRelease(v6);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageRequestQueue, 0);
}

uint64_t __66__RadioImageCache_loadImageForRadioArtwork_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__RadioImageCache_loadImageForRadioArtwork_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  dispatch_semaphore_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD *v27;
  uint64_t *v28;
  _QWORD v29[4];
  NSObject *v30;
  uint64_t *v31;
  uint64_t *v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  void *v47;
  _QWORD block[4];
  id v49;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && !objc_msgSend(WeakRetained, "isCancelled"))
  {
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__5;
    v46 = __Block_byref_object_dispose__6;
    v47 = 0;
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__5;
    v40 = __Block_byref_object_dispose__6;
    v41 = 0;
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = __Block_byref_object_copy__5;
    v34[4] = __Block_byref_object_dispose__6;
    v35 = 0;
    v7 = dispatch_semaphore_create(0);
    objc_msgSend(MEMORY[0x24BDB74B0], "sharedSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __66__RadioImageCache_loadImageForRadioArtwork_withCompletionHandler___block_invoke_13;
    v29[3] = &unk_24CA2E160;
    v31 = &v36;
    v32 = &v42;
    v33 = v34;
    v11 = v7;
    v30 = v11;
    objc_msgSend(v8, "dataTaskWithRequest:completionHandler:", v9, v29);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "resume");
      dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    }
    if (!v37[5])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = (id)v43[5];
        v14 = objc_msgSend(v13, "statusCode");
        v15 = v14;
        if (v14 > 399 || !v14)
        {
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("statusCode"));

          objc_msgSend(MEMORY[0x24BDB7450], "localizedStringForStatusCode:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v16, "setObject:forKey:", v18, *MEMORY[0x24BDD0FC8]);
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1308], -1, v16);
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v37[5];
          v37[5] = v19;

        }
      }
    }
    if (v37[5])
    {
      v21 = 0;
    }
    else
    {
      objc_msgSend((id)v43[5], "MIMEType");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = *(void **)(a1 + 40);
    if (v22)
    {
      dispatch_get_global_queue(0, 0);
      v23 = objc_claimAutoreleasedReturnValue();
      v24[0] = v10;
      v24[1] = 3221225472;
      v24[2] = __66__RadioImageCache_loadImageForRadioArtwork_withCompletionHandler___block_invoke_2_20;
      v24[3] = &unk_24CA2E188;
      v26 = v22;
      v27 = v34;
      v25 = v21;
      v28 = &v36;
      dispatch_async(v23, v24);

    }
    _Block_object_dispose(v34, 8);

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v42, 8);
    v6 = v47;
    goto LABEL_21;
  }
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__RadioImageCache_loadImageForRadioArtwork_withCompletionHandler___block_invoke_3;
    block[3] = &unk_24CA2E138;
    v49 = v4;
    dispatch_async(v5, block);

    v6 = v49;
LABEL_21:

  }
}

void __66__RadioImageCache_loadImageForRadioArtwork_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1308], -999, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, v2);

}

void __66__RadioImageCache_loadImageForRadioArtwork_withCompletionHandler___block_invoke_13(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v7 = a2;
  v8 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  v15 = a4;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;
  v11 = v8;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v7;
  v14 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __66__RadioImageCache_loadImageForRadioArtwork_withCompletionHandler___block_invoke_2_20(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[4], *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
}

+ (id)sharedCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__RadioImageCache_sharedCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, block);
  return (id)sharedCache___imageCache;
}

+ (_CFURLCache)_sharedCFURLCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__RadioImageCache__sharedCFURLCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_sharedCFURLCache_sOnce != -1)
    dispatch_once(&_sharedCFURLCache_sOnce, block);
  return (_CFURLCache *)_sharedCFURLCache__shared;
}

+ (__CFURLStorageSession)_newSharedCacheStorageSession
{
  __CFURLStorageSession *result;

  if (_newSharedCacheStorageSession_sOnce != -1)
    dispatch_once(&_newSharedCacheStorageSession_sOnce, &__block_literal_global);
  result = (__CFURLStorageSession *)_newSharedCacheStorageSession_storageSession;
  if (_newSharedCacheStorageSession_storageSession)
  {
    result = (__CFURLStorageSession *)CFRetain((CFTypeRef)_newSharedCacheStorageSession_storageSession);
    _newSharedCacheStorageSession_storageSession = (uint64_t)result;
  }
  return result;
}

void __48__RadioImageCache__newSharedCacheStorageSession__block_invoke()
{
  void *v0;
  __CFDictionary *Mutable;

  v0 = (void *)MEMORY[0x212BC834C]();
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDB7678], (const void *)*MEMORY[0x24BDBD270]);
  _newSharedCacheStorageSession_storageSession = _CFURLStorageSessionCreate();
  CFRelease(Mutable);
  objc_autoreleasePoolPop(v0);
}

void __36__RadioImageCache__sharedCFURLCache__block_invoke()
{
  uint64_t v0;
  const void *v1;
  uint64_t v2;
  uint64_t v3;

  v0 = objc_msgSend((id)objc_opt_class(), "_newSharedCacheStorageSession");
  if (v0)
  {
    v1 = (const void *)v0;
    v2 = _CFURLStorageSessionCopyCache();
    if (v2)
    {
      v3 = v2;
      CFURLCacheSetMemoryCapacity();
      _sharedCFURLCache__shared = v3;
    }
    CFRelease(v1);
  }
}

void __30__RadioImageCache_sharedCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
  v1 = (void *)sharedCache___imageCache;
  sharedCache___imageCache = v0;

}

@end
