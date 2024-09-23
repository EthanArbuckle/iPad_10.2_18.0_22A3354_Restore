@implementation PLModelMigrationAction_RepairSingletons

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  NSObject *v12;
  int64_t v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_class();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v10 = objc_msgSend(v8, "repairSingletonObjectsInDatabaseUsingContext:pathManager:error:", v6, v9, &v15);
  v11 = v15;

  objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v7, "completedUnitCount") + 1);
  if ((v10 & 1) == 0)
  {
    PLMigrationGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Failed to create singletons: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v6, "reset");
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease(v11);
  if (v10)
    v13 = 1;
  else
    v13 = 3;

  return v13;
}

+ (BOOL)repairSingletonObjectsInDatabaseUsingContext:(id)a3 pathManager:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  PLMigrationGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Creating PLGenericAlbum singletons", (uint8_t *)&v26, 2u);
  }

  +[PLGenericAlbum addSingletonObjectsToContext:](PLGenericAlbum, "addSingletonObjectsToContext:", v8);
  PLMigrationGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Creating PLManagedAlbumList singletons", (uint8_t *)&v26, 2u);
  }

  +[PLManagedAlbumList addSingletonObjectsToContext:](PLManagedAlbumList, "addSingletonObjectsToContext:", v8);
  v12 = objc_msgSend(v8, "save:", a5);
  if (v12)
  {
    PLGenericAlbumHashOfSingletonAlbumValues(0);
    objc_msgSend(v8, "persistentStoreCoordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "persistentStores");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "metadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = objc_msgSend(v16, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3482);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v19, CFSTR("PLAlbumSingletonHashKey"));

      objc_msgSend(v15, "setMetadata:", v18);
      PLMigrationGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v26 = 134217984;
        v27 = 3482;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Updated persisted album singleton hash to %lu", (uint8_t *)&v26, 0xCu);
      }

    }
    else
    {
      PLMigrationGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v26 = 136446210;
        v27 = (uint64_t)"+[PLModelMigrationAction_RepairSingletons repairSingletonObjectsInDatabaseUsingContext:pathManager:error:]";
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Failed to get store metadata: %{public}s", (uint8_t *)&v26, 0xCu);
      }
    }

    PLMigrationGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "Enforcing fixed album order", (uint8_t *)&v26, 2u);
    }

    objc_msgSend(v8, "persistentStoreCoordinator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "persistentStores");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_repairRootFolderFixedOrderKeysInStore:context:pathManager:", v24, v8, v9);

  }
  return v12;
}

+ (void)_repairRootFolderFixedOrderKeysInStore:(id)a3 context:(id)a4 pathManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLModelMigrationActionRepairs.m"), 186, CFSTR("%@ can only be called from assetsd"), v15);

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __102__PLModelMigrationAction_RepairSingletons__repairRootFolderFixedOrderKeysInStore_context_pathManager___block_invoke;
  v17[3] = &unk_1E3677530;
  v18 = v10;
  v19 = v9;
  v20 = v11;
  v12 = v11;
  v13 = v9;
  v16 = v10;
  objc_msgSend(v16, "performBlockAndWait:", v17);

}

@end
