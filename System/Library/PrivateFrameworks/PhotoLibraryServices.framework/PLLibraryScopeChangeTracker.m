@implementation PLLibraryScopeChangeTracker

- (PLLibraryScopeChangeTracker)initWithManagedObjectContext:(id)a3
{
  id v5;
  PLLibraryScopeChangeTracker *v6;
  PLLibraryScopeChangeTracker *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLLibraryScopeChangeTracker;
  v6 = -[PLLibraryScopeChangeTracker init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (BOOL)hasChangeTrackerToken
{
  return self->_lastKnownToken != 0;
}

- (void)clearToken
{
  NSPersistentHistoryToken *lastKnownToken;

  lastKnownToken = self->_lastKnownToken;
  self->_lastKnownToken = 0;

}

- (BOOL)start
{
  void *v3;
  NSPersistentHistoryToken *v4;
  NSPersistentHistoryToken *lastKnownToken;
  NSObject *v6;
  NSPersistentHistoryToken *v7;
  int v9;
  NSPersistentHistoryToken *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PLLibraryScopeChangeTracker clearToken](self, "clearToken");
  -[PLLibraryScopeChangeTracker lastKnownTokenFromDisk](self, "lastKnownTokenFromDisk");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PLLibraryScopeChangeTracker currentToken](self, "currentToken");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = (NSPersistentHistoryToken *)objc_msgSend(v3, "copy");
  lastKnownToken = self->_lastKnownToken;
  self->_lastKnownToken = v4;

  PLBackendSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = self->_lastKnownToken;
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Set initial last known tokens to: %@", (uint8_t *)&v9, 0xCu);
  }

  -[PLLibraryScopeChangeTracker saveLastKnownChangeTrackerTokenToDisk](self, "saveLastKnownChangeTrackerTokenToDisk");
  return 1;
}

- (id)currentToken
{
  void *v2;
  void *v3;

  -[NSManagedObjectContext persistentStoreCoordinator](self->_context, "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPersistentHistoryTokenFromStores:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)lastKnownTokenFromDisk
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "readRulesTrackerToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  PLBackendSharingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "Last known token from disk: %@", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (void)saveLastKnownChangeTrackerTokenToDisk
{
  NSObject *v3;
  NSPersistentHistoryToken *lastKnownToken;
  id WeakRetained;
  int v6;
  NSPersistentHistoryToken *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLBackendSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    lastKnownToken = self->_lastKnownToken;
    v6 = 138412290;
    v7 = lastKnownToken;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Saving last known token to disk: %@", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "saveRulesTrackerToken:", self->_lastKnownToken);

}

- (id)fetchObjectsNeedingEvaluation
{
  NSObject *v3;
  NSPersistentHistoryToken *lastKnownToken;
  int v6;
  NSPersistentHistoryToken *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLBackendSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    lastKnownToken = self->_lastKnownToken;
    v6 = 138412290;
    v7 = lastKnownToken;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Fetch all events since token: %@", (uint8_t *)&v6, 0xCu);
  }

  -[PLLibraryScopeChangeTracker fetchResultsSincePersistentHistoryToken:](self, "fetchResultsSincePersistentHistoryToken:", self->_lastKnownToken);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fetchResultsSincePersistentHistoryToken:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  PLLibraryScopeTransactionResult *v11;
  void *v12;
  void *v13;
  void *v14;
  PLLibraryScopeTransactionResult *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[16];

  v4 = a3;
  if (!v4)
  {
    PLBackendSharingGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Token is nil so fetching ALL transactions", buf, 2u);
    }

  }
  -[PLLibraryScopeChangeTracker _transactionIteratorSinceToken:](self, "_transactionIteratorSinceToken:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__PLLibraryScopeChangeTracker_fetchResultsSincePersistentHistoryToken___block_invoke;
  v17[3] = &unk_1E3674DA8;
  v17[4] = self;
  v18 = v7;
  v19 = v8;
  v9 = v8;
  v10 = v7;
  objc_msgSend(v6, "enumerateRemainingTransactionsWithBlock:", v17);
  v11 = [PLLibraryScopeTransactionResult alloc];
  objc_msgSend(v6, "lastIteratedToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PLLibraryScopeTransactionResult initWithToken:assetObjectIDs:detectedFaceObjectIDs:](v11, "initWithToken:assetObjectIDs:detectedFaceObjectIDs:", v12, v13, v14);

  return v15;
}

- (id)_transactionIteratorSinceToken:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSManagedObjectContext *context;
  void *v22;
  id v23;
  NSObject *v24;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C97B48];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(MEMORY[0x1E0C97BD0], "entityDescriptionWithContext:", self->_context);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEntity:", v7);
  v8 = (void *)MEMORY[0x1E0C97B20];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entityForName:inManagedObjectContext:", v9, self->_context);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C97B20];
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "entityForName:inManagedObjectContext:", v12, self->_context);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "propertiesByName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueForKey:", CFSTR("changedEntity"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v15, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "predicateWithFormat:", CFSTR("%K = %@ OR %K = %@"), v17, v10, v18, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v19);

  +[PLPersistentHistoryMarker markerWithToken:](PLPersistentHistoryMarker, "markerWithToken:", v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  context = self->_context;
  v26 = 0;
  +[PLPersistentHistoryTransactionIterator iteratorSinceMarker:withFetchRequest:managedObjectObjectContext:error:](PLPersistentHistoryTransactionIterator, "iteratorSinceMarker:withFetchRequest:managedObjectObjectContext:error:", v20, v6, context, &v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v26;
  if (!v22)
  {
    PLBackendSharingGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v23;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Failed to fetch rules transaction iterator: %@", buf, 0xCu);
    }

  }
  return v22;
}

- (id)_allowedPropertyDescriptionsForEntityName:(id)a3
{
  id v4;
  NSDictionary *entityNameToAllowedPropertyDescriptionMap;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSDictionary *v18;
  NSDictionary *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  _QWORD v34[2];
  _QWORD v35[4];

  v35[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  entityNameToAllowedPropertyDescriptionMap = self->_entityNameToAllowedPropertyDescriptionMap;
  if (!entityNameToAllowedPropertyDescriptionMap)
  {
    v6 = (void *)MEMORY[0x1E0C97B20];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entityForName:inManagedObjectContext:", v7, self->_context);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0C97B20];
    +[PLDetectedFace entityName](PLDetectedFace, "entityName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "entityForName:inManagedObjectContext:", v10, self->_context);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v31;
    objc_msgSend(v8, "propertiesByName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "valueForKey:", CFSTR("locationData"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v29;
    objc_msgSend(v8, "propertiesByName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "valueForKey:", CFSTR("longitude"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v27;
    objc_msgSend(v8, "propertiesByName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "valueForKey:", CFSTR("latitude"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v25;
    objc_msgSend(v8, "propertiesByName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "valueForKey:", CFSTR("detectedFaces"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v22;
    objc_msgSend(v8, "propertiesByName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKey:", CFSTR("addedDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v33[4] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v13;
    +[PLDetectedFace entityName](PLDetectedFace, "entityName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v14;
    objc_msgSend(v23, "propertiesByName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueForKey:", CFSTR("personForFace"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v19 = self->_entityNameToAllowedPropertyDescriptionMap;
    self->_entityNameToAllowedPropertyDescriptionMap = v18;

    entityNameToAllowedPropertyDescriptionMap = self->_entityNameToAllowedPropertyDescriptionMap;
  }
  -[NSDictionary objectForKeyedSubscript:](entityNameToAllowedPropertyDescriptionMap, "objectForKeyedSubscript:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)updateLastKnownTokenToResult:(id)a3
{
  void *v4;
  NSObject *v5;
  NSPersistentHistoryToken *v6;
  NSPersistentHistoryToken *lastKnownToken;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "lastProcessedCoreDataToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLBackendSharingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Updating last known tokens from result token: %@", (uint8_t *)&v8, 0xCu);
  }

  if (v4)
  {
    v6 = (NSPersistentHistoryToken *)objc_msgSend(v4, "copy");
    lastKnownToken = self->_lastKnownToken;
    self->_lastKnownToken = v6;

  }
  -[PLLibraryScopeChangeTracker saveLastKnownChangeTrackerTokenToDisk](self, "saveLastKnownChangeTrackerTokenToDisk");

}

- (PLLibraryScopeChangeTrackerDelegate)delegate
{
  return (PLLibraryScopeChangeTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_entityNameToAllowedPropertyDescriptionMap, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_lastKnownToken, 0);
}

void __71__PLLibraryScopeChangeTracker_fetchResultsSincePersistentHistoryToken___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  id obj;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(a2, "changes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v2)
  {
    v3 = v2;
    v34 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v40 != v34)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v6 = objc_msgSend(v5, "changeType");
        if (v6 == 1)
        {
          objc_msgSend(v5, "updatedProperties");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)a1[4];
          objc_msgSend(v5, "changedObjectID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "entity");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_allowedPropertyDescriptionsForEntityName:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v15 = v14;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v36;
            while (2)
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v36 != v18)
                  objc_enumerationMutation(v15);
                if ((objc_msgSend(v9, "containsObject:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j)) & 1) != 0)
                {
                  v7 = 1;
                  goto LABEL_19;
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              if (v17)
                continue;
              break;
            }
          }
          v7 = 0;
LABEL_19:

        }
        else
        {
          v7 = 0;
          if (!v6)
          {
            v8 = 1;
            goto LABEL_21;
          }
        }
        v8 = 0;
LABEL_21:
        objc_msgSend(v5, "changedObjectID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "entity");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLManagedAsset entityName](PLManagedAsset, "entityName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "isEqualToString:", v23);

        if (v24)
        {
          if ((v7 | v8) != 1)
            continue;
          v25 = (void *)a1[5];
        }
        else
        {
          objc_msgSend(v5, "changedObjectID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "entity");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "name");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLDetectedFace entityName](PLDetectedFace, "entityName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v28, "isEqualToString:", v29);

          if ((v7 & v30) != 1)
            continue;
          v25 = (void *)a1[6];
        }
        objc_msgSend(v5, "changedObjectID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v31);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v3);
  }

}

@end
