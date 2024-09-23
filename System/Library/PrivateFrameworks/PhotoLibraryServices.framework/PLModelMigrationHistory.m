@implementation PLModelMigrationHistory

- (PLModelMigrationHistory)initWithManagedObjectContext:(id)a3
{
  id v6;
  PLModelMigrationHistory *v7;
  PLModelMigrationHistory *v8;
  NSManagedObjectContext *managedObjectContext;
  PLModelMigrationHistory *v10;
  NSObject *v11;
  void *v13;
  uint8_t buf[16];
  _QWORD v15[4];
  PLModelMigrationHistory *v16;
  id v17;
  objc_super v18;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLModelMigrationHistory.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ctx"));

  }
  v18.receiver = self;
  v18.super_class = (Class)PLModelMigrationHistory;
  v7 = -[PLModelMigrationHistory init](&v18, sel_init);
  if (v7)
  {
    v8 = v7;
    objc_storeStrong((id *)&v7->_managedObjectContext, a3);
    managedObjectContext = v8->_managedObjectContext;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __56__PLModelMigrationHistory_initWithManagedObjectContext___block_invoke;
    v15[3] = &unk_1E3677C18;
    v10 = v8;
    v16 = v10;
    v17 = v6;
    -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v15);
    if (!v10->_migrationHistory)
    {
      PLMigrationGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Failed to identify migration history", buf, 2u);
      }

      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isLibraryOlderThanVersion:(unsigned __int16)a3
{
  NSManagedObjectContext *managedObjectContext;
  char v4;
  _QWORD v6[6];
  unsigned __int16 v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  managedObjectContext = self->_managedObjectContext;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PLModelMigrationHistory_isLibraryOlderThanVersion___block_invoke;
  v6[3] = &unk_1E366F948;
  v7 = a3;
  v6[4] = self;
  v6[5] = &v8;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v6);
  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (BOOL)libraryWasEverRebuilt
{
  NSManagedObjectContext *managedObjectContext;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  managedObjectContext = self->_managedObjectContext;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__PLModelMigrationHistory_libraryWasEverRebuilt__block_invoke;
  v5[3] = &unk_1E3677C68;
  v5[4] = self;
  v5[5] = &v6;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)libraryVersionHistorySinceLastRebuildOnly:(BOOL)a3
{
  NSManagedObjectContext *managedObjectContext;
  id v6;
  _QWORD v8[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__66573;
  v14 = __Block_byref_object_dispose__66574;
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  managedObjectContext = self->_managedObjectContext;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__PLModelMigrationHistory_libraryVersionHistorySinceLastRebuildOnly___block_invoke;
  v8[3] = &unk_1E3671990;
  v8[4] = self;
  v8[5] = &v10;
  v9 = a3;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v8);
  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationHistory, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

uint64_t __69__PLModelMigrationHistory_libraryVersionHistorySinceLastRebuildOnly___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];
  char v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __69__PLModelMigrationHistory_libraryVersionHistorySinceLastRebuildOnly___block_invoke_2;
  v4[3] = &unk_1E366F998;
  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4[1] = 3221225472;
  v4[4] = v1;
  v5 = *(_BYTE *)(a1 + 48);
  return objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);
}

void __69__PLModelMigrationHistory_libraryVersionHistorySinceLastRebuildOnly___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v3 = a2;
  switch(objc_msgSend(v3, "migrationType"))
  {
    case 0u:
      PLMigrationGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Migration type not specified, skipping version record", v10, 2u);
      }

      break;
    case 1u:
    case 4u:
      if (*(_BYTE *)(a1 + 40))
      {
        v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v6 = *(void **)(v5 + 40);
        *(_QWORD *)(v5 + 40) = v4;

      }
      goto LABEL_4;
    case 2u:
    case 3u:
LABEL_4:
      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "modelVersion"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);

      break;
    default:
      break;
  }

}

uint64_t __48__PLModelMigrationHistory_libraryWasEverRebuilt__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__PLModelMigrationHistory_libraryWasEverRebuilt__block_invoke_2;
  v4[3] = &unk_1E366F970;
  v4[4] = v1;
  return objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);
}

uint64_t __48__PLModelMigrationHistory_libraryWasEverRebuilt__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "migrationType");
  if ((_DWORD)result == 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __53__PLModelMigrationHistory_isLibraryOlderThanVersion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];
  __int16 v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __53__PLModelMigrationHistory_isLibraryOlderThanVersion___block_invoke_2;
  v4[3] = &unk_1E366F920;
  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4[1] = 3221225472;
  v5 = *(_WORD *)(a1 + 48);
  v4[4] = v1;
  return objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);
}

void __53__PLModelMigrationHistory_isLibraryOlderThanVersion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v6 = a2;
  objc_msgSend(v6, "sourceModelVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "integerValue") <= 0)
  {
    v9 = objc_msgSend(v6, "modelVersion");
  }
  else
  {
    objc_msgSend(v6, "sourceModelVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "integerValue");
    v6 = v8;
  }

  if (v9 < *(unsigned __int16 *)(a1 + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __56__PLModelMigrationHistory_initWithManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[PLMigrationHistory migrationHistoryWithManagedObjectContext:](PLMigrationHistory, "migrationHistoryWithManagedObjectContext:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

}

@end
