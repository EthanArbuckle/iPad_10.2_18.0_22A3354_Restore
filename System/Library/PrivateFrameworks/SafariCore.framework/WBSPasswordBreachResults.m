@implementation WBSPasswordBreachResults

- (WBSPasswordBreachResults)initWithContext:(id)a3
{
  id v5;
  WBSPasswordBreachResults *v6;
  WBSPasswordBreachResults *v7;
  WBSPasswordBreachResults *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSPasswordBreachResults;
  v6 = -[WBSPasswordBreachResults init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = v7;
  }

  return v7;
}

- (id)resultRecordsForQueries:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  WBSPasswordBreachResultRecord *v14;
  WBSPasswordBreachResultRecord *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  os_unfair_lock_s *lock;
  char v21;
  id obj;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[WBSPasswordBreachResults _restoreResultsFromPersistentStoreIfNecessary](self, "_restoreResultsFromPersistentStoreIfNecessary");
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v8)
  {

    goto LABEL_15;
  }
  v9 = v8;
  lock = &self->_lock;
  v21 = 0;
  v10 = *(_QWORD *)v25;
  obj = v7;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v25 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
      objc_msgSend(v12, "persistentIdentifier", lock);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_resultRecordsByPersistentIdentifier, "objectForKeyedSubscript:", v13);
      v14 = (WBSPasswordBreachResultRecord *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = v14;
        -[WBSPasswordBreachResultRecord dateLastModified](v14, "dateLastModified");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dateLastModified");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "compare:", v17);

        if (v18 != -1)
          goto LABEL_10;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_resultRecordsByPersistentIdentifier, "setObject:forKeyedSubscript:", 0, v13);

        v21 = 1;
      }
      v15 = -[WBSPasswordBreachResultRecord initWithPersistentIdentifier:result:dateLastModified:]([WBSPasswordBreachResultRecord alloc], "initWithPersistentIdentifier:result:dateLastModified:", v13, 0, v23);
LABEL_10:
      objc_msgSend(v6, "addObject:", v15);

    }
    v7 = obj;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  }
  while (v9);

  p_lock = lock;
  if ((v21 & 1) != 0)
    -[WBSPasswordBreachResults _saveResultsToPersistentStore](self, "_saveResultsToPersistentStore");
LABEL_15:
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)addResultRecords:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  __CFString *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *log;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  __CFString *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[WBSPasswordBreachResults _restoreResultsFromPersistentStoreIfNecessary](self, "_restoreResultsFromPersistentStoreIfNecessary");
  -[WBSPasswordBreachContext configuration](self->_context, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "verboseSensitiveLoggingEnabled");

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "result");
        objc_msgSend(v12, "persistentIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_resultRecordsByPersistentIdentifier, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_resultRecordsByPersistentIdentifier, "setObject:forKeyedSubscript:", v12, v14);
        if (objc_msgSend(v15, "result") == 1 && (v13 & 0xFFFFFFFFFFFFFFFELL) == 2)
          -[NSMutableSet addObject:](self->_recentlyBreachedPersistentIdentifiers, "addObject:", v14);
        if (v6)
        {
          if (v13 > 3)
            v17 = 0;
          else
            v17 = off_1E649DD48[v13];
          v18 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            v20 = (void *)MEMORY[0x1E0CB3940];
            log = v18;
            objc_msgSend(v20, "safari_stringAsHexWithData:", v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138740227;
            v27 = v19;
            v28 = 2117;
            v29 = v17;
            _os_log_debug_impl(&dword_1B2621000, log, OS_LOG_TYPE_DEBUG, "Result for persistent identifier %{sensitive}@: %{sensitive}@", buf, 0x16u);

          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v9);
  }

  -[WBSPasswordBreachResults _saveResultsToPersistentStore](self, "_saveResultsToPersistentStore");
  os_unfair_lock_unlock(&self->_lock);

}

- (void)markAllCompromisedResultRecordsAsRecentlyBreached
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *resultRecordsByPersistentIdentifier;
  _QWORD v5[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  resultRecordsByPersistentIdentifier = self->_resultRecordsByPersistentIdentifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__WBSPasswordBreachResults_markAllCompromisedResultRecordsAsRecentlyBreached__block_invoke;
  v5[3] = &unk_1E649DD08;
  v5[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](resultRecordsByPersistentIdentifier, "enumerateKeysAndObjectsUsingBlock:", v5);
  os_unfair_lock_unlock(p_lock);
}

void __77__WBSPasswordBreachResults_markAllCompromisedResultRecordsAsRecentlyBreached__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if ((objc_msgSend(a3, "result") & 0xFFFFFFFFFFFFFFFELL) == 2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", v5);

}

- (id)recentlyBreachedResultRecords
{
  os_unfair_lock_s *p_lock;
  id v4;
  id v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[WBSPasswordBreachResults _restoreResultsFromPersistentStoreIfNecessary](self, "_restoreResultsFromPersistentStoreIfNecessary");
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_recentlyBreachedPersistentIdentifiers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_resultRecordsByPersistentIdentifier, "objectForKeyedSubscript:", v11, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = v5;
          v14 = v12;
        }
        else
        {
          v13 = v4;
          v14 = v11;
        }
        objc_msgSend(v13, "addObject:", v14);

      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v4, "count"))
  {
    -[NSMutableSet minusSet:](self->_recentlyBreachedPersistentIdentifiers, "minusSet:", v4);
    -[WBSPasswordBreachResults _saveResultsToPersistentStore](self, "_saveResultsToPersistentStore");
  }
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (void)clearRecentlyBreachedResultRecords
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[WBSPasswordBreachResults _restoreResultsFromPersistentStoreIfNecessary](self, "_restoreResultsFromPersistentStoreIfNecessary");
  -[NSMutableSet removeAllObjects](self->_recentlyBreachedPersistentIdentifiers, "removeAllObjects");
  -[WBSPasswordBreachResults _saveResultsToPersistentStore](self, "_saveResultsToPersistentStore");
  os_unfair_lock_unlock(p_lock);
}

- (void)clearAllResultsSynchronously
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet removeAllObjects](self->_recentlyBreachedPersistentIdentifiers, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_resultRecordsByPersistentIdentifier, "removeAllObjects");
  -[WBSPasswordBreachResults _saveResultsToPersistentStore](self, "_saveResultsToPersistentStore");
  -[WBSPasswordBreachContext store](self->_context, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveStoreSynchronously");

  os_unfair_lock_unlock(p_lock);
}

- (void)_saveResultsToPersistentStore
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  os_unfair_lock_assert_owner(&self->_lock);
  -[WBSPasswordBreachContext store](self->_context, "store");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allValues](self->_resultRecordsByPersistentIdentifier, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_37);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setResultRecords:", v4);
  -[NSMutableSet allObjects](self->_recentlyBreachedPersistentIdentifiers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRecentlyBreachedPersistentIdentifiers:", v5);

}

uint64_t __57__WBSPasswordBreachResults__saveResultsToPersistentStore__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (void)_restoreResultsFromPersistentStoreIfNecessary
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_8(&dword_1B2621000, (int)a2, a3, "Unexpected non-dictionary type in saved results.", a1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyBreachedPersistentIdentifiers, 0);
  objc_storeStrong((id *)&self->_resultRecordsByPersistentIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
