@implementation PLModelMigrationAction_ReevaluatePanoramaImageAssets

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
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  id v21;
  id v23;
  const __CFString *v24;
  void *v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLModelMigrationActionBackground resumeMarker](self, "resumeMarker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchRequestWithEntityName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kind"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v13 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self >= %@"), v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "andPredicateWithSubpredicates:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v16;
  }
  objc_msgSend(v11, "setPredicate:", v12);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSortDescriptors:", v18);

  v24 = CFSTR("master.mediaMetadata");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRelationshipKeyPathsForPrefetching:", v19);

  objc_msgSend(v11, "setFetchBatchSize:", 100);
  v23 = 0;
  v20 = +[PLModelMigrationActionUtility processAssetWithAction:managedObjectContext:fetchRequest:useObjectIDResumeMarker:error:processingBlock:](PLModelMigrationActionUtility, "processAssetWithAction:managedObjectContext:fetchRequest:useObjectIDResumeMarker:error:processingBlock:", self, v6, v11, 1, &v23, &__block_literal_global_1164);
  v21 = v23;
  -[PLModelMigrationActionBackground finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease(v21);

  return v20;
}

+ (int64_t)actionProgressWeight
{
  return 200;
}

@end
