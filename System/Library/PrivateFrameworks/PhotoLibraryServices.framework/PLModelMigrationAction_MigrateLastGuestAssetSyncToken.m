@implementation PLModelMigrationAction_MigrateLastGuestAssetSyncToken

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char isKindOfClass;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  __int128 *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  objc_class *v28;
  __CFString *v29;
  __int128 *v30;
  void *v31;
  uint64_t v33;
  void *v34;
  id v35;
  int v36;
  const __CFString *v37;
  __int16 v38;
  id v39;
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
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = 1;
  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGlobalKeyValue fetchGlobalKeyValueForKey:withManagedObjectContext:createIfMissing:](PLGlobalKeyValue, "fetchGlobalKeyValueForKey:withManagedObjectContext:createIfMissing:", CFSTR("LastGuestAssetSyncToken"), v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "anyValue");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
LABEL_5:
      v7 = 1;
      goto LABEL_19;
    }
    objc_msgSend(v10, "anyValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v11 = 0;
      goto LABEL_5;
    }
    objc_msgSend(v10, "anyValue");
    v14 = objc_claimAutoreleasedReturnValue();
    +[PLPersistentHistoryUtilities unarchiveTokenWithData:](PLPersistentHistoryUtilities, "unarchiveTokenWithData:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v34 = (void *)v15;
    +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", v15, CFSTR("LastGuestAssetSyncToken"), v6);
    v35 = 0;
    LOBYTE(v14) = objc_msgSend(v6, "save:", &v35);
    v11 = v35;
    if ((v14 & 1) != 0)
    {
      v7 = 1;
      objc_msgSend(v8, "setCompletedUnitCount:", 1);
      -[PLModelMigrationActionCore logger](self, "logger");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        PLMigrationGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

        if (v19)
        {
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
          PLMigrationGetLog();
          v20 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
          v36 = 138543618;
          v37 = CFSTR("LastGuestAssetSyncToken");
          v38 = 2114;
          v39 = v34;
          LODWORD(v33) = 22;
          v21 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v36, v33);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "logWithMessage:fromCodeLocation:type:", v21, "PLModelMigrationActions_15000.m", 364, 0);

          if (v21 != &v40)
            free(v21);
        }
        v7 = 1;
      }
    }
    else
    {
      -[PLModelMigrationActionCore logger](self, "logger");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = (void *)v23;
        PLMigrationGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

        if (v26)
        {
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
          PLMigrationGetLog();
          v27 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
          v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v36 = 138543618;
          v37 = v29;
          v38 = 2112;
          v39 = v11;
          LODWORD(v33) = 22;
          v30 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v36, v33);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "logWithMessage:fromCodeLocation:type:", v30, "PLModelMigrationActions_15000.m", 361, 16);

          if (v30 != &v40)
            free(v30);
        }
      }
      v7 = 3;
    }

  }
  else
  {
    v11 = 0;
  }
LABEL_19:
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease(v11);

  return v7;
}

@end
