@implementation PLSceneClassification

+ (id)entityName
{
  return CFSTR("SceneClassification");
}

- (id)debugLogDescription
{
  void *v3;
  int v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSRect v11;

  -[PLSceneClassification packedBoundingBoxRect](self, "packedBoundingBoxRect");
  PLSplitToCGRectFromInt64();
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[PLSceneClassification classificationType](self, "classificationType");
  v5 = -[PLSceneClassification sceneIdentifier](self, "sceneIdentifier");
  -[PLSceneClassification confidence](self, "confidence");
  v7 = v6;
  v11.origin = 0u;
  v11.size = 0u;
  NSStringFromRect(v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PLSceneClassification: sceneClassificationType: %d, sceneID: %lld, confidence: %f, boundingBox: %@"), v4, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_validateInterpropertyValues:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[PLSceneClassification objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", CFSTR("assetAttributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
    goto LABEL_4;
  -[PLSceneClassification objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", CFSTR("assetAttributesForTemporalSceneClassifications"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") || (-[PLSceneClassification duration](self, "duration"), v26 != 0.0))
  {

LABEL_4:
    goto LABEL_5;
  }
  -[PLSceneClassification startTime](self, "startTime");
  v28 = v27;

  if (v28 == 0.0)
    return 1;
LABEL_5:
  -[PLSceneClassification objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", CFSTR("assetAttributes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
LABEL_6:

    goto LABEL_7;
  }
  -[PLSceneClassification objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", CFSTR("assetAttributesForTemporalSceneClassifications"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
  {

    goto LABEL_6;
  }
  -[PLSceneClassification duration](self, "duration");
  v11 = v10;

  if (v11 > 0.0)
    return 1;
LABEL_7:
  -[PLSceneClassification objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", CFSTR("assetAttributes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
  {
    -[PLSceneClassification objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", CFSTR("assetAttributesForTemporalSceneClassifications"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
      goto LABEL_13;
    -[PLSceneClassification startTime](self, "startTime");
    if (v29 < 0.0 || (-[PLSceneClassification duration](self, "duration"), v30 <= 0.0))
    {
      -[PLSceneClassification startTime](self, "startTime");
      if (v31 != 0.0)
        goto LABEL_13;
      -[PLSceneClassification duration](self, "duration");
      if (v32 != 0.0)
        goto LABEL_13;
    }
    return 1;
  }

LABEL_13:
  v14 = (void *)MEMORY[0x1E0CB3940];
  -[PLSceneClassification assetAttributes](self, "assetAttributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSceneClassification assetAttributesForTemporalSceneClassifications](self, "assetAttributesForTemporalSceneClassifications");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSceneClassification startTime](self, "startTime");
  v18 = v17;
  -[PLSceneClassification duration](self, "duration");
  objc_msgSend(v14, "stringWithFormat:", CFSTR("There was a validation issue when attempting to insert PLSceneClassification (assetAttributes: %p, assetAttributesForTemporalSceneClassifications: %p, startTime: %g, duration: %g, classificationType: %d"), v15, v16, v18, v19, (int)-[PLSceneClassification classificationType](self, "classificationType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  PLBackendGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v20;
    _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  if (a3)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0D74498];
    v33 = *MEMORY[0x1E0CB2938];
    v34 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 46502, v24);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (BOOL)validateForInsert:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLSceneClassification;
  v5 = -[PLSceneClassification validateForInsert:](&v7, sel_validateForInsert_);
  if (v5)
    LOBYTE(v5) = -[PLSceneClassification _validateInterpropertyValues:](self, "_validateInterpropertyValues:", a3);
  return v5;
}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLSceneClassification;
  -[PLManagedObject willSave](&v10, sel_willSave);
  -[PLSceneClassification managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PLSceneClassification changedValues](self, "changedValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[PLSceneClassification isDeleted](self, "isDeleted") & 1) != 0)
    {
LABEL_12:

      goto LABEL_13;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sceneIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confidence"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        goto LABEL_11;
    }
    if (-[PLSceneClassification isDocumentClassification](self, "isDocumentClassification"))
    {
      -[PLSceneClassification assetAttributes](self, "assetAttributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 16;
LABEL_10:
      objc_msgSend(v7, "addDuplicateDetectorPerceptualProcessingStates:removeProcessingStates:", v9, 0);

      goto LABEL_11;
    }
    if (-[PLSceneClassification isScreenshotClassification](self, "isScreenshotClassification"))
    {
      -[PLSceneClassification assetAttributes](self, "assetAttributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 64;
      goto LABEL_10;
    }
LABEL_11:
    -[PLSceneClassification _checkForOrphanedSceneClassification](self, "_checkForOrphanedSceneClassification");
    goto LABEL_12;
  }
LABEL_13:

}

- (BOOL)isDocumentClassification
{
  unint64_t v3;
  void *v4;
  double v5;
  BOOL v6;

  v3 = -[PLSceneClassification sceneIdentifier](self, "sceneIdentifier");
  +[PLSceneClassification PLJunkSceneClassificationIDForLabel:](PLSceneClassification, "PLJunkSceneClassificationIDForLabel:", CFSTR("hier_text_document"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == objc_msgSend(v4, "unsignedIntegerValue"))
  {
    -[PLSceneClassification confidence](self, "confidence");
    v6 = v5 >= 0.59;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isScreenshotClassification
{
  unint64_t v3;
  void *v4;
  double v5;
  BOOL v6;

  v3 = -[PLSceneClassification sceneIdentifier](self, "sceneIdentifier");
  +[PLSceneClassification PLJunkSceneClassificationIDForLabel:](PLSceneClassification, "PLJunkSceneClassificationIDForLabel:", CFSTR("screenshot"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == objc_msgSend(v4, "unsignedIntegerValue"))
  {
    -[PLSceneClassification confidence](self, "confidence");
    v6 = v5 >= 0.58;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_checkForOrphanedSceneClassification
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[PLSceneClassification assetAttributes](self, "assetAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[PLSceneClassification assetAttributesForTemporalSceneClassifications](self, "assetAttributesForTemporalSceneClassifications");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      PLBackendGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        -[NSManagedObject pl_shortDescription](self, "pl_shortDescription");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138543362;
        v8 = v6;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_FAULT, "Detected orphaned scene classification: %{public}@", (uint8_t *)&v7, 0xCu);

      }
    }
  }
}

+ (id)insertIntoPhotoLibrary:(id)a3 asset:(id)a4 sceneIdentifier:(unint64_t)a5 confidence:(double)a6 packedBoundingBoxRect:(int64_t)a7 startTime:(double)a8 duration:(double)a9 classificationType:(int64_t)a10
{
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v27;
  uint8_t buf[16];

  v19 = a3;
  v20 = a4;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSceneClassification.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

  }
  objc_msgSend(v19, "managedObjectContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(a1, "entityName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v22, (uint64_t)v21, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setSceneIdentifier:", a5);
    objc_msgSend(v23, "setConfidence:", a6);
    objc_msgSend(v23, "setPackedBoundingBoxRect:", a7);
    objc_msgSend(v23, "setStartTime:", a8);
    objc_msgSend(v23, "setDuration:", a9);
    objc_msgSend(v23, "setClassificationType:", (__int16)a10);
    objc_msgSend(v20, "additionalAttributes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)a10 <= 7)
    {
      if (((1 << a10) & 0xF3) != 0)
        objc_msgSend(v23, "setAssetAttributes:", v24);
      else
        objc_msgSend(v23, "setAssetAttributesForTemporalSceneClassifications:", v24);
    }

  }
  else
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Unable to insert PLSceneClassification for a nil asset.", buf, 2u);
      }

    }
    v23 = 0;
  }

  return v23;
}

+ (unint64_t)countOfOrphanedSceneClassificationsWithLimit:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  id v11;
  id v13;

  v8 = a4;
  v9 = (void *)MEMORY[0x19AEC1554]();
  v13 = 0;
  v10 = objc_msgSend(a1, "_pool_countOfOrphanedSceneClassificationsWithLimit:inContext:error:", a3, v8, &v13);
  v11 = v13;
  objc_autoreleasePoolPop(v9);
  if (a5)
    *a5 = objc_retainAutorelease(v11);

  return v10;
}

+ (unint64_t)_pool_countOfOrphanedSceneClassificationsWithLimit:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0C97B48];
  v8 = a4;
  +[PLSceneClassification entityName](PLSceneClassification, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("assetAttributes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("assetAttributesForTemporalSceneClassifications"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v15);

  objc_msgSend(v10, "setFetchLimit:", a3);
  objc_msgSend(v10, "setResultType:", 1);
  objc_msgSend(v8, "executeFetchRequest:error:", v10, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = objc_msgSend(v16, "count");
  else
    v17 = 0x7FFFFFFFFFFFFFFFLL;

  return v17;
}

+ (void)batchFetchScenesByAssetObjectIDWithAssetObjectIDs:(id)a3 library:(id)a4 includeTemporalClassifications:(BOOL)a5 completion:(id)a6
{
  objc_msgSend(a1, "batchFetchScenesByAssetObjectIDWithAssetObjectIDs:library:includeTemporalClassifications:sceneClassificationTypePredicate:completion:", a3, a4, a5, 0, a6);
}

+ (void)batchFetchScenesByAssetObjectIDWithAssetObjectIDs:(id)a3 library:(id)a4 includeTemporalClassifications:(BOOL)a5 sceneClassificationTypePredicate:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __158__PLSceneClassification_batchFetchScenesByAssetObjectIDWithAssetObjectIDs_library_includeTemporalClassifications_sceneClassificationTypePredicate_completion___block_invoke;
  v19[3] = &unk_1E366B680;
  v20 = v12;
  v21 = v11;
  v24 = a5;
  v22 = v13;
  v23 = v14;
  v15 = v11;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  objc_msgSend(v18, "performBlockAndWait:", v19);

}

+ (id)PLJunkSceneClassificationIDForLabel:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = PLJunkSceneClassificationIDForLabel__once;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&PLJunkSceneClassificationIDForLabel__once, &__block_literal_global_49877);
  objc_msgSend((id)PLJunkSceneClassificationIDForLabel__mapping, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)isUtilityAssetForSharedLibrary:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  NSObject *v18;
  char v19;
  BOOL v20;
  NSObject *v21;
  NSObject *v23;
  id v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  double v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "isVideo") & 1) != 0
    || (objc_msgSend(v3, "additionalAttributes"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "sceneAnalysisVersion"),
        v4,
        v5 < 0x56))
  {
    v20 = 0;
    goto LABEL_48;
  }
  objc_msgSend(v3, "additionalAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneClassifications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "uuid");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v7;
  v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (!v9)
  {

    v19 = 0;
    v11 = 0;
    goto LABEL_40;
  }
  v10 = v9;
  v25 = v3;
  v27 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v29;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v29 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
      v15 = objc_msgSend(v14, "sceneIdentifier");
      objc_msgSend(v14, "confidence");
      v17 = v16;
      if (v15 <= 2147483643)
      {
        if (v15 == 2147483629)
        {
          if (v16 < 0.59)
          {
            LOBYTE(v27) = 0;
            continue;
          }
          PLBackendSharingGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v33 = v26;
            v34 = 2048;
            v35 = v17;
            _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEBUG, "Asset %@ - text document scene: %.3f", buf, 0x16u);
          }
          LOBYTE(v27) = 1;
        }
        else
        {
          if (v15 != 2147483631)
            continue;
          if (v16 < 0.37)
          {
            v11 = 0;
            continue;
          }
          PLBackendSharingGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v33 = v26;
            v34 = 2048;
            v35 = v17;
            _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEBUG, "Asset %@ - tragic failure scene: %.3f", buf, 0x16u);
          }
          v11 = 1;
        }
LABEL_30:

        continue;
      }
      if (v15 == 2147483646)
      {
        if (v16 < 0.54)
        {
          BYTE4(v27) = 0;
          continue;
        }
        PLBackendSharingGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v33 = v26;
          v34 = 2048;
          v35 = v17;
          _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEBUG, "Asset %@ - poor quality scene: %.3f", buf, 0x16u);
        }
        BYTE4(v27) = 1;
        goto LABEL_30;
      }
      if (v15 == 2147483644 && v16 >= 0.31)
      {
        PLBackendSharingGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v33 = v26;
          v34 = 2048;
          v35 = v17;
          _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEBUG, "Asset %@ - negative utility scene: %.3f", buf, 0x16u);
        }

        v20 = 0;
        v23 = v8;
        v3 = v25;
        goto LABEL_46;
      }
    }
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v10)
      continue;
    break;
  }

  v3 = v25;
  v19 = BYTE4(v27);
  if ((v27 & 1) != 0)
    goto LABEL_43;
LABEL_40:
  if ((v19 & 1) != 0 || (v11 & 1) != 0)
  {
LABEL_43:
    PLBackendSharingGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v26;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEBUG, "Asset %@ is considered as utility", buf, 0xCu);
    }
    v20 = 1;
LABEL_46:

  }
  else
  {
    v20 = 0;
  }

LABEL_48:
  return v20;
}

void __61__PLSceneClassification_PLJunkSceneClassificationIDForLabel___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[21];
  _QWORD v3[22];

  v3[21] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("hier_text_document");
  v2[1] = CFSTR("hier_tragic_failure");
  v3[0] = &unk_1E375F090;
  v3[1] = &unk_1E375F0A8;
  v2[2] = CFSTR("bad_framing");
  v2[3] = CFSTR("bad_lighting");
  v3[2] = &unk_1E375F0C0;
  v3[3] = &unk_1E375F0D8;
  v2[4] = CFSTR("blurry");
  v2[5] = CFSTR("food_or_drink");
  v3[4] = &unk_1E375F0F0;
  v3[5] = &unk_1E375F108;
  v2[6] = CFSTR("junk_other");
  v2[7] = CFSTR("medical_reference");
  v3[6] = &unk_1E375F120;
  v3[7] = &unk_1E375F138;
  v2[8] = CFSTR("negative");
  v2[9] = CFSTR("receipt_or_document");
  v3[8] = &unk_1E375F150;
  v3[9] = &unk_1E375F168;
  v2[10] = CFSTR("repair_reference");
  v2[11] = CFSTR("screenshot");
  v3[10] = &unk_1E375F180;
  v3[11] = &unk_1E375F198;
  v2[12] = CFSTR("shopping_reference");
  v2[13] = CFSTR("utility_reference");
  v3[12] = &unk_1E375F1B0;
  v3[13] = &unk_1E375F1C8;
  v2[14] = CFSTR("junk_negative");
  v2[15] = CFSTR("hier_negative");
  v3[14] = &unk_1E375F1E0;
  v3[15] = &unk_1E375F1E0;
  v2[16] = CFSTR("junk_non_memorable");
  v2[17] = CFSTR("hier_non_memorable");
  v3[16] = &unk_1E375F1F8;
  v3[17] = &unk_1E375F1F8;
  v2[18] = CFSTR("junk_poor_quality");
  v2[19] = CFSTR("hier_poor_quality");
  v3[18] = &unk_1E375F210;
  v3[19] = &unk_1E375F210;
  v2[20] = CFSTR("junk");
  v3[20] = &unk_1E375F228;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 21);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PLJunkSceneClassificationIDForLabel__mapping;
  PLJunkSceneClassificationIDForLabel__mapping = v0;

}

void __158__PLSceneClassification_batchFetchScenesByAssetObjectIDWithAssetObjectIDs_library_includeTemporalClassifications_sceneClassificationTypePredicate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  BOOL v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  void *v71;
  id obj;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  id v82;
  _BYTE v83[128];
  _QWORD v84[8];
  _QWORD v85[2];
  _QWORD v86[2];
  uint8_t v87[128];
  uint8_t buf[4];
  id v89;
  _QWORD v90[5];

  v90[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("asset"), *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);
  objc_msgSend(v5, "setResultType:", 2);
  v7 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v7, "setName:", CFSTR("assetObjectID"));
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("asset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExpression:", v8);

  objc_msgSend(v7, "setExpressionResultType:", 2000);
  v9 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v9, "setName:", CFSTR("additionalAttributes"));
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setExpression:", v10);

  objc_msgSend(v9, "setExpressionResultType:", 2000);
  v90[0] = v7;
  v90[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPropertiesToFetch:", v11);

  v82 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v5, &v82);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v82;
  if (v13)
  {
    v14 = v13;
    PLPhotoKitGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v89 = v14;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Batch fetching scenes error: %@", buf, 0xCu);
    }

    v16 = v14;
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v65 = v9;
    v66 = v7;
    v70 = a1;
    v71 = v2;
    v67 = v6;
    v68 = v5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v17 = v12;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v64 = v17;
    v20 = v17;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v79 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
          objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("additionalAttributes"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("assetObjectID"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKey:", v27, v26);
          objc_msgSend(v18, "addObject:", v26);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
      }
      while (v22);
    }

    v28 = (void *)MEMORY[0x1E0C97B48];
    +[PLSceneClassification entityName](PLSceneClassification, "entityName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "fetchRequestWithEntityName:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("assetAttributes"), v18);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(v70 + 64))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("assetAttributesForTemporalSceneClassifications"), v18);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v31;
      v34 = (void *)MEMORY[0x1E0CB3528];
      v86[0] = v33;
      v86[1] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "orPredicateWithSubpredicates:", v35);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v36 = *(_QWORD *)(v70 + 48);
    if (v36)
    {
      v37 = (void *)MEMORY[0x1E0CB3528];
      v85[0] = v31;
      v85[1] = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 2);
      v38 = v31;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "andPredicateWithSubpredicates:", v39);
      v40 = objc_claimAutoreleasedReturnValue();

      v31 = (void *)v40;
    }
    v41 = objc_alloc_init(MEMORY[0x1E0C97B30]);
    objc_msgSend(v41, "setName:", CFSTR("assetAttributes"));
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("assetAttributes"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setExpression:", v42);

    objc_msgSend(v41, "setExpressionResultType:", 2000);
    v43 = objc_alloc_init(MEMORY[0x1E0C97B30]);
    objc_msgSend(v43, "setName:", CFSTR("assetAttributesForTemporalSceneClassifications"));
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("assetAttributesForTemporalSceneClassifications"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setExpression:", v44);

    objc_msgSend(v43, "setExpressionResultType:", 2000);
    v62 = v43;
    v63 = v41;
    v84[0] = v41;
    v84[1] = v43;
    v84[2] = CFSTR("confidence");
    v84[3] = CFSTR("sceneIdentifier");
    v84[4] = CFSTR("packedBoundingBoxRect");
    v84[5] = CFSTR("startTime");
    v84[6] = CFSTR("duration");
    v84[7] = CFSTR("classificationType");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 8);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setPropertiesToFetch:", v45);

    objc_msgSend(v30, "setResultType:", 2);
    objc_msgSend(v30, "setPredicate:", v31);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = 0;
    v2 = v71;
    objc_msgSend(v71, "executeFetchRequest:error:", v30, &v77);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v77;
    v61 = v47;
    if (v69)
    {
      PLPhotoKitGetLog();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v89 = v69;
        _os_log_impl(&dword_199541000, v48, OS_LOG_TYPE_ERROR, "Batch fetching scenes error: %@", buf, 0xCu);
      }

      v16 = v69;
      (*(void (**)(void))(*(_QWORD *)(v70 + 56) + 16))();
    }
    else
    {
      v59 = v31;
      v60 = v30;
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      obj = v47;
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
      if (v49)
      {
        v50 = v49;
        v51 = *(_QWORD *)v74;
        do
        {
          for (j = 0; j != v50; ++j)
          {
            if (*(_QWORD *)v74 != v51)
              objc_enumerationMutation(obj);
            v53 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
            objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("assetAttributes"));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            if (v54
              || (objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("assetAttributesForTemporalSceneClassifications")),
                  (v54 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              objc_msgSend(v19, "objectForKey:", v54);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "objectForKey:", v55);
              v56 = objc_claimAutoreleasedReturnValue();
              if (v56)
                v57 = 1;
              else
                v57 = v55 == 0;
              if (v57)
              {
                v58 = (void *)v56;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "setObject:forKeyedSubscript:", v58, v55);
              }
            }
            else
            {
              v55 = 0;
              v58 = 0;
            }
            objc_msgSend(v58, "addObject:", v53);

          }
          v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
        }
        while (v50);
      }

      (*(void (**)(void))(*(_QWORD *)(v70 + 56) + 16))();
      v2 = v71;
      v31 = v59;
      v30 = v60;
      v16 = 0;
    }

    v6 = v67;
    v5 = v68;
    v9 = v65;
    v7 = v66;
    v12 = v64;
  }

}

+ (id)fetchSceneClassificationsForAdditionalAttributes:(id)a3 managedObjectContext:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v15;

  v5 = (void *)MEMORY[0x1E0C97B48];
  v6 = a4;
  v7 = a3;
  +[PLSceneClassification entityName](PLSceneClassification, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@ OR %K == %@"), CFSTR("assetAttributes"), v7, CFSTR("assetAttributesForTemporalSceneClassifications"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v10);
  v15 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v9, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v15;
  if (v11)
    objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v11);
  else
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
