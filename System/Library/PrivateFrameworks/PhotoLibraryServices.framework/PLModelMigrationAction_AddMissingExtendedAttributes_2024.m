@implementation PLModelMigrationAction_AddMissingExtendedAttributes_2024

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int64_t v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v14[5];
  id v15;

  v6 = a3;
  -[PLModelMigrationAction_AddMissingExtendedAttributes_2024 requestWithManagedObjectContext:](self, "requestWithManagedObjectContext:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = self;
  v15 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __104__PLModelMigrationAction_AddMissingExtendedAttributes_2024_performActionWithManagedObjectContext_error___block_invoke;
  v14[3] = &unk_1E36696F8;
  v8 = +[PLModelMigrationActionUtility processAssetWithAction:managedObjectContext:fetchRequest:useObjectIDResumeMarker:error:processingBlock:](PLModelMigrationActionUtility, "processAssetWithAction:managedObjectContext:fetchRequest:useObjectIDResumeMarker:error:processingBlock:", self, v6, v7, 1, &v15, v14);

  v9 = v15;
  -[PLModelMigrationActionBackground finalizeProgress](self, "finalizeProgress");
  v10 = v9;
  v11 = v10;
  if (v8 != 1 && a4 != 0)
    *a4 = objc_retainAutorelease(v10);

  return v8;
}

- (void)updateSleetPropertiesForAsset:(id)a3 metadata:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v5 = a4;
  if (!objc_msgSend(v15, "currentSleetCast"))
  {
    if (objc_msgSend(v15, "hasAdjustments"))
      objc_msgSend(v15, "updateAssetSleetCastIfNeededFromAdjustmentFile");
    else
      objc_msgSend(v15, "setCurrentSleetCastFromMetadata:", v5);
  }
  if (!objc_msgSend(v15, "kind"))
  {
    objc_msgSend(v15, "additionalAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "sleetIsReversible");

    if (v7 != 1)
    {
      objc_msgSend(v15, "extendedAttributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sleetCast");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "integerValue");

      if (v10 >= 1)
      {
        objc_msgSend(v5, "smartStyleIsReversible");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          objc_msgSend(v15, "primaryStoreOriginalResource");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "uniformTypeIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "conformsToHEIF"))
          {
            objc_msgSend(v15, "additionalAttributes");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setSleetIsReversible:", 1);

          }
        }
      }
    }
  }

}

- (void)updateSpatialPropertiesForAsset:(id)a3 metadata:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (!objc_msgSend(v8, "kind"))
  {
    if ((objc_msgSend(v8, "hasAdjustments") & 1) != 0)
    {
      objc_msgSend(v8, "fullSizeResourceMetadataFromMediaPropertiesOrFullSizeResourceOrOptionalURL:", 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = v5;
    }
    v7 = v6;
    if (objc_msgSend(v8, "hasAdjustments") && !v7)
      v7 = v5;
    objc_msgSend(v8, "setSpatialTypeFromMetadata:", v7);

  }
}

- (id)requestWithManagedObjectContext:(id)a3
{
  id v4;
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
  void *v19;
  _QWORD v21[4];
  void *v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLModelMigrationActionBackground resumeMarker](self, "resumeMarker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3528];
  v11 = (void *)MEMORY[0x1E0CB3880];
  -[PLModelMigrationAction_AddMissingExtendedAttributes_2024 startDate](self, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("dateCreated"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  if (v6)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self >= %@"), v6);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v16);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSortDescriptors:", v18);

  v21[0] = CFSTR("master.mediaMetadata");
  v21[1] = CFSTR("additionalAttributes.mediaMetadata");
  v21[2] = CFSTR("modernResources");
  v21[3] = CFSTR("extendedAttributes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v19);

  return v9;
}

- (id)startDate
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v2, "setDay:", 1);
  objc_msgSend(v2, "setMonth:", 1);
  objc_msgSend(v2, "setYear:", 2024);
  v3 = objc_alloc(MEMORY[0x1E0C99D48]);
  v4 = (void *)objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v4, "dateFromComponents:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (int64_t)actionProgressWeight
{
  return 500;
}

@end
