@implementation PLModelMigrationAction_AddMissingExtendedAttributeFocalLengthIn35mm

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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  id v21;
  id v23;
  void *v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
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

  v12 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("extendedAttributes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("extendedAttributes.focalLengthIn35mm"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v14;
  if (v8)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self >= %@"), v8);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v17);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSortDescriptors:", v19);

  v23 = 0;
  v20 = +[PLModelMigrationActionUtility updateExtendedAttributesWithAction:managedObjectContext:fetchRequest:useObjectIDResumeMarker:error:](PLModelMigrationActionUtility, "updateExtendedAttributesWithAction:managedObjectContext:fetchRequest:useObjectIDResumeMarker:error:", self, v6, v11, 1, &v23);
  v21 = v23;
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
