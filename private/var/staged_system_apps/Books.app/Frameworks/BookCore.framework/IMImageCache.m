@implementation IMImageCache

+ (id)defaultCache
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_31454;
  block[3] = &unk_28B8C8;
  block[4] = a1;
  if (qword_30D548 != -1)
    dispatch_once(&qword_30D548, block);
  return (id)qword_30D550;
}

- (IMImageCache)initWithIdentifier:(id)a3 basePath:(id)a4 memorySize:(int64_t)a5
{
  id v8;
  id v9;
  IMImageCache *v10;
  IMMemoryCache *v11;
  IMMemoryCache *memoryCache;
  id v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *persistentCachePath;
  dispatch_queue_attr_t v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *persistenceQueue;
  void *v24;
  void *v25;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)IMImageCache;
  v10 = -[IMImageCache init](&v27, "init");
  if (v10)
  {
    v11 = objc_alloc_init(IMMemoryCache);
    memoryCache = v10->_memoryCache;
    v10->_memoryCache = v11;

    -[IMMemoryCache setTotalCostLimit:](v10->_memoryCache, "setTotalCostLimit:", a5);
    v13 = objc_alloc_init((Class)NSFileManager);
    for (i = 0; i != 3; ++i)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ic-%@-%lu.cache"), v8, i));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v15));

      if (objc_msgSend(v13, "fileExistsAtPath:", v16))
        objc_msgSend(v13, "removeItemAtPath:error:", v16, 0);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ic-%@-%lu.cache"), v8, 3));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v17));
    persistentCachePath = v10->_persistentCachePath;
    v10->_persistentCachePath = (NSString *)v18;

    v20 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = dispatch_queue_create("com.apple.iBooksX.IMImageCache.persistence", v21);
    persistenceQueue = v10->_persistenceQueue;
    v10->_persistenceQueue = (OS_dispatch_queue *)v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[IMPersistentCacheManager sharedInstance](IMPersistentCacheManager, "sharedInstance"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "cacheForPath:maxSize:", v10->_persistentCachePath, 0));
    -[IMImageCache setPersistentCache:](v10, "setPersistentCache:", v25);

  }
  return v10;
}

- (IMImageCache)initWithIdentifier:(id)a3 memorySize:(int64_t)a4
{
  id v6;
  void *v7;
  IMImageCache *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication applicationCacheDirectory](UIApplication, "applicationCacheDirectory"));
  v8 = -[IMImageCache initWithIdentifier:basePath:memorySize:](self, "initWithIdentifier:basePath:memorySize:", v6, v7, a4);

  return v8;
}

- (void)dealloc
{
  void *v3;
  IMPersistentCache *persistentCache;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMPersistentCacheManager sharedInstance](IMPersistentCacheManager, "sharedInstance"));
  objc_msgSend(v3, "purgeFromCache:", self->_persistentCachePath);

  persistentCache = self->_persistentCache;
  self->_persistentCache = 0;

  v5.receiver = self;
  v5.super_class = (Class)IMImageCache;
  -[IMImageCache dealloc](&v5, "dealloc");
}

- (void)setImage:(id)a3 forKey:(id)a4
{
  if (self->_defaultType)
    -[IMImageCache setImage:forKey:type:](self, "setImage:forKey:type:", a3, a4, self->_defaultType);
  else
    -[IMImageCache setImage:forKey:type:](self, "setImage:forKey:type:", a3, a4, CFSTR("image/png"));
}

- (void)setImage:(id)a3 forKey:(id)a4 type:(id)a5
{
  -[IMImageCache setImage:forKey:type:persist:](self, "setImage:forKey:type:persist:", a3, a4, a5, 1);
}

- (void)setImage:(id)a3 forKey:(id)a4 type:(id)a5 persist:(BOOL)a6 properties:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *i;
  CGImage *v23;
  size_t BytesPerRow;
  IMImageCacheObject *v25;
  IMImageCacheObject *v26;
  NSObject *v27;
  _BOOL4 v28;
  IMImageCache *v29;
  void *v30;
  void *v31;
  _QWORD block[5];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  IMImageCacheObject *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (v12)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "im_CGImages"));
    if (objc_msgSend(v16, "count"))
    {
      v28 = v8;
      v29 = self;
      v30 = v15;
      v31 = v14;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v18)
      {
        v19 = v18;
        v20 = 0;
        v21 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(_QWORD *)v40 != v21)
              objc_enumerationMutation(v17);
            v23 = *(CGImage **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
            BytesPerRow = CGImageGetBytesPerRow(v23);
            v20 += CGImageGetHeight(v23) * BytesPerRow;
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        }
        while (v19);
      }
      else
      {
        v20 = 0;
      }

      v25 = [IMImageCacheObject alloc];
      objc_msgSend(v12, "size");
      v26 = -[IMImageCacheObject initWithImageRefs:imageSize:](v25, "initWithImageRefs:imageSize:", v17);
      -[IMImageCacheObject setPersistedToDisk:](v26, "setPersistedToDisk:", !v28);
      -[IMMemoryCache setObject:forKey:cost:](v29->_memoryCache, "setObject:forKey:cost:", v26, v13, v20);
      v15 = v30;
      v14 = v31;
      if (v28)
      {
        v27 = objc_claimAutoreleasedReturnValue(-[IMImageCache persistenceQueue](v29, "persistenceQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_31A54;
        block[3] = &unk_28CCF8;
        block[4] = v29;
        v33 = v13;
        v34 = v17;
        v35 = v31;
        v36 = v12;
        v37 = v30;
        v38 = v26;
        dispatch_async(v27, block);

      }
    }

  }
}

- (void)setImage:(id)a3 forKey:(id)a4 type:(id)a5 persist:(BOOL)a6
{
  -[IMImageCache setImage:forKey:type:persist:properties:](self, "setImage:forKey:type:persist:properties:", a3, a4, a5, a6, 0);
}

- (void)flushMemoryCache
{
  -[IMMemoryCache removeAllObjects](self->_memoryCache, "removeAllObjects");
}

- (void)flushPersistentCache
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[IMImageCache persistentCache](self, "persistentCache"));
  objc_msgSend(v2, "clear");

}

- (void)flushAllCaches
{
  -[IMImageCache flushMemoryCache](self, "flushMemoryCache");
  -[IMImageCache flushPersistentCache](self, "flushPersistentCache");
}

- (void)removeGenericImagesWithRootKey:(id)a3
{
  IMMemoryCache *memoryCache;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  memoryCache = self->_memoryCache;
  v5 = a3;
  -[IMMemoryCache removeObjectsForKeyWithPrefix:andSuffix:](memoryCache, "removeObjectsForKeyWithPrefix:andSuffix:", v5, CFSTR("generic"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMImageCache persistentCache](self, "persistentCache"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%%"), v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%%%@"), CFSTR("generic"), v7));
  v10[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  objc_msgSend(v6, "deleteItemsWithAllKeysContaining:", v9);

}

- (void)removeImageForKey:(id)a3
{
  -[IMImageCache removeImageForKey:synchronous:](self, "removeImageForKey:synchronous:", a3, 0);
}

- (void)removeImageForKey:(id)a3 synchronous:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v4 = a4;
  v6 = a3;
  -[IMMemoryCache removeObjectForKey:](self->_memoryCache, "removeObjectForKey:", v6);
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMImageCache persistentCache](self, "persistentCache"));
    objc_msgSend(v7, "deleteItemForKey:", v6);

  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[IMImageCache persistenceQueue](self, "persistenceQueue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_31D3C;
    v9[3] = &unk_28B808;
    v9[4] = self;
    v10 = v6;
    dispatch_async(v8, v9);

  }
}

- (void)removeImageWithRootKey:(id)a3
{
  IMMemoryCache *memoryCache;
  id v5;
  void *v6;
  id v7;

  if (a3)
  {
    memoryCache = self->_memoryCache;
    v5 = a3;
    -[IMMemoryCache removeObjectsForKeyWithPrefix:](memoryCache, "removeObjectsForKeyWithPrefix:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue(-[IMImageCache persistentCache](self, "persistentCache"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%%"), v5));

    objc_msgSend(v7, "deleteItemsWithKeyLike:", v6);
  }
}

- (id)imageForKey:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMImageCache keyForSize:withBaseKey:](self, "keyForSize:withBaseKey:", v7, width, height));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMImageCache imageForKey:](self, "imageForKey:", v8));
  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMImageCache imageForKey:](self, "imageForKey:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "im_imageWithSize:preserveAspectRatio:", 1, width, height));

    -[IMImageCache setImage:forKey:](self, "setImage:forKey:", v9, v8);
  }

  return v9;
}

- (id)imageForKey:(id)a3 size:(CGSize)a4 resizeOptions:(int)a5
{
  uint64_t v5;
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = *(_QWORD *)&a5;
  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMImageCache keyForSize:withBaseKey:](self, "keyForSize:withBaseKey:", v9, width, height));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMImageCache imageForKey:](self, "imageForKey:", v10));
  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IMImageCache imageForKey:](self, "imageForKey:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "im_imageWithSize:options:", v5, width, height));

    -[IMImageCache setImage:forKey:](self, "setImage:forKey:", v11, v10);
  }

  return v11;
}

- (void)imageForKey:(id)a3 completionBlock:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    v10 = &_dispatch_main_q;
    v11 = &_dispatch_main_q;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_32068;
  block[3] = &unk_28B750;
  block[4] = self;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_async(v10, block);

}

- (void)imageForKey:(id)a3 size:(CGSize)a4 completionBlock:(id)a5 queue:(id)a6
{
  -[IMImageCache imageForKey:size:completionBlock:queue:options:](self, "imageForKey:size:completionBlock:queue:options:", a3, a5, a6, 1, a4.width, a4.height);
}

- (void)imageForKey:(id)a3 size:(CGSize)a4 completionBlock:(id)a5 queue:(id)a6 options:(int)a7
{
  double height;
  double width;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  void *v21;
  dispatch_queue_global_t global_queue;
  _QWORD v23[4];
  id v24;
  IMImageCache *v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  double v30;
  double v31;
  int v32;
  _QWORD block[4];
  id v34;
  id v35;
  NSObject *v36;
  double v37;
  double v38;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  if (!v15)
  {
    v15 = &_dispatch_main_q;
    v16 = &_dispatch_main_q;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[IMImageCache keyForSize:withBaseKey:](self, "keyForSize:withBaseKey:", v13, width, height));
  v18 = objc_claimAutoreleasedReturnValue(-[IMImageCache _fetchImageForKey:](self, "_fetchImageForKey:", v17));
  if (!v18)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[IMImageCache _fetchImageForKey:](self, "_fetchImageForKey:", v13));
    global_queue = dispatch_get_global_queue(-2, 0);
    v20 = objc_claimAutoreleasedReturnValue(global_queue);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_322E0;
    v23[3] = &unk_28CD48;
    v19 = v21;
    v30 = width;
    v31 = height;
    v32 = a7;
    v24 = v19;
    v25 = self;
    v26 = v17;
    v29 = v14;
    v27 = v15;
    v28 = v13;
    dispatch_async(v20, v23);

    goto LABEL_7;
  }
  v19 = (id)v18;
  if (v14)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_322C8;
    block[3] = &unk_28CD20;
    v36 = v14;
    v19 = v19;
    v34 = v19;
    v35 = v13;
    v37 = width;
    v38 = height;
    dispatch_async(v15, block);

    v20 = v36;
LABEL_7:

  }
}

- (void)addImageFromURL:(id)a3 completionBlock:(id)a4 queue:(id)a5
{
  -[IMImageCache addImageFromURL:size:completionBlock:queue:](self, "addImageFromURL:size:completionBlock:queue:", a3, a4, a5, CGSizeZero.width, CGSizeZero.height);
}

- (void)addImageFromURL:(id)a3 size:(CGSize)a4 completionBlock:(id)a5 queue:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  id v13;
  id v14;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "absoluteString"));
  -[IMImageCache addImageFromURL:key:size:completionBlock:queue:](self, "addImageFromURL:key:size:completionBlock:queue:", v13, v14, v12, v11, width, height);

}

- (void)addImageFromURL:(id)a3 key:(id)a4 size:(CGSize)a5 completionBlock:(id)a6 queue:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  void (**v15)(id, void *);
  id v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *downloadQueue;
  OS_dispatch_queue *v24;
  OS_dispatch_queue *v25;
  _QWORD block[4];
  id v27;
  IMImageCache *v28;
  id v29;
  id v30;
  id v31;
  void (**v32)(id, void *);
  double v33;
  double v34;
  BOOL v35;

  height = a5.height;
  width = a5.width;
  v13 = a3;
  v14 = a4;
  v15 = (void (**)(id, void *))a6;
  v16 = a7;
  v17 = objc_claimAutoreleasedReturnValue(-[IMImageCache keyForSize:withBaseKey:](self, "keyForSize:withBaseKey:", v14, width, height));
  v18 = (void *)v17;
  v19 = CGSizeZero.height != height || CGSizeZero.width != width;
  if (v19)
    v20 = (void *)v17;
  else
    v20 = v14;
  v21 = v20;
  if (-[IMImageCache hasImageForKey:](self, "hasImageForKey:", v21))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[IMImageCache imageForKey:](self, "imageForKey:", v21));
    v15[2](v15, v22);

  }
  else
  {
    downloadQueue = self->_downloadQueue;
    if (!downloadQueue)
    {
      v24 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesmobile.imimagecache", 0);
      v25 = self->_downloadQueue;
      self->_downloadQueue = v24;

      downloadQueue = self->_downloadQueue;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_326A0;
    block[3] = &unk_28CD98;
    v27 = v13;
    v28 = self;
    v29 = v14;
    v35 = v19;
    v33 = width;
    v34 = height;
    v30 = v18;
    v31 = v16;
    v32 = v15;
    dispatch_async(downloadQueue, block);

  }
}

- (unint64_t)imageDataSizeForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMImageCache persistentCache](self, "persistentCache"));
  v6 = objc_msgSend(v5, "resourceSizeForKey:", v4);

  return (unint64_t)v6;
}

- (double)compareImage:(id)a3 withImage:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v16;
  double v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  _BYTE v22[1024];
  _BYTE v23[1024];

  v6 = a3;
  v7 = a4;
  if (v6 == v7)
  {
    v13 = 1.0;
  }
  else
  {
    objc_msgSend(v6, "size");
    v9 = v8;
    v11 = v10;
    objc_msgSend(v7, "size");
    v13 = 0.0;
    if (v9 == v14 && v11 == v12)
    {
      -[IMImageCache _histogramForImage:result:size:](self, "_histogramForImage:result:size:", v6, v23, 256);
      -[IMImageCache _histogramForImage:result:size:](self, "_histogramForImage:result:size:", v7, v22, 256);
      v16 = 0;
      v17 = 0.0;
      do
      {
        v18 = *(_DWORD *)&v23[v16];
        v19 = *(_DWORD *)&v22[v16];
        if (v18 == v19)
        {
          v17 = v17 + 1.0;
        }
        else
        {
          if (v18 <= v19)
            v20 = *(_DWORD *)&v22[v16];
          else
            v20 = *(_DWORD *)&v23[v16];
          if (v20)
          {
            if (v18 >= v19)
              v18 = *(_DWORD *)&v22[v16];
            v17 = v17 + (double)v18 / (double)v20;
          }
        }
        v16 += 4;
      }
      while (v16 != 1024);
      v13 = v17 * 0.00390625;
    }
  }

  return v13;
}

- (BOOL)hasImageForKey:(id)a3 withSize:(CGSize)a4
{
  IMImageCache *v4;
  void *v5;

  v4 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMImageCache keyForSize:withBaseKey:](self, "keyForSize:withBaseKey:", a3, a4.width, a4.height));
  LOBYTE(v4) = -[IMImageCache hasImageForKey:](v4, "hasImageForKey:", v5);

  return (char)v4;
}

- (BOOL)hasImageForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;

  v4 = a3;
  if (-[IMMemoryCache hasObjectForKey:](self->_memoryCache, "hasObjectForKey:", v4))
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMImageCache persistentCache](self, "persistentCache"));
    v5 = objc_msgSend(v6, "hasItemForKey:", v4);

  }
  return v5;
}

- (BOOL)hasFastImageForKey:(id)a3
{
  return -[IMMemoryCache hasObjectForKey:](self->_memoryCache, "hasObjectForKey:", a3);
}

- (void)getImageMetadataForKey:(id)a3 size:(CGSize *)a4 scale:(double *)a5
{
  id v8;
  void *v9;
  void *v10;
  float v11;
  CGFloat v12;
  void *v13;
  float v14;
  CGFloat v15;
  void *v16;
  float v17;
  id v18;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMImageCache persistentCache](self, "persistentCache"));
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metadataForKey:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("width")));
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("height")));
  objc_msgSend(v13, "floatValue");
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("scale")));
  objc_msgSend(v16, "floatValue");
  *a5 = v17;

  a4->width = v12;
  a4->height = v15;

}

- (id)_fetchImageForKey:(id)a3
{
  id v4;
  IMImageCacheObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  IMImageCacheObject *v10;
  uint64_t v12;
  CGSize v13;

  v4 = a3;
  v5 = (IMImageCacheObject *)objc_claimAutoreleasedReturnValue(-[IMMemoryCache objectForKey:](self->_memoryCache, "objectForKey:", v4));
  if (v5)
    goto LABEL_2;
  v13 = CGSizeZero;
  v12 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMImageCache persistentCache](self, "persistentCache"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "CGImagesForKey:size:resourceSize:", v4, &v13, &v12));

  if (!v9)
  {
    v5 = 0;
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  v10 = [IMImageCacheObject alloc];
  v5 = -[IMImageCacheObject initWithImageRefs:imageSize:](v10, "initWithImageRefs:imageSize:", v9, v13);
  -[IMImageCacheObject setPersistedToDisk:](v5, "setPersistedToDisk:", 1);
  -[IMMemoryCache setObject:forKey:cost:](self->_memoryCache, "setObject:forKey:cost:", v5, v4, v12);

  if (!v5)
    goto LABEL_7;
LABEL_2:
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMImageCacheObject imageRefs](v5, "imageRefs"));
  -[IMImageCacheObject imageSize](v5, "imageSize");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage im_imageWithCGImages:size:](UIImage, "im_imageWithCGImages:size:", v6));

LABEL_8:
  return v7;
}

- (id)genericKeyForSize:(CGSize)a3 withBaseKey:(id)a4
{
  return -[IMImageCache keyForSize:withBaseKey:suffix:](self, "keyForSize:withBaseKey:suffix:", a4, CFSTR("generic"), a3.width, a3.height);
}

- (id)keyForSize:(CGSize)a3 withBaseKey:(id)a4
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-{%f,%f}"), a4, *(_QWORD *)&a3.width, *(_QWORD *)&a3.height);
}

- (id)keyForSize:(CGSize)a3 withBaseKey:(id)a4 suffix:(id)a5
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-{%f,%f}-%@"), a4, *(_QWORD *)&a3.width, *(_QWORD *)&a3.height, a5);
}

- (void)_histogramForImage:(id)a3 result:(unsigned int *)a4 size:(unsigned int)a5
{
  CGImage *v6;
  unsigned __int8 *v7;
  CGColorSpace *DeviceRGB;
  CGContext *v9;
  unint64_t v10;
  unsigned int v11;
  BOOL v12;
  CGRect v13;

  v6 = (CGImage *)objc_msgSend(a3, "im_CGImage");
  v7 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x9C40uLL, 0x57251F39uLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v9 = CGBitmapContextCreate(v7, 0x64uLL, 0x64uLL, 8uLL, 0x190uLL, DeviceRGB, 5u);
  CGColorSpaceRelease(DeviceRGB);
  v13.size.width = 100.0;
  v13.origin.x = 0.0;
  v13.origin.y = 0.0;
  v13.size.height = 100.0;
  CGContextDrawImage(v9, v13, v6);
  bzero(a4, 0x400uLL);
  v10 = 0;
  do
  {
    v11 = (21846 * (v7[v10 + 1] + v7[v10] + v7[v10 + 2])) >> 16;
    ++a4[v11];
    v12 = v10 >= 0x9C3C;
    v10 += 4;
  }
  while (!v12);
  CGContextRelease(v9);
  free(v7);
}

- (NSString)defaultType
{
  return self->_defaultType;
}

- (void)setDefaultType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_dispatch_queue)persistenceQueue
{
  return self->_persistenceQueue;
}

- (void)setPersistenceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceQueue, a3);
}

- (IMPersistentCache)persistentCache
{
  return (IMPersistentCache *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPersistentCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentCache, 0);
  objc_storeStrong((id *)&self->_persistenceQueue, 0);
  objc_storeStrong((id *)&self->_defaultType, 0);
  objc_storeStrong((id *)&self->_downloadQueue, 0);
  objc_storeStrong((id *)&self->_persistentCachePath, 0);
  objc_storeStrong((id *)&self->_memoryCache, 0);
}

@end
