@implementation PRLikenessCache

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__PRLikenessCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

void __33__PRLikenessCache_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

+ (id)_applicationCacheDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_staticRepresentationCacheURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(a1, "_applicationCacheDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:relativeToURL:", CFSTR(".persona"), 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)_ensureExistenceOfDirectory:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v11);

  v7 = v11;
  if (v7)
    v8 = 0;
  else
    v8 = v6;
  if (!v8)
  {
    _PRGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "+[PRLikenessCache _ensureExistenceOfDirectory:]";
      v14 = 1024;
      v15 = 101;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_20AE0A000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) @\"Failed to create cache directory: %@\", buf, 0x1Cu);
    }

  }
  return v8;
}

- (PRLikenessCache)init
{
  PRLikenessCache *v2;
  NSCache *v3;
  NSCache *inMemoryCache;
  uint64_t v5;
  NSURL *cacheDirectory;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *cacheLookupQueue;
  NSObject *v10;
  _QWORD block[4];
  PRLikenessCache *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PRLikenessCache;
  v2 = -[PRLikenessCache init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    inMemoryCache = v2->_inMemoryCache;
    v2->_inMemoryCache = v3;

    -[NSCache setName:](v2->_inMemoryCache, "setName:", CFSTR("com.apple.persona.cache"));
    -[NSCache setTotalCostLimit:](v2->_inMemoryCache, "setTotalCostLimit:", 2621440);
    objc_msgSend((id)objc_opt_class(), "_staticRepresentationCacheURL");
    v5 = objc_claimAutoreleasedReturnValue();
    cacheDirectory = v2->_cacheDirectory;
    v2->_cacheDirectory = (NSURL *)v5;

    +[PRLikenessCache _ensureExistenceOfDirectory:](PRLikenessCache, "_ensureExistenceOfDirectory:", v2->_cacheDirectory);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.persona.cache", v7);
    cacheLookupQueue = v2->_cacheLookupQueue;
    v2->_cacheLookupQueue = (OS_dispatch_queue *)v8;

    *(_WORD *)&v2->_useMemory = 1;
    v2->_renderIfNeeded = 1;
    dispatch_get_global_queue(9, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __23__PRLikenessCache_init__block_invoke;
    block[3] = &unk_24C3CEFE8;
    v13 = v2;
    dispatch_async(v10, block);

  }
  return v2;
}

BOOL __23__PRLikenessCache_init__block_invoke(uint64_t a1)
{
  return +[PRLikenessCache _purgeOldCacheFilesInDirectory:](PRLikenessCache, "_purgeOldCacheFilesInDirectory:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

- (id)_cacheKeyForLikeness:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recipe");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_cn_SHA1String");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromPRLikenessCacheSize(objc_msgSend(v5, "cacheSize"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "circular");

  v12 = CFSTR("sqr");
  if (v11)
    v12 = CFSTR("cir");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@_%@_%@"), v7, v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_cacheURLForLikeness:(id)a3 context:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[PRLikenessCache _cacheKeyForLikeness:context:](self, "_cacheKeyForLikeness:context:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v5, CFSTR("png"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:](self->_cacheDirectory, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)imageForLikeness:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke;
  v19[3] = &unk_24C3CF010;
  v12 = v10;
  v20 = v12;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD32138](v19);
  objc_msgSend(v8, "uniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke_2;
    v16[3] = &unk_24C3CF038;
    v16[4] = self;
    v17 = v8;
    v18 = v9;
    -[PRLikenessCache _fetchFromMemory:context:renderBlock:completion:](self, "_fetchFromMemory:context:renderBlock:completion:", v17, v18, v16, v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "pr_errorWithCode:", -9021);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v15);

  }
}

uint64_t __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 16);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke_3;
  v8[3] = &unk_24C3CF088;
  v8[4] = v4;
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  v11 = v3;
  v7 = v3;
  dispatch_async(v6, v8);

}

void __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v5 = *(_QWORD *)(a1 + 48);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke_4;
  v8[3] = &unk_24C3CF038;
  v8[4] = v3;
  v9 = v2;
  v10 = *(id *)(a1 + 48);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke_5;
  v6[3] = &unk_24C3CF010;
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v3, "_fetchFromFilesystem:context:renderBlock:completion:", v9, v5, v8, v6);

}

uint64_t __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_renderImageForLikeness:context:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

void __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(25, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke_6;
  block[3] = &unk_24C3CF060;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __55__PRLikenessCache_imageForLikeness_context_completion___block_invoke_6(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_fetchFromMemory:(id)a3 context:(id)a4 renderBlock:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, id);
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  PRLikenessCache *v19;
  id v20;
  _QWORD v21[5];
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, id))a5;
  v13 = a6;
  if (-[PRLikenessCache useMemory](self, "useMemory"))
  {
    -[PRLikenessCache _cacheKeyForLikeness:context:](self, "_cacheKeyForLikeness:context:", v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __67__PRLikenessCache__fetchFromMemory_context_renderBlock_completion___block_invoke;
    v21[3] = &unk_24C3CF0B0;
    v21[4] = self;
    v22 = v14;
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __67__PRLikenessCache__fetchFromMemory_context_renderBlock_completion___block_invoke_2;
    v17[3] = &unk_24C3CF0D8;
    v18 = v11;
    v19 = self;
    v20 = v22;
    v16 = v22;
    -[PRLikenessCache _fetchWithReadBlock:writeBlock:renderBlock:completion:](self, "_fetchWithReadBlock:writeBlock:renderBlock:completion:", v21, v17, v12, v13);

  }
  else
  {
    v12[2](v12, v13);
  }

}

uint64_t __67__PRLikenessCache__fetchFromMemory_context_renderBlock_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", *(_QWORD *)(a1 + 40));
}

void __67__PRLikenessCache__fetchFromMemory_context_renderBlock_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(*(id *)(a1[5] + 8), "setObject:forKey:cost:", v4, a1[6], PRLikenessCacheSizeGetCost(objc_msgSend(v3, "cacheSize")));

}

- (void)_fetchFromFilesystem:(id)a3 context:(id)a4 renderBlock:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, id);
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, id))a5;
  v13 = a6;
  if (-[PRLikenessCache useFilesystem](self, "useFilesystem"))
  {
    -[PRLikenessCache _cacheURLForLikeness:context:](self, "_cacheURLForLikeness:context:", v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __71__PRLikenessCache__fetchFromFilesystem_context_renderBlock_completion___block_invoke;
    v19[3] = &unk_24C3CF100;
    v20 = v14;
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __71__PRLikenessCache__fetchFromFilesystem_context_renderBlock_completion___block_invoke_2;
    v17[3] = &unk_24C3CF128;
    v18 = v20;
    v16 = v20;
    -[PRLikenessCache _fetchWithReadBlock:writeBlock:renderBlock:completion:](self, "_fetchWithReadBlock:writeBlock:renderBlock:completion:", v19, v17, v12, v13);

  }
  else
  {
    v12[2](v12, v13);
  }

}

id __71__PRLikenessCache__fetchFromFilesystem_context_renderBlock_completion___block_invoke(uint64_t a1)
{
  return +[PRLikenessCache _imageAtURL:](PRLikenessCache, "_imageAtURL:", *(_QWORD *)(a1 + 32));
}

BOOL __71__PRLikenessCache__fetchFromFilesystem_context_renderBlock_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[PRLikenessCache _writeImage:toURL:](PRLikenessCache, "_writeImage:toURL:", a2, *(_QWORD *)(a1 + 32));
}

- (void)_renderImageForLikeness:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  if (-[PRLikenessCache renderIfNeeded](self, "renderIfNeeded"))
  {
    v11 = CGSizeFromPRLikenessCacheSize(objc_msgSend(v9, "cacheSize"));
    v13 = v12;
    objc_msgSend(v9, "scale");
    v15 = v14;
    v21[0] = CFSTR("PRLikenessSnapshotOptionCircular");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v9, "circular"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v16;
    v21[1] = CFSTR("PRLikenessSnapshotOptionForceDecode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v9, "forceDecode"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "snapshotWithSize:scale:options:", v18, v11, v13, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v10[2](v10, v19, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "pr_errorWithCode:", -9010);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v10)[2](v10, 0, v20);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "pr_errorWithCode:", -9018);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v10)[2](v10, 0, v19);
  }

}

- (void)_fetchWithReadBlock:(id)a3 writeBlock:(id)a4 renderBlock:(id)a5 completion:(id)a6
{
  id v9;
  void (**v10)(id, _QWORD *);
  void (**v11)(id, void *, _QWORD);
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  void (**v16)(id, void *, _QWORD);

  v9 = a4;
  v10 = (void (**)(id, _QWORD *))a5;
  v11 = (void (**)(id, void *, _QWORD))a6;
  (*((void (**)(id))a3 + 2))(a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v11[2](v11, v12, 0);
  }
  else if (v10)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __73__PRLikenessCache__fetchWithReadBlock_writeBlock_renderBlock_completion___block_invoke;
    v14[3] = &unk_24C3CF150;
    v15 = v9;
    v16 = v11;
    v10[2](v10, v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "pr_errorWithCode:", -9018);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v11)[2](v11, 0, v13);

  }
}

void __73__PRLikenessCache__fetchWithReadBlock_writeBlock_renderBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)_imageAtURL:(id)a3
{
  const __CFURL *v3;
  void *v4;
  void *v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  CGImageSource *v8;
  CGImageSource *v9;
  CGImageRef ImageAtIndex;
  CGImage *v11;
  void *v12;
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x24BDAC8D0];
  v3 = (const __CFURL *)a3;
  v4 = (void *)*MEMORY[0x24BDD9810];
  keys[0] = *(void **)MEMORY[0x24BDD97D0];
  keys[1] = v4;
  v5 = (void *)*MEMORY[0x24BDC1820];
  values[0] = *(void **)MEMORY[0x24BDBD268];
  values[1] = v5;
  v6 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v6)
  {
    v7 = v6;
    v8 = CGImageSourceCreateWithURL(v3, v6);
    if (v8)
    {
      v9 = v8;
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v8, 0, 0);
      if (ImageAtIndex)
      {
        v11 = ImageAtIndex;
        objc_msgSend(MEMORY[0x24BDF6AC8], "pr_imageWithCGImage:", ImageAtIndex);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        CGImageRelease(v11);
      }
      else
      {
        v12 = 0;
      }
      CFRelease(v9);
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)_writeImage:(id)a3 toURL:(id)a4
{
  const __CFURL *v5;
  uint64_t v6;
  CGImage *v7;
  CGImageDestination *v8;
  CGImageDestination *v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = (const __CFURL *)a4;
  v6 = objc_msgSend(a3, "pr_imageRef");
  if (!v6)
  {
    _PRGetLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315394;
      v16 = "+[PRLikenessCache _writeImage:toURL:]";
      v17 = 1024;
      v18 = 321;
      v13 = "%s (%d) @\"Failed to get imageRef from PRImage!\";
LABEL_12:
      _os_log_impl(&dword_20AE0A000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0x12u);
    }
LABEL_13:

    v10 = 0;
    goto LABEL_14;
  }
  v7 = (CGImage *)v6;
  v8 = CGImageDestinationCreateWithURL(v5, (CFStringRef)*MEMORY[0x24BDC1820], 0, 0);
  if (!v8)
  {
    _PRGetLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315394;
      v16 = "+[PRLikenessCache _writeImage:toURL:]";
      v17 = 1024;
      v18 = 329;
      v13 = "%s (%d) @\"Failed to create imageDestinationRef!\";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v9 = v8;
  CGImageDestinationAddImage(v8, v7, 0);
  v10 = CGImageDestinationFinalize(v9);
  if (!v10)
  {
    _PRGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315394;
      v16 = "+[PRLikenessCache _writeImage:toURL:]";
      v17 = 1024;
      v18 = 337;
      _os_log_impl(&dword_20AE0A000, v11, OS_LOG_TYPE_DEFAULT, "%s (%d) @\"Failed to finalize the image destination!\", (uint8_t *)&v15, 0x12u);
    }

  }
  CFRelease(v9);
LABEL_14:

  return v10;
}

+ (BOOL)_removeImageAtURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = objc_msgSend(v5, "removeItemAtURL:error:", v4, &v11);

  v7 = v11;
  if (v7)
    v8 = 0;
  else
    v8 = v6;
  if (!v8)
  {
    _PRGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "+[PRLikenessCache _removeImageAtURL:]";
      v14 = 1024;
      v15 = 355;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_20AE0A000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) @\"Failed to remove image file: %@\", buf, 0x1Cu);
    }

  }
  return v8;
}

+ (BOOL)_purgeOldCacheFilesInDirectory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  char v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;
  _QWORD v38[4];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDBCBD8];
  v38[0] = *MEMORY[0x24BDBCBD8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, v7, 1, &v30);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v30;

  if (!v9)
  {
    v25 = v4;
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -259200.0);
    v10 = objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = v8;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (!v13)
    {
      v11 = 1;
      goto LABEL_23;
    }
    v14 = v13;
    v15 = *(_QWORD *)v27;
    v11 = 1;
    while (1)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(a1, "_propertyValueForURL:forKey:", v17, v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (!v18)
        {
          _PRGetLogSystem();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v33 = "+[PRLikenessCache _purgeOldCacheFilesInDirectory:]";
            v34 = 1024;
            v35 = 379;
            v36 = 2112;
            v37 = v17;
            v21 = v20;
            v22 = "%s (%d) @\"File did not contain a last access date: %@\";
LABEL_17:
            _os_log_impl(&dword_20AE0A000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 0x1Cu);
          }
LABEL_18:

          v11 = 0;
          goto LABEL_19;
        }
        if (objc_msgSend(v18, "compare:", v10) == -1 && (objc_msgSend(a1, "_removeImageAtURL:", v17) & 1) == 0)
        {
          _PRGetLogSystem();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v33 = "+[PRLikenessCache _purgeOldCacheFilesInDirectory:]";
            v34 = 1024;
            v35 = 386;
            v36 = 2112;
            v37 = v17;
            v21 = v20;
            v22 = "%s (%d) @\"Failed to remove image file: %@\";
            goto LABEL_17;
          }
          goto LABEL_18;
        }
LABEL_19:

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (!v14)
      {
LABEL_23:

        v8 = v24;
        v4 = v25;
        v9 = 0;
        goto LABEL_24;
      }
    }
  }
  _PRGetLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v33 = "+[PRLikenessCache _purgeOldCacheFilesInDirectory:]";
    v34 = 1024;
    v35 = 368;
    v36 = 2112;
    v37 = v9;
    _os_log_impl(&dword_20AE0A000, v10, OS_LOG_TYPE_DEFAULT, "%s (%d) @\"Failed to enumerate contents of directory: %@\", buf, 0x1Cu);
  }
  v11 = 0;
LABEL_24:

  return v11 & 1;
}

+ (id)_propertyValueForURL:(id)a3 forKey:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;
  id v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v9 = 0;
  objc_msgSend(a3, "getResourceValue:forKey:error:", &v9, a4, &v8);
  v4 = v9;
  v5 = v8;
  if (v5)
  {
    _PRGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v11 = "+[PRLikenessCache _propertyValueForURL:forKey:]";
      v12 = 1024;
      v13 = 403;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_20AE0A000, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) @\"Failed to get property for file: %@\", buf, 0x1Cu);
    }

  }
  return v4;
}

- (NSURL)cacheDirectory
{
  return self->_cacheDirectory;
}

- (void)setCacheDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_cacheDirectory, a3);
}

- (BOOL)useMemory
{
  return self->_useMemory;
}

- (void)setUseMemory:(BOOL)a3
{
  self->_useMemory = a3;
}

- (BOOL)useFilesystem
{
  return self->_useFilesystem;
}

- (void)setUseFilesystem:(BOOL)a3
{
  self->_useFilesystem = a3;
}

- (BOOL)renderIfNeeded
{
  return self->_renderIfNeeded;
}

- (void)setRenderIfNeeded:(BOOL)a3
{
  self->_renderIfNeeded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDirectory, 0);
  objc_storeStrong((id *)&self->_cacheLookupQueue, 0);
  objc_storeStrong((id *)&self->_inMemoryCache, 0);
}

@end
