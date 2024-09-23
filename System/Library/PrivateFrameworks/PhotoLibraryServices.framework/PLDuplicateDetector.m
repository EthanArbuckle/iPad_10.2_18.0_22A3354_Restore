@implementation PLDuplicateDetector

+ (id)duplicateDetectorProcessingFilterAssetsPredicateWithPrefix:(id)a3 processingType:(unint64_t)a4 pathManager:(id)a5
{
  id v8;
  _BOOL4 v9;
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
  _QWORD v21[8];

  v21[7] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = +[PLDuplicateProcessor sharedLibraryDedupeEnabledWithPathManager:](PLDuplicateProcessor, "sharedLibraryDedupeEnabledWithPathManager:", a5);
  v10 = (void *)MEMORY[0x1E0CB3528];
  if (v9)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K.%K) = %d"), v8, CFSTR("activeLibraryScopeParticipationState"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  objc_msgSend(a1, "duplicateDetectorFilterProcessingStateWithPrefix:processingType:", v8, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v12;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K.%K) = %d"), v8, CFSTR("trashedState"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v13;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K.%K) = NO"), v8, CFSTR("hidden"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v14;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K.%K) != %d"), v8, CFSTR("avalancheKind"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v15;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K.%K) != %d"), v8, CFSTR("cloudLocalState"), 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v16;
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:keyPathPrefix:", objc_msgSend(MEMORY[0x1E0D73310], "maskForDuplicateProcessingExclusions"), 0, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)duplicateDetectorExcludeZeroByteFingerprintPredicateWithProperty:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0D11398];
  v4 = a3;
  objc_msgSend(v3, "defaultFingerprintSchemeForUnknownRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zeroByteFileFingerprint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)duplicateDetectorFilterProcessingStateWithPrefix:(id)a3 processingType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  uint8_t buf[4];
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  v8 = 0;
  switch(a4)
  {
    case 0uLL:
    case 4uLL:
    case 7uLL:
      PLDuplicateDetectionGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v15 = a4;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Requesting predicate for unsupported detector type: %tu", buf, 0xCu);
      }

      goto LABEL_5;
    case 1uLL:
LABEL_5:
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2uLL:
      v12 = (void *)MEMORY[0x1E0CB3880];
      if (v6)
      {
        objc_msgSend(a1, "predicateFormatToPrependAssetAttributeSubstitutionWithPrefix:", v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "predicateWithFormat:", CFSTR("noindex:(%K.%K) == %ld"), v13, CFSTR("duplicateDetectorPerceptualProcessingState"), 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K.%K) == %ld"), CFSTR("additionalAttributes"), CFSTR("duplicateDetectorPerceptualProcessingState"), 0);
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
        v8 = (void *)v10;
      }
LABEL_7:

      return v8;
    default:
      goto LABEL_7;
  }
}

+ (id)predicateFormatToPrependAssetAttributeSubstitutionWithPrefix:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("additionalAssetAttributes"));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(".%@"), CFSTR("additionalAttributes"));
  else
    objc_msgSend(v3, "substringToIndex:", v4 + v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)duplicateDetectorCompletedDateBackgroundMigrationAction:(id)a3
{
  id v3;
  BOOL v4;
  uint64_t v6;
  void *v7;

  v3 = a3;
  if ((MEMORY[0x19AEC0720]() & 1) != 0 || (PLIsInternalTool() & 1) != 0)
  {
    v4 = 1;
  }
  else if (PLIsAssetsd())
  {
    v6 = objc_opt_class();
    objc_msgSend(v3, "pathManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[PLBackgroundModelMigration hasCompletedBackgroundActionClass:pathManager:](PLBackgroundModelMigration, "hasCompletedBackgroundActionClass:pathManager:", v6, v7);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)duplicateDetectorCompletedPerceptualHashProcessingWithManagedObjectContext:(id)a3 pathManager:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
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
  id v21;
  void *v22;
  int v23;
  BOOL v24;
  NSObject *v25;
  id v27;
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  id v31;
  void *v32;
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0C97B48];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithEntityName:", v10);

  v12 = (void *)MEMORY[0x1E0CB3528];
  +[PLDuplicateDetector duplicateDetectorProcessingFilterAssetsPredicateWithPrefix:processingType:pathManager:](PLDuplicateDetector, "duplicateDetectorProcessingFilterAssetsPredicateWithPrefix:processingType:pathManager:", CFSTR("asset"), 2, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = v13;
  +[PLManagedAsset predicateToExcludeAssetsMissingMasterThumbnailsWithThumbnailIndexKeyPath:](PLManagedAsset, "predicateToExcludeAssetsMissingMasterThumbnailsWithThumbnailIndexKeyPath:", CFSTR("asset.thumbnailIndex"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v14;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K.%K) = %d"), CFSTR("asset"), CFSTR("kind"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v17);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("sceneAnalysisVersion"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSortDescriptors:", v19);

  objc_msgSend(v11, "setFetchLimit:", 1);
  v27 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v11, &v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v27;
  if (!v20)
  {
    PLDuplicateDetectionGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v29 = CFSTR("sceneAnalysisVersion");
      v30 = 2112;
      v31 = v21;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Failed to fetch %{public}@ min value. Error: %@", buf, 0x16u);
    }

    goto LABEL_7;
  }
  if (!objc_msgSend(v20, "count"))
  {
LABEL_7:
    v24 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "sceneAnalysisVersion");

  v24 = v23 == objc_msgSend(a1, "currentSceneAnalysisUmbrellaVersion");
LABEL_8:

  return v24;
}

+ (signed)currentSceneAnalysisUmbrellaVersion
{
  return 100;
}

@end
