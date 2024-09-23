@implementation _UIActivityApplicationExtensionsCache

+ (id)sharedExtensionsCache
{
  if (sharedExtensionsCache_onceToken != -1)
    dispatch_once(&sharedExtensionsCache_onceToken, &__block_literal_global_6);
  return (id)sharedExtensionsCache_extensionsCache;
}

- (_UIActivityApplicationExtensionsCache)init
{
  _UIActivityApplicationExtensionsCache *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIActivityApplicationExtensionsCache;
  v2 = -[_UIActivityApplicationExtensionsCache init](&v10, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[_UIActivityApplicationExtensionsCache setCachedResults:](v2, "setCachedResults:", v3);

    v4 = (void *)objc_opt_new();
    -[_UIActivityApplicationExtensionsCache setExtensionMatchTokens:](v2, "setExtensionMatchTokens:", v4);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.SharingUI.ShareSheet.primedExtensions", v5);
    -[_UIActivityApplicationExtensionsCache setPrimedExtensionsQueue:](v2, "setPrimedExtensionsQueue:", v6);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.SharingUI.ShareSheet.discoveryExtensions", v7);
    -[_UIActivityApplicationExtensionsCache setDiscoveryQueue:](v2, "setDiscoveryQueue:", v8);

    v2->_cacheLock._os_unfair_lock_opaque = 0;
    -[_UIActivityApplicationExtensionsCache _startPrecachingContinuousExtensionDiscovery](v2, "_startPrecachingContinuousExtensionDiscovery");
  }
  return v2;
}

- (void)_startPrecachingContinuousExtensionDiscovery
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = objc_msgSend(&unk_1E403F4E8, "count");
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "ExtensionsCache: processing %lu registrations for continuous discovery precaching", buf, 0xCu);
  }

  -[_UIActivityApplicationExtensionsCache discoveryQueue](self, "discoveryQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85___UIActivityApplicationExtensionsCache__startPrecachingContinuousExtensionDiscovery__block_invoke;
  block[3] = &unk_1E4001608;
  block[4] = self;
  dispatch_async(v4, block);

}

- (id)_matchingExtensionsCachedResultForKey:(id)a3
{
  os_unfair_lock_s *p_cacheLock;
  id v5;
  void *v6;
  void *v7;

  p_cacheLock = &self->_cacheLock;
  v5 = a3;
  os_unfair_lock_lock(p_cacheLock);
  -[_UIActivityApplicationExtensionsCache cachedResults](self, "cachedResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_cacheLock);
  return v7;
}

- (void)_cacheMatchingExtensionsResult:(id)a3 cacheKey:(id)a4
{
  os_unfair_lock_s *p_cacheLock;
  id v7;
  id v8;
  void *v9;

  p_cacheLock = &self->_cacheLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_cacheLock);
  -[_UIActivityApplicationExtensionsCache cachedResults](self, "cachedResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v7);

  os_unfair_lock_unlock(p_cacheLock);
}

- (void)_cacheMatchingExtensions:(id)a3 cacheKey:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v13 = (id)objc_opt_new();
  v11 = (void *)objc_msgSend(v10, "copy");

  objc_msgSend(v13, "setExtensions:", v11);
  v12 = (void *)objc_msgSend(v8, "copy");

  objc_msgSend(v13, "setError:", v12);
  -[_UIActivityApplicationExtensionsCache _cacheMatchingExtensionsResult:cacheKey:](self, "_cacheMatchingExtensionsResult:cacheKey:", v13, v9);

}

- (void)_startContinuousExtensionDiscoveryForAttributes:(id)a3 cacheKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  id v21;
  id v22;
  _BYTE buf[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_UIActivityApplicationExtensionsCache discoveryQueue](self, "discoveryQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[_UIActivityApplicationExtensionsCache extensionMatchTokens](self, "extensionMatchTokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  share_sheet_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_19E419000, v11, OS_LOG_TYPE_DEFAULT, "ExtensionsCache: continuous discovery is already running for cache key = [%@]", buf, 0xCu);
    }

  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_19E419000, v11, OS_LOG_TYPE_DEFAULT, "ExtensionsCache: start continuous discovery for cache key = [%@]", buf, 0xCu);
    }

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v13 = (void *)MEMORY[0x1E0CB35D8];
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __98___UIActivityApplicationExtensionsCache__startContinuousExtensionDiscoveryForAttributes_cacheKey___block_invoke;
    v20 = &unk_1E4001708;
    v14 = v7;
    v21 = v14;
    objc_copyWeak(&v22, (id *)buf);
    objc_msgSend(v13, "beginMatchingExtensionsWithAttributes:completion:", v6, &v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityApplicationExtensionsCache extensionMatchTokens](self, "extensionMatchTokens", v17, v18, v19, v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v14);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }

}

- (void)primeExtensionsResultWithMatchingAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  _BYTE buf[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _cacheKeyWithMatchingAttributes(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityApplicationExtensionsCache _matchingExtensionsCachedResultForKey:](self, "_matchingExtensionsCachedResultForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v5;
      _os_log_impl(&dword_19E419000, v7, OS_LOG_TYPE_DEFAULT, "ExtensionsCache: found cached result. no priming needed for cache key = [%@]", buf, 0xCu);
    }

  }
  else
  {
    self->_primed = 1;
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    -[_UIActivityApplicationExtensionsCache primedExtensionsQueue](self, "primedExtensionsQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85___UIActivityApplicationExtensionsCache_primeExtensionsResultWithMatchingAttributes___block_invoke;
    block[3] = &unk_1E4001758;
    objc_copyWeak(&v12, (id *)buf);
    v10 = v5;
    v11 = v4;
    dispatch_async(v8, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }

}

- (id)extensionsResultWithMatchingAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  _UIActivityApplicationExtensionsCache *v31;
  id v32;
  id v33;
  _QWORD block[5];
  id v35;
  _BYTE *v36;
  uint8_t v37[4];
  uint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  _BYTE buf[24];
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _cacheKeyWithMatchingAttributes(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityApplicationExtensionsCache _matchingExtensionsCachedResultForKey:](self, "_matchingExtensionsCachedResultForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "extensions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");
      objc_msgSend(v6, "error");
      v10 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      *(_WORD *)&buf[22] = 2112;
      v44 = v10;
      _os_log_impl(&dword_19E419000, v7, OS_LOG_TYPE_DEFAULT, "ExtensionsCache: found %lu cached extensions for cache key = [%@], error = %@", buf, 0x20u);

    }
    if (self->_primed)
      ++self->_cacheMisses;
    else
      ++self->_cacheHits;
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v44 = __Block_byref_object_copy__0;
    v45 = __Block_byref_object_dispose__0;
    v46 = 0;
    -[_UIActivityApplicationExtensionsCache primedExtensionsQueue](self, "primedExtensionsQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80___UIActivityApplicationExtensionsCache_extensionsResultWithMatchingAttributes___block_invoke;
    block[3] = &unk_1E4001780;
    v36 = buf;
    block[4] = self;
    v13 = v5;
    v35 = v13;
    dispatch_sync(v11, block);

    v14 = *(id *)(*(_QWORD *)&buf[8] + 40);
    if (v14)
    {
      v6 = v14;
      share_sheet_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "extensions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");
        objc_msgSend(v6, "error");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v37 = 134218498;
        v38 = v17;
        v39 = 2112;
        v40 = v13;
        v41 = 2112;
        v42 = v18;
        _os_log_impl(&dword_19E419000, v15, OS_LOG_TYPE_DEFAULT, "ExtensionsCache: no cache found but primed %lu extensions ready for cache key = [%@], error = %@", v37, 0x20u);

      }
    }
    else
    {
      -[_UIActivityApplicationExtensionsCache discoveryQueue](self, "discoveryQueue");
      v19 = objc_claimAutoreleasedReturnValue();
      v27 = v12;
      v28 = 3221225472;
      v29 = __80___UIActivityApplicationExtensionsCache_extensionsResultWithMatchingAttributes___block_invoke_290;
      v30 = &unk_1E4001730;
      v31 = self;
      v20 = v4;
      v32 = v20;
      v21 = v13;
      v33 = v21;
      dispatch_async(v19, &v27);

      _syncGetExtensionsResultWithMatchingAttributes(v20, 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      share_sheet_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "extensions", v27, v28, v29, v30, v31, v32);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");
        objc_msgSend(v6, "error");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v37 = 134218498;
        v38 = v24;
        v39 = 2112;
        v40 = v21;
        v41 = 2112;
        v42 = v25;
        _os_log_impl(&dword_19E419000, v22, OS_LOG_TYPE_DEFAULT, "ExtensionsCache: no cache found. got %lu new extensions for cache key = [%@], error = %@", v37, 0x20u);

      }
    }
    ++self->_cacheMisses;

    _Block_object_dispose(buf, 8);
  }
  self->_primed = 0;

  return v6;
}

- (id)reportExtensionsCacheResult
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("extensionsCacheMisses");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_cacheMisses);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("extensionsCacheHits");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_cacheHits);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  self->_cacheMisses = 0;
  self->_cacheHits = 0;
  return v5;
}

- (OS_dispatch_queue)primedExtensionsQueue
{
  return self->_primedExtensionsQueue;
}

- (void)setPrimedExtensionsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_primedExtensionsQueue, a3);
}

- (OS_dispatch_queue)discoveryQueue
{
  return self->_discoveryQueue;
}

- (void)setDiscoveryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryQueue, a3);
}

- (NSMutableDictionary)cachedResults
{
  return self->_cachedResults;
}

- (void)setCachedResults:(id)a3
{
  objc_storeStrong((id *)&self->_cachedResults, a3);
}

- (NSMutableDictionary)extensionMatchTokens
{
  return self->_extensionMatchTokens;
}

- (void)setExtensionMatchTokens:(id)a3
{
  objc_storeStrong((id *)&self->_extensionMatchTokens, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionMatchTokens, 0);
  objc_storeStrong((id *)&self->_cachedResults, 0);
  objc_storeStrong((id *)&self->_discoveryQueue, 0);
  objc_storeStrong((id *)&self->_primedExtensionsQueue, 0);
}

@end
