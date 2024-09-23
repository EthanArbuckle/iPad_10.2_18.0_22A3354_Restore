@implementation PLModelMigrationAction_ResetExternalAssets

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  __int128 *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  id v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  uint64_t v30;
  __int128 *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  _BOOL4 v36;
  NSObject *v37;
  __int128 *v38;
  void *v39;
  id v40;
  NSObject *v41;
  _BOOL4 v42;
  NSObject *v43;
  uint64_t v44;
  __int128 *v45;
  void *v46;
  void *v47;
  void *v48;
  _BOOL4 v49;
  id v50;
  uint64_t v52;
  uint64_t v53;
  void *context;
  id *v55;
  id *v56;
  id v57;
  id v58;
  int v59;
  uint64_t v60;
  __int16 v61;
  id v62;
  _QWORD v63[2];
  _QWORD v64[2];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend((id)objc_opt_class(), "predicateForFetchingAssetsToReset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset fetchRequest](PLManagedAsset, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v8);
  v10 = 1;
  objc_msgSend(v9, "setResultType:", 1);
  v58 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v9, &v58);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v58;
  if (!v11)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      v55 = a4;
      PLMigrationGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (v16)
      {
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        PLMigrationGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
        v59 = 138543362;
        v60 = (uint64_t)v12;
        LODWORD(v52) = 12;
        v18 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v59, v52);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logWithMessage:fromCodeLocation:type:", v18, "PLModelMigrationActions_17000.m", 265, 16);

        if (v18 != &v65)
          free(v18);
      }
      v10 = 3;
      a4 = v55;
    }
    else
    {
      v10 = 3;
    }
  }

  objc_autoreleasePoolPop(v7);
  if (!objc_msgSend(v11, "count"))
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = (void *)v33;
      PLMigrationGetLog();
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);

      if (v36)
      {
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        PLMigrationGetLog();
        v37 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
        LOWORD(v59) = 0;
        LODWORD(v52) = 2;
        v38 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v59, v52);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "logWithMessage:fromCodeLocation:type:", v38, "PLModelMigrationActions_17000.m", 270, 0);

        if (v38 != &v65)
          free(v38);
      }
    }
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    v40 = v12;
    v24 = v40;
    if (!v11 && a4)
      *a4 = objc_retainAutorelease(v40);
    goto LABEL_36;
  }
  v56 = a4;
  context = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("asset"), v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = CFSTR("syndicationProcessingValue");
  v63[1] = CFSTR("syndicationProcessingVersion");
  v64[0] = &unk_1E375F018;
  v64[1] = &unk_1E375F030;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMediaAnalysisAssetAttributes entityName](PLMediaAnalysisAssetAttributes, "entityName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v12;
  v23 = +[PLModelMigrator executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:](PLModelMigrator, "executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:", v22, v20, v21, v6, &v57);
  v24 = v57;

  -[PLModelMigrationActionCore logger](self, "logger");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v23)
  {
    if (v25)
    {
      PLMigrationGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

      if (v28)
      {
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        PLMigrationGetLog();
        v29 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
        v30 = objc_msgSend(v11, "count");
        v59 = 134217984;
        v60 = v30;
        LODWORD(v53) = 12;
        v31 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v59, v53);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "logWithMessage:fromCodeLocation:type:", v31, "PLModelMigrationActions_17000.m", 287, 0);

        if (v31 != &v65)
          free(v31);
      }
    }
  }
  else
  {
    if (v25)
    {
      PLMigrationGetLog();
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);

      if (v42)
      {
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        PLMigrationGetLog();
        v43 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
        v44 = objc_msgSend(v11, "count");
        v59 = 134218242;
        v60 = v44;
        v61 = 2114;
        v62 = v24;
        LODWORD(v53) = 22;
        v45 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v59, v53);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "logWithMessage:fromCodeLocation:type:", v45, "PLModelMigrationActions_17000.m", 290, 16);

        if (v45 != &v65)
          free(v45);
      }
    }
    v10 = 3;
  }

  objc_autoreleasePoolPop(context);
  if (v10 != 3)
  {
    v47 = (void *)MEMORY[0x19AEC1554]();
    -[PLModelMigrationActionCore pathManager](self, "pathManager");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = +[PLModelMigrator rebuildMomentsInContext:pathManager:deleteExistingMoments:targetedAssetOIDs:](PLModelMigrator, "rebuildMomentsInContext:pathManager:deleteExistingMoments:targetedAssetOIDs:", v6, v48, 0, v11);

    if (v49)
      v10 = 1;
    else
      v10 = 3;
    objc_autoreleasePoolPop(v47);
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    v50 = v24;
    v24 = v50;
    if (!v49 && v56)
      *v56 = objc_retainAutorelease(v50);
LABEL_36:

    goto LABEL_37;
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  if (v56)
  {
    v24 = objc_retainAutorelease(v24);
    *v56 = v24;
  }
  v10 = 3;
LABEL_37:

  return v10;
}

+ (id)predicateForFetchingAssetsToReset
{
  return +[PLMomentGenerationUtils internalPredicateToIncludeExternalAssetsEligibleForProcessing](PLMomentGenerationUtils, "internalPredicateToIncludeExternalAssetsEligibleForProcessing");
}

@end
