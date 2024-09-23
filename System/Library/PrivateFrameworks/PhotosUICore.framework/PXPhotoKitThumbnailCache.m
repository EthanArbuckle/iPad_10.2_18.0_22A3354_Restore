@implementation PXPhotoKitThumbnailCache

- (PXPhotoKitThumbnailCache)initWithSizeLimit:(unint64_t)a3 photoLibrary:(id)a4
{
  id v7;
  PXPhotoKitThumbnailCache *v8;
  PXPhotoKitThumbnailCache *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *lock_cachedThumbnailIndexByObjectID;
  NSCache *v12;
  NSCache *cache;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PXPhotoKitThumbnailCache;
  v8 = -[PXPhotoKitThumbnailCache init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v8->_sizeLimit = a3;
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lock_cachedThumbnailIndexByObjectID = v9->_lock_cachedThumbnailIndexByObjectID;
    v9->_lock_cachedThumbnailIndexByObjectID = v10;

    v12 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    cache = v9->_cache;
    v9->_cache = v12;

    -[NSCache setTotalCostLimit:](v9->_cache, "setTotalCostLimit:", a3);
    -[NSCache setDelegate:](v9->_cache, "setDelegate:", v9);
    objc_storeStrong((id *)&v9->_photoLibrary, a4);
    objc_msgSend(v7, "px_registerChangeObserver:", v9);
  }

  return v9;
}

- (PXPhotoKitThumbnailCache)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitThumbnailCache.m"), 64, CFSTR("%s is not available as initializer"), "-[PXPhotoKitThumbnailCache init]");

  abort();
}

- (void)dealloc
{
  objc_super v3;

  -[NSCache setDelegate:](self->_cache, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PXPhotoKitThumbnailCache;
  -[PXPhotoKitThumbnailCache dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PXPhotoKitThumbnailCache label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSMutableDictionary count](self->_lock_cachedThumbnailIndexByObjectID, "count");
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", -[PXPhotoKitThumbnailCache sizeLimit](self, "sizeLimit"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p label:%@ count:%lu sizeLimit:%@>"), self, self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)tableThumbnailDataForAsset:(id)a3 dataSpecification:(PHAssetResourceTableDataSpecification *)a4
{
  id v6;
  PHPhotoLibrary *v7;
  PHPhotoLibrary *photoLibrary;
  void *v9;
  NSCache *cache;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;

  v6 = a3;
  objc_msgSend(v6, "photoLibrary");
  v7 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue();
  photoLibrary = self->_photoLibrary;

  if (v7 == photoLibrary)
  {
    cache = self->_cache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "thumbnailIndex"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache objectForKey:](cache, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 && v12)
    {
      objc_msgSend(v12, "dataSpec");
      *(_OWORD *)&a4->width = v14;
      *(_OWORD *)&a4->dataHeight = v15;
    }
    objc_msgSend(v12, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)cacheThumbnailData:(id)a3 specification:(const PHAssetResourceTableDataSpecification *)a4 forAsset:(id)a5
{
  id v8;
  id v9;
  PHPhotoLibrary *v10;
  PHPhotoLibrary *photoLibrary;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  int bytesPerRow;
  int dataWidth;
  id v21;
  uint64_t v22;
  uint64_t v23;
  PXThumbnailCacheEntry *v24;
  id v25;
  int v26;
  unint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "photoLibrary");
  v10 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue();
  photoLibrary = self->_photoLibrary;

  if (v10 == photoLibrary)
  {
    objc_msgSend(v9, "objectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "thumbnailIndex"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = a4->dataHeight * (uint64_t)a4->bytesPerRow;
    if (objc_msgSend(v8, "length") >= v14)
    {
      objc_msgSend(off_1E50B5CD0, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "colorCachedThumbnails");

      if (v17)
      {
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", objc_msgSend(objc_retainAutorelease(v8), "bytes"), v14);
        bytesPerRow = a4->bytesPerRow;
        dataWidth = a4->dataWidth;
        v21 = objc_retainAutorelease(v18);
        v22 = objc_msgSend(v21, "mutableBytes");
        if ((int)v14 >= 2)
        {
          v23 = 1;
          do
          {
            *(_BYTE *)(v22 + v23) = -1;
            v23 += bytesPerRow / dataWidth;
          }
          while (v23 < (uint64_t)v14);
        }
      }
      else
      {
        v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", objc_msgSend(objc_retainAutorelease(v8), "bytes"), v14);
      }
      v24 = -[PXThumbnailCacheEntry initWithObjectID:dataSpec:data:]([PXThumbnailCacheEntry alloc], "initWithObjectID:dataSpec:data:", v12, a4, v21);
      -[NSCache setObject:forKey:cost:](self->_cache, "setObject:forKey:cost:", v24, v13, v14);
      v25 = -[NSCache objectForKey:](self->_cache, "objectForKey:", v13);
      os_unfair_lock_lock(&self->_lock);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_cachedThumbnailIndexByObjectID, "setObject:forKeyedSubscript:", v13, v12);
      os_unfair_lock_unlock(&self->_lock);

    }
    else if (objc_msgSend(v8, "length") >= v14)
    {
      PXAssertGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v26 = 134218240;
        v27 = v14;
        v28 = 2048;
        v29 = objc_msgSend(v8, "length");
        _os_log_error_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "The spec described a larger chunk of data than we have:%ld > %lu", (uint8_t *)&v26, 0x16u);
      }

    }
  }

}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v6;
  NSMutableDictionary *lock_cachedThumbnailIndexByObjectID;
  void *v8;

  p_lock = &self->_lock;
  v6 = a4;
  os_unfair_lock_lock(p_lock);
  lock_cachedThumbnailIndexByObjectID = self->_lock_cachedThumbnailIndexByObjectID;
  objc_msgSend(v6, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary removeObjectForKey:](lock_cachedThumbnailIndexByObjectID, "removeObjectForKey:", v8);
  os_unfair_lock_unlock(p_lock);
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "hasIncrementalChanges"))
  {
    os_unfair_lock_lock(&self->_lock);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v5 = self->_lock_cachedThumbnailIndexByObjectID;
    v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v4, "contentOrThumbnailChangedForPHAssetOID:", v11))
          {
            if (!v8)
              v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_cachedThumbnailIndexByObjectID, "objectForKeyedSubscript:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v12);

          }
        }
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }

    os_unfair_lock_unlock(&self->_lock);
    if (v8)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v13 = v8;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v20;
        do
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v20 != v16)
              objc_enumerationMutation(v13);
            -[NSCache removeObjectForKey:](self->_cache, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), (_QWORD)v19);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        }
        while (v15);
      }

    }
  }
  else
  {
    -[NSCache removeAllObjects](self->_cache, "removeAllObjects");
  }

  return 0;
}

- (unint64_t)sizeLimit
{
  return self->_sizeLimit;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_lock_cachedThumbnailIndexByObjectID, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
