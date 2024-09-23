@implementation PLModelMigrationAction_FixupTombstonedPeopleOnSharedLibraryRules

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  int64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  _OWORD *v26;
  void *v27;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  int v35;
  void *v36;
  __int16 v37;
  id v38;
  _OWORD v39[32];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLLibraryScope entityName](PLLibraryScope, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("autoSharePolicy"), 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  objc_msgSend(v9, "setFetchBatchSize:", 100);
  v34 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v9, &v34);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v34;
  if (v11)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "updatePeopleRulesForAllTombstonedPersons");
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      }
      while (v15);
    }

    v18 = 1;
  }
  else
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      PLMigrationGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

      if (v22)
      {
        memset(v39, 0, sizeof(v39));
        PLMigrationGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138543618;
        v36 = v25;
        v37 = 2114;
        v38 = v12;
        LODWORD(v29) = 22;
        v26 = (_OWORD *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v35, v29);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "logWithMessage:fromCodeLocation:type:", v26, "PLModelMigrationActions_16000.m", 929, 16);

        if (v26 != v39)
          free(v26);
      }
    }
    v18 = 3;
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease(v12);

  return v18;
}

@end
