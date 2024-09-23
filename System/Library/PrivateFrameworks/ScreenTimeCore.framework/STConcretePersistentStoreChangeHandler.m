@implementation STConcretePersistentStoreChangeHandler

- (STConcretePersistentStoreChangeHandler)initWithPersistentContainer:(id)a3
{
  NSPersistentContainer *v4;
  STConcretePersistentStoreChangeHandler *v5;
  NSPersistentContainer *persistentContainer;
  NSPersistentContainer *v7;
  uint64_t v8;
  NSMutableDictionary *lastPersistentHistoryTokenByStoreIdentifier;
  uint64_t v10;
  NSObject *lastPersistentHistoryTokenByStoreIdentifierLock;
  objc_super v13;

  v4 = (NSPersistentContainer *)a3;
  v13.receiver = self;
  v13.super_class = (Class)STConcretePersistentStoreChangeHandler;
  v5 = -[STConcretePersistentStoreChangeHandler init](&v13, sel_init);
  persistentContainer = v5->_persistentContainer;
  v5->_persistentContainer = v4;
  v7 = v4;

  v8 = objc_opt_new();
  lastPersistentHistoryTokenByStoreIdentifier = v5->_lastPersistentHistoryTokenByStoreIdentifier;
  v5->_lastPersistentHistoryTokenByStoreIdentifier = (NSMutableDictionary *)v8;

  v10 = objc_opt_new();
  lastPersistentHistoryTokenByStoreIdentifierLock = v5->_lastPersistentHistoryTokenByStoreIdentifierLock;
  v5->_lastPersistentHistoryTokenByStoreIdentifierLock = v10;

  return v5;
}

- (void)handleRemotePersistentStoreDidChange:(id)a3 inContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a4;
  objc_msgSend(a3, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C97A08]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89__STConcretePersistentStoreChangeHandler_handleRemotePersistentStoreDidChange_inContext___block_invoke;
  v11[3] = &unk_1E93711B0;
  v11[4] = self;
  v12 = v8;
  v13 = v6;
  v9 = v6;
  v10 = v8;
  objc_msgSend(v9, "performBlockAndWait:", v11);

}

void __89__STConcretePersistentStoreChangeHandler_handleRemotePersistentStoreDidChange_inContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  void *v34;
  _BYTE v35[128];
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStoreCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistentStoreForIdentifier:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "persistentHistoryTokenForStore:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97BD8], "fetchHistoryAfterToken:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAffectedStores:", v7);

    objc_msgSend(v6, "setResultType:", 5);
    v8 = *(void **)(a1 + 48);
    v33 = 0;
    objc_msgSend(v8, "executeRequest:error:", v6, &v33);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v33;
    v11 = v10;
    if (v9)
    {
      v22 = v10;
      v23 = v9;
      v24 = v6;
      v25 = v4;
      objc_msgSend(v9, "result");
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v28)
      {
        v27 = *(_QWORD *)v30;
        do
        {
          v12 = 0;
          v13 = v5;
          do
          {
            if (*(_QWORD *)v30 != v27)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v12);
            v15 = (void *)MEMORY[0x1D8234BBC]();
            objc_msgSend(v14, "token");
            v5 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = (void *)MEMORY[0x1E0C97B88];
            objc_msgSend(v14, "objectIDNotification");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "userInfo");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "viewContext");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v20;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "mergeChangesFromRemoteContextSave:intoContexts:", v18, v21);

            objc_autoreleasePoolPop(v15);
            ++v12;
            v13 = v5;
          }
          while (v28 != v12);
          v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
        }
        while (v28);
      }

      v6 = v24;
      v4 = v25;
      v11 = v22;
      v9 = v23;
    }
    objc_msgSend(*(id *)(a1 + 32), "savePersistentHistoryToken:forStore:", v5, v4);

  }
}

- (void)handlePersistentStoreCoordinatorStoresDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *obj;
  id v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  -[STConcretePersistentStoreChangeHandler persistentContainer](self, "persistentContainer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "persistentStoreCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  obj = self->_lastPersistentHistoryTokenByStoreIdentifierLock;
  objc_sync_enter(obj);
  -[STConcretePersistentStoreChangeHandler lastPersistentHistoryTokenByStoreIdentifier](self, "lastPersistentHistoryTokenByStoreIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "userInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0C97808]);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v35;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v6);
        v39 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v9);
        v10 = v39;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1, obj);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "currentPersistentHistoryTokenFromStores:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v13);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v7);
  }

  objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0C979B8]);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v31;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v17), "identifier", obj);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "removeObjectForKey:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v15);
  }

  objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0C97A10]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v19, "count") >= 2)
  {
    objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, v24);

    objc_msgSend(v20, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v25);

  }
  objc_sync_exit(obj);

}

- (id)persistentHistoryTokenForStore:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self->_lastPersistentHistoryTokenByStoreIdentifierLock;
  objc_sync_enter(v5);
  -[STConcretePersistentStoreChangeHandler lastPersistentHistoryTokenByStoreIdentifier](self, "lastPersistentHistoryTokenByStoreIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v8;
}

- (void)savePersistentHistoryToken:(id)a3 forStore:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = self->_lastPersistentHistoryTokenByStoreIdentifierLock;
  objc_sync_enter(v7);
  -[STConcretePersistentStoreChangeHandler lastPersistentHistoryTokenByStoreIdentifier](self, "lastPersistentHistoryTokenByStoreIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);

  objc_sync_exit(v7);
}

- (NSPersistentContainer)persistentContainer
{
  return (NSPersistentContainer *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)lastPersistentHistoryTokenByStoreIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPersistentHistoryTokenByStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_lastPersistentHistoryTokenByStoreIdentifierLock, 0);
}

@end
