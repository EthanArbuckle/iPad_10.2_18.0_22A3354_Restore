@implementation PLModelMigrationAction_updateACVideos

- (id)buildFetchRequest
{
  void *v3;
  id v4;
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
  void *v20;
  _QWORD v21[2];
  void *v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v4, "setYear:", 2022);
  objc_msgSend(v4, "setMonth:", 8);
  objc_msgSend(v4, "setDay:", 1);
  v20 = v3;
  objc_msgSend(v3, "dateFromComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionBackground resumeMarker](self, "resumeMarker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("kind"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("kindSubtype"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v12;
  if (v6)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("addedDate"), v6);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("addedDate"), v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v15);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSortDescriptors:", v17);

  objc_msgSend(v9, "setFetchBatchSize:", 100);
  v21[0] = CFSTR("master.mediaMetadata");
  v21[1] = CFSTR("modernResources");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v18);

  return v9;
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  uint64_t v17;
  __int128 *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  uint64_t v26;
  __int128 *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  int64_t v40;
  uint64_t v42;
  _QWORD v44[5];
  id v45;
  uint64_t *v46;
  uint64_t *v47;
  id obj;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
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
  __int128 v93;
  __int128 v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 1;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__1109;
  v53 = __Block_byref_object_dispose__1110;
  v54 = 0;
  -[PLModelMigrationAction_updateACVideos buildFetchRequest](self, "buildFetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id *)(v50 + 5);
  obj = (id)v50[5];
  objc_msgSend(v5, "executeFetchRequest:error:", v6, &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v7, obj);
  if (v8)
  {
    -[PLModelMigrationActionBackground cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v8, "count"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __85__PLModelMigrationAction_updateACVideos_performActionWithManagedObjectContext_error___block_invoke;
    v44[3] = &unk_1E366AC60;
    v46 = &v55;
    v44[4] = self;
    v47 = &v49;
    v10 = v9;
    v45 = v10;
    objc_msgSend(v5, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v8, v44);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (v12 = (id *)(v50 + 5), !v50[5]))
    {
      v56[3] = 3;
      objc_storeStrong(v12, v11);
      -[PLModelMigrationActionBackground logger](self, "logger");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        PLMigrationGetLog();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);

        if (v31)
        {
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
          v63 = 0u;
          v64 = 0u;
          PLMigrationGetLog();
          v32 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
          v33 = (objc_class *)objc_opt_class();
          NSStringFromClass(v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v50[5];
          v59 = 138543618;
          v60 = (uint64_t)v34;
          v61 = 2112;
          v62 = v35;
          LODWORD(v42) = 22;
          v18 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionBackground logger](self, "logger", &v59, v42);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "logWithMessage:fromCodeLocation:type:", v18, "PLModelMigrationActionBackground.m", 425, 16);

LABEL_14:
          if (v18 != &v63)
            free(v18);
        }
      }
    }
    else
    {
      -[PLModelMigrationActionBackground logger](self, "logger");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        PLMigrationGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);

        if (v15)
        {
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
          v63 = 0u;
          v64 = 0u;
          PLMigrationGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
          v17 = objc_msgSend(v10, "completedUnitCount");
          v59 = 134217984;
          v60 = v17;
          LODWORD(v42) = 12;
          v18 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionBackground logger](self, "logger", &v59, v42);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "logWithMessage:fromCodeLocation:type:", v18, "PLModelMigrationActionBackground.m", 427, 1);

          goto LABEL_14;
        }
      }
    }

    goto LABEL_17;
  }
  v56[3] = 3;
  -[PLModelMigrationActionBackground logger](self, "logger");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    PLMigrationGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

    if (v22)
    {
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
      v63 = 0u;
      v64 = 0u;
      PLMigrationGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v50[5];
      v59 = 138543618;
      v60 = (uint64_t)v25;
      v61 = 2112;
      v62 = v26;
      LODWORD(v42) = 22;
      v27 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionBackground logger](self, "logger", &v59, v42);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "logWithMessage:fromCodeLocation:type:", v27, "PLModelMigrationActionBackground.m", 431, 16);

      if (v27 != &v63)
        free(v27);
    }
  }
LABEL_17:
  if (v56[3] == 1)
    -[PLModelMigrationActionBackground setResumeMarkerValue:](self, "setResumeMarkerValue:", 0);
  -[PLModelMigrationActionBackground finalizeProgress](self, "finalizeProgress");
  v37 = v56[3];
  v38 = (id)v50[5];
  v39 = v38;
  if (v37 != 1 && a4)
    *a4 = objc_retainAutorelease(v38);

  v40 = v56[3];
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
  return v40;
}

+ (int64_t)actionProgressWeight
{
  return 400;
}

@end
