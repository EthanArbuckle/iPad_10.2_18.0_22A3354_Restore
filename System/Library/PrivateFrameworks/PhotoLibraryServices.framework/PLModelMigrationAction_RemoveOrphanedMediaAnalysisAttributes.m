@implementation PLModelMigrationAction_RemoveOrphanedMediaAnalysisAttributes

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  id v12;
  id v14;

  v6 = (void *)MEMORY[0x1E0C97B48];
  v7 = a3;
  +[PLMediaAnalysisAssetAttributes entityName](PLMediaAnalysisAssetAttributes, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NULL"), CFSTR("asset"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  v14 = 0;
  v11 = +[PLModelMigrationActionUtility removeOrphanedObjectsWithAction:managedObjectContext:fetchRequest:error:](PLModelMigrationActionUtility, "removeOrphanedObjectsWithAction:managedObjectContext:fetchRequest:error:", self, v7, v9, &v14);

  v12 = v14;
  -[PLModelMigrationActionBackground finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease(v12);

  return v11;
}

+ (int64_t)actionProgressWeight
{
  return 200;
}

@end
