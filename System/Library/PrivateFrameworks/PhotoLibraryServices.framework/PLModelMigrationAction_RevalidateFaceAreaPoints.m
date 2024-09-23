@implementation PLModelMigrationAction_RevalidateFaceAreaPoints

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  uint64_t v23;
  __int128 *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  NSObject *v31;
  uint64_t v32;
  __int128 *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  id v41;
  __int128 *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  _BOOL4 v46;
  NSObject *v47;
  objc_class *v48;
  void *v49;
  void *v50;
  int64_t v51;
  uint64_t v53;
  id v55;
  _QWORD v56[5];
  id v57;
  uint64_t *v58;
  uint64_t *v59;
  id obj;
  uint64_t v61;
  id *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  __int16 v73;
  void *v74;
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
  __int128 v106;
  const __CFString *v107;
  void *v108;
  _QWORD v109[5];

  v109[2] = *MEMORY[0x1E0C80C00];
  v55 = a3;
  -[PLModelMigrationActionBackground resumeMarker](self, "resumeMarker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.@count > 0"), CFSTR("detectedFaces"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v109[0] = v10;
  if (v5)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("addedDate"), v5);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v109[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v13);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v108, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v15);

  v107 = CFSTR("detectedFaces");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRelationshipKeyPathsForPrefetching:", v16);

  objc_msgSend(v8, "setFetchBatchSize:", 100);
  v67 = 0;
  v68 = &v67;
  v69 = 0x2020000000;
  v70 = 1;
  v61 = 0;
  v62 = (id *)&v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__1109;
  v65 = __Block_byref_object_dispose__1110;
  v66 = 0;
  obj = 0;
  objc_msgSend(v55, "executeFetchRequest:error:", v8, &obj);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v66, obj);
  if (v17)
  {
    -[PLModelMigrationActionBackground cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v17, "count"), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLModelMigrationActionBackground logger](self, "logger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      PLMigrationGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);

      if (v21)
      {
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
        PLMigrationGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
        v23 = objc_msgSend(v17, "count");
        v71 = 134217984;
        v72 = v23;
        LODWORD(v53) = 12;
        v24 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionBackground logger](self, "logger", &v71, v53);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActionBackground.m", 207, 1);

        if (v24 != &v75)
          free(v24);
      }
    }
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __95__PLModelMigrationAction_RevalidateFaceAreaPoints_performActionWithManagedObjectContext_error___block_invoke;
    v56[3] = &unk_1E366AC60;
    v56[4] = self;
    v58 = &v67;
    v59 = &v61;
    v26 = v18;
    v57 = v26;
    objc_msgSend(v55, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v17, v56);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27 && !v62[5])
    {
      objc_storeStrong(v62 + 5, v27);
      v68[3] = 3;
      -[PLModelMigrationActionBackground logger](self, "logger");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        PLMigrationGetLog();
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);

        if (v46)
        {
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
          PLMigrationGetLog();
          v47 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
          v48 = (objc_class *)objc_opt_class();
          NSStringFromClass(v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = 138543618;
          v72 = (uint64_t)v49;
          v73 = 2112;
          v74 = v27;
          LODWORD(v53) = 22;
          v33 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionBackground logger](self, "logger", &v71, v53);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "logWithMessage:fromCodeLocation:type:", v33, "PLModelMigrationActionBackground.m", 230, 16);

LABEL_21:
          if (v33 != &v75)
            free(v33);
        }
      }
    }
    else
    {
      -[PLModelMigrationActionBackground logger](self, "logger");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        PLMigrationGetLog();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);

        if (v30)
        {
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
          PLMigrationGetLog();
          v31 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
          v32 = objc_msgSend(v26, "completedUnitCount");
          v71 = 134217984;
          v72 = v32;
          LODWORD(v53) = 12;
          v33 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionBackground logger](self, "logger", &v71, v53);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "logWithMessage:fromCodeLocation:type:", v33, "PLModelMigrationActionBackground.m", 232, 1);

          goto LABEL_21;
        }
      }
    }

    goto LABEL_24;
  }
  v68[3] = 3;
  -[PLModelMigrationActionBackground logger](self, "logger");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    PLMigrationGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);

    if (v37)
    {
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
      PLMigrationGetLog();
      v38 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v62[5];
      v71 = 138543618;
      v72 = (uint64_t)v40;
      v73 = 2112;
      v74 = v41;
      LODWORD(v53) = 22;
      v42 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionBackground logger](self, "logger", &v71, v53);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "logWithMessage:fromCodeLocation:type:", v42, "PLModelMigrationActionBackground.m", 236, 16);

      if (v42 != &v75)
        free(v42);
    }
  }
LABEL_24:
  if (v68[3] == 1)
    -[PLModelMigrationActionBackground setResumeMarkerValue:](self, "setResumeMarkerValue:", 0);
  -[PLModelMigrationActionBackground finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease(v62[5]);
  v51 = v68[3];

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v67, 8);

  return v51;
}

+ (int64_t)actionProgressWeight
{
  return 500;
}

@end
