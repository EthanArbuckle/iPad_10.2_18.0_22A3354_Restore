@implementation PLModelMigrationAction_GreenTeaSetDefaultContactsAuthorizationState

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  uint64_t v17;
  __int128 *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  objc_class *v25;
  __CFString *v26;
  __int128 *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  id v32;
  int v33;
  const __CFString *v34;
  __int16 v35;
  uint64_t v36;
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
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = 1;
  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGlobalKeyValue fetchGlobalKeyValueForKey:withManagedObjectContext:createIfMissing:](PLGlobalKeyValue, "fetchGlobalKeyValueForKey:withManagedObjectContext:createIfMissing:", CFSTR("GreenTeaContactsAuthorization"), v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if (!v9)
  {
    +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", &unk_1E375EFB8, CFSTR("GreenTeaContactsAuthorization"), v6);
    v32 = 0;
    v11 = objc_msgSend(v6, "save:", &v32);
    v10 = v32;
    if ((v11 & 1) != 0)
    {
      v7 = 1;
      objc_msgSend(v8, "setCompletedUnitCount:", 1);
      -[PLModelMigrationActionCore logger](self, "logger");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        v31 = v8;
        PLMigrationGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

        if (v15)
        {
          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
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
          PLMigrationGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
          v17 = objc_msgSend(&unk_1E375EFB8, "integerValue");
          v33 = 138543618;
          v34 = CFSTR("GreenTeaContactsAuthorization");
          v35 = 2048;
          v36 = v17;
          LODWORD(v30) = 22;
          v18 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v33, v30);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "logWithMessage:fromCodeLocation:type:", v18, "PLModelMigrationActions_15000.m", 774, 0);

          if (v18 != &v37)
            free(v18);
        }
        v7 = 1;
        v8 = v31;
      }
    }
    else
    {
      -[PLModelMigrationActionCore logger](self, "logger");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = (void *)v20;
        PLMigrationGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

        if (v23)
        {
          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
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
          PLMigrationGetLog();
          v24 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v33 = 138543618;
          v34 = v26;
          v35 = 2112;
          v36 = (uint64_t)v10;
          LODWORD(v30) = 22;
          v27 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v33, v30);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "logWithMessage:fromCodeLocation:type:", v27, "PLModelMigrationActions_15000.m", 771, 16);

          if (v27 != &v37)
            free(v27);
        }
      }
      v7 = 3;
    }
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease(v10);

  return v7;
}

@end
