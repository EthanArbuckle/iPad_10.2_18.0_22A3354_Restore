@implementation PLModelMigrationAction_FixPackedBadgeAttributesForRAWPlusJPEG

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
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
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id *v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  __int128 *v32;
  void *v33;
  int64_t v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  _BOOL4 v38;
  NSObject *v39;
  objc_class *v40;
  void *v41;
  __int128 *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  _BOOL4 v47;
  NSObject *v48;
  objc_class *v49;
  void *v50;
  uint64_t v51;
  __int128 *v52;
  void *v53;
  uint64_t v55;
  id *v56;
  void *v57;
  void *v58;
  _QWORD v59[4];
  id v60;
  id v61;
  int v62;
  void *v63;
  __int16 v64;
  uint64_t v65;
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
  __int128 v97;
  _QWORD v98[2];
  _QWORD v99[5];

  v99[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("utiConformanceHint"), 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v99[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("dataStoreClassID"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v99[1] = v12;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("dataStoreSubtype"), 17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v99[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v15);

  v98[0] = CFSTR("asset");
  v98[1] = CFSTR("asset.additionalAttributes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v16);

  v61 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v9, &v61);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v61;
  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v17, "count"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v17)
  {
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __109__PLModelMigrationAction_FixPackedBadgeAttributesForRAWPlusJPEG_performActionWithManagedObjectContext_error___block_invoke;
    v59[3] = &unk_1E366AC38;
    v21 = v19;
    v60 = v21;
    objc_msgSend(v6, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v17, v59);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (!v22 || v18)
    {
      v56 = a4;
      -[PLModelMigrationActionCore logger](self, "logger");
      v44 = objc_claimAutoreleasedReturnValue();
      if (!v44)
      {
        v34 = 1;
        goto LABEL_25;
      }
      v45 = (void *)v44;
      v57 = v20;
      PLMigrationGetLog();
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);

      if (v47)
      {
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
        v66 = 0u;
        v67 = 0u;
        PLMigrationGetLog();
        v48 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
        v49 = (objc_class *)objc_opt_class();
        NSStringFromClass(v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v21, "completedUnitCount");
        v62 = 138543618;
        v63 = v50;
        v64 = 2048;
        v65 = v51;
        LODWORD(v55) = 22;
        v52 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v62, v55);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "logWithMessage:fromCodeLocation:type:", v52, "PLModelMigrationActions_15000.m", 813, 0);

        if (v52 != &v66)
          free(v52);
      }
      v34 = 1;
      a4 = v56;
    }
    else
    {
      v18 = v22;
      -[PLModelMigrationActionCore logger](self, "logger");
      v24 = objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        v34 = 3;
        goto LABEL_25;
      }
      v25 = (void *)v24;
      v57 = v20;
      v26 = a4;
      PLMigrationGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

      if (v28)
      {
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
        v66 = 0u;
        v67 = 0u;
        PLMigrationGetLog();
        v29 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = 138543618;
        v63 = v31;
        v64 = 2114;
        v65 = (uint64_t)v18;
        LODWORD(v55) = 22;
        v32 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v62, v55);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "logWithMessage:fromCodeLocation:type:", v32, "PLModelMigrationActions_15000.m", 811, 16);

        if (v32 != &v66)
          free(v32);
      }
      v34 = 3;
      a4 = v26;
    }
    v20 = v57;
LABEL_25:

    goto LABEL_26;
  }
  -[PLModelMigrationActionCore logger](self, "logger");
  v35 = objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v36 = (void *)v35;
    v58 = v20;
    PLMigrationGetLog();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);

    if (v38)
    {
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
      v66 = 0u;
      v67 = 0u;
      PLMigrationGetLog();
      v39 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 138543618;
      v63 = v41;
      v64 = 2114;
      v65 = (uint64_t)v18;
      LODWORD(v55) = 22;
      v42 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionCore logger](self, "logger", &v62, v55);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "logWithMessage:fromCodeLocation:type:", v42, "PLModelMigrationActions_15000.m", 817, 16);

      if (v42 != &v66)
        free(v42);
      v34 = 3;
    }
    else
    {
      v34 = 3;
    }
    v20 = v58;
  }
  else
  {
    v34 = 3;
  }
LABEL_26:
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease(v18);

  return v34;
}

@end
