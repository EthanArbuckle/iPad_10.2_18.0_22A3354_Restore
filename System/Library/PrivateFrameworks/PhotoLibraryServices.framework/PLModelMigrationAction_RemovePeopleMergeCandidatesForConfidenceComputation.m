@implementation PLModelMigrationAction_RemovePeopleMergeCandidatesForConfidenceComputation

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  uint64_t v18;
  __int128 *v19;
  void *v20;
  __int128 *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  id v28;
  __int128 *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  int64_t v34;
  uint64_t v36;
  _QWORD v37[5];
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  id obj;
  uint64_t v47;
  id *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  void *v58;
  __int16 v59;
  id v60;
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
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 1;
  v47 = 0;
  v48 = (id *)&v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__21263;
  v51 = __Block_byref_object_dispose__21264;
  v52 = 0;
  +[PLPerson fetchRequest](PLPerson, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d || %K == %d"), CFSTR("verifiedType"), 1, CFSTR("verifiedType"), 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  v9 = v48 + 5;
  obj = v48[5];
  objc_msgSend(v6, "executeFetchRequest:error:", v7, &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v9, obj);
  if (objc_msgSend(v10, "count"))
  {
    -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v10, "count"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 0;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __122__PLModelMigrationAction_RemovePeopleMergeCandidatesForConfidenceComputation_performActionWithManagedObjectContext_error___block_invoke;
    v37[3] = &unk_1E36662F8;
    v39 = &v42;
    v37[4] = self;
    v40 = &v47;
    v41 = &v53;
    v12 = v11;
    v38 = v12;
    objc_msgSend(v6, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v10, v37);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && !v48[5])
    {
      objc_storeStrong(v48 + 5, v13);
      v54[3] = 3;
    }
    if (v54[3] == 1)
    {
      -[PLModelMigrationActionCore logger](self, "logger");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
        goto LABEL_17;
      PLMigrationGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

      if (!v16)
        goto LABEL_17;
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
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      PLMigrationGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      v18 = v43[3];
      v57 = 67109120;
      LODWORD(v58) = v18;
      LODWORD(v36) = 8;
      v19 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionCore logger](self, "logger", &v57, v36);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logWithMessage:fromCodeLocation:type:", v19, "PLModelMigrationActions_16000.m", 395, 0);

      if (v19 == &v61)
        goto LABEL_17;
      v21 = v19;
    }
    else
    {
      -[PLModelMigrationActionCore logger](self, "logger");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
        goto LABEL_17;
      PLMigrationGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

      if (!v24)
        goto LABEL_17;
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
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      PLMigrationGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v48[5];
      v57 = 138543618;
      v58 = v27;
      v59 = 2114;
      v60 = v28;
      LODWORD(v36) = 22;
      v29 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionCore logger](self, "logger", &v57, v36);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "logWithMessage:fromCodeLocation:type:", v29, "PLModelMigrationActions_16000.m", 397, 16);

      if (v29 == &v61)
        goto LABEL_17;
      v21 = v29;
    }
    free(v21);
LABEL_17:

    _Block_object_dispose(&v42, 8);
    goto LABEL_18;
  }
  if (v48[5])
    v54[3] = 3;
LABEL_18:
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v31 = v54[3];
  v32 = v48[5];
  v33 = v32;
  if (v31 != 1 && a4)
    *a4 = objc_retainAutorelease(v32);

  v34 = v54[3];
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  return v34;
}

@end
