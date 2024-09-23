@implementation PLModelMigrationAction_ResetSyndication

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  int64_t v17;
  objc_class *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0D73280];
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "libraryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "wellKnownPhotoLibraryIdentifierForURL:", v9);

  PLStringFromWellKnownPhotoLibraryIdentifier();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PLMigrationGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v11;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Resetting syndication for library identifier %{public}@", buf, 0xCu);
  }

  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "becomeCurrentWithPendingUnitCount:", 1);
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == 3)
  {
    v24 = 0;
    v15 = PLResetSyndicationLibraryWithManagedObjectContext(v6, v14, &v24);
    v16 = v24;

    objc_msgSend(v13, "resignCurrent");
    if ((v15 & 1) != 0)
    {
      v17 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v17 = 1;
    v20 = PLDeleteGuestAssetsInLibraryWithManagedObjectContext(v6, v14, v19, 1, &v23);
    v16 = v23;

    objc_msgSend(v13, "resignCurrent");
    if (v20)
      goto LABEL_10;
  }
  PLMigrationGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v11;
    _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Failed to reset syndication for library identifier %{public}@", buf, 0xCu);
  }

  v17 = 3;
LABEL_10:
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease(v16);

  return v17;
}

@end
