@implementation PLModelMigrationAction_FixSignExtended32bSceneIdentifiers

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PLEnumerateAndSaveController *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  PLEnumerateAndSaveController *v15;
  _BOOL4 v16;
  id v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  uint64_t v22;
  __int128 *v23;
  void *v24;
  int64_t v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  __int128 *v32;
  void *v33;
  id v34;
  void *v35;
  char v36;
  uint64_t v38;
  id v40;
  _QWORD v41[5];
  _QWORD v42[6];
  _QWORD v43[4];
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  int v51;
  uint64_t v52;
  __int16 v53;
  id v54;
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
  __int128 v85;
  __int128 v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLSceneClassification entityName](PLSceneClassification, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__38433;
  v49 = __Block_byref_object_dispose__38434;
  v50 = 0;
  v9 = [PLEnumerateAndSaveController alloc];
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __105__PLModelMigrationAction_FixSignExtended32bSceneIdentifiers_performActionWithManagedObjectContext_error___block_invoke;
  v43[3] = &unk_1E36700D0;
  v14 = v5;
  v44 = v14;
  v42[1] = 3221225472;
  v42[2] = __105__PLModelMigrationAction_FixSignExtended32bSceneIdentifiers_performActionWithManagedObjectContext_error___block_invoke_2;
  v42[3] = &unk_1E3670818;
  v42[4] = self;
  v42[5] = &v45;
  v41[0] = v13;
  v41[1] = 3221225472;
  v41[2] = __105__PLModelMigrationAction_FixSignExtended32bSceneIdentifiers_performActionWithManagedObjectContext_error___block_invoke_3;
  v41[3] = &unk_1E36694F0;
  v41[4] = &v45;
  v42[0] = v13;
  v15 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v9, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v11, v8, v14, v12, 0, 0, v43, v42, v41);

  v40 = 0;
  v16 = -[PLEnumerateAndSaveController processObjectsWithError:](v15, "processObjectsWithError:", &v40);
  v17 = v40;
  if (v16)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      PLMigrationGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);

      if (v20)
      {
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
        v55 = 0u;
        v56 = 0u;
        PLMigrationGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
        v22 = objc_msgSend((id)v46[5], "completedUnitCount");
        v51 = 134217984;
        v52 = v22;
        LODWORD(v38) = 12;
        v23 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v51, v38);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "logWithMessage:fromCodeLocation:type:", v23, "PLModelMigrationActions_18000.m", 775, 1);

        if (v23 != &v55)
          free(v23);
      }
    }
    v25 = 1;
  }
  else
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      PLMigrationGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

      if (v28)
      {
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
        v55 = 0u;
        v56 = 0u;
        PLMigrationGetLog();
        v29 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 138543618;
        v52 = (uint64_t)v31;
        v53 = 2112;
        v54 = v17;
        LODWORD(v38) = 22;
        v32 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v51, v38);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "logWithMessage:fromCodeLocation:type:", v32, "PLModelMigrationActions_18000.m", 778, 16);

        if (v32 != &v55)
          free(v32);
      }
    }
    v25 = 3;
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v34 = v17;
  v35 = v34;
  if (a4)
    v36 = v16;
  else
    v36 = 1;
  if ((v36 & 1) == 0)
    *a4 = objc_retainAutorelease(v34);

  _Block_object_dispose(&v45, 8);
  return v25;
}

@end
