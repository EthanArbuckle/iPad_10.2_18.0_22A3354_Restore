@implementation PLModelMigrationAction_FixUnpushedVideoComplementResourcesAfterFDR

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  __int128 *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  int64_t v30;
  void *v32;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v35;
  void *v36;
  __int128 *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  _BOOL4 v41;
  NSObject *v42;
  objc_class *v43;
  void *v44;
  __int128 *v45;
  void *v46;
  id *v47;
  id v48;
  id v49;
  uint64_t v50;
  _QWORD v52[5];
  id v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t *v56;
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  void *v73;
  __int16 v74;
  id v75;
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
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[6];

  v108[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[PLManagedAsset fetchRequest](PLManagedAsset, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kind"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v108[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kindSubtype"), 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v108[1] = v9;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("master"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v108[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v12);

  objc_msgSend(v6, "setFetchBatchSize:", 100);
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 1;
  v62 = 0;
  v63 = (id *)&v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__21263;
  v66 = __Block_byref_object_dispose__21264;
  v67 = 0;
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  v57 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v6, &v57);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v57;
  if (objc_msgSend(v13, "count"))
  {
    -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v13, "count"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __114__PLModelMigrationAction_FixUnpushedVideoComplementResourcesAfterFDR_performActionWithManagedObjectContext_error___block_invoke;
    v52[3] = &unk_1E3666398;
    v54 = &v58;
    v52[4] = self;
    v55 = &v62;
    v56 = &v68;
    v16 = v15;
    v53 = v16;
    objc_msgSend(v5, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v13, v52);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v69[3] = 3;
      -[PLModelMigrationActionCore logger](self, "logger");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        PLMigrationGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

        if (v20)
        {
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
          v76 = 0u;
          v77 = 0u;
          PLMigrationGetLog();
          v21 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = 138543618;
          v73 = v23;
          v74 = 2114;
          v75 = v17;
          LODWORD(v50) = 22;
          v24 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v72, v50);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_16000.m", 898, 16);

          if (v24 != &v76)
            free(v24);
        }
      }
      if (v63[5])
        v26 = v63[5];
      else
        v26 = v17;
      objc_storeStrong(v63 + 5, v26);
    }
    else
    {
      -[PLModelMigrationActionCore logger](self, "logger");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        PLMigrationGetLog();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

        if (v34)
        {
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
          v76 = 0u;
          v77 = 0u;
          PLMigrationGetLog();
          v35 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
          v36 = (void *)v59[3];
          v72 = 134217984;
          v73 = v36;
          LODWORD(v50) = 12;
          v37 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v72, v50);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "logWithMessage:fromCodeLocation:type:", v37, "PLModelMigrationActions_16000.m", 895, 0);

          if (v37 != &v76)
            free(v37);
        }
      }
    }

  }
  else
  {
    if (v13)
      goto LABEL_14;
    v69[3] = 3;
    -[PLModelMigrationActionCore logger](self, "logger");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      PLMigrationGetLog();
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);

      if (v41)
      {
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
        v76 = 0u;
        v77 = 0u;
        PLMigrationGetLog();
        v42 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
        v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = 138543618;
        v73 = v44;
        v74 = 2114;
        v75 = v14;
        LODWORD(v50) = 22;
        v45 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v72, v50);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "logWithMessage:fromCodeLocation:type:", v45, "PLModelMigrationActions_16000.m", 903, 16);

        if (v45 != &v76)
          free(v45);
      }
    }
    v47 = v63;
    v48 = v63[5];
    if (!v48)
      v48 = v14;
    v49 = v48;
    v16 = v47[5];
    v47[5] = v49;
  }

LABEL_14:
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v27 = v69[3];
  v28 = v63[5];
  v29 = v28;
  if (v27 != 1 && a4)
    *a4 = objc_retainAutorelease(v28);

  v30 = v69[3];
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);
  return v30;
}

@end
