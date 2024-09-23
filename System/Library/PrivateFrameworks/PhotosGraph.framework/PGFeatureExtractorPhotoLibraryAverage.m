@implementation PGFeatureExtractorPhotoLibraryAverage

- (PGFeatureExtractorPhotoLibraryAverage)initWithAssetFeatureExtractor:(id)a3 assetFetchOptionPropertySet:(id)a4
{
  id v7;
  id v8;
  PGFeatureExtractorPhotoLibraryAverage *v9;
  PGFeatureExtractorPhotoLibraryAverage *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGFeatureExtractorPhotoLibraryAverage;
  v9 = -[PGFeatureExtractorPhotoLibraryAverage init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetFeatureExtractor, a3);
    objc_storeStrong((id *)&v10->_assetFetchOptionPropertySet, a4);
  }

  return v10;
}

- (id)name
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PGFeatureExtractorPhotoLibraryAverage assetFeatureExtractor](self, "assetFeatureExtractor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("PhotoLibraryAverage-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)featureNames
{
  NSArray *featureNames;
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSArray *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  featureNames = self->_featureNames;
  if (!featureNames)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[PGFeatureExtractorPhotoLibraryAverage assetFeatureExtractor](self, "assetFeatureExtractor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "featureNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSArray *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v6, "count"));

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[PGFeatureExtractorPhotoLibraryAverage assetFeatureExtractor](self, "assetFeatureExtractor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "featureNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PhotoLibraryAverage-%@"), *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v7, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    v15 = self->_featureNames;
    self->_featureNames = v7;

    featureNames = self->_featureNames;
  }
  return featureNames;
}

- (int64_t)featureLength
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PGFeatureExtractorPhotoLibraryAverage assetFeatureExtractor](self, "assetFeatureExtractor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "preCalculatedFloatVector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_3;
  v8 = (void *)objc_opt_class();
  -[PGFeatureExtractorPhotoLibraryAverage assetFeatureExtractor](self, "assetFeatureExtractor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGFeatureExtractorPhotoLibraryAverage assetFetchOptionPropertySet](self, "assetFetchOptionPropertySet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "preCalculateFeatureVectorWithPhotoLibrary:assetFeatureExtractor:assetFetchOptionPropertySet:error:", v6, v9, v10, a4);

  if (v11)
  {
LABEL_3:
    objc_msgSend((id)objc_opt_class(), "preCalculatedFloatVector");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (MAFeatureExtractor)assetFeatureExtractor
{
  return self->_assetFeatureExtractor;
}

- (NSArray)assetFetchOptionPropertySet
{
  return self->_assetFetchOptionPropertySet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureNames, 0);
  objc_storeStrong((id *)&self->_assetFetchOptionPropertySet, 0);
  objc_storeStrong((id *)&self->_assetFeatureExtractor, 0);
}

+ (BOOL)preCalculateFeatureVectorWithPhotoLibrary:(id)a3 assetFeatureExtractor:(id)a4 assetFetchOptionPropertySet:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  double v19;
  unint64_t v20;
  double v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  uint64_t v33;
  const __CFString *v34;
  void *v35;
  id v37;
  id *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  _QWORD v46[2];
  _QWORD v47[2];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v44 = a4;
  v11 = a5;
  objc_msgSend(a1, "resetPreCalculatedFeatureVector");
  objc_msgSend(v10, "librarySpecificFetchOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setChunkSizeForFetch:", 100);
  objc_msgSend(v12, "setCacheSizeForFetch:", 100);
  if (v11)
    objc_msgSend(v12, "setFetchPropertySets:", v11);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v12);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v43, "count");
  if (!a6 || v13)
  {
    v37 = a1;
    v38 = a6;
    v39 = v12;
    v40 = v11;
    v41 = v10;
    objc_msgSend(v44, "featureNames");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    LODWORD(v19) = 0;
    objc_msgSend(MEMORY[0x1E0D42A48], "vectorRepeatingFloat:count:", v18, v19);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v43, "count");
    if (v20)
    {
      v15 = 0;
      v22 = 0;
      v23 = 0;
      do
      {
        v24 = v15;
        v25 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v43, "objectAtIndexedSubscript:", v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v15;
        objc_msgSend(v44, "floatVectorWithEntity:error:", v26, &v45);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v45;

        if (v27 && objc_msgSend(v27, "count") == v18)
        {
          objc_msgSend(v42, "addVector:", v27);
          ++v23;
        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "loggingConnection");
          v29 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v26, "localIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v49 = v30;
            v50 = 2112;
            v51 = v15;
            _os_log_impl(&dword_1CA237000, v29, OS_LOG_TYPE_INFO, "Failed to calculate feature vector for asset %@: %@", buf, 0x16u);

          }
        }

        objc_autoreleasePoolPop(v25);
        ++v22;
      }
      while (v20 != v22);
    }
    else
    {
      v23 = 0;
      v15 = 0;
    }
    if (v38)
    {
      v31 = (__CFString *)objc_retainAutorelease(v15);
      *v38 = v31;
      v12 = v39;
      v11 = v40;
      if (v23 <= v20 >> 1)
      {
        v32 = (void *)MEMORY[0x1E0CB35C8];
        v33 = *MEMORY[0x1E0CB3388];
        v46[0] = *MEMORY[0x1E0CB2D50];
        v46[1] = v33;
        v34 = CFSTR("nil");
        if (v31)
          v34 = v31;
        v47[0] = CFSTR("Failed to compute mean of asset feature vectors. More than half of the asset feature vector extraction failed. Error: ");
        v47[1] = v34;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoAnalysis.PGFeatureExtractorPhotoLibraryAverageDomain"), 2, v35);
        v16 = 0;
        *v38 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
    }
    else
    {
      v12 = v39;
      v11 = v40;
      if (v23 <= v20 >> 1)
      {
        v16 = 0;
        goto LABEL_25;
      }
    }
    *(float *)&v21 = (float)v23;
    objc_msgSend(v42, "vectorByDividingByScalar:", v21);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setPreCalculatedFloatVector:", v35);
    v16 = 1;
LABEL_24:

LABEL_25:
    v10 = v41;
    goto LABEL_26;
  }
  v14 = (void *)MEMORY[0x1E0CB35C8];
  v52 = *MEMORY[0x1E0CB2D50];
  v53[0] = CFSTR("Library contains no assets.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoAnalysis.PGFeatureExtractorPhotoLibraryAverageDomain"), 1, v15);
  v16 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v16;
}

+ (void)resetPreCalculatedFeatureVector
{
  objc_msgSend(a1, "setPreCalculatedFloatVector:", 0);
}

+ (id)preCalculatedFloatVector
{
  return (id)preCalculatedFloatVector;
}

+ (void)setPreCalculatedFloatVector:(id)a3
{
  objc_storeStrong((id *)&preCalculatedFloatVector, a3);
}

@end
