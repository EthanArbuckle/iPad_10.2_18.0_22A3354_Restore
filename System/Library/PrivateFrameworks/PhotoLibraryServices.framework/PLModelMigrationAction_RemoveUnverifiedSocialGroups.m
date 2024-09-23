@implementation PLModelMigrationAction_RemoveUnverifiedSocialGroups

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PLEnumerateAndSaveController *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  PLEnumerateAndSaveController *v17;
  id *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  uint64_t v23;
  __int128 *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  int64_t v37;
  uint64_t v39;
  id obj;
  _QWORD v41[5];
  id v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t *v45;
  _QWORD v46[6];
  _QWORD v47[4];
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
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
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 1;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__38433;
  v59 = __Block_byref_object_dispose__38434;
  v60 = 0;
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLGraphNode entityName](PLGraphNode, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("primaryLabelCode"), 1000);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__38433;
  v53 = __Block_byref_object_dispose__38434;
  v54 = 0;
  v11 = [PLEnumerateAndSaveController alloc];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __99__PLModelMigrationAction_RemoveUnverifiedSocialGroups_performActionWithManagedObjectContext_error___block_invoke;
  v47[3] = &unk_1E36700D0;
  v48 = v6;
  v46[0] = v15;
  v46[1] = 3221225472;
  v46[2] = __99__PLModelMigrationAction_RemoveUnverifiedSocialGroups_performActionWithManagedObjectContext_error___block_invoke_2;
  v46[3] = &unk_1E3670818;
  v46[4] = self;
  v46[5] = &v49;
  v41[0] = v15;
  v41[1] = 3221225472;
  v41[2] = __99__PLModelMigrationAction_RemoveUnverifiedSocialGroups_performActionWithManagedObjectContext_error___block_invoke_3;
  v41[3] = &unk_1E3669540;
  v41[4] = self;
  v43 = &v55;
  v44 = &v61;
  v16 = v48;
  v42 = v16;
  v45 = &v49;
  v17 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v11, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v13, v9, v16, v14, 0, 1, v47, v46, v41);

  v18 = (id *)(v56 + 5);
  obj = (id)v56[5];
  LODWORD(v14) = -[PLEnumerateAndSaveController processObjectsWithError:](v17, "processObjectsWithError:", &obj);
  objc_storeStrong(v18, obj);
  if ((_DWORD)v14)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
      goto LABEL_10;
    PLMigrationGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

    if (!v21)
      goto LABEL_10;
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
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
    PLMigrationGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    v23 = objc_msgSend((id)v50[5], "totalUnitCount");
    v65 = 134217984;
    v66 = v23;
    LODWORD(v39) = 12;
    v24 = (__int128 *)_os_log_send_and_compose_impl();

    -[PLModelMigrationActionCore logger](self, "logger", &v65, v39);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_18000.m", 943, 0);

  }
  else
  {
    v62[3] = 3;
    -[PLModelMigrationActionCore logger](self, "logger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
      goto LABEL_10;
    PLMigrationGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

    if (!v28)
      goto LABEL_10;
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
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
    PLMigrationGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v56[5];
    v65 = 138543618;
    v66 = (uint64_t)v31;
    v67 = 2112;
    v68 = v32;
    LODWORD(v39) = 22;
    v24 = (__int128 *)_os_log_send_and_compose_impl();

    -[PLModelMigrationActionCore logger](self, "logger", &v65, v39);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_18000.m", 946, 16);

  }
  if (v24 != &v69)
    free(v24);
LABEL_10:
  v34 = v62[3];
  v35 = (id)v56[5];
  v36 = v35;
  if (v34 != 1 && a4)
    *a4 = objc_retainAutorelease(v35);

  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v37 = v62[3];

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  return v37;
}

+ (int64_t)actionProgressWeight
{
  return 100;
}

@end
