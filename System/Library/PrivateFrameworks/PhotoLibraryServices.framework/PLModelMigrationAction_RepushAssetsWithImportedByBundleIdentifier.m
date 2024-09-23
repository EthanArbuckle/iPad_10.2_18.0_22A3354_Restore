@implementation PLModelMigrationAction_RepushAssetsWithImportedByBundleIdentifier

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCPLSettings settingsWithPathManager:](PLCPLSettings, "settingsWithPathManager:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setRunOnceFlag:error:", 64, 0);
  objc_msgSend(v5, "setCompletedUnitCount:", objc_msgSend(v5, "completedUnitCount") + 1);
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");

  return 1;
}

@end
