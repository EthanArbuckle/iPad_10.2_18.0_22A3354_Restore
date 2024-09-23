@implementation PLModelMigrationAction_ResetGraphPersons

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  __int128 *v22;
  void *v23;
  int64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  __int128 *v31;
  void *v32;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v35;
  __int128 *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v41;
  id v42;
  id *v43;
  id *v44;
  _QWORD v45[5];
  id v46;
  id v47;
  int v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
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
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLPerson entityName](PLPerson, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFetchBatchSize:", 100);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("verifiedType"), 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  v47 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v9, &v47);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v47;
  if (v11)
  {
    v13 = objc_msgSend(v11, "count");
    -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __88__PLModelMigrationAction_ResetGraphPersons_performActionWithManagedObjectContext_error___block_invoke;
    v45[3] = &unk_1E366ACD8;
    v45[4] = self;
    v15 = v14;
    v46 = v15;
    objc_msgSend(v6, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v11, v45);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLModelMigrationActionCore logger](self, "logger");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v16)
    {
      if (!v17)
      {
        v24 = 3;
        goto LABEL_22;
      }
      v43 = a4;
      PLMigrationGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (v20)
      {
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
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        PLMigrationGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
        v48 = 138412290;
        v49 = (uint64_t)v16;
        LODWORD(v41) = 12;
        v22 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v48, v41);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "logWithMessage:fromCodeLocation:type:", v22, "PLModelMigrationActions_15000.m", 853, 16);

        if (v22 != &v50)
          free(v22);
      }
      v24 = 3;
    }
    else
    {
      if (!v17)
      {
        v24 = 1;
        goto LABEL_22;
      }
      v42 = v6;
      v43 = a4;
      PLMigrationGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

      if (v34)
      {
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
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        PLMigrationGetLog();
        v35 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
        v48 = 134217984;
        v49 = v13;
        LODWORD(v41) = 12;
        v36 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v48, v41);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "logWithMessage:fromCodeLocation:type:", v36, "PLModelMigrationActions_15000.m", 856, 0);

        if (v36 != &v50)
          free(v36);
      }
      v24 = 1;
      v6 = v42;
    }
    a4 = v43;
LABEL_22:

    goto LABEL_23;
  }
  -[PLModelMigrationActionCore logger](self, "logger");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    v44 = a4;
    v27 = v6;
    PLMigrationGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

    if (v29)
    {
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
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      PLMigrationGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
      v48 = 138412290;
      v49 = (uint64_t)v12;
      LODWORD(v41) = 12;
      v31 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionCore logger](self, "logger", &v48, v41);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "logWithMessage:fromCodeLocation:type:", v31, "PLModelMigrationActions_15000.m", 859, 16);

      if (v31 != &v50)
        free(v31);
    }
    v24 = 3;
    v16 = v12;
    v6 = v27;
    a4 = v44;
  }
  else
  {
    v24 = 3;
    v16 = v12;
  }
LABEL_23:
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v38 = v16;
  v39 = v38;
  if (v24 != 1 && a4)
    *a4 = objc_retainAutorelease(v38);

  return v24;
}

@end
