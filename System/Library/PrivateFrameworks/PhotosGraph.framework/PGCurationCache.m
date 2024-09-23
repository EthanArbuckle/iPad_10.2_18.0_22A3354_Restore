@implementation PGCurationCache

+ (id)defaultCacheName
{
  return CFSTR("PGCurationCache.sqlite");
}

- (id)dataModelName
{
  return CFSTR("PGCurationCache");
}

- (void)setCuratedKeyAsset:(id)a3 forMoment:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "assetCollectionType") == 3)
  {
    objc_msgSend(v8, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCurationCache _setCuratedKeyAsset:forMomentUUID:options:](self, "_setCuratedKeyAsset:forMomentUUID:options:", v11, v10, v9);

  }
}

- (void)setCuratedAssets:(id)a3 forMoment:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "assetCollectionType") == 3)
  {
    objc_msgSend(v8, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCurationCache _setCuratedAssets:forMomentUUID:options:](self, "_setCuratedAssets:forMomentUUID:options:", v11, v10, v9);

  }
}

- (id)curatedAssetIdentifiersForMoment:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "assetCollectionType") == 3)
  {
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCurationCache _curatedAssetIdentifiersforMomentUUID:options:](self, "_curatedAssetIdentifiersforMomentUUID:options:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)curatedKeyAssetIdentifierForMoment:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "assetCollectionType") == 3)
  {
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCurationCache _curatedKeyAssetIdentifierforMomentUUID:options:](self, "_curatedKeyAssetIdentifierforMomentUUID:options:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_curatedAssetIdentifiersforMomentUUID:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v19;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5321;
  v27 = __Block_byref_object_dispose__5322;
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(moment.identifier == %@) AND (duration == %lld)"), v6, objc_msgSend(v7, "duration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __65__PGCurationCache__curatedAssetIdentifiersforMomentUUID_options___block_invoke;
  v20[3] = &unk_1E8428430;
  v20[4] = self;
  v10 = v8;
  v21 = v10;
  v22 = &v23;
  objc_msgSend(v9, "performBlockAndWait:", v20);

  if (v24[5])
  {
    v11 = (void *)MEMORY[0x1E0CB3710];
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v24[5];
    v19 = 0;
    objc_msgSend(v11, "unarchivedObjectOfClasses:fromData:error:", v14, v15, &v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v19;

    if (!v16 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v17;
      _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error unarchiving blobIdentifiers: %@", buf, 0xCu);
    }

  }
  else
  {
    v16 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v16;
}

- (void)_setCuratedAssets:(id)a3 forMomentUUID:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "valueForKey:", CFSTR("uuid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "duration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("curatedAssets");
  v17[0] = v12;
  v13 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("duration == %lld"), objc_msgSend(v8, "duration"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCurationCache _setProperties:forCurationObjectWithEntityName:momentUUID:predicate:](self, "_setProperties:forCurationObjectWithEntityName:momentUUID:predicate:", v14, CFSTR("CuratedAssets"), v9, v15);

}

- (id)_curatedKeyAssetIdentifierforMomentUUID:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v28;
  _QWORD v29[5];
  id v30;
  void **v31;
  void *v32;
  void **v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _QWORD v38[4];

  v38[2] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v5 = a4;
  objc_msgSend(v5, "referenceAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "localIdentifier");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("base");
  }

  objc_msgSend(v5, "referenceLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coordinate");
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f,%f"), v10, v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("base");
  }

  objc_msgSend(v5, "referencePersonLocalIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", 0, 1, sel_compare_);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sortedArrayUsingDescriptors:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR("_"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("base");
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(complete == %d) AND \t\t\t\t\t\t\t  (focusOnPeople == %d) AND \t\t\t\t\t\t\t  (useSummarizer == %d) AND \t\t\t\t\t\t\t  (prefilterAssetsWithFaces == %d) AND \t\t\t\t\t\t\t  (referenceAsset == %@) AND \t\t\t\t\t\t\t  (referenceLocation == %@) AND \t\t\t\t\t\t\t  (referencePeople == %@) AND \t\t\t\t\t\t\t  (useContextualCurationOnly == %d)"), objc_msgSend(v5, "complete"), objc_msgSend(v5, "focusOnPeople"), objc_msgSend(v5, "useSummarizer"), objc_msgSend(v5, "prefilterAssetsWithFaces"), v8, v12, v17, objc_msgSend(v5, "useContextualCurationOnly"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(moment.identifier == %@)"), v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CB3528];
  v38[0] = v19;
  v38[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "andPredicateWithSubpredicates:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__5321;
  v36 = __Block_byref_object_dispose__5322;
  v37 = 0;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __67__PGCurationCache__curatedKeyAssetIdentifierforMomentUUID_options___block_invoke;
  v29[3] = &unk_1E8428430;
  v29[4] = self;
  v24 = v22;
  v30 = v24;
  v31 = &v32;
  objc_msgSend(v23, "performBlockAndWait:", v29);

  v25 = v33[5];
  _Block_object_dispose(&v32, 8);

  return v25;
}

- (void)_setCuratedKeyAsset:(id)a3 forMomentUUID:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  void *v42;
  __CFString *v43;
  __CFString *v44;
  id v45;
  __CFString *v46;
  _QWORD v48[9];
  _QWORD v49[9];
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v45 = a4;
  v8 = a3;
  objc_msgSend(v7, "referenceAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "localIdentifier");
    v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("base");
  }

  objc_msgSend(v7, "referenceLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "coordinate");
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f,%f"), v13, v14);
    v15 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = CFSTR("base");
  }

  objc_msgSend(v7, "referencePersonLocalIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", 0, 1, sel_compare_);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sortedArrayUsingDescriptors:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v19, "componentsJoinedByString:", CFSTR("_"));
    v20 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = CFSTR("base");
  }

  v48[0] = CFSTR("referenceAsset");
  v48[1] = CFSTR("referenceLocation");
  v46 = (__CFString *)v11;
  v49[0] = v11;
  v49[1] = v15;
  v43 = (__CFString *)v20;
  v44 = (__CFString *)v15;
  v49[2] = v20;
  v48[2] = CFSTR("referencePeople");
  v48[3] = CFSTR("complete");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "complete"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v21;
  v48[4] = CFSTR("focusOnPeople");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "focusOnPeople"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v22;
  v48[5] = CFSTR("useSummarizer");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "useSummarizer"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v23;
  v48[6] = CFSTR("useContextualCurationOnly");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "useContextualCurationOnly"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v24;
  v48[7] = CFSTR("prefilterAssetsWithFaces");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "prefilterAssetsWithFaces"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v25;
  v48[8] = CFSTR("curatedKeyAsset");
  objc_msgSend(v8, "localIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v26;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v49[8] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)

  v29 = v7;
  objc_msgSend(v29, "referenceAsset");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    objc_msgSend(v30, "localIdentifier");
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = CFSTR("base");
  }

  objc_msgSend(v29, "referenceLocation");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "coordinate");
  if (v33)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f,%f"), v34, v35);
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = CFSTR("base");
  }

  objc_msgSend(v29, "referencePersonLocalIdentifiers");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", 0, 1, sel_compare_);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "sortedArrayUsingDescriptors:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v40, "count"))
  {
    objc_msgSend(v40, "componentsJoinedByString:", CFSTR("_"));
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = CFSTR("base");
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(complete == %d) AND \t\t\t\t\t\t\t  (focusOnPeople == %d) AND \t\t\t\t\t\t\t  (useSummarizer == %d) AND \t\t\t\t\t\t\t  (prefilterAssetsWithFaces == %d) AND \t\t\t\t\t\t\t  (referenceAsset == %@) AND \t\t\t\t\t\t\t  (referenceLocation == %@) AND \t\t\t\t\t\t\t  (referencePeople == %@) AND \t\t\t\t\t\t\t  (useContextualCurationOnly == %d)"), objc_msgSend(v29, "complete"), objc_msgSend(v29, "focusOnPeople"), objc_msgSend(v29, "useSummarizer"), objc_msgSend(v29, "prefilterAssetsWithFaces"), v32, v36, v41, objc_msgSend(v29, "useContextualCurationOnly"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGCurationCache _setProperties:forCurationObjectWithEntityName:momentUUID:predicate:](self, "_setProperties:forCurationObjectWithEntityName:momentUUID:predicate:", v28, CFSTR("CuratedKeyAsset"), v45, v42);
}

- (id)_fetchCurationObjectForEntityName:(id)a3 predicate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  PGCurationCache *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5321;
  v22 = __Block_byref_object_dispose__5322;
  v23 = 0;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__PGCurationCache__fetchCurationObjectForEntityName_predicate___block_invoke;
  v13[3] = &unk_1E8428458;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v16 = self;
  v17 = &v18;
  objc_msgSend(v8, "performBlockAndWait:", v13);

  v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (void)_setProperties:(id)a3 forCurationObjectWithEntityName:(id)a4 momentUUID:(id)a5 predicate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __87__PGCurationCache__setProperties_forCurationObjectWithEntityName_momentUUID_predicate___block_invoke;
  v19[3] = &unk_1E842C0C0;
  v19[4] = self;
  v20 = v12;
  v21 = v11;
  v22 = v13;
  v23 = v10;
  v15 = v10;
  v16 = v13;
  v17 = v11;
  v18 = v12;
  objc_msgSend(v14, "performBlockAndWait:", v19);

}

- (void)_invalidateCacheForMomentWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PGCurationCache *v9;

  v4 = a3;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PGCurationCache__invalidateCacheForMomentWithUUID___block_invoke;
  v7[3] = &unk_1E8433828;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v7);

}

- (void)_invalidateCacheForMomentsWithUUIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PGCurationCache *v9;

  v4 = a3;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__PGCurationCache__invalidateCacheForMomentsWithUUIDs___block_invoke;
  v7[3] = &unk_1E8433828;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v7);

}

void __55__PGCurationCache__invalidateCacheForMomentsWithUUIDs___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[8];
  id v11;

  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Moment"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("identifier IN %@"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v2);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = (id)objc_msgSend(v5, "executeRequest:error:", v4, &v11);
  v7 = v11;

  objc_msgSend(*(id *)(a1 + 40), "_save");
  if (v7)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v9, OS_LOG_TYPE_ERROR, "Failed to invalidate curation cache for multiple moments.", buf, 2u);
    }

  }
}

void __53__PGCurationCache__invalidateCacheForMomentWithUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Moment"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(identifier == %@)"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v22;

  if (v5)
  {
    v16 = v6;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
          objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "deleteObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v9);
    }

    objc_msgSend(*(id *)(a1 + 40), "_save");
    v6 = v16;
  }
  else if (v6)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "loggingConnection");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v15, OS_LOG_TYPE_ERROR, "Failed to invalidate curation cache for moment", buf, 2u);
    }

  }
}

void __87__PGCurationCache__setProperties_forCurationObjectWithEntityName_momentUUID_predicate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Moment"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("identifier == %@"), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchLimit:", 1);
  objc_msgSend(v3, "setPredicate:", v4);
  v25 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v25;
  if (v5 && objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFetchLimit:", 1);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("moment == %@"), v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3528];
    v11 = *(_QWORD *)(a1 + 56);
    v21 = (void *)v9;
    v26[0] = v9;
    v26[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "andPredicateWithSubpredicates:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v13;
    objc_msgSend(v8, "setPredicate:", v13);
    v24 = v6;
    objc_msgSend(v2, "executeFetchRequest:error:", v8, &v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v24;

    if (v14 && objc_msgSend(v14, "count") == 1)
    {
      objc_msgSend(v14, "objectAtIndex:", 0);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", *(_QWORD *)(a1 + 48), v2);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v15;

    v6 = v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("Moment"), v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", *(_QWORD *)(a1 + 40), CFSTR("identifier"));
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", *(_QWORD *)(a1 + 48), v2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "setValue:forKey:", v7, CFSTR("moment"));
  v17 = *(void **)(a1 + 64);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __87__PGCurationCache__setProperties_forCurationObjectWithEntityName_momentUUID_predicate___block_invoke_2;
  v22[3] = &unk_1E842B620;
  v23 = v16;
  v18 = v16;
  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v22);
  objc_msgSend(*(id *)(a1 + 32), "_save");

}

void __87__PGCurationCache__setProperties_forCurationObjectWithEntityName_momentUUID_predicate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v5 = (void *)MEMORY[0x1E0C99E38];
  v6 = a2;
  objc_msgSend(v5, "null");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v9)
    v8 = 0;
  else
    v8 = v9;
  objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v8, v6);

}

void __63__PGCurationCache__fetchCurationObjectForEntityName_predicate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFetchLimit:", 1);
  objc_msgSend(v2, "setPredicate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;

  if (v4 && objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __67__PGCurationCache__curatedKeyAssetIdentifierforMomentUUID_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_fetchCurationObjectForEntityName:predicate:", CFSTR("CuratedKeyAsset"), *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("curatedKeyAsset"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __65__PGCurationCache__curatedAssetIdentifiersforMomentUUID_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_fetchCurationObjectForEntityName:predicate:", CFSTR("CuratedAssets"), *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("curatedAssets"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
