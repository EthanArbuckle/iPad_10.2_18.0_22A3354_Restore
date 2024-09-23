@implementation PLModelMigrationAction_RemoveLabelsFromSyndication

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PLEnumerateAndSaveController *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  PLEnumerateAndSaveController *v16;
  id *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  uint64_t v22;
  __int128 *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  int64_t v36;
  uint64_t v38;
  id obj;
  _QWORD v40[5];
  id v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  _QWORD v45[6];
  _QWORD v46[4];
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
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
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 1;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__38433;
  v58 = __Block_byref_object_dispose__38434;
  v59 = 0;
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLGraphLabel entityName](PLGraphLabel, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__38433;
  v52 = __Block_byref_object_dispose__38434;
  v53 = 0;
  v10 = [PLEnumerateAndSaveController alloc];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __98__PLModelMigrationAction_RemoveLabelsFromSyndication_performActionWithManagedObjectContext_error___block_invoke;
  v46[3] = &unk_1E36700D0;
  v47 = v6;
  v45[0] = v14;
  v45[1] = 3221225472;
  v45[2] = __98__PLModelMigrationAction_RemoveLabelsFromSyndication_performActionWithManagedObjectContext_error___block_invoke_2;
  v45[3] = &unk_1E3670818;
  v45[4] = self;
  v45[5] = &v48;
  v40[0] = v14;
  v40[1] = 3221225472;
  v40[2] = __98__PLModelMigrationAction_RemoveLabelsFromSyndication_performActionWithManagedObjectContext_error___block_invoke_3;
  v40[3] = &unk_1E3669478;
  v40[4] = self;
  v42 = &v54;
  v43 = &v60;
  v15 = v47;
  v41 = v15;
  v44 = &v48;
  v16 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v10, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v12, v9, v15, v13, 0, 1, v46, v45, v40);

  v17 = (id *)(v55 + 5);
  obj = (id)v55[5];
  LODWORD(v13) = -[PLEnumerateAndSaveController processObjectsWithError:](v16, "processObjectsWithError:", &obj);
  objc_storeStrong(v17, obj);
  if ((_DWORD)v13)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_10;
    PLMigrationGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if (!v20)
      goto LABEL_10;
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    PLMigrationGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    v22 = objc_msgSend((id)v49[5], "totalUnitCount");
    v64 = 134217984;
    v65 = v22;
    LODWORD(v38) = 12;
    v23 = (__int128 *)_os_log_send_and_compose_impl();

    -[PLModelMigrationActionCore logger](self, "logger", &v64, v38);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "logWithMessage:fromCodeLocation:type:", v23, "PLModelMigrationActions_18000.m", 616, 0);

  }
  else
  {
    v61[3] = 3;
    -[PLModelMigrationActionCore logger](self, "logger");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
      goto LABEL_10;
    PLMigrationGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

    if (!v27)
      goto LABEL_10;
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    PLMigrationGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v55[5];
    v64 = 138543618;
    v65 = (uint64_t)v30;
    v66 = 2112;
    v67 = v31;
    LODWORD(v38) = 22;
    v23 = (__int128 *)_os_log_send_and_compose_impl();

    -[PLModelMigrationActionCore logger](self, "logger", &v64, v38);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "logWithMessage:fromCodeLocation:type:", v23, "PLModelMigrationActions_18000.m", 619, 16);

  }
  if (v23 != &v68)
    free(v23);
LABEL_10:
  v33 = v61[3];
  v34 = (id)v55[5];
  v35 = v34;
  if (v33 != 1 && a4)
    *a4 = objc_retainAutorelease(v34);

  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v36 = v61[3];

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v60, 8);
  return v36;
}

@end
