@implementation PLModelMigrationAction_DeleteInvalidSocialGroups

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  PLEnumerateAndSaveController *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  PLEnumerateAndSaveController *v15;
  id v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  __int128 *v22;
  void *v23;
  int64_t v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  __int128 *v31;
  void *v32;
  uint64_t v34;
  id v35;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  _QWORD *v39;
  _QWORD v40[6];
  _QWORD v41[4];
  id v42;
  _QWORD v43[5];
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  void *v50;
  __int16 v51;
  id v52;
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
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[PLGraphLabel ensureLabelsAreUpdatedInContext:](PLGraphLabel, "ensureLabelsAreUpdatedInContext:", v6);
  +[PLGraphNode fetchRequest](PLGraphNode, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("primaryLabelCode"), 1000);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__38433;
  v43[4] = __Block_byref_object_dispose__38434;
  v44 = 0;
  v9 = [PLEnumerateAndSaveController alloc];
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __96__PLModelMigrationAction_DeleteInvalidSocialGroups_performActionWithManagedObjectContext_error___block_invoke;
  v41[3] = &unk_1E36700D0;
  v42 = v6;
  v40[0] = v13;
  v40[1] = 3221225472;
  v40[2] = __96__PLModelMigrationAction_DeleteInvalidSocialGroups_performActionWithManagedObjectContext_error___block_invoke_2;
  v40[3] = &unk_1E3670818;
  v40[4] = self;
  v40[5] = v43;
  v36[0] = v13;
  v36[1] = 3221225472;
  v36[2] = __96__PLModelMigrationAction_DeleteInvalidSocialGroups_performActionWithManagedObjectContext_error___block_invoke_3;
  v36[3] = &unk_1E3669608;
  v14 = v42;
  v37 = v14;
  v38 = &v45;
  v39 = v43;
  v15 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v9, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v11, v7, v14, v12, 0, 0, v41, v40, v36);

  v35 = 0;
  LOBYTE(v12) = -[PLEnumerateAndSaveController processObjectsWithError:](v15, "processObjectsWithError:", &v35);
  v16 = v35;
  if ((v12 & 1) != 0)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      PLMigrationGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

      if (v19)
      {
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
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        PLMigrationGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        v21 = (void *)v46[3];
        v49 = 134217984;
        v50 = v21;
        LODWORD(v34) = 12;
        v22 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v49, v34);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "logWithMessage:fromCodeLocation:type:", v22, "PLModelMigrationActions_18000.m", 1381, 0);

        if (v22 != &v53)
          free(v22);
      }
    }
    v24 = 1;
  }
  else
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      PLMigrationGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

      if (v27)
      {
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
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        PLMigrationGetLog();
        v28 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 138543618;
        v50 = v30;
        v51 = 2114;
        v52 = v16;
        LODWORD(v34) = 22;
        v31 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v49, v34);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "logWithMessage:fromCodeLocation:type:", v31, "PLModelMigrationActions_18000.m", 1379, 16);

        if (v31 != &v53)
          free(v31);
      }
    }
    if (a4)
      *a4 = objc_retainAutorelease(v16);
    v24 = 3;
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(&v45, 8);

  return v24;
}

+ (int64_t)actionProgressWeight
{
  return 300;
}

@end
