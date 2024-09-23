@implementation PLModelMigrationAction_CreateManualIndexes

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_class();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "createManualIndexesDropBeforeCreate:pathManager:", 0, v7))
    v8 = 1;
  else
    v8 = 3;

  objc_msgSend(v5, "setCompletedUnitCount:", objc_msgSend(v5, "completedUnitCount") + 1);
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");

  return v8;
}

+ (BOOL)createManualIndexesDropBeforeCreate:(BOOL)a3 pathManager:(id)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  sqlite3 *v7;
  uint64_t v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v11;
  uint8_t v13[16];
  _QWORD v14[4];
  __CFString *v15;
  uint8_t *v16;
  uint64_t *v17;
  sqlite3 *v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  int v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v4 = a3;
  v5 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  objc_msgSend(v5, "photosDatabasePath");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = PLOpenSQLTransactionWithDBPath((const char *)objc_msgSend(v6, "fileSystemRepresentation"));

  if (v7)
  {
    v8 = MEMORY[0x1E0C809B0];
    if (v4)
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __94__PLModelMigrationAction_CreateManualIndexes_createManualIndexesDropBeforeCreate_pathManager___block_invoke;
      v23[3] = &__block_descriptor_40_e35_v32__0__NSString_8__NSString_16_B24l;
      v23[4] = v7;
      objc_msgSend(&unk_1E37646E8, "enumerateKeysAndObjectsUsingBlock:", v23);
    }
    *(_QWORD *)buf = 0;
    v20 = buf;
    v21 = 0x2020000000;
    v22 = 0;
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __94__PLModelMigrationAction_CreateManualIndexes_createManualIndexesDropBeforeCreate_pathManager___block_invoke_2;
    v14[3] = &unk_1E36774D8;
    v15 = CFSTR("UNIQUE_INDEX");
    v16 = buf;
    v17 = &v24;
    v18 = v7;
    objc_msgSend(&unk_1E37646E8, "enumerateKeysAndObjectsUsingBlock:", v14);
    if (*((_DWORD *)v20 + 6))
    {
      PLRollbackSQLTransactionAndCloseDB(v7);
    }
    else if (!PLCommitSQLTransactionAndCloseDB(v7))
    {
      PLMigrationGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Unable to commit transaction involving creation of manual indexes.", v13, 2u);
      }

      *((_BYTE *)v25 + 24) = 0;
    }

    _Block_object_dispose(buf, 8);
    v10 = *((_BYTE *)v25 + 24) != 0;
  }
  else
  {
    PLMigrationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Unable to open db in order to create manual indexes.", buf, 2u);
    }

    v10 = 0;
    *((_BYTE *)v25 + 24) = 0;
  }
  _Block_object_dispose(&v24, 8);

  return v10;
}

@end
