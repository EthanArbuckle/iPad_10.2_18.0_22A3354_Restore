@implementation PLModelMigrationAction_RemoveGuestFacesFromSPL

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;
  id v13;

  v5 = (void *)MEMORY[0x1E0D73310];
  v6 = a3;
  v7 = 1;
  objc_msgSend(v5, "predicateForIncludeMask:useIndex:keyPathPrefix:", objc_msgSend(v5, "maskForGuestAsset"), 1, CFSTR("assetForFace"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v10 = +[PLModelMigrator executeBatchDeleteWithEntityName:predicate:managedObjectContext:error:](PLModelMigrator, "executeBatchDeleteWithEntityName:predicate:managedObjectContext:error:", v9, v8, v6, &v13);

  v11 = v13;
  if (!v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v11);
    v7 = 3;
  }

  return v7;
}

@end
