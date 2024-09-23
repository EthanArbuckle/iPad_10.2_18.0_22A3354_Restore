@implementation PLModelMigrationAction_RemoveLegacyImportedAssetsFromDuplicateAlbums

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
  int64_t v14;
  const __CFString *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[PLManagedAsset fetchRequest](PLManagedAsset, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForFinderSyncedAsset"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("duplicateAssetVisibilityState"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v12);

  v16 = CFSTR("albums");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRelationshipKeyPathsForPrefetching:", v13);

  objc_msgSend(v7, "setFetchBatchSize:", 100);
  v14 = +[PLModelMigrationActionUtility removeFromDuplicatesWithAction:managedObjectContext:fetchRequest:requiresTokenReset:error:](PLModelMigrationActionUtility, "removeFromDuplicatesWithAction:managedObjectContext:fetchRequest:requiresTokenReset:error:", self, v6, v7, 0, a4);

  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  return v14;
}

@end
