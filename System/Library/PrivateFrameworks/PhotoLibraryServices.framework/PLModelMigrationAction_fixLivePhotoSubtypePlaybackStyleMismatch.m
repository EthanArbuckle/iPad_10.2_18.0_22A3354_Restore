@implementation PLModelMigrationAction_fixLivePhotoSubtypePlaybackStyleMismatch

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  int64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  _OWORD *v27;
  void *v28;
  id v29;
  uint64_t v31;
  id v32;
  int v33;
  void *v34;
  __int16 v35;
  id v36;
  _OWORD v37[32];
  const __CFString *v38;
  uint64_t v39;
  _QWORD v40[4];

  v40[3] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3528];
  v7 = (void *)MEMORY[0x1E0CB3880];
  v8 = a3;
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("kind"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("kindSubtype"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v10;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("playbackStyle"), 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = CFSTR("playbackStyle");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v14 = objc_claimAutoreleasedReturnValue();
  v39 = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  LOBYTE(v14) = +[PLModelMigrator executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:](PLModelMigrator, "executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:", v16, v13, v15, v8, &v32);

  v17 = v32;
  if ((v14 & 1) != 0)
  {
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    v18 = v17;
    if (a4)
      *a4 = objc_retainAutorelease(v18);
    v19 = 1;
  }
  else
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      PLMigrationGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

      if (v23)
      {
        memset(v37, 0, sizeof(v37));
        PLMigrationGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v26;
        v35 = 2114;
        v36 = v17;
        LODWORD(v31) = 22;
        v27 = (_OWORD *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v33, v31);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "logWithMessage:fromCodeLocation:type:", v27, "PLModelMigrationActions_16000.m", 1400, 16);

        if (v27 != v37)
          free(v27);
      }
    }
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    v29 = v17;
    v19 = 3;
  }

  return v19;
}

@end
