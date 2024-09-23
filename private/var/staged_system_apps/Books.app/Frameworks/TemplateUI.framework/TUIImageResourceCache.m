@implementation TUIImageResourceCache

- (TUIImageResourceCache)initWithLoader:(id)a3 filters:(id)a4 customImageBundle:(id)a5
{
  id v9;
  id v10;
  id v11;
  TUIImageResourceCache *v12;
  TUIImageResourceCache *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *cacheQueue;
  dispatch_queue_t v16;
  OS_dispatch_queue *resourceQueue;
  uint64_t v18;
  NSMapTable *cachedURLResources;
  NSMutableDictionary *v20;
  NSMutableDictionary *allCachedURLResources;
  uint64_t v22;
  NSMapTable *cachedTintedResources;
  NSMutableDictionary *v24;
  NSMutableDictionary *allCachedTintedResources;
  uint64_t v26;
  NSMapTable *cachedFilteredResources;
  NSMutableDictionary *v28;
  NSMutableDictionary *allCachedFilteredResources;
  uint64_t v30;
  NSMapTable *cachedSeriesStackResources;
  NSMutableDictionary *v32;
  NSMutableDictionary *allCachedSeriesStackResources;
  uint64_t v34;
  NSMapTable *cachedMediaBackdropResources;
  NSMutableDictionary *v36;
  NSMutableDictionary *allCachedMediaBackdropResources;
  uint64_t v38;
  NSHashTable *deferLoadResources;
  uint64_t v40;
  NSMapTable *cachedSymbolImages;
  objc_super v43;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v43.receiver = self;
  v43.super_class = (Class)TUIImageResourceCache;
  v12 = -[TUIImageResourceCache init](&v43, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_loader, a3);
    objc_storeStrong((id *)&v13->_filters, a4);
    objc_storeStrong((id *)&v13->_customImageBundle, a5);
    v14 = dispatch_queue_create("TUIImageResourceCache.cacheQueue", 0);
    cacheQueue = v13->_cacheQueue;
    v13->_cacheQueue = (OS_dispatch_queue *)v14;

    v16 = dispatch_queue_create("TUIImageResourceCache.resourceQueue", 0);
    resourceQueue = v13->_resourceQueue;
    v13->_resourceQueue = (OS_dispatch_queue *)v16;

    v18 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 0, 517));
    cachedURLResources = v13->_cachedURLResources;
    v13->_cachedURLResources = (NSMapTable *)v18;

    v20 = objc_opt_new(NSMutableDictionary);
    allCachedURLResources = v13->_allCachedURLResources;
    v13->_allCachedURLResources = v20;

    v22 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 0, 517));
    cachedTintedResources = v13->_cachedTintedResources;
    v13->_cachedTintedResources = (NSMapTable *)v22;

    v24 = objc_opt_new(NSMutableDictionary);
    allCachedTintedResources = v13->_allCachedTintedResources;
    v13->_allCachedTintedResources = v24;

    v26 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 0, 517));
    cachedFilteredResources = v13->_cachedFilteredResources;
    v13->_cachedFilteredResources = (NSMapTable *)v26;

    v28 = objc_opt_new(NSMutableDictionary);
    allCachedFilteredResources = v13->_allCachedFilteredResources;
    v13->_allCachedFilteredResources = v28;

    v30 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 0, 517));
    cachedSeriesStackResources = v13->_cachedSeriesStackResources;
    v13->_cachedSeriesStackResources = (NSMapTable *)v30;

    v32 = objc_opt_new(NSMutableDictionary);
    allCachedSeriesStackResources = v13->_allCachedSeriesStackResources;
    v13->_allCachedSeriesStackResources = v32;

    v34 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 0, 517));
    cachedMediaBackdropResources = v13->_cachedMediaBackdropResources;
    v13->_cachedMediaBackdropResources = (NSMapTable *)v34;

    v36 = objc_opt_new(NSMutableDictionary);
    allCachedMediaBackdropResources = v13->_allCachedMediaBackdropResources;
    v13->_allCachedMediaBackdropResources = v36;

    v38 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    deferLoadResources = v13->_deferLoadResources;
    v13->_deferLoadResources = (NSHashTable *)v38;

    v40 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 0, 5));
    cachedSymbolImages = v13->_cachedSymbolImages;
    v13->_cachedSymbolImages = (NSMapTable *)v40;

  }
  return v13;
}

- (void)debugDumpFilteredResources:(BOOL)a3
{
  NSObject *cacheQueue;
  _QWORD v4[5];
  BOOL v5;

  cacheQueue = self->_cacheQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_A12F8;
  v4[3] = &unk_23EA68;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(cacheQueue, v4);
}

- (BOOL)shouldDeferLoadForResource:(id)a3
{
  id v4;
  unint64_t deferLoadCount;
  NSHashTable *deferLoadResources;

  v4 = a3;
  os_unfair_lock_lock(&self->_deferLoadLock);
  deferLoadCount = self->_deferLoadCount;
  if (deferLoadCount)
  {
    deferLoadResources = self->_deferLoadResources;
    ++self->_deferStats;
    -[NSHashTable addObject:](deferLoadResources, "addObject:", v4);
  }
  os_unfair_lock_unlock(&self->_deferLoadLock);

  return deferLoadCount != 0;
}

- (void)deferLoadsBegin
{
  os_unfair_lock_s *p_deferLoadLock;
  unint64_t deferLoadCount;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  p_deferLoadLock = &self->_deferLoadLock;
  os_unfair_lock_lock(&self->_deferLoadLock);
  deferLoadCount = self->_deferLoadCount;
  self->_deferLoadCount = deferLoadCount + 1;
  if (!deferLoadCount)
  {
    self->_deferStats = 0;
    v5 = TUIImageCacheLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Pausing Loads", v7, 2u);
    }

  }
  os_unfair_lock_unlock(p_deferLoadLock);
}

- (void)deferLoadsEnd
{
  os_unfair_lock_s *p_deferLoadLock;
  unint64_t v4;
  void *v5;
  unint64_t deferStats;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;

  p_deferLoadLock = &self->_deferLoadLock;
  os_unfair_lock_lock(&self->_deferLoadLock);
  v4 = self->_deferLoadCount - 1;
  self->_deferLoadCount = v4;
  if (v4)
  {
    os_unfair_lock_unlock(p_deferLoadLock);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_deferLoadResources, "allObjects"));
    -[NSHashTable removeAllObjects](self->_deferLoadResources, "removeAllObjects");
    deferStats = self->_deferStats;
    os_unfair_lock_unlock(p_deferLoadLock);
    if (v5)
    {
      v7 = TUIImageCacheLog();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", deferStats));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count")));
        *(_DWORD *)buf = 138412546;
        v23 = v9;
        v24 = 2112;
        v25 = v10;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Resuming Loads: deferred-loads / post-loads : %@ / %@", buf, 0x16u);

      }
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v11 = v5;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v18;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v11);
            v16 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v15), "loadImage", (_QWORD)v17);
            v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v13);
      }

    }
  }
}

- (id)_largestResourceWithContentAndNaturalSize:(CGSize)a3 contentsScale:(double)a4 cachedResources:(id)a5
{
  double height;
  double width;
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  void *i;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v29;
  id v30;
  id v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  height = a3.height;
  width = a3.width;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = a5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = width * a4;
    v13 = height * a4;
    v14 = *(_QWORD *)v34;
    v15 = 0.0;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(v8);
        v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v17, "naturalSize", (_QWORD)v33);
        v19 = v18;
        v21 = v20;
        objc_msgSend(v17, "contentsScale");
        v23 = v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "imageContentWithOptions:", 1));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "image"));

        if (v25)
        {
          v26 = v19 * v23;
          v27 = v21 * v23;
          if (v19 * v23 >= v12 && v27 >= v13)
          {
            v31 = v17;

            v11 = v31;
            goto LABEL_18;
          }
          v29 = v26 * v27;
          if (v26 * v27 > v15)
          {
            v30 = v17;

            v15 = v29;
            v11 = v30;
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }
LABEL_18:

  return v11;
}

- (id)imageResourceForTemplatedURL:(id)a3 baseURL:(id)a4 naturalSize:(CGSize)a5 contentsScale:(double)a6
{
  double height;
  double width;
  id v11;
  id v12;
  void *v13;
  TUIImageResourceCacheKey *v14;
  NSObject *cacheQueue;
  id v16;
  id v17;
  TUIImageResourceCacheKey *v18;
  id v19;
  _QWORD v21[4];
  TUIImageResourceCacheKey *v22;
  TUIImageResourceCache *v23;
  id v24;
  id v25;
  uint64_t *v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_TUICachedURLImageResource sizedURLFromTemplatedURL:baseURL:naturalSize:contentsScale:](_TUICachedURLImageResource, "sizedURLFromTemplatedURL:baseURL:naturalSize:contentsScale:", v11, v12, width, height, a6));
  v14 = -[TUIImageResourceCacheKey initWithURL:]([TUIImageResourceCacheKey alloc], "initWithURL:", v13);
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_9CB9C;
  v34 = sub_9CBAC;
  v35 = 0;
  cacheQueue = self->_cacheQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_A1B28;
  v21[3] = &unk_240678;
  v25 = v12;
  v26 = &v30;
  v22 = v14;
  v23 = self;
  v24 = v11;
  v27 = width;
  v28 = height;
  v29 = a6;
  v16 = v12;
  v17 = v11;
  v18 = v14;
  dispatch_sync(cacheQueue, v21);
  v19 = (id)v31[5];

  _Block_object_dispose(&v30, 8);
  return v19;
}

- (id)imageResourceForURL:(id)a3 contentsScale:(double)a4
{
  id v6;
  void *v7;
  NSObject *cacheQueue;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v14;
  TUIImageResourceCache *v15;
  id v16;
  uint64_t *v17;
  double v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_9CB9C;
  v23 = sub_9CBAC;
  v24 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_TUICachedURLImageResource sizedKeyFromURL:](_TUICachedURLImageResource, "sizedKeyFromURL:", v6));
  cacheQueue = self->_cacheQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A1E34;
  block[3] = &unk_2406A0;
  v14 = v7;
  v15 = self;
  v16 = v6;
  v17 = &v19;
  v18 = a4;
  v9 = v6;
  v10 = v7;
  dispatch_sync(cacheQueue, block);
  v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

- (id)imageResource:(id)a3 tintedWithColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *cacheQueue;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_TUICachedTintedImageResource sizedKeyForColor:imageResource:](_TUICachedTintedImageResource, "sizedKeyForColor:imageResource:", v7, v6));
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_9CB9C;
  v24 = sub_9CBAC;
  v25 = 0;
  cacheQueue = self->_cacheQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A209C;
  block[3] = &unk_2406C8;
  v18 = v6;
  v19 = &v20;
  block[4] = self;
  v16 = v8;
  v17 = v7;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  dispatch_sync(cacheQueue, block);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

- (id)imageResource:(id)a3 naturalSize:(CGSize)a4 contentsScale:(double)a5 withFilter:(id)a6 filterOptions:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *cacheQueue;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a6;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFilterRegistry imageFilterWithIdentifier:](self->_filters, "imageFilterWithIdentifier:", v14));
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_9CB9C;
  v35 = sub_9CBAC;
  v36 = 0;
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[_TUICachedFilterImageResource sizedKeyForFilter:naturalSize:contentsScale:imageResource:](_TUICachedFilterImageResource, "sizedKeyForFilter:naturalSize:contentsScale:imageResource:", v16, v13, width, height, a5));
    cacheQueue = self->_cacheQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_A2354;
    v23[3] = &unk_240678;
    v27 = &v31;
    v23[4] = self;
    v24 = v17;
    v25 = v16;
    v28 = a5;
    v26 = v13;
    v29 = width;
    v30 = height;
    v19 = v17;
    dispatch_sync(cacheQueue, v23);

    v20 = (void *)v32[5];
  }
  else
  {
    v20 = 0;
  }
  if (!v20)
    v20 = v13;
  v21 = v20;
  _Block_object_dispose(&v31, 8);

  return v21;
}

- (id)imageResourceForImageResources:(id)a3 filters:(id)a4 imageSetFilter:(id)a5 naturalSize:(CGSize)a6 contentsScale:(double)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *cacheQueue;
  id v19;
  void *v20;
  id v21;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  height = a6.height;
  width = a6.width;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFilterRegistry imageSetFilterWithIdentifier:](self->_filters, "imageSetFilterWithIdentifier:", v15));
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_9CB9C;
  v36 = sub_9CBAC;
  v37 = 0;
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[_TUICachedSeriesStackImageResource sizedKeyForNaturalSize:contentsScale:imageResources:](_TUICachedSeriesStackImageResource, "sizedKeyForNaturalSize:contentsScale:imageResources:", v13, width, height, a7));
    cacheQueue = self->_cacheQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_A261C;
    block[3] = &unk_2406F0;
    v28 = &v32;
    block[4] = self;
    v24 = v17;
    v29 = a7;
    v25 = v13;
    v26 = v14;
    v30 = width;
    v31 = height;
    v27 = v16;
    v19 = v17;
    dispatch_sync(cacheQueue, block);

    v20 = (void *)v33[5];
  }
  else
  {
    v20 = 0;
  }
  v21 = v20;
  _Block_object_dispose(&v32, 8);

  return v21;
}

- (id)symbolImageWithName:(id)a3 compatibleWithFontSize:(double)a4 weight:(int64_t)a5 scale:(int64_t)a6 renderingMode:(unint64_t)a7 colors:(id)a8 style:(unint64_t)a9 contentsScale:(double)a10 layoutDirection:(unint64_t)a11 insets:(UIEdgeInsets)a12 baseline:(BOOL)a13
{
  double right;
  CGFloat bottom;
  double left;
  double top;
  id v25;
  id v26;
  void *v27;
  _TUISymbolImageKey *v28;
  _TUISymbolImageKey *v29;
  NSObject *cacheQueue;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  void *v42;
  void *v43;
  double v44;
  uint64_t v45;
  void *v46;
  double v48;
  double v49;
  double v50;
  _QWORD v51[5];
  _TUISymbolImageKey *v52;
  uint64_t *v53;
  _QWORD block[5];
  _TUISymbolImageKey *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;

  right = a12.right;
  bottom = a12.bottom;
  left = a12.left;
  top = a12.top;
  v25 = a3;
  v26 = a8;
  if (objc_msgSend(v25, "length"))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration tui_configurationWithPointSize:weight:scale:renderingMode:colors:](UIImageSymbolConfiguration, "tui_configurationWithPointSize:weight:scale:renderingMode:colors:", a5, a6, a7, v26, a4));
    v28 = -[_TUISymbolImageKey initWithName:configuration:style:contentsScale:layoutDirection:renderingMode:]([_TUISymbolImageKey alloc], "initWithName:configuration:style:contentsScale:layoutDirection:renderingMode:", v25, v27, a9, a11, a7, a10);
    v29 = v28;
    v57 = 0;
    v58 = &v57;
    v59 = 0x3032000000;
    v60 = sub_9CB9C;
    v61 = sub_9CBAC;
    v62 = 0;
    if (!a7)
      goto LABEL_23;
    cacheQueue = self->_cacheQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_A2C20;
    block[3] = &unk_23E848;
    v56 = &v57;
    block[4] = self;
    v55 = v28;
    dispatch_sync(cacheQueue, block);

    if (!v58[5])
    {
LABEL_23:
      v31 = objc_claimAutoreleasedReturnValue(-[TUIImageResourceCache _symbolImageForKey:](self, "_symbolImageForKey:", v29));
      v32 = (void *)v58[5];
      v58[5] = v31;

      v33 = (void *)v58[5];
      if (v33)
      {
        if (objc_msgSend(v33, "isMulticolor"))
        {
          v34 = self->_cacheQueue;
          v51[0] = _NSConcreteStackBlock;
          v51[1] = 3221225472;
          v51[2] = sub_A2C5C;
          v51[3] = &unk_23D7A8;
          v51[4] = self;
          v52 = v29;
          v53 = &v57;
          dispatch_sync(v34, v51);

        }
      }
    }
    v35 = (void *)v58[5];
    if (v35)
    {
      v50 = bottom;
      if (a11 == 2)
        v36 = right;
      else
        v36 = left;
      if (a11 != 2)
        left = right;
      objc_msgSend(v35, "alignmentInsets");
      objc_msgSend((id)v58[5], "contentInsets");
      v38 = v37;
      objc_msgSend((id)v58[5], "size");
      v49 = v39;
      objc_msgSend((id)v58[5], "baselineOffsetFromBottom");
      v40 = v38 - top;
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v58[5], "symbolImageWithContentInsets:alignmentInsets:", top, v36, v50, left, 0.0, 0.0, 0.0, 0.0, v41));
      v43 = v42;
      if (a13)
      {
        objc_msgSend(v42, "size");
        v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "symbolImageWithBaselineOffsetFromBottom:", v44 - (v49 - v48 - v40)));
      }
      else
      {
        v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "symbolImageWithoutBaseline"));
      }
      v46 = (void *)v45;

    }
    else
    {
      v46 = 0;
    }
    _Block_object_dispose(&v57, 8);

  }
  else
  {
    v46 = 0;
  }

  return v46;
}

- (id)_symbolImageForKey:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  double v7;
  double v8;
  char *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _TUISymbolImage *v38;
  void **v40;
  uint64_t v41;
  id (*v42)(uint64_t);
  void *v43;
  id v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  _QWORD v51[7];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v6 = (char *)objc_msgSend(v4, "style");
  objc_msgSend(v4, "contentsScale");
  v8 = v7;
  v9 = (char *)objc_msgSend(v4, "layoutDirection");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  v11 = objc_msgSend(v4, "renderingMode");

  v12 = v6 == (_BYTE *)&dword_0 + 1;
  if (v6 == (_BYTE *)&dword_0 + 2)
    v12 = 2;
  v51[0] = _NSConcreteStackBlock;
  if (v9 == (_BYTE *)&dword_0 + 1)
    v13 = 0;
  else
    v13 = -1;
  v51[1] = 3221225472;
  v51[2] = sub_A2FF0;
  v51[3] = &unk_240710;
  if (v9 == (_BYTE *)&dword_0 + 2)
    v13 = 1;
  v51[4] = v12;
  *(double *)&v51[5] = v8;
  v51[6] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithTraits:](UITraitCollection, "traitCollectionWithTraits:", v51));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:compatibleWithTraitCollection:](UIImage, "systemImageNamed:compatibleWithTraitCollection:", v5, v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "imageWithConfiguration:", v10));

  if (!v16)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:withConfiguration:](UIImage, "imageNamed:inBundle:withConfiguration:", v5, self->_customImageBundle, v10));
    if (!v16)
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", v5, v10));
  }
  if (objc_msgSend(v16, "tui_isMulticolorSymbolWithSymbolRenderingMode:", v11))
  {
    objc_msgSend(v16, "size");
    v19 = TUISizeRoundedForScale(v17, v18, v8);
    v21 = v20;
    objc_msgSend(v16, "contentInsets");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v30 = v19 - (v24 + v28);
    v31 = v21 - (v22 + v26);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIGraphicsImageRendererFormat formatForTraitCollection:](UIGraphicsImageRendererFormat, "formatForTraitCollection:", v14));
    v33 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v32, v30, v31);
    v40 = _NSConcreteStackBlock;
    v41 = 3221225472;
    v42 = sub_A3044;
    v43 = &unk_240738;
    v45 = v23;
    v46 = v25;
    v47 = v27;
    v48 = v29;
    v49 = v30;
    v50 = v31;
    v34 = v16;
    v44 = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "imageWithActions:", &v40));

    if (objc_msgSend(v34, "hasBaseline", v40, v41, v42, v43))
    {
      objc_msgSend(v34, "baselineOffsetFromBottom");
      v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "imageWithBaselineOffsetFromBottom:"));

      v35 = (void *)v36;
    }
    objc_msgSend(v34, "alignmentRectInsets");
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "imageWithAlignmentRectInsets:"));

    v38 = -[_TUISymbolImage initWithImage:contentInsets:isMulticolor:]([_TUISymbolImage alloc], "initWithImage:contentInsets:isMulticolor:", v37, 1, v23, v25, v27, v29);
  }
  else
  {
    v38 = -[_TUISymbolImage initWithImage:]([_TUISymbolImage alloc], "initWithImage:", v16);
  }

  return v38;
}

- (id)mediaBackdropImageResourceFrom:(id)a3 naturalSize:(CGSize)a4 contentScale:(double)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  NSObject *cacheQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v17;
  id v18;
  uint64_t *v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_TUICachedMediaBackdropImageResource sizedKeyForNaturalSize:contentsScale:imageResource:](_TUICachedMediaBackdropImageResource, "sizedKeyForNaturalSize:contentsScale:imageResource:", v9, width, height, a5));
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_9CB9C;
  v27 = sub_9CBAC;
  v28 = 0;
  cacheQueue = self->_cacheQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A31F4;
  block[3] = &unk_240760;
  block[4] = self;
  v17 = v10;
  v18 = v9;
  v19 = &v23;
  v20 = a5;
  v21 = width;
  v22 = height;
  v12 = v9;
  v13 = v10;
  dispatch_sync(cacheQueue, block);
  v14 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v14;
}

- (void)refreshAllResources
{
  NSObject *cacheQueue;
  _QWORD block[5];

  cacheQueue = self->_cacheQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A3348;
  block[3] = &unk_23D938;
  block[4] = self;
  dispatch_sync(cacheQueue, block);
}

- (NSBundle)customImageBundle
{
  return self->_customImageBundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customImageBundle, 0);
  objc_storeStrong((id *)&self->_deferLoadResources, 0);
  objc_storeStrong((id *)&self->_cachedSymbolImages, 0);
  objc_storeStrong((id *)&self->_allCachedMediaBackdropResources, 0);
  objc_storeStrong((id *)&self->_cachedMediaBackdropResources, 0);
  objc_storeStrong((id *)&self->_allCachedSeriesStackResources, 0);
  objc_storeStrong((id *)&self->_cachedSeriesStackResources, 0);
  objc_storeStrong((id *)&self->_allCachedFilteredResources, 0);
  objc_storeStrong((id *)&self->_cachedFilteredResources, 0);
  objc_storeStrong((id *)&self->_allCachedTintedResources, 0);
  objc_storeStrong((id *)&self->_cachedTintedResources, 0);
  objc_storeStrong((id *)&self->_allCachedURLResources, 0);
  objc_storeStrong((id *)&self->_cachedURLResources, 0);
  objc_storeStrong((id *)&self->_resourceQueue, 0);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_loader, 0);
}

@end
