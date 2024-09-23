@implementation _TUICachedSeriesStackImageResource

+ (id)sizedKeyForNaturalSize:(CGSize)a3 contentsScale:(double)a4 imageResources:(id)a5
{
  double height;
  double width;
  id v8;
  _TUICachedImageFilterInfo *v9;
  void *v10;
  TUIImageResourceCacheKey *v11;
  void *v12;

  height = a3.height;
  width = a3.width;
  v8 = a5;
  v9 = -[_TUICachedImageFilterInfo initWithFilter:naturalSize:contentsScale:]([_TUICachedImageFilterInfo alloc], "initWithFilter:naturalSize:contentsScale:", 0, width, height, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bu_arrayByInvokingBlock:", &stru_2405B8));

  v11 = -[TUIImageResourceCacheKey initWithChildren:]([TUIImageResourceCacheKey alloc], "initWithChildren:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageResourceCacheKey cacheKeyWithFilterInfo:](v11, "cacheKeyWithFilterInfo:", v9));

  return v12;
}

+ (id)unsizedKeyForContentsScale:(double)a3 imageResources:(id)a4
{
  id v5;
  _TUICachedImageFilterInfo *v6;
  void *v7;
  TUIImageResourceCacheKey *v8;
  void *v9;

  v5 = a4;
  v6 = -[_TUICachedImageFilterInfo initWithFilter:naturalSize:contentsScale:]([_TUICachedImageFilterInfo alloc], "initWithFilter:naturalSize:contentsScale:", 0, CGSizeZero.width, CGSizeZero.height, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bu_arrayByInvokingBlock:", &stru_2405D8));

  v8 = -[TUIImageResourceCacheKey initWithChildren:]([TUIImageResourceCacheKey alloc], "initWithChildren:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageResourceCacheKey cacheKeyWithFilterInfo:](v8, "cacheKeyWithFilterInfo:", v6));

  return v9;
}

- (_TUICachedSeriesStackImageResource)initWithCache:(id)a3 unsizedCacheSet:(id)a4 queue:(id)a5 naturalSize:(CGSize)a6 contentsScale:(double)a7 resources:(id)a8 filters:(id)a9 imageSetFilter:(id)a10
{
  double height;
  double width;
  id v20;
  id v21;
  id v22;
  _TUICachedSeriesStackImageResource *v23;
  _TUICachedSeriesStackImageResource *v24;
  NSArray *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSMapTable *cgImages;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];

  height = a6.height;
  width = a6.width;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v37.receiver = self;
  v37.super_class = (Class)_TUICachedSeriesStackImageResource;
  v23 = -[_TUICachedImageResource initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:](&v37, "initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:", a3, a4, a5, width, height, a7);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_imageResources, a8);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v25 = v24->_imageResources;
    v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v34;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v34 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v29), "addObserver:", v24, (_QWORD)v33);
          v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v27);
    }

    objc_storeStrong((id *)&v24->_filters, a9);
    objc_storeStrong((id *)&v24->_imageSetFilter, a10);
    v30 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    cgImages = v24->_cgImages;
    v24->_cgImages = (NSMapTable *)v30;

    v24->_operationLock._os_unfair_lock_opaque = 0;
  }

  return v24;
}

- (id)sizedKey
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_opt_class(self);
  -[_TUICachedImageResource naturalSize](self, "naturalSize");
  v5 = v4;
  v7 = v6;
  -[_TUICachedImageResource contentsScale](self, "contentsScale");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_TUICachedSeriesStackImageResource imageResources](self, "imageResources"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sizedKeyForNaturalSize:contentsScale:imageResources:", v10, v5, v7, v9));

  return v11;
}

- (id)unsizedKey
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_class(self);
  -[_TUICachedImageResource contentsScale](self, "contentsScale");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_TUICachedSeriesStackImageResource imageResources](self, "imageResources"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "unsizedKeyForContentsScale:imageResources:", v6, v5));

  return v7;
}

- (id)newImageResourceWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  void *v13;
  id v14;
  id WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_TUICachedSeriesStackImageResource imageResources](self, "imageResources"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    v12 = CGSizeZero.height;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v13), "newImageResourceWithSize:", CGSizeZero.width, v12, (_QWORD)v23);
        objc_msgSend(v7, "addObject:", v14);

        v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->super._cache);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_TUICachedSeriesStackImageResource filters](self, "filters"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKeyPath:", CFSTR("identifier")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[_TUICachedSeriesStackImageResource imageSetFilter](self, "imageSetFilter"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
  -[_TUICachedImageResource contentsScale](self, "contentsScale");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "imageResourceForImageResources:filters:imageSetFilter:naturalSize:contentsScale:", v7, v17, v19, width, height, v20));

  return v21;
}

- (BOOL)allowsMultipleUpdates
{
  return 1;
}

- (void)loadResource
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_TUICachedSeriesStackImageResource imageResources](self, "imageResources", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v6), "loadImage");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)imageResourceDidChangeImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _TUICachedSeriesStackImageResource *v28;
  _QWORD v29[4];
  id v30;
  _TUICachedSeriesStackImageResource *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TUICachedSeriesStackImageResource cgImages](self, "cgImages"));
  if (objc_msgSend(v4, "isImageLoaded"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageContentWithOptions:", 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "image"));
    v8 = objc_msgSend(v7, "CGImage");

    if (v8)
    {
      objc_msgSend(v5, "setObject:forKey:", v8, v4);
    }
    else
    {
      v9 = TUIImageCacheLog();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_17DCF8(v4, v10);

    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_TUICachedSeriesStackImageResource imageResources](self, "imageResources"));
  v12 = objc_msgSend(v11, "count");
  v13 = objc_msgSend(v5, "count");
  v14 = TUIImageCacheLog();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (v13 == v12)
  {
    v28 = self;
    if (v16)
      sub_17DC7C((uint64_t)v5, (uint64_t)v12, v15);

    v15 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v12));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v27 = v11;
    v17 = v11;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          v23 = objc_msgSend(v5, "objectForKey:", v22, v27);
          if (v23)
          {
            -[NSObject addObject:](v15, "addObject:", v23);
          }
          else
          {
            v24 = TUIImageCacheLog();
            v25 = objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
              *(_DWORD *)buf = 134218242;
              v37 = v22;
              v38 = 2112;
              v39 = v26;
              _os_log_error_impl(&dword_0, v25, OS_LOG_TYPE_ERROR, "Map tapble for key ImageResouce %p (%@) has no CGImageRef.", buf, 0x16u);

            }
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      }
      while (v19);
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_A0514;
    v29[3] = &unk_240600;
    v30 = v5;
    v31 = v28;
    -[_TUICachedSeriesStackImageResource _applyToImages:completion:](v28, "_applyToImages:completion:", v15, v29);

    v11 = v27;
  }
  else if (v16)
  {
    *(_DWORD *)buf = 134218496;
    v37 = v13;
    v38 = 2048;
    v39 = v12;
    v40 = 2048;
    v41 = v5;
    _os_log_debug_impl(&dword_0, v15, OS_LOG_TYPE_DEBUG, "Got %ld out of %ld images, skip series cover generation. <%p>", buf, 0x20u);
  }

}

- (void)_startFilterOperation:(id)a3
{
  BCUOperation *v4;
  os_unfair_lock_s *p_operationLock;
  BCUOperation *filterOperation;
  BCUOperation *v7;
  BCUOperation *v8;

  v4 = (BCUOperation *)a3;
  p_operationLock = &self->_operationLock;
  os_unfair_lock_lock(&self->_operationLock);
  filterOperation = self->_filterOperation;
  self->_filterOperation = v4;
  v8 = v4;
  v7 = filterOperation;

  os_unfair_lock_unlock(p_operationLock);
  -[BCUOperation cancel](v7, "cancel");
  -[BCUOperation start](v8, "start");

}

- (void)_endFilterOperation:(id)a3
{
  BCUOperation *v4;

  v4 = (BCUOperation *)a3;
  os_unfair_lock_lock(&self->_operationLock);
  if (self->_filterOperation == v4)
  {
    self->_filterOperation = 0;

  }
  os_unfair_lock_unlock(&self->_operationLock);

}

- (void)_applyToImages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, void *, double, double, double, double);
  void *v21;
  _TUICachedSeriesStackImageResource *v22;
  id v23;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_TUICachedSeriesStackImageResource imageSetFilter](self, "imageSetFilter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_TUICachedSeriesStackImageResource filters](self, "filters"));
  -[_TUICachedImageResource naturalSize](self, "naturalSize");
  v11 = v10;
  v13 = v12;
  -[_TUICachedImageResource contentsScale](self, "contentsScale");
  v15 = v14;
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_A07D0;
  v21 = &unk_240628;
  v22 = self;
  v23 = v6;
  v16 = v6;
  v17 = objc_msgSend(v8, "newOperationWithImages:filters:size:contentsScale:waitForCPUSynchronization:completion:", v7, v9, 1, &v18, v11, v13, v15);

  -[_TUICachedSeriesStackImageResource _startFilterOperation:](self, "_startFilterOperation:", v17, v18, v19, v20, v21, v22);
}

- (BCUOperation)filterOperation
{
  return self->_filterOperation;
}

- (NSArray)imageResources
{
  return self->_imageResources;
}

- (NSArray)filters
{
  return self->_filters;
}

- (BCUImageSetFilter)imageSetFilter
{
  return self->_imageSetFilter;
}

- (NSMapTable)cgImages
{
  return self->_cgImages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cgImages, 0);
  objc_storeStrong((id *)&self->_imageSetFilter, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_imageResources, 0);
  objc_storeStrong((id *)&self->_filterOperation, 0);
}

@end
