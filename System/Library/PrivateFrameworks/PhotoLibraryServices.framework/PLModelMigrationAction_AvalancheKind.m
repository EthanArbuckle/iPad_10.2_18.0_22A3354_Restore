@implementation PLModelMigrationAction_AvalancheKind

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  char v12;
  id v13;
  id v14;
  int64_t v15;
  id v16;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  _OWORD *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  _OWORD v34[32];
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("avalancheUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = CFSTR("avalancheKind");
  v36[0] = &unk_1E375E988;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v10 = +[PLModelMigrator executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:](PLModelMigrator, "executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:", v8, v7, v9, v6, &v29);
  v11 = v29;

  if (v10)
  {
    v28 = v11;
    v12 = objc_msgSend(v6, "save:", &v28);
    v13 = v28;

    if ((v12 & 1) != 0)
    {
      v14 = v13;
      v15 = 1;
      goto LABEL_8;
    }
    -[PLModelMigrationActionCore logger](self, "logger");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      PLMigrationGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);

      if (v21)
      {
        memset(v34, 0, sizeof(v34));
        PLMigrationGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543618;
        v31 = v24;
        v32 = 2112;
        v33 = v13;
        LODWORD(v27) = 22;
        v25 = (_OWORD *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v30, v27);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActions_18000.m", 190, 16);

        if (v25 != v34)
          free(v25);
      }
    }
  }
  else
  {
    v13 = v11;
  }
  v16 = v13;
  v14 = v16;
  if (a4)
  {
    v14 = objc_retainAutorelease(v16);
    *a4 = v14;
  }
  v15 = 3;
LABEL_8:

  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  return v15;
}

@end
