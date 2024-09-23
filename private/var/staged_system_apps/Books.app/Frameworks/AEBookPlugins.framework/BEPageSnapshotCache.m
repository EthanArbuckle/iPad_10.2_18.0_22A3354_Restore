@implementation BEPageSnapshotCache

- (id)persistentCacheFileName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BEPageSnapshotCache identifier](self, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v2, CFSTR("v20220201")));

  return v3;
}

+ (Class)operationClass
{
  return (Class)objc_opt_class(BEPageSnapshotCacheOperation);
}

- (BEPageSnapshotCache)initWithIdentifier:(id)a3 dataSource:(id)a4
{
  id v6;
  BEPageSnapshotCache *v7;
  BEPageSnapshotCache *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)BEPageSnapshotCache;
  v7 = -[AEHTMLBookRenderingCache initWithIdentifier:](&v10, "initWithIdentifier:", a3);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_dataSource, v6);

  return v8;
}

+ (void)setRestorationImageAppearance:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setInteger:forKey:", a3, BERestorationAssetAppearanceKey);

}

+ (void)setRestorationImageAssetID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setObject:forKey:", v3, BERestorationAssetIDKey);

}

+ (unint64_t)restorationImageAppearance
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "integerForKey:", BERestorationAssetAppearanceKey);

  return (unint64_t)v3;
}

+ (id)restorationImageAssetID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringForKey:", BERestorationAssetIDKey));

  return v3;
}

+ (id)restorationImageURL
{
  NSArray *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("currentLocationContentSnapshot.png")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v5));

  return v6;
}

- (id)snapshotForAsset:(id)a3 page:(int64_t)a4 snapshotThemeIdentifier:(id)a5 size:(CGSize)a6 completion:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  void (**v15)(id, void *);
  double v16;
  double v17;
  void *v19;
  void *v20;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;

  height = a6.height;
  width = a6.width;
  v13 = a3;
  v14 = a5;
  v15 = (void (**)(id, void *))a7;
  if ((unint64_t)(a4 - 0x7FFFFFFFFFFFFFFFLL) >= 0x8000000000000002 && objc_msgSend(v13, "length"))
  {
    v16 = floor(height);
    v17 = floor(width);
    if (v16 > 1.0 && v17 > 1.0)
    {
      -[BEPageSnapshotCache scaleAdjustedImageSize:](self, "scaleAdjustedImageSize:", v17, v16);
      v23 = v22;
      v25 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BEPageSnapshotCache keyPrefixForPage:](self, "keyPrefixForPage:", a4));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringByAppendingString:", v14));

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[BEPageSnapshotCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v13, v27, v23, v25));
      v29 = objc_claimAutoreleasedReturnValue(-[BEPageSnapshotCache _fetchImageForKey:size:](self, "_fetchImageForKey:size:", v28, v17, v16));
      if (v29)
      {
        v19 = (void *)v29;

        goto LABEL_8;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BEPageSnapshotCache _scheduleRenderWithKey:size:pageNumber:priority:completion:](self, "_scheduleRenderWithKey:size:pageNumber:priority:completion:", v28, a4, 4, v15, v17, v16));

      if (v20)
        goto LABEL_9;
    }
  }
  v19 = 0;
LABEL_8:
  v15[2](v15, v19);

  v20 = 0;
LABEL_9:

  return v20;
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
  void *v23;
  void *v24;
  id v26;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  if (width < 100.0)
    goto LABEL_2;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BEPageSnapshotCache memoryCache](self, "memoryCache"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v7));

  if (v8)
    goto LABEL_11;
  v26 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMPersistentCacheManager sharedInstance](IMPersistentCacheManager, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BEPageSnapshotCache persistentCachePath](self, "persistentCachePath"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cacheForPath:maxSize:", v11, 0));

  if (-[BEPageSnapshotCache serializeFormat](self, "serializeFormat") == 2)
  {
    NSLog(CFSTR("Getting Image for key %@ from persistent cache"), v7);
    v13 = (CGImage *)objc_msgSend(v12, "copyCGImageForKey:resourceSize:", v7, &v26);
    if (!v13)
    {

      v8 = 0;
      goto LABEL_11;
    }
    v14 = v13;
    v15 = (double)CGImageGetWidth(v13);
    v16 = (double)CGImageGetHeight(v14);
    DataProvider = CGImageGetDataProvider(v14);
    v18 = CGDataProviderCopyData(DataProvider);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEHTMLBookRenderingCache imageForSize:data:](self, "imageForSize:data:", v18, v15, v16));
    CFRelease(v18);
    CGImageRelease(v14);
    if (!v8)
      goto LABEL_7;
LABEL_9:
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BEPageSnapshotCache memoryCache](self, "memoryCache"));
    objc_msgSend(v22, "setObject:forKey:cost:", v8, v7, v26);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[IMPersistentCacheManager sharedInstance](IMPersistentCacheManager, "sharedInstance"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BEPageSnapshotCache persistentCachePath](self, "persistentCachePath"));
    objc_msgSend(v23, "purgeFromCache:", v24);

    goto LABEL_11;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dataForKey:", v7));
  v26 = objc_msgSend(v21, "length");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEHTMLBookRenderingCache imageForSize:data:](self, "imageForSize:data:", v21, width, height));

  if (v8)
    goto LABEL_9;
LABEL_7:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[IMPersistentCacheManager sharedInstance](IMPersistentCacheManager, "sharedInstance"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BEPageSnapshotCache persistentCachePath](self, "persistentCachePath"));
  objc_msgSend(v19, "purgeFromCache:", v20);

LABEL_2:
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BEPageSnapshotCache fetchImageForKey:](self, "fetchImageForKey:", v7));
LABEL_11:

  return v8;
}

- (id)_scheduleRenderWithKey:(id)a3 size:(CGSize)a4 pageNumber:(int64_t)a5 priority:(int64_t)a6 completion:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  BEPageSnapshotCacheOperation *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BEPageSnapshotCacheOperation *v20;
  id v21;
  id v22;
  BEPageSnapshotCacheOperation *v23;
  void *v24;
  _QWORD v26[4];
  id v27;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a7;
  if ((-[BEPageSnapshotCache hasImageForKey:](self, "hasImageForKey:", v13) & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BEPageSnapshotCache findRenderingCacheOperationWithStorageKey:target:selector:context:](self, "findRenderingCacheOperationWithStorageKey:target:selector:context:", v13, 0, 0, 0));
    objc_opt_class(BEPageSnapshotCacheOperation);
    v18 = BUDynamicCast(v17, v16);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = (BEPageSnapshotCacheOperation *)v19;
    if (v14)
    {
      v21 = objc_alloc((Class)BCRenderingCacheBlockCallback);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_B5444;
      v26[3] = &unk_1BECB8;
      v27 = v14;
      v22 = objc_msgSend(v21, "initWithCompletion:", v26);

      if (!v20)
        goto LABEL_8;
    }
    else
    {
      v22 = 0;
      if (!v19)
        goto LABEL_8;
    }
    if (!-[BEPageSnapshotCacheOperation isCancelled](v20, "isCancelled"))
    {
      if (v22)
        -[BEPageSnapshotCacheOperation addExtraCompletion:](v20, "addExtraCompletion:", v22);
      v15 = v20;
      goto LABEL_14;
    }
LABEL_8:
    v23 = [BEPageSnapshotCacheOperation alloc];
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BEPageSnapshotCache dataSource](self, "dataSource"));
    v15 = -[BEPageSnapshotCacheOperation initWithDataSource:](v23, "initWithDataSource:", v24);

    -[BEPageSnapshotCacheOperation setSelector:](v15, "setSelector:", 0);
    -[BEPageSnapshotCacheOperation setPageNumber:](v15, "setPageNumber:", a5);
    -[BEPageSnapshotCacheOperation setSnapshotSize:](v15, "setSnapshotSize:", width, height);
    if (v22)
      -[BEPageSnapshotCacheOperation addExtraCompletion:](v15, "addExtraCompletion:", v22);
    -[BEPageSnapshotCacheOperation setImageCache:](v15, "setImageCache:", self);
    -[BEPageSnapshotCacheOperation setDesiredSize:](v15, "setDesiredSize:", width, height);
    -[BEPageSnapshotCacheOperation setStorageKey:](v15, "setStorageKey:", v13);
    -[BEPageSnapshotCacheOperation setMasterImageKey:](v15, "setMasterImageKey:", 0);
    -[BEPageSnapshotCacheOperation setSerializeFormat:](v15, "setSerializeFormat:", -[BEPageSnapshotCache serializeFormat](self, "serializeFormat"));
    -[BEPageSnapshotCacheOperation setQueuePriority:](v15, "setQueuePriority:", a6);
    -[BEPageSnapshotCache enqueueRenderingCacheOperation:](self, "enqueueRenderingCacheOperation:", v15);
LABEL_14:

    goto LABEL_15;
  }
  v15 = 0;
LABEL_15:

  return v15;
}

- (BEPageSnapshotCacheDataSource)dataSource
{
  return (BEPageSnapshotCacheDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
