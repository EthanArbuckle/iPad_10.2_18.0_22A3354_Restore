@implementation PLModelMigrationAction_PopulateCloudFeedEntryIsMine

- (void)_migrateEntriesWithFetchRequest:(id)a3 moc:(id)a4 progress:(id)a5 result:(int64_t *)a6
{
  id v10;
  id v11;
  id v12;
  PLEnumerateAndSaveController *v13;
  objc_class *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  PLEnumerateAndSaveController *v20;
  id v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  _OWORD *v29;
  void *v30;
  uint64_t v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  int v37;
  void *v38;
  __int16 v39;
  id v40;
  _OWORD v41[32];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a3;
  v13 = [PLEnumerateAndSaveController alloc];
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __107__PLModelMigrationAction_PopulateCloudFeedEntryIsMine__migrateEntriesWithFetchRequest_moc_progress_result___block_invoke;
  v35[3] = &unk_1E36700D0;
  v18 = v10;
  v36 = v18;
  v33[0] = v17;
  v33[1] = 3221225472;
  v33[2] = __107__PLModelMigrationAction_PopulateCloudFeedEntryIsMine__migrateEntriesWithFetchRequest_moc_progress_result___block_invoke_2;
  v33[3] = &unk_1E3669568;
  v19 = v11;
  v34 = v19;
  v20 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v13, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v15, v12, v18, v16, 0, 0, v35, 0, v33);

  v32 = 0;
  LOBYTE(v15) = -[PLEnumerateAndSaveController processObjectsWithError:](v20, "processObjectsWithError:", &v32);
  v21 = v32;
  if ((v15 & 1) == 0)
  {
    *a6 = 3;
    -[PLModelMigrationActionCore logger](self, "logger");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      PLMigrationGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

      if (v25)
      {
        memset(v41, 0, sizeof(v41));
        PLMigrationGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138543618;
        v38 = v28;
        v39 = 2112;
        v40 = v21;
        LODWORD(v31) = 22;
        v29 = (_OWORD *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v37, v31);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "logWithMessage:fromCodeLocation:type:", v29, "PLModelMigrationActions_18000.m", 1033, 16);

        if (v29 != v41)
          free(v29);
      }
    }
  }

}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  __int128 *v15;
  void *v16;
  int64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  __int128 *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  id v34;
  uint64_t v35;
  _QWORD v36[2];
  const __CFString *v37;
  int v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
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
  __int128 v72;
  __int128 v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v35 = 1;
  +[PLCloudFeedEntry fetchRequest](PLCloudFeedEntry, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIncludesSubentities:", 1);
  v34 = 0;
  v8 = objc_msgSend(v6, "countForFetchRequest:error:", v7, &v34);
  v9 = v34;
  -[PLModelMigrationActionCore logger](self, "logger");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v10)
    {
      PLMigrationGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

      if (v13)
      {
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
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        PLMigrationGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
        v38 = 138543362;
        v39 = 0;
        LODWORD(v33) = 12;
        v15 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v38, v33);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logWithMessage:fromCodeLocation:type:", v15, "PLModelMigrationActions_18000.m", 1050, 16);

        if (v15 != &v42)
          free(v15);
      }
    }
    v17 = 3;
  }
  else
  {
    if (v10)
    {
      PLMigrationGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

      if (v19)
      {
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
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        PLMigrationGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543618;
        v39 = v22;
        v40 = 2048;
        v41 = v8;
        LODWORD(v33) = 22;
        v23 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v38, v33);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "logWithMessage:fromCodeLocation:type:", v23, "PLModelMigrationActions_18000.m", 1054, 0);

        if (v23 != &v42)
          free(v23);
      }
    }
    -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", v8, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCloudFeedAssetsEntry fetchRequest](PLCloudFeedAssetsEntry, "fetchRequest");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = CFSTR("entryAssets");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setRelationshipKeyPathsForPrefetching:", v27);

    -[PLModelMigrationAction_PopulateCloudFeedEntryIsMine _migrateEntriesWithFetchRequest:moc:progress:result:](self, "_migrateEntriesWithFetchRequest:moc:progress:result:", v26, v6, v25, &v35);
    if (v35 != 1)
      goto LABEL_14;
    +[PLCloudFeedCommentsEntry fetchRequest](PLCloudFeedCommentsEntry, "fetchRequest");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = CFSTR("entryComments");
    v36[1] = CFSTR("entryLikeComments");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setRelationshipKeyPathsForPrefetching:", v29);

    -[PLModelMigrationAction_PopulateCloudFeedEntryIsMine _migrateEntriesWithFetchRequest:moc:progress:result:](self, "_migrateEntriesWithFetchRequest:moc:progress:result:", v28, v6, v25, &v35);
    if (v35 != 1)
      goto LABEL_14;
    +[PLCloudFeedEntry fetchRequest](PLCloudFeedEntry, "fetchRequest");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setIncludesSubentities:", 0);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("entryTypeNumber != %d AND entryTypeNumber != %d"), 1, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setPredicate:", v31);

    -[PLModelMigrationAction_PopulateCloudFeedEntryIsMine _migrateEntriesWithFetchRequest:moc:progress:result:](self, "_migrateEntriesWithFetchRequest:moc:progress:result:", v30, v6, v25, &v35);
    if (v35 != 1)
    {
LABEL_14:
      if (a4)
        *a4 = 0;
    }
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    v17 = v35;

  }
  return v17;
}

+ (int64_t)actionProgressWeight
{
  return 200;
}

@end
