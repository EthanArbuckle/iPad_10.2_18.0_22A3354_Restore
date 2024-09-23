@implementation PLUpdatedOrderKeys

- (BOOL)registerForStoreOrderKeyUpdateNotificationFromManagedObjectContext:(id)a3
{
  char v3;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5 = a3;
  PLRunWithUnfairLock();
  v3 = *((_BYTE *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

- (PLUpdatedOrderKeys)init
{
  PLUpdatedOrderKeys *v2;
  PLUpdatedOrderKeys *v3;
  PLUpdatedOrderKeys *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLUpdatedOrderKeys;
  v2 = -[PLUpdatedOrderKeys init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

void __89__PLUpdatedOrderKeys_registerForStoreOrderKeyUpdateNotificationFromManagedObjectContext___block_invoke(_QWORD *a1)
{
  void *v2;
  _BYTE *v3;

  v2 = (void *)MEMORY[0x19AEC1554]();
  v3 = (_BYTE *)a1[4];
  if (!v3[12])
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v3, "_inq_registerForStoreOrderKeyUpdateNotificationFromManagedObjectContext:", a1[5]);
    *(_BYTE *)(a1[4] + 12) = 1;
  }
  objc_autoreleasePoolPop(v2);
}

- (BOOL)isObservingOrderKeys
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  PLRunWithUnfairLock();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (BOOL)_inq_registerForStoreOrderKeyUpdateNotificationFromManagedObjectContext:(id)a3
{
  char v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *updatedOrderKeyObjectIDs;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSSet *v25;
  NSSet *observedRelationships;
  NSObject *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  id obj;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint8_t buf[16];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  objc_msgSend(v34, "persistentStoreCoordinator");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "persistentStores");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  v4 = 0;
  if (v35)
  {
    v33 = *(_QWORD *)v38;
    v30 = *MEMORY[0x1E0C97960];
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v38 != v33)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v6, "URL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "path");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "photoLibrary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "pathManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "photosDatabasePath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v8, "isEqualToString:", v11);

        if (v12)
        {
          v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          updatedOrderKeyObjectIDs = self->_updatedOrderKeyObjectIDs;
          self->_updatedOrderKeyObjectIDs = v13;

          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "managedObjectModel");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "entitiesByName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", CFSTR("Album"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "relationshipsByName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKey:", CFSTR("assets"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "addObject:", v20);
          objc_msgSend(v16, "entitiesByName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKey:", CFSTR("Folder"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "relationshipsByName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKey:", CFSTR("childCollections"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "addObject:", v24);
          v25 = (NSSet *)objc_msgSend(v15, "copy");
          observedRelationships = self->_observedRelationships;
          self->_observedRelationships = v25;

          PLChangeHandlingGetLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEBUG, "PLChangeNode registering for order key change notifications.", buf, 2u);
          }

          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObserver:selector:name:object:", self, sel_persistentStoreDidUpdateOrderKeys_, v30, v6);

          v4 = 1;
        }
      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v35);
  }

  return v4 & 1;
}

- (id)_persistentStoresForContext:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "persistentStoreCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistentStores");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getAndClearUpdatedOrderKeys
{
  void *v2;

  PLResultWithUnfairLock();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA70];
  return v2;
}

- (void)persistentStoreDidUpdateOrderKeys:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLRunWithUnfairLock();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedOrderKeyObjectIDs, 0);
  objc_storeStrong((id *)&self->_observedRelationships, 0);
}

void __56__PLUpdatedOrderKeys_persistentStoreDidUpdateOrderKeys___block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *context;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id obj;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  void *v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKey:", CFSTR("addedOrUpdated"));
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v52;
    v2 = 0x1E0CB3000uLL;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v52 != v34)
          objc_enumerationMutation(obj);
        v36 = v3;
        v41 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v3);
        objc_msgSend(v41, "entity");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v42 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
        v5 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v48;
          v37 = *(_QWORD *)v48;
          v38 = v4;
          do
          {
            v8 = 0;
            v39 = v6;
            do
            {
              if (*(_QWORD *)v48 != v7)
                objc_enumerationMutation(v42);
              v9 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v8);
              objc_msgSend(v9, "entity");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v4, "isKindOfEntity:", v10);

              if (v11)
              {
                objc_msgSend(obj, "objectForKey:", v41);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "name");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "objectForKey:", v13);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v14, "count"))
                {
                  v43 = v13;
                  v44 = v12;
                  v45 = v8;
                  objc_msgSend(v9, "inverseRelationship");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "name");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v61 = v16;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = v15;
                  objc_msgSend(v15, "entity");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "name");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = +[PLPropertyIndexMapping indexValueForRelationshipNames:entity:](PLPropertyIndexMapping, "indexValueForRelationshipNames:entity:", v17, v19);

                  if (objc_msgSend(v14, "count"))
                  {
                    v21 = 0;
                    do
                    {
                      objc_msgSend(v14, "objectAtIndexedSubscript:", v21);
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKey:", v22);
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      v24 = v23;
                      v25 = v20;
                      if (v23)
                        v25 = objc_msgSend(v23, "unsignedLongLongValue", v20) | v20;
                      v26 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
                      objc_msgSend(*(id *)(v2 + 2024), "numberWithUnsignedLongLong:", v25);
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "setObject:forKey:", v27, v22);

                      PLChangeHandlingGetLog();
                      v28 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                      {
                        objc_msgSend(v14, "objectAtIndexedSubscript:", v21 + 1);
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v46, "name");
                        v30 = v2;
                        v31 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412802;
                        v56 = v29;
                        v57 = 2112;
                        v58 = v31;
                        v59 = 2112;
                        v60 = v22;
                        _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEBUG, "Adding updated order key %@ for %@ on %@.", buf, 0x20u);

                        v2 = v30;
                      }

                      v21 += 2;
                    }
                    while (v21 < objc_msgSend(v14, "count"));
                  }

                  v7 = v37;
                  v4 = v38;
                  v6 = v39;
                  v12 = v44;
                  v8 = v45;
                  v13 = v43;
                }

              }
              ++v8;
            }
            while (v8 != v6);
            v6 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
          }
          while (v6);
        }

        v3 = v36 + 1;
      }
      while (v36 + 1 != v35);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    }
    while (v35);
  }

  objc_autoreleasePoolPop(context);
}

id __49__PLUpdatedOrderKeys_getAndClearUpdatedOrderKeys__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

uint64_t __42__PLUpdatedOrderKeys_isObservingOrderKeys__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 12);
  return result;
}

@end
