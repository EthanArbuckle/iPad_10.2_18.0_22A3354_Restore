@implementation PSIMemoryTranslator

+ (id)psiCollectionFromMemory:(id)a3 indexingContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char valid;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  PSIDate *v17;
  PSIDate *v18;
  PSICollection *v19;
  void *v20;
  void *v21;
  PSICollection *v22;
  PSICollection *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  valid = PLIsValidUUIDString();

  if ((valid & 1) != 0)
  {
    objc_msgSend(v7, "calendar");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_psiAssetForMemory:calendar:", v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v6, "curatedAssets");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      objc_msgSend(v6, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E36789C0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_startDateForMemory:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_endDateForMemory:", v6);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v7;
      v17 = -[PSIDate initWithUniversalDate:calendar:]([PSIDate alloc], "initWithUniversalDate:calendar:", v16, v10);
      v18 = -[PSIDate initWithUniversalDate:calendar:]([PSIDate alloc], "initWithUniversalDate:calendar:", v28, v10);
      v19 = [PSICollection alloc];
      objc_msgSend(v6, "uuid");
      v20 = v11;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v19;
      v7 = v29;
      v23 = -[PSICollection initWithUUID:startDate:endDate:title:subtitle:keyAssetPrivate:keyAssetShared:type:assetsCountPrivate:assetsCountShared:sortDate:](v22, "initWithUUID:startDate:endDate:title:subtitle:keyAssetPrivate:keyAssetShared:type:assetsCountPrivate:assetsCountShared:sortDate:", v21, v17, v18, v15, 0, v20, 0, 2, v13, v13, v16);

      v11 = v20;
      -[PSIObject addContentString:category:owningCategory:](v23, "addContentString:category:owningCategory:", v15, 1401, 0);

    }
    else
    {
      PLSearchBackendModelTranslationGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "uuid");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v31 = v26;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "No key asset found for Memory. Not translating Memory: %@", buf, 0xCu);

      }
      v23 = 0;
    }

  }
  else
  {
    PLSearchBackendModelTranslationGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v24;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Invalid Memory UUID: %{public}@. Not inserting Memory into PSI.", buf, 0xCu);

    }
    v23 = 0;
  }

  return v23;
}

+ (id)_psiAssetForMemory:(id)a3 calendar:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PSIAsset *v10;
  PSIDate *v11;

  v5 = a4;
  objc_msgSend(a3, "keyAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateCreated");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length") || v9)
    {
      v11 = -[PSIDate initWithUniversalDate:calendar:]([PSIDate alloc], "initWithUniversalDate:calendar:", v9, v5);
      v10 = -[PSIAsset initWithUUID:creationDate:]([PSIAsset alloc], "initWithUUID:creationDate:", v8, v11);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_startDateForMemory:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_fetchCuratedAssetsForMemory:sortedAscending:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateCreated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_endDateForMemory:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_fetchCuratedAssetsForMemory:sortedAscending:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateCreated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_fetchCuratedAssetsForMemory:(id)a3 sortedAscending:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
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
  uint64_t v17;
  _QWORD v18[2];

  v4 = a4;
  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C97B48];
  v6 = a3;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPropertiesToFetch:", &unk_1E37639F8);
  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v6, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("memoriesBeingCuratedAssets CONTAINS %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v11);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v13);

  objc_msgSend(v8, "setFetchLimit:", 1);
  objc_msgSend(v6, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  objc_msgSend(v14, "executeFetchRequest:error:", v8, &v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
