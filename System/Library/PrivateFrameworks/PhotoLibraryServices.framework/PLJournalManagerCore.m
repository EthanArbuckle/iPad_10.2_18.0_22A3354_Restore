@implementation PLJournalManagerCore

- (PLJournalManagerCore)init
{
  PLJournalManagerCore *v2;
  SEL v3;
  id v4;
  id v5;
  id v6;

  v2 = (PLJournalManagerCore *)_PFAssertFailHandler();
  return -[PLJournalManagerCore initWithName:baseURL:payloadClasses:](v2, v3, v4, v5, v6);
}

- (PLJournalManagerCore)initWithName:(id)a3 baseURL:(id)a4 payloadClasses:(id)a5
{
  id v9;
  id v10;
  id v11;
  PLJournalManagerCore *v12;
  PLJournalManagerCore *v13;
  void *v14;
  uint64_t v15;
  NSURL *historyTokenURL;
  NSMutableDictionary *v17;
  NSMutableDictionary *payloadClassesByPayloadClassID;
  NSMutableDictionary *v19;
  NSMutableDictionary *payloadClassesByEntityName;
  NSMutableDictionary *v21;
  NSMutableDictionary *payloadClassesByAdditionalEntityName;
  NSMutableSet *v23;
  NSMutableSet *payloadClassIDs;
  _QWORD v26[4];
  PLJournalManagerCore *v27;
  objc_super v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)PLJournalManagerCore;
  v12 = -[PLJournalManagerCore init](&v28, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_baseURL, a4);
    -[NSURL URLByAppendingPathComponent:](v13->_baseURL, "URLByAppendingPathComponent:", CFSTR("HistoryToken"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLByAppendingPathExtension:", CFSTR("plist"));
    v15 = objc_claimAutoreleasedReturnValue();
    historyTokenURL = v13->_historyTokenURL;
    v13->_historyTokenURL = (NSURL *)v15;

    objc_storeStrong((id *)&v13->_payloadClasses, a5);
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    payloadClassesByPayloadClassID = v13->_payloadClassesByPayloadClassID;
    v13->_payloadClassesByPayloadClassID = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    payloadClassesByEntityName = v13->_payloadClassesByEntityName;
    v13->_payloadClassesByEntityName = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    payloadClassesByAdditionalEntityName = v13->_payloadClassesByAdditionalEntityName;
    v13->_payloadClassesByAdditionalEntityName = v21;

    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    payloadClassIDs = v13->_payloadClassIDs;
    v13->_payloadClassIDs = v23;

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __60__PLJournalManagerCore_initWithName_baseURL_payloadClasses___block_invoke;
    v26[3] = &unk_1E3666AE8;
    v27 = v13;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v26);

  }
  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (NSURL)historyTokenURL
{
  return self->_historyTokenURL;
}

- (NSSet)payloadClassIDs
{
  return (NSSet *)self->_payloadClassIDs;
}

- (void)validatePayloadClassesForManagedObjectModel:(id)a3
{
  id v4;
  NSMutableDictionary *payloadClassesByEntityName;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  payloadClassesByEntityName = self->_payloadClassesByEntityName;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__PLJournalManagerCore_validatePayloadClassesForManagedObjectModel___block_invoke;
  v7[3] = &unk_1E3677EE0;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](payloadClassesByEntityName, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (Class)payloadClassForPayloadClassID:(id)a3
{
  return (Class)-[NSMutableDictionary objectForKeyedSubscript:](self->_payloadClassesByPayloadClassID, "objectForKeyedSubscript:", a3);
}

- (id)payloadClassesForEntityName:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_payloadClassesByEntityName, "objectForKeyedSubscript:", a3);
}

- (id)payloadClassesForAdditionalEntityName:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_payloadClassesByAdditionalEntityName, "objectForKeyedSubscript:", a3);
}

- (id)readHistoryTokenWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v4 = (void *)MEMORY[0x1E0C99D50];
  -[PLJournalManagerCore historyTokenURL](self, "historyTokenURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithContentsOfURL:options:error:", v5, 1, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, &v13, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("currentHistoryToken"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
        v11 = (void *)objc_msgSend(v9, "copy");
      else
        v11 = 0;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)saveHistoryToken:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLJournalManagerCore.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token"));

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_baseURL, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, 0);

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("currentHistoryToken");
  v17[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v11, 200, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[PLJournalFile writeData:toURL:atomically:error:](PLJournalFile, "writeData:toURL:atomically:error:", v12, self->_historyTokenURL, 1, a4);

  return v13;
}

- (void)removeHistoryToken
{
  +[PLJournalFile removeURL:error:](PLJournalFile, "removeURL:error:", self->_historyTokenURL, 0);
}

- (id)_nextValidPayloadWithObjectEnumerator:(id)a3 changedKeys:(id)a4 payloadClass:(Class)a5
{
  id v8;
  id v9;
  void *v10;
  __int128 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSString *name;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  uint8_t buf[4];
  NSString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "nextObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
LABEL_10:
    v19 = 0;
    goto LABEL_11;
  }
  *(_QWORD *)&v11 = 138543618;
  v21 = v11;
  while (1)
  {
    -[objc_class payloadAdapterForManagedObject:](a5, "payloadAdapterForManagedObject:", v10, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "payloadID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      PLMigrationGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        name = self->_name;
        objc_msgSend(v10, "objectID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v21;
        v23 = name;
        v24 = 2114;
        v25 = v17;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@] Skipping payload for snapshot with nil payloadID for object: %{public}@", buf, 0x16u);

      }
      goto LABEL_9;
    }
    objc_msgSend(v12, "payloadForChangedKeys:", v9);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
      break;
LABEL_9:
    objc_msgSend(v8, "nextObject");
    v18 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v18;
    if (!v18)
      goto LABEL_10;
  }
  v19 = (void *)v14;

LABEL_11:
  return v19;
}

- (BOOL)createSnapshotWithJournal:(id)a3 createOnlyIfNecessary:(BOOL)a4 usingManagedObjectContext:(id)a5 entryLimit:(unint64_t)a6 error:(id *)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  BOOL v20;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD *v26;
  unint64_t v27;
  _QWORD v28[4];
  id v29;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v29 = 0;
  -[PLJournalManagerCore _objectEnumeratorForJournal:usingManagedObjectContext:error:](self, "_objectEnumeratorForJournal:usingManagedObjectContext:error:", v12, v13, &v29);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v29;
  v16 = v15;
  if (v14)
  {
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v28[3] = 0;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __115__PLJournalManagerCore_createSnapshotWithJournal_createOnlyIfNecessary_usingManagedObjectContext_entryLimit_error___block_invoke;
    v23[3] = &unk_1E3666B38;
    v26 = v28;
    v27 = a6;
    v23[4] = self;
    v24 = v14;
    v25 = v12;
    v22 = v16;
    v17 = objc_msgSend(v25, "createSnapshotUsingNextPayloadBlock:createOnlyIfNecessary:error:", v23, v10, &v22);
    v18 = v22;

    _Block_object_dispose(v28, 8);
    v19 = v18;
    if ((v17 & 1) != 0)
    {
      v20 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    v19 = v15;
  }
  if (a7)
  {
    v19 = objc_retainAutorelease(v19);
    v20 = 0;
    *a7 = v19;
  }
  else
  {
    v20 = 0;
  }
LABEL_8:

  return v20;
}

- (BOOL)appendSnapshotWithJournal:(id)a3 usingManagedObjectContext:(id)a4 changedKeys:(id)a5 entryLimit:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  id v19;
  id v20;
  BOOL v21;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  _QWORD *v28;
  unint64_t v29;
  _QWORD v30[4];
  id v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v31 = 0;
  -[PLJournalManagerCore _objectEnumeratorForJournal:usingManagedObjectContext:error:](self, "_objectEnumeratorForJournal:usingManagedObjectContext:error:", v12, v13, &v31);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v31;
  v17 = v16;
  if (v15)
  {
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v30[3] = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __105__PLJournalManagerCore_appendSnapshotWithJournal_usingManagedObjectContext_changedKeys_entryLimit_error___block_invoke;
    v24[3] = &unk_1E3666B60;
    v28 = v30;
    v29 = a6;
    v24[4] = self;
    v25 = v15;
    v26 = v14;
    v27 = v12;
    v23 = v17;
    v18 = objc_msgSend(v27, "appendSnapshotUsingNextEntryBlock:error:", v24, &v23);
    v19 = v23;

    _Block_object_dispose(v30, 8);
    v20 = v19;
    if ((v18 & 1) != 0)
    {
      v21 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    v20 = v16;
  }
  if (a7)
  {
    v20 = objc_retainAutorelease(v20);
    v21 = 0;
    *a7 = v20;
  }
  else
  {
    v21 = 0;
  }
LABEL_8:

  return v21;
}

- (id)_objectEnumeratorForJournal:(id)a3 usingManagedObjectContext:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_msgSend(v9, "payloadClass");
  objc_msgSend(v11, "relationshipKeyPathsForPrefetching");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(v9, "payloadClass"), "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_msgSend(v9, "payloadClass"), "payloadClassID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLJournalManagerCore.m"), 218, CFSTR("nil entityName for payloadClassID: %@"), v21);

  }
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFetchBatchSize:", 100);
  objc_msgSend(v14, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v14, "setRelationshipKeyPathsForPrefetching:", v12);
  objc_msgSend((id)objc_msgSend(v9, "payloadClass"), "snapshotSortDescriptors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSortDescriptors:", v15);

  objc_msgSend(v14, "setShouldRefreshRefetchedObjects:", 1);
  objc_msgSend(v14, "setIncludesSubentities:", 0);
  objc_msgSend(v11, "fetchPredicateInContext:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicate:", v16);

  objc_msgSend(v10, "executeFetchRequest:error:", v14, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "objectEnumerator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSArray)payloadClasses
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadClasses, 0);
  objc_storeStrong((id *)&self->_payloadClassesByPayloadClassID, 0);
  objc_storeStrong((id *)&self->_payloadClassesByAdditionalEntityName, 0);
  objc_storeStrong((id *)&self->_payloadClassesByEntityName, 0);
  objc_storeStrong((id *)&self->_payloadClassIDs, 0);
  objc_storeStrong((id *)&self->_historyTokenURL, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

id __105__PLJournalManagerCore_appendSnapshotWithJournal_usingManagedObjectContext_changedKeys_entryLimit_error___block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  PLJournalEntry *v7;
  uint64_t v8;
  void *v9;

  v2 = *(_QWORD *)(a1 + 72);
  if (v2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v4 = *(_QWORD *)(v3 + 24);
    if (v4 >= v2)
    {
      v9 = 0;
      return v9;
    }
    *(_QWORD *)(v3 + 24) = v4 + 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "_nextValidPayloadWithObjectEnumerator:changedKeys:payloadClass:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "payloadClass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 48);
    v7 = [PLJournalEntry alloc];
    if (v6)
      v8 = -[PLJournalEntry initForUpdateWithPayload:](v7, "initForUpdateWithPayload:", v5);
    else
      v8 = -[PLJournalEntry initForInsertWithPayload:](v7, "initForInsertWithPayload:", v5);
    v9 = (void *)v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __115__PLJournalManagerCore_createSnapshotWithJournal_createOnlyIfNecessary_usingManagedObjectContext_entryLimit_error___block_invoke(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  void *v4;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v3 = *(_QWORD *)(v2 + 24);
    if (v3 >= v1)
    {
      v4 = 0;
      return v4;
    }
    *(_QWORD *)(v2 + 24) = v3 + 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "_nextValidPayloadWithObjectEnumerator:changedKeys:payloadClass:", *(_QWORD *)(a1 + 40), 0, objc_msgSend(*(id *)(a1 + 48), "payloadClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

void __68__PLJournalManagerCore_validatePayloadClassesForManagedObjectModel___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__PLJournalManagerCore_validatePayloadClassesForManagedObjectModel___block_invoke_2;
  v4[3] = &unk_1E3666B10;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v4);

}

uint64_t __68__PLJournalManagerCore_validatePayloadClassesForManagedObjectModel___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "validatePayloadPropertiesForManagedObjectModel:", *(_QWORD *)(a1 + 32));
}

void __60__PLJournalManagerCore_initWithName_baseURL_payloadClasses___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(a2, "payloadClassID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", a2, v5);

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(a2, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(a2, "entityName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  }
  objc_msgSend(v8, "addObject:", a2);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a2, "additionalEntityNames", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", v16);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", v17, v16);
        }
        objc_msgSend(v17, "addObject:", a2);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  v18 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(a2, "payloadClassID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v19);

}

@end
