@implementation PLModelMigrationAction_UpdateDuplicateProcessingStateScreenshot

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  int64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v19;
  id v20;

  v6 = a3;
  -[PLModelMigrationActionCore progress](self, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "totalUnitCount") / 7;

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PLModelMigrationAction_UpdateDuplicateProcessingStateScreenshot fetchRequestForScreenshot](self, "fetchRequestForScreenshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v11 = -[PLModelMigrationAction_UpdateDuplicateProcessingState updateSceneClassificationDuplicateProcessingStateWithProcessingState:pendingParentUnitCount:assetProcessingStateMap:context:request:error:](self, "updateSceneClassificationDuplicateProcessingStateWithProcessingState:pendingParentUnitCount:assetProcessingStateMap:context:request:error:", 64, v8, v9, v6, v10, &v20);
  v12 = v20;

  if (v11 == 1)
  {
    if (objc_msgSend(v9, "count"))
    {
      v13 = (void *)MEMORY[0x19AEC1554]();
      v19 = v12;
      v11 = -[PLModelMigrationAction_UpdateDuplicateProcessingState processAssetStateMap:pendingParentUnitCount:context:error:](self, "processAssetStateMap:pendingParentUnitCount:context:error:", v9, v8, v6, &v19);
      v14 = v19;

      objc_autoreleasePoolPop(v13);
      v12 = v14;
    }
    else
    {
      v11 = 1;
    }
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v15 = v12;
  v16 = v15;
  if (v11 != 1 && a4 != 0)
    *a4 = objc_retainAutorelease(v15);

  return v11;
}

- (id)fetchRequestForScreenshot
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  +[PLSceneClassification fetchRequest](PLSceneClassification, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3528];
  v4 = (void *)MEMORY[0x1E0CB3880];
  +[PLSceneClassification PLJunkSceneClassificationIDForLabel:](PLSceneClassification, "PLJunkSceneClassificationIDForLabel:", CFSTR("screenshot"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("sceneIdentifier"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %lf"), CFSTR("confidence"), 0x3FE28F5C28F5C28FLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v9);

  v12 = CFSTR("assetAttributes.asset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRelationshipKeyPathsForPrefetching:", v10);

  objc_msgSend(v2, "setFetchBatchSize:", 100);
  return v2;
}

+ (int64_t)actionProgressWeight
{
  return 200;
}

@end
