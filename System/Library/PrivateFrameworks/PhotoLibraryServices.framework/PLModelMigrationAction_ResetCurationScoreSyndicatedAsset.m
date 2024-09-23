@implementation PLModelMigrationAction_ResetCurationScoreSyndicatedAsset

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  int64_t v19;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  uint8_t *v28;
  void *v29;
  uint64_t v30;
  id v31;
  int v32;
  void *v33;
  __int16 v34;
  id v35;
  uint8_t buf[32];
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
  const __CFString *v67;
  _QWORD v68[4];

  v68[1] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0C97AB0];
  v7 = a3;
  v8 = [v6 alloc];
  +[PLManagedAsset entity](PLManagedAsset, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithEntity:", v9);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > 0.0"), CFSTR("curationScore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);
  objc_msgSend(v10, "setResultType:", 2);
  v67 = CFSTR("curationScore");
  v68[0] = &unk_1E37643A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, &v67, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPropertiesToUpdate:", v12);

  v31 = 0;
  objc_msgSend(v7, "executeRequest:error:", v10, &v31);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v31;
  if (v13)
  {
    PLSyndicationGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "result");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v18;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "%{public}@.: Successfully batch reset curationScore for %@ assets", buf, 0x16u);

    }
    v19 = 1;
    if (a4)
LABEL_5:
      *a4 = objc_retainAutorelease(v14);
  }
  else
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      PLMigrationGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

      if (v24)
      {
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
        memset(buf, 0, sizeof(buf));
        PLMigrationGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543618;
        v33 = v27;
        v34 = 2112;
        v35 = v14;
        LODWORD(v30) = 22;
        v28 = (uint8_t *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v32, v30);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "logWithMessage:fromCodeLocation:type:", v28, "PLModelMigrationActions_15000.m", 678, 16);

        if (v28 != buf)
          free(v28);
      }
    }
    v19 = 3;
    if (a4)
      goto LABEL_5;
  }

  return v19;
}

@end
