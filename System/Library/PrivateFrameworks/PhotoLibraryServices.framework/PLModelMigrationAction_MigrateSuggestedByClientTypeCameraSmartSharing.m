@implementation PLModelMigrationAction_MigrateSuggestedByClientTypeCameraSmartSharing

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  return -[PLModelMigrationAction_MigrateSuggestedByClientTypeCameraSmartSharing performActionWithManagedObjectContext:error:shouldForce:](self, "performActionWithManagedObjectContext:error:shouldForce:", a3, a4, 0);
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4 shouldForce:(BOOL)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  __int128 *v14;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  _BOOL4 v35;
  NSObject *v36;
  objc_class *v37;
  void *v38;
  uint64_t v39;
  __int128 *v40;
  void *v41;
  __int128 *v42;
  void *v43;
  NSObject *v44;
  _BOOL4 v45;
  NSObject *v46;
  objc_class *v47;
  void *v48;
  __int128 *v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  int v55;
  void *v56;
  NSObject *v57;
  _BOOL4 v58;
  NSObject *v59;
  objc_class *v60;
  void *v61;
  int v62;
  __int128 *v63;
  void *v64;
  uint64_t v65;
  id v66;
  void *v67;
  id v69;
  _QWORD v70[5];
  id v71;
  __int128 *v72;
  __int128 *v73;
  uint64_t *v74;
  id v75;
  id obj;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  void *v82;
  __int16 v83;
  uint64_t v84;
  __int128 v85;
  uint64_t v86;
  int v87;
  __int128 v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
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
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v77 = 0;
  v78 = &v77;
  v79 = 0x2020000000;
  v80 = 1;
  if (a5 || !MEMORY[0x19AEC04BC]())
  {
    *(_QWORD *)&v88 = 0;
    *((_QWORD *)&v88 + 1) = &v88;
    v89 = 0x3032000000;
    v90 = __Block_byref_object_copy__21263;
    v91 = __Block_byref_object_dispose__21264;
    v92 = 0;
    v17 = (void *)MEMORY[0x1E0C97B48];
    +[PLLibraryScope entityName](PLLibraryScope, "entityName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fetchRequestWithEntityName:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    +[PLLibraryScope predicateForActiveLibraryScope](PLLibraryScope, "predicateForActiveLibraryScope");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPredicate:", v20);

    objc_msgSend(v19, "setFetchBatchSize:", 1);
    v21 = (id *)(*((_QWORD *)&v88 + 1) + 40);
    obj = *(id *)(*((_QWORD *)&v88 + 1) + 40);
    objc_msgSend(v7, "executeFetchRequest:error:", v19, &obj);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v21, obj);
    if (!objc_msgSend(v22, "count"))
    {
      -[PLModelMigrationActionCore logger](self, "logger");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (v43)
      {
        PLMigrationGetLog();
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);

        if (v45)
        {
          v123 = 0u;
          v124 = 0u;
          v121 = 0u;
          v122 = 0u;
          v119 = 0u;
          v120 = 0u;
          v117 = 0u;
          v118 = 0u;
          v115 = 0u;
          v116 = 0u;
          v113 = 0u;
          v114 = 0u;
          v111 = 0u;
          v112 = 0u;
          v109 = 0u;
          v110 = 0u;
          v107 = 0u;
          v108 = 0u;
          v105 = 0u;
          v106 = 0u;
          v103 = 0u;
          v104 = 0u;
          v101 = 0u;
          v102 = 0u;
          v99 = 0u;
          v100 = 0u;
          v97 = 0u;
          v98 = 0u;
          v95 = 0u;
          v96 = 0u;
          v93 = 0u;
          v94 = 0u;
          PLMigrationGetLog();
          v46 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
          v47 = (objc_class *)objc_opt_class();
          NSStringFromClass(v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v85) = 138543362;
          *(_QWORD *)((char *)&v85 + 4) = v48;
          LODWORD(v65) = 12;
          v49 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v85, v65);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "logWithMessage:fromCodeLocation:type:", v49, "PLModelMigrationActions_16000.m", 962, 0);

          if (v49 != &v93)
            free(v49);
        }
      }
      v16 = v78[3];
      goto LABEL_30;
    }
    objc_msgSend(v22, "firstObject");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAsset fetchRequest](PLManagedAsset, "fetchRequest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != 0"), CFSTR("libraryScopeShareState"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPredicate:", v24);

    objc_msgSend(v23, "setFetchBatchSize:", 100);
    v25 = (id *)(*((_QWORD *)&v88 + 1) + 40);
    v75 = *(id *)(*((_QWORD *)&v88 + 1) + 40);
    objc_msgSend(v7, "executeFetchRequest:error:", v23, &v75);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v25, v75);
    if (!objc_msgSend(v26, "count"))
    {
      if (!v26)
        v78[3] = 3;
      goto LABEL_26;
    }
    -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v26, "count"), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v85 = 0;
    *((_QWORD *)&v85 + 1) = &v85;
    v86 = 0x2020000000;
    v87 = 0;
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __129__PLModelMigrationAction_MigrateSuggestedByClientTypeCameraSmartSharing_performActionWithManagedObjectContext_error_shouldForce___block_invoke;
    v70[3] = &unk_1E3666398;
    v72 = &v85;
    v70[4] = self;
    v73 = &v88;
    v74 = &v77;
    v66 = v27;
    v71 = v66;
    objc_msgSend(v7, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v26, v70);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (id)v28;
    v30 = v78[3];
    if (v30 == 2)
      goto LABEL_13;
    if (v28)
      goto LABEL_12;
    if (*(int *)(*((_QWORD *)&v85 + 1) + 24) < 1)
    {
      v29 = 0;
    }
    else
    {
      objc_msgSend(v67, "setCountOfAssetsAddedByCameraSmartSharing:");
      v69 = 0;
      v55 = objc_msgSend(v7, "save:", &v69);
      v29 = v69;
      if (!v55)
      {
LABEL_12:
        v31 = *((_QWORD *)&v88 + 1);
        v29 = v29;
        v32 = *(void **)(v31 + 40);
        *(_QWORD *)(v31 + 40) = v29;

        v78[3] = 3;
        goto LABEL_13;
      }
      v30 = v78[3];
    }
    if (v30 == 1)
    {
      -[PLModelMigrationActionCore logger](self, "logger");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v56)
        goto LABEL_18;
      PLMigrationGetLog();
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);

      if (!v58)
        goto LABEL_18;
      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      v119 = 0u;
      v120 = 0u;
      v117 = 0u;
      v118 = 0u;
      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
      PLMigrationGetLog();
      v59 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);
      v60 = (objc_class *)objc_opt_class();
      NSStringFromClass(v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = *(_DWORD *)(*((_QWORD *)&v85 + 1) + 24);
      v81 = 138543618;
      v82 = v61;
      v83 = 1026;
      LODWORD(v84) = v62;
      LODWORD(v65) = 18;
      v63 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionCore logger](self, "logger", &v81, v65);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "logWithMessage:fromCodeLocation:type:", v63, "PLModelMigrationActions_16000.m", 1006, 0);

      if (v63 == &v93)
        goto LABEL_18;
      v42 = v63;
      goto LABEL_17;
    }
LABEL_13:
    -[PLModelMigrationActionCore logger](self, "logger");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33)
      goto LABEL_18;
    PLMigrationGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);

    if (!v35)
      goto LABEL_18;
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    PLMigrationGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 40);
    v81 = 138543618;
    v82 = v38;
    v83 = 2114;
    v84 = v39;
    LODWORD(v65) = 22;
    v40 = (__int128 *)_os_log_send_and_compose_impl();

    -[PLModelMigrationActionCore logger](self, "logger", &v81, v65);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "logWithMessage:fromCodeLocation:type:", v40, "PLModelMigrationActions_16000.m", 1008, 16);

    if (v40 == &v93)
      goto LABEL_18;
    v42 = v40;
LABEL_17:
    free(v42);
LABEL_18:

    _Block_object_dispose(&v85, 8);
LABEL_26:
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    v51 = v78[3];
    v52 = *(id *)(*((_QWORD *)&v88 + 1) + 40);
    v53 = v52;
    if (v51 != 1 && a4)
      *a4 = objc_retainAutorelease(v52);

    v16 = v78[3];
LABEL_30:

    _Block_object_dispose(&v88, 8);
    goto LABEL_31;
  }
  -[PLModelMigrationActionCore logger](self, "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    PLMigrationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      v119 = 0u;
      v120 = 0u;
      v117 = 0u;
      v118 = 0u;
      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
      PLMigrationGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v88) = 138543362;
      *(_QWORD *)((char *)&v88 + 4) = v13;
      LODWORD(v65) = 12;
      v14 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionCore logger](self, "logger", &v88, v65);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logWithMessage:fromCodeLocation:type:", v14, "PLModelMigrationActions_16000.m", 947, 0);

      if (v14 != &v93)
        free(v14);
    }
  }
  v16 = v78[3];
LABEL_31:
  _Block_object_dispose(&v77, 8);

  return v16;
}

@end
