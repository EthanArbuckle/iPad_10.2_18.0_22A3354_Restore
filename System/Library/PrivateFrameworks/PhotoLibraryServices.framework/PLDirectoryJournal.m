@implementation PLDirectoryJournal

- (PLDirectoryJournal)initWithPathManager:(id)a3 payloadClass:(Class)a4
{
  id v7;
  PLDirectoryJournal *v8;
  PLDirectoryJournal *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLDirectoryJournal;
  v8 = -[PLDirectoryJournal init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pathManager, a3);
    v9->_payloadClass = a4;
  }

  return v9;
}

- (Class)payloadClass
{
  return self->_payloadClass;
}

- (id)baseURLCreateIfNeeded:(BOOL)a3
{
  _BOOL8 v3;
  PLPhotoLibraryPathManager *pathManager;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  pathManager = self->_pathManager;
  -[objc_class payloadClassID](self->_payloadClass, "payloadClassID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManager photoDirectoryWithType:leafType:additionalPathComponents:createIfNeeded:error:](pathManager, "photoDirectoryWithType:leafType:additionalPathComponents:createIfNeeded:error:", 8, 1, v5, v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)shouldPersistManagedObject:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  Class payloadClass;
  void *v12;

  v4 = a3;
  if ((objc_msgSend(v4, "isDeleted") & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    if ((objc_msgSend(v4, "isInserted") & 1) != 0)
      goto LABEL_8;
    objc_msgSend(v4, "changedValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v7 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v4, "changedValues");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "allKeys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setWithArray:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

    payloadClass = self->_payloadClass;
    -[objc_class entityName](payloadClass, "entityName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[objc_class shouldPersistForChangedKeys:entityName:](payloadClass, "shouldPersistForChangedKeys:entityName:", v10, v12);

    if (v5)
LABEL_8:
      LOBYTE(v5) = 1;
  }

  return v5;
}

- (BOOL)persistManagedObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  PLJournal *v9;
  void *v10;
  void *v11;
  void *v12;
  PLJournal *v13;
  char v14;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[3];
  char v20;

  v6 = a3;
  -[objc_class payloadAdapterForManagedObject:](self->_payloadClass, "payloadAdapterForManagedObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "payloadID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if ((objc_msgSend(v7, "isValidForJournalPersistence") & 1) != 0)
    {
      v9 = [PLJournal alloc];
      -[PLDirectoryJournal baseURLCreateIfNeeded:](self, "baseURLCreateIfNeeded:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "payloadID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "payloadIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[PLJournal initWithBaseURL:name:payloadClass:hasMetadata:](v9, "initWithBaseURL:name:payloadClass:hasMetadata:", v10, v12, self->_payloadClass, 0);

      v19[0] = 0;
      v19[1] = v19;
      v19[2] = 0x2020000000;
      v20 = 0;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __49__PLDirectoryJournal_persistManagedObject_error___block_invoke;
      v16[3] = &unk_1E3660C38;
      v18 = v19;
      v17 = v7;
      v14 = -[PLJournal createSnapshotUsingNextPayloadBlock:createOnlyIfNecessary:error:](v13, "createSnapshotUsingNextPayloadBlock:createOnlyIfNecessary:error:", v16, 0, a4);

      _Block_object_dispose(v19, 8);
    }
    else
    {
      v14 = -[PLDirectoryJournal removePersistenceForManagedObject:error:](self, "removePersistenceForManagedObject:error:", v6, a4);
    }
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (BOOL)removePersistenceForManagedObject:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  PLJournal *v8;
  void *v9;
  void *v10;
  void *v11;
  PLJournal *v12;
  char v13;

  -[objc_class payloadAdapterForManagedObject:](self->_payloadClass, "payloadAdapterForManagedObject:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payloadID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [PLJournal alloc];
    -[PLDirectoryJournal baseURLCreateIfNeeded:](self, "baseURLCreateIfNeeded:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "payloadID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "payloadIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PLJournal initWithBaseURL:name:payloadClass:hasMetadata:](v8, "initWithBaseURL:name:payloadClass:hasMetadata:", v9, v11, self->_payloadClass, 0);

    v13 = -[PLJournal removeJournalFilesWithError:](v12, "removeJournalFilesWithError:", a4);
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (BOOL)removeAllPersistenceFilesWithError:(id *)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;
  int v8;
  id v9;
  void *v10;
  id v12;

  -[PLDirectoryJournal baseURLCreateIfNeeded:](self, "baseURLCreateIfNeeded:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v6 = objc_msgSend(v5, "removeItemAtURL:error:", v4, &v12);
  v7 = v12;

  v8 = PLIsErrorFileNotFound() | v6;
  v9 = v7;
  v10 = v9;
  if ((v8 & 1) == 0 && a3)
    *a3 = objc_retainAutorelease(v9);

  return v8;
}

- (BOOL)enumeratePayloadsUsingBlock:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unint64_t v13;
  void *v14;
  PLJournal *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id *v20;
  BOOL v21;
  int v22;
  id v23;
  void *v24;
  BOOL v25;
  id v28;
  PLDirectoryJournal *v29;
  void *v30;
  id obj;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  _QWORD v41[3];
  char v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[6];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  _BYTE v58[128];
  _QWORD v59[4];

  v59[2] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v29 = self;
  -[PLDirectoryJournal baseURLCreateIfNeeded:](self, "baseURLCreateIfNeeded:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 1;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__3099;
  v52 = __Block_byref_object_dispose__3100;
  v53 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C99A18];
  v59[0] = *MEMORY[0x1E0C99A90];
  v59[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __56__PLDirectoryJournal_enumeratePayloadsUsingBlock_error___block_invoke;
  v47[3] = &unk_1E3660C60;
  v47[4] = &v48;
  v47[5] = &v54;
  objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v30, v7, 5, v47);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v44 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "length");
        if (v13 < objc_msgSend(MEMORY[0x1E0D73308], "UUIDStringLength"))
        {
          v14 = 0;
LABEL_16:

          continue;
        }
        objc_msgSend(v12, "substringWithRange:", 0, objc_msgSend(MEMORY[0x1E0D73308], "UUIDStringLength"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14 || (PLIsValidUUIDString() & 1) == 0)
          goto LABEL_16;
        v15 = -[PLJournal initWithBaseURL:name:payloadClass:hasMetadata:]([PLJournal alloc], "initWithBaseURL:name:payloadClass:hasMetadata:", v30, v14, v29->_payloadClass, 0);
        -[PLJournal snapshotJournal](v15, "snapshotJournal");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "url");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v12, "isEqualToString:", v18);

        if ((v19 & 1) == 0)
        {

          goto LABEL_16;
        }
        v41[0] = 0;
        v41[1] = v41;
        v41[2] = 0x2020000000;
        v42 = 0;
        v37 = 0;
        v38 = &v37;
        v39 = 0x2020000000;
        v40 = 0;
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __56__PLDirectoryJournal_enumeratePayloadsUsingBlock_error___block_invoke_2;
        v33[3] = &unk_1E3660C88;
        v35 = v41;
        v34 = v28;
        v36 = &v37;
        v20 = (id *)(v49 + 5);
        v32 = (id)v49[5];
        v21 = -[PLJournal enumeratePayloadsUsingBlock:error:](v15, "enumeratePayloadsUsingBlock:error:", v33, &v32);
        objc_storeStrong(v20, v32);
        *((_BYTE *)v55 + 24) = v21;
        if (*((_BYTE *)v38 + 24))
          v21 = 0;

        _Block_object_dispose(&v37, 8);
        _Block_object_dispose(v41, 8);

        if (!v21)
          goto LABEL_19;
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
    }
    while (v9);
  }
LABEL_19:

  v22 = *((unsigned __int8 *)v55 + 24);
  v23 = (id)v49[5];
  v24 = v23;
  if (!v22 && a4)
    *a4 = objc_retainAutorelease(v23);

  v25 = *((_BYTE *)v55 + 24) != 0;
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathManager, 0);
}

uint64_t __56__PLDirectoryJournal_enumeratePayloadsUsingBlock_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;

  v5 = a3;
  v6 = PLIsErrorFileNotFound();
  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

  return v6;
}

uint64_t __56__PLDirectoryJournal_enumeratePayloadsUsingBlock_error___block_invoke_2(uint64_t result, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    *a3 = 1;
  }
  else
  {
    v3 = result;
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 24) = 1;
  }
  return result;
}

id __49__PLDirectoryJournal_persistManagedObject_error___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    return 0;
  *(_BYTE *)(v1 + 24) = 1;
  objc_msgSend(*(id *)(a1 + 32), "payloadForChangedKeys:", 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
