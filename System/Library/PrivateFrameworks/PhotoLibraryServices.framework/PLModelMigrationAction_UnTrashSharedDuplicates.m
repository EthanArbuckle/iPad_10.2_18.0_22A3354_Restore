@implementation PLModelMigrationAction_UnTrashSharedDuplicates

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  __int128 *v30;
  void *v31;
  int64_t v32;
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
  id v49;
  __int128 *v50;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[5];
  id v64;
  __int128 *v65;
  uint64_t *v66;
  uint64_t *v67;
  id v68;
  id obj;
  uint64_t v70;
  id *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  void *v81;
  __int16 v82;
  id v83;
  __int128 v84;
  uint64_t v85;
  uint64_t v86;
  const __CFString *v87;
  _QWORD v88[2];
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
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v76 = 0;
  v77 = &v76;
  v78 = 0x2020000000;
  v79 = 1;
  v70 = 0;
  v71 = (id *)&v70;
  v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__21263;
  v74 = __Block_byref_object_dispose__21264;
  v75 = 0;
  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLLibraryScope entityName](PLLibraryScope, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLLibraryScope predicateForActiveLibraryScope](PLLibraryScope, "predicateForActiveLibraryScope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  objc_msgSend(v8, "setFetchBatchSize:", 1);
  v10 = v71 + 5;
  obj = v71[5];
  objc_msgSend(v5, "executeFetchRequest:error:", v8, &obj);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v10, obj);
  if (objc_msgSend(v62, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("trashedState"), 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("master"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C97B48];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchRequestWithEntityName:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB3528];
    v88[0] = v61;
    v88[1] = v60;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "andPredicateWithSubpredicates:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPredicate:", v16);

    v87 = CFSTR("master");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRelationshipKeyPathsForPrefetching:", v17);

    objc_msgSend(v13, "setFetchBatchSize:", 100);
    v18 = v71 + 5;
    v68 = v71[5];
    objc_msgSend(v5, "executeFetchRequest:error:", v13, &v68);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v18, v68);
    *(_QWORD *)&v84 = 0;
    *((_QWORD *)&v84 + 1) = &v84;
    v85 = 0x2020000000;
    v86 = 0;
    if (!objc_msgSend(v19, "count"))
    {
      if (!v19)
        v77[3] = 3;
      goto LABEL_24;
    }
    -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v19, "count"), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __94__PLModelMigrationAction_UnTrashSharedDuplicates_performActionWithManagedObjectContext_error___block_invoke;
    v63[3] = &unk_1E3666398;
    v65 = &v84;
    v63[4] = self;
    v66 = &v70;
    v67 = &v76;
    v58 = v20;
    v64 = v58;
    objc_msgSend(v5, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v19, v63);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = v77[3];
    if (v23 == 2 || !v21)
    {
      if (v23 == 1)
      {
        -[PLModelMigrationActionCore logger](self, "logger");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v33)
          goto LABEL_23;
        PLMigrationGetLog();
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);

        if (!v35)
          goto LABEL_23;
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
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        PLMigrationGetLog();
        v36 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 24);
        v80 = 138543618;
        v81 = v38;
        v82 = 1026;
        LODWORD(v83) = v39;
        LODWORD(v57) = 18;
        v40 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v80, v57);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "logWithMessage:fromCodeLocation:type:", v40, "PLModelMigrationActions_16000.m", 1169, 0);

        if (v40 == &v89)
          goto LABEL_23;
        v42 = v40;
        goto LABEL_22;
      }
    }
    else
    {
      objc_storeStrong(v71 + 5, v21);
      v77[3] = 3;
    }
    -[PLModelMigrationActionCore logger](self, "logger");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v43)
      goto LABEL_23;
    PLMigrationGetLog();
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);

    if (!v45)
      goto LABEL_23;
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
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    PLMigrationGetLog();
    v46 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
    v47 = (objc_class *)objc_opt_class();
    NSStringFromClass(v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v71[5];
    v80 = 138543618;
    v81 = v48;
    v82 = 2114;
    v83 = v49;
    LODWORD(v57) = 22;
    v50 = (__int128 *)_os_log_send_and_compose_impl();

    -[PLModelMigrationActionCore logger](self, "logger", &v80, v57);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "logWithMessage:fromCodeLocation:type:", v50, "PLModelMigrationActions_16000.m", 1171, 16);

    if (v50 == &v89)
      goto LABEL_23;
    v42 = v50;
LABEL_22:
    free(v42);
LABEL_23:

LABEL_24:
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    v52 = v77[3];
    v53 = v71[5];
    v54 = v53;
    if (v52 != 1 && a4)
      *a4 = objc_retainAutorelease(v53);

    v32 = v77[3];
    _Block_object_dispose(&v84, 8);

    goto LABEL_28;
  }
  -[PLModelMigrationActionCore logger](self, "logger");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    PLMigrationGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

    if (v26)
    {
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
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      PLMigrationGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v84) = 138543362;
      *(_QWORD *)((char *)&v84 + 4) = v29;
      LODWORD(v56) = 12;
      v30 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionCore logger](self, "logger", &v84, v56);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "logWithMessage:fromCodeLocation:type:", v30, "PLModelMigrationActions_16000.m", 1127, 0);

      if (v30 != &v89)
        free(v30);
    }
  }
  v32 = v77[3];
LABEL_28:

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v76, 8);

  return v32;
}

@end
