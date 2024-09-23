@implementation WBSSiteMetadataImageCache

void __73__WBSSiteMetadataImageCache__requestImageForKeyString_completionHandler___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 6);
    v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    os_unfair_lock_unlock(v3 + 6);
    if ((v4 & 1) != 0)
    {
      objc_msgSend(*(id *)&v3[14]._os_unfair_lock_opaque, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        if (*(_QWORD *)(a1 + 40))
        {
          v6 = (void *)MEMORY[0x1A85D45E4]();
          objc_msgSend(v5, "addObject:", v6);

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)&v3[14]._os_unfair_lock_opaque, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 32));
        if (*(_QWORD *)(a1 + 40))
        {
          v7 = (void *)MEMORY[0x1A85D45E4]();
          objc_msgSend(v5, "addObject:", v7);

        }
        if (*(_QWORD *)&v3[24]._os_unfair_lock_opaque)
        {
          v8[0] = MEMORY[0x1E0C809B0];
          v8[1] = 3221225472;
          v8[2] = __73__WBSSiteMetadataImageCache__requestImageForKeyString_completionHandler___block_invoke_3;
          v8[3] = &unk_1E54413C0;
          v8[4] = v3;
          v9 = *(id *)(a1 + 32);
          -[os_unfair_lock_s _dispatchDiskReadBlock:](v3, "_dispatchDiskReadBlock:", v8);

        }
        else
        {
          -[os_unfair_lock_s _didLoadImage:forKeyString:fromDisk:](v3, "_didLoadImage:forKeyString:fromDisk:", 0, *(_QWORD *)(a1 + 32), 1);
        }
      }

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)_requestImageForKeyString:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  unsigned __int8 v8;
  uint64_t v9;
  void (**v10)(id, _QWORD, uint64_t);
  id v11;
  uint64_t (**v12)(void);
  NSObject *internalQueue;
  _QWORD v14[4];
  id v15;
  void (**v16)(id, _QWORD, uint64_t);
  uint64_t (**v17)(void);
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  if (!objc_msgSend(v6, "length") || (v8 = atomic_load((unsigned __int8 *)&self->_terminating), (v8 & 1) != 0))
  {
    v7[2](v7, 0, 2);
  }
  else
  {
    objc_initWeak(&location, self);
    v9 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __73__WBSSiteMetadataImageCache__requestImageForKeyString_completionHandler___block_invoke;
    v19[3] = &unk_1E5445E30;
    objc_copyWeak(&v22, &location);
    v10 = v7;
    v21 = v10;
    v11 = v6;
    v20 = v11;
    v12 = (uint64_t (**)(void))MEMORY[0x1A85D45E4](v19);
    if ((v12[2]() & 1) != 0)
    {
      internalQueue = self->_internalQueue;
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = __73__WBSSiteMetadataImageCache__requestImageForKeyString_completionHandler___block_invoke_2;
      v14[3] = &unk_1E5445E58;
      objc_copyWeak(&v18, &location);
      v16 = v10;
      v17 = v12;
      v15 = v11;
      dispatch_async(internalQueue, v14);

      objc_destroyWeak(&v18);
    }

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

}

uint64_t __73__WBSSiteMetadataImageCache__requestImageForKeyString_completionHandler___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  uint64_t v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[5], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 || objc_msgSend(v3[6], "containsObject:", *(_QWORD *)(a1 + 32)))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v5 = 0;
    }
    else
    {
      v5 = 1;
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v5 = 0;
  }

  return v5;
}

- (id)imageForKeyString:(id)a3 getImageState:(int64_t *)a4
{
  os_unfair_lock_s *p_cacheAccessLock;
  id v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  p_cacheAccessLock = &self->_cacheAccessLock;
  v7 = a3;
  os_unfair_lock_lock(p_cacheAccessLock);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__20;
  v19 = __Block_byref_object_dispose__20;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__WBSSiteMetadataImageCache_imageForKeyString_getImageState___block_invoke;
  v10[3] = &unk_1E5445E08;
  v10[4] = &v15;
  v10[5] = &v11;
  -[WBSSiteMetadataImageCache _requestImageForKeyString:completionHandler:](self, "_requestImageForKeyString:completionHandler:", v7, v10);

  os_unfair_lock_unlock(p_cacheAccessLock);
  if (a4)
    *a4 = v12[3];
  v8 = (id)v16[5];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v8;
}

- (void)_didLoadImage:(id)a3 forKeyString:(id)a4 fromDisk:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id WeakRetained;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v5 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  os_unfair_lock_lock(&self->_cacheAccessLock);
  v10 = -[WBSSiteMetadataImageCache _internalDidLoadImageAndShouldNotify:forKeyString:fromDisk:](self, "_internalDidLoadImageAndShouldNotify:forKeyString:fromDisk:", v8, v9, v5);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_keyStringRequestsToCompletionHandlers, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keyStringRequestsToCompletionHandlers, "setObject:forKeyedSubscript:", 0, v9);
  os_unfair_lock_unlock(&self->_cacheAccessLock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0uLL;
  v18 = 0uLL;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v12);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "siteMetadataImageCache:didFinishLoadingImage:forKeyString:", self, v8, v9, (_QWORD)v17);

}

void __61__WBSSiteMetadataImageCache_imageForKeyString_getImageState___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v6 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;

}

- (BOOL)_internalDidLoadImageAndShouldNotify:(id)a3 forKeyString:(id)a4 fromDisk:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  int64_t v10;
  int64_t v11;
  BOOL v12;
  uint64_t v13;
  BOOL v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = -[WBSSiteMetadataImageCache _internalImageStateForKeyString:](self, "_internalImageStateForKeyString:", v9);
  v11 = v10;
  if (v5 && v10 == 2)
  {
    v12 = 0;
  }
  else
  {
    if (v8)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_imagesForKeyStrings, "setObject:forKeyedSubscript:", v8, v9);
      v13 = 2;
    }
    else
    {
      v13 = 1;
    }
    -[WBSSiteMetadataImageCache _internalSetImageState:forKeyString:](self, "_internalSetImageState:forKeyString:", v13, v9);
    if (v8)
      v14 = 1;
    else
      v14 = v11 == 0;
    v12 = v14;
  }

  return v12;
}

- (void)_internalSetImageState:(int64_t)a3 forKeyString:(id)a4
{
  void *v6;
  int64_t v7;
  id v8;

  v8 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_imagesForKeyStrings, "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 2;
  if (!v6)
    v7 = a3;
  if (v7 == 1)
  {
    -[NSMutableSet addObject:](self->_missingImageKeyStrings, "addObject:", v8);
  }
  else if (v7 == 2)
  {
    -[NSMutableSet removeObject:](self->_missingImageKeyStrings, "removeObject:", v8);
  }

}

- (int64_t)_internalImageStateForKeyString:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_imagesForKeyStrings, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = 2;
  else
    v6 = -[NSMutableSet containsObject:](self->_missingImageKeyStrings, "containsObject:", v4);

  return v6;
}

uint64_t __44__WBSSiteMetadataImageCache_setUpImageCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalSetUpImageCache");
}

- (id).cxx_construct
{
  *((_BYTE *)self + 28) = 0;
  return self;
}

uint64_t __73__WBSSiteMetadataImageCache__requestImageForKeyString_completionHandler___block_invoke_4(uint64_t result)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)(*(_QWORD *)(result + 32) + 28));
  if ((v1 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "_didLoadImage:forKeyString:fromDisk:", *(_QWORD *)(result + 40), *(_QWORD *)(result + 48), 1);
  return result;
}

- (void)_notifyDidFinishLoadingSettings
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "siteMetadataImageCacheDidFinishLoadingSettings:", self);

}

uint64_t __53__WBSSiteMetadataImageCache__internalSetUpImageCache__block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDidFinishLoadingSettings");
}

uint64_t __44__WBSSiteMetadataImageCache_removeAllImages__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalRemoveAllImages");
}

- (void)setUpImageCache
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__WBSSiteMetadataImageCache_setUpImageCache__block_invoke;
  block[3] = &unk_1E54425B0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (WBSSiteMetadataImageCache)initWithImageDirectoryURL:(id)a3 imageType:(int64_t)a4 fileProtectionOptions:(unint64_t)a5
{
  id v9;
  WBSSiteMetadataImageCache *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *internalQueue;
  NSMutableDictionary *v16;
  NSMutableDictionary *imagesForKeyStrings;
  NSMutableSet *v18;
  NSMutableSet *missingImageKeyStrings;
  WBSCacheRetainReleasePolicy *v20;
  uint64_t v21;
  WBSCacheRetainReleasePolicy *cachePolicy;
  WBSSiteMetadataImageCache *v23;
  _QWORD v25[4];
  id v26;
  id location;
  objc_super v28;

  v9 = a3;
  v28.receiver = self;
  v28.super_class = (Class)WBSSiteMetadataImageCache;
  v10 = -[WBSSiteMetadataImageCache init](&v28, sel_init);
  if (v10)
  {
    objc_initWeak(&location, v10);
    -[WBSSiteMetadataImageCache _internalQueueName](v10, "_internalQueueName");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create(v12, v13);
    internalQueue = v10->_internalQueue;
    v10->_internalQueue = (OS_dispatch_queue *)v14;

    v10->_cacheAccessLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v10->_imageDirectoryURL, a3);
    v10->_imageType = a4;
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    imagesForKeyStrings = v10->_imagesForKeyStrings;
    v10->_imagesForKeyStrings = v16;

    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    missingImageKeyStrings = v10->_missingImageKeyStrings;
    v10->_missingImageKeyStrings = v18;

    v10->_fileProtectionOptions = a5;
    v20 = [WBSCacheRetainReleasePolicy alloc];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __87__WBSSiteMetadataImageCache_initWithImageDirectoryURL_imageType_fileProtectionOptions___block_invoke;
    v25[3] = &unk_1E5445D58;
    objc_copyWeak(&v26, &location);
    v21 = -[WBSCacheRetainReleasePolicy initWithPurgeBlock:](v20, "initWithPurgeBlock:", v25);
    cachePolicy = v10->_cachePolicy;
    v10->_cachePolicy = (WBSCacheRetainReleasePolicy *)v21;

    v23 = v10;
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (id)_internalQueueName
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.Safari.%@.%p.internalQueue"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

void __73__WBSSiteMetadataImageCache__requestImageForKeyString_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_fileLocationForKeyString:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CEA638]);
    objc_msgSend(v2, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithContentsOfFile:", v4);

  }
  else
  {
    v5 = 0;
  }

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__WBSSiteMetadataImageCache__requestImageForKeyString_completionHandler___block_invoke_4;
  block[3] = &unk_1E5441410;
  block[4] = v6;
  v11 = v5;
  v12 = v7;
  v9 = v5;
  dispatch_async(v8, block);

}

- (void)_internalSetUpImageCache
{
  NSMutableDictionary *v3;
  NSMutableDictionary *keyStringRequestsToCompletionHandlers;
  NSObject *v5;
  id v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *diskAccessQueue;
  NSHashTable *v9;
  NSHashTable *diskReadBlocks;
  id v11;
  void *v12;
  OS_dispatch_queue *internalQueue;
  uint64_t v14;
  WBSCoalescedAsynchronousWriter *v15;
  WBSCoalescedAsynchronousWriter *cacheSettingsWriter;
  NSMutableDictionary *v17;
  NSMutableDictionary *cacheSettings;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  id location;

  if (self->_imageDirectoryURL)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    keyStringRequestsToCompletionHandlers = self->_keyStringRequestsToCompletionHandlers;
    self->_keyStringRequestsToCompletionHandlers = v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    -[WBSSiteMetadataImageCache _diskAccessQueueName](self, "_diskAccessQueueName");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), v5);
    diskAccessQueue = self->_diskAccessQueue;
    self->_diskAccessQueue = v7;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    diskReadBlocks = self->_diskReadBlocks;
    self->_diskReadBlocks = v9;

    objc_initWeak(&location, self);
    v11 = objc_alloc(MEMORY[0x1E0D8A0D8]);
    -[WBSSiteMetadataImageCache _cacheSettingsFileURL](self, "_cacheSettingsFileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    internalQueue = self->_internalQueue;
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __53__WBSSiteMetadataImageCache__internalSetUpImageCache__block_invoke;
    v20[3] = &unk_1E5444AB8;
    objc_copyWeak(&v21, &location);
    v15 = (WBSCoalescedAsynchronousWriter *)objc_msgSend(v11, "initWithName:fileURL:dataSourceQueue:dataSourceBlock:", CFSTR("SiteMetadataImageCacheSetting"), v12, internalQueue, v20);
    cacheSettingsWriter = self->_cacheSettingsWriter;
    self->_cacheSettingsWriter = v15;

    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __53__WBSSiteMetadataImageCache__internalSetUpImageCache__block_invoke_18;
    v19[3] = &unk_1E54425B0;
    v19[4] = self;
    -[WBSSiteMetadataImageCache _dispatchDiskReadBlock:](self, "_dispatchDiskReadBlock:", v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  else
  {
    os_unfair_lock_lock(&self->_cacheAccessLock);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    cacheSettings = self->_cacheSettings;
    self->_cacheSettings = v17;

    os_unfair_lock_unlock(&self->_cacheAccessLock);
    -[WBSSiteMetadataImageCache _notifyDidFinishLoadingSettings](self, "_notifyDidFinishLoadingSettings");
  }
}

- (id)_cacheSettingsFileURL
{
  return -[NSURL URLByAppendingPathComponent:isDirectory:](self->_imageDirectoryURL, "URLByAppendingPathComponent:isDirectory:", CFSTR("CacheSettings.plist"), 0);
}

- (id)_fileLocationForKeyString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (self->_imageDirectoryURL)
  {
    -[WBSSiteMetadataImageCache _fileNameForKeyString:](self, "_fileNameForKeyString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NSURL URLByAppendingPathComponent:isDirectory:](self->_imageDirectoryURL, "URLByAppendingPathComponent:isDirectory:", v5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_fileNameForKeyString:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_8:
    objc_msgSend(v4, "safari_md5Hash");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v8 = 1;
    goto LABEL_9;
  }
  objc_msgSend(WeakRetained, "siteMetadataImageCache:customFileNameForKeyString:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v10 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 141558275;
      v15 = 1752392040;
      v16 = 2117;
      v17 = v4;
      _os_log_impl(&dword_1A840B000, v10, OS_LOG_TYPE_DEFAULT, "File for icon not saved in TouchIconCacheSettings.db; keyString=%{sensitive, mask.hash}@",
        (uint8_t *)&v14,
        0x16u);
    }
    goto LABEL_8;
  }
  v7 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 141558787;
    v15 = 1752392040;
    v16 = 2117;
    v17 = v4;
    v18 = 2160;
    v19 = 1752392040;
    v20 = 2117;
    v21 = v6;
    _os_log_impl(&dword_1A840B000, v7, OS_LOG_TYPE_DEFAULT, "File for icon saved in TouchIconCacheSettings.db; keyString=%{sensitive, mask.hash}@; fileName=%{sensitive, mask.hash}@",
      (uint8_t *)&v14,
      0x2Au);
  }
  v8 = 0;
  v9 = v6;
LABEL_9:
  if (self->_imageType)
    v11 = CFSTR("jpeg");
  else
    v11 = CFSTR("png");
  objc_msgSend(v9, "stringByAppendingPathExtension:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)

  return v12;
}

- (id)_diskAccessQueueName
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.Safari.%@.%p.diskAccessQueue"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __54__WBSSiteMetadataImageCache__removeImagesPassingTest___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", *(_QWORD *)(a1[4] + 96), 0, 7, 0);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v7, "pathExtension", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isEqualToString:", a1[5]) & 1) != 0
          || (objc_msgSend(v8, "isEqualToString:", a1[6]) & 1) != 0)
        {
          if ((*(unsigned int (**)(void))(a1[7] + 16))())
            objc_msgSend(v2, "safari_removeFileAtURL:error:", v7, 0);
        }

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)removeAllImages
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__WBSSiteMetadataImageCache_removeAllImages__block_invoke;
  block[3] = &unk_1E54425B0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (WBSSiteMetadataImageCache)initWithImageDirectoryURL:(id)a3 imageType:(int64_t)a4
{
  return -[WBSSiteMetadataImageCache initWithImageDirectoryURL:imageType:fileProtectionOptions:](self, "initWithImageDirectoryURL:imageType:fileProtectionOptions:", a3, a4, 0);
}

- (void)_internalRemoveAllImages
{
  os_unfair_lock_s *p_cacheAccessLock;
  NSMutableSet *missingImageKeyStrings;
  void *v5;

  p_cacheAccessLock = &self->_cacheAccessLock;
  os_unfair_lock_lock(&self->_cacheAccessLock);
  missingImageKeyStrings = self->_missingImageKeyStrings;
  -[NSMutableDictionary allKeys](self->_imagesForKeyStrings, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObjectsFromArray:](missingImageKeyStrings, "addObjectsFromArray:", v5);

  -[NSMutableDictionary removeAllObjects](self->_imagesForKeyStrings, "removeAllObjects");
  os_unfair_lock_unlock(p_cacheAccessLock);
  -[WBSSiteMetadataImageCache _removeImagesPassingTest:](self, "_removeImagesPassingTest:", &__block_literal_global_35);
}

- (void)_removeImagesPassingTest:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  __CFString *v7;
  __CFString *v8;
  id v9;

  v4 = a3;
  v5 = v4;
  if (self->_imageDirectoryURL)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__WBSSiteMetadataImageCache__removeImagesPassingTest___block_invoke;
    v6[3] = &unk_1E5441B28;
    v6[4] = self;
    v7 = CFSTR("png");
    v8 = CFSTR("jpeg");
    v9 = v4;
    -[WBSSiteMetadataImageCache _dispatchDiskWriteBlock:](self, "_dispatchDiskWriteBlock:", v6);

  }
}

- (WBSSiteMetadataImageCache)init
{
  return -[WBSSiteMetadataImageCache initWithImageDirectoryURL:imageType:](self, "initWithImageDirectoryURL:imageType:", 0, 0);
}

void __87__WBSSiteMetadataImageCache_initWithImageDirectoryURL_imageType_fileProtectionOptions___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_internalReleaseImageForKeyString:", v3);

}

- (BOOL)isTerminating
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_terminating);
  return v2 & 1;
}

id __53__WBSSiteMetadataImageCache__internalSetUpImageCache__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v8;
  uint8_t buf[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 6);
  v2 = (void *)objc_msgSend(*((id *)WeakRetained + 9), "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 6);
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v2, 200, 0, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (!v3)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "safari_privacyPreservingDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      __27__WBSOnDiskDataCache_setUp__block_invoke_2_cold_1((uint64_t)v2, v6, buf, v5);
    }

  }
  return v3;
}

void __53__WBSSiteMetadataImageCache__internalSetUpImageCache__block_invoke_18(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v2 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(*(id *)(a1 + 32), "_cacheSettingsFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithContentsOfURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

  }
  else
  {
    v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__WBSSiteMetadataImageCache__internalSetUpImageCache__block_invoke_2;
  v11[3] = &unk_1E54413C0;
  v11[4] = v8;
  v12 = v6;
  v10 = v6;
  dispatch_async(v9, v11);

}

- (void)purgeUnneededImages
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WBSSiteMetadataImageCache_purgeUnneededImages__block_invoke;
  block[3] = &unk_1E54425B0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __48__WBSSiteMetadataImageCache_purgeUnneededImages__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalPurgeUnneededImages");
}

- (void)_internalPurgeUnneededImages
{
  os_unfair_lock_s *p_cacheAccessLock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *imagesForKeyStrings;
  void *v9;
  NSMutableSet *missingImageKeyStrings;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  p_cacheAccessLock = &self->_cacheAccessLock;
  os_unfair_lock_lock(&self->_cacheAccessLock);
  v4 = (void *)MEMORY[0x1E0C99E20];
  -[NSMutableDictionary allKeys](self->_imagesForKeyStrings, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSCacheRetainReleasePolicy retainedKeyStrings](self->_cachePolicy, "retainedKeyStrings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minusSet:", v7);

  imagesForKeyStrings = self->_imagesForKeyStrings;
  objc_msgSend(v6, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](imagesForKeyStrings, "removeObjectsForKeys:", v9);

  missingImageKeyStrings = self->_missingImageKeyStrings;
  objc_msgSend(v6, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObjectsFromArray:](missingImageKeyStrings, "addObjectsFromArray:", v11);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[WBSCacheRetainReleasePolicy retainedKeyStrings](self->_cachePolicy, "retainedKeyStrings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[WBSSiteMetadataImageCache _fileNameForKeyString:](self, "_fileNameForKeyString:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

        -[NSMutableSet removeObject:](self->_missingImageKeyStrings, "removeObject:", v17);
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

  os_unfair_lock_unlock(p_cacheAccessLock);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __57__WBSSiteMetadataImageCache__internalPurgeUnneededImages__block_invoke;
  v20[3] = &unk_1E5445D80;
  v19 = v12;
  v21 = v19;
  -[WBSSiteMetadataImageCache _removeImagesPassingTest:](self, "_removeImagesPassingTest:", v20);

}

uint64_t __57__WBSSiteMetadataImageCache__internalPurgeUnneededImages__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

- (void)savePendingChangesBeforeTermination
{
  NSObject *internalQueue;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD block[5];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__WBSSiteMetadataImageCache_savePendingChangesBeforeTermination__block_invoke;
  block[3] = &unk_1E54425B0;
  block[4] = self;
  dispatch_sync(internalQueue, block);
  if (self->_imageDirectoryURL)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = self->_diskReadBlocks;
    v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
          if (v8)
            dispatch_block_cancel(v8);
          ++v7;
        }
        while (v5 != v7);
        v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
      }
      while (v5);
    }

    dispatch_sync((dispatch_queue_t)self->_diskAccessQueue, &__block_literal_global_37);
  }
}

uint64_t __64__WBSSiteMetadataImageCache_savePendingChangesBeforeTermination__block_invoke(uint64_t result)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)(*(_QWORD *)(result + 32) + 28));
  if ((v1 & 1) == 0)
  {
    atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(result + 32) + 28));
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 80), "completePendingWriteSynchronously");
  }
  return result;
}

- (void)emptyCache
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__WBSSiteMetadataImageCache_emptyCache__block_invoke;
  block[3] = &unk_1E54425B0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __39__WBSSiteMetadataImageCache_emptyCache__block_invoke(uint64_t a1)
{
  id WeakRetained;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_22);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 32), "_emptyCacheDirectory");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "siteMetadataImageCacheDidEmptyCache:", *(_QWORD *)(a1 + 32));

}

void __39__WBSSiteMetadataImageCache_emptyCache__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_emptyCacheDirectory
{
  _QWORD v2[5];

  if (self->_imageDirectoryURL)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __49__WBSSiteMetadataImageCache__emptyCacheDirectory__block_invoke;
    v2[3] = &unk_1E54425B0;
    v2[4] = self;
    -[WBSSiteMetadataImageCache _dispatchDiskWriteBlock:](self, "_dispatchDiskWriteBlock:", v2);
  }
}

void __49__WBSSiteMetadataImageCache__emptyCacheDirectory__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12[5];

  v12[4] = *(id *)MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
  v12[0] = 0;
  v4 = objc_msgSend(v2, "removeItemAtURL:error:", v3, v12);
  v5 = v12[0];
  v6 = v5;
  if ((v4 & 1) == 0)
  {
    v10 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __49__WBSSiteMetadataImageCache__emptyCacheDirectory__block_invoke_cold_2();
    }
    goto LABEL_9;
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
  v11 = v5;
  v8 = objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v11);
  v9 = v11;

  if ((v8 & 1) == 0)
  {
    v10 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __49__WBSSiteMetadataImageCache__emptyCacheDirectory__block_invoke_cold_1();
    }
    v6 = v9;
LABEL_9:

    goto LABEL_10;
  }
  v6 = v9;
LABEL_10:

}

- (void)_dispatchDiskWriteBlock:(id)a3
{
  id v4;
  unsigned __int8 v5;
  uint64_t v6;
  NSObject *diskAccessQueue;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v4 = a3;
  if (self->_imageDirectoryURL)
  {
    v5 = atomic_load((unsigned __int8 *)&self->_terminating);
    if ((v5 & 1) == 0)
    {
      v6 = operator new();
      MEMORY[0x1A85D4170](v6, CFSTR("com.apple.SafariShared.WBSSiteMetadataImageCache"));
      diskAccessQueue = self->_diskAccessQueue;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __53__WBSSiteMetadataImageCache__dispatchDiskWriteBlock___block_invoke;
      v8[3] = &unk_1E5444B98;
      v10 = v6;
      v9 = v4;
      dispatch_async(diskAccessQueue, v8);

    }
  }

}

uint64_t __53__WBSSiteMetadataImageCache__dispatchDiskWriteBlock___block_invoke(uint64_t a1)
{
  id *v1;
  uint64_t result;

  v1 = *(id **)(a1 + 40);
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v1)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v1);
    JUMPOUT(0x1A85D41B8);
  }
  return result;
}

- (void)_dispatchDiskReadBlock:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  dispatch_block_t v7;
  NSHashTable *diskReadBlocks;
  void *v9;
  _QWORD block[4];
  id v11;

  v4 = a3;
  v5 = v4;
  if (self->_imageDirectoryURL)
  {
    v6 = atomic_load((unsigned __int8 *)&self->_terminating);
    if ((v6 & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__WBSSiteMetadataImageCache__dispatchDiskReadBlock___block_invoke;
      block[3] = &unk_1E5442848;
      v11 = v4;
      v7 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
      diskReadBlocks = self->_diskReadBlocks;
      v9 = (void *)MEMORY[0x1A85D45E4]();
      -[NSHashTable addObject:](diskReadBlocks, "addObject:", v9);

      dispatch_async((dispatch_queue_t)self->_diskAccessQueue, v7);
    }
  }

}

uint64_t __52__WBSSiteMetadataImageCache__dispatchDiskReadBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getImageForKeyString:(id)a3 completionHandler:(id)a4
{
  os_unfair_lock_s *p_cacheAccessLock;
  id v7;
  id v8;

  p_cacheAccessLock = &self->_cacheAccessLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_cacheAccessLock);
  -[WBSSiteMetadataImageCache _requestImageForKeyString:completionHandler:](self, "_requestImageForKeyString:completionHandler:", v8, v7);

  os_unfair_lock_unlock(p_cacheAccessLock);
}

- (void)saveImageToDisk:(id)a3 forKeyString:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "length"))
  {
    internalQueue = self->_internalQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__WBSSiteMetadataImageCache_saveImageToDisk_forKeyString_completionHandler___block_invoke;
    v12[3] = &unk_1E5441B28;
    v12[4] = self;
    v13 = v8;
    v14 = v9;
    v15 = v10;
    dispatch_async(internalQueue, v12);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

uint64_t __76__WBSSiteMetadataImageCache_saveImageToDisk_forKeyString_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalSaveImageToDisk:forKeyString:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_internalSaveImageToDisk:(id)a3 forKeyString:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  unsigned __int8 v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = atomic_load((unsigned __int8 *)&self->_terminating);
  if ((v11 & 1) == 0)
  {
    if (v8)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __85__WBSSiteMetadataImageCache__internalSaveImageToDisk_forKeyString_completionHandler___block_invoke;
      v12[3] = &unk_1E5444B50;
      v12[4] = self;
      v13 = v9;
      v15 = v10;
      v14 = v8;
      -[WBSSiteMetadataImageCache _dispatchDiskWriteBlock:](self, "_dispatchDiskWriteBlock:", v12);

      goto LABEL_7;
    }
    -[WBSSiteMetadataImageCache _didLoadImage:forKeyString:fromDisk:](self, "_didLoadImage:forKeyString:fromDisk:", 0, v9, 0);
  }
  if (v10)
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
LABEL_7:

}

void __85__WBSSiteMetadataImageCache__internalSaveImageToDisk_forKeyString_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  char v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_fileLocationForKeyString:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "URLByDeletingLastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v5 = objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v27);
    v6 = v27;

    if ((v5 & 1) == 0)
    {
      v10 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __49__WBSSiteMetadataImageCache__emptyCacheDirectory__block_invoke_cold_1();
      }

      v11 = *(_QWORD *)(a1 + 56);
      if (v11)
        (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);
      goto LABEL_22;
    }
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
    if (v7 == 1)
    {
      UIImageJPEGRepresentation(*(UIImage **)(a1 + 48), 1.0);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v7)
      {
        v12 = 0;
        goto LABEL_15;
      }
      UIImagePNGRepresentation(*(UIImage **)(a1 + 48));
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v8;
LABEL_15:
    v13 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v20 = *(_QWORD *)(a1 + 48);
      v21 = objc_msgSend(v12, "length");
      *(_DWORD *)buf = 138412802;
      v29 = v20;
      v30 = 2048;
      v31 = v21;
      v32 = 2112;
      v33 = v2;
      _os_log_debug_impl(&dword_1A840B000, v13, OS_LOG_TYPE_DEBUG, "Saving image %@ <image data length = %zu> to location %@", buf, 0x20u);
    }

    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) | 1;
    v26 = 0;
    v15 = objc_msgSend(v12, "writeToURL:options:error:", v2, v14, &v26);
    v16 = v26;
    if ((v15 & 1) == 0)
    {
      v17 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v16, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __85__WBSSiteMetadataImageCache__internalSaveImageToDisk_forKeyString_completionHandler___block_invoke_cold_1();
      }

    }
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(NSObject **)(v18 + 16);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __85__WBSSiteMetadataImageCache__internalSaveImageToDisk_forKeyString_completionHandler___block_invoke_34;
    v22[3] = &unk_1E5441B28;
    v22[4] = v18;
    v23 = *(id *)(a1 + 48);
    v24 = *(id *)(a1 + 40);
    v25 = *(id *)(a1 + 56);
    dispatch_async(v19, v22);

LABEL_22:
    goto LABEL_23;
  }
  v9 = *(_QWORD *)(a1 + 56);
  if (v9)
    (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
LABEL_23:

}

uint64_t __85__WBSSiteMetadataImageCache__internalSaveImageToDisk_forKeyString_completionHandler___block_invoke_34(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_didLoadImage:forKeyString:fromDisk:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)setImage:(id)a3 forKeyString:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__WBSSiteMetadataImageCache_setImage_forKeyString___block_invoke;
    block[3] = &unk_1E5441410;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(internalQueue, block);

  }
}

uint64_t __51__WBSSiteMetadataImageCache_setImage_forKeyString___block_invoke(uint64_t result)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)(*(_QWORD *)(result + 32) + 28));
  if ((v1 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "_didLoadImage:forKeyString:fromDisk:", *(_QWORD *)(result + 40), *(_QWORD *)(result + 48), 0);
  return result;
}

uint64_t __53__WBSSiteMetadataImageCache__internalRemoveAllImages__block_invoke()
{
  return 1;
}

- (int64_t)imageStateForKeyString:(id)a3
{
  id v4;
  os_unfair_lock_s *p_cacheAccessLock;
  int64_t v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    p_cacheAccessLock = &self->_cacheAccessLock;
    os_unfair_lock_lock(&self->_cacheAccessLock);
    v6 = -[WBSSiteMetadataImageCache _internalImageStateForKeyString:](self, "_internalImageStateForKeyString:", v4);
    os_unfair_lock_unlock(p_cacheAccessLock);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setImageState:(int64_t)a3 forKeyString:(id)a4
{
  id v6;
  NSObject *internalQueue;
  _QWORD block[5];
  id v9;
  int64_t v10;

  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__WBSSiteMetadataImageCache_setImageState_forKeyString___block_invoke;
    block[3] = &unk_1E5445EC0;
    block[4] = self;
    v10 = a3;
    v9 = v6;
    dispatch_async(internalQueue, block);

  }
}

void __56__WBSSiteMetadataImageCache_setImageState_forKeyString___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 32), "_internalSetImageState:forKeyString:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)retainImageWithKeyStringProvider:(id)a3
{
  os_unfair_lock_s *p_cacheAccessLock;
  id v5;

  p_cacheAccessLock = &self->_cacheAccessLock;
  v5 = a3;
  os_unfair_lock_lock(p_cacheAccessLock);
  -[WBSCacheRetainReleasePolicy retainEntryWithKeyStringProvider:](self->_cachePolicy, "retainEntryWithKeyStringProvider:", v5);

  os_unfair_lock_unlock(p_cacheAccessLock);
}

- (void)retainImageForKeyString:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    os_unfair_lock_lock(&self->_cacheAccessLock);
    -[WBSCacheRetainReleasePolicy retainEntryForKeyString:](self->_cachePolicy, "retainEntryForKeyString:", v4);
    os_unfair_lock_unlock(&self->_cacheAccessLock);
  }

}

- (void)retainImagesForKeyStrings:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    os_unfair_lock_lock(&self->_cacheAccessLock);
    -[WBSCacheRetainReleasePolicy retainEntriesForKeyStrings:](self->_cachePolicy, "retainEntriesForKeyStrings:", v4);
    os_unfair_lock_unlock(&self->_cacheAccessLock);
  }

}

- (void)_internalReleaseImageForKeyString:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__WBSSiteMetadataImageCache__internalReleaseImageForKeyString___block_invoke;
  v6[3] = &unk_1E54413C0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __63__WBSSiteMetadataImageCache__internalReleaseImageForKeyString___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__WBSSiteMetadataImageCache__internalReleaseImageForKeyString___block_invoke_2;
  v4[3] = &unk_1E54413C0;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __63__WBSSiteMetadataImageCache__internalReleaseImageForKeyString___block_invoke_2(uint64_t a1)
{
  int v2;
  os_unfair_lock_s *v3;
  void *v4;
  id WeakRetained;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "isEntryRetainedForKeyString:", *(_QWORD *)(a1 + 40));
  v3 = *(os_unfair_lock_s **)(a1 + 32);
  if (v2)
  {
    os_unfair_lock_unlock(v3 + 6);
  }
  else
  {
    v6[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[os_unfair_lock_s _internalRemoveImagesFromCacheForKeyStrings:](v3, "_internalRemoveImagesFromCacheForKeyStrings:", v4);

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "siteMetadataImageCache:didRemoveImageFromCacheForKeyString:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)releaseImageWithKeyStringProvider:(id)a3
{
  os_unfair_lock_s *p_cacheAccessLock;
  id v5;

  p_cacheAccessLock = &self->_cacheAccessLock;
  v5 = a3;
  os_unfair_lock_lock(p_cacheAccessLock);
  -[WBSCacheRetainReleasePolicy releaseEntryWithKeyStringProvider:](self->_cachePolicy, "releaseEntryWithKeyStringProvider:", v5);

  os_unfair_lock_unlock(p_cacheAccessLock);
}

- (void)releaseImageForKeyString:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    os_unfair_lock_lock(&self->_cacheAccessLock);
    -[WBSCacheRetainReleasePolicy releaseEntryForKeyString:](self->_cachePolicy, "releaseEntryForKeyString:", v4);
    os_unfair_lock_unlock(&self->_cacheAccessLock);
  }

}

- (void)releaseImagesForKeyStrings:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    os_unfair_lock_lock(&self->_cacheAccessLock);
    -[WBSCacheRetainReleasePolicy releaseEntriesForKeyStrings:](self->_cachePolicy, "releaseEntriesForKeyStrings:", v4);
    os_unfair_lock_unlock(&self->_cacheAccessLock);
  }

}

- (BOOL)isImageRetainedForKeyString:(id)a3
{
  id v4;
  os_unfair_lock_s *p_cacheAccessLock;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    p_cacheAccessLock = &self->_cacheAccessLock;
    os_unfair_lock_lock(&self->_cacheAccessLock);
    v6 = -[WBSCacheRetainReleasePolicy isEntryRetainedForKeyString:](self->_cachePolicy, "isEntryRetainedForKeyString:", v4);
    os_unfair_lock_unlock(p_cacheAccessLock);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)removeImagesFromCacheForKeyStrings:(id)a3
{
  void *v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__WBSSiteMetadataImageCache_removeImagesFromCacheForKeyStrings___block_invoke;
  v7[3] = &unk_1E54413C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __64__WBSSiteMetadataImageCache_removeImagesFromCacheForKeyStrings___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 32), "_internalRemoveImagesFromCacheForKeyStrings:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)_internalRemoveImagesFromCacheForKeyStrings:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  WBSSiteMetadataImageCache *v8;

  v4 = a3;
  -[NSMutableDictionary removeObjectsForKeys:](self->_imagesForKeyStrings, "removeObjectsForKeys:", v4);
  -[NSMutableSet addObjectsFromArray:](self->_missingImageKeyStrings, "addObjectsFromArray:", v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__WBSSiteMetadataImageCache__internalRemoveImagesFromCacheForKeyStrings___block_invoke;
  v6[3] = &unk_1E54413C0;
  v5 = v4;
  v7 = v5;
  v8 = self;
  -[WBSSiteMetadataImageCache _dispatchDiskWriteBlock:](self, "_dispatchDiskWriteBlock:", v6);

}

void __73__WBSSiteMetadataImageCache__internalRemoveImagesFromCacheForKeyStrings___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v5);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "_fileLocationForKeyString:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "safari_removeFileAtURL:error:", v8, 0);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }

}

- (id)settingForKey:(id)a3
{
  id v4;
  os_unfair_lock_s *p_cacheAccessLock;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    p_cacheAccessLock = &self->_cacheAccessLock;
    os_unfair_lock_lock(&self->_cacheAccessLock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_cacheSettings, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_cacheAccessLock);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setSetting:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__WBSSiteMetadataImageCache_setSetting_forKey___block_invoke;
    block[3] = &unk_1E5441410;
    block[4] = self;
    v10 = v7;
    v11 = v6;
    dispatch_async(internalQueue, block);

  }
}

void __47__WBSSiteMetadataImageCache_setSetting_forKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  unsigned __int8 v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 24));
  objc_msgSend(*(id *)(a1[4] + 72), "setObject:forKeyedSubscript:", a1[6], a1[5]);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 24));
  v2 = a1[4];
  if (*(_QWORD *)(v2 + 96))
  {
    v3 = atomic_load((unsigned __int8 *)(v2 + 28));
    if ((v3 & 1) == 0)
      objc_msgSend(*(id *)(a1[4] + 80), "scheduleWrite");
  }
}

- (NSURL)imageDirectoryURL
{
  return self->_imageDirectoryURL;
}

- (int64_t)imageType
{
  return self->_imageType;
}

- (WBSSiteMetadataImageCacheDelegate)delegate
{
  return (WBSSiteMetadataImageCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageDirectoryURL, 0);
  objc_storeStrong((id *)&self->_cacheSettingsWriter, 0);
  objc_storeStrong((id *)&self->_cacheSettings, 0);
  objc_storeStrong((id *)&self->_cachePolicy, 0);
  objc_storeStrong((id *)&self->_keyStringRequestsToCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_missingImageKeyStrings, 0);
  objc_storeStrong((id *)&self->_imagesForKeyStrings, 0);
  objc_storeStrong((id *)&self->_diskReadBlocks, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_diskAccessQueue, 0);
}

void __49__WBSSiteMetadataImageCache__emptyCacheDirectory__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A840B000, v3, v4, "Error \"%{public}@\" trying to create image cache folder.", v5);

  OUTLINED_FUNCTION_1_0();
}

void __49__WBSSiteMetadataImageCache__emptyCacheDirectory__block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A840B000, v3, v4, "Error \"%{public}@\" trying to delete image cache folder.", v5);

  OUTLINED_FUNCTION_1_0();
}

void __85__WBSSiteMetadataImageCache__internalSaveImageToDisk_forKeyString_completionHandler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A840B000, v3, v4, "Saving image failed with error: %{public}@", v5);

  OUTLINED_FUNCTION_1_0();
}

@end
