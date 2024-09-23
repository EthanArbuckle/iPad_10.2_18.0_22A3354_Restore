@implementation PLModelMigrationAction_ReevaluateAllowedForAnalysisForMontageAssets

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  __int128 *v18;
  void *v19;
  id v20;
  int64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  __int128 *v29;
  void *v30;
  id v31;
  uint64_t v33;
  id v34;
  int v35;
  void *v36;
  __int16 v37;
  id v38;
  __int128 v39;
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
  const __CFString *v71;
  _QWORD v72[2];

  v72[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a3;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("montage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = CFSTR("allowedForAnalysis");
  v72[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, &v71, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v11 = +[PLModelMigrator executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:](PLModelMigrator, "executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:", v10, v8, v9, v7, &v34);

  v12 = v34;
  if (v11)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      PLMigrationGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

      if (v16)
      {
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        PLMigrationGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        LOWORD(v35) = 0;
        LODWORD(v33) = 2;
        v18 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v35, v33);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logWithMessage:fromCodeLocation:type:", v18, "PLModelMigrationActions_17000.m", 542, 0);

        if (v18 != &v39)
          free(v18);
      }
    }
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    v20 = v12;
    v21 = 1;
  }
  else
  {
    if (a4)
      *a4 = objc_retainAutorelease(v12);
    -[PLModelMigrationActionCore logger](self, "logger");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      PLMigrationGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

      if (v25)
      {
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        PLMigrationGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138543618;
        v36 = v28;
        v37 = 2114;
        v38 = v12;
        LODWORD(v33) = 22;
        v29 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v35, v33);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "logWithMessage:fromCodeLocation:type:", v29, "PLModelMigrationActions_17000.m", 546, 16);

        if (v29 != &v39)
          free(v29);
      }
    }
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    v31 = v12;
    if (a4)
      *a4 = objc_retainAutorelease(v31);
    v21 = 3;
  }

  return v21;
}

@end
