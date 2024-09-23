@implementation PLModelMigrationAction_RepairTrashHiddenDuplicateAssetVisibilityState

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  int64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  _OWORD *v28;
  void *v29;
  id v30;
  uint64_t v32;
  id v34;
  int v35;
  void *v36;
  __int16 v37;
  id v38;
  _OWORD v39[32];
  const __CFString *v40;
  void *v41;
  _QWORD v42[2];
  _QWORD v43[5];

  v43[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3528];
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a3;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("duplicateAssetVisibilityState"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v8;
  v9 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("trashedState"), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v42[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = YES"), CFSTR("hidden"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "orPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = CFSTR("duplicateAssetVisibilityState");
  v41 = &unk_1E375E580;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  LOBYTE(v10) = +[PLModelMigrator executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:](PLModelMigrator, "executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:", v17, v15, v16, v7, &v34);

  v18 = v34;
  if ((v10 & 1) != 0)
  {
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    v19 = v18;
    v20 = 1;
  }
  else
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      PLMigrationGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

      if (v24)
      {
        memset(v39, 0, sizeof(v39));
        PLMigrationGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138543618;
        v36 = v27;
        v37 = 2114;
        v38 = v18;
        LODWORD(v32) = 22;
        v28 = (_OWORD *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v35, v32);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "logWithMessage:fromCodeLocation:type:", v28, "PLModelMigrationActions_16000.m", 482, 16);

        if (v28 != v39)
          free(v28);
      }
    }
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    v30 = v18;
    if (a4)
      *a4 = objc_retainAutorelease(v30);
    v20 = 3;
  }

  return v20;
}

@end
