@implementation PLJournalManager

+ (id)journalManagerWithClass:(Class)a3 libraryServiceManager:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a4, "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class baseURLFromPathManager:](a3, "baseURLFromPathManager:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc((Class)a1);
  -[objc_class name](a3, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class payloadClasses](a3, "payloadClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithName:baseURL:payloadClasses:", v9, v7, v10);

  return v11;
}

- (void)_loadHistoryTokenIfNecessary
{
  NSPersistentHistoryToken *v3;
  id v4;
  NSPersistentHistoryToken *currentHistoryToken;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self->_currentHistoryToken)
  {
    v8 = 0;
    -[PLJournalManagerCore readHistoryTokenWithError:](self, "readHistoryTokenWithError:", &v8);
    v3 = (NSPersistentHistoryToken *)objc_claimAutoreleasedReturnValue();
    v4 = v8;
    currentHistoryToken = self->_currentHistoryToken;
    self->_currentHistoryToken = v3;

    if (!self->_currentHistoryToken && (PLIsErrorFileNotFound() & 1) == 0)
    {
      PLMigrationGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        -[PLJournalManagerCore name](self, "name");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v10 = v7;
        v11 = 2112;
        v12 = v4;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: could not read history token: %@", buf, 0x16u);

      }
    }

  }
}

- (id)currentHistoryToken
{
  -[PLJournalManager _loadHistoryTokenIfNecessary](self, "_loadHistoryTokenIfNecessary");
  return self->_currentHistoryToken;
}

- (void)clearHistoryToken
{
  NSPersistentHistoryToken *currentHistoryToken;

  currentHistoryToken = self->_currentHistoryToken;
  self->_currentHistoryToken = 0;

  -[PLJournalManagerCore removeHistoryToken](self, "removeHistoryToken");
}

- (BOOL)needsSnapshot
{
  void *v3;
  BOOL v4;

  -[PLJournalManager currentHistoryToken](self, "currentHistoryToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[PLJournalManager _needsPartialSnapshot:](self, "_needsPartialSnapshot:", 0);
  else
    v4 = 1;

  return v4;
}

- (BOOL)_needsFullSnapshot
{
  void *v3;
  void *v4;
  BOOL v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[PLJournalManagerCore payloadClasses](self, "payloadClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__PLJournalManager__needsFullSnapshot__block_invoke;
  v7[3] = &unk_1E366A1F8;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

  -[PLJournalManager currentHistoryToken](self, "currentHistoryToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = *((_BYTE *)v9 + 24) == 0;
  else
    v5 = 1;

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)_needsPartialSnapshot:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[PLJournalManagerCore payloadClasses](self, "payloadClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__PLJournalManager__needsPartialSnapshot___block_invoke;
  v8[3] = &unk_1E366D7D0;
  v8[4] = self;
  v10 = &v11;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

- (BOOL)performSnapshotIfNecessaryAppend:(BOOL)a3 withManagedObjectContext:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  BOOL v9;
  id v10;

  v6 = a3;
  v8 = a4;
  if (-[PLJournalManager _needsFullSnapshot](self, "_needsFullSnapshot"))
  {
    v9 = -[PLJournalManager performFullSnapshotAppend:createOnlyIfNecessary:withManagedObjectContext:error:](self, "performFullSnapshotAppend:createOnlyIfNecessary:withManagedObjectContext:error:", v6, 0, v8, a5);
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    if (-[PLJournalManager _needsPartialSnapshot:](self, "_needsPartialSnapshot:", v10))
      v9 = -[PLJournalManager performPartialSnapshotForPayloadClassIDs:append:createOnlyIfNecessary:withManagedObjectContext:error:](self, "performPartialSnapshotForPayloadClassIDs:append:createOnlyIfNecessary:withManagedObjectContext:error:", v10, v6, 0, v8, a5);
    else
      v9 = 1;

  }
  return v9;
}

- (BOOL)performFullSnapshotAppend:(BOOL)a3 createOnlyIfNecessary:(BOOL)a4 withManagedObjectContext:(id)a5 error:(id *)a6
{
  return -[PLJournalManager performFullSnapshotAppend:createOnlyIfNecessary:withManagedObjectContext:entryLimitBlock:error:](self, "performFullSnapshotAppend:createOnlyIfNecessary:withManagedObjectContext:entryLimitBlock:error:", a3, a4, a5, 0, a6);
}

- (BOOL)performFullSnapshotAppend:(BOOL)a3 createOnlyIfNecessary:(BOOL)a4 withManagedObjectContext:(id)a5 entryLimitBlock:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  BOOL v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v12 = a5;
  v13 = a6;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 1;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__12558;
  v28 = __Block_byref_object_dispose__12559;
  v29 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __115__PLJournalManager_performFullSnapshotAppend_createOnlyIfNecessary_withManagedObjectContext_entryLimitBlock_error___block_invoke;
  v17[3] = &unk_1E36633C0;
  v17[4] = self;
  v14 = v12;
  v22 = a3;
  v18 = v14;
  v20 = &v30;
  v15 = v13;
  v19 = v15;
  v21 = &v24;
  v23 = a4;
  objc_msgSend(v14, "performBlockAndWait:", v17);
  if (*((_BYTE *)v31 + 24))
  {
    LOBYTE(a7) = 1;
  }
  else if (a7)
  {
    *a7 = objc_retainAutorelease((id)v25[5]);
    LOBYTE(a7) = *((_BYTE *)v31 + 24) != 0;
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return (char)a7;
}

- (BOOL)performPartialSnapshotForPayloadClassIDs:(id)a3 append:(BOOL)a4 createOnlyIfNecessary:(BOOL)a5 withManagedObjectContext:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id *v16;
  BOOL v17;
  uint64_t *v18;
  NSObject *v19;
  void *v20;
  BOOL v21;
  _QWORD v23[4];
  id v24;
  id v25;
  PLJournalManager *v26;
  uint64_t *v27;
  uint64_t *v28;
  BOOL v29;
  BOOL v30;
  id obj;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__12558;
  v40 = __Block_byref_object_dispose__12559;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  -[PLJournalManagerCore baseURL](self, "baseURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLJournalManagerCore payloadClasses](self, "payloadClasses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id *)(v37 + 5);
  obj = (id)v37[5];
  v17 = +[PLJournal recoverJournalsIfNecessaryForBaseURL:payloadClasses:error:](PLJournal, "recoverJournalsIfNecessaryForBaseURL:payloadClasses:error:", v14, v15, &obj);
  objc_storeStrong(v16, obj);

  v35 = v17;
  v18 = v33;
  if (!*((_BYTE *)v33 + 24))
    goto LABEL_6;
  PLMigrationGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    -[PLJournalManagerCore name](self, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v20;
    v44 = 2114;
    v45 = v12;
    _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: performing partial snapshot for payloadClassIDs: %{public}@", buf, 0x16u);

  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __121__PLJournalManager_performPartialSnapshotForPayloadClassIDs_append_createOnlyIfNecessary_withManagedObjectContext_error___block_invoke;
  v23[3] = &unk_1E36633E8;
  v24 = v13;
  v25 = v12;
  v26 = self;
  v29 = a4;
  v27 = &v32;
  v28 = &v36;
  v30 = a5;
  objc_msgSend(v24, "performBlockAndWait:", v23);

  v18 = v33;
  if (*((_BYTE *)v33 + 24))
  {
    v21 = 1;
  }
  else
  {
LABEL_6:
    if (a7)
    {
      *a7 = objc_retainAutorelease((id)v37[5]);
      v18 = v33;
    }
    v21 = *((_BYTE *)v18 + 24) != 0;
  }
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v21;
}

- (BOOL)coalesceJournalsForPayloadClassIDs:(id)a3 withChangeJournalOverThreshold:(float)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  objc_class *v20;
  objc_class *v21;
  PLJournal *v22;
  void *v23;
  PLJournal *v24;
  id v25;
  NSObject *v26;
  void *v27;
  BOOL v28;
  BOOL v29;
  NSObject *v30;
  void *v31;
  void *v33;
  id *v34;
  id obj;
  id v36;
  id v37;
  unint64_t v38;
  unint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  unint64_t v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  unint64_t v54;
  __int16 v55;
  double v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[PLJournalManagerCore baseURL](self, "baseURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLJournalManagerCore payloadClasses](self, "payloadClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v11 = +[PLJournal recoverJournalsIfNecessaryForBaseURL:payloadClasses:error:](PLJournal, "recoverJournalsIfNecessaryForBaseURL:payloadClasses:error:", v9, v10, &v44);
  v12 = v44;

  if (v11)
  {
    if (!objc_msgSend(v8, "count"))
    {
      -[PLJournalManagerCore payloadClassIDs](self, "payloadClassIDs");
      v13 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v13;
    }
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v8 = v8;
    v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
    if (v14)
    {
      v15 = v14;
      v34 = a5;
      v16 = *(_QWORD *)v41;
      obj = v8;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v41 != v16)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x19AEC1554]();
          v20 = -[PLJournalManagerCore payloadClassForPayloadClassID:](self, "payloadClassForPayloadClassID:", v18);
          if (v20)
          {
            v21 = v20;
            v22 = [PLJournal alloc];
            -[PLJournalManagerCore baseURL](self, "baseURL");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = -[PLJournal initWithBaseURL:payloadClass:](v22, "initWithBaseURL:payloadClass:", v23, v21);

            v38 = 0;
            v39 = 0;
            v37 = v12;
            LODWORD(v23) = -[PLJournal snapshotJournalFileSize:changeJournalFileSize:error:](v24, "snapshotJournalFileSize:changeJournalFileSize:error:", &v39, &v38, &v37);
            v25 = v37;

            if (!(_DWORD)v23)
            {
              PLMigrationGetLog();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                -[PLJournalManagerCore name](self, "name");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v46 = v31;
                v47 = 2114;
                v48 = v18;
                v49 = 2112;
                v50 = (unint64_t)v25;
                _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: could not determine journal file sizes for coalesce for payloadID %{public}@: %@", buf, 0x20u);

              }
              v12 = v25;
              goto LABEL_24;
            }
            if (a4 >= 0.0 && v38 > (unint64_t)(float)((float)v39 * a4))
            {
              PLMigrationGetLog();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                -[PLJournalManagerCore name](self, "name");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544642;
                v46 = v27;
                v47 = 2114;
                v48 = v18;
                v49 = 2048;
                v50 = v38;
                v51 = 2048;
                v52 = (unint64_t)(float)((float)v39 * a4);
                v53 = 2048;
                v54 = v39;
                v55 = 2048;
                v56 = a4;
                _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: coalescing journal %{public}@, change journal size %llu greater than %llu for snapshot size %llu with threshold: %f", buf, 0x3Eu);

              }
              v36 = v25;
              v28 = -[PLJournal coalesceChangesToSnapshotWithError:](v24, "coalesceChangesToSnapshotWithError:", &v36);
              v12 = v36;

              if (!v28)
              {
                PLMigrationGetLog();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  -[PLJournalManagerCore name](self, "name");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v46 = v33;
                  v47 = 2114;
                  v48 = v18;
                  v49 = 2112;
                  v50 = (unint64_t)v12;
                  _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: could not coalesce journal for payloadID %{public}@: %@", buf, 0x20u);

                }
LABEL_24:
                v8 = obj;
                a5 = v34;

                objc_autoreleasePoolPop(v19);
                goto LABEL_25;
              }
              v25 = v12;
            }

            v12 = v25;
          }
          objc_autoreleasePoolPop(v19);
        }
        v8 = obj;
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
        if (v15)
          continue;
        break;
      }
    }

    v29 = 1;
  }
  else
  {
LABEL_25:
    if (a5)
    {
      v12 = objc_retainAutorelease(v12);
      v29 = 0;
      *a5 = v12;
    }
    else
    {
      v29 = 0;
    }
  }

  return v29;
}

- (void)setIgnoreHistoryDuringSnapshot
{
  atomic_store(1u, (unsigned __int8 *)&self->_ignoreHistoryDuringSnapshot);
}

- (void)clearIgnoreHistoryDuringSnapshot
{
  atomic_store(0, (unsigned __int8 *)&self->_ignoreHistoryDuringSnapshot);
}

- (id)_existingObjectWithID:(id)a3 managedObjectContext:(id)a4
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
  if (!v7 && (PLIsErrorEqualToCode() & 1) == 0)
  {
    PLMigrationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[PLJournalManagerCore name](self, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v10;
      v15 = 2114;
      v16 = v6;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: failed to fetch object with ID %{public}@: %@", buf, 0x20u);

    }
  }

  return v7;
}

- (BOOL)_enumerateJournalEntriesFromHistoryToken:(id)a3 latestHistoryToken:(id *)a4 withManagedObjectContext:(id)a5 journalEntryBlock:(id)a6 shouldStopBlock:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  PLPersistentHistoryTransactionModifiers *v22;
  PLPersistentHistoryTransactionModifiers *v23;
  BOOL v24;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *, _BYTE *);
  void *v33;
  PLPersistentHistoryTransactionModifiers *v34;
  PLJournalManager *v35;
  id v36;
  id v37;
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v45 = 0;
  +[PLPersistentHistoryTransactionIterator iteratorSinceToken:withManagedObjectObjectContext:error:](PLPersistentHistoryTransactionIterator, "iteratorSinceToken:withManagedObjectObjectContext:error:", v14, v15, &v45);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v45;
  v20 = v19;
  if (v18)
  {
    v21 = v19;
LABEL_3:
    v22 = objc_alloc_init(PLPersistentHistoryTransactionModifiers);
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = 0;
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __145__PLJournalManager__enumerateJournalEntriesFromHistoryToken_latestHistoryToken_withManagedObjectContext_journalEntryBlock_shouldStopBlock_error___block_invoke;
    v33 = &unk_1E3663438;
    v23 = v22;
    v34 = v23;
    v39 = &v40;
    v37 = v17;
    v35 = self;
    v36 = v15;
    v38 = v16;
    objc_msgSend(v18, "enumerateRemainingTransactionsWithBlock:", &v30);
    if (a4 && !*((_BYTE *)v41 + 24))
    {
      objc_msgSend(v18, "lastIteratedToken", v30, v31, v32, v33, v34, v35, v36, v37);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    _Block_object_dispose(&v40, 8);
    v24 = 1;
    goto LABEL_7;
  }
  if (objc_msgSend(v19, "code") == 134501)
  {
    v44 = v20;
    +[PLPersistentHistoryTransactionIterator iteratorSinceToken:withManagedObjectObjectContext:error:](PLPersistentHistoryTransactionIterator, "iteratorSinceToken:withManagedObjectObjectContext:error:", 0, v15, &v44);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v44;

    if (!v18)
    {
      if (!a8)
      {
        v24 = 0;
        goto LABEL_8;
      }
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v50 = *MEMORY[0x1E0CB3388];
      v51[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 51011, v18);
      v24 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_3;
  }
  if (objc_msgSend(v20, "code") != 134301)
  {
    if (a8)
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v46 = *MEMORY[0x1E0CB3388];
      v47 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 51010, v18);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_19:
    v24 = 0;
    v21 = v20;
    goto LABEL_8;
  }
  if (!a8)
    goto LABEL_19;
  v27 = (void *)MEMORY[0x1E0CB35C8];
  v48 = *MEMORY[0x1E0CB3388];
  v49 = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 51009, v18);
  v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
  v24 = 0;
  *a8 = v28;
  v21 = v20;
LABEL_7:

LABEL_8:
  return v24;
}

- (BOOL)replayFromCurrentHistoryTokenWithManagedObjectContext:(id)a3 updatedPayloadClassIDs:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  unsigned __int8 v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  id v14;
  uint64_t v15;
  id v16;
  NSPersistentHistoryToken *v17;
  NSPersistentHistoryToken *currentHistoryToken;
  uint64_t v19;
  id *v20;
  BOOL v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  id obj;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  uint64_t *v38;
  __int128 *p_buf;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  char v67;
  uint8_t v68[4];
  void *v69;
  __int16 v70;
  uint64_t v71;
  __int128 buf;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 0;
  v10 = atomic_load((unsigned __int8 *)&self->_ignoreHistoryDuringSnapshot);
  v67 = v10 & 1;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 1;
  if (*((_BYTE *)v65 + 24))
  {
    PLMigrationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[PLJournalManagerCore name](self, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "JournalManager[%{public}@]: Skipping replay from current history due to ignoreHistoryDuringSnapshot token", (uint8_t *)&buf, 0xCu);

    }
    v13 = 0;
    *((_BYTE *)v61 + 24) = 0;
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__12558;
    v75 = __Block_byref_object_dispose__12559;
    v76 = 0;
    v56 = 0;
    v57 = &v56;
    v58 = 0x2020000000;
    v59 = 1;
    v50 = 0;
    v51 = &v50;
    v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__12558;
    v54 = __Block_byref_object_dispose__12559;
    v55 = 0;
    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__12558;
    v48 = __Block_byref_object_dispose__12559;
    v49 = 0;
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __103__PLJournalManager_replayFromCurrentHistoryTokenWithManagedObjectContext_updatedPayloadClassIDs_error___block_invoke;
    v35[3] = &unk_1E3663488;
    v38 = &v60;
    p_buf = &buf;
    v35[4] = self;
    v36 = v8;
    v16 = v14;
    v37 = v16;
    v40 = &v56;
    v41 = &v50;
    v42 = &v64;
    v43 = &v44;
    objc_msgSend(v36, "performBlockAndWait:", v35);
    if (*((_BYTE *)v61 + 24))
    {
      if (*((_BYTE *)v57 + 24))
      {
        if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
        {
          v33[0] = v15;
          v33[1] = 3221225472;
          v33[2] = __103__PLJournalManager_replayFromCurrentHistoryTokenWithManagedObjectContext_updatedPayloadClassIDs_error___block_invoke_17;
          v33[3] = &unk_1E36634B0;
          v33[4] = self;
          v34 = v9;
          objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v33);
          v17 = (NSPersistentHistoryToken *)objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "copy");
          currentHistoryToken = self->_currentHistoryToken;
          self->_currentHistoryToken = v17;

          v19 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
          v20 = (id *)(v45 + 5);
          obj = (id)v45[5];
          v21 = -[PLJournalManagerCore saveHistoryToken:error:](self, "saveHistoryToken:error:", v19, &obj);
          objc_storeStrong(v20, obj);
          if (!v21)
          {
            PLMigrationGetLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              -[PLJournalManagerCore name](self, "name");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v45[5];
              *(_DWORD *)v68 = 138543618;
              v69 = v23;
              v70 = 2112;
              v71 = v24;
              _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: history token property list could not be written after appending entries: %@", v68, 0x16u);

            }
            if (a5)
              *a5 = objc_retainAutorelease((id)v45[5]);
            *((_BYTE *)v61 + 24) = 0;
          }

        }
      }
      else
      {
        PLMigrationGetLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          -[PLJournalManagerCore name](self, "name");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v51[5];
          *(_DWORD *)v68 = 138543618;
          v69 = v29;
          v70 = 2112;
          v71 = v30;
          _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: Error writing to journals: %@", v68, 0x16u);

        }
        if (a5)
          *a5 = objc_retainAutorelease((id)v51[5]);
        *((_BYTE *)v61 + 24) = 0;
      }
    }
    else
    {
      PLMigrationGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        -[PLJournalManagerCore name](self, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v45[5];
        *(_DWORD *)v68 = 138543618;
        v69 = v26;
        v70 = 2112;
        v71 = v27;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: Error enumerating history: %@", v68, 0x16u);

      }
      if (a5)
        *a5 = objc_retainAutorelease((id)v45[5]);
    }

    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v50, 8);

    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(&buf, 8);

    v13 = *((_BYTE *)v61 + 24) != 0;
  }
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHistoryToken, 0);
}

void __103__PLJournalManager_replayFromCurrentHistoryTokenWithManagedObjectContext_updatedPayloadClassIDs_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id obj;
  _QWORD v13[6];
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  __int128 v17;
  id v18;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "currentHistoryToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v18 = *(id *)(v4 + 40);
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __103__PLJournalManager_replayFromCurrentHistoryTokenWithManagedObjectContext_updatedPayloadClassIDs_error___block_invoke_2;
  v14[3] = &unk_1E3663460;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 32);
  v15 = v7;
  v16 = v8;
  v17 = *(_OWORD *)(a1 + 72);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __103__PLJournalManager_replayFromCurrentHistoryTokenWithManagedObjectContext_updatedPayloadClassIDs_error___block_invoke_3;
  v13[3] = &unk_1E3670E78;
  v9 = *(_QWORD *)(a1 + 88);
  v10 = *(_QWORD *)(a1 + 96);
  v13[4] = v8;
  v13[5] = v9;
  v11 = *(_QWORD *)(v10 + 8);
  obj = *(id *)(v11 + 40);
  LOBYTE(v2) = objc_msgSend(v2, "_enumerateJournalEntriesFromHistoryToken:latestHistoryToken:withManagedObjectContext:journalEntryBlock:shouldStopBlock:error:", v3, &v18, v6, v14, v13, &obj);
  objc_storeStrong((id *)(v4 + 40), v18);
  objc_storeStrong((id *)(v11 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (_BYTE)v2;

}

void __103__PLJournalManager_replayFromCurrentHistoryTokenWithManagedObjectContext_updatedPayloadClassIDs_error___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v10 = 0;
  v6 = objc_msgSend(a3, "finishAppendChangeEntriesWithError:", &v10);
  v7 = v10;
  if ((v6 & 1) == 0)
  {
    PLMigrationGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v12 = v9;
      v13 = 2114;
      v14 = v5;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: error finishing append changes to payload: %{public}@, %@", buf, 0x20u);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

void __103__PLJournalManager_replayFromCurrentHistoryTokenWithManagedObjectContext_updatedPayloadClassIDs_error___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  PLJournal *v7;
  PLJournal *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  BOOL v13;
  id v14;
  id obj;

  v5 = a2;
  objc_msgSend((id)objc_msgSend(v5, "payloadClass"), "payloadClassID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v7 = (PLJournal *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = [PLJournal alloc];
    objc_msgSend(*(id *)(a1 + 40), "baseURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLJournal initWithBaseURL:payloadClass:](v8, "initWithBaseURL:payloadClass:", v9, objc_msgSend(v5, "payloadClass"));

    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v10 + 40);
    v11 = -[PLJournal prepareForAppendChangeEntriesWithError:](v7, "prepareForAppendChangeEntriesWithError:", &obj);
    objc_storeStrong((id *)(v10 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    || (objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6),
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8),
        v14 = *(id *)(v12 + 40),
        v13 = -[PLJournal appendChangeEntryAfterPrepare:error:](v7, "appendChangeEntryAfterPrepare:error:", v5, &v14),
        objc_storeStrong((id *)(v12 + 40), v14),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v13) == 0))
  {
    *a3 = 1;
  }

}

BOOL __103__PLJournalManager_replayFromCurrentHistoryTokenWithManagedObjectContext_updatedPayloadClassIDs_error___block_invoke_3(uint64_t a1)
{
  unsigned __int8 v1;
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 80));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v1 & 1;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return 0;
  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: Snapshot requested, stopping processing of change history", (uint8_t *)&v6, 0xCu);

  }
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
}

void __145__PLJournalManager__enumerateJournalEntriesFromHistoryToken_latestHistoryToken_withManagedObjectContext_journalEntryBlock_shouldStopBlock_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  PLJournalEntry *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  int v53;
  uint64_t v54;
  id obj;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *context;
  id v62;
  uint64_t v63;
  _QWORD *v64;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[5];
  id v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t v85[128];
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  void *v89;
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "author");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateFromTransactionAuthor:", v6);

  v64 = (_QWORD *)a1;
  if (objc_msgSend(*(id *)(a1 + 32), "changeSource") != 2)
  {
    objc_msgSend(v4, "changes");
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
    if (!v59)
      goto LABEL_75;
    v58 = *(_QWORD *)v82;
    v57 = v4;
LABEL_4:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v82 != v58)
        objc_enumerationMutation(obj);
      v69 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v7);
      v8 = (void *)MEMORY[0x19AEC1554]();
      v9 = v64[7];
      if (v9)
      {
        *(_BYTE *)(*(_QWORD *)(v64[9] + 8) + 24) = (*(uint64_t (**)(void))(v9 + 16))();
        if (*(_BYTE *)(*(_QWORD *)(v64[9] + 8) + 24))
          break;
      }
      v60 = v7;
      context = v8;
      objc_msgSend(v69, "changedObjectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)v64[5];
      objc_msgSend(v10, "entity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "payloadClassesForEntityName:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v64;
      if (!v14)
      {
        if (objc_msgSend(v69, "changeType") == 1)
        {
          v16 = (void *)v64[5];
          objc_msgSend(v10, "entity");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "payloadClassesForAdditionalEntityName:", v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v14 = 0;
        }
      }
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v19 = v14;
      v68 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
      if (v68)
      {
        v66 = v10;
        v67 = *(_QWORD *)v78;
        v65 = v19;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v78 != v67)
              objc_enumerationMutation(v65);
            v21 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v20);
            objc_msgSend(v69, "updatedProperties");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "valueForKey:", CFSTR("name"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v69, "changeType");
            if (v24 == 2)
            {
              objc_msgSend((id)v15[6], "objectWithID:", v10);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "payloadAdapterForManagedObject:", v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "tombstone");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "payloadIDForTombstone:", v42);
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v39)
                goto LABEL_45;
              v43 = -[PLJournalEntry initForDeleteWithPayloadID:payloadClass:]([PLJournalEntry alloc], "initForDeleteWithPayloadID:payloadClass:", v39, v21);
LABEL_46:
              v28 = 0;
              goto LABEL_47;
            }
            if (v24 != 1)
            {
              if (v24)
              {
LABEL_30:
                v28 = 0;
              }
              else
              {
                objc_msgSend((id)v15[5], "_existingObjectWithID:managedObjectContext:", v10, v15[6]);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "payloadAdapterForManagedObject:", v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "payloadID");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (v27)
                {
                  objc_msgSend(v26, "payloadForChangedKeys:", 0);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v28)
                  {
                    v29 = -[PLJournalEntry initForInsertWithPayload:]([PLJournalEntry alloc], "initForInsertWithPayload:", v28);
                    (*(void (**)(void))(v15[8] + 16))();
                    if (!*(_BYTE *)(*(_QWORD *)(v15[9] + 8) + 24))
                    {
                      objc_msgSend(v26, "payloadIDsByPayloadClassIDToDeleteOnInsert");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      v74[0] = MEMORY[0x1E0C809B0];
                      v74[1] = 3221225472;
                      v74[2] = __145__PLJournalManager__enumerateJournalEntriesFromHistoryToken_latestHistoryToken_withManagedObjectContext_journalEntryBlock_shouldStopBlock_error___block_invoke_2;
                      v74[3] = &unk_1E3663410;
                      v74[4] = v15[5];
                      v31 = (id)v15[8];
                      v32 = v15[9];
                      v75 = v31;
                      v76 = v32;
                      objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v74);

                    }
                    goto LABEL_37;
                  }
                }
                else if (v25)
                {
                  PLMigrationGetLog();
                  v29 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend((id)v15[5], "name");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v87 = v44;
                    v88 = 2114;
                    v89 = v66;
                    _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: Skipping payload for insert with nil payloadID for existing object: %{public}@", buf, 0x16u);

                  }
                  v28 = 0;
LABEL_37:

                  v10 = v66;
                }
                else
                {
                  v28 = 0;
                }

              }
              v43 = 0;
              goto LABEL_51;
            }
            objc_msgSend(v10, "entity");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "name");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v21, "shouldPersistForChangedKeys:entityName:", v23, v34);

            if (!v35)
              goto LABEL_30;
            objc_msgSend((id)v15[5], "_existingObjectWithID:managedObjectContext:", v10, v15[6]);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "payloadAdapterForManagedObject:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "payloadID");
            v38 = objc_claimAutoreleasedReturnValue();
            if (!v38)
            {
              if (v36)
              {
                PLMigrationGetLog();
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend((id)v15[5], "name");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v87 = v46;
                  v88 = 2114;
                  v89 = v66;
                  _os_log_impl(&dword_199541000, v45, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: Skipping payload for insert with nil payloadID for existing object: %{public}@", buf, 0x16u);

                }
              }
              v39 = 0;
LABEL_45:
              v43 = 0;
              goto LABEL_46;
            }
            v39 = (void *)v38;
            if (objc_msgSend(v37, "validForPersistenceChangedForChangedKeys:", v23))
            {
              objc_msgSend(v37, "payloadForChangedKeys:", 0);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = [PLJournalEntry alloc];
              if (v28)
                v41 = -[PLJournalEntry initForInsertWithPayload:](v40, "initForInsertWithPayload:", v28);
              else
                v41 = -[PLJournalEntry initForDeleteWithPayloadID:payloadClass:](v40, "initForDeleteWithPayloadID:payloadClass:", v39, v21);
              goto LABEL_57;
            }
            objc_msgSend(v37, "payloadForChangedKeys:", v23);
            v47 = objc_claimAutoreleasedReturnValue();
            if (v47)
            {
              v28 = (void *)v47;
              v41 = -[PLJournalEntry initForUpdateWithPayload:]([PLJournalEntry alloc], "initForUpdateWithPayload:", v47);
LABEL_57:
              v43 = v41;
              goto LABEL_47;
            }
            objc_msgSend(v37, "payloadsForChangedKeys:", v23);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = 0u;
            v71 = 0u;
            v72 = 0u;
            v73 = 0u;
            v62 = v48;
            v49 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
            if (v49)
            {
              v50 = v49;
              v63 = *(_QWORD *)v71;
LABEL_60:
              v51 = 0;
              while (1)
              {
                if (*(_QWORD *)v71 != v63)
                  objc_enumerationMutation(v62);
                v52 = -[PLJournalEntry initForUpdateWithPayload:]([PLJournalEntry alloc], "initForUpdateWithPayload:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v51));
                (*(void (**)(void))(v64[8] + 16))();
                v53 = *(unsigned __int8 *)(*(_QWORD *)(v64[9] + 8) + 24);

                if (v53)
                  break;
                if (v50 == ++v51)
                {
                  v50 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
                  if (v50)
                    goto LABEL_60;
                  break;
                }
              }
            }

            v43 = 0;
            v28 = 0;
            v15 = v64;
LABEL_47:

            if (v43)
            {
              (*(void (**)(void))(v15[8] + 16))();
              v10 = v66;
              if (*(_BYTE *)(*(_QWORD *)(v15[9] + 8) + 24))
              {

                v19 = v65;
                goto LABEL_68;
              }
            }
            else
            {
              v10 = v66;
            }
LABEL_51:

            ++v20;
          }
          while (v20 != v68);
          v19 = v65;
          v54 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
          v68 = v54;
        }
        while (v54);
      }
LABEL_68:

      if (*(_BYTE *)(*(_QWORD *)(v15[9] + 8) + 24))
      {
        *a3 = 1;

        v4 = v57;
        v8 = context;
        goto LABEL_74;
      }

      objc_autoreleasePoolPop(context);
      v7 = v60 + 1;
      v4 = v57;
      if (v60 + 1 == v59)
      {
        v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
        if (!v59)
          goto LABEL_75;
        goto LABEL_4;
      }
    }
    *a3 = 1;
LABEL_74:
    objc_autoreleasePoolPop(v8);
LABEL_75:

  }
}

void __145__PLJournalManager__enumerateJournalEntriesFromHistoryToken_latestHistoryToken_withManagedObjectContext_journalEntryBlock_shouldStopBlock_error___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = a3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v14 = objc_msgSend(*(id *)(a1 + 32), "payloadClassForPayloadClassID:", v7, (_QWORD)v16);
        if (v14)
        {
          v15 = -[PLJournalEntry initForDeleteWithPayloadID:payloadClass:]([PLJournalEntry alloc], "initForDeleteWithPayloadID:payloadClass:", v13, v14);
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
          {
            *a4 = 1;

            goto LABEL_13;
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_13:

}

void __121__PLJournalManager_performPartialSnapshotForPayloadClassIDs_append_createOnlyIfNecessary_withManagedObjectContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  PLJournal *v13;
  void *v14;
  PLJournal *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void **v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C97C18], "currentQueryGenerationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setQueryGenerationFromToken:error:", v3, 0);

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v38 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x19AEC1554]();
        v11 = objc_msgSend(*(id *)(a1 + 48), "payloadClassForPayloadClassID:", v9);
        if (v11)
        {
          v12 = v11;
          v13 = [PLJournal alloc];
          objc_msgSend(*(id *)(a1 + 48), "baseURL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[PLJournal initWithBaseURL:payloadClass:](v13, "initWithBaseURL:payloadClass:", v14, v12);

          v16 = *(void **)(a1 + 48);
          if (*(_BYTE *)(a1 + 72))
          {
            v17 = *(_QWORD *)(a1 + 32);
            v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v20 = *(void **)(v18 + 40);
            v19 = (void **)(v18 + 40);
            v36 = v20;
            v21 = objc_msgSend(v16, "appendSnapshotWithJournal:usingManagedObjectContext:changedKeys:entryLimit:error:", v15, v17, 0, 0, &v36);
            v22 = v36;
          }
          else
          {
            v23 = *(unsigned __int8 *)(a1 + 73);
            v24 = *(_QWORD *)(a1 + 32);
            v25 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v26 = *(void **)(v25 + 40);
            v19 = (void **)(v25 + 40);
            v35 = v26;
            v21 = objc_msgSend(v16, "createSnapshotWithJournal:createOnlyIfNecessary:usingManagedObjectContext:entryLimit:error:", v15, v23, v24, 0, &v35);
            v22 = v35;
          }
          v27 = v22;
          v28 = *v19;
          *v19 = v27;

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v21;
          if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
          {
            PLMigrationGetLog();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(*(id *)(a1 + 48), "name");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
              *(_DWORD *)buf = 138543874;
              v42 = v30;
              v43 = 2114;
              v44 = v9;
              v45 = 2112;
              v46 = v31;
              _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: could not create partial snapshot of payloadID %{public}@: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v10);
            goto LABEL_18;
          }

        }
        objc_autoreleasePoolPop(v10);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_18:

  objc_msgSend(*(id *)(a1 + 32), "setQueryGenerationFromToken:error:", 0, 0);
  PLMigrationGetLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 48), "name");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v42 = v33;
    v43 = 2112;
    v44 = v34;
    _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: finished partial snapshot for payloadClassIDs: %@{public}", buf, 0x16u);

  }
}

void __115__PLJournalManager_performFullSnapshotAppend_createOnlyIfNecessary_withManagedObjectContext_entryLimitBlock_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void **v19;
  void *v20;
  BOOL v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  char v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  id obj;
  void *v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[2];
  char v51;
  void *v52;
  _QWORD v53[5];
  id v54;
  _QWORD v55[2];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  PLMigrationGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v57 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: performing full snapshot", buf, 0xCu);

  }
  v4 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C97C18], "currentQueryGenerationToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueryGenerationFromToken:error:", v5, 0);

  objc_msgSend(*(id *)(a1 + 40), "persistentStoreCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentPersistentHistoryTokenFromStores:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(unsigned __int8 *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "baseURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "payloadClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __115__PLJournalManager_performFullSnapshotAppend_createOnlyIfNecessary_withManagedObjectContext_entryLimitBlock_error___block_invoke_3;
    v53[3] = &unk_1E3663370;
    v11 = (id *)v55;
    v12 = *(id *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v55[0] = v12;
    v53[4] = v13;
    v15 = &v54;
    v16 = v14;
    v17 = *(_QWORD *)(a1 + 64);
    v54 = v16;
    v55[1] = v17;
    v18 = *(_QWORD *)(v17 + 8);
    v20 = *(void **)(v18 + 40);
    v19 = (void **)(v18 + 40);
    v52 = v20;
    v21 = +[PLJournal appendSnapshotsForBaseURL:payloadClasses:snapshotJournalBlock:error:](PLJournal, "appendSnapshotsForBaseURL:payloadClasses:snapshotJournalBlock:error:", v9, v10, v53, &v52);
    v22 = v52;
  }
  else
  {
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __115__PLJournalManager_performFullSnapshotAppend_createOnlyIfNecessary_withManagedObjectContext_entryLimitBlock_error___block_invoke_2;
    v48[3] = &unk_1E3663398;
    v11 = (id *)v50;
    v23 = *(id *)(a1 + 48);
    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(void **)(a1 + 40);
    v50[0] = v23;
    v48[4] = v24;
    v51 = *(_BYTE *)(a1 + 73);
    v15 = &v49;
    v26 = v25;
    v27 = *(_QWORD *)(a1 + 64);
    v49 = v26;
    v50[1] = v27;
    v28 = *(unsigned __int8 *)(a1 + 73);
    v29 = *(_QWORD *)(v27 + 8);
    v30 = *(void **)(v29 + 40);
    v19 = (void **)(v29 + 40);
    v47 = v30;
    v21 = +[PLJournal createSnapshotsForBaseURL:payloadClasses:snapshotJournalBlock:createOnlyIfNecessary:error:](PLJournal, "createSnapshotsForBaseURL:payloadClasses:snapshotJournalBlock:createOnlyIfNecessary:error:", v9, v10, v48, v28, &v47);
    v22 = v47;
  }
  v31 = v22;
  v32 = *v19;
  *v19 = v31;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v21;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    PLMigrationGetLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v57 = v40;
      v58 = 2112;
      v59 = v43;
      v42 = "JournalManager[%{public}@]: could not create full snapshot: %@";
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
  v33 = objc_msgSend(v7, "copy");
  v34 = *(_QWORD *)(a1 + 32);
  v35 = *(void **)(v34 + 72);
  *(_QWORD *)(v34 + 72) = v33;

  if (v7)
  {
    v36 = *(void **)(a1 + 32);
    v37 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v37 + 40);
    v38 = objc_msgSend(v36, "saveHistoryToken:error:", v7, &obj);
    objc_storeStrong((id *)(v37 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v38;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      PLMigrationGetLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "name");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v57 = v40;
        v58 = 2112;
        v59 = v41;
        v42 = "JournalManager[%{public}@]: history token property list could not be written after snapshot: %@";
LABEL_13:
        _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_ERROR, v42, buf, 0x16u);

        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
LABEL_15:
  objc_msgSend(*(id *)(a1 + 40), "setQueryGenerationFromToken:error:", 0, 0);
  PLMigrationGetLog();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v57 = v45;
    _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: finished full snapshot", buf, 0xCu);

  }
}

uint64_t __115__PLJournalManager_performFullSnapshotAppend_createOnlyIfNecessary_withManagedObjectContext_entryLimitBlock_error___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id obj;

  v3 = a2;
  v4 = a1[6];
  if (v4)
    v5 = (*(uint64_t (**)(uint64_t, id))(v4 + 16))(v4, v3);
  else
    v5 = 0;
  v6 = (void *)a1[4];
  v7 = a1[5];
  v8 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v6, "appendSnapshotWithJournal:usingManagedObjectContext:changedKeys:entryLimit:error:", v3, v7, 0, v5, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);

  return v9;
}

uint64_t __115__PLJournalManager_performFullSnapshotAppend_createOnlyIfNecessary_withManagedObjectContext_entryLimitBlock_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id obj;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    v5 = (*(uint64_t (**)(uint64_t, id))(v4 + 16))(v4, v3);
  else
    v5 = 0;
  v6 = *(unsigned __int8 *)(a1 + 64);
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v9 + 40);
  v10 = objc_msgSend(v7, "createSnapshotWithJournal:createOnlyIfNecessary:usingManagedObjectContext:entryLimit:error:", v3, v6, v8, v5, &obj);
  objc_storeStrong((id *)(v9 + 40), obj);

  return v10;
}

void __42__PLJournalManager__needsPartialSnapshot___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  PLJournal *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  PLJournal *v14;

  v7 = [PLJournal alloc];
  objc_msgSend(*(id *)(a1 + 32), "baseURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PLJournal initWithBaseURL:payloadClass:](v7, "initWithBaseURL:payloadClass:", v8, a2);

  -[PLJournal metadata](v14, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("snapshotPayloadVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");

  if (v11 < objc_msgSend(a2, "minimumSnapshotPayloadVersion"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v12 = *(void **)(a1 + 40);
    if (v12)
    {
      objc_msgSend(a2, "payloadClassID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v13);

    }
    else
    {
      *a4 = 1;
    }
  }

}

void __38__PLJournalManager__needsFullSnapshot__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  PLJournal *v7;
  void *v8;
  void *v9;
  PLJournal *v10;

  v7 = [PLJournal alloc];
  objc_msgSend(*(id *)(a1 + 32), "baseURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLJournal initWithBaseURL:payloadClass:](v7, "initWithBaseURL:payloadClass:", v8, a2);

  -[PLJournal metadata](v10, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9 != 0;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;

}

@end
