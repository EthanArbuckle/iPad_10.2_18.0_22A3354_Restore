@implementation PLModelMigrationAction_DrawAssetPersonEdges

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PLEnumerateAndSaveController *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  PLEnumerateAndSaveController *v18;
  id *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  uint64_t v24;
  __int128 *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  uint64_t v36;
  __int128 *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  int64_t v42;
  uint64_t v44;
  _QWORD v46[4];
  id v47;
  PLModelMigrationAction_DrawAssetPersonEdges *v48;
  id obj;
  _QWORD v50[5];
  id v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t *v54;
  _QWORD v55[6];
  _QWORD v56[4];
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
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
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _QWORD v110[4];

  v110[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v70 = 0;
  v71 = &v70;
  v72 = 0x2020000000;
  v73 = 1;
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__1109;
  v68 = __Block_byref_object_dispose__1110;
  v69 = 0;
  -[PLModelMigrationActionBackground resumeMarker](self, "resumeMarker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLManagedAsset fetchRequest](PLManagedAsset, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v10);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self >= %@"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPredicate:", v11);

  }
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__1109;
  v62 = __Block_byref_object_dispose__1110;
  v63 = 0;
  v12 = [PLEnumerateAndSaveController alloc];
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionBackground pathManager](self, "pathManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __91__PLModelMigrationAction_DrawAssetPersonEdges_performActionWithManagedObjectContext_error___block_invoke;
  v56[3] = &unk_1E36700D0;
  v57 = v5;
  v55[0] = v16;
  v55[1] = 3221225472;
  v55[2] = __91__PLModelMigrationAction_DrawAssetPersonEdges_performActionWithManagedObjectContext_error___block_invoke_2;
  v55[3] = &unk_1E3670818;
  v55[4] = self;
  v55[5] = &v58;
  v50[0] = v16;
  v50[1] = 3221225472;
  v50[2] = __91__PLModelMigrationAction_DrawAssetPersonEdges_performActionWithManagedObjectContext_error___block_invoke_3;
  v50[3] = &unk_1E3660018;
  v50[4] = self;
  v52 = &v64;
  v53 = &v70;
  v17 = v57;
  v51 = v17;
  v54 = &v58;
  v18 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultsBlock:](v12, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultsBlock:", v14, v8, v17, v15, 0, 1, v56, v55, v50);

  v19 = (id *)(v65 + 5);
  obj = (id)v65[5];
  LODWORD(v15) = -[PLEnumerateAndSaveController processObjectsWithError:](v18, "processObjectsWithError:", &obj);
  objc_storeStrong(v19, obj);
  if ((_DWORD)v15)
  {
    -[PLModelMigrationActionBackground logger](self, "logger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      PLMigrationGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

      if (v22)
      {
        v108 = 0u;
        v109 = 0u;
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
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
        PLMigrationGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        v24 = objc_msgSend((id)v59[5], "totalUnitCount");
        v74 = 134217984;
        v75 = v24;
        LODWORD(v44) = 12;
        v25 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionBackground logger](self, "logger", &v74, v44);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActionBackground.m", 1013, 0);

        if (v25 != &v78)
          free(v25);
      }
    }
    -[PLModelMigrationActionBackground databaseContext](self, "databaseContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "newShortLivedLibraryWithName:", "-[PLModelMigrationAction_DrawAssetPersonEdges performActionWithManagedObjectContext:error:]");

    v46[0] = v16;
    v46[1] = 3221225472;
    v46[2] = __91__PLModelMigrationAction_DrawAssetPersonEdges_performActionWithManagedObjectContext_error___block_invoke_263;
    v46[3] = &unk_1E3677C18;
    v29 = v28;
    v47 = v29;
    v48 = self;
    objc_msgSend(v29, "performTransactionAndWait:", v46);

  }
  else
  {
    v71[3] = 3;
    -[PLModelMigrationActionBackground logger](self, "logger");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      PLMigrationGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);

      if (v32)
      {
        v108 = 0u;
        v109 = 0u;
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
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
        PLMigrationGetLog();
        v33 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v65[5];
        v74 = 138543618;
        v75 = (uint64_t)v35;
        v76 = 2114;
        v77 = v36;
        LODWORD(v44) = 22;
        v37 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionBackground logger](self, "logger", &v74, v44);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "logWithMessage:fromCodeLocation:type:", v37, "PLModelMigrationActionBackground.m", 1025, 16);

        if (v37 != &v78)
          free(v37);
      }
    }
  }
  if (v71[3] == 1)
    -[PLModelMigrationActionBackground setResumeMarkerValue:](self, "setResumeMarkerValue:", 0);
  -[PLModelMigrationActionBackground finalizeProgress](self, "finalizeProgress");
  v39 = v71[3];
  v40 = (id)v65[5];
  v41 = v40;
  if (v39 != 1 && a4)
    *a4 = objc_retainAutorelease(v40);

  v42 = v71[3];
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v70, 8);

  return v42;
}

+ (int64_t)actionProgressWeight
{
  return 300;
}

@end
