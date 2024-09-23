@implementation PLModelMigrationAction_UpdateHighlightCollageAssets

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  PLEnumerateAndSaveController *v12;
  void *v13;
  uint64_t v14;
  id v15;
  PLEnumerateAndSaveController *v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  uint64_t v23;
  __int128 *v24;
  void *v25;
  int64_t v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  __int128 *v33;
  void *v34;
  id v35;
  void *v36;
  char v37;
  uint64_t v39;
  void *v41;
  id v42;
  _QWORD v43[5];
  _QWORD v44[6];
  _QWORD v45[4];
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  int v53;
  uint64_t v54;
  __int16 v55;
  id v56;
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
  _QWORD v89[9];

  v89[6] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLPhotosHighlight entityName](PLPhotosHighlight, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kind"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  v89[0] = CFSTR("collageAssetsPrivate");
  v89[1] = CFSTR("collageAssetsShared");
  v89[2] = CFSTR("collageAssetsMixed");
  v89[3] = CFSTR("extendedAssets");
  v89[4] = CFSTR("keyAssetPrivate");
  v89[5] = CFSTR("keyAssetShared");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRelationshipKeyPathsForPrefetching:", v10);

  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__38433;
  v51 = __Block_byref_object_dispose__38434;
  v52 = 0;
  v12 = [PLEnumerateAndSaveController alloc];
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __99__PLModelMigrationAction_UpdateHighlightCollageAssets_performActionWithManagedObjectContext_error___block_invoke;
  v45[3] = &unk_1E36700D0;
  v15 = v5;
  v46 = v15;
  v44[1] = 3221225472;
  v44[2] = __99__PLModelMigrationAction_UpdateHighlightCollageAssets_performActionWithManagedObjectContext_error___block_invoke_2;
  v44[3] = &unk_1E3670818;
  v44[4] = self;
  v44[5] = &v47;
  v43[0] = v14;
  v43[1] = 3221225472;
  v43[2] = __99__PLModelMigrationAction_UpdateHighlightCollageAssets_performActionWithManagedObjectContext_error___block_invoke_3;
  v43[3] = &unk_1E3669630;
  v43[4] = &v47;
  v44[0] = v14;
  v16 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v12, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v41, v8, v15, v13, 0, 0, v45, v44, v43);

  v42 = 0;
  v17 = -[PLEnumerateAndSaveController processObjectsWithError:](v16, "processObjectsWithError:", &v42);
  v18 = v42;
  if (v17)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      PLMigrationGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);

      if (v21)
      {
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
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        PLMigrationGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
        v23 = objc_msgSend((id)v48[5], "completedUnitCount");
        v53 = 134217984;
        v54 = v23;
        LODWORD(v39) = 12;
        v24 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v53, v39);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_18000.m", 1417, 1);

        if (v24 != &v57)
          free(v24);
      }
    }
    v26 = 1;
  }
  else
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      PLMigrationGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

      if (v29)
      {
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
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        PLMigrationGetLog();
        v30 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 138543618;
        v54 = (uint64_t)v32;
        v55 = 2112;
        v56 = v18;
        LODWORD(v39) = 22;
        v33 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v53, v39);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "logWithMessage:fromCodeLocation:type:", v33, "PLModelMigrationActions_18000.m", 1420, 16);

        if (v33 != &v57)
          free(v33);
      }
    }
    v26 = 3;
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v35 = v18;
  v36 = v35;
  if (a4)
    v37 = v17;
  else
    v37 = 1;
  if ((v37 & 1) == 0)
    *a4 = objc_retainAutorelease(v35);

  _Block_object_dispose(&v47, 8);
  return v26;
}

+ (int64_t)actionProgressWeight
{
  return 200;
}

@end
