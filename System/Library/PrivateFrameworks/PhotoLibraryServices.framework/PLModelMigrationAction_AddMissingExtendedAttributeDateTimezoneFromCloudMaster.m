@implementation PLModelMigrationAction_AddMissingExtendedAttributeDateTimezoneFromCloudMaster

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
  void *v24;
  void *v25;
  int64_t v26;
  id v27;
  id v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  PLModelMigrationAction_AddMissingExtendedAttributeDateTimezoneFromCloudMaster *v38;
  void *v39;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[4];

  v49[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v38 = self;
  -[PLModelMigrationActionBackground resumeMarker](self, "resumeMarker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v5;
  PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("additionalAttributes.dateCreatedSource"), &unk_1E375D140);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v37;
  v11 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("additionalAttributes.dateCreatedSource"), &unk_1E375D128);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v36;
  v12 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("extendedAttributes.dateCreated"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v35;
  v13 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("extendedAttributes.timezoneName"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v34;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("extendedAttributes.timezoneOffset"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "orPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v10;
  objc_msgSend(v10, "orPredicateWithSubpredicates:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v20;
  v39 = (void *)v7;
  if (v7)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self >= %@"), v7);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "andPredicateWithSubpredicates:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setPredicate:", v23);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setSortDescriptors:", v25);

  objc_msgSend(v42, "setFetchBatchSize:", 100);
  v43 = 0;
  v26 = +[PLModelMigrationActionUtility updateExtendedAttributesWithAction:managedObjectContext:fetchRequest:useObjectIDResumeMarker:error:](PLModelMigrationActionUtility, "updateExtendedAttributesWithAction:managedObjectContext:fetchRequest:useObjectIDResumeMarker:error:", v38, v41, v42, 1, &v43);
  v27 = v43;
  -[PLModelMigrationActionBackground finalizeProgress](v38, "finalizeProgress");
  v28 = v27;
  v29 = v28;
  if (v26 != 1 && a4)
    *a4 = objc_retainAutorelease(v28);

  return v26;
}

+ (int64_t)actionProgressWeight
{
  return 400;
}

@end
