@implementation PLModelMigrationAction_ClearInterruptedMaintenanceTaskLibraries

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0D73280];
  -[PLModelMigrationActionCore pathManager](self, "pathManager", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "isSystemPhotoLibraryURL:", v7);

  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("PLIncompleteMaintenanceTaskPaths.periodicmaintenance"));

  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  return 1;
}

@end
