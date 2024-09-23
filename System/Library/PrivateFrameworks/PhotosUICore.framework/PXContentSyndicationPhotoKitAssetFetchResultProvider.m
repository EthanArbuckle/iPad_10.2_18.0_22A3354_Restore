@implementation PXContentSyndicationPhotoKitAssetFetchResultProvider

- (PXContentSyndicationPhotoKitAssetFetchResultProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitAssetFetchResultProvider.m"), 38, CFSTR("%s is not available as initializer"), "-[PXContentSyndicationPhotoKitAssetFetchResultProvider init]");

  abort();
}

- (PXContentSyndicationPhotoKitAssetFetchResultProvider)initWithPhotoLibrary:(id)a3 fetchResultBlock:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PXContentSyndicationPhotoKitAssetFetchResultProvider *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *serialQueue;
  void *v15;
  id fetchResultBlock;
  NSMutableDictionary *v17;
  NSMutableDictionary *observers;
  NSMutableDictionary *v19;
  NSMutableDictionary *fetchResults;
  void *v22;
  void *v23;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitAssetFetchResultProvider.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitAssetFetchResultProvider.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchResultBlock"));

LABEL_3:
  v24.receiver = self;
  v24.super_class = (Class)PXContentSyndicationPhotoKitAssetFetchResultProvider;
  v11 = -[PXContentSyndicationPhotoKitAssetFetchResultProvider init](&v24, sel_init);
  if (v11)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.PXContentSyndicationPhotoKitAssetFetchResultProvider", v12);
    serialQueue = v11->_serialQueue;
    v11->_serialQueue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v11->_photoLibrary, a3);
    -[PHPhotoLibrary registerChangeObserver:](v11->_photoLibrary, "registerChangeObserver:", v11);
    v15 = _Block_copy(v10);
    fetchResultBlock = v11->_fetchResultBlock;
    v11->_fetchResultBlock = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observers = v11->_observers;
    v11->_observers = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    fetchResults = v11->_fetchResults;
    v11->_fetchResults = v19;

  }
  return v11;
}

- (void)registerChangeObserver:(id)a3 forAssetCollection:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *serialQueue;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitAssetFetchResultProvider.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changeObserver"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitAssetFetchResultProvider.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCollection"));

LABEL_3:
  PLAssetFetchResultProviderGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v24 = objc_opt_class();
    v25 = 2048;
    v26 = v7;
    v27 = 2112;
    v28 = objc_opt_class();
    v29 = 2048;
    v30 = v9;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEBUG, "Register change observer: <%@:%p> for asset collection: <%@:%p>", buf, 0x2Au);
  }

  objc_initWeak((id *)buf, self);
  v11 = _Block_copy(self->_fetchResultBlock);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__PXContentSyndicationPhotoKitAssetFetchResultProvider_registerChangeObserver_forAssetCollection___block_invoke;
  block[3] = &unk_1E5147230;
  objc_copyWeak(&v22, (id *)buf);
  v19 = v7;
  v20 = v9;
  v21 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v7;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

- (void)unregisterChangeObserver:(id)a3 forAssetCollection:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *serialQueue;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitAssetFetchResultProvider.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changeObserver"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitAssetFetchResultProvider.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCollection"));

LABEL_3:
  PLAssetFetchResultProviderGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v21 = objc_opt_class();
    v22 = 2048;
    v23 = v7;
    v24 = 2112;
    v25 = objc_opt_class();
    v26 = 2048;
    v27 = v9;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEBUG, "Un-register change observer: <%@:%p> for asset collection: <%@:%p>", buf, 0x2Au);
  }

  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PXContentSyndicationPhotoKitAssetFetchResultProvider_unregisterChangeObserver_forAssetCollection___block_invoke;
  block[3] = &unk_1E5147B18;
  objc_copyWeak(&v19, (id *)buf);
  v17 = v7;
  v18 = v9;
  v12 = v9;
  v13 = v7;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (id)assetFetchResultForAssetCollection:(id)a3
{
  id v5;
  NSObject *serialQueue;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v15;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitAssetFetchResultProvider.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCollection"));

  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__165633;
  v23 = __Block_byref_object_dispose__165634;
  v24 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__PXContentSyndicationPhotoKitAssetFetchResultProvider_assetFetchResultForAssetCollection___block_invoke;
  block[3] = &unk_1E513FD98;
  v18 = &v19;
  block[4] = self;
  v7 = v5;
  v17 = v7;
  dispatch_sync(serialQueue, block);
  PLAssetFetchResultProviderGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = objc_opt_class();
    v10 = (void *)v20[5];
    v11 = objc_msgSend(v10, "count");
    v12 = objc_opt_class();
    *(_DWORD *)buf = 138413314;
    v26 = v9;
    v27 = 2048;
    v28 = v10;
    v29 = 2048;
    v30 = v11;
    v31 = 2112;
    v32 = v12;
    v33 = 2048;
    v34 = v7;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEBUG, "Get fetch result: <%@:%p, count:%lu> for asset collection: <%@:%p>", buf, 0x34u);
  }

  v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (void)invalidateAllAssetFetchResults
{
  NSObject *serialQueue;
  NSObject *v3;
  uint8_t v4[8];
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__PXContentSyndicationPhotoKitAssetFetchResultProvider_invalidateAllAssetFetchResults__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_sync(serialQueue, block);
  PLAssetFetchResultProviderGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "Invalidated cache", v4, 2u);
  }

}

- (void)invalidateAssetFetchResultsInAssetCollections:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  serialQueue = self->_serialQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __102__PXContentSyndicationPhotoKitAssetFetchResultProvider_invalidateAssetFetchResultsInAssetCollections___block_invoke;
  v8[3] = &unk_1E5148D08;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  dispatch_sync(serialQueue, v8);
  PLAssetFetchResultProviderGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEBUG, "Invalidated cache for asset collections: %@", buf, 0xCu);
  }

}

- (id)_serialQueue_fetchResultAssetCollection:(id)a3 fetchResultBlock:(id)a4
{
  id v7;
  void (**v8)(id, id);
  void *v9;
  NSObject *v10;
  PHPhotoLibrary *v11;
  void *v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_fetchResults, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    PLAssetFetchResultProviderGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v16 = objc_opt_class();
      v17 = 2048;
      v18 = v7;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEBUG, "Add asset collection: <%@:%p>", buf, 0x16u);
    }

    v8[2](v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitAssetFetchResultProvider.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchResult"));

    }
    objc_msgSend(v9, "photoLibrary");
    v11 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue();
    if (v11 != self->_photoLibrary)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitAssetFetchResultProvider.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary == _photoLibrary"));

    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fetchResults, "setObject:forKeyedSubscript:", v9, v7);

  }
  return v9;
}

- (void)_serialQueue_invalidateAllAssetFetchResults
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[NSMutableDictionary removeAllObjects](self->_fetchResults, "removeAllObjects");
}

- (void)_serialQueue_invalidateAssetFetchResultsInAssetCollections:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[NSMutableDictionary removeObjectForKey:](self->_fetchResults, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_serialQueue_registerChangeObserver:(id)a3 forAssetCollection:(id)a4 fetchResultBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_observers, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_observers, "setObject:forKeyedSubscript:", v11, v9);
  }
  objc_msgSend(v11, "addObject:", v8);
  objc_initWeak(&location, self);
  -[PXContentSyndicationPhotoKitAssetFetchResultProvider _serialQueue_fetchResultAssetCollection:fetchResultBlock:](self, "_serialQueue_fetchResultAssetCollection:fetchResultBlock:", v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __128__PXContentSyndicationPhotoKitAssetFetchResultProvider__serialQueue_registerChangeObserver_forAssetCollection_fetchResultBlock___block_invoke;
  block[3] = &unk_1E51429B8;
  objc_copyWeak(&v20, &location);
  v17 = v12;
  v18 = v9;
  v19 = v8;
  v13 = v8;
  v14 = v9;
  v15 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)_serialQueue_unregisterChangeObserver:(id)a3 forAssetCollection:(id)a4
{
  id v6;
  NSObject *serialQueue;
  id v8;
  void *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  serialQueue = self->_serialQueue;
  v8 = a3;
  dispatch_assert_queue_V2(serialQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_observers, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", v8);

  if (!objc_msgSend(v9, "count"))
  {
    PLAssetFetchResultProviderGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = 138412546;
      v12 = objc_opt_class();
      v13 = 2048;
      v14 = v6;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEBUG, "No observers for asset collection: <%@:%p>", (uint8_t *)&v11, 0x16u);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fetchResults, "setObject:forKeyedSubscript:", 0, v6);
  }

}

- (void)_didChangeFetchResult:(id)a3 forAssetCollection:(id)a4 withChangeObservers:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  PLAssetFetchResultProviderGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = objc_opt_class();
    v13 = objc_msgSend(v8, "count");
    v14 = objc_opt_class();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v22 = v12;
    v23 = 2048;
    v24 = v8;
    v25 = 2048;
    v26 = v13;
    v27 = 2112;
    v28 = v14;
    v29 = 2048;
    v30 = v9;
    v31 = 2112;
    v32 = v15;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEBUG, "Did change fetch result: <%@:%p, count:%lu> for asset collection: <%@:%p> with change observers: (%@)", buf, 0x3Eu);

  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __117__PXContentSyndicationPhotoKitAssetFetchResultProvider__didChangeFetchResult_forAssetCollection_withChangeObservers___block_invoke;
  v18[3] = &unk_1E5130B78;
  v18[4] = self;
  v19 = v8;
  v20 = v9;
  v16 = v9;
  v17 = v8;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v18);

}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__PXContentSyndicationPhotoKitAssetFetchResultProvider_photoLibraryDidChange___block_invoke;
  v7[3] = &unk_1E5148D08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResults, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong(&self->_fetchResultBlock, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __78__PXContentSyndicationPhotoKitAssetFetchResultProvider_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD block[6];
  id v7;
  id location;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__165633;
  v26 = __Block_byref_object_dispose__165634;
  v27 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__165633;
  v20[4] = __Block_byref_object_dispose__165634;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__165633;
  v18 = __Block_byref_object_dispose__165634;
  v19 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 40);
  v9[2] = __78__PXContentSyndicationPhotoKitAssetFetchResultProvider_photoLibraryDidChange___block_invoke_2;
  v9[3] = &unk_1E5130BA0;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[4] = v2;
  v10 = v3;
  v11 = &v22;
  v12 = v20;
  v13 = &v14;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);
  if (objc_msgSend((id)v15[5], "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectsForKeys:", v15[5]);
  if (objc_msgSend((id)v23[5], "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addEntriesFromDictionary:", v23[5]);
    objc_initWeak(&location, *(id *)(a1 + 32));
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __78__PXContentSyndicationPhotoKitAssetFetchResultProvider_photoLibraryDidChange___block_invoke_156;
    block[3] = &unk_1E5130BF0;
    block[4] = &v22;
    block[5] = v20;
    objc_copyWeak(&v7, &location);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(v20, 8);

  _Block_object_dispose(&v22, 8);
}

void __78__PXContentSyndicationPhotoKitAssetFetchResultProvider_photoLibraryDidChange___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "changeDetailsForFetchResult:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;

      }
      objc_msgSend(v9, "fetchResultAfterChanges");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v13, v5);
      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (!v14)
      {
        v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v17 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v15;

        v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      }
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, v5);

    }
  }
  else
  {
    PLAssetFetchResultProviderGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v23 = 138412546;
      v24 = objc_opt_class();
      v25 = 2048;
      v26 = v5;
      _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEBUG, "Found orphaned asset collection: <%@:%p>", (uint8_t *)&v23, 0x16u);
    }

    v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    if (!v19)
    {
      v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v20;

      v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    }
    objc_msgSend(v19, "addObject:", v5);
  }

}

void __78__PXContentSyndicationPhotoKitAssetFetchResultProvider_photoLibraryDidChange___block_invoke_156(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __78__PXContentSyndicationPhotoKitAssetFetchResultProvider_photoLibraryDidChange___block_invoke_2_157;
  v4[3] = &unk_1E5130BC8;
  v3 = *(void **)(v2 + 40);
  v4[1] = 3221225472;
  v4[4] = v1;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);
  objc_destroyWeak(&v5);
}

void __78__PXContentSyndicationPhotoKitAssetFetchResultProvider_photoLibraryDidChange___block_invoke_2_157(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id WeakRetained;
  id v9;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didChangeFetchResult:forAssetCollection:withChangeObservers:", v6, v7, v9);

}

uint64_t __117__PXContentSyndicationPhotoKitAssetFetchResultProvider__didChangeFetchResult_forAssetCollection_withChangeObservers___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "assetFetchResultProvider:didChangeAssetFetchResult:forAssetCollection:", a1[4], a1[5], a1[6]);
}

void __128__PXContentSyndicationPhotoKitAssetFetchResultProvider__serialQueue_registerChangeObserver_forAssetCollection_fetchResultBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_didChangeFetchResult:forAssetCollection:withChangeObservers:", v3, v4, v5);

}

uint64_t __102__PXContentSyndicationPhotoKitAssetFetchResultProvider_invalidateAssetFetchResultsInAssetCollections___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serialQueue_invalidateAssetFetchResultsInAssetCollections:", *(_QWORD *)(a1 + 40));
}

uint64_t __86__PXContentSyndicationPhotoKitAssetFetchResultProvider_invalidateAllAssetFetchResults__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serialQueue_invalidateAllAssetFetchResults");
}

void __91__PXContentSyndicationPhotoKitAssetFetchResultProvider_assetFetchResultForAssetCollection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_serialQueue_fetchResultAssetCollection:fetchResultBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __100__PXContentSyndicationPhotoKitAssetFetchResultProvider_unregisterChangeObserver_forAssetCollection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_serialQueue_unregisterChangeObserver:forAssetCollection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __98__PXContentSyndicationPhotoKitAssetFetchResultProvider_registerChangeObserver_forAssetCollection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_serialQueue_registerChangeObserver:forAssetCollection:fetchResultBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

@end
