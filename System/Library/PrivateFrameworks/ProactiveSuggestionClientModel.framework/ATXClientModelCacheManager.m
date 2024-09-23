@implementation ATXClientModelCacheManager

void __62__ATXClientModelCacheManager_cachedSuggestionsForClientModel___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = (void *)MEMORY[0x1AF421DC4]();
  objc_msgSend(*(id *)(a1 + 32), "cacheFileHandlerForClientModel:guardedData:", *(_QWORD *)(a1 + 40), v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readSuggestionsFromCache");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_autoreleasePoolPop(v3);
}

- (id)cachedSuggestionsForClientModel:(id)a3
{
  id v4;
  _PASLock *clientModelCacheHandlersLock;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  clientModelCacheHandlersLock = self->_clientModelCacheHandlersLock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__ATXClientModelCacheManager_cachedSuggestionsForClientModel___block_invoke;
  v9[3] = &unk_1E57CE8E8;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[_PASLock runWithLockAcquired:](clientModelCacheHandlersLock, "runWithLockAcquired:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)updateCachedSuggestions:(id)a3
{
  id v4;
  _PASLock *clientModelCacheHandlersLock;
  id v6;
  _QWORD v7[4];
  id v8;
  ATXClientModelCacheManager *v9;

  v4 = a3;
  clientModelCacheHandlersLock = self->_clientModelCacheHandlersLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__ATXClientModelCacheManager_updateCachedSuggestions___block_invoke;
  v7[3] = &unk_1E57CE898;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](clientModelCacheHandlersLock, "runWithLockAcquired:", v7);

}

void __54__ATXClientModelCacheManager_updateCachedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id *v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clientModelId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "cacheFileHandlerForClientModel:guardedData:", v3, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "suggestions");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(*(id *)(a1 + 32), "suggestions"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6,
        v8))
  {
    objc_msgSend(v4, "createCacheFileForClientModelCacheUpdate:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v4, "deleteCachedSuggestionsFile");
    objc_msgSend(v9[1], "removeObjectForKey:", v3);
  }

}

- (id)cacheFileHandlerForClientModel:(id)a3 guardedData:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = *((id *)a4 + 1);
  v8 = a3;
  -[ATXClientModelCacheManager addNewCacheHandlerIfNeededGivenExistingCacheHandlersInGuardedData:clientModelId:](self, "addNewCacheHandlerIfNeededGivenExistingCacheHandlersInGuardedData:clientModelId:", a4, v8);
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)addNewCacheHandlerIfNeededGivenExistingCacheHandlersInGuardedData:(id)a3 clientModelId:(id)a4
{
  id v6;
  void *v7;
  ATXClientModelCacheFileHandler *v8;
  void *v9;
  ATXClientModelCacheFileHandler *v10;
  id *v11;

  v11 = (id *)a3;
  v6 = a4;
  objc_msgSend(v11[1], "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = [ATXClientModelCacheFileHandler alloc];
    -[ATXClientModelCacheManager cacheDirectory](self, "cacheDirectory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ATXClientModelCacheFileHandler initWithCacheFileBasePath:clientModelId:](v8, "initWithCacheFileBasePath:clientModelId:", v9, v6);
    objc_msgSend(v11[1], "setObject:forKeyedSubscript:", v10, v6);

  }
}

- (id)cacheDirectory
{
  return (id)objc_msgSend(MEMORY[0x1E0CF94D8], "clientModelCachesRootDirectory");
}

- (ATXClientModelCacheManager)init
{
  ATXClientModelCacheManager *v2;
  ATXClientModelCacheManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXClientModelCacheManager;
  v2 = -[ATXClientModelCacheManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[ATXClientModelCacheManager initGuardedData](v2, "initGuardedData");
    -[ATXClientModelCacheManager addCacheHandlersForExistingClientModelCaches](v3, "addCacheHandlersForExistingClientModelCaches");
  }
  return v3;
}

- (void)initGuardedData
{
  _PASLock *v3;
  _PASLock *clientModelCacheHandlersLock;
  id v5;

  v5 = (id)objc_opt_new();
  v3 = (_PASLock *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v5);
  clientModelCacheHandlersLock = self->_clientModelCacheHandlersLock;
  self->_clientModelCacheHandlersLock = v3;

}

- (void)addCacheHandlersForExistingClientModelCaches
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  _PASLock *clientModelCacheHandlersLock;
  id v15;
  id obj;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXClientModelCacheManager cacheDirectory](self, "cacheDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      v9 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x1AF421DC4]();
          +[ATXClientModelCacheFileHandler clientModelIdFromFileName:](ATXClientModelCacheFileHandler, "clientModelIdFromFileName:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          clientModelCacheHandlersLock = self->_clientModelCacheHandlersLock;
          v17[0] = v9;
          v17[1] = 3221225472;
          v17[2] = __74__ATXClientModelCacheManager_addCacheHandlersForExistingClientModelCaches__block_invoke;
          v17[3] = &unk_1E57CE898;
          v17[4] = self;
          v18 = v13;
          v15 = v13;
          -[_PASLock runWithLockAcquired:](clientModelCacheHandlersLock, "runWithLockAcquired:", v17);

          objc_autoreleasePoolPop(v12);
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v7);
    }

  }
}

void __74__ATXClientModelCacheManager_addCacheHandlersForExistingClientModelCaches__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "addNewCacheHandlerIfNeededGivenExistingCacheHandlersInGuardedData:clientModelId:", a2, *(_QWORD *)(a1 + 40));
  __atxlog_handle_blending();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1AA841000, v3, OS_LOG_TYPE_DEFAULT, "Blending: Recovered suggestions for Client Model: <<%@>>", (uint8_t *)&v5, 0xCu);
  }

}

- (id)cachedSuggestionsForAllClientModels
{
  _PASLock *clientModelCacheHandlersLock;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = (id)objc_opt_new();
  clientModelCacheHandlersLock = self->_clientModelCacheHandlersLock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__ATXClientModelCacheManager_cachedSuggestionsForAllClientModels__block_invoke;
  v6[3] = &unk_1E57CE8C0;
  v6[4] = self;
  v6[5] = &v7;
  -[_PASLock runWithLockAcquired:](clientModelCacheHandlersLock, "runWithLockAcquired:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __65__ATXClientModelCacheManager_cachedSuggestionsForAllClientModels__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3[1];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1AF421DC4]();
        objc_msgSend(*(id *)(a1 + 32), "cachedSuggestionsForClientModel:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v12, v10);

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (id)lastCacheUpdateDateForClientModel:(id)a3
{
  id v4;
  _PASLock *clientModelCacheHandlersLock;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  clientModelCacheHandlersLock = self->_clientModelCacheHandlersLock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__ATXClientModelCacheManager_lastCacheUpdateDateForClientModel___block_invoke;
  v9[3] = &unk_1E57CE8E8;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[_PASLock runWithLockAcquired:](clientModelCacheHandlersLock, "runWithLockAcquired:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __64__ATXClientModelCacheManager_lastCacheUpdateDateForClientModel___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cacheFileHandlerForClientModel:guardedData:", *(_QWORD *)(a1 + 40), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cacheFilePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v5, "attributesOfItemAtPath:error:", v4, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;

  if (v7)
  {
    objc_msgSend(v7, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "code");

    __atxlog_handle_blending();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10 == 2)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v18 = v13;
        _os_log_impl(&dword_1AA841000, v12, OS_LOG_TYPE_DEFAULT, "There is no client model cache file for clientModelId: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      __64__ATXClientModelCacheManager_lastCacheUpdateDateForClientModel___block_invoke_cold_1((uint64_t)v7, v12);
    }
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A88]);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(NSObject **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;
  }

}

- (double)cacheAgeForClientModel:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[ATXClientModelCacheManager lastCacheUpdateDateForClientModel:](self, "lastCacheUpdateDateForClientModel:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "timeIntervalSinceNow");
    v6 = -v5;
  }
  else
  {
    v6 = -1.0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientModelCacheHandlersLock, 0);
}

void __64__ATXClientModelCacheManager_lastCacheUpdateDateForClientModel___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1AA841000, a2, OS_LOG_TYPE_FAULT, "Encountered error getting cache age: %@", (uint8_t *)&v2, 0xCu);
}

@end
