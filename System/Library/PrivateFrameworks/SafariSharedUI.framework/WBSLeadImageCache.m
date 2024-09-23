@implementation WBSLeadImageCache

- (void)setProviderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_providerDelegate, a3);
}

- (WBSLeadImageCache)initWithImageDirectoryURL:(id)a3
{
  id v4;
  WBSLeadImageCache *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;
  const char *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *internalQueue;
  WBSSiteMetadataImageCache *v13;
  WBSSiteMetadataImageCache *imageCache;
  uint64_t v15;
  NSMutableDictionary *urlStringToRequestSets;
  WBSLeadImageCache *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WBSLeadImageCache;
  v5 = -[WBSLeadImageCache init](&v19, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("com.apple.Safari.%@.%p.internalQueue"), v8, v5);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    v11 = dispatch_queue_create(v10, MEMORY[0x1E0C80D50]);
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)v11;

    v13 = -[WBSSiteMetadataImageCache initWithImageDirectoryURL:imageType:]([WBSSiteMetadataImageCache alloc], "initWithImageDirectoryURL:imageType:", v4, 1);
    imageCache = v5->_imageCache;
    v5->_imageCache = v13;

    -[WBSSiteMetadataImageCache setDelegate:](v5->_imageCache, "setDelegate:", v5);
    -[WBSSiteMetadataImageCache setUpImageCache](v5->_imageCache, "setUpImageCache");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    urlStringToRequestSets = v5->_urlStringToRequestSets;
    v5->_urlStringToRequestSets = (NSMutableDictionary *)v15;

    v17 = v5;
  }

  return v5;
}

- (NSURL)imageDirectoryURL
{
  return -[WBSSiteMetadataImageCache imageDirectoryURL](self->_imageCache, "imageDirectoryURL");
}

- (id)imageForURL:(id)a3
{
  WBSSiteMetadataImageCache *imageCache;
  void *v4;
  void *v5;

  imageCache = self->_imageCache;
  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSiteMetadataImageCache imageForKeyString:getImageState:](imageCache, "imageForKeyString:getImageState:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)saveImage:(id)a3 forURL:(id)a4 completionHandler:(id)a5
{
  WBSSiteMetadataImageCache *imageCache;
  id v8;
  id v9;
  id v10;

  imageCache = self->_imageCache;
  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "absoluteString");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSSiteMetadataImageCache saveImageToDisk:forKeyString:completionHandler:](imageCache, "saveImageToDisk:forKeyString:completionHandler:", v9, v10, v8);

}

- (void)prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4
{
  id v5;
  NSObject *internalQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__WBSLeadImageCache_prepareResponseForRequest_allowDelayedResponse___block_invoke;
  v8[3] = &unk_1E5444618;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_copyWeak(&v10, &location);
  dispatch_barrier_async(internalQueue, v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __68__WBSLeadImageCache_prepareResponseForRequest_allowDelayedResponse___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  objc_msgSend(a1[4], "_addRequest:", a1[5]);
  objc_msgSend(a1[5], "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)*((_QWORD *)a1[4] + 1);
  objc_msgSend(v2, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__WBSLeadImageCache_prepareResponseForRequest_allowDelayedResponse___block_invoke_2;
  v8[3] = &unk_1E54445F0;
  v5 = v2;
  v6 = a1[4];
  v7 = a1[5];
  v9 = v5;
  v10 = v6;
  v11 = v7;
  objc_copyWeak(&v12, a1 + 6);
  objc_msgSend(v3, "getImageForKeyString:completionHandler:", v4, v8);

  objc_destroyWeak(&v12);
}

void __68__WBSLeadImageCache_prepareResponseForRequest_allowDelayedResponse___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  if (v3)
  {
    +[WBSLeadImageCacheResponse responseWithURL:thumbnail:](WBSLeadImageCacheResponse, "responseWithURL:thumbnail:", *(_QWORD *)(a1 + 32), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
    objc_msgSend(WeakRetained, "siteMetadataProvider:didReceiveResponse:ofType:didReceiveNewData:forRequest:", *(_QWORD *)(a1 + 40), v4, 0, 1, *(_QWORD *)(a1 + 48));

  }
  else
  {
    +[WBSImageFetchingURLSessionTaskManager sharedManager](WBSImageFetchingURLSessionTaskManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__WBSLeadImageCache_prepareResponseForRequest_allowDelayedResponse___block_invoke_3;
    v8[3] = &unk_1E54445C8;
    objc_copyWeak(&v11, (id *)(a1 + 56));
    v9 = *(id *)(a1 + 32);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v6, "downloadImageWithURL:options:completionHandler:", v7, 1, v8);

    objc_destroyWeak(&v11);
  }

}

void __68__WBSLeadImageCache_prepareResponseForRequest_allowDelayedResponse___block_invoke_3(id *a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[2];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__WBSLeadImageCache_prepareResponseForRequest_allowDelayedResponse___block_invoke_4;
    v7[3] = &unk_1E5441EB8;
    v7[4] = WeakRetained;
    v8 = v3;
    v9 = a1[4];
    v10 = a1[5];
    dispatch_async(v6, v7);

  }
}

void __68__WBSLeadImageCache_prepareResponseForRequest_allowDelayedResponse___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  if (*(_QWORD *)(a1 + 40))
  {
    +[WBSImageUtilities squareThumbnailImageFromImage:thumbnailWidthInPixels:](WBSImageUtilities, "squareThumbnailImageFromImage:thumbnailWidthInPixels:", 168.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "saveImage:forURL:completionHandler:", v2, *(_QWORD *)(a1 + 48), 0);
    +[WBSLeadImageCacheResponse responseWithURL:thumbnail:](WBSLeadImageCacheResponse, "responseWithURL:thumbnail:", *(_QWORD *)(a1 + 48), v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "siteMetadataProvider:didReceiveResponse:ofType:didReceiveNewData:forRequest:", *(_QWORD *)(a1 + 32), v3, 0, 1, *(_QWORD *)(a1 + 56));

  }
  else
  {
    +[WBSLeadImageCacheResponse responseWithURL:thumbnail:](WBSLeadImageCacheResponse, "responseWithURL:thumbnail:", *(_QWORD *)(a1 + 48), 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "siteMetadataProvider:didReceiveResponse:ofType:didReceiveNewData:forRequest:", *(_QWORD *)(a1 + 32), v2, 0, 1, *(_QWORD *)(a1 + 56));
  }

}

- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a3, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 0;
    *a4 = 1;
  }
  else
  {
    *a4 = 0;
    +[WBSLeadImageCacheResponse responseWithURL:thumbnail:](WBSLeadImageCacheResponse, "responseWithURL:thumbnail:", 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)canHandleRequest:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)stopWatchingUpdatesForRequest:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WBSLeadImageCache *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__WBSLeadImageCache_stopWatchingUpdatesForRequest___block_invoke;
  v7[3] = &unk_1E5441848;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_barrier_async(internalQueue, v7);

}

void __51__WBSLeadImageCache_stopWatchingUpdatesForRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKeyedSubscript:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));
  if (!objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObjectForKey:", v4);

}

- (void)_addRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_urlStringToRequestSets, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_urlStringToRequestSets, "setObject:forKeyedSubscript:", v6, v5);
  }
  objc_msgSend(v6, "addObject:", v7);

}

- (void)emptyCaches
{
  -[WBSSiteMetadataImageCache emptyCache](self->_imageCache, "emptyCache");
}

- (void)purgeUnneededCacheEntries
{
  -[WBSSiteMetadataImageCache purgeUnneededImages](self->_imageCache, "purgeUnneededImages");
}

- (void)savePendingChangesBeforeTermination
{
  -[WBSSiteMetadataImageCache savePendingChangesBeforeTermination](self->_imageCache, "savePendingChangesBeforeTermination");
}

- (void)siteMetadataImageCache:(id)a3 didFinishLoadingImage:(id)a4 forKeyString:(id)a5
{
  id v7;
  id v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__WBSLeadImageCache_siteMetadataImageCache_didFinishLoadingImage_forKeyString___block_invoke;
  block[3] = &unk_1E5441870;
  block[4] = self;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(internalQueue, block);

}

void __79__WBSLeadImageCache_siteMetadataImageCache_didFinishLoadingImage_forKeyString___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  void *v10;
  id obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v13;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v5);
        WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 32));
        v8 = a1[4];
        objc_msgSend(v6, "url");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[WBSLeadImageCacheResponse responseWithURL:thumbnail:](WBSLeadImageCacheResponse, "responseWithURL:thumbnail:", v9, a1[6]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "siteMetadataProvider:didReceiveResponse:ofType:didReceiveNewData:forRequest:", v8, v10, 0, 1, v6);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

}

- (void)siteMetadataImageCacheDidEmptyCache:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__WBSLeadImageCache_siteMetadataImageCacheDidEmptyCache___block_invoke;
  block[3] = &unk_1E5441CB8;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __57__WBSLeadImageCache_siteMetadataImageCacheDidEmptyCache___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__WBSLeadImageCache_siteMetadataImageCacheDidEmptyCache___block_invoke_2;
  v4[3] = &unk_1E5444640;
  v4[4] = v1;
  return objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
}

void __57__WBSLeadImageCache_siteMetadataImageCacheDidEmptyCache___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  uint64_t v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setImageState:forKeyString:", 1, a2);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
        v12 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v10, "url");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[WBSLeadImageCacheResponse responseWithURL:thumbnail:](WBSLeadImageCacheResponse, "responseWithURL:thumbnail:", v13, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "siteMetadataProvider:didReceiveResponse:ofType:didReceiveNewData:forRequest:", v12, v14, 0, 0, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

- (WBSSiteMetadataProviderDelegate)providerDelegate
{
  return (WBSSiteMetadataProviderDelegate *)objc_loadWeakRetained((id *)&self->_providerDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_providerDelegate);
  objc_storeStrong((id *)&self->_urlStringToRequestSets, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end
