@implementation PLModelMigrationAction_FixExtendedAttributeDateCreated

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int64_t v24;
  id v25;
  void *v27;
  PLModelMigrationAction_FixExtendedAttributeDateCreated *v28;
  void *v29;
  void *v31;
  id v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v28 = self;
  -[PLModelMigrationActionBackground resumeMarker](self, "resumeMarker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v5;
  PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("additionalAttributes.dateCreatedSource"), &unk_1E37630C8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v27;
  v12 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("extendedAttributes.dateCreated"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("additionalAttributes.dateCreatedSource"), &unk_1E37630E0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "orPredicateWithSubpredicates:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v18;
  v29 = (void *)v7;
  if (v7)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self >= %@"), v7);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v21);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSortDescriptors:", v23);

  v32 = 0;
  v24 = +[PLModelMigrationActionUtility updateExtendedAttributesWithAction:managedObjectContext:fetchRequest:useObjectIDResumeMarker:error:](PLModelMigrationActionUtility, "updateExtendedAttributesWithAction:managedObjectContext:fetchRequest:useObjectIDResumeMarker:error:", v28, v31, v10, 1, &v32);
  v25 = v32;
  -[PLModelMigrationActionBackground finalizeProgress](v28, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease(v25);

  return v24;
}

+ (int64_t)actionProgressWeight
{
  return 500;
}

@end
