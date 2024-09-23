@implementation PLModelMigrationAction_ReprocessInvalidDuplicateHashes

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  int64_t v6;
  id v7;
  void *v8;
  id v10;

  v10 = 0;
  v6 = -[PLModelMigrationAction_ReprocessInvalidDuplicateHashes removeDuplicateHashesAndResetAlbumsWithManagedObjectContext:error:](self, "removeDuplicateHashesAndResetAlbumsWithManagedObjectContext:error:", a3, &v10);
  v7 = v10;
  v8 = v7;
  if (v6 != 1 && a4)
    *a4 = objc_retainAutorelease(v7);

  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  return v6;
}

- (int64_t)removeDuplicateHashesAndResetAlbumsWithManagedObjectContext:(id)a3 error:(id *)a4
{
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  int64_t v21;
  id v22;
  void *v23;
  void *v25;
  void *v26;
  id v27;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  _QWORD v34[3];
  _QWORD v35[2];
  _QWORD v36[5];

  v36[3] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99D50];
  v27 = a3;
  v26 = (void *)objc_msgSend([v4 alloc], "initWithBase64EncodedString:options:", CFSTR("HFjITFHMTSUQZvwem8/AdHTX79EzsJPt"), 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", CFSTR("D1n4q6PJlweXlNRG6ufsMga1RRg/m7kBOA=="), 0);
  v5 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) = %d"), CFSTR("kind"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) != %d"), CFSTR("additionalAttributes.sceneAnalysisVersion"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v10;
  v11 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) == %@"), CFSTR("additionalAttributes.sceneprint.duplicateMatchingData"), v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) == %@"), CFSTR("additionalAttributes.sceneprint.duplicateMatchingAlternateData"), v25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "orPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v17);

  v34[0] = CFSTR("albums");
  v34[1] = CFSTR("additionalAttributes");
  v34[2] = CFSTR("additionalAttributes.sceneprint");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRelationshipKeyPathsForPrefetching:", v18);

  v33 = 0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __124__PLModelMigrationAction_ReprocessInvalidDuplicateHashes_removeDuplicateHashesAndResetAlbumsWithManagedObjectContext_error___block_invoke;
  v30[3] = &unk_1E3669680;
  v19 = v26;
  v31 = v19;
  v20 = v25;
  v32 = v20;
  v21 = +[PLModelMigrationActionUtility processManagedObjectsWithAction:managedObjectContext:fetchRequest:pendingParentUnitCount:error:processingBlock:](PLModelMigrationActionUtility, "processManagedObjectsWithAction:managedObjectContext:fetchRequest:pendingParentUnitCount:error:processingBlock:", self, v27, v7, 0, &v33, v30);

  v22 = v33;
  v23 = v22;
  if (v21 != 1 && a4)
    *a4 = objc_retainAutorelease(v22);

  return v21;
}

+ (int64_t)actionProgressWeight
{
  return 200;
}

@end
