@implementation PLDuplicateDetectorMetadata

- (PLDuplicateDetectorMetadata)initWithSourceOIDs:(id)a3
{
  id v5;
  PLDuplicateDetectorMetadata *v6;
  PLDuplicateDetectorMetadata *v7;
  NSSet *combinedLimitedSelectionIdentifiers;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLDuplicateDetectorMetadata;
  v6 = -[PLDuplicateDetectorMetadata init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceAssetOIDs, a3);
    combinedLimitedSelectionIdentifiers = v7->_combinedLimitedSelectionIdentifiers;
    v7->_combinedLimitedSelectionIdentifiers = 0;

  }
  return v7;
}

- (id)detectDuplicatesWithPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id *v15;
  BOOL v16;
  id v17;
  id obj;
  _QWORD v20[4];
  id v21;
  id v22;
  PLDuplicateDetectorMetadata *v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  id *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v6 = a3;
  v40 = 0;
  v41 = (id *)&v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__53671;
  v44 = __Block_byref_object_dispose__53672;
  v45 = 0;
  -[PLDuplicateDetectorMetadata _fingerprintRequestWithPhotoLibrary:](self, "_fingerprintRequestWithPhotoLibrary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateDetectorMetadata _fullSizePreviewFingerprintRequestWithPhotoLibrary:](self, "_fullSizePreviewFingerprintRequestWithPhotoLibrary:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__53671;
  v38 = __Block_byref_object_dispose__53672;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__53671;
  v32 = __Block_byref_object_dispose__53672;
  v33 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __70__PLDuplicateDetectorMetadata_detectDuplicatesWithPhotoLibrary_error___block_invoke;
  v20[3] = &unk_1E3670198;
  v9 = v6;
  v21 = v9;
  v25 = &v34;
  v10 = v7;
  v22 = v10;
  v23 = self;
  v26 = &v40;
  v27 = &v28;
  v11 = v8;
  v24 = v11;
  v12 = objc_msgSend(v9, "performBlockAndWait:", v20);
  if (!v35[5] || !v29[5])
  {
    v17 = v41[5];
    v14 = 0;
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v13 = (void *)MEMORY[0x19AEC1554](v12);
  -[PLDuplicateDetectorMetadata _generateDuplicateContainerFromResults:fullsizeFingerprintResults:](self, "_generateDuplicateContainerFromResults:fullsizeFingerprintResults:", v35[5], v29[5]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v41;
  obj = v41[5];
  v16 = -[PLDuplicateDetectorMetadata _postProcessDuplicateWithPhotoLibrary:resultContainer:error:](self, "_postProcessDuplicateWithPhotoLibrary:resultContainer:error:", v9, v14, &obj);
  objc_storeStrong(v15 + 5, obj);
  objc_autoreleasePoolPop(v13);
  v17 = v41[5];
  if (!v16 && a4)
  {
LABEL_5:
    v17 = objc_retainAutorelease(v17);
    *a4 = v17;
  }
LABEL_6:

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  return v14;
}

- (id)_generateDuplicateContainerFromResults:(id)a3 fullsizeFingerprintResults:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  PLDuplicateDetectorMetadata *v28;
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PLDuplicateDetectorMetadata _buildAdjustedFingerprintMapWithPrimaryStoreFullsizeFingerprintResults:mutableOIDFingerprintMap:filterOnCPLResourceType:](self, "_buildAdjustedFingerprintMapWithPrimaryStoreFullsizeFingerprintResults:mutableOIDFingerprintMap:filterOnCPLResourceType:", v7, v11, 2);
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PLDuplicateDetectorMetadata _buildAdjustedFingerprintMapWithPrimaryStoreFullsizeFingerprintResults:mutableOIDFingerprintMap:filterOnCPLResourceType:](self, "_buildAdjustedFingerprintMapWithPrimaryStoreFullsizeFingerprintResults:mutableOIDFingerprintMap:filterOnCPLResourceType:", v7, v12, 16);
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PLDuplicateDetectorMetadata _buildAdjustedFingerprintMapWithPrimaryStoreFullsizeFingerprintResults:mutableOIDFingerprintMap:filterOnCPLResourceType:](self, "_buildAdjustedFingerprintMapWithPrimaryStoreFullsizeFingerprintResults:mutableOIDFingerprintMap:filterOnCPLResourceType:", v7, v13, 6);
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __97__PLDuplicateDetectorMetadata__generateDuplicateContainerFromResults_fullsizeFingerprintResults___block_invoke;
  v24[3] = &unk_1E366C1B0;
  v25 = v12;
  v26 = v13;
  v27 = v11;
  v28 = self;
  v29 = v14;
  v16 = v14;
  v17 = v11;
  v18 = v13;
  v19 = v12;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v24);
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __97__PLDuplicateDetectorMetadata__generateDuplicateContainerFromResults_fullsizeFingerprintResults___block_invoke_37;
  v22[3] = &unk_1E36748F8;
  v20 = v8;
  v23 = v20;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v22);

  objc_autoreleasePoolPop(v9);
  return v20;
}

- (void)_buildAdjustedFingerprintMapWithPrimaryStoreFullsizeFingerprintResults:(id)a3 mutableOIDFingerprintMap:(id)a4 filterOnCPLResourceType:(unint64_t)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v7 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __151__PLDuplicateDetectorMetadata__buildAdjustedFingerprintMapWithPrimaryStoreFullsizeFingerprintResults_mutableOIDFingerprintMap_filterOnCPLResourceType___block_invoke;
  v9[3] = &unk_1E366C1D8;
  v10 = v7;
  v11 = a5;
  v8 = v7;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v9);

}

- (void)_addFingerprint:(id)a3 oid:(id)a4 map:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = a5;
  if (v10 && v7)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v10);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v10);
    }
    objc_msgSend(v9, "addObject:", v7);

  }
}

- (id)_fingerprintRequestWithPhotoLibrary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C97B48];
  v5 = a3;
  +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLDuplicateDetectorMetadata _predicateWithPhotoLibrary:](self, "_predicateWithPhotoLibrary:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPredicate:", v8);
  -[PLDuplicateDetectorMetadata _propertiesToFetch](self, "_propertiesToFetch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPropertiesToFetch:", v9);

  objc_msgSend(v7, "setResultType:", 2);
  v12[0] = CFSTR("asset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRelationshipKeyPathsForPrefetching:", v10);

  return v7;
}

- (id)_limitedSelectionPredicateWithPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSArray count](self->_sourceAssetOIDs, "count"))
  {
    -[PLDuplicateDetectorMetadata _combinedIdentifiersFromLimitedSelectionWithPhotoLibrary:](self, "_combinedIdentifiersFromLimitedSelectionWithPhotoLibrary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("originalStableHash"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("originatingAssetIdentifier"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "orPredicateWithSubpredicates:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)_fingerprintIsValidPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("originalStableHash"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("originatingAssetIdentifier"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_predicateWithPhotoLibrary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3528];
  v5 = a3;
  -[PLDuplicateDetectorMetadata _limitedSelectionPredicateWithPhotoLibrary:](self, "_limitedSelectionPredicateWithPhotoLibrary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  -[PLDuplicateDetectorMetadata _fingerprintIsValidPredicate](self, "_fingerprintIsValidPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  +[PLDuplicateDetector duplicateDetectorExcludeZeroByteFingerprintPredicateWithProperty:](PLDuplicateDetector, "duplicateDetectorExcludeZeroByteFingerprintPredicateWithProperty:", CFSTR("originalStableHash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  objc_msgSend(v5, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLDuplicateDetector duplicateDetectorProcessingFilterAssetsPredicateWithPrefix:processingType:pathManager:](PLDuplicateDetector, "duplicateDetectorProcessingFilterAssetsPredicateWithPrefix:processingType:pathManager:", CFSTR("asset"), 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_propertiesToFetch
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("asset");
  v3[1] = CFSTR("asset.kind");
  v3[2] = CFSTR("asset.adjustmentsState");
  v3[3] = CFSTR("originalStableHash");
  v3[4] = CFSTR("originatingAssetIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_fullSizePreviewFingerprintRequestWithPhotoLibrary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C97B48];
  v5 = a3;
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLDuplicateDetectorMetadata _fullSizePreviewPredicateWithPhotoLibrary:](self, "_fullSizePreviewPredicateWithPhotoLibrary:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPredicate:", v8);
  -[PLDuplicateDetectorMetadata _fullSizePropertiesToFetch](self, "_fullSizePropertiesToFetch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPropertiesToFetch:", v9);

  objc_msgSend(v7, "setResultType:", 2);
  v12[0] = CFSTR("asset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRelationshipKeyPathsForPrefetching:", v10);

  return v7;
}

- (id)_limitedSelectionFullSizePredicateWithPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSArray count](self->_sourceAssetOIDs, "count"))
  {
    -[PLDuplicateDetectorMetadata _combinedIdentifiersFromLimitedSelectionWithPhotoLibrary:](self, "_combinedIdentifiersFromLimitedSelectionWithPhotoLibrary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("fingerprint"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)MEMORY[0x1E0CB3528];
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("version"), 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_fullsizeFingerprintIsValidFullSizePredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("fingerprint"));
}

- (id)_fullSizePreviewPredicateWithPhotoLibrary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3528];
  v5 = a3;
  -[PLDuplicateDetectorMetadata _limitedSelectionFullSizePredicateWithPhotoLibrary:](self, "_limitedSelectionFullSizePredicateWithPhotoLibrary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  -[PLDuplicateDetectorMetadata _fullsizeFingerprintIsValidFullSizePredicate](self, "_fullsizeFingerprintIsValidFullSizePredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  +[PLDuplicateDetector duplicateDetectorExcludeZeroByteFingerprintPredicateWithProperty:](PLDuplicateDetector, "duplicateDetectorExcludeZeroByteFingerprintPredicateWithProperty:", CFSTR("fingerprint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  objc_msgSend(v5, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLDuplicateDetector duplicateDetectorProcessingFilterAssetsPredicateWithPrefix:processingType:pathManager:](PLDuplicateDetector, "duplicateDetectorProcessingFilterAssetsPredicateWithPrefix:processingType:pathManager:", CFSTR("asset"), 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_fullSizePropertiesToFetch
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("asset");
  v3[1] = CFSTR("asset.kind");
  v3[2] = CFSTR("asset.adjustmentsState");
  v3[3] = CFSTR("fingerprint");
  v3[4] = CFSTR("dataStoreSubtype");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_combinedIdentifiersFromLimitedSelectionWithPhotoLibrary:(id)a3
{
  NSSet *combinedLimitedSelectionIdentifiers;
  id v5;
  void *v6;
  void *v7;
  NSSet *v8;
  NSSet *v9;

  combinedLimitedSelectionIdentifiers = self->_combinedLimitedSelectionIdentifiers;
  if (!combinedLimitedSelectionIdentifiers)
  {
    v5 = a3;
    -[PLDuplicateDetectorMetadata _originalsIdentifiersFromLimitedSelectionWithPhotoLibrary:](self, "_originalsIdentifiersFromLimitedSelectionWithPhotoLibrary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDuplicateDetectorMetadata _fullsizeIdentifiersFromLimitedSelectionWithPhotoLibrary:](self, "_fullsizeIdentifiersFromLimitedSelectionWithPhotoLibrary:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setByAddingObjectsFromSet:", v7);
    v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v9 = self->_combinedLimitedSelectionIdentifiers;
    self->_combinedLimitedSelectionIdentifiers = v8;

    combinedLimitedSelectionIdentifiers = self->_combinedLimitedSelectionIdentifiers;
  }
  return combinedLimitedSelectionIdentifiers;
}

- (id)_originalsIdentifiersFromLimitedSelectionWithPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  PLDuplicateDetectorMetadata *v20;
  id v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C97B48];
  +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self.%K IN %@"), CFSTR("asset"), self->_sourceAssetOIDs);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  v22[0] = CFSTR("originalStableHash");
  v22[1] = CFSTR("originatingAssetIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPropertiesToFetch:", v9);

  objc_msgSend(v7, "setResultType:", 2);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSArray count](self->_sourceAssetOIDs, "count"));
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __89__PLDuplicateDetectorMetadata__originalsIdentifiersFromLimitedSelectionWithPhotoLibrary___block_invoke;
  v17[3] = &unk_1E3677998;
  v18 = v4;
  v19 = v7;
  v20 = self;
  v11 = v10;
  v21 = v11;
  v12 = v7;
  v13 = v4;
  objc_msgSend(v13, "performBlockAndWait:", v17);
  v14 = v21;
  v15 = v11;

  return v15;
}

- (id)_fullsizeIdentifiersFromLimitedSelectionWithPhotoLibrary:(id)a3
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
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  PLDuplicateDetectorMetadata *v25;
  id v26;
  const __CFString *v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C97B48];
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("dataStoreClassID"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("dataStoreSubtype"), &unk_1E3763C68);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v10;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("asset"), self->_sourceAssetOIDs);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v13);

  v27 = CFSTR("fingerprint");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPropertiesToFetch:", v14);

  objc_msgSend(v7, "setResultType:", 2);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSArray count](self->_sourceAssetOIDs, "count"));
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __88__PLDuplicateDetectorMetadata__fullsizeIdentifiersFromLimitedSelectionWithPhotoLibrary___block_invoke;
  v22[3] = &unk_1E3677998;
  v23 = v4;
  v24 = v7;
  v25 = self;
  v16 = v15;
  v26 = v16;
  v17 = v7;
  v18 = v4;
  objc_msgSend(v18, "performBlockAndWait:", v22);
  v19 = v26;
  v20 = v16;

  return v20;
}

- (BOOL)_postProcessDuplicateWithPhotoLibrary:(id)a3 resultContainer:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v41 = 0;
  v33 = v8;
  -[PLDuplicateDetectorMetadata _postProcessFetchMetadataWithPhotoLibrary:resultContainer:error:](self, "_postProcessFetchMetadataWithPhotoLibrary:resultContainer:error:", v8, v9, &v41);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v41;
  v12 = v11;
  v34 = (void *)v10;
  if (v10)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v14)
    {
      v30 = v9;
      v15 = *(_QWORD *)v38;
      v16 = v14;
      v31 = *(_QWORD *)v38;
      v32 = v13;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          +[PLDuplicateDetectorSortKey sortKey:reverse:](PLDuplicateDetectorSortKey, "sortKey:reverse:", CFSTR("duration"), 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __91__PLDuplicateDetectorMetadata__postProcessDuplicateWithPhotoLibrary_resultContainer_error___block_invoke;
          v35[3] = &unk_1E366C200;
          v20 = v34;
          v36 = v20;
          +[PLDuplicateDetectorPostProcessing postProcessDuplicateSubGroupWithResult:metadataMap:metadataKey:secondarySortKey:subGroupSplitDecisionBlock:](PLDuplicateDetectorPostProcessing, "postProcessDuplicateSubGroupWithResult:metadataMap:metadataKey:secondarySortKey:subGroupSplitDecisionBlock:", v18, v20, v19, 0, v35);

          objc_msgSend(v33, "pathManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = +[PLDuplicateProcessor sharedLibraryDedupeEnabledWithPathManager:](PLDuplicateProcessor, "sharedLibraryDedupeEnabledWithPathManager:", v21);

          if (v22)
          {
            +[PLDuplicateDetectorSortKey sortKey:reverse:](PLDuplicateDetectorSortKey, "sortKey:reverse:", CFSTR("kindSubtype"), 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLDuplicateDetectorSortKey sortKey:reverse:](PLDuplicateDetectorSortKey, "sortKey:reverse:", CFSTR("activeLibraryScopeParticipationState"), 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLDuplicateDetectorPostProcessing sharedLibraryLivePhotoPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap:](PLDuplicateDetectorPostProcessing, "sharedLibraryLivePhotoPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap:", v20);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLDuplicateDetectorPostProcessing postProcessDuplicateSubGroupWithResult:metadataMap:metadataKey:secondarySortKey:subGroupSplitDecisionBlock:](PLDuplicateDetectorPostProcessing, "postProcessDuplicateSubGroupWithResult:metadataMap:metadataKey:secondarySortKey:subGroupSplitDecisionBlock:", v18, v20, v23, v24, v25);

            +[PLDuplicateDetectorSortKey sortKey:reverse:](PLDuplicateDetectorSortKey, "sortKey:reverse:", CFSTR("activeLibraryScopeParticipationState"), 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLDuplicateDetectorSortKey sortKey:reverse:](PLDuplicateDetectorSortKey, "sortKey:reverse:", CFSTR("additionalAttributes.originalStableHash"), 0);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLDuplicateDetectorPostProcessing sharedLibraryRawPlusJPEGPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap:](PLDuplicateDetectorPostProcessing, "sharedLibraryRawPlusJPEGPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap:", v20);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v31;
            +[PLDuplicateDetectorPostProcessing postProcessDuplicateSubGroupWithResult:metadataMap:metadataKey:secondarySortKey:subGroupSplitDecisionBlock:](PLDuplicateDetectorPostProcessing, "postProcessDuplicateSubGroupWithResult:metadataMap:metadataKey:secondarySortKey:subGroupSplitDecisionBlock:", v18, v20, v26, v27, v28);

            v13 = v32;
          }
          objc_msgSend(v18, "compactSubGroups");

        }
        v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v16);

      v9 = v30;
    }
    else
    {

    }
  }
  else if (a5)
  {
    *a5 = objc_retainAutorelease(v11);
  }

  return v34 != 0;
}

- (id)_postProcessFetchMetadataWithPhotoLibrary:(id)a3 resultContainer:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  uint64_t v29;
  id v30;
  void *context;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  id v40;
  id v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v57 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "group");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "allObjects");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v15);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v11);
  }

  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__53671;
  v54 = __Block_byref_object_dispose__53672;
  v55 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__53671;
  v48 = __Block_byref_object_dispose__53672;
  v49 = 0;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __95__PLDuplicateDetectorMetadata__postProcessFetchMetadataWithPhotoLibrary_resultContainer_error___block_invoke;
  v39[3] = &unk_1E366F518;
  v39[4] = self;
  v16 = v9;
  v40 = v16;
  v17 = v7;
  v41 = v17;
  v42 = &v44;
  v43 = &v50;
  v18 = objc_msgSend(v17, "performBlockAndWait:", v39);
  v34 = v16;
  if (!v45[5])
  {
    v30 = (id)v51[5];
    v20 = 0;
LABEL_24:
    if (a5)
    {
      v30 = objc_retainAutorelease(v30);
      *a5 = v30;
    }
    goto LABEL_26;
  }
  context = (void *)MEMORY[0x19AEC1554](v18);
  v19 = objc_alloc(MEMORY[0x1E0C99E08]);
  v20 = (void *)objc_msgSend(v19, "initWithCapacity:", objc_msgSend((id)v45[5], "count"));
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v21 = (id)v45[5];
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v60, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v36 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("objectID"));
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)v26;
        if (v25)
          v28 = v26 == 0;
        else
          v28 = 1;
        if (!v28)
          objc_msgSend(v20, "setObject:forKey:", v25, v26);

      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v60, 16);
    }
    while (v22);
  }

  objc_autoreleasePoolPop(context);
  v29 = v45[5];
  v30 = (id)v51[5];
  if (!v29)
    goto LABEL_24;
LABEL_26:

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  return v20;
}

- (id)_postProcessingRequestWithDuplicateAssetOIDs:(id)a3 pathManager:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v22[4];
  _QWORD v23[2];
  _QWORD v24[3];
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C97B48];
  v6 = a4;
  v7 = a3;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v10);
  objc_msgSend(v9, "setResultType:", 2);
  v25[0] = CFSTR("additionalAttributes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v11);

  v24[0] = CFSTR("objectID");
  v24[1] = CFSTR("duration");
  v24[2] = CFSTR("kind");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = +[PLDuplicateProcessor sharedLibraryDedupeEnabledWithPathManager:](PLDuplicateProcessor, "sharedLibraryDedupeEnabledWithPathManager:", v6);

  if ((_DWORD)v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("packedBadgeAttributes"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", &unk_1E375F4C8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(MEMORY[0x1E0C97B30]);
    objc_msgSend(v15, "setName:", CFSTR("rjPacked"));
    v16 = (void *)MEMORY[0x1E0CB35D0];
    v23[0] = v13;
    v23[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "expressionForFunction:arguments:", CFSTR("bitwiseAnd:with:"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setExpression:", v18);

    objc_msgSend(v15, "setExpressionResultType:", 200);
    v22[0] = CFSTR("kindSubtype");
    v22[1] = CFSTR("activeLibraryScopeParticipationState");
    v22[2] = CFSTR("additionalAttributes.originalStableHash");
    v22[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v20;
  }
  objc_msgSend(v9, "setPropertiesToFetch:", v12);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedLimitedSelectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_sourceAssetOIDs, 0);
}

void __95__PLDuplicateDetectorMetadata__postProcessFetchMetadataWithPhotoLibrary_resultContainer_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  const __CFString *v21;
  id obj;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_postProcessingRequestWithDuplicateAssetOIDs:pathManager:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D732B0];
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startedQueryStatsWithContext:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v10 + 40);
  objc_msgSend(v9, "executeFetchRequest:error:", v5, &obj);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v10 + 40), obj);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  objc_msgSend(v8, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    PLDuplicateDetectionGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = v17;
      v25 = 2112;
      v26 = CFSTR("Post processing query");
      v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);

    }
  }

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    PLDuplicateDetectionGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v24 = v20;
      v25 = 2112;
      v26 = v21;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Duplicate Processing Detector: Failed to post processing fetch request for %{public}@. Error: %@", buf, 0x16u);

    }
  }

}

uint64_t __91__PLDuplicateDetectorMetadata__postProcessDuplicateWithPhotoLibrary_resultContainer_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kind"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shortValue");

  if (v9 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("duration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("duration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      v14 = objc_msgSend(v11, "isEqualToNumber:", v13) ^ 1;
    else
      v14 = v11 != 0;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __88__PLDuplicateDetectorMetadata__fullsizeIdentifiersFromLimitedSelectionWithPhotoLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D732B0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startedQueryStatsWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v18 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v6, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (__CFString *)v18;

  objc_msgSend(v4, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(v7, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    PLDuplicateDetectionGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v20 = v12;
      v21 = 2112;
      v22 = CFSTR("Fullsize fingerprints for Limited Selection query");
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);

    }
  }

  if (v7)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __88__PLDuplicateDetectorMetadata__fullsizeIdentifiersFromLimitedSelectionWithPhotoLibrary___block_invoke_69;
    v16[3] = &unk_1E3673250;
    v17 = *(id *)(a1 + 56);
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v16);
    v13 = v17;
  }
  else
  {
    PLDuplicateDetectionGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v15;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch full size identifiers for %{public}@. Error: %@", buf, 0x16u);

    }
  }

}

void __88__PLDuplicateDetectorMetadata__fullsizeIdentifiersFromLimitedSelectionWithPhotoLibrary___block_invoke_69(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "allValues");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

void __89__PLDuplicateDetectorMetadata__originalsIdentifiersFromLimitedSelectionWithPhotoLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D732B0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startedQueryStatsWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v18 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v6, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (__CFString *)v18;

  objc_msgSend(v4, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(v7, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    PLDuplicateDetectionGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v20 = v12;
      v21 = 2112;
      v22 = CFSTR("Master fingerprints for Limited Selection query");
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);

    }
  }

  if (v7)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __89__PLDuplicateDetectorMetadata__originalsIdentifiersFromLimitedSelectionWithPhotoLibrary___block_invoke_61;
    v16[3] = &unk_1E3673250;
    v17 = *(id *)(a1 + 56);
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v16);
    v13 = v17;
  }
  else
  {
    PLDuplicateDetectionGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v15;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch identifiers for %{public}@. Error: %@", buf, 0x16u);

    }
  }

}

void __89__PLDuplicateDetectorMetadata__originalsIdentifiersFromLimitedSelectionWithPhotoLibrary___block_invoke_61(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "allValues");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

void __151__PLDuplicateDetectorMetadata__buildAdjustedFingerprintMapWithPrimaryStoreFullsizeFingerprintResults_mutableOIDFingerprintMap_filterOnCPLResourceType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("fingerprint"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("asset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dataStoreSubtype"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  v7 = *(_QWORD *)(a1 + 40);

  if (v8 && v4 && v6 == v7)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v4);

}

void __97__PLDuplicateDetectorMetadata__generateDuplicateContainerFromResults_fullsizeFingerprintResults___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("asset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("asset.kind"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shortValue");

  if (v4)
  {
    if (v6 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v4);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v9;

      if (!v11)
      {
LABEL_18:
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("asset.adjustmentsState"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "unsignedShortValue");

        if (v16)
        {
          PLDuplicateDetectionGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("originalStableHash"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = 138543362;
            v20 = v18;
            _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "Adjusted asset missing full size render fingerprint. Original fingerprint: %{public}@", (uint8_t *)&v19, 0xCu);

          }
          v11 = 0;
        }
        else if (v6 != 1
               || (objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("originatingAssetIdentifier")),
                   (v11 = (id)objc_claimAutoreleasedReturnValue()) == 0))
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("originalStableHash"));
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (!v11)
        goto LABEL_18;
    }
    objc_msgSend(*(id *)(a1 + 56), "_addFingerprint:oid:map:", v11, v4, *(_QWORD *)(a1 + 64));
    goto LABEL_26;
  }
  if (v6 == 1
    && (objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("originatingAssetIdentifier")),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = v10;
    v12 = v11;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("originalStableHash"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("fingerprint"));
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v13;
    v11 = 0;
  }
  PLDuplicateDetectionGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v19 = 138543362;
    v20 = v12;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Fetch result had missing asset oid for identifier: %{public}@", (uint8_t *)&v19, 0xCu);
  }

LABEL_26:
}

void __97__PLDuplicateDetectorMetadata__generateDuplicateContainerFromResults_fullsizeFingerprintResults___block_invoke_37(uint64_t a1, uint64_t a2, void *a3)
{
  PLDuplicateGroup *v4;
  void *v5;
  PLDuplicateGroup *v6;
  id v7;

  v7 = a3;
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    v4 = [PLDuplicateGroup alloc];
    v5 = (void *)objc_msgSend(v7, "copy");
    v6 = -[PLDuplicateGroup initWithGroupResults:](v4, "initWithGroupResults:", v5);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }

}

void __70__PLDuplicateDetectorMetadata_detectDuplicatesWithPhotoLibrary_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  const __CFString *v30;
  id v31;
  id obj;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  NSObject *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D732B0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startedQueryStatsWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v5, "executeFetchRequest:error:", v6, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(v4, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    PLDuplicateDetectionGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v34 = v14;
      v35 = 2112;
      v36 = CFSTR("Main originals query");
      v37 = 2112;
      v38 = v11;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);

    }
  }

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v15 = (void *)MEMORY[0x1E0D732B0];
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startedQueryStatsWithContext:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 56);
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v31 = *(id *)(v20 + 40);
    objc_msgSend(v18, "executeFetchRequest:error:", v19, &v31);
    v21 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v20 + 40), v31);
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

    objc_msgSend(v17, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "count"));
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      PLDuplicateDetectionGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v34 = v27;
        v35 = 2112;
        v36 = CFSTR("Main fullsize query");
        v37 = 2112;
        v38 = v24;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);

      }
    }
  }
  else
  {
    PLDuplicateDetectionGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v34 = v29;
      v35 = 2112;
      v36 = v30;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Failed to fetch request for %{public}@. Error: %@", buf, 0x16u);

    }
    v17 = v4;
  }

}

@end
