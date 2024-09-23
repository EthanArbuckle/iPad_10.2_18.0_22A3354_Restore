@implementation PLPTPFetches

+ (id)fetchObjectIDsForAssetsExposedToPTPFromObjectIDs:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "fetchObjectIDsForAssetsExposedToPTPFromObjectIDs:inLibrary:isCloudPhotoLibraryEnabled:", v7, v6, objc_msgSend(v6, "isCloudPhotoLibraryEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)fetchAssetIdsToExcludeFromPTPInContext:(id)a3 isCloudPhotoLibraryEnabled:(BOOL)a4
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
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  const __CFString *v27;
  id v28;
  uint8_t buf[4];
  id v30;
  _QWORD v31[4];
  const __CFString *v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v4 = a3;
    +[PLInternalResource entityName](PLInternalResource, "entityName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLFetchRequest fetchRequestWithEntityName:](PLFetchRequest, "fetchRequestWithEntityName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v34[0] = CFSTR("asset");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPropertiesToGroupBy:", v7);

    v33 = CFSTR("asset");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPropertiesToFetch:", v8);

    objc_msgSend(v6, "setResultType:", 2);
    v32 = CFSTR("asset");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRelationshipKeyPathsForPrefetching:", v9);

    objc_msgSend(v6, "setPl_importantFetchName:", CFSTR("fetchAllObjectIDsForAssetsExposedToPTP"));
    v10 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("dataStoreClassID"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v11;
    v12 = (void *)MEMORY[0x1E0CB3880];
    +[PLInternalResource originalCPLResourceTypesForMaster](PLInternalResource, "originalCPLResourceTypesForMaster");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("dataStoreSubtype"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v14;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("version"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v15;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K <= %d"), CFSTR("localAvailability"), 0xFFFFFFFFLL);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "andPredicateWithSubpredicates:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setPredicate:", v18);
    v28 = 0;
    objc_msgSend(v4, "executeFetchRequest:error:", v6, &v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v28;
    if (v19)
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __82__PLPTPFetches_fetchAssetIdsToExcludeFromPTPInContext_isCloudPhotoLibraryEnabled___block_invoke;
      v26[3] = &unk_1E36635F0;
      v27 = CFSTR("asset");
      objc_msgSend(v19, "_pl_map:", v26);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v27;
    }
    else
    {
      PLPTPGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v20;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Error fetching assets from the database: %@", buf, 0xCu);
      }
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }
  if (v21)
    v23 = v21;
  else
    v23 = (void *)MEMORY[0x1E0C9AA60];
  v24 = v23;

  return v24;
}

+ (id)predicateForAssetsExposedByPHPTPExcludingObjectIDs:(id)a3
{
  void *v3;
  void *v4;
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
  uint64_t v17;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) == %d"), CFSTR("visibilityState"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v20;
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForUserLibrary"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v5;
  +[PLManagedAsset predicateForAvalancheKindAssetsWithKind:](PLManagedAsset, "predicateForAvalancheKindAssetsWithKind:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("trashedState"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v9;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != 0"), CFSTR("complete"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v10;
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForSuppressPtpInfo"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "count"))
  {
    v14 = (void *)MEMORY[0x1E0CB3528];
    v22[0] = v13;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT self IN %@"), v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "andPredicateWithSubpredicates:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v17;
  }

  return v13;
}

+ (id)fetchObjectIDsForAssetsExposedToPTPFromObjectIDs:(id)a3 inLibrary:(id)a4 isCloudPhotoLibraryEnabled:(BOOL)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  id v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPTPFetches.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary != nil"));

  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__13229;
  v25 = __Block_byref_object_dispose__13230;
  v26 = 0;
  objc_msgSend(v10, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __102__PLPTPFetches_fetchObjectIDsForAssetsExposedToPTPFromObjectIDs_inLibrary_isCloudPhotoLibraryEnabled___block_invoke;
  v16[3] = &unk_1E3663618;
  v19 = a1;
  v12 = v11;
  v20 = a5;
  v17 = v12;
  v18 = &v21;
  objc_msgSend(v12, "performBlockAndWait:", v16);
  v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __102__PLPTPFetches_fetchObjectIDsForAssetsExposedToPTPFromObjectIDs_inLibrary_isCloudPhotoLibraryEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(*(id *)(a1 + 48), "fetchAssetIdsToExcludeFromPTPInContext:isCloudPhotoLibraryEnabled:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "predicateForAssetsExposedByPHPTPExcludingObjectIDs:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLFetchRequest fetchRequestWithEntityName:](PLFetchRequest, "fetchRequestWithEntityName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPredicate:", v4);
  objc_msgSend(v6, "setResultType:", 1);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v8);

  v9 = *(void **)(a1 + 32);
  v15 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v6, &v15);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v15;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v10;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    PLPTPGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Error fetching assets from the database: %@", buf, 0xCu);
    }

  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __82__PLPTPFetches_fetchAssetIdsToExcludeFromPTPInContext_isCloudPhotoLibraryEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
}

@end
