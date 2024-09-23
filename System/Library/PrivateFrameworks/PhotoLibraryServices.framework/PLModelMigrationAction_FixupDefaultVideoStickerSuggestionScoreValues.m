@implementation PLModelMigrationAction_FixupDefaultVideoStickerSuggestionScoreValues

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  __int128 *v19;
  void *v20;
  id v21;
  int64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  __int128 *v30;
  void *v31;
  id v32;
  uint64_t v34;
  id v35;
  int v36;
  void *v37;
  __int16 v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  const __CFString *v72;
  _QWORD v73[2];

  v73[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a3;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K = 0"), CFSTR("mediaAnalysisVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = CFSTR("videoStickerSuggestionScore");
  LODWORD(v9) = -1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLMediaAnalysisAssetAttributes entityName](PLMediaAnalysisAssetAttributes, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  LODWORD(v10) = +[PLModelMigrator executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:](PLModelMigrator, "executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:", v12, v8, v11, v7, &v35);

  v13 = v35;
  if ((_DWORD)v10)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      PLMigrationGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

      if (v17)
      {
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        PLMigrationGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        LOWORD(v36) = 0;
        LODWORD(v34) = 2;
        v19 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v36, v34);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "logWithMessage:fromCodeLocation:type:", v19, "PLModelMigrationActions_17000.m", 120, 0);

        if (v19 != &v40)
          free(v19);
      }
    }
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    v21 = v13;
    v22 = 1;
  }
  else
  {
    if (a4)
      *a4 = objc_retainAutorelease(v13);
    -[PLModelMigrationActionCore logger](self, "logger");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      PLMigrationGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

      if (v26)
      {
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        PLMigrationGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138543618;
        v37 = v29;
        v38 = 2114;
        v39 = v13;
        LODWORD(v34) = 22;
        v30 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v36, v34);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "logWithMessage:fromCodeLocation:type:", v30, "PLModelMigrationActions_17000.m", 124, 16);

        if (v30 != &v40)
          free(v30);
      }
    }
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    v32 = v13;
    if (a4)
      *a4 = objc_retainAutorelease(v32);
    v22 = 3;
  }

  return v22;
}

@end
