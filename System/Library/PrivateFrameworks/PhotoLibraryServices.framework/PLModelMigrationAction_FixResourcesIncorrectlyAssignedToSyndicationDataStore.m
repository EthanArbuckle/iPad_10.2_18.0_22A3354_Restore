@implementation PLModelMigrationAction_FixResourcesIncorrectlyAssignedToSyndicationDataStore

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  int64_t v22;
  NSObject *v23;
  uint64_t v24;
  PLModelMigrationAction_FixResourcesIncorrectlyAssignedToSyndicationDataStore *v26;
  _QWORD v28[4];
  NSObject *v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d && %K == %d"), CFSTR("dataStoreClassID"), 3, CFSTR("recipeID"), 65741);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("asset.savedAssetType"), (int)objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForCloudSharedAsset"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3528];
  v35[0] = v9;
  v35[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v13);

  v30 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v8, &v30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v30;
  v26 = self;
  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v14, "count"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v14)
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __124__PLModelMigrationAction_FixResourcesIncorrectlyAssignedToSyndicationDataStore_performActionWithManagedObjectContext_error___block_invoke;
    v28[3] = &unk_1E366AC38;
    v18 = v16;
    v29 = v18;
    objc_msgSend(v5, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v14, v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    PLMigrationGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v32 = "-[PLModelMigrationAction_FixResourcesIncorrectlyAssignedToSyndicationDataStore performActionWithManagedObj"
              "ectContext:error:]";
        v33 = 2112;
        v34 = v19;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "%{public}s: enumerate with incremental save failed: %@", buf, 0x16u);
      }
      v22 = 3;
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v24 = -[NSObject completedUnitCount](v18, "completedUnitCount");
        *(_DWORD *)buf = 134217984;
        v32 = (const char *)v24;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "Fixed %lld resources", buf, 0xCu);
      }
      v22 = 1;
    }

    v23 = v29;
  }
  else
  {
    PLMigrationGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v32 = "-[PLModelMigrationAction_FixResourcesIncorrectlyAssignedToSyndicationDataStore performActionWithManagedObjec"
            "tContext:error:]";
      v33 = 2112;
      v34 = v15;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "%{public}s: resource fetch failed: %@", buf, 0x16u);
    }
    v22 = 3;
    v19 = v15;
  }

  -[PLModelMigrationActionCore finalizeProgress](v26, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease(v19);

  return v22;
}

@end
