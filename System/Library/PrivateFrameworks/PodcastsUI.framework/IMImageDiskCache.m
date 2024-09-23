@implementation IMImageDiskCache

- (id)imageUrlForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;

  if (a3)
  {
    v4 = a3;
    -[IMImageDiskCache pathForKey:](self, "pathForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[IMImageDiskCache _isProcessingKey:completion:](self, "_isProcessingKey:completion:", v4, 0);

    v9 = 0;
    if (!v8)
    {
      if (objc_msgSend(v7, "fileExistsAtPath:", v5))
        v9 = v6;
      else
        v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)pathForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  -[IMImageDiskCache _onDiskFileExtension](self, "_onDiskFileExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathExtension:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9.receiver = self;
  v9.super_class = (Class)IMImageDiskCache;
  -[IMBaseDiskCache pathForKey:](&v9, sel_pathForKey_, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_onDiskFileExtension
{
  return (id)objc_msgSend(MEMORY[0x1E0D7F238], "fileExtension");
}

- (BOOL)_isProcessingKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__IMImageDiskCache__isProcessingKey_completion___block_invoke;
  v11[3] = &unk_1EA0C6000;
  v14 = &v15;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  -[IMImageDiskCache _performWithSyncLock:](self, "_performWithSyncLock:", v11);
  LOBYTE(self) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

- (void)_performWithSyncLock:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  -[NSRecursiveLock lock](self->_syncLock, "lock");
  v4[2]();
  -[NSRecursiveLock unlock](self->_syncLock, "unlock");

}

void __48__IMImageDiskCache__isProcessingKey_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "proccessingKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if (*(_QWORD *)(a1 + 48) && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandlers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v4 = _Block_copy(*(const void **)(a1 + 48));
      objc_msgSend(v5, "addObject:", v4);

    }
  }
}

- (NSMutableSet)proccessingKeys
{
  return self->_proccessingKeys;
}

- (IMImageDiskCache)initWithBasePath:(id)a3 maxImageDimensionInPixels:(double)a4
{
  IMImageDiskCache *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *workQueue;
  void *v12;
  uint64_t v13;
  NSString *onDiskFileType;
  NSRecursiveLock *v15;
  NSRecursiveLock *syncLock;
  uint64_t v17;
  NSMutableSet *proccessingKeys;
  uint64_t v19;
  NSMutableDictionary *completionHandlers;
  uint64_t v21;
  NSMutableDictionary *pendingPerformWhenAvailableOnDiskBlocks;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)IMImageDiskCache;
  v5 = -[IMBaseDiskCache initWithBasePath:](&v24, sel_initWithBasePath_, a3);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-worker"), v8);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = dispatch_queue_create((const char *)objc_msgSend(v9, "UTF8String"), 0);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v10;

    objc_msgSend(MEMORY[0x1E0D7F238], "fileType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = objc_claimAutoreleasedReturnValue();
    onDiskFileType = v5->_onDiskFileType;
    v5->_onDiskFileType = (NSString *)v13;

    v5->_saveCompressionQuality = 0.9;
    v5->_maxImageDimensionInPixels = a4;
    v15 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    syncLock = v5->_syncLock;
    v5->_syncLock = v15;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    proccessingKeys = v5->_proccessingKeys;
    v5->_proccessingKeys = (NSMutableSet *)v17;

    v19 = objc_opt_new();
    completionHandlers = v5->_completionHandlers;
    v5->_completionHandlers = (NSMutableDictionary *)v19;

    v21 = objc_opt_new();
    pendingPerformWhenAvailableOnDiskBlocks = v5->_pendingPerformWhenAvailableOnDiskBlocks;
    v5->_pendingPerformWhenAvailableOnDiskBlocks = (NSMutableDictionary *)v21;

  }
  return v5;
}

- (IMImageDiskCache)initWithBasePath:(id)a3
{
  return -[IMImageDiskCache initWithBasePath:maxImageDimensionInPixels:](self, "initWithBasePath:maxImageDimensionInPixels:", a3, 1.79769313e308);
}

- (void)_addImageWithSourceUrl:(id)a3 forKey:(id)a4 discardTransparency:(BOOL)a5 enforceSquare:(BOOL)a6 maxDimensionInPixels:(double)a7 completion:(id)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v14;
  void (**v15)(id, uint64_t);
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v10 = a6;
  v11 = a5;
  v19 = a3;
  v14 = a4;
  v15 = (void (**)(id, uint64_t))a8;
  v16 = objc_msgSend(v14, "length");
  if (v19 && v16)
  {
    if (-[IMBaseDiskCache hasItemForKey:](self, "hasItemForKey:", v14))
    {
      if (v15)
        v15[2](v15, 1);
    }
    else
    {
      -[IMImageDiskCache pathForKey:](self, "pathForKey:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v17, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMImageDiskCache copyImageFromSourceUrl:to:discardTransparency:enforceSquare:maxDimensionInPixels:completion:](self, "copyImageFromSourceUrl:to:discardTransparency:enforceSquare:maxDimensionInPixels:completion:", v19, v18, v11, v10, v15, a7);

    }
  }
  else if (v15)
  {
    v15[2](v15, 0);
  }

}

- (void)addImagesWithSourceUrl:(id)a3 forKeys:(id)a4 discardTransparency:(BOOL)a5 enforceSquare:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  double maxImageDimensionInPixels;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  _BOOL4 v28;
  id v29;
  _QWORD block[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  NSObject *v37;
  id location;
  _QWORD aBlock[4];
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  _BOOL4 v48;
  uint64_t v49;

  v28 = a6;
  v8 = a5;
  v49 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__IMImageDiskCache_addImagesWithSourceUrl_forKeys_discardTransparency_enforceSquare_completion___block_invoke;
  aBlock[3] = &unk_1EA0C5798;
  v29 = v12;
  v40 = v29;
  v13 = a4;
  v14 = _Block_copy(aBlock);
  objc_msgSend(v13, "objectsPassingTest:", &__block_literal_global_12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v42 = v11;
    v43 = 2112;
    v44 = v15;
    v45 = 1024;
    v46 = v8;
    v47 = 1024;
    v48 = v28;
    _os_log_impl(&dword_1DA478000, v16, OS_LOG_TYPE_DEFAULT, "[DiskCache] addImagesWithSourceUrl: got store-image request (fileUrl=%@, keys=%@, discardTransparency=%d, enforceSquare=%d)", buf, 0x22u);
  }

  v17 = (void *)objc_msgSend(v15, "mutableCopy");
  v18 = v17;
  if (v11 && objc_msgSend(v17, "count"))
  {
    objc_msgSend(v18, "anyObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObject:", v19);
    v20 = dispatch_group_create();
    dispatch_group_enter(v20);
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v42 = v11;
      v43 = 2112;
      v44 = v19;
      _os_log_impl(&dword_1DA478000, v21, OS_LOG_TYPE_DEFAULT, "[DiskCache] addImagesWithSourceUrl: adding first item via addImage: (fileUrl = %@, key=%@)", buf, 0x16u);
    }

    maxImageDimensionInPixels = self->_maxImageDimensionInPixels;
    v23 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __96__IMImageDiskCache_addImagesWithSourceUrl_forKeys_discardTransparency_enforceSquare_completion___block_invoke_13;
    v36[3] = &unk_1EA0C5E58;
    v24 = v20;
    v37 = v24;
    -[IMImageDiskCache addImageWithSourceUrl:forKey:discardTransparency:enforceSquare:maxDimensionInPixels:completion:](self, "addImageWithSourceUrl:forKey:discardTransparency:enforceSquare:maxDimensionInPixels:completion:", v11, v19, v8, v28, v36, maxImageDimensionInPixels);
    dispatch_get_global_queue(0, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = v23;
    block[1] = 3221225472;
    block[2] = __96__IMImageDiskCache_addImagesWithSourceUrl_forKeys_discardTransparency_enforceSquare_completion___block_invoke_2_14;
    block[3] = &unk_1EA0C5E80;
    objc_copyWeak(&v35, &location);
    v31 = v19;
    v32 = v18;
    v34 = v14;
    v33 = v11;
    v26 = v19;
    dispatch_group_notify(v24, v25, block);

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v42 = v11;
      v43 = 2112;
      v44 = v18;
      _os_log_impl(&dword_1DA478000, v27, OS_LOG_TYPE_ERROR, "[DiskCache] addImagesWithSourceUrl: invalid requests (fileUrl = %@, validKeys=%@), bailing.", buf, 0x16u);
    }

    (*((void (**)(void *, _QWORD))v14 + 2))(v14, 0);
  }

}

uint64_t __96__IMImageDiskCache_addImagesWithSourceUrl_forKeys_discardTransparency_enforceSquare_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

BOOL __96__IMImageDiskCache_addImagesWithSourceUrl_forKeys_discardTransparency_enforceSquare_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "length") != 0;
}

void __96__IMImageDiskCache_addImagesWithSourceUrl_forKeys_discardTransparency_enforceSquare_completion___block_invoke_13(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __96__IMImageDiskCache_addImagesWithSourceUrl_forKeys_discardTransparency_enforceSquare_completion___block_invoke_2_14(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  unint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void (*v23)(void);
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v1 = a1;
  v45 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "imageUrlForKey:", *(_QWORD *)(v1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (objc_msgSend(*(id *)(v1 + 40), "count"))
    {
      v4 = 0x1E0D7F000uLL;
      objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(void **)(v1 + 40);
        v6 = *(_QWORD *)(v1 + 48);
        *(_DWORD *)buf = 138412802;
        v37 = v6;
        v38 = 2112;
        v39 = v3;
        v40 = 2112;
        v41 = v7;
        _os_log_impl(&dword_1DA478000, v5, OS_LOG_TYPE_DEFAULT, "[DiskCache] addImagesWithSourceUrl: adding remaining items via NSFileManager copy: (fileUrl = %@, urlToCopy = %@, keys=%@)", buf, 0x20u);
      }

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v27 = v1;
      v8 = *(id *)(v1 + 40);
      v30 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
      if (v30)
      {
        v29 = *(_QWORD *)v33;
        v28 = v8;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v33 != v29)
              objc_enumerationMutation(v8);
            v10 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
            v11 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(WeakRetained, "pathForKey:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "fileURLWithPath:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = 0;
            v15 = objc_msgSend(v14, "copyItemAtURL:toURL:error:", v3, v13, &v31);
            v16 = v31;

            if ((v15 & 1) == 0)
            {
              objc_msgSend(*(id *)(v4 + 448), "imageCache");
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v13, "path");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "path");
                v19 = v4;
                v20 = v3;
                v21 = WeakRetained;
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413058;
                v37 = v10;
                v38 = 2112;
                v39 = v18;
                v40 = 2112;
                v41 = v22;
                v42 = 2112;
                v43 = v16;
                _os_log_impl(&dword_1DA478000, v17, OS_LOG_TYPE_DEFAULT, "[DiskCache] addImagesWithSourceUrl: copying remaining items failed (key = %@, urlToCopy = %@, destination = %@, error = %@)", buf, 0x2Au);

                WeakRetained = v21;
                v3 = v20;
                v4 = v19;
                v8 = v28;

              }
            }

          }
          v30 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
        }
        while (v30);
      }

      v1 = v27;
    }
    v23 = *(void (**)(void))(*(_QWORD *)(v1 + 56) + 16);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = *(_QWORD *)(v1 + 32);
      v26 = *(void **)(v1 + 40);
      *(_DWORD *)buf = 138412546;
      v37 = v25;
      v38 = 2112;
      v39 = v26;
      _os_log_impl(&dword_1DA478000, v24, OS_LOG_TYPE_ERROR, "[DiskCache] addImagesWithSourceUrl: unable to add remaining items via NSFileManager copy.  First key's imageUrl is unavailable (firstKey=%@, remaining=%@)", buf, 0x16u);
    }

    v23 = *(void (**)(void))(*(_QWORD *)(v1 + 56) + 16);
  }
  v23();

}

- (void)addImageWithSourceUrl:(id)a3 forKey:(id)a4 enforceSquare:(BOOL)a5 maxDimensionInPixels:(double)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v12 = a7;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __95__IMImageDiskCache_addImageWithSourceUrl_forKey_enforceSquare_maxDimensionInPixels_completion___block_invoke;
  v14[3] = &unk_1EA0C5798;
  v15 = v12;
  v13 = v12;
  -[IMImageDiskCache addImageWithSourceUrl:forKey:discardTransparency:enforceSquare:maxDimensionInPixels:completion:](self, "addImageWithSourceUrl:forKey:discardTransparency:enforceSquare:maxDimensionInPixels:completion:", a3, a4, 0, v8, v14, a6);

}

uint64_t __95__IMImageDiskCache_addImageWithSourceUrl_forKey_enforceSquare_maxDimensionInPixels_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addImageWithSourceUrl:(id)a3 forKey:(id)a4 discardTransparency:(BOOL)a5 enforceSquare:(BOOL)a6 maxDimensionInPixels:(double)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *workQueue;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21[2];
  BOOL v22;
  BOOL v23;
  id location;

  v14 = a3;
  v15 = a4;
  v16 = a8;
  if (!-[IMImageDiskCache _isProcessingKey:completion:](self, "_isProcessingKey:completion:", v15, v16))
  {
    objc_initWeak(&location, self);
    -[IMImageDiskCache _startProcessingKey:completion:](self, "_startProcessingKey:completion:", v15, v16);
    workQueue = self->_workQueue;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __115__IMImageDiskCache_addImageWithSourceUrl_forKey_discardTransparency_enforceSquare_maxDimensionInPixels_completion___block_invoke;
    v18[3] = &unk_1EA0C5ED0;
    objc_copyWeak(v21, &location);
    v19 = v14;
    v20 = v15;
    v22 = a5;
    v23 = a6;
    v21[1] = *(id *)&a7;
    dispatch_async(workQueue, v18);

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }

}

void __115__IMImageDiskCache_addImageWithSourceUrl_forKey_discardTransparency_enforceSquare_maxDimensionInPixels_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(unsigned __int8 *)(a1 + 64);
  v7 = *(unsigned __int8 *)(a1 + 65);
  v8 = *(double *)(a1 + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __115__IMImageDiskCache_addImageWithSourceUrl_forKey_discardTransparency_enforceSquare_maxDimensionInPixels_completion___block_invoke_2;
  v9[3] = &unk_1EA0C5EA8;
  objc_copyWeak(&v11, v2);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(WeakRetained, "_addImageWithSourceUrl:forKey:discardTransparency:enforceSquare:maxDimensionInPixels:completion:", v4, v5, v6, v7, v9, v8);

  objc_destroyWeak(&v11);
}

void __115__IMImageDiskCache_addImageWithSourceUrl_forKey_discardTransparency_enforceSquare_maxDimensionInPixels_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    objc_msgSend(v6, "_finishProcessingKey:success:", *(_QWORD *)(a1 + 32), a2);
    WeakRetained = v6;
  }

}

- (void)copyImageFromSourceUrl:(id)a3 to:(id)a4 discardTransparency:(BOOL)a5 enforceSquare:(BOOL)a6 maxDimensionInPixels:(double)a7 completion:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  NSObject *workQueue;
  id v15;
  id v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  id v20;

  v9 = a6;
  v10 = a5;
  v20 = a8;
  workQueue = self->_workQueue;
  v15 = a4;
  v16 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[IMImageDiskCache onDiskFileType](self, "onDiskFileType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[IMImageDiskCache copyImageFromSourceUrl:sourceFileType:to:discardTransparency:enforceSquare:maxDimensionInPixels:](self, "copyImageFromSourceUrl:sourceFileType:to:discardTransparency:enforceSquare:maxDimensionInPixels:", v16, v17, v15, v10, v9, a7);

  v19 = v20;
  if (v20)
  {
    (*((void (**)(id, _BOOL8))v20 + 2))(v20, v18);
    v19 = v20;
  }

}

- (BOOL)copyImageFromSourceUrl:(id)a3 sourceFileType:(id)a4 to:(id)a5 discardTransparency:(BOOL)a6 enforceSquare:(BOOL)a7 maxDimensionInPixels:(double)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  const __CFURL *v14;
  id v15;
  const __CFURL *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  CGImageSource *v21;
  CGImageSource *v22;
  id v23;
  __CFString *v24;
  CGImageDestinationRef v25;
  NSObject *v26;
  void *v27;
  BOOL v28;
  void *v29;
  const __CFURL *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  CGImageSource *v41;
  NSObject *v42;
  const __CFURL *v43;
  void *v44;
  id v45;
  NSObject *v46;
  const __CFURL *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  const __CFURL *v55;
  id v56;
  CGImage *v57;
  CGImageDestination *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  const __CFURL *v65;
  void *v66;
  CGImage *ThumbnailAtIndex;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  CGImage *v72;
  NSObject *v73;
  const __CFURL *v74;
  void *v75;
  void *v77;
  void *v78;
  _BOOL4 options;
  const __CFDictionary *optionsa;
  _BOOL4 v81;
  CGImageDestination *idst;
  void *v83;
  void *v84;
  const __CFDictionary *v85;
  _QWORD v86[5];
  _QWORD v87[5];
  _QWORD v88[2];
  _QWORD v89[2];
  uint8_t buf[4];
  const __CFURL *v91;
  __int16 v92;
  _BYTE v93[14];
  __int16 v94;
  _BOOL4 v95;
  __int16 v96;
  double v97;
  uint64_t v98;

  v9 = a7;
  v10 = a6;
  v98 = *MEMORY[0x1E0C80C00];
  v14 = (const __CFURL *)a3;
  v15 = a4;
  v16 = (const __CFURL *)a5;
  v17 = (void *)os_transaction_create();
  objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    v91 = v14;
    v92 = 2112;
    *(_QWORD *)v93 = v16;
    *(_WORD *)&v93[8] = 1024;
    *(_DWORD *)&v93[10] = v10;
    v94 = 1024;
    v95 = v9;
    v96 = 2048;
    v97 = a8;
    _os_log_impl(&dword_1DA478000, v18, OS_LOG_TYPE_DEFAULT, "saving image to disk in copyImageFromSourceUrl: (sourceUrl = %@, destinationUrl = %@, discardTransparency=%d, enforceSquare=%d, maxPixels=%.2f)", buf, 0x2Cu);
  }

  v19 = (void *)MEMORY[0x1DF09FCE8]();
  v20 = *MEMORY[0x1E0CBD2A8];
  v88[0] = *MEMORY[0x1E0CBD240];
  v88[1] = v20;
  v89[0] = MEMORY[0x1E0C9AAA0];
  v89[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 2);
  v85 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v21 = CGImageSourceCreateWithURL(v14, v85);
  v22 = v21;
  if (!v21 || !CGImageSourceGetCount(v21))
  {
    v23 = v15;
    objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      -[__CFURL path](v14, "path");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v91 = v22;
      v92 = 1024;
      *(_DWORD *)v93 = 0;
      *(_WORD *)&v93[4] = 2112;
      *(_QWORD *)&v93[6] = v27;
      _os_log_impl(&dword_1DA478000, v26, OS_LOG_TYPE_DEFAULT, "Could not create image source (source = %p, imageCount = %d) using sourceUrl: %@", buf, 0x1Cu);

    }
    if (!v22)
      goto LABEL_12;
    goto LABEL_11;
  }
  v23 = v15;
  -[IMImageDiskCache onDiskFileType](self, "onDiskFileType");
  v84 = v17;
  v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v25 = CGImageDestinationCreateWithURL(v16, v24, 1uLL, 0);

  v17 = v84;
  idst = v25;
  if (!v25)
  {
LABEL_11:
    CFRelease(v22);
LABEL_12:
    v28 = 0;
    v29 = v23;
    v30 = v16;
    goto LABEL_51;
  }
  v81 = v9 && !CGImageSourceIsSquare(v22);
  v29 = v23;
  -[IMImageDiskCache _defaultImageSavingOptions](self, "_defaultImageSavingOptions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = (void *)objc_msgSend(v31, "mutableCopy");

  v30 = v16;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v33 = objc_msgSend(v32, "CGColor");
    objc_msgSend(v83, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0CBC758]);

  }
  if (-[IMImageDiskCache _needsResizing:maxDimensionInPixels:](self, "_needsResizing:maxDimensionInPixels:", v22, a8))
  {
    v78 = v19;
    if (-[IMImageDiskCache _usesLessMemoryToConvertThenResizeImageSource:destinationDimensionInPixels:](self, "_usesLessMemoryToConvertThenResizeImageSource:destinationDimensionInPixels:", v22, a8))
    {
      options = v10;
      v77 = (void *)MEMORY[0x1E0C99E98];
      NSTemporaryDirectory();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "UUIDString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringByAppendingPathComponent:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "fileURLWithPath:", v37);
      v38 = objc_claimAutoreleasedReturnValue();

      v39 = (void *)v38;
      -[IMImageDiskCache onDiskFileType](self, "onDiskFileType");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[IMImageDiskCache _copyImageSourceByConvertingImage:toFileType:destinationUrl:](self, "_copyImageSourceByConvertingImage:toFileType:destinationUrl:", v22, v40, v38);

      if (v41)
      {
        objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          -[__CFURL path](v14, "path");
          v43 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "path");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v91 = v43;
          v92 = 2112;
          *(_QWORD *)v93 = v44;
          _os_log_impl(&dword_1DA478000, v42, OS_LOG_TYPE_DEFAULT, "[ImageResize] performing 2-step save.  Performing format-only conversion (originalSourceUrl = %@, intermediateUrl = %@", buf, 0x16u);

        }
        CFRelease(v22);
        v45 = v39;
        v22 = v41;
      }
      else
      {
        v45 = 0;
      }
      v10 = options;

    }
    else
    {
      v45 = 0;
    }
    v59 = MEMORY[0x1E0C9AAB0];
    v60 = *MEMORY[0x1E0CBD190];
    v86[0] = *MEMORY[0x1E0CBD238];
    v86[1] = v60;
    v87[0] = MEMORY[0x1E0C9AAB0];
    v87[1] = MEMORY[0x1E0C9AAB0];
    v61 = *MEMORY[0x1E0CBD178];
    v87[2] = MEMORY[0x1E0C9AAB0];
    v62 = *MEMORY[0x1E0CBD2A0];
    v86[2] = v61;
    v86[3] = v62;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a8, v77);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v86[4] = *MEMORY[0x1E0CBD2B8];
    v87[3] = v63;
    v87[4] = v59;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 5);
    optionsa = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      -[__CFURL path](v14, "path");
      v65 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      -[__CFURL path](v30, "path");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v91 = v65;
      v92 = 2112;
      *(_QWORD *)v93 = v66;
      *(_WORD *)&v93[8] = 1024;
      *(_DWORD *)&v93[10] = v10;
      v94 = 1024;
      v95 = v81;
      v96 = 2048;
      v97 = a8;
      _os_log_impl(&dword_1DA478000, v64, OS_LOG_TYPE_DEFAULT, "[ImageResize] saving... (sourceUrl = %@, destinationUrl = %@, discardTransparency=%d, enforceSquare=%d, maxPixels=%.2f)", buf, 0x2Cu);

    }
    ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v22, 0, optionsa);
    if (v81)
    {
      v68 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "scale");
      objc_msgSend(v68, "imageWithCGImage:scale:orientation:", ThumbnailAtIndex, 0);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      if (v70)
      {
        objc_msgSend(v70, "squareImage");
        v71 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v72 = (CGImage *)objc_msgSend(v71, "CGImage");

        CGImageDestinationAddImage(idst, v72, (CFDictionaryRef)v83);
      }

      v58 = idst;
    }
    else
    {
      v58 = idst;
      CGImageDestinationAddImage(idst, ThumbnailAtIndex, (CFDictionaryRef)v83);
    }
    v19 = v78;
    if (ThumbnailAtIndex)
      CFRelease(ThumbnailAtIndex);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      -[__CFURL path](v14, "path");
      v47 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      -[__CFURL path](v16, "path");
      v48 = v19;
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v91 = v47;
      v92 = 2112;
      *(_QWORD *)v93 = v49;
      *(_WORD *)&v93[8] = 1024;
      *(_DWORD *)&v93[10] = v10;
      v94 = 1024;
      v95 = v81;
      v96 = 2048;
      v97 = a8;
      _os_log_impl(&dword_1DA478000, v46, OS_LOG_TYPE_DEFAULT, "[ImageResize] saving... (sourceUrl = %@, destinationUrl = %@, discardTransparency=%d, enforceSquare=%d, maxPixels=%.2f)", buf, 0x2Cu);

      v19 = v48;
    }

    if (v81)
    {
      v50 = v19;
      v51 = (void *)MEMORY[0x1E0DC3870];
      -[__CFURL path](v14, "path");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "imageWithContentsOfFile:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (v53)
      {
        objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          -[__CFURL path](v14, "path");
          v55 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v91 = v55;
          _os_log_impl(&dword_1DA478000, v54, OS_LOG_TYPE_DEFAULT, "Failed to load image from: %@", buf, 0xCu);

        }
        objc_msgSend(v53, "squareImage");
        v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v57 = (CGImage *)objc_msgSend(v56, "CGImage");

        CGImageDestinationAddImage(idst, v57, (CFDictionaryRef)v83);
      }

      v45 = 0;
      v19 = v50;
      v58 = idst;
    }
    else
    {
      v58 = idst;
      CGImageDestinationAddImageFromSource(idst, v22, 0, (CFDictionaryRef)v83);
      v45 = 0;
    }
  }
  v28 = CGImageDestinationFinalize(v58);
  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      -[__CFURL path](v30, "path");
      v74 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v91 = v74;
      _os_log_impl(&dword_1DA478000, v73, OS_LOG_TYPE_DEFAULT, "Failed to write image data to: %@", buf, 0xCu);

      v58 = idst;
    }

  }
  CFRelease(v58);
  CFRelease(v22);
  if (v45)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "removeItemAtURL:error:", v45, 0);

  }
  v17 = v84;
LABEL_51:

  objc_autoreleasePoolPop(v19);
  return v28;
}

- (CGImageSource)_copyImageSourceByConvertingImage:(CGImageSource *)a3 toFileType:(id)a4 destinationUrl:(id)a5
{
  __CFString *v8;
  const __CFURL *v9;
  NSObject *Type;
  void *v11;
  char v12;
  CGImageDestination *v13;
  CGImageDestination *v14;
  CGImageSource *v15;
  NSObject *v16;
  int v18;
  const __CFURL *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a4;
  v9 = (const __CFURL *)a5;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
    Type = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(Type, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1DA478000, Type, OS_LOG_TYPE_ERROR, "no source", (uint8_t *)&v18, 2u);
    }
    goto LABEL_10;
  }
  Type = CGImageSourceGetType(a3);
  -[IMImageDiskCache onDiskFileType](self, "onDiskFileType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NSObject isEqualToString:](Type, "isEqualToString:", v11);

  if ((v12 & 1) != 0)
  {
LABEL_10:
    v15 = 0;
    goto LABEL_11;
  }
  v13 = CGImageDestinationCreateWithURL(v9, v8, 1uLL, 0);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412290;
      v19 = v9;
      _os_log_impl(&dword_1DA478000, v16, OS_LOG_TYPE_ERROR, "unable to save image to %@", (uint8_t *)&v18, 0xCu);
    }

    goto LABEL_10;
  }
  v14 = v13;
  CGImageDestinationAddImageFromSource(v13, a3, 0, 0);
  CGImageDestinationFinalize(v14);
  v15 = CGImageSourceCreateWithURL(v9, (CFDictionaryRef)-[IMImageDiskCache _defaultImageSavingSourceOptions](self, "_defaultImageSavingSourceOptions"));
  CFRelease(v14);
LABEL_11:

  return v15;
}

- (id)_defaultImageSavingSourceOptions
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CBD240];
  v8[0] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0CBD2A8];
  v7[0] = v2;
  v7[1] = v3;
  -[IMImageDiskCache onDiskFileType](self, "onDiskFileType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = *MEMORY[0x1E0CBD2B8];
  v8[1] = v4;
  v8[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_defaultImageSavingOptions
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = *MEMORY[0x1E0CBC780];
  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[IMImageDiskCache saveCompressionQuality](self, "saveCompressionQuality");
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBC7C0];
  v9[0] = v3;
  v9[1] = MEMORY[0x1E0C9AAB0];
  v5 = *MEMORY[0x1E0CBD2B8];
  v8[1] = v4;
  v8[2] = v5;
  v9[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_usesLessMemoryToConvertThenResizeImageSource:(CGImageSource *)a3 destinationDimensionInPixels:(double)a4
{
  CGImageSource *v4;
  __CFString *Type;
  void *v8;
  char v9;
  BOOL v10;
  uint64_t v11;

  v4 = a3;
  if (a3)
  {
    Type = (__CFString *)CGImageSourceGetType(a3);
    -[IMImageDiskCache onDiskFileType](self, "onDiskFileType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[__CFString isEqualToString:](Type, "isEqualToString:", v8);

    if ((v9 & 1) != 0)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      v10 = (double)(2 * CGImageSourcePixelSize(v4)) >= a4;
      LOBYTE(v4) = (double)(2 * v11) >= a4 && v10;
    }

  }
  return (char)v4;
}

- (BOOL)_needsResizing:(CGImageSource *)a3 maxDimensionInPixels:(double)a4
{
  BOOL v5;
  uint64_t v6;

  v5 = (double)CGImageSourcePixelSize(a3) > a4;
  return (double)v6 > a4 || v5;
}

- (BOOL)addImage:(id)a3 forKey:(id)a4
{
  return -[IMImageDiskCache _addImage:forKey:resizeIfTooBig:manageProcessingState:completion:](self, "_addImage:forKey:resizeIfTooBig:manageProcessingState:completion:", a3, a4, 1, 1, 0);
}

- (BOOL)_addImage:(id)a3 forKey:(id)a4 resizeIfTooBig:(BOOL)a5 manageProcessingState:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void (**v19)(void *, _QWORD);
  uint64_t v20;
  NSObject *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double maxImageDimensionInPixels;
  double v27;
  double v28;
  BOOL v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  double v38;
  uint64_t v39;
  NSObject *workQueue;
  id v41;
  void *v43;
  _QWORD block[4];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void (**v50)(void *, _QWORD);
  id v51;
  BOOL v52;
  _QWORD v53[5];
  _QWORD aBlock[4];
  id v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  double v63;
  uint64_t v64;
  CGSize v65;

  v8 = a6;
  v9 = a5;
  v64 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = (void *)os_transaction_create();
  v16 = v13;
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__IMImageDiskCache__addImage_forKey_resizeIfTooBig_manageProcessingState_completion___block_invoke;
  aBlock[3] = &unk_1EA0C5798;
  v18 = v14;
  v55 = v18;
  v19 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v20 = objc_msgSend(v16, "length");
  if (v12 && v20)
  {
    v43 = v15;
    objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "size");
      NSStringFromCGSize(v65);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v57 = v22;
      v58 = 2112;
      v59 = v16;
      _os_log_impl(&dword_1DA478000, v21, OS_LOG_TYPE_DEFAULT, "adding image (size = %@) to cache for with key %@", buf, 0x16u);

      v17 = MEMORY[0x1E0C809B0];
    }

    if (!v9
      || ((objc_msgSend(v12, "scale"),
           v24 = v23,
           objc_msgSend(v12, "size"),
           maxImageDimensionInPixels = self->_maxImageDimensionInPixels,
           v28 = v24 * v27,
           v24 * v25 <= maxImageDimensionInPixels)
        ? (v29 = v28 <= maxImageDimensionInPixels)
        : (v29 = 0),
          v29))
    {
      v32 = 0;
      v30 = v16;
      if (!v8)
        goto LABEL_13;
    }
    else
    {
      objc_msgSend(v16, "stringByAppendingString:", CFSTR("-raw"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v16;
        _os_log_impl(&dword_1DA478000, v31, OS_LOG_TYPE_DEFAULT, "image is too big, will resize (key=%@)", buf, 0xCu);
      }

      v32 = 1;
      if (!v8)
      {
LABEL_13:
        v33 = &__block_literal_global_28_1;
        if (!v32)
          goto LABEL_22;
        goto LABEL_19;
      }
    }
    if (!-[IMImageDiskCache _startProcessingForAddingKey:originalKey:](self, "_startProcessingForAddingKey:originalKey:", v30, v16))
    {
      v19[2](v19, 0);
      LOBYTE(v32) = 0;
      v41 = &__block_literal_global_28_1;
      goto LABEL_24;
    }
    v53[0] = v17;
    v53[1] = 3221225472;
    v53[2] = __85__IMImageDiskCache__addImage_forKey_resizeIfTooBig_manageProcessingState_completion___block_invoke_2;
    v53[3] = &unk_1EA0C5F38;
    v53[4] = self;
    v33 = _Block_copy(v53);
    if (!v32)
    {
LABEL_22:
      objc_initWeak((id *)buf, self);
      workQueue = self->_workQueue;
      block[0] = v17;
      block[1] = 3221225472;
      block[2] = __85__IMImageDiskCache__addImage_forKey_resizeIfTooBig_manageProcessingState_completion___block_invoke_29;
      block[3] = &unk_1EA0C5F88;
      objc_copyWeak(&v51, (id *)buf);
      v45 = v30;
      v41 = v33;
      v49 = v41;
      v50 = v19;
      v46 = v12;
      v52 = v32;
      v47 = v16;
      v48 = v43;
      dispatch_async(workQueue, block);

      objc_destroyWeak(&v51);
      objc_destroyWeak((id *)buf);
LABEL_24:

      v15 = v43;
      goto LABEL_25;
    }
LABEL_19:
    v34 = v17;
    objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "size");
      v37 = v36;
      objc_msgSend(v12, "size");
      v38 = self->_maxImageDimensionInPixels;
      *(_DWORD *)buf = 138413058;
      v57 = v30;
      v58 = 2048;
      v59 = v37;
      v60 = 2048;
      v61 = v39;
      v62 = 2048;
      v63 = v38;
      _os_log_impl(&dword_1DA478000, v35, OS_LOG_TYPE_DEFAULT, "Image for key %@ is larger than max size so downscaling asynchronously ({%f,%f} > max size (px) of %f)", buf, 0x2Au);
    }

    v17 = v34;
    goto LABEL_22;
  }
  v19[2](v19, 0);
  LOBYTE(v32) = 0;
  v30 = v16;
LABEL_25:

  return v32;
}

uint64_t __85__IMImageDiskCache__addImage_forKey_resizeIfTooBig_manageProcessingState_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __85__IMImageDiskCache__addImage_forKey_resizeIfTooBig_manageProcessingState_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishProcessingKey:success:", a2, a3);
}

void __85__IMImageDiskCache__addImage_forKey_resizeIfTooBig_manageProcessingState_completion___block_invoke_29(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  const __CFURL *v5;
  __CFString *v6;
  CGImageDestination *v7;
  NSObject *v8;
  const __CFURL *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void (*v15)(void);
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const __CFURL *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(WeakRetained, "pathForKey:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v4);
  v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "onDiskFileType");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = CGImageDestinationCreateWithURL(v5, v6, 1uLL, 0);

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v5;
      _os_log_impl(&dword_1DA478000, v14, OS_LOG_TYPE_DEFAULT, "Unable to create CGImageDestinationWithURL for url %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    goto LABEL_10;
  }
  CGImageDestinationAddImage(v7, (CGImageRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGImage"), (CFDictionaryRef)objc_msgSend(WeakRetained, "_defaultImageSavingOptions"));
  objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[__CFURL path](v5, "path");
    v9 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_1DA478000, v8, OS_LOG_TYPE_DEFAULT, "saving image to %@ for key %@", buf, 0x16u);

  }
  CGImageDestinationFinalize(v7);
  CFRelease(v7);
  if (!*(_BYTE *)(a1 + 88))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
LABEL_10:
    v15();
    goto LABEL_11;
  }
  v11 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "maxImageDimensionInPixels");
  objc_msgSend(WeakRetained, "_resizeImageForKey:maxDimensionInPixels:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 48);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__IMImageDiskCache__addImage_forKey_resizeIfTooBig_manageProcessingState_completion___block_invoke_30;
  v16[3] = &unk_1EA0C5F60;
  v18 = *(id *)(a1 + 64);
  v17 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 72);
  objc_msgSend(WeakRetained, "_addImage:forKey:resizeIfTooBig:manageProcessingState:completion:", v12, v13, 0, 0, v16);
  objc_msgSend(WeakRetained, "removeItemForKey:", *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

LABEL_11:
}

uint64_t __85__IMImageDiskCache__addImage_forKey_resizeIfTooBig_manageProcessingState_completion___block_invoke_30(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (BOOL)_startProcessingForAddingKey:(id)a3 originalKey:(id)a4
{
  id v6;
  id v7;
  char v8;
  NSObject *v9;
  const char *v10;
  BOOL v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "isEqualToString:", v6);
  if ((v8 & 1) == 0)
  {
    if (-[IMImageDiskCache _isProcessingKey:completion:](self, "_isProcessingKey:completion:", v7, 0))
    {
      objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        v18 = v7;
        v10 = "Skipping adding image. originalKey '%@' is already being processed";
LABEL_11:
        _os_log_impl(&dword_1DA478000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, 0xCu);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    if (-[IMBaseDiskCache hasItemForKey:](self, "hasItemForKey:", v7))
    {
      objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        v18 = v7;
        v10 = "Skipping adding image. An image for originalKey '%@' already exists on disk.";
        goto LABEL_11;
      }
LABEL_12:

LABEL_13:
      v11 = 0;
      goto LABEL_25;
    }
  }
  if (-[IMImageDiskCache _isProcessingKey:completion:](self, "_isProcessingKey:completion:", v6, 0))
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v6;
      v10 = "Skipping adding image. key '%@' is already being processed";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (-[IMBaseDiskCache hasItemForKey:](self, "hasItemForKey:", v6))
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if ((v8 & 1) != 0)
    {
      if (v13)
      {
        v17 = 138412290;
        v18 = v6;
        _os_log_impl(&dword_1DA478000, v12, OS_LOG_TYPE_DEFAULT, "Skipping adding image. An image for key '%@' already exists on disk.", (uint8_t *)&v17, 0xCu);
      }

      goto LABEL_13;
    }
    if (v13)
    {
      v17 = 138412546;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1DA478000, v12, OS_LOG_TYPE_DEFAULT, "Detected orphaned intermediate image with key '%@' for original '%@'.  Deleting and will continue processing…", (uint8_t *)&v17, 0x16u);
    }

    -[IMImageDiskCache pathForKey:](self, "pathForKey:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeItemAtPath:error:", v14, 0);

  }
  if ((objc_msgSend(v7, "isEqualToString:", v6) & 1) == 0)
    -[IMImageDiskCache _startProcessingKey:completion:](self, "_startProcessingKey:completion:", v7, 0);
  -[IMImageDiskCache _startProcessingKey:completion:](self, "_startProcessingKey:completion:", v6, 0);
  v11 = 1;
LABEL_25:

  return v11;
}

- (id)imageForKey:(id)a3
{
  const __CFURL *v4;
  const __CFDictionary *v5;
  CGImageSource *v6;
  CGImageSource *v7;
  CGImageRef ImageAtIndex;
  CGImageRef v9;
  void *v10;

  -[IMImageDiskCache imageUrlForKey:](self, "imageUrlForKey:", a3);
  v4 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[IMImageDiskCache _defaultImageSavingSourceOptions](self, "_defaultImageSavingSourceOptions");
    v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = CGImageSourceCreateWithURL(v4, v5);
    if (v6)
    {
      v7 = v6;
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v6, 0, v5);
      if (ImageAtIndex)
      {
        v9 = ImageAtIndex;
        objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", ImageAtIndex);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        CFRelease(v9);
      }
      else
      {
        v10 = 0;
      }
      CFRelease(v7);
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_startProcessingKey:(id)a3 completion:(id)a4
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
  v10[2] = __51__IMImageDiskCache__startProcessingKey_completion___block_invoke;
  v10[3] = &unk_1EA0C5FB0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[IMImageDiskCache _performWithSyncLock:](self, "_performWithSyncLock:", v10);

}

void __51__IMImageDiskCache__startProcessingKey_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  const void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "proccessingKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "completionHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v10 = (id)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "completionHandlers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *(_QWORD *)(a1 + 40));

  }
  v5 = *(const void **)(a1 + 48);
  if (v5)
  {
    v6 = _Block_copy(v5);
    objc_msgSend(v10, "addObject:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "pendingPerformWhenAvailableOnDiskBlocks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "pendingPerformWhenAvailableOnDiskBlocks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

  if (v8)
    objc_msgSend(v10, "addObjectsFromArray:", v8);

}

- (void)_finishProcessingKey:(id)a3 success:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__IMImageDiskCache__finishProcessingKey_success___block_invoke;
  v8[3] = &unk_1EA0C5FD8;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[IMImageDiskCache _performWithSyncLock:](self, "_performWithSyncLock:", v8);

}

void __49__IMImageDiskCache__finishProcessingKey_success___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "proccessingKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "completionHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
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
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "completionHandlers", (_QWORD)v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (id)_resizeImageForKey:(id)a3 maxDimensionInPixels:(double)a4
{
  id v6;
  uint64_t v7;
  CGImageSource *v9;
  void *v10;
  const __CFURL *v11;
  void *v12;
  int v13;
  NSObject *v14;
  const __CFDictionary *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const __CFDictionary *v20;
  CGImageRef ThumbnailAtIndex;
  void *v22;
  void *v23;
  _QWORD v25[5];
  _QWORD v26[5];
  uint8_t buf[4];
  id v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "length");
  if (a4 < 1.0 || v7 == 0)
  {
    v9 = 0;
  }
  else
  {
    -[IMImageDiskCache pathForKey:](self, "pathForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
    v11 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "fileExistsAtPath:", v10);

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v6;
        v29 = 2048;
        v30 = a4;
        _os_log_impl(&dword_1DA478000, v14, OS_LOG_TYPE_DEFAULT, "[ImageResize] disk-based image resizing: (key = %@, maxDimensionInPixels = %.2f)", buf, 0x16u);
      }

      -[IMImageDiskCache _defaultImageSavingSourceOptions](self, "_defaultImageSavingSourceOptions");
      v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v9 = CGImageSourceCreateWithURL(v11, v15);
      if (v9)
      {
        v16 = MEMORY[0x1E0C9AAB0];
        v17 = *MEMORY[0x1E0CBD190];
        v25[0] = *MEMORY[0x1E0CBD238];
        v25[1] = v17;
        v26[0] = MEMORY[0x1E0C9AAB0];
        v26[1] = MEMORY[0x1E0C9AAB0];
        v18 = *MEMORY[0x1E0CBD178];
        v26[2] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4, v25[0], v17, v18, *MEMORY[0x1E0CBD2A0]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v25[4] = *MEMORY[0x1E0CBD2B8];
        v26[3] = v19;
        v26[4] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 5);
        v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

        ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v9, 0, v20);
        CFRelease(v9);

        if (ThumbnailAtIndex)
        {
          v22 = (void *)MEMORY[0x1E0DC3870];
          objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "scale");
          objc_msgSend(v22, "imageWithCGImage:scale:orientation:", ThumbnailAtIndex, 0);
          v9 = (CGImageSource *)objc_claimAutoreleasedReturnValue();

          CFRelease(ThumbnailAtIndex);
        }
        else
        {
          v9 = 0;
        }
      }

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (void)performWhenURLAvailableForImageForKey:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  _QWORD v9[5];
  id v10;
  void (**v11)(id, uint64_t);
  _QWORD *v12;
  _QWORD v13[3];
  char v14;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (v7)
  {
    -[IMImageDiskCache imageUrlForKey:](self, "imageUrlForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v7[2](v7, 1);
    }
    else
    {
      v13[0] = 0;
      v13[1] = v13;
      v13[2] = 0x2020000000;
      v14 = 0;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __64__IMImageDiskCache_performWhenURLAvailableForImageForKey_block___block_invoke;
      v9[3] = &unk_1EA0C6000;
      v12 = v13;
      v9[4] = self;
      v10 = v6;
      v11 = v7;
      -[IMImageDiskCache _performWithSyncLock:](self, "_performWithSyncLock:", v9);

      _Block_object_dispose(v13, 8);
    }
  }

}

void __64__IMImageDiskCache_performWhenURLAvailableForImageForKey_block___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__IMImageDiskCache_performWhenURLAvailableForImageForKey_block___block_invoke_2;
  v11[3] = &unk_1EA0C5798;
  v12 = *(id *)(a1 + 48);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v2, "_isProcessingKey:completion:", v3, v11);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingPerformWhenAvailableOnDiskBlocks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    v9 = _Block_copy(*(const void **)(a1 + 48));
    objc_msgSend(v8, "addObject:", v9);

    objc_msgSend(*(id *)(a1 + 32), "pendingPerformWhenAvailableOnDiskBlocks");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 40));

  }
}

uint64_t __64__IMImageDiskCache_performWhenURLAvailableForImageForKey_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSString)onDiskFileType
{
  return self->_onDiskFileType;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (double)maxImageDimensionInPixels
{
  return self->_maxImageDimensionInPixels;
}

- (double)saveCompressionQuality
{
  return self->_saveCompressionQuality;
}

- (NSRecursiveLock)syncLock
{
  return self->_syncLock;
}

- (NSMutableDictionary)completionHandlers
{
  return self->_completionHandlers;
}

- (NSMutableDictionary)pendingPerformWhenAvailableOnDiskBlocks
{
  return self->_pendingPerformWhenAvailableOnDiskBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingPerformWhenAvailableOnDiskBlocks, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_proccessingKeys, 0);
  objc_storeStrong((id *)&self->_syncLock, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_onDiskFileType, 0);
}

@end
