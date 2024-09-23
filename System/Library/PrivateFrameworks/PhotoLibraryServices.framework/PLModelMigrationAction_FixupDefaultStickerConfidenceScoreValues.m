@implementation PLModelMigrationAction_FixupDefaultStickerConfidenceScoreValues

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  PLEnumerateAndSaveController *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  id v13;
  int64_t v14;
  PLEnumerateAndSaveController *v15;
  id v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  _OWORD *v24;
  void *v25;
  uint64_t v27;
  id v28;
  _QWORD v29[4];
  id v30;
  int v31;
  void *v32;
  __int16 v33;
  id v34;
  _OWORD v35[32];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[PLManagedAsset fetchRequest](PLManagedAsset, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = 0"), CFSTR("mediaAnalysisAttributes.visualSearchAttributes.algorithmVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  v9 = [PLEnumerateAndSaveController alloc];
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v12 = objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __111__PLModelMigrationAction_FixupDefaultStickerConfidenceScoreValues_performActionWithManagedObjectContext_error___block_invoke;
  v29[3] = &unk_1E36700D0;
  v13 = v6;
  v30 = v13;
  v14 = 1;
  v15 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v9, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v11, v7, v13, v12, 0, 1, v29, 0, &__block_literal_global_46864);

  v28 = 0;
  LOBYTE(v12) = -[PLEnumerateAndSaveController processObjectsWithError:](v15, "processObjectsWithError:", &v28);
  v16 = v28;
  if ((v12 & 1) == 0)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      PLMigrationGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (v20)
      {
        memset(v35, 0, sizeof(v35));
        PLMigrationGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543618;
        v32 = v23;
        v33 = 2114;
        v34 = v16;
        LODWORD(v27) = 22;
        v24 = (_OWORD *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v31, v27);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_17000.m", 100, 16);

        if (v24 != v35)
          free(v24);
      }
    }
    if (a4)
      *a4 = objc_retainAutorelease(v16);
    v14 = 3;
  }

  return v14;
}

@end
