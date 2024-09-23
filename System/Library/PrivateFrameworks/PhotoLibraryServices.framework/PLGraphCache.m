@implementation PLGraphCache

- (PLGraphCache)init
{
  PLGraphCache *v2;
  PLGraphCache *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *lock_classesByLabelID;
  NSMutableDictionary *v6;
  NSMutableDictionary *lock_labelIDsByCode;
  uint64_t v8;
  NSString *logPrefix;
  PLGraphCache *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PLGraphCache;
  v2 = -[PLGraphCache init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_lock_cacheIsPopulated = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lock_classesByLabelID = v3->_lock_classesByLabelID;
    v3->_lock_classesByLabelID = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lock_labelIDsByCode = v3->_lock_labelIDsByCode;
    v3->_lock_labelIDsByCode = v6;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLGraphCache-%p"), v3);
    v8 = objc_claimAutoreleasedReturnValue();
    logPrefix = v3->_logPrefix;
    v3->_logPrefix = (NSString *)v8;

    v10 = v3;
  }

  return v3;
}

- (void)clearCache
{
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLBackendGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[PLGraphCache logPrefix](self, "logPrefix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "%{public}@: Clearing cache", buf, 0xCu);

  }
  PLRunWithUnfairLock();
}

- (void)_lock_clearCache
{
  os_unfair_lock_assert_owner(&self->_lock);
  self->_lock_cacheIsPopulated = 0;
  -[NSMutableDictionary removeAllObjects](self->_lock_classesByLabelID, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_lock_labelIDsByCode, "removeAllObjects");
}

- (id)labelWithCode:(unsigned int)a3 inContext:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[PLGraphCache objectIDForLabelWithCode:inContext:](self, "objectIDForLabelWithCode:inContext:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PLGraphCache _existingLabelWithID:inContext:](self, "_existingLabelWithID:inContext:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_existingLabelWithID:(id)a3 inContext:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0;
  objc_msgSend(a4, "existingObjectWithID:error:", v6, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (!v7)
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[PLGraphCache logPrefix](self, "logPrefix");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v10;
      v15 = 2114;
      v16 = v6;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Error getting label with ID %{public}@: %@", buf, 0x20u);

    }
  }

  return v7;
}

- (id)objectIDForLabelWithCode:(unsigned int)a3 inContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v10;

  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLGraphCache.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  v7 = v6;
  PLResultWithUnfairLock();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_lock_objectIDForLabelWithCode:(unsigned int)a3 inContext:(id)a4
{
  uint64_t v4;
  id v6;
  NSMutableDictionary *lock_labelIDsByCode;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  -[PLGraphCache _lock_populateCacheIfNecessaryWithContext:](self, "_lock_populateCacheIfNecessaryWithContext:", v6);
  lock_labelIDsByCode = self->_lock_labelIDsByCode;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](lock_labelIDsByCode, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[PLGraphCache _lock_fetchAndCacheWithLabelCode:inContext:](self, "_lock_fetchAndCacheWithLabelCode:inContext:", v4, v6);
    v10 = self->_lock_labelIDsByCode;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)_lock_fetchAndCacheWithLabelCode:(unsigned int)a3 inContext:(id)a4
{
  uint64_t v4;
  os_unfair_lock_s *p_lock;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v4 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  v7 = a4;
  os_unfair_lock_assert_owner(p_lock);
  +[PLGraphLabel fetchLabelWithCode:inContext:](PLGraphLabel, "fetchLabelWithCode:inContext:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PLGraphCache _lock_addLabelToCache:](self, "_lock_addLabelToCache:", v8);
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[PLGraphCache logPrefix](self, "logPrefix");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v10;
      v13 = 1024;
      v14 = v4;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "%{public}@: Added label with code %u to cache: %@", (uint8_t *)&v11, 0x1Cu);

    }
  }

}

- (id)cachedObjectIDForLabelWithCode:(unsigned int)a3
{
  PLResultWithUnfairLock();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)countOfCachedObjectIDs
{
  unint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  PLRunWithUnfairLock();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (Class)classFromLabelID:(id)a3 withContext:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  objc_class *v11;
  void *v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLGraphCache.m"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  v14 = v8;
  v15 = v7;
  v9 = v7;
  v10 = v8;
  v11 = (objc_class *)(id)PLResultWithUnfairLock();

  return v11;
}

- (Class)cachedClassFromLabelID:(id)a3
{
  id v3;
  objc_class *v4;
  id v6;

  v6 = a3;
  v3 = v6;
  v4 = (objc_class *)(id)PLResultWithUnfairLock();

  return v4;
}

- (unint64_t)countOfCachedClasses
{
  unint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  PLRunWithUnfairLock();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)_lock_populateCacheIfNecessaryWithContext:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_lock_cacheIsPopulated)
  {
    v4 = (void *)MEMORY[0x19AEC1554]();
    -[PLGraphCache _lock_populateCacheWithAllLabelsInContext:](self, "_lock_populateCacheWithAllLabelsInContext:", v5);
    objc_autoreleasePoolPop(v4);
  }

}

- (void)_lock_populateCacheWithAllLabelsInContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_lock_cacheIsPopulated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLGraphCache.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_lock_cacheIsPopulated"));

  }
  +[PLGraphLabel fetchRequest](PLGraphLabel, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIncludesPendingChanges:", 0);
  v25 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v6, &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;
  if (v7)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          -[PLGraphCache _lock_addLabelToCache:](self, "_lock_addLabelToCache:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v11);
    }

    self->_lock_cacheIsPopulated = 1;
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[PLGraphCache logPrefix](self, "logPrefix");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 138543618;
      v28 = v15;
      v29 = 2048;
      v30 = v16;
      v17 = "%{public}@: Populated cache with %zu labels";
      v18 = v14;
      v19 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_199541000, v18, v19, v17, buf, 0x16u);

    }
  }
  else
  {
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[PLGraphCache logPrefix](self, "logPrefix");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v15;
      v29 = 2112;
      v30 = (uint64_t)v8;
      v17 = "%{public}@: Error fetching labels: %@";
      v18 = v14;
      v19 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }

}

- (void)_lock_addLabelToCache:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *lock_labelIDsByCode;
  void *v7;
  NSString *v8;
  Class v9;
  NSMutableDictionary *lock_classesByLabelID;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  lock_labelIDsByCode = self->_lock_labelIDsByCode;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "code"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](lock_labelIDsByCode, "setObject:forKeyedSubscript:", v5, v7);

  objc_msgSend(v4, "plsClassName");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = NSClassFromString(v8);

  if (v9)
  {
    if (-[objc_class isSubclassOfClass:](v9, "isSubclassOfClass:", objc_opt_class()))
    {
      lock_classesByLabelID = self->_lock_classesByLabelID;
      objc_msgSend(v4, "objectID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](lock_classesByLabelID, "setObject:forKeyedSubscript:", v9, v11);

    }
    else
    {
      PLBackendGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        -[PLGraphCache logPrefix](self, "logPrefix");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "plsClassName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v13;
        v17 = 2114;
        v18 = v14;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_FAULT, "%{public}@: Class with name: %{public}@ does not inherit from PLGraphNodeContainer.", (uint8_t *)&v15, 0x16u);

      }
    }
  }

}

- (NSString)logPrefix
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_lock_labelIDsByCode, 0);
  objc_storeStrong((id *)&self->_lock_classesByLabelID, 0);
}

uint64_t __36__PLGraphCache_countOfCachedClasses__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __39__PLGraphCache_cachedClassFromLabelID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
}

uint64_t __45__PLGraphCache_classFromLabelID_withContext___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_lock_populateCacheIfNecessaryWithContext:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
}

uint64_t __38__PLGraphCache_countOfCachedObjectIDs__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id __47__PLGraphCache_cachedObjectIDForLabelWithCode___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __51__PLGraphCache_objectIDForLabelWithCode_inContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_objectIDForLabelWithCode:inContext:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __26__PLGraphCache_clearCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_clearCache");
}

@end
