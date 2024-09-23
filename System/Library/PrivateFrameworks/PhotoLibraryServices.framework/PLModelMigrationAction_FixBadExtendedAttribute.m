@implementation PLModelMigrationAction_FixBadExtendedAttribute

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  int64_t v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = 1;
  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSystemPhotoLibraryPathManager");

  v10 = 0;
  if (v9)
  {
    v11 = (void *)MEMORY[0x1E0C99E98];
    -[PLModelMigrationActionCore pathManager](self, "pathManager");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v12, "photoDirectoryWithType:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 1;
    objc_msgSend(v11, "fileURLWithPath:isDirectory:", v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0;
    LOBYTE(v12) = objc_msgSend(MEMORY[0x1E0D73288], "setTimeMachineExclusionAttribute:url:error:", 0, v14, &v17);
    v10 = v17;
    if ((v12 & 1) == 0)
    {
      PLMigrationGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v19 = "-[PLModelMigrationAction_FixBadExtendedAttribute performActionWithManagedObjectContext:error:]";
        v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "%{public}s: Failed to remove the exclusion attribute: %@", buf, 0x16u);
      }

      v6 = 3;
    }

  }
  objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v7, "completedUnitCount") + 1);
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease(v10);

  return v6;
}

@end
