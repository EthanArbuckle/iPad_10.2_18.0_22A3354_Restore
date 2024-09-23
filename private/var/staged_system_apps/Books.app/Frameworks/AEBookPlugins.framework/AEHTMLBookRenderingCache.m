@implementation AEHTMLBookRenderingCache

- (Class)operationClass
{
  return (Class)objc_opt_class(IMRenderingCacheOperation);
}

- (AEHTMLBookRenderingCache)initWithIdentifier:(id)a3
{
  AEHTMLBookRenderingCache *v3;
  NSOperationQueue *v4;
  NSOperationQueue *accessQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AEHTMLBookRenderingCache;
  v3 = -[AEHTMLBookRenderingCache initWithIdentifier:memorySize:](&v7, "initWithIdentifier:memorySize:", a3, 0x80000);
  if (v3)
  {
    v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    accessQueue = v3->_accessQueue;
    v3->_accessQueue = v4;

    -[NSOperationQueue setName:](v3->_accessQueue, "setName:", CFSTR("com.apple.itunesmobile.immemorycache"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v3->_accessQueue, "setMaxConcurrentOperationCount:", 1);
  }
  return v3;
}

+ (void)purgeCacheForIdentifier:(id)a3
{
  id v4;
  Class v5;
  id v6;

  v4 = a3;
  objc_opt_class(a1);
  v6 = objc_msgSend([v5 alloc], "initWithIdentifier:memorySize:", v4, 0);

  objc_msgSend(v6, "clear");
}

- (id)imageForSize:(CGSize)a3 data:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v11;
  NSOperationQueue *accessQueue;
  void *v13;
  id v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  uint64_t *v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_C9AA8;
  v28 = sub_C9AB8;
  v29 = 0;
  if (v7)
  {
    if (width >= 16.0 && height >= 16.0)
    {
      v16 = _NSConcreteStackBlock;
      v17 = 3221225472;
      v18 = sub_C9AC0;
      v19 = &unk_1C12D8;
      v22 = width;
      v23 = height;
      v20 = v7;
      v21 = &v24;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v16));
      accessQueue = self->_accessQueue;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v11, v16, v17, v18, v19));
      -[NSOperationQueue addOperations:waitUntilFinished:](accessQueue, "addOperations:waitUntilFinished:", v13, 1);

      v9 = (void *)v25[5];
    }
  }
  v14 = v9;
  _Block_object_dispose(&v24, 8);

  return v14;
}

- (id)findRenderingCacheOperationInQueue:(id)a3 withStorageKey:(id)a4 target:(id)a5 selector:(SEL)a6 context:(id)a7
{
  id v9;
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  unsigned __int8 v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v9 = a3;
  v10 = a4;
  v11 = -[AEHTMLBookRenderingCache operationClass](self, "operationClass");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "operations"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v16);
        if (v17 && (objc_opt_isKindOfClass(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v16), v11) & 1) != 0)
        {
          v18 = v17;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "storageKey", (_QWORD)v22));
          if (objc_msgSend(v19, "isEqualToString:", v10))
          {
            v20 = objc_msgSend(v18, "isCancelled");

            if ((v20 & 1) == 0)
              goto LABEL_16;
          }
          else
          {

          }
        }
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }
  v18 = 0;
LABEL_16:

  return v18;
}

- (id)_fetchImageForKey:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CGImage *v13;
  CGImage *v14;
  double v15;
  double v16;
  CGDataProvider *DataProvider;
  CFDataRef v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  if (width >= 100.0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEHTMLBookRenderingCache memoryCache](self, "memoryCache"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v7));

    if (v8)
      goto LABEL_12;
    v24 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMPersistentCacheManager sharedInstance](IMPersistentCacheManager, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEHTMLBookRenderingCache persistentCachePath](self, "persistentCachePath"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cacheForPath:maxSize:", v11, 0));

    if (-[AEHTMLBookRenderingCache serializeFormat](self, "serializeFormat") == 2)
    {
      NSLog(CFSTR("Getting Image for key %@ from persistent cache"), v7);
      v13 = (CGImage *)objc_msgSend(v12, "copyCGImageForKey:resourceSize:", v7, &v24);
      if (!v13)
      {

        v8 = 0;
        goto LABEL_12;
      }
      v14 = v13;
      v15 = (double)CGImageGetWidth(v13);
      v16 = (double)CGImageGetHeight(v14);
      DataProvider = CGImageGetDataProvider(v14);
      v18 = CGDataProviderCopyData(DataProvider);
      +[BKPictureBookViewGeometry imageSizeForSize:](BKPictureBookViewGeometry, "imageSizeForSize:", v15, v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEHTMLBookRenderingCache imageForSize:data:](self, "imageForSize:data:", v18));
      CFRelease(v18);
      CGImageRelease(v14);
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dataForKey:", v7));
      v24 = objc_msgSend(v19, "length");
      +[BKPictureBookViewGeometry imageSizeForSize:](BKPictureBookViewGeometry, "imageSizeForSize:", width, height);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEHTMLBookRenderingCache imageForSize:data:](self, "imageForSize:data:", v19));

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMPersistentCacheManager sharedInstance](IMPersistentCacheManager, "sharedInstance"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[AEHTMLBookRenderingCache persistentCachePath](self, "persistentCachePath"));
    objc_msgSend(v20, "purgeFromCache:", v21);

    if (v8)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[AEHTMLBookRenderingCache memoryCache](self, "memoryCache"));
      objc_msgSend(v22, "setObject:forKey:cost:", v8, v7, v24);

      goto LABEL_12;
    }

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEHTMLBookRenderingCache fetchImageForKey:](self, "fetchImageForKey:", v7));
LABEL_12:

  return v8;
}

- (id)_keyForAsset:(id)a3 size:(CGSize)a4 pageNumber:(int64_t)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEHTMLBookRenderingCache keyPrefixForPage:](self, "keyPrefixForPage:", a5));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "assetID"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEHTMLBookRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v11, v10, width, height));
  return v12;
}

- (void)resetPrioritiesForPageNumber:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  if ((unint64_t)(a3 - 1) <= 0x7FFFFFFFFFFFFFFDLL)
  {
    v5 = objc_autoreleasePoolPush();
    -[AEHTMLBookRenderingCache primaryImageSize](self, "primaryImageSize");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEHTMLBookRenderingCache renderingCacheOperationsForSize:](self, "renderingCacheOperationsForSize:"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v12 = objc_msgSend(v11, "pageNumber");
          if (a3 - (uint64_t)v12 >= 0)
            v13 = a3 - (_QWORD)v12;
          else
            v13 = (unint64_t)v12 - a3;
          if ((unint64_t)(a3 - (_QWORD)v12) >= 2)
            v14 = 4;
          else
            v14 = 8;
          if (v13 >= 4)
            v15 = -4;
          else
            v15 = v14;
          objc_msgSend(v11, "setQueuePriority:", v15);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    objc_autoreleasePoolPop(v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
