@implementation PLModelMigrationAction_MigrateSocialGroupRebuildPersistence

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  int64_t v11;

  v5 = a3;
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isUBF"))
    v7 = 1;
  else
    v7 = 2;

  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isUBF");

  if (v10)
  {
    -[PLModelMigrationAction_MigrateSocialGroupRebuildPersistence deleteGraphNodeSocialGroupJournal](self, "deleteGraphNodeSocialGroupJournal");
    if (!MEMORY[0x19AEC0720](objc_msgSend(v8, "setCompletedUnitCount:", objc_msgSend(v8, "completedUnitCount") + 1)))
    {
      v11 = 1;
      goto LABEL_9;
    }
    objc_msgSend(v8, "setTotalUnitCount:", objc_msgSend(v8, "totalUnitCount") + 2);
  }
  v11 = -[PLModelMigrationAction_MigrateSocialGroupRebuildPersistence persistSocialGroupDirectoryJournalInContext:progress:](self, "persistSocialGroupDirectoryJournalInContext:progress:", v5, v8);
LABEL_9:
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");

  return v11;
}

- (void)deleteGraphNodeSocialGroupJournal
{
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  __int128 *v12;
  void *v13;
  PLJournal *v14;
  BOOL v15;
  id v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  __int128 *v22;
  void *v23;
  uint64_t v24;
  id v25;
  int v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
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
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLRebuildJournalManager baseURLFromPathManager:](PLRebuildJournalManager, "baseURLFromPathManager:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLModelMigrationActionCore logger](self, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    PLMigrationGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
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
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v35 = 0u;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v28 = 0u;
      PLMigrationGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      NSStringFromClass(v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v11;
      LODWORD(v24) = 12;
      v12 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionCore logger](self, "logger", &v26, v24);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logWithMessage:fromCodeLocation:type:", v12, "PLModelMigrationActions_18000.m", 859, 0);

      if (v12 != &v28)
        free(v12);
    }
  }
  v14 = -[PLJournal initWithBaseURL:payloadClass:]([PLJournal alloc], "initWithBaseURL:payloadClass:", v5, v3);
  -[PLJournal removeMetadata](v14, "removeMetadata");
  v25 = 0;
  v15 = -[PLJournal removeJournalFilesWithError:](v14, "removeJournalFilesWithError:", &v25);
  v16 = v25;
  if (!v15)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      PLMigrationGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (v20)
      {
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
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v35 = 0u;
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v28 = 0u;
        PLMigrationGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
        v26 = 138412290;
        v27 = v16;
        LODWORD(v24) = 12;
        v22 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v26, v24);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "logWithMessage:fromCodeLocation:type:", v22, "PLModelMigrationActions_18000.m", 864, 16);

        if (v22 != &v28)
          free(v22);
      }
    }
  }

}

- (void)deleteGraphNodeSocialGroupDirectoryJournal
{
  objc_class *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  __int128 *v10;
  void *v11;
  PLDirectoryJournal *v12;
  uint64_t v13;
  PLDirectoryJournal *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  __int128 *v21;
  void *v22;
  uint64_t v23;
  id v24;
  int v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  -[PLModelMigrationActionCore logger](self, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    PLMigrationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v34 = 0u;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v27 = 0u;
      PLMigrationGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      NSStringFromClass(v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v9;
      LODWORD(v23) = 12;
      v10 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionCore logger](self, "logger", &v25, v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logWithMessage:fromCodeLocation:type:", v10, "PLModelMigrationActions_18000.m", 871, 0);

      if (v10 != &v27)
        free(v10);
    }
  }
  v12 = [PLDirectoryJournal alloc];
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = -[PLDirectoryJournal initWithPathManager:payloadClass:](v12, "initWithPathManager:payloadClass:", v13, v3);

  v24 = 0;
  LOBYTE(v13) = -[PLDirectoryJournal removeAllPersistenceFilesWithError:](v14, "removeAllPersistenceFilesWithError:", &v24);
  v15 = v24;
  if ((v13 & 1) == 0)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      PLMigrationGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

      if (v19)
      {
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v34 = 0u;
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v27 = 0u;
        PLMigrationGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
        v25 = 138412290;
        v26 = v15;
        LODWORD(v23) = 12;
        v21 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v25, v23);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "logWithMessage:fromCodeLocation:type:", v21, "PLModelMigrationActions_18000.m", 875, 16);

        if (v21 != &v27)
          free(v21);
      }
    }
  }

}

- (int64_t)persistSocialGroupDirectoryJournalInContext:(id)a3 progress:(id)a4
{
  id v6;
  id v7;
  PLDirectoryJournal *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  BOOL v23;
  id v24;
  BOOL v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  void *v31;
  __int128 *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  NSObject *v38;
  __int128 *v39;
  void *v40;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id obj;
  PLDirectoryJournal *v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  int v56;
  id v57;
  __int16 v58;
  id v59;
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
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PLModelMigrationAction_MigrateSocialGroupRebuildPersistence deleteGraphNodeSocialGroupDirectoryJournal](self, "deleteGraphNodeSocialGroupDirectoryJournal");
  objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v7, "completedUnitCount") + 1);
  v8 = [PLDirectoryJournal alloc];
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = -[PLDirectoryJournal initWithPathManager:payloadClass:](v8, "initWithPathManager:payloadClass:", v9, objc_opt_class());

  v10 = (void *)MEMORY[0x1E0C97B48];
  +[PLGraphNode entityName](PLGraphNode, "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchRequestWithEntityName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLSocialGroup predicateForAllSocialGroupsInContext:](PLSocialGroup, "predicateForAllSocialGroupsInContext:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v13);

  objc_msgSend(v12, "setFetchBatchSize:", 100);
  v55 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v12, &v55);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v55;
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", objc_msgSend(v14, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 1;
    objc_msgSend(v7, "addChild:withPendingUnitCount:", v16, 1);
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v14;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v92, 16);
    if (v18)
    {
      v19 = v18;
      v43 = v14;
      v44 = v12;
      v45 = v7;
      v46 = v6;
      v20 = *(_QWORD *)v52;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v52 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          v50 = v15;
          v23 = -[PLModelMigrationActionCore isCancelledWithError:](self, "isCancelledWithError:", &v50);
          v24 = v50;

          if (v23)
          {
            v7 = v45;
            v6 = v46;
            v14 = v43;
            v12 = v44;
            v17 = 2;
            goto LABEL_24;
          }
          v49 = v24;
          v25 = -[PLDirectoryJournal persistManagedObject:error:](v48, "persistManagedObject:error:", v22, &v49);
          v15 = v49;

          if (v25)
          {
            objc_msgSend(v16, "setCompletedUnitCount:", objc_msgSend(v16, "completedUnitCount") + 1);
          }
          else
          {
            -[PLModelMigrationActionCore logger](self, "logger");
            v26 = objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              v27 = (void *)v26;
              PLMigrationGetLog();
              v28 = objc_claimAutoreleasedReturnValue();
              v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

              if (v29)
              {
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
                v64 = 0u;
                v65 = 0u;
                v62 = 0u;
                v63 = 0u;
                v60 = 0u;
                v61 = 0u;
                PLMigrationGetLog();
                v30 = objc_claimAutoreleasedReturnValue();
                os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
                objc_msgSend(v22, "uuid");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = 138543618;
                v57 = v31;
                v58 = 2112;
                v59 = v15;
                LODWORD(v42) = 22;
                v32 = (__int128 *)_os_log_send_and_compose_impl();

                -[PLModelMigrationActionCore logger](self, "logger", &v56, v42);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "logWithMessage:fromCodeLocation:type:", v32, "PLModelMigrationActions_18000.m", 900, 16);

                if (v32 != &v60)
                  free(v32);
              }
            }
          }
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v92, 16);
        if (v19)
          continue;
        break;
      }
      v24 = v15;
      v17 = 1;
      v7 = v45;
      v6 = v46;
      v14 = v43;
      v12 = v44;
    }
    else
    {
      v24 = v15;
    }
LABEL_24:

    v15 = v24;
  }
  else
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v34 = objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v35 = (void *)v34;
      PLMigrationGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);

      if (v37)
      {
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
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        PLMigrationGetLog();
        v38 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
        v56 = 138412290;
        v57 = v15;
        LODWORD(v42) = 12;
        v39 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v56, v42);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "logWithMessage:fromCodeLocation:type:", v39, "PLModelMigrationActions_18000.m", 906, 16);

        if (v39 != &v60)
          free(v39);
      }
      v17 = 1;
      v14 = 0;
    }
    else
    {
      v17 = 1;
    }
  }

  return v17;
}

@end
