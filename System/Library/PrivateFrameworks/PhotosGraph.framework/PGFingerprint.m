@implementation PGFingerprint

- (PGFingerprint)initWithFloatArray:(id)a3 withFeatureNames:(id)a4
{
  id v6;
  id v7;
  PGFingerprint *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGFingerprint;
  v8 = -[PGFingerprint init](&v11, sel_init);
  if (v8)
  {
    v9 = (void *)objc_msgSend(v6, "copy");
    -[PGFingerprint setFloatArray:](v8, "setFloatArray:", v9);

    -[PGFingerprint setFeatureNames:](v8, "setFeatureNames:", v7);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PGFingerprint *v4;
  BOOL v5;

  v4 = (PGFingerprint *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PGFingerprint isEqualToFingerprint:](self, "isEqualToFingerprint:", v4);
  }

  return v5;
}

- (BOOL)isEqualToFingerprint:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PGFingerprint floatArray](self, "floatArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isApproximatelyEqualTo:", v6);
  return (char)v4;
}

- (MAFloatVector)floatArray
{
  return self->floatArray;
}

- (void)setFloatArray:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)featureNames
{
  return self->featureNames;
}

- (void)setFeatureNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->featureNames, 0);
  objc_storeStrong((id *)&self->floatArray, 0);
}

+ (id)assetFingerprintWithVersion:(int64_t)a3 forAsset:(id)a4 withGraph:(id)a5 withTransformers:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (+[PGFingerprintVersionHelper isAssetFingerprintVersion:](PGFingerprintVersionHelper, "isAssetFingerprintVersion:", a3))
  {
    +[PGFingerprintVersionHelper featureExtractorForFingerprintVersion:withGraph:withTransformers:error:](PGFingerprintVersionHelper, "featureExtractorForFingerprintVersion:withGraph:withTransformers:error:", a3, v13, v14, a7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_assetFingerprintWithFeatureExtractor:forAsset:withTransformers:error:", v15, v12, v14, a7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fingerprint version not supported for assets: %ld"), a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_generateError:errorCode:errorMessage:underlyingError:", a7, 1, v15, 0);
    v16 = 0;
  }

  return v16;
}

+ (id)assetFingerprintsWithVersion:(int64_t)a3 forAssets:(id)a4 withGraph:(id)a5 withTransformers:(id)a6 error:(id *)a7
{
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id *v26;
  id v27;
  id obj;
  id v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v31 = a5;
  v30 = a6;
  if (+[PGFingerprintVersionHelper isAssetFingerprintVersion:](PGFingerprintVersionHelper, "isAssetFingerprintVersion:", a3))
  {
    v26 = a7;
    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v27 = v12;
    obj = v12;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v34;
      do
      {
        v17 = 0;
        v18 = v15;
        do
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v17);
          v20 = (void *)MEMORY[0x1CAA4EB2C]();
          v32 = v18;
          objc_msgSend(a1, "assetFingerprintWithVersion:forAsset:withGraph:withTransformers:error:", a3, v19, v31, v30, &v32);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v32;

          if (v21)
          {
            objc_msgSend(v19, "localIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v21, v22);

          }
          objc_autoreleasePoolPop(v20);
          ++v17;
          v18 = v15;
        }
        while (v14 != v17);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v14);
    }
    else
    {
      v15 = 0;
    }

    if (objc_msgSend(v29, "count") || !v15)
    {
      v24 = v29;
    }
    else
    {
      v24 = 0;
      if (v26)
        *v26 = objc_retainAutorelease(v15);
    }
    v12 = v27;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fingerprint version not supported for assets: %ld"), a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_generateError:errorCode:errorMessage:underlyingError:", a7, 1, v23, 0);

    v24 = 0;
  }

  return v24;
}

+ (id)assetFingerprintsDataframeWithVersion:(int64_t)a3 forAssets:(id)a4 withGraph:(id)a5 withTransformers:(id)a6 progressReporter:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (+[PGFingerprintVersionHelper isAssetFingerprintVersion:](PGFingerprintVersionHelper, "isAssetFingerprintVersion:", a3))
  {
    +[PGFingerprintVersionHelper featureExtractorForFingerprintVersion:withGraph:withTransformers:error:](PGFingerprintVersionHelper, "featureExtractorForFingerprintVersion:withGraph:withTransformers:error:", a3, v15, v16, a8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v29 = v15;
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v30 = v14;
      v20 = v14;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v32 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "localIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v25);

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v22);
      }

      objc_msgSend(v18, "featureVectorsWithEntities:entityLabels:progressReporter:error:", v20, v19, v17, a8);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v29;
      v14 = v30;
    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fingerprint version not supported for assets: %ld"), a3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_generateError:errorCode:errorMessage:underlyingError:", a8, 1, v27, 0);

    v26 = 0;
  }

  return v26;
}

+ (id)_assetFingerprintWithFeatureExtractor:(id)a3 forAsset:(id)a4 withTransformers:(id)a5 error:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  PGFingerprint *v11;

  if (a3)
  {
    v8 = a3;
    objc_msgSend(v8, "floatVectorWithEntity:error:", a4, a6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "featureNames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    if (v9 && v10)
      v11 = -[PGFingerprint initWithFloatArray:withFeatureNames:]([PGFingerprint alloc], "initWithFloatArray:withFeatureNames:", v9, v10);

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

+ (id)assetCollectionFingerprintWithVersion:(int64_t)a3 forAssetCollection:(id)a4 withGraph:(id)a5 withTransformers:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  PGFingerprint *v20;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!+[PGFingerprintVersionHelper isMomentFingerprintVersion:](PGFingerprintVersionHelper, "isMomentFingerprintVersion:", a3)&& !+[PGFingerprintVersionHelper isMemoryFingerprintVersion:](PGFingerprintVersionHelper, "isMemoryFingerprintVersion:", a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fingerprint version not supported for asset collections: %ld"), a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_generateError:errorCode:errorMessage:underlyingError:", a7, 1, v16, 0);
    goto LABEL_9;
  }
  +[PGFingerprintVersionHelper featureExtractorForFingerprintVersion:withGraph:withTransformers:error:](PGFingerprintVersionHelper, "featureExtractorForFingerprintVersion:withGraph:withTransformers:error:", a3, v13, v14, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
LABEL_9:
    v20 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v15, "floatVectorWithEntity:error:", v12, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "featureNames");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  v20 = 0;
  if (v17 && v18)
    v20 = -[PGFingerprint initWithFloatArray:withFeatureNames:]([PGFingerprint alloc], "initWithFloatArray:withFeatureNames:", v17, v18);

LABEL_10:
  return v20;
}

+ (id)assetCollectionFingerprintsWithVersion:(int64_t)a3 forAssetCollections:(id)a4 withGraph:(id)a5 withTransformers:(id)a6 error:(id *)a7
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id *v26;
  id v27;
  id obj;
  id v29;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v32 = a5;
  v31 = a6;
  if (+[PGFingerprintVersionHelper isMomentFingerprintVersion:](PGFingerprintVersionHelper, "isMomentFingerprintVersion:", a3)|| +[PGFingerprintVersionHelper isMemoryFingerprintVersion:](PGFingerprintVersionHelper, "isMemoryFingerprintVersion:", a3))
  {
    v26 = a7;
    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v27 = v11;
    obj = v11;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = 0;
      v16 = *(_QWORD *)v35;
      do
      {
        v17 = 0;
        v18 = v14;
        v19 = v15;
        do
        {
          if (*(_QWORD *)v35 != v16)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v17);
          v21 = (void *)MEMORY[0x1CAA4EB2C]();
          v33 = v19;
          objc_msgSend(a1, "assetCollectionFingerprintWithVersion:forAssetCollection:withGraph:withTransformers:error:", a3, v20, v32, v31, &v33);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v33;

          if (v14)
          {
            objc_msgSend(v20, "localIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v14, v22);

          }
          objc_autoreleasePoolPop(v21);
          ++v17;
          v18 = v14;
          v19 = v15;
        }
        while (v13 != v17);
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v13);
    }
    else
    {
      v14 = 0;
      v15 = 0;
    }

    if (objc_msgSend(v29, "count") || !v15)
    {
      v23 = v29;
    }
    else
    {
      v23 = 0;
      if (v26)
        *v26 = objc_retainAutorelease(v15);
    }
    v11 = v27;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fingerprint version not supported for asset collections: %ld"), a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_generateError:errorCode:errorMessage:underlyingError:", a7, 1, v24, 0);

    v23 = 0;
  }

  return v23;
}

+ (id)assetCollectionFingerprintsDataframeWithVersion:(int64_t)a3 forAssetCollections:(id)a4 withGraph:(id)a5 withTransformers:(id)a6 progressReporter:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (+[PGFingerprintVersionHelper isMomentFingerprintVersion:](PGFingerprintVersionHelper, "isMomentFingerprintVersion:", a3)|| +[PGFingerprintVersionHelper isMemoryFingerprintVersion:](PGFingerprintVersionHelper, "isMemoryFingerprintVersion:", a3))
  {
    +[PGFingerprintVersionHelper featureExtractorForFingerprintVersion:withGraph:withTransformers:error:](PGFingerprintVersionHelper, "featureExtractorForFingerprintVersion:withGraph:withTransformers:error:", a3, v15, v16, a8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v29 = v17;
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v30 = v14;
      v20 = v14;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v32 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "localIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v25);

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v22);
      }

      v17 = v29;
      objc_msgSend(v18, "featureVectorsWithEntities:entityLabels:progressReporter:error:", v20, v19, v29, a8);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v30;
    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fingerprint version not supported for asset collections: %ld"), a3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_generateError:errorCode:errorMessage:underlyingError:", a8, 1, v27, 0);

    v26 = 0;
  }

  return v26;
}

+ (id)momentNodeFingerprintsDataFrameWithVersion:(int64_t)a3 forMomentNodes:(id)a4 withGraph:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, void *);
  void *v30;
  id v31;
  id v32;
  id v33;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!+[PGFingerprintVersionHelper isMomentNodeFingerprintVersion:](PGFingerprintVersionHelper, "isMomentNodeFingerprintVersion:", a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fingerprint version not supported for moment node collection: %ld"), a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_generateError:errorCode:errorMessage:underlyingError:", a7, 1, v15, 0);
LABEL_11:
    v21 = 0;
    goto LABEL_12;
  }
  +[PGFingerprintVersionHelper featureExtractorForFingerprintVersion:withGraph:withTransformers:error:](PGFingerprintVersionHelper, "featureExtractorForFingerprintVersion:withGraph:withTransformers:error:", a3, v13, 0, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __108__PGFingerprint_momentNodeFingerprintsDataFrameWithVersion_forMomentNodes_withGraph_progressReporter_error___block_invoke;
    v30 = &unk_1E8431C38;
    v31 = v13;
    v18 = v16;
    v32 = v18;
    v19 = v17;
    v33 = v19;
    objc_msgSend(v12, "enumerateUUIDsUsingBlock:", &v27);
    objc_msgSend(v15, "featureVectorsWithEntities:entityLabels:progressReporter:error:", v19, v18, v14, a7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      v22 = v20;
    }
    else if (a7 && !*a7)
    {
      v24 = (void *)MEMORY[0x1E0CB3940];
      v25 = objc_msgSend(v19, "count");
      objc_msgSend(v24, "stringWithFormat:", CFSTR("Failed to extract feature vectors for (%ld) moment nodes."), v25, v27, v28, v29, v30, v31, v32);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_generateError:errorCode:errorMessage:underlyingError:", a7, 3, v26, 0);

    }
    goto LABEL_6;
  }
  if (!a7 || *a7)
  {
    v15 = 0;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to build feature extractor for fingerprint version: %ld"), a3);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_generateError:errorCode:errorMessage:underlyingError:", a7, 2, v18, 0);
  v21 = 0;
LABEL_6:

LABEL_12:
  return v21;
}

+ (id)memoryFeatureNodesFingerprintsDataFrameWithVersion:(int64_t)a3 forFeatureNodes:(id)a4 uniqueMemoryIdentifiers:(id)a5 withGraph:(id)a6 progressReporter:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;
  void *v22;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (+[PGFingerprintVersionHelper isMemoryNodeFingerprintVersion:](PGFingerprintVersionHelper, "isMemoryNodeFingerprintVersion:", a3))
  {
    +[PGFingerprintVersionHelper featureExtractorForFingerprintVersion:withGraph:withTransformers:error:](PGFingerprintVersionHelper, "featureExtractorForFingerprintVersion:withGraph:withTransformers:error:", a3, v16, 0, a8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "featureVectorsWithEntities:entityLabels:progressReporter:error:", v14, v15, v17, a8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = v20;
        a8 = v21;
LABEL_18:

        goto LABEL_19;
      }
      if (!a8)
      {
        v21 = 0;
        goto LABEL_18;
      }
      if (!*a8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to extract feature vectors for (%ld) memories."), objc_msgSend(v14, "count"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_generateError:errorCode:errorMessage:underlyingError:", a8, 3, v22, 0);

      }
      v21 = 0;
LABEL_16:
      a8 = 0;
      goto LABEL_18;
    }
    if (!a8)
    {
      v19 = 0;
      goto LABEL_19;
    }
    if (!*a8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to build feature extractor for fingerprint version: %ld"), a3);
      v21 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_generateError:errorCode:errorMessage:underlyingError:", a8, 2, v21, 0);
      goto LABEL_16;
    }
    v19 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fingerprint version not supported for memory node collection: %ld"), a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_generateError:errorCode:errorMessage:underlyingError:", a8, 1, v19, 0);
  }
  a8 = 0;
LABEL_19:

  return a8;
}

+ (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5 underlyingError:(id)a6
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;

  v9 = a6;
  if (a3)
  {
    v10 = (objc_class *)MEMORY[0x1E0C99E08];
    v11 = a5;
    v12 = objc_alloc_init(v10);
    objc_msgSend(v12, "setObject:forKey:", v11, *MEMORY[0x1E0CB2D50]);

    if (v9)
      objc_msgSend(v12, "setObject:forKey:", v9, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosGraph.PGFingerprint"), a4, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

void __108__PGFingerprint_momentNodeFingerprintsDataFrameWithVersion_forMomentNodes_withGraph_progressReporter_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v5;
  id v6;
  PGGraphMomentNodeCollection *v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0D42990];
  v6 = a3;
  v8 = (id)objc_msgSend([v5 alloc], "initWithElementIdentifier:", a2);
  v7 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphMomentNodeCollection alloc], "initWithGraph:elementIdentifiers:", *(_QWORD *)(a1 + 32), v8);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
}

@end
