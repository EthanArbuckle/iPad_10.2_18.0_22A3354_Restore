@implementation PLModelMigrationAction_PopulateBundleScopeOnAssets

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
  id v15;
  NSObject *v16;
  char *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  char *v33;
  int64_t v34;
  id *v36;
  PLModelMigrationAction_PopulateBundleScopeOnAssets *v37;
  void *v38;
  id v39;
  id v40;
  const __CFString *v41;
  void *v42;
  _QWORD v43[2];
  _QWORD v44[2];
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  id v48;
  const __CFString *v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v37 = self;
  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", 2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPersistentHistoryTransactionModifiers transactionAuthorFromChangeSource:](PLPersistentHistoryTransactionModifiers, "transactionAuthorFromChangeSource:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTransactionAuthor:", v8);

  v9 = (void *)MEMORY[0x1E0C97AB0];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "batchUpdateRequestWithEntityName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForCloudSharedAsset"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v12);

  v49 = CFSTR("bundleScope");
  v50[0] = &unk_1E375EF10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPropertiesToUpdate:", v13);

  objc_msgSend(v11, "setResultType:", 2);
  v40 = 0;
  objc_msgSend(v6, "executeRequest:error:", v11, &v40);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v40;
  v38 = v7;
  if (v14)
  {
    v36 = a4;
    objc_msgSend(v7, "setCompletedUnitCount:", 1);
    PLMigrationGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "result");
      v17 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v46 = v17;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Populated bundleScope for %@ CloudShared assets", buf, 0xCu);

    }
    v18 = (void *)MEMORY[0x1E0C97AB0];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "batchUpdateRequestWithEntityName:", v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForMomentSharedAsset"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v21;
    v22 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForPlaceholderAsset"), 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v23;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("momentShare"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "andPredicateWithSubpredicates:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "orPredicateWithSubpredicates:", v27);
    v28 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setPredicate:", v28);
    v41 = CFSTR("bundleScope");
    v42 = &unk_1E375EF28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPropertiesToUpdate:", v29);

    objc_msgSend(v11, "setResultType:", 2);
    v39 = v15;
    objc_msgSend(v6, "executeRequest:error:", v11, &v39);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v39;

    if (v30)
    {
      objc_msgSend(v38, "setCompletedUnitCount:", 2);
      PLMigrationGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v30, "result");
        v33 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v46 = v33;
        _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEFAULT, "Populated bundleScope for %@ MomentShare assets", buf, 0xCu);

      }
      v34 = 1;
    }
    else
    {
      PLMigrationGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v46 = "-[PLModelMigrationAction_PopulateBundleScopeOnAssets performActionWithManagedObjectContext:error:]";
        v47 = 2112;
        v48 = v31;
        _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "%{public}s: batch update failed: %@", buf, 0x16u);
      }
      v34 = 3;
    }

    a4 = v36;
  }
  else
  {
    PLMigrationGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v46 = "-[PLModelMigrationAction_PopulateBundleScopeOnAssets performActionWithManagedObjectContext:error:]";
      v47 = 2112;
      v48 = v15;
      _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "%{public}s: batch update failed: %@", buf, 0x16u);
    }
    v34 = 3;
    v31 = v15;
  }

  -[PLModelMigrationActionCore finalizeProgress](v37, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease(v31);

  return v34;
}

@end
