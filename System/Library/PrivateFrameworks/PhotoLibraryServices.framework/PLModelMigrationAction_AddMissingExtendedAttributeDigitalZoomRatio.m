@implementation PLModelMigrationAction_AddMissingExtendedAttributeDigitalZoomRatio

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
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
  void *v19;
  int64_t v20;
  id v21;
  id v24;
  void *v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PLModelMigrationActionBackground resumeMarker](self, "resumeMarker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("extendedAttributes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("extendedAttributes.digitalZoomRatio"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v13;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kind"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v14;
  if (v7)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self >= %@"), v7);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v17);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSortDescriptors:", v19);

  v24 = 0;
  v20 = +[PLModelMigrationActionUtility updateExtendedAttributesWithAction:managedObjectContext:fetchRequest:useObjectIDResumeMarker:error:](PLModelMigrationActionUtility, "updateExtendedAttributesWithAction:managedObjectContext:fetchRequest:useObjectIDResumeMarker:error:", self, v5, v10, 1, &v24);
  v21 = v24;
  -[PLModelMigrationActionBackground finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease(v21);

  return v20;
}

+ (int64_t)actionProgressWeight
{
  return 500;
}

@end
