@implementation PLModelMigrationAction_ResetBackgroundJobServicePersistedBundleRecords

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("PLBackgroundJobServiceBundleRecordsVeryLowPriorityKey"));
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("PLBackgroundJobServiceBundleRecordsLowPriorityKey"));
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("PLBackgroundJobServiceBundleRecordsMediumPriorityKey"));
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("PLBackgroundJobServiceBundleRecordsHighPriorityKey"));
  PLMigrationGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Removed all records from background job service's persisted bundle records", v9, 2u);
  }

  objc_msgSend(v5, "setCompletedUnitCount:", objc_msgSend(v5, "completedUnitCount") + 1);
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");

  return 1;
}

@end
