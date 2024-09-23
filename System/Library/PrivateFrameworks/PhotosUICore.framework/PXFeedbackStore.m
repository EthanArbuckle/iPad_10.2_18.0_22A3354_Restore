@implementation PXFeedbackStore

- (PXFeedbackStore)init
{
  PXFeedbackStore *v2;
  PXFeedbackStore *v3;
  uint64_t v4;
  NSMutableDictionary *store;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXFeedbackStore;
  v2 = -[PXFeedbackStore init](&v7, sel_init);
  v3 = v2;
  if (v2 && !-[PXFeedbackStore _loadStore](v2, "_loadStore"))
  {
    v4 = objc_opt_new();
    store = v3->_store;
    v3->_store = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (void)addFeedbackEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "setAlreadyCollected:", 0);
  -[PXFeedbackStore store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, v6);

  -[PXFeedbackStore _saveStore](self, "_saveStore");
}

- (void)removeFeedbackEntry:(id)a3
{
  NSMutableDictionary *store;
  void *v5;

  store = self->_store;
  objc_msgSend(a3, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](store, "removeObjectForKey:", v5);

  -[PXFeedbackStore _saveStore](self, "_saveStore");
}

- (unint64_t)sentFeedbackCount
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PXFeedbackStore store](self, "store", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "alreadyCollected");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)unsentFeedbackCount
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PXFeedbackStore store](self, "store", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "alreadyCollected") ^ 1;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_storePath
{
  void *v2;
  void *v3;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("PGFeedbackStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_cleanupStore
{
  void *v3;
  NSMutableDictionary *store;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  store = self->_store;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__PXFeedbackStore__cleanupStore__block_invoke;
  v6[3] = &unk_1E513CE70;
  v7 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](store, "enumerateKeysAndObjectsUsingBlock:", v6);
  -[NSMutableDictionary removeObjectsForKeys:](self->_store, "removeObjectsForKeys:", v5);

}

- (BOOL)_saveStore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[PXFeedbackStore _storePath](self, "_storePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB36F8];
  -[PXFeedbackStore store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;

  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to archive savedStore, error: %@", buf, 0xCu);
  }
  v8 = objc_msgSend(v6, "writeToFile:atomically:", v3, 1);

  return v8;
}

- (BOOL)_loadStore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *store;
  void *v15;
  BOOL v16;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99D50];
  -[PXFeedbackStore _storePath](self, "_storePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3710];
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v10, v5, &v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v18;

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v11);
      v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      store = self->_store;
      self->_store = v13;

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to unarchive savedStore, error: %@", buf, 0xCu);
    }

  }
  -[PXFeedbackStore store](self, "store");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 != 0;

  return v16;
}

- (id)longDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>]\n"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("   - sent feedback count    : %ld\n"), -[PXFeedbackStore sentFeedbackCount](self, "sentFeedbackCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("   - unsent feedback count  : %ld\n"), -[PXFeedbackStore unsentFeedbackCount](self, "unsentFeedbackCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("   - stored feedback entries:\n"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PXFeedbackStore store](self, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      v16 = v9;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("      - key: %@\n"), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        ++v15;
        v16 = v9;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return v9;
}

- (NSDictionary)store
{
  return &self->_store->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

void __32__PXFeedbackStore__cleanupStore__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "alreadyCollected"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

@end
