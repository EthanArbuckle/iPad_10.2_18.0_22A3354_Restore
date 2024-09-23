@implementation PXContentSyndicationPhotoKitSocialLayerHighlightProvider

- (PXContentSyndicationPhotoKitSocialLayerHighlightProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m"), 36, CFSTR("%s is not available as initializer"), "-[PXContentSyndicationPhotoKitSocialLayerHighlightProvider init]");

  abort();
}

- (PXContentSyndicationPhotoKitSocialLayerHighlightProvider)initWithHighlightFetchBlock:(id)a3
{
  id v5;
  PXContentSyndicationPhotoKitSocialLayerHighlightProvider *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *serialQueue;
  NSMutableDictionary *v10;
  NSMutableDictionary *observers;
  PXLRUMemoryCache *v12;
  PXLRUMemoryCache *highlightsCache;
  uint64_t v14;
  NSHashTable *assetsWithNilHighlightsCache;
  uint64_t v16;
  id highlightFetchBlock;
  void *v19;
  objc_super v20;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("highlightFetchBlock"));

  }
  v20.receiver = self;
  v20.super_class = (Class)PXContentSyndicationPhotoKitSocialLayerHighlightProvider;
  v6 = -[PXContentSyndicationPhotoKitSocialLayerHighlightProvider init](&v20, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.PXContentSyndicationPhotoKitSocialLayerHighlightProvider", v7);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observers = v6->_observers;
    v6->_observers = v10;

    v12 = objc_alloc_init(PXLRUMemoryCache);
    highlightsCache = v6->_highlightsCache;
    v6->_highlightsCache = v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 0, 128);
    assetsWithNilHighlightsCache = v6->_assetsWithNilHighlightsCache;
    v6->_assetsWithNilHighlightsCache = (NSHashTable *)v14;

    v16 = objc_msgSend(v5, "copy");
    highlightFetchBlock = v6->_highlightFetchBlock;
    v6->_highlightFetchBlock = (id)v16;

  }
  return v6;
}

- (void)registerChangeObserver:(id)a3 forAsset:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *serialQueue;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
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
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changeObserver"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

LABEL_3:
  PLSocialLayerHighlightProviderGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v27 = objc_opt_class();
    v28 = 2048;
    v29 = v7;
    v30 = 2112;
    v31 = objc_opt_class();
    v32 = 2048;
    v33 = v9;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEBUG, "Register change observer: <%@:%p> for asset: <%@:%p>", buf, 0x2Au);
  }

  v11 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m"), 70, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("asset"), v19);
LABEL_12:

    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_descriptionForAssertionMessage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m"), 70, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("asset"), v19, v21);

    goto LABEL_12;
  }
LABEL_7:
  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_registerChangeObserver_forAsset___block_invoke;
  block[3] = &unk_1E5147B18;
  objc_copyWeak(&v25, (id *)buf);
  v23 = v7;
  v24 = v11;
  v13 = v11;
  v14 = v7;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);

}

- (void)unregisterChangeObserver:(id)a3 forAsset:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *serialQueue;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
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
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changeObserver"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

LABEL_3:
  PLSocialLayerHighlightProviderGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v27 = objc_opt_class();
    v28 = 2048;
    v29 = v7;
    v30 = 2112;
    v31 = objc_opt_class();
    v32 = 2048;
    v33 = v9;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEBUG, "Un-register change observer: <%@:%p> for asset: <%@:%p>", buf, 0x2Au);
  }

  v11 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m"), 84, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("asset"), v19);
LABEL_12:

    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_descriptionForAssertionMessage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m"), 84, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("asset"), v19, v21);

    goto LABEL_12;
  }
LABEL_7:
  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_unregisterChangeObserver_forAsset___block_invoke;
  block[3] = &unk_1E5147B18;
  objc_copyWeak(&v25, (id *)buf);
  v23 = v7;
  v24 = v11;
  v13 = v11;
  v14 = v7;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);

}

- (void)fetchSocialLayerHighlightForAsset:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSObject *serialQueue;
  id v11;
  id v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  _QWORD block[5];
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m"), 95, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("asset"), v16);
LABEL_6:

    goto LABEL_3;
  }
  v9 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_descriptionForAssertionMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m"), 95, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("asset"), v16, v18);

    goto LABEL_6;
  }
LABEL_3:
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_fetchSocialLayerHighlightForAsset_completion___block_invoke;
  block[3] = &unk_1E5145688;
  block[4] = self;
  v20 = v7;
  v21 = v8;
  v11 = v8;
  v12 = v7;
  dispatch_async(serialQueue, block);

}

- (BOOL)isSocialLayerHighlightCachedForAsset:(id)a3
{
  id v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  -[PXLRUMemoryCache allKeys](self->_highlightsCache, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  v8 = (v7 & 1) != 0 || -[NSHashTable containsObject:](self->_assetsWithNilHighlightsCache, "containsObject:", v5);
  return v8;
}

- (id)cachedSocialLayerHighlightForAsset:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  -[PXLRUMemoryCache objectForKey:](self->_highlightsCache, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)socialLayerHighlightForAsset:(id)a3
{
  id v5;
  void *v6;
  id v7;
  NSObject *serialQueue;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  _QWORD block[5];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m"), 126, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("asset"), v19, v21);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m"), 126, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("asset"), v19);
  }

LABEL_3:
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__224369;
  v29 = __Block_byref_object_dispose__224370;
  v30 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_socialLayerHighlightForAsset___block_invoke;
  block[3] = &unk_1E513FD98;
  v24 = &v25;
  block[4] = self;
  v9 = v6;
  v23 = v9;
  dispatch_sync(serialQueue, block);
  PLSocialLayerHighlightProviderGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = objc_opt_class();
    v12 = v26[5];
    v13 = objc_opt_class();
    *(_DWORD *)buf = 138413058;
    v32 = v11;
    v33 = 2048;
    v34 = v12;
    v35 = 2112;
    v36 = v13;
    v37 = 2048;
    v38 = v9;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEBUG, "Get highlight: <%@:%p> for asset: <%@:%p>", buf, 0x2Au);
  }

  v14 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (id)_serialQueue_fetchSocialLayerHighlightForAsset:(id)a3 usingHighlightResultBlock:(id)a4
{
  id v7;
  void (**v8)(id, id);
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSHashTable *assetsWithNilHighlightsCache;
  void *v13;
  void *v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitSocialLayerHighlightProvider.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("highlightFetchBlock"));

LABEL_3:
  -[PXLRUMemoryCache objectForKey:](self->_highlightsCache, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (!-[NSHashTable containsObject:](self->_assetsWithNilHighlightsCache, "containsObject:", v7))
    {
      PLSocialLayerHighlightProviderGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v18 = objc_opt_class();
        v19 = 2048;
        v20 = v7;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEBUG, "Fetching highlight for asset: <%@:%p>", buf, 0x16u);
      }

      v8[2](v8, v7);
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v9 = (void *)v11;
        -[PXLRUMemoryCache setObject:forKey:](self->_highlightsCache, "setObject:forKey:", v11, v7);
        -[NSHashTable removeObject:](self->_assetsWithNilHighlightsCache, "removeObject:", v7);
        goto LABEL_13;
      }
      if (-[NSHashTable count](self->_assetsWithNilHighlightsCache, "count") == 128)
      {
        assetsWithNilHighlightsCache = self->_assetsWithNilHighlightsCache;
        -[NSHashTable anyObject](assetsWithNilHighlightsCache, "anyObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSHashTable removeObject:](assetsWithNilHighlightsCache, "removeObject:", v13);

      }
      -[NSHashTable addObject:](self->_assetsWithNilHighlightsCache, "addObject:", v7);
    }
    v9 = 0;
  }
LABEL_13:

  return v9;
}

- (void)_serialQueue_registerChangeObserver:(id)a3 forAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_observers, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_observers, "setObject:forKeyedSubscript:", v8, v7);
  }
  objc_msgSend(v8, "addObject:", v6);
  objc_initWeak(&location, self);
  -[PXContentSyndicationPhotoKitSocialLayerHighlightProvider _serialQueue_fetchSocialLayerHighlightForAsset:usingHighlightResultBlock:](self, "_serialQueue_fetchSocialLayerHighlightForAsset:usingHighlightResultBlock:", v7, self->_highlightFetchBlock);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__PXContentSyndicationPhotoKitSocialLayerHighlightProvider__serialQueue_registerChangeObserver_forAsset___block_invoke;
  block[3] = &unk_1E51429B8;
  objc_copyWeak(&v17, &location);
  v14 = v9;
  v15 = v7;
  v16 = v6;
  v10 = v6;
  v11 = v7;
  v12 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)_serialQueue_unregisterChangeObserver:(id)a3 forAsset:(id)a4
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
    PLSocialLayerHighlightProviderGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = 138412546;
      v12 = objc_opt_class();
      v13 = 2048;
      v14 = v6;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEBUG, "No observers for asset: <%@:%p>", (uint8_t *)&v11, 0x16u);
    }

    -[PXLRUMemoryCache removeObjectForKey:](self->_highlightsCache, "removeObjectForKey:", v6);
  }

}

- (void)_didChangeHighlight:(id)a3 forAsset:(id)a4 withChangeObservers:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  PLSocialLayerHighlightProviderGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v21 = v12;
    v22 = 2048;
    v23 = v8;
    v24 = 2112;
    v25 = v13;
    v26 = 2048;
    v27 = v9;
    v28 = 2112;
    v29 = v14;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEBUG, "Did change SLHighlight: <%@:%p> for asset: <%@:%p> with change observers: (%@)", buf, 0x34u);

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __109__PXContentSyndicationPhotoKitSocialLayerHighlightProvider__didChangeHighlight_forAsset_withChangeObservers___block_invoke;
  v17[3] = &unk_1E5138C78;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v15 = v9;
  v16 = v8;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v17);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_highlightFetchBlock, 0);
  objc_storeStrong((id *)&self->_assetsWithNilHighlightsCache, 0);
  objc_storeStrong((id *)&self->_highlightsCache, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

uint64_t __109__PXContentSyndicationPhotoKitSocialLayerHighlightProvider__didChangeHighlight_forAsset_withChangeObservers___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "socialLayerHighlightProvider:didChangeSocialLayerHighlight:forAsset:", a1[4], a1[5], a1[6]);
}

void __105__PXContentSyndicationPhotoKitSocialLayerHighlightProvider__serialQueue_registerChangeObserver_forAsset___block_invoke(uint64_t a1)
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
  objc_msgSend(WeakRetained, "_didChangeHighlight:forAsset:withChangeObservers:", v3, v4, v5);

}

void __89__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_socialLayerHighlightForAsset___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_serialQueue_fetchSocialLayerHighlightForAsset:usingHighlightResultBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __105__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_fetchSocialLayerHighlightForAsset_completion___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;

  objc_msgSend(a1[4], "_serialQueue_fetchSocialLayerHighlightForAsset:usingHighlightResultBlock:", a1[5], *((_QWORD *)a1[4] + 5));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (a1[6])
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __105__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_fetchSocialLayerHighlightForAsset_completion___block_invoke_2;
    block[3] = &unk_1E5145688;
    v5 = v2;
    v6 = a1[5];
    v7 = a1[6];
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __105__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_fetchSocialLayerHighlightForAsset_completion___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PLSocialLayerHighlightProviderGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = objc_opt_class();
    v4 = a1[4];
    v5 = objc_opt_class();
    v6 = a1[5];
    v8 = 138413058;
    v9 = v3;
    v10 = 2048;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    v14 = 2048;
    v15 = v6;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEBUG, "Get highlight: <%@:%p> for asset: <%@:%p>", (uint8_t *)&v8, 0x2Au);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __94__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_unregisterChangeObserver_forAsset___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_serialQueue_unregisterChangeObserver:forAsset:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __92__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_registerChangeObserver_forAsset___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_serialQueue_registerChangeObserver:forAsset:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

+ (PXContentSyndicationPhotoKitSocialLayerHighlightProvider)sharedInstance
{
  if (sharedInstance_onceToken_224387 != -1)
    dispatch_once(&sharedInstance_onceToken_224387, &__block_literal_global_141_224388);
  return (PXContentSyndicationPhotoKitSocialLayerHighlightProvider *)(id)sharedInstance_sharedInstance_224389;
}

void __74__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_sharedInstance__block_invoke()
{
  PXContentSyndicationPhotoKitSocialLayerHighlightProvider *v0;
  void *v1;

  v0 = -[PXContentSyndicationPhotoKitSocialLayerHighlightProvider initWithHighlightFetchBlock:]([PXContentSyndicationPhotoKitSocialLayerHighlightProvider alloc], "initWithHighlightFetchBlock:", &__block_literal_global_144_224391);
  v1 = (void *)sharedInstance_sharedInstance_224389;
  sharedInstance_sharedInstance_224389 = (uint64_t)v0;

}

id __74__PXContentSyndicationPhotoKitSocialLayerHighlightProvider_sharedInstance__block_invoke_2(uint64_t a1, void *a2)
{
  return PXContentSyndicationSocialLayerHighlightForAsset(a2);
}

@end
