@implementation STMigrationContext

- (STMigrationContext)init
{
  STMigrationContext *v2;
  uint64_t v3;
  NSMutableDictionary *uniqueIdentifierToCloudObjectID;
  uint64_t v5;
  NSMutableDictionary *uniqueIdentifierToLocalObjectID;
  uint64_t v7;
  NSMutableSet *deletedObjectIDs;
  uint64_t v9;
  NSMutableSet *filledObjectIDs;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)STMigrationContext;
  v2 = -[STMigrationContext init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    uniqueIdentifierToCloudObjectID = v2->_uniqueIdentifierToCloudObjectID;
    v2->_uniqueIdentifierToCloudObjectID = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    uniqueIdentifierToLocalObjectID = v2->_uniqueIdentifierToLocalObjectID;
    v2->_uniqueIdentifierToLocalObjectID = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    deletedObjectIDs = v2->_deletedObjectIDs;
    v2->_deletedObjectIDs = (NSMutableSet *)v7;

    v9 = objc_opt_new();
    filledObjectIDs = v2->_filledObjectIDs;
    v2->_filledObjectIDs = (NSMutableSet *)v9;

  }
  return v2;
}

- (BOOL)initializeCachesWithManagedObjectContext:(id)a3 withCloudStore:(id)a4 andLocalStore:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  id v15;
  id v16;
  NSMutableDictionary *v17;
  id v18;
  NSMutableDictionary *v19;
  int v20;
  void *v21;
  BOOL v22;
  _QWORD v24[4];
  id v25;
  id v26;
  NSMutableDictionary *v27;
  id v28;
  NSMutableDictionary *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__12;
  v36 = __Block_byref_object_dispose__12;
  v37 = 0;
  v13 = self->_uniqueIdentifierToCloudObjectID;
  v14 = self->_uniqueIdentifierToLocalObjectID;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __98__STMigrationContext_initializeCachesWithManagedObjectContext_withCloudStore_andLocalStore_error___block_invoke;
  v24[3] = &unk_1E9371988;
  v30 = &v38;
  v15 = v10;
  v25 = v15;
  v31 = &v32;
  v16 = v11;
  v26 = v16;
  v17 = v13;
  v27 = v17;
  v18 = v12;
  v28 = v18;
  v19 = v14;
  v29 = v19;
  objc_msgSend(v15, "performBlockAndWait:", v24);
  v20 = *((unsigned __int8 *)v39 + 24);
  if (a6 && !*((_BYTE *)v39 + 24))
  {
    v21 = (void *)v33[5];
    if (v21)
    {
      *a6 = objc_retainAutorelease(v21);
      v20 = *((unsigned __int8 *)v39 + 24);
    }
    else
    {
      v20 = 0;
    }
  }
  v22 = v20 != 0;

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v22;
}

void __98__STMigrationContext_initializeCachesWithManagedObjectContext_withCloudStore_andLocalStore_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _QWORD v59[9];

  v59[6] = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  +[STCloudActivation entity](STCloudActivation, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v2;
  +[STBlueprint entity](STBlueprint, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v3;
  +[STFamilyOrganizationSettings entity](STFamilyOrganizationSettings, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v4;
  +[STiCloudOrganizationSettings entity](STiCloudOrganizationSettings, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v59[3] = v5;
  +[STInstalledApp entity](STInstalledApp, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v59[4] = v6;
  +[STTestSyncableObject entity](STTestSyncableObject, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v59[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = a1;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v8;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v50;
LABEL_3:
    v10 = 0;
LABEL_4:
    if (*(_QWORD *)v50 != v39)
      objc_enumerationMutation(obj);
    v11 = *(void **)(v9 + 32);
    v12 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v10), "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchRequestWithEntityName:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(v9 + 80) + 8);
    v48 = *(id *)(v15 + 40);
    objc_msgSend(v11, "executeFetchRequest:error:", v14, &v48);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v15 + 40), v48);

    if (v16)
    {
      v41 = v10;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = v16;
      v17 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
      if (!v17)
        goto LABEL_23;
      v18 = v17;
      v43 = *(_QWORD *)v45;
      while (1)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v45 != v43)
            objc_enumerationMutation(v42);
          v20 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v20, "valueForKey:", CFSTR("uniqueIdentifier"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v20, "objectID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "persistentStore");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "identifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v9 + 40), "identifier");
            v25 = v9;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v24, "isEqualToString:", v26);

            objc_msgSend(v20, "objectID");
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = v28;
            if (v27)
            {
              v30 = *(void **)(v25 + 48);
              goto LABEL_17;
            }
            -[NSObject persistentStore](v28, "persistentStore");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "identifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v25 + 56), "identifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v32, "isEqualToString:", v33);

            if (v34)
            {
              objc_msgSend(v20, "objectID");
              v29 = objc_claimAutoreleasedReturnValue();
              v30 = *(void **)(v25 + 64);
LABEL_17:
              objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, v21);
            }
            else
            {
              +[STLog mirroring](STLog, "mirroring");
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v20, "objectID");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "persistentStore");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "identifier");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v54 = v37;
                v55 = 2114;
                v56 = v20;
                _os_log_error_impl(&dword_1D22E7000, v29, OS_LOG_TYPE_ERROR, "Asked to cache object from an unknown store: %{public}@\n%{public}@", buf, 0x16u);

              }
            }
            v9 = v25;

          }
        }
        v18 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
        if (!v18)
        {
LABEL_23:

          v10 = v41 + 1;
          if (v41 + 1 == v40)
          {
            v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
            if (!v40)
              goto LABEL_27;
            goto LABEL_3;
          }
          goto LABEL_4;
        }
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v9 + 72) + 8) + 24) = 0;
  }
LABEL_27:

}

- (id)updateCloudObjectWithUniqueIdentifier:(id)a3 dictionary:(id)a4 managedObjectContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  STCloudActivation *v19;
  id v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v11, 200, 0, &v27);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v27;
  if (v13)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("class"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[STLog mirroring](STLog, "mirroring");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v29 = v25;
      v30 = 2114;
      v31 = v10;
      _os_log_impl(&dword_1D22E7000, v15, OS_LOG_TYPE_DEFAULT, "Looking up cloud object (%{public}@) matching ID: %{public}@", buf, 0x16u);
    }

    -[NSMutableDictionary objectForKeyedSubscript:](self->_uniqueIdentifierToCloudObjectID, "objectForKeyedSubscript:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[STLog mirroring](STLog, "mirroring");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (!v16)
    {
      if (v18)
      {
        *(_DWORD *)buf = 138543618;
        v29 = v25;
        v30 = 2114;
        v31 = v10;
        _os_log_impl(&dword_1D22E7000, v17, OS_LOG_TYPE_DEFAULT, "Corresponding cloud object (%{public}@) now being created: %{public}@", buf, 0x16u);
      }

      v19 = -[STCloudActivation initWithContext:]([STCloudActivation alloc], "initWithContext:", v12);
      -[STCloudActivation objectID](v19, "objectID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_uniqueIdentifierToCloudObjectID, "setObject:forKeyedSubscript:", v22, v10);

      goto LABEL_20;
    }
    if (v18)
    {
      *(_DWORD *)buf = 138543618;
      v29 = v25;
      v30 = 2114;
      v31 = v10;
      _os_log_impl(&dword_1D22E7000, v17, OS_LOG_TYPE_DEFAULT, "Corresponding cloud object (%{public}@) already exists: %{public}@", buf, 0x16u);
    }

    v26 = v14;
    objc_msgSend(v12, "existingObjectWithID:error:", v16, &v26);
    v19 = (STCloudActivation *)objc_claimAutoreleasedReturnValue();
    v20 = v26;

    if (!v19)
    {
      +[STLog mirroring](STLog, "mirroring");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[STMigrationContext updateCloudObjectWithUniqueIdentifier:dictionary:managedObjectContext:error:].cold.2((uint64_t)v20, v23);

      if (a6)
      {
        v14 = objc_retainAutorelease(v20);
        v19 = 0;
        *a6 = v14;
        goto LABEL_20;
      }
      v19 = 0;
    }
    v14 = v20;
LABEL_20:
    -[STCloudActivation setIdentifier:](v19, "setIdentifier:", v10);
    -[STCloudActivation setActivationType:](v19, "setActivationType:", 1);
    -[STCloudActivation setActivationPlist:](v19, "setActivationPlist:", v13);

    goto LABEL_21;
  }
  +[STLog mirroring](STLog, "mirroring");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    -[STMigrationContext updateCloudObjectWithUniqueIdentifier:dictionary:managedObjectContext:error:].cold.1();

  if (a6)
  {
    v14 = objc_retainAutorelease(v14);
    v19 = 0;
    *a6 = v14;
  }
  else
  {
    v19 = 0;
  }
LABEL_21:

  return v19;
}

- (BOOL)deleteLocalObjectWithUniqueIdentifier:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  id v15;

  v8 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_uniqueIdentifierToLocalObjectID, "objectForKeyedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v15 = 0;
    objc_msgSend(v8, "existingObjectWithID:error:", v9, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    v12 = v11;
    v13 = v10 != 0;
    if (v10)
    {
      objc_msgSend(v8, "deleteObject:", v10);
    }
    else if (a5 && v11)
    {
      *a5 = objc_retainAutorelease(v11);
    }

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (id)deleteCloudObjectWithUniqueIdentifier:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v15;

  v8 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_uniqueIdentifierToCloudObjectID, "objectForKeyedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v15 = 0;
    objc_msgSend(v8, "existingObjectWithID:error:", v9, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    v12 = v11;
    if (v10)
    {
      objc_msgSend(v8, "deleteObject:", v10);
      v13 = (void *)MEMORY[0x1E0C9AAB0];
    }
    else
    {
      v13 = 0;
      if (a5 && v11)
      {
        v13 = 0;
        *a5 = objc_retainAutorelease(v11);
      }
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AAA0];
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filledObjectIDs, 0);
  objc_storeStrong((id *)&self->_deletedObjectIDs, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifierToLocalObjectID, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifierToCloudObjectID, 0);
}

- (void)updateCloudObjectWithUniqueIdentifier:dictionary:managedObjectContext:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  v3 = 2114;
  v4 = v0;
  _os_log_fault_impl(&dword_1D22E7000, v1, OS_LOG_TYPE_FAULT, "Unable to update cloud object with dictionary: %{public}@\n%{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)updateCloudObjectWithUniqueIdentifier:(uint64_t)a1 dictionary:(NSObject *)a2 managedObjectContext:error:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138543618;
  v3 = 0;
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_1D22E7000, a2, OS_LOG_TYPE_ERROR, "Unable to retrieve existing cloud object with id (%{public}@): %{public}@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
