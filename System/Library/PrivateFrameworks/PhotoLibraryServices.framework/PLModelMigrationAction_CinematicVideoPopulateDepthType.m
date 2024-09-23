@implementation PLModelMigrationAction_CinematicVideoPopulateDepthType

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  uint64_t v14;
  __int128 *v15;
  void *v16;
  id v17;
  void *v18;
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
  id v32;
  __int128 *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  int64_t v42;
  uint64_t v44;
  _QWORD v46[5];
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  id obj;
  uint64_t v51;
  id *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  __int16 v63;
  void *v64;
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
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 1;
  v51 = 0;
  v52 = (id *)&v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__1109;
  v55 = __Block_byref_object_dispose__1110;
  v56 = 0;
  -[PLModelMigrationAction_CinematicVideoPopulateDepthType buildFetchRequest](self, "buildFetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v52 + 5;
  obj = v52[5];
  objc_msgSend(v5, "executeFetchRequest:error:", v6, &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v7, obj);
  if (v8)
  {
    -[PLModelMigrationActionBackground cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v8, "count"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLModelMigrationActionBackground logger](self, "logger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      PLMigrationGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);

      if (v12)
      {
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
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        PLMigrationGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
        v14 = objc_msgSend(v8, "count");
        v61 = 134217984;
        v62 = v14;
        LODWORD(v44) = 12;
        v15 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionBackground logger](self, "logger", &v61, v44);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logWithMessage:fromCodeLocation:type:", v15, "PLModelMigrationActionBackground.m", 294, 1);

        if (v15 != &v65)
          free(v15);
      }
    }
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __102__PLModelMigrationAction_CinematicVideoPopulateDepthType_performActionWithManagedObjectContext_error___block_invoke;
    v46[3] = &unk_1E366AC60;
    v48 = &v57;
    v46[4] = self;
    v49 = &v51;
    v17 = v9;
    v47 = v17;
    objc_msgSend(v5, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v8, v46);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 && !v52[5])
    {
      objc_storeStrong(v52 + 5, v18);
      v58[3] = 3;
      -[PLModelMigrationActionBackground logger](self, "logger");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        PLMigrationGetLog();
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);

        if (v37)
        {
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
          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          PLMigrationGetLog();
          v38 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
          v39 = (objc_class *)objc_opt_class();
          NSStringFromClass(v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = 138543618;
          v62 = (uint64_t)v40;
          v63 = 2112;
          v64 = v18;
          LODWORD(v44) = 22;
          v24 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionBackground logger](self, "logger", &v61, v44);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActionBackground.m", 323, 16);

LABEL_18:
          if (v24 != &v65)
            free(v24);
        }
      }
    }
    else
    {
      -[PLModelMigrationActionBackground logger](self, "logger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        PLMigrationGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);

        if (v21)
        {
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
          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          PLMigrationGetLog();
          v22 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
          v23 = objc_msgSend(v17, "completedUnitCount");
          v61 = 134217984;
          v62 = v23;
          LODWORD(v44) = 12;
          v24 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionBackground logger](self, "logger", &v61, v44);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActionBackground.m", 325, 1);

          goto LABEL_18;
        }
      }
    }

    goto LABEL_21;
  }
  v58[3] = 3;
  -[PLModelMigrationActionBackground logger](self, "logger");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    PLMigrationGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

    if (v28)
    {
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
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      PLMigrationGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v52[5];
      v61 = 138543618;
      v62 = (uint64_t)v31;
      v63 = 2112;
      v64 = v32;
      LODWORD(v44) = 22;
      v33 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionBackground logger](self, "logger", &v61, v44);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "logWithMessage:fromCodeLocation:type:", v33, "PLModelMigrationActionBackground.m", 329, 16);

      if (v33 != &v65)
        free(v33);
    }
  }
LABEL_21:
  if (v58[3] == 1)
    -[PLModelMigrationActionBackground setResumeMarkerValue:](self, "setResumeMarkerValue:", 0);
  -[PLModelMigrationActionBackground finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease(v52[5]);
  v42 = v58[3];

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);

  return v42;
}

- (id)buildFetchRequest
{
  void *v2;
  void *v3;
  void *v4;
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
  _QWORD v16[2];
  void *v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  -[PLModelMigrationActionBackground resumeMarker](self, "resumeMarker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("kind"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("depthType"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v8;
  if (v2)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("addedDate"), v2);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v11);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v13);

  objc_msgSend(v5, "setFetchBatchSize:", 100);
  v16[0] = CFSTR("master.mediaMetadata");
  v16[1] = CFSTR("modernResources");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRelationshipKeyPathsForPrefetching:", v14);

  return v5;
}

+ (int64_t)actionProgressWeight
{
  return 400;
}

@end
