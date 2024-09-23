@implementation PLModelMigrationAction_DeleteOrphanedFaces

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  __int128 *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  int64_t v31;
  void *v33;
  NSObject *v34;
  _BOOL4 v35;
  NSObject *v36;
  uint64_t v37;
  __int128 *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  _BOOL4 v42;
  NSObject *v43;
  objc_class *v44;
  void *v45;
  __int128 *v46;
  void *v47;
  id *v48;
  id v49;
  id v50;
  uint64_t v51;
  id v52;
  _QWORD v54[5];
  id v55;
  id v56;
  uint64_t *v57;
  uint64_t *v58;
  id v59;
  uint64_t v60;
  id *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  __int16 v72;
  id v73;
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
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _QWORD v106[5];

  v106[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[PLDetectedFace fetchRequest](PLDetectedFace, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("assetForFace"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v106[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("faceCrop"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v106[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v10);

  if (-[PLModelMigrationActionCore startingSchemaVersion](self, "startingSchemaVersion") >= 0x427D)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("assetForTemporalDetectedFaces"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v11);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v12);

  objc_msgSend(v6, "setFetchBatchSize:", 100);
  v66 = 0;
  v67 = &v66;
  v68 = 0x2020000000;
  v69 = 1;
  v60 = 0;
  v61 = (id *)&v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__21263;
  v64 = __Block_byref_object_dispose__21264;
  v65 = 0;
  v59 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v6, &v59);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v59;
  if (objc_msgSend(v13, "count"))
  {
    -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v13, "count"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __90__PLModelMigrationAction_DeleteOrphanedFaces_performActionWithManagedObjectContext_error___block_invoke;
    v54[3] = &unk_1E3666370;
    v54[4] = self;
    v57 = &v60;
    v58 = &v66;
    v55 = v5;
    v15 = v14;
    v56 = v15;
    objc_msgSend(v55, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v13, v54);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v67[3] = 3;
      -[PLModelMigrationActionCore logger](self, "logger");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        PLMigrationGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

        if (v19)
        {
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
          v74 = 0u;
          v75 = 0u;
          PLMigrationGetLog();
          v20 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = 138543618;
          v71 = (uint64_t)v22;
          v72 = 2114;
          v73 = v16;
          LODWORD(v51) = 22;
          v23 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v70, v51);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "logWithMessage:fromCodeLocation:type:", v23, "PLModelMigrationActions_16000.m", 782, 16);

          if (v23 != &v74)
            free(v23);
        }
      }
      if (v61[5])
        v25 = v61[5];
      else
        v25 = v16;
      objc_storeStrong(v61 + 5, v25);
    }
    else
    {
      -[PLModelMigrationActionCore logger](self, "logger");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        PLMigrationGetLog();
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);

        if (v35)
        {
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
          v74 = 0u;
          v75 = 0u;
          PLMigrationGetLog();
          v36 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
          v37 = objc_msgSend(v13, "count");
          v70 = 134217984;
          v71 = v37;
          LODWORD(v51) = 12;
          v38 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v70, v51);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "logWithMessage:fromCodeLocation:type:", v38, "PLModelMigrationActions_16000.m", 779, 0);

          if (v38 != &v74)
            free(v38);
        }
      }
    }

  }
  else
  {
    if (v13)
      goto LABEL_16;
    v67[3] = 3;
    -[PLModelMigrationActionCore logger](self, "logger");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      PLMigrationGetLog();
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);

      if (v42)
      {
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
        v74 = 0u;
        v75 = 0u;
        PLMigrationGetLog();
        v43 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
        v44 = (objc_class *)objc_opt_class();
        NSStringFromClass(v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = 138543618;
        v71 = (uint64_t)v45;
        v72 = 2114;
        v73 = v52;
        LODWORD(v51) = 22;
        v46 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v70, v51);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "logWithMessage:fromCodeLocation:type:", v46, "PLModelMigrationActions_16000.m", 787, 16);

        if (v46 != &v74)
          free(v46);
      }
    }
    v48 = v61;
    v49 = v61[5];
    if (!v49)
      v49 = v52;
    v50 = v49;
    v15 = v48[5];
    v48[5] = v50;
  }

LABEL_16:
  +[PLManagedLegacyFace entityName](PLManagedLegacyFace, "entityName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("asset == nil"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLModelMigrator executeBatchDeleteWithEntityName:predicate:managedObjectContext:error:](PLModelMigrator, "executeBatchDeleteWithEntityName:predicate:managedObjectContext:error:", v26, v27, v5, 0);

  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v28 = v67[3];
  v29 = v61[5];
  v30 = v29;
  if (v28 != 1 && a4)
    *a4 = objc_retainAutorelease(v29);

  v31 = v67[3];
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(&v66, 8);
  return v31;
}

@end
