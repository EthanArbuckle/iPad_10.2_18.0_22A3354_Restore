@implementation UIActivityApplicationExtensionsCache

void __62___UIActivityApplicationExtensionsCache_sharedExtensionsCache__block_invoke()
{
  _UIActivityApplicationExtensionsCache *v0;
  void *v1;

  v0 = objc_alloc_init(_UIActivityApplicationExtensionsCache);
  v1 = (void *)sharedExtensionsCache_extensionsCache;
  sharedExtensionsCache_extensionsCache = (uint64_t)v0;

}

uint64_t __85___UIActivityApplicationExtensionsCache__startPrecachingContinuousExtensionDiscovery__block_invoke(uint64_t a1)
{
  void (*v2)(void);
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  uint8_t v18[128];
  __int128 buf;
  void *(*v20)(uint64_t);
  void *v21;
  uint64_t *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v2 = (void (*)(void))getDMPerformMigrationIfNeededSymbolLoc_ptr;
  v17 = getDMPerformMigrationIfNeededSymbolLoc_ptr;
  if (!getDMPerformMigrationIfNeededSymbolLoc_ptr)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v20 = __getDMPerformMigrationIfNeededSymbolLoc_block_invoke;
    v21 = &unk_1E4001370;
    v22 = &v14;
    __getDMPerformMigrationIfNeededSymbolLoc_block_invoke((uint64_t)&buf);
    v2 = (void (*)(void))v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v2)
  {
    __85___UIActivityApplicationExtensionsCache__startPrecachingContinuousExtensionDiscovery__block_invoke_cold_1();
    __break(1u);
  }
  v2();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  result = objc_msgSend(&unk_1E403F4E8, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
  v4 = result;
  if (result)
  {
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(&unk_1E403F4E8);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        _cacheKeyWithMatchingAttributes(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_startContinuousExtensionDiscoveryForAttributes:cacheKey:", v7, v8);
        share_sheet_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v8;
          _os_log_impl(&dword_19E419000, v9, OS_LOG_TYPE_DEFAULT, "ExtensionsCache: registered for cache key = [%@]", (uint8_t *)&buf, 0xCu);
        }

        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(&unk_1E403F4E8, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

void __98___UIActivityApplicationExtensionsCache__startContinuousExtensionDiscoveryForAttributes_cacheKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *WeakRetained;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  share_sheet_log();
  v7 = objc_claimAutoreleasedReturnValue();
  WeakRetained = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __98___UIActivityApplicationExtensionsCache__startContinuousExtensionDiscoveryForAttributes_cacheKey___block_invoke_cold_1(a1, (uint64_t)v6, WeakRetained);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(v5, "count");
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 134218242;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_19E419000, WeakRetained, OS_LOG_TYPE_DEFAULT, "ExtensionsCache: %lu new extensions from NSExtension for cache key = [%@]", (uint8_t *)&v11, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[NSObject _cacheMatchingExtensions:cacheKey:error:](WeakRetained, "_cacheMatchingExtensions:cacheKey:error:", v5, *(_QWORD *)(a1 + 32), 0);
  }

}

void __85___UIActivityApplicationExtensionsCache_primeExtensionsResultWithMatchingAttributes___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_matchingExtensionsCachedResultForKey:", a1[4]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(v3, "discoveryQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __85___UIActivityApplicationExtensionsCache_primeExtensionsResultWithMatchingAttributes___block_invoke_2;
      block[3] = &unk_1E4001730;
      block[4] = v3;
      v9 = a1[5];
      v10 = a1[4];
      dispatch_async(v5, block);

      _syncGetExtensionsResultWithMatchingAttributes(a1[5], 1, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      share_sheet_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = a1[4];
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "ExtensionsCache: priming done for cache key = [%@]", buf, 0xCu);
      }

      objc_msgSend(v3, "_cacheMatchingExtensionsResult:cacheKey:", v4, a1[4]);
    }

  }
}

uint64_t __85___UIActivityApplicationExtensionsCache_primeExtensionsResultWithMatchingAttributes___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startContinuousExtensionDiscoveryForAttributes:cacheKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __80___UIActivityApplicationExtensionsCache_extensionsResultWithMatchingAttributes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_matchingExtensionsCachedResultForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __80___UIActivityApplicationExtensionsCache_extensionsResultWithMatchingAttributes___block_invoke_290(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startContinuousExtensionDiscoveryForAttributes:cacheKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __85___UIActivityApplicationExtensionsCache__startPrecachingContinuousExtensionDiscovery__block_invoke_cold_1()
{
  int v0;
  int v1;
  os_log_t v2;

  dlerror();
  v0 = abort_report_np();
  return __98___UIActivityApplicationExtensionsCache__startContinuousExtensionDiscoveryForAttributes_cacheKey___block_invoke_cold_1(v0, v1, v2);
}

void __98___UIActivityApplicationExtensionsCache__startContinuousExtensionDiscoveryForAttributes_cacheKey___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_19E419000, log, OS_LOG_TYPE_ERROR, "ExtensionsCache: continuous extension discovery failed for cacheKey = [%@], error = %@", (uint8_t *)&v4, 0x16u);
}

@end
