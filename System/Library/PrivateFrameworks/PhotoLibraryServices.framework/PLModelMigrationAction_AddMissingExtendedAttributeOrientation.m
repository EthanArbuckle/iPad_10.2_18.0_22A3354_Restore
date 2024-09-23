@implementation PLModelMigrationAction_AddMissingExtendedAttributeOrientation

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
  int64_t v19;
  id v20;
  id v22;
  void *v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
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
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("kind"), &unk_1E37630F8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v13;
  if (v8)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self >= %@"), v8);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v16);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSortDescriptors:", v18);

  v22 = 0;
  v19 = +[PLModelMigrationActionUtility updateExtendedAttributesWithAction:managedObjectContext:fetchRequest:useObjectIDResumeMarker:error:](PLModelMigrationActionUtility, "updateExtendedAttributesWithAction:managedObjectContext:fetchRequest:useObjectIDResumeMarker:error:", self, v6, v11, 1, &v22);
  v20 = v22;
  -[PLModelMigrationActionBackground finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease(v20);

  return v19;
}

+ (int64_t)actionProgressWeight
{
  return 500;
}

@end
