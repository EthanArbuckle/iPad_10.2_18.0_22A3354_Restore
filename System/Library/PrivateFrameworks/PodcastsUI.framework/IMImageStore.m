@implementation IMImageStore

void __28__IMImageStore_defaultStore__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultStore_defaultStore_0;
  defaultStore_defaultStore_0 = (uint64_t)v1;

}

- (IMImageStore)init
{
  void *v3;
  IMImageStore *v4;

  objc_msgSend((id)objc_opt_class(), "defaultName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IMImageStore initWithName:](self, "initWithName:", v3);

  return v4;
}

+ (id)defaultName
{
  return CFSTR("Default");
}

- (IMImageStore)initWithName:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  IMImageStore *v10;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultBasePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultMaxImageDimensionInPixels");
  v7 = v6;
  v8 = objc_msgSend((id)objc_opt_class(), "defaultMaxConcurrentOperations");
  objc_msgSend((id)objc_opt_class(), "defaultAlternativeSizeBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[IMImageStore initWithName:basePath:maxImageDimensionInPixels:maxConcurrentOperations:alternativeSizeBlock:](self, "initWithName:basePath:maxImageDimensionInPixels:maxConcurrentOperations:alternativeSizeBlock:", v4, v5, v8, v9, v7);

  return v10;
}

+ (id)defaultAlternativeSizeBlock
{
  return &__block_literal_global_15;
}

+ (unint64_t)defaultMaxConcurrentOperations
{
  return -1;
}

+ (double)defaultMaxImageDimensionInPixels
{
  return 1.79769313e308;
}

+ (id)defaultBasePath
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3470], "applicationDocumentsDirectory");
}

void __87__IMImageStore_asyncImageURLForKey_squareDimension_cacheKeyModifier_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void (*v5)(void);
  void *v6;
  id v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "diskCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasItemForKey:", *(_QWORD *)(a1 + 40))
    && (objc_msgSend(v2, "pathForKey:", *(_QWORD *)(a1 + 40)), (v3 = objc_claimAutoreleasedReturnValue()) != 0)
    || objc_msgSend(v2, "hasItemForKey:", *(_QWORD *)(a1 + 48))
    && (objc_msgSend(v2, "pathForKey:", *(_QWORD *)(a1 + 48)), (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_9:
    v5();
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "diskCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageUrlForKey:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_9;
  }
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__6;
  v18[4] = __Block_byref_object_dispose__6;
  v7 = v2;
  v19 = v7;
  v8 = *(double *)(a1 + 72);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = v10;

  v12 = *(_QWORD *)(a1 + 48);
  v13 = objc_msgSend(*(id *)(a1 + 32), "requireSquareImages:", *(_QWORD *)(a1 + 56));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__IMImageStore_asyncImageURLForKey_squareDimension_cacheKeyModifier_completionHandler___block_invoke_41;
  v14[3] = &unk_1EA0C6300;
  v17 = v18;
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 64);
  objc_msgSend(v7, "addImageWithSourceUrl:forKey:enforceSquare:maxDimensionInPixels:completion:", v4, v12, v13, v14, v8 * v11);

  _Block_object_dispose(v18, 8);
LABEL_10:

}

void __87__IMImageStore_asyncImageURLForKey_squareDimension_cacheKeyModifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    v6 = v3;
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    v4 = v6;
  }

}

- (id)imageUrlForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMImageStore diskCache](self, "diskCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageUrlForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (IMImageDiskCache)diskCache
{
  return self->_diskCache;
}

- (IMImageStore)initWithName:(id)a3 basePath:(id)a4 maxImageDimensionInPixels:(double)a5 maxConcurrentOperations:(unint64_t)a6 alternativeSizeBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  IMImageStore *v15;
  uint64_t v16;
  NSString *name;
  IMImageDiskCache *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  IMImageDiskCache *diskCache;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id alternativeSize;
  objc_super v33;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v33.receiver = self;
  v33.super_class = (Class)IMImageStore;
  v15 = -[IMImageStore init](&v33, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    name = v15->_name;
    v15->_name = (NSString *)v16;

    -[IMImageStore configureMemoryCache](v15, "configureMemoryCache");
    v18 = [IMImageDiskCache alloc];
    -[IMImageStore fullName](v15, "fullName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingPathComponent:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[IMImageDiskCache initWithBasePath:maxImageDimensionInPixels:](v18, "initWithBasePath:maxImageDimensionInPixels:", v20, a5);
    diskCache = v15->_diskCache;
    v15->_diskCache = (IMImageDiskCache *)v21;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v15, sel_memoryWarning, *MEMORY[0x1E0D7F190], 0);

    v24 = (void *)objc_opt_new();
    -[IMImageStore setFetchOperationQueue:](v15, "setFetchOperationQueue:", v24);

    -[IMImageStore fetchOperationQueue](v15, "fetchOperationQueue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setMaxConcurrentOperationCount:", a6);

    dispatch_get_global_queue(0, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMImageStore fetchOperationQueue](v15, "fetchOperationQueue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setUnderlyingQueue:", v26);

    -[IMImageStore fetchOperationQueue](v15, "fetchOperationQueue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setName:", CFSTR("com.apple.podcasts.IMImageStore"));

    -[IMImageStore fetchOperationQueue](v15, "fetchOperationQueue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSuspended:", 0);

    v30 = _Block_copy(v14);
    alternativeSize = v15->_alternativeSize;
    v15->_alternativeSize = v30;

    -[IMImageStore setMaxImageDimensionInPixels:](v15, "setMaxImageDimensionInPixels:", a5);
  }

  return v15;
}

- (NSOperationQueue)fetchOperationQueue
{
  return self->_fetchOperationQueue;
}

- (id)fullName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[IMImageStore name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("IMImageStore-%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setMaxImageDimensionInPixels:(double)a3
{
  self->_maxImageDimensionInPixels = a3;
}

- (void)setFetchOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_fetchOperationQueue, a3);
}

- (void)configureMemoryCache
{
  IMMemoryCache *v3;
  IMMemoryCache *memoryCache;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;

  v3 = objc_alloc_init(IMMemoryCache);
  memoryCache = self->_memoryCache;
  self->_memoryCache = v3;

  -[IMImageStore fullName](self, "fullName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMImageStore memoryCache](self, "memoryCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", v5);

  v7 = +[IMImageStore _memorySize](IMImageStore, "_memorySize");
  -[IMImageStore memoryCache](self, "memoryCache");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTotalCostLimit:", v7);

}

- (IMMemoryCache)memoryCache
{
  return self->_memoryCache;
}

+ (unint64_t)_memorySize
{
  if (physicalMemory() >= 0x3B9ACA00)
    return 0x4000000;
  else
    return 0x2000000;
}

+ (id)defaultStore
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__IMImageStore_defaultStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultStore_onceToken_0 != -1)
    dispatch_once(&defaultStore_onceToken_0, block);
  return (id)defaultStore_defaultStore_0;
}

+ (int)defaultImageResizeOptions
{
  return 1;
}

- (BOOL)requireSquareImages:(id)a3
{
  return 0;
}

- (void)setDisableMemoryCache:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  IMMemoryCache *memoryCache;

  v3 = a3;
  -[IMImageStore memoryCache](self, "memoryCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (v5)
    {
      -[IMImageStore memoryCache](self, "memoryCache");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeAllObjects");

      memoryCache = self->_memoryCache;
      self->_memoryCache = 0;

    }
  }
  else if (!v5)
  {
    -[IMImageStore configureMemoryCache](self, "configureMemoryCache");
  }
}

- (BOOL)disableMemoryCache
{
  void *v2;
  BOOL v3;

  -[IMImageStore memoryCache](self, "memoryCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)addImage:(id)a3 forKey:(id)a4
{
  -[IMImageStore addImage:forKey:persist:](self, "addImage:forKey:persist:", a3, a4, 1);
}

- (void)addImage:(id)a3 forKey:(id)a4 persist:(BOOL)a5
{
  -[IMImageStore addImage:forKey:persist:discardTransparency:](self, "addImage:forKey:persist:discardTransparency:", a3, a4, a5, 0);
}

- (void)addImage:(id)a3 forKey:(id)a4 persist:(BOOL)a5 discardTransparency:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  IMImageStore *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;

  v6 = a6;
  v19 = a3;
  v10 = a4;
  v11 = v19;
  v12 = v10;
  if (v19 && v10)
  {
    if (!a5)
    {
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "im_imageWithBackgroundColor:", v17);
        v18 = objc_claimAutoreleasedReturnValue();

        v11 = (id)v18;
      }
      v15 = self;
      v16 = v11;
      v19 = v11;
      goto LABEL_10;
    }
    -[IMImageStore diskCache](self, "diskCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "addImage:forKey:", v19, v12);

    if ((v14 & 1) == 0 && !v6)
    {
      v15 = self;
      v16 = v19;
LABEL_10:
      -[IMImageStore _addImage:toMemoryCacheWithKey:](v15, "_addImage:toMemoryCacheWithKey:", v16, v12);
    }
  }

}

- (void)addImagesWithSourceUrl:(id)a3 forKeys:(id)a4 removeOldItems:(BOOL)a5 discardTransparency:(BOOL)a6 completion:(id)a7
{
  uint64_t v8;
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  NSObject *v24;
  void *v25;
  void *v26;
  _BOOL8 v27;
  NSObject *v28;
  unsigned int v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD aBlock[4];
  id v39;
  uint8_t v40[128];
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v8 = a6;
  v9 = a5;
  v49 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__IMImageStore_addImagesWithSourceUrl_forKeys_removeOldItems_discardTransparency_completion___block_invoke;
  aBlock[3] = &unk_1EA0C5798;
  v14 = v13;
  v39 = v14;
  v15 = a4;
  v16 = _Block_copy(aBlock);
  objc_msgSend(v15, "objectsPassingTest:", &__block_literal_global_24_0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v42 = v12;
    v43 = 2112;
    v44 = v17;
    v45 = 1024;
    v46 = v9;
    v47 = 1024;
    v48 = v8;
    _os_log_impl(&dword_1DA478000, v18, OS_LOG_TYPE_DEFAULT, "[Store] addImagesWithSourceUrl: got store-image request (fileUrl=%@, keys=%@, removeOldItem=%d, discardTransparency=%d", buf, 0x22u);
  }

  if (v12 && objc_msgSend(v17, "count"))
  {
    if (v9)
    {
      v29 = v8;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v19 = v17;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v35 != v22)
              objc_enumerationMutation(v19);
            -[IMImageStore removeItemsWithPrefx:](self, "removeItemsWithPrefx:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        }
        while (v21);
      }

      v8 = v29;
    }
    objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v42 = v12;
      v43 = 2112;
      v44 = v17;
      _os_log_impl(&dword_1DA478000, v24, OS_LOG_TYPE_DEFAULT, "[Store] addImagesWithSourceUrl: adding to disk-cache (fileUrl = %@, keys=%@)", buf, 0x16u);
    }

    -[IMImageStore diskCache](self, "diskCache");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "anyObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[IMImageStore requireSquareImages:](self, "requireSquareImages:", v26);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __93__IMImageStore_addImagesWithSourceUrl_forKeys_removeOldItems_discardTransparency_completion___block_invoke_26;
    v30[3] = &unk_1EA0C61C0;
    v31 = v12;
    v32 = v17;
    v33 = v16;
    objc_msgSend(v25, "addImagesWithSourceUrl:forKeys:discardTransparency:enforceSquare:completion:", v31, v32, v8, v27, v30);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v42 = v12;
      v43 = 2112;
      v44 = v17;
      _os_log_impl(&dword_1DA478000, v28, OS_LOG_TYPE_ERROR, "[Store] addImagesWithSourceUrl: invalid requests (fileUrl = %@, validKeys=%@), bailing.", buf, 0x16u);
    }

    (*((void (**)(void *, _QWORD))v16 + 2))(v16, 0);
  }

}

uint64_t __93__IMImageStore_addImagesWithSourceUrl_forKeys_removeOldItems_discardTransparency_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

BOOL __93__IMImageStore_addImagesWithSourceUrl_forKeys_removeOldItems_discardTransparency_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "length") != 0;
}

uint64_t __93__IMImageStore_addImagesWithSourceUrl_forKeys_removeOldItems_discardTransparency_completion___block_invoke_26(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1DA478000, v2, OS_LOG_TYPE_DEFAULT, "[Store] addImagesWithSourceUrl: finished adding to disk-cache (fileUrl = %@, keys=%@)", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (id)imageForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[IMImageStore memoryCache](self, "memoryCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[IMImageStore _loadDiskCacheImageForKey:expectImageExists:](self, "_loadDiskCacheImageForKey:expectImageExists:", v4, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)imageForKey:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[IMImageStore imageForKey:size:resizeOptions:](self, "imageForKey:size:resizeOptions:", v7, objc_msgSend((id)objc_opt_class(), "defaultImageResizeOptions"), width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)imageForKey:(id)a3 size:(CGSize)a4 resizeOptions:(int)a5
{
  return -[IMImageStore imageForKey:size:resizeOptions:modifier:](self, "imageForKey:size:resizeOptions:modifier:", a3, *(_QWORD *)&a5, 0, a4.width, a4.height);
}

- (id)imageForKey:(id)a3 size:(CGSize)a4 modifier:(id)a5
{
  double height;
  double width;
  id v8;
  void *v9;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  -[IMImageStore imageForKey:size:resizeOptions:modifier:](self, "imageForKey:size:resizeOptions:modifier:", v8, objc_msgSend((id)objc_opt_class(), "defaultImageResizeOptions"), 0, width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)imageForKey:(id)a3 size:(CGSize)a4 resizeOptions:(int)a5 modifier:(id)a6
{
  uint64_t v7;
  double height;
  double width;
  id v11;
  id v12;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double (**v19)(_QWORD, double, double, double);
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v25;
  int v26;
  double v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v7 = *(_QWORD *)&a5;
  height = a4.height;
  width = a4.width;
  v30 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  if (objc_msgSend(v11, "length"))
  {
    if (width >= 0.00000011920929 && height >= 0.00000011920929)
    {
      -[IMImageStore _keyForSize:baseKey:modifier:](self, "_keyForSize:baseKey:modifier:", v11, v12, width, height);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMImageStore imageForKey:](self, "imageForKey:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        -[IMImageStore alternativeSize](self, "alternativeSize");
        v19 = (double (**)(_QWORD, double, double, double))objc_claimAutoreleasedReturnValue();
        -[IMImageStore maxImageDimensionInPixels](self, "maxImageDimensionInPixels");
        v21 = v19[2](v19, width, height, v20);
        v23 = v22;

        if (width == v21 && height == v23)
        {
          v23 = height;
        }
        else
        {
          -[IMImageStore _keyForSize:baseKey:modifier:](self, "_keyForSize:baseKey:modifier:", v11, v12, v21, v23);
          v25 = objc_claimAutoreleasedReturnValue();

          -[IMImageStore imageForKey:](self, "imageForKey:", v25);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)v25;
          width = v21;
          if (v15)
            goto LABEL_13;
        }
        if (objc_msgSend(v12, "hasModifications"))
          -[IMImageStore _createModifiedImageFromSourceKey:newImageKey:modifier:size:resizeOptions:](self, "_createModifiedImageFromSourceKey:newImageKey:modifier:size:resizeOptions:", v11, v16, v12, v7, width, v23);
        else
          -[IMImageStore _createScaledImageFromSourceKey:newImageKey:size:resizeOptions:](self, "_createScaledImageFromSourceKey:newImageKey:size:resizeOptions:", v11, v16, v7, width, v23);
        v17 = objc_claimAutoreleasedReturnValue();
      }
      v15 = (void *)v17;
LABEL_13:

      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0D7F1C0], "defaultCategory");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v26 = 134218240;
      v27 = width;
      v28 = 2048;
      v29 = height;
      _os_log_impl(&dword_1DA478000, v14, OS_LOG_TYPE_ERROR, "Invalid arguments. Size must be non-zero in both dimensions. (width: %f, height: %f)", (uint8_t *)&v26, 0x16u);
    }

  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (id)_createModifiedImageFromSourceKey:(id)a3 newImageKey:(id)a4 modifier:(id)a5 size:(CGSize)a6 resizeOptions:(int)a7
{
  uint64_t v7;
  double height;
  double width;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  IMImageStore *v24;
  id v25;

  v7 = *(_QWORD *)&a7;
  height = a6.height;
  width = a6.width;
  v13 = a4;
  v14 = a5;
  -[IMImageStore imageForKey:size:resizeOptions:](self, "imageForKey:size:resizeOptions:", a3, v7, width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __90__IMImageStore__createModifiedImageFromSourceKey_newImageKey_modifier_size_resizeOptions___block_invoke;
  v21[3] = &unk_1EA0C61E8;
  v22 = v15;
  v23 = v14;
  v24 = self;
  v25 = v13;
  v16 = v13;
  v17 = v14;
  v18 = v15;
  -[IMImageStore _performImagingTransactionNamed:block:](self, "_performImagingTransactionNamed:block:", CFSTR("image blur"), v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id __90__IMImageStore__createModifiedImageFromSourceKey_newImageKey_modifier_size_resizeOptions___block_invoke(uint64_t a1)
{
  void *v2;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "imageFromSourceImage:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      objc_msgSend(*(id *)(a1 + 48), "addImage:forKey:", v2, *(_QWORD *)(a1 + 56));
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_createScaledImageFromSourceKey:(id)a3 newImageKey:(id)a4 size:(CGSize)a5 resizeOptions:(int)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  CGFloat v20;
  CGFloat v21;
  int v22;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v12 = a4;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79__IMImageStore__createScaledImageFromSourceKey_newImageKey_size_resizeOptions___block_invoke;
  v17[3] = &unk_1EA0C6210;
  v17[4] = self;
  v18 = v11;
  v20 = width;
  v21 = height;
  v19 = v12;
  v22 = a6;
  v13 = v12;
  v14 = v11;
  -[IMImageStore _performImagingTransactionNamed:block:](self, "_performImagingTransactionNamed:block:", CFSTR("image resize"), v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __79__IMImageStore__createScaledImageFromSourceKey_newImageKey_size_resizeOptions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "imageForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = *(double *)(a1 + 64);
    objc_msgSend(v2, "size");
    if (v4 <= v5 && (v6 = *(double *)(a1 + 56), objc_msgSend(v3, "size"), v6 <= v7))
    {
      objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 40);
        v11 = *(_QWORD *)(a1 + 48);
        NSStringFromCGSize(*(CGSize *)(a1 + 56));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412802;
        v15 = v10;
        v16 = 2112;
        v17 = v11;
        v18 = 2112;
        v19 = v12;
        _os_log_impl(&dword_1DA478000, v9, OS_LOG_TYPE_DEFAULT, "[ImageResize] in-memory image resizing in _createScaledImageFromSourceKey: (sourceImageKey = %@, newImageKey = %@, size = %@)", (uint8_t *)&v14, 0x20u);

      }
      objc_msgSend(v3, "imageWithSize:resizeOptions:", *(unsigned int *)(a1 + 72), *(double *)(a1 + 56), *(double *)(a1 + 64));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "addImage:forKey:", v8, *(_QWORD *)(a1 + 48));
    }
    else
    {
      v8 = v3;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_performImagingTransactionNamed:(id)a3 block:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void (**v9)(_QWORD);
  void *v10;

  v5 = (__CFString *)a3;
  v6 = v5;
  if (a4)
  {
    v7 = CFSTR("unknown transaction");
    if (v5)
      v7 = v5;
    v8 = v7;
    v9 = (void (**)(_QWORD))a4;

    v6 = objc_retainAutorelease(v8);
    -[__CFString UTF8String](v6, "UTF8String");
    v10 = (void *)os_transaction_create();
    v9[2](v9);
    a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return a4;
}

- (id)imageInMemoryForKey:(id)a3 size:(CGSize)a4
{
  return -[IMImageStore imageInMemoryForKey:size:modifier:](self, "imageInMemoryForKey:size:modifier:", a3, 0, a4.width, a4.height);
}

- (id)imageInMemoryForKey:(id)a3 size:(CGSize)a4 modifier:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  NSObject *v12;
  double (**v13)(_QWORD, double, double, double);
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  int v22;
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  height = a4.height;
  width = a4.width;
  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (width < 0.00000011920929 || height < 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "defaultCategory");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v22 = 134218240;
      v23 = width;
      v24 = 2048;
      v25 = height;
      _os_log_impl(&dword_1DA478000, v12, OS_LOG_TYPE_ERROR, "Invalid arguments. Size must be non-zero in both dimensions. (width: %f, height: %f)", (uint8_t *)&v22, 0x16u);
    }

    v20 = 0;
  }
  else
  {
    -[IMImageStore alternativeSize](self, "alternativeSize");
    v13 = (double (**)(_QWORD, double, double, double))objc_claimAutoreleasedReturnValue();
    -[IMImageStore maxImageDimensionInPixels](self, "maxImageDimensionInPixels");
    v15 = v13[2](v13, width, height, v14);
    v17 = v16;

    -[IMImageStore _keyForSize:baseKey:modifier:](self, "_keyForSize:baseKey:modifier:", v9, v10, v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMImageStore memoryCache](self, "memoryCache");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v20;
}

- (void)asyncImageForKey:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(id *);
  void *v16;
  id v17;
  id v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[IMImageStore fetchOperationQueue](self, "fetchOperationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB34C8];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __51__IMImageStore_asyncImageForKey_completionHandler___block_invoke;
  v16 = &unk_1EA0C6260;
  objc_copyWeak(&v19, &location);
  v10 = v6;
  v17 = v10;
  v11 = v7;
  v18 = v11;
  objc_msgSend(v9, "blockOperationWithBlock:", &v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v12, v13, v14, v15, v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __51__IMImageStore_asyncImageForKey_completionHandler___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "imageForKey:", a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[5])
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__IMImageStore_asyncImageForKey_completionHandler___block_invoke_2;
    block[3] = &unk_1EA0C6238;
    v7 = a1[5];
    v5 = v3;
    v6 = a1[4];
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __51__IMImageStore_asyncImageForKey_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)asyncImageForKey:(id)a3 size:(CGSize)a4 completionHandler:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;

  height = a4.height;
  width = a4.width;
  v9 = a5;
  v10 = a3;
  -[IMImageStore asyncImageForKey:size:resizeOptions:modifier:completionHandler:](self, "asyncImageForKey:size:resizeOptions:modifier:completionHandler:", v10, objc_msgSend((id)objc_opt_class(), "defaultImageResizeOptions"), 0, v9, width, height);

}

- (void)asyncImageForKey:(id)a3 size:(CGSize)a4 resizeOptions:(int)a5 completionHandler:(id)a6
{
  -[IMImageStore asyncImageForKey:size:resizeOptions:modifier:completionHandler:](self, "asyncImageForKey:size:resizeOptions:modifier:completionHandler:", a3, *(_QWORD *)&a5, 0, a6, a4.width, a4.height);
}

- (void)asyncImageForKey:(id)a3 size:(CGSize)a4 modifier:(id)a5 completionHandler:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  id v13;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  -[IMImageStore asyncImageForKey:size:resizeOptions:modifier:completionHandler:](self, "asyncImageForKey:size:resizeOptions:modifier:completionHandler:", v13, objc_msgSend((id)objc_opt_class(), "defaultImageResizeOptions"), v12, v11, width, height);

}

- (void)asyncImageForKey:(id)a3 size:(CGSize)a4 resizeOptions:(int)a5 modifier:(id)a6 completionHandler:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29[3];
  int v30;
  id location;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a6;
  v15 = a7;
  objc_initWeak(&location, self);
  -[IMImageStore fetchOperationQueue](self, "fetchOperationQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB34C8];
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __79__IMImageStore_asyncImageForKey_size_resizeOptions_modifier_completionHandler___block_invoke;
  v25 = &unk_1EA0C6288;
  objc_copyWeak(v29, &location);
  v18 = v13;
  v26 = v18;
  v29[1] = *(id *)&width;
  v29[2] = *(id *)&height;
  v30 = a5;
  v19 = v14;
  v27 = v19;
  v20 = v15;
  v28 = v20;
  objc_msgSend(v17, "blockOperationWithBlock:", &v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addOperation:", v21, v22, v23, v24, v25);

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);

}

void __79__IMImageStore_asyncImageForKey_size_resizeOptions_modifier_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "imageForKey:size:resizeOptions:modifier:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 80), *(_QWORD *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 48))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__IMImageStore_asyncImageForKey_size_resizeOptions_modifier_completionHandler___block_invoke_2;
    block[3] = &unk_1EA0C6238;
    v7 = *(id *)(a1 + 48);
    v5 = v3;
    v6 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __79__IMImageStore_asyncImageForKey_size_resizeOptions_modifier_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)asyncImageForKey:(id)a3 squareDimension:(double)a4 cacheKeyModifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__IMImageStore_asyncImageForKey_squareDimension_cacheKeyModifier_completionHandler___block_invoke;
  v12[3] = &unk_1EA0C62B0;
  v13 = v10;
  v11 = v10;
  -[IMImageStore asyncImageURLForKey:squareDimension:cacheKeyModifier:completionHandler:](self, "asyncImageURLForKey:squareDimension:cacheKeyModifier:completionHandler:", a3, a5, v12, a4);

}

void __84__IMImageStore_asyncImageForKey_squareDimension_cacheKeyModifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v5 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(a2, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithContentsOfFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v7, v9);

}

- (void)asyncImageURLForKey:(id)a3 squareDimension:(double)a4 cacheKeyModifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  double v31;
  _QWORD aBlock[4];
  id v33;
  id v34;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__IMImageStore_asyncImageURLForKey_squareDimension_cacheKeyModifier_completionHandler___block_invoke;
  aBlock[3] = &unk_1EA0C62D8;
  v14 = v12;
  v34 = v14;
  v15 = v10;
  v33 = v15;
  v16 = _Block_copy(aBlock);
  -[IMImageStore _keyForSize:baseKey:modifier:](self, "_keyForSize:baseKey:modifier:", v15, 0, a4, a4);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v17, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[IMImageStore fetchOperationQueue](self, "fetchOperationQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CB34C8];
  v26[0] = v13;
  v26[1] = 3221225472;
  v26[2] = __87__IMImageStore_asyncImageURLForKey_squareDimension_cacheKeyModifier_completionHandler___block_invoke_2;
  v26[3] = &unk_1EA0C6328;
  v26[4] = self;
  v27 = v17;
  v29 = v15;
  v30 = v16;
  v28 = v18;
  v31 = a4;
  v21 = v15;
  v22 = v18;
  v23 = v16;
  v24 = v17;
  objc_msgSend(v20, "blockOperationWithBlock:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addOperation:", v25);

}

void __87__IMImageStore_asyncImageURLForKey_squareDimension_cacheKeyModifier_completionHandler___block_invoke_41(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "hasItemForKey:", a1[4]))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "pathForKey:", a1[4]);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = (id)v2;
  (*(void (**)(void))(a1[5] + 16))();

}

- (void)asyncImageURLForKey:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;

  v6 = a3;
  v7 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3042000000;
  v17[3] = __Block_byref_object_copy__42;
  v17[4] = __Block_byref_object_dispose__43;
  objc_initWeak(&v18, self);
  -[IMImageStore fetchOperationQueue](self, "fetchOperationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB34C8];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__IMImageStore_asyncImageURLForKey_completionHandler___block_invoke;
  v13[3] = &unk_1EA0C6350;
  v16 = v17;
  v10 = v6;
  v14 = v10;
  v11 = v7;
  v15 = v11;
  objc_msgSend(v9, "blockOperationWithBlock:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v12);

  _Block_object_dispose(v17, 8);
  objc_destroyWeak(&v18);

}

void __54__IMImageStore_asyncImageURLForKey_completionHandler___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1[6] + 8) + 40));
  objc_msgSend(WeakRetained, "diskCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageUrlForKey:", a1[4]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = a1[5];
  if (v4)
    (*(void (**)(uint64_t, id, _QWORD))(v4 + 16))(v4, v5, a1[4]);

}

- (void)clearCache
{
  void *v3;
  id v4;

  -[IMImageStore memoryCache](self, "memoryCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[IMImageStore diskCache](self, "diskCache");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearCache");

}

- (BOOL)hasItemForKey:(id)a3 size:(CGSize)a4
{
  return -[IMImageStore hasItemForKey:size:modifier:](self, "hasItemForKey:size:modifier:", a3, 0, a4.width, a4.height);
}

- (BOOL)hasItemForKey:(id)a3 size:(CGSize)a4 modifier:(id)a5
{
  CGFloat height;
  CGFloat width;
  NSObject *v8;
  IMImageStore *v9;
  void *v10;
  int v12;
  CGFloat v13;
  __int16 v14;
  CGFloat v15;
  uint64_t v16;

  height = a4.height;
  width = a4.width;
  v16 = *MEMORY[0x1E0C80C00];
  if (a4.width < 0.00000011920929 || a4.height < 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "defaultCategory", a3, a5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 134218240;
      v13 = width;
      v14 = 2048;
      v15 = height;
      _os_log_impl(&dword_1DA478000, v8, OS_LOG_TYPE_ERROR, "Invalid arguments. Size must be non-zero in both dimensions. (width: %f, height: %f)", (uint8_t *)&v12, 0x16u);
    }

    return 0;
  }
  else
  {
    v9 = self;
    -[IMImageStore _keyForSize:baseKey:modifier:](self, "_keyForSize:baseKey:modifier:", a3, a5, a4.width, a4.height);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = -[IMImageStore hasItemForKey:](v9, "hasItemForKey:", v10);

    return (char)v9;
  }
}

- (BOOL)hasItemForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[IMImageStore memoryCache](self, "memoryCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = 1;
    }
    else
    {
      -[IMImageStore diskCache](self, "diskCache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "hasItemForKey:", v4);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)removeItemsWithPrefx:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    -[IMImageStore memoryCache](self, "memoryCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectsForKeyWithPrefix:", v6);

    -[IMImageStore diskCache](self, "diskCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeItemsWithPrefx:", v6);

  }
}

- (void)removeItemForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[IMImageStore memoryCache](self, "memoryCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

  -[IMImageStore diskCache](self, "diskCache");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeItemForKey:", v4);

}

- (BOOL)isEmpty
{
  void *v2;
  char v3;

  -[IMImageStore diskCache](self, "diskCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEmpty");

  return v3;
}

- (id)_keyForSize:(CGSize)a3 baseKey:(id)a4
{
  return -[IMImageStore _keyForSize:baseKey:modifier:](self, "_keyForSize:baseKey:modifier:", a4, 0, a3.width, a3.height);
}

- (id)_keyForSize:(CGSize)a3 baseKey:(id)a4 modifier:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint8_t buf[4];
  IMImageStore *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;
  CGSize v27;
  CGSize v28;

  height = a3.height;
  width = a3.width;
  v26 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "defaultCategory");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      v14 = 0;
      goto LABEL_13;
    }
    v27.width = width;
    v27.height = height;
    NSStringFromCGSize(v27);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v19 = self;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_1DA478000, v11, OS_LOG_TYPE_ERROR, "Invalid baseKey encountered in call to -[%@ _keyForSize:%@ baseKey:%@ modifier:%@]", buf, 0x2Au);
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-{%f,%f}"), v9, *(_QWORD *)&width, *(_QWORD *)&height);
  v11 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "hasModifications"))
  {
    objc_msgSend(v10, "modificationCacheKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      -[NSObject stringByAppendingFormat:](v11, "stringByAppendingFormat:", CFSTR("-%@"), v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = v13;
      goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x1E0D7F1C0], "defaultCategory");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v28.width = width;
      v28.height = height;
      NSStringFromCGSize(v28);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v19 = self;
      v20 = 2112;
      v21 = v16;
      v22 = 2112;
      v23 = v9;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_1DA478000, v15, OS_LOG_TYPE_ERROR, "Invalid modifier cache key in call to -[%@ _keyForSize:%@ baseKey:%@ modifier:%@]", buf, 0x2Au);

    }
    goto LABEL_11;
  }
LABEL_5:
  v11 = v11;
  v14 = v11;
LABEL_13:

  return v14;
}

- (void)memoryWarning
{
  id v2;

  -[IMImageStore memoryCache](self, "memoryCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)_addImage:(id)a3 toMemoryCacheWithKey:(id)a4
{
  id v6;
  id v7;
  CGImage *v8;
  size_t BytesPerRow;
  size_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (!-[IMImageStore disableMemoryCache](self, "disableMemoryCache"))
  {
    v7 = objc_retainAutorelease(v12);
    v8 = (CGImage *)objc_msgSend(v7, "CGImage");
    BytesPerRow = CGImageGetBytesPerRow(v8);
    v10 = CGImageGetHeight(v8) * BytesPerRow;
    -[IMImageStore memoryCache](self, "memoryCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:cost:", v7, v6, v10);

  }
}

- (id)_loadDiskCacheImageForKey:(id)a3 expectImageExists:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[IMImageStore diskCache](self, "diskCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1DA478000, v9, OS_LOG_TYPE_DEFAULT, "_loadDiskCacheImageForKey: successfully loaded image forKey: %@", (uint8_t *)&v12, 0xCu);
    }

    -[IMImageStore _addImage:toMemoryCacheWithKey:](self, "_addImage:toMemoryCacheWithKey:", v8, v6);
  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D7F1C0], "imageCache");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1DA478000, v10, OS_LOG_TYPE_ERROR, "_loadDiskCacheImageForKey: failed to load image forKey: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  return v8;
}

- (void)performWhenURLAvailableForImageForKey:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;
  _QWORD aBlock[4];
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__IMImageStore_performWhenURLAvailableForImageForKey_block___block_invoke;
  aBlock[3] = &unk_1EA0C62B0;
  v9 = v7;
  v20 = v9;
  v10 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  -[IMImageStore diskCache](self, "diskCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __60__IMImageStore_performWhenURLAvailableForImageForKey_block___block_invoke_2;
  v14[3] = &unk_1EA0C6378;
  objc_copyWeak(&v17, &location);
  v12 = v10;
  v16 = v12;
  v13 = v6;
  v15 = v13;
  objc_msgSend(v11, "performWhenURLAvailableForImageForKey:block:", v13, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

uint64_t __60__IMImageStore_performWhenURLAvailableForImageForKey_block___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __60__IMImageStore_performWhenURLAvailableForImageForKey_block___block_invoke_2(uint64_t a1, char a2)
{
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && (a2 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "diskCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageUrlForKey:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)invalidateImageForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[IMImageStore fetchOperationQueue](self, "fetchOperationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__IMImageStore_invalidateImageForKey___block_invoke;
  v7[3] = &unk_1EA0C63A0;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __38__IMImageStore_invalidateImageForKey___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "onQueueInvalidateImageForKey:", *(_QWORD *)(a1 + 32));

}

- (void)onQueueInvalidateImageForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[IMImageStore diskCache](self, "diskCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageUrlForKey:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    -[IMImageStore invalidateImageAtURL:](self, "invalidateImageAtURL:", v7);
    v6 = v7;
  }

}

- (void)invalidateImageAtURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("invalidated"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeToURL:atomically:", v4, 0);

}

- (id)alternativeSize
{
  return self->_alternativeSize;
}

- (void)setAlternativeSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)maxImageDimensionInPixels
{
  return self->_maxImageDimensionInPixels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskCache, 0);
  objc_storeStrong((id *)&self->_memoryCache, 0);
  objc_storeStrong((id *)&self->_fetchOperationQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_alternativeSize, 0);
}

@end
