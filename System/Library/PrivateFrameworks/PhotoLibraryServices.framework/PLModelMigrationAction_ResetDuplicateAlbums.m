@implementation PLModelMigrationAction_ResetDuplicateAlbums

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;

  v6 = a3;
  +[PLManagedAsset fetchRequest](PLManagedAsset, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("duplicateAssetVisibilityState"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  objc_msgSend(v7, "setFetchBatchSize:", 100);
  v9 = +[PLModelMigrationActionUtility removeFromDuplicatesWithAction:managedObjectContext:fetchRequest:requiresTokenReset:error:](PLModelMigrationActionUtility, "removeFromDuplicatesWithAction:managedObjectContext:fetchRequest:requiresTokenReset:error:", self, v6, v7, 1, a4);

  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  return v9;
}

@end
