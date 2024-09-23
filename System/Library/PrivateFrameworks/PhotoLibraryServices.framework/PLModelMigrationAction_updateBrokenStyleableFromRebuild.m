@implementation PLModelMigrationAction_updateBrokenStyleableFromRebuild

- (id)buildFetchRequest
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
  void *v11;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("kind"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > %d"), CFSTR("currentSleetCast"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("uniformTypeIdentifier"), *MEMORY[0x1E0CEC508]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == 0"), CFSTR("additionalAttributes.sleetIsReversible"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v11);

  objc_msgSend(v4, "setFetchBatchSize:", 100);
  return v4;
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int64_t v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[PLModelMigrationAction_updateBrokenStyleableFromRebuild buildFetchRequest](self, "buildFetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __103__PLModelMigrationAction_updateBrokenStyleableFromRebuild_performActionWithManagedObjectContext_error___block_invoke;
  v14[3] = &unk_1E36696F8;
  v8 = +[PLModelMigrationActionUtility processManagedObjectsWithAction:managedObjectContext:fetchRequest:pendingParentUnitCount:error:processingBlock:](PLModelMigrationActionUtility, "processManagedObjectsWithAction:managedObjectContext:fetchRequest:pendingParentUnitCount:error:processingBlock:", self, v6, v7, 0, &v16, v14);

  v9 = v16;
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v10 = v9;
  v11 = v10;
  if (v8 != 1 && a4 != 0)
    *a4 = objc_retainAutorelease(v10);

  return v8;
}

@end
