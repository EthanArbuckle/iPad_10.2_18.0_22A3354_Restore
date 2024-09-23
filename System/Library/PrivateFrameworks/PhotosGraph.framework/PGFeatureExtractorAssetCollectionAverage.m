@implementation PGFeatureExtractorAssetCollectionAverage

- (PGFeatureExtractorAssetCollectionAverage)initWithAssetFeatureExtractor:(id)a3 assetFetchOptionPropertySet:(id)a4 name:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGFeatureExtractorAssetCollectionAverage *v12;
  PGFeatureExtractorAssetCollectionAverage *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGFeatureExtractorAssetCollectionAverage;
  v12 = -[PGFeatureExtractorAssetCollectionAverage init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetFeatureExtractor, a3);
    objc_storeStrong((id *)&v13->_assetFetchOptionPropertySet, a4);
    objc_storeStrong((id *)&v13->_name, a5);
  }

  return v13;
}

- (id)featureNames
{
  void *v2;
  void *v3;

  -[PGFeatureExtractorAssetCollectionAverage assetFeatureExtractor](self, "assetFeatureExtractor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)featureLength
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PGFeatureExtractorAssetCollectionAverage assetFeatureExtractor](self, "assetFeatureExtractor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id *v24;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGFeatureExtractorAssetCollectionAverage assetFetchOptionPropertySet](self, "assetFetchOptionPropertySet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PGFeatureExtractorAssetCollectionAverage assetFetchOptionPropertySet](self, "assetFetchOptionPropertySet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFetchPropertySets:", v11);

  }
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v6, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v24 = a4;
    v25 = v9;
    v26 = v6;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
      while (2)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v17);
          -[PGFeatureExtractorAssetCollectionAverage assetFeatureExtractor](self, "assetFeatureExtractor", v24);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 0;
          objc_msgSend(v19, "floatVectorWithEntity:error:", v18, &v27);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v27;

          if (!v20)
          {
            -[PGFeatureExtractorAssetCollectionAverage _generateError:code:message:underlyingError:](self, "_generateError:code:message:underlyingError:", v24, 1, CFSTR("Unable to extract feature vector for asset. Returning nil for the asset collection print."), v21);

            v22 = 0;
            goto LABEL_14;
          }
          objc_msgSend(v7, "addObject:", v20);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v15)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x1E0D42A20], "meanVectorWithFloatVectors:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    v9 = v25;
    v6 = v26;
  }
  else
  {
    -[PGFeatureExtractorAssetCollectionAverage _generateError:code:message:underlyingError:](self, "_generateError:code:message:underlyingError:", a4, 0, CFSTR("No assets could be fetched from the asset collection."), 0);
    v22 = 0;
  }

  return v22;
}

- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x1E0D42A40]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        -[PGFeatureExtractorAssetCollectionAverage floatVectorWithEntity:error:](self, "floatVectorWithEntity:error:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13), a5, (_QWORD)v18);
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
        {

          v16 = 0;
          goto LABEL_11;
        }
        v15 = (void *)v14;
        objc_msgSend(v8, "appendRow:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        continue;
      break;
    }
  }

  v16 = v8;
LABEL_11:

  return v16;
}

- (BOOL)_generateError:(id *)a3 code:(int64_t)a4 message:(id)a5 underlyingError:(id)a6
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
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CB2D50]);

    if (v9)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosGraph.PGFeatureExtractorAssetCollectionAverage"), a4, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (MAFeatureExtractor)assetFeatureExtractor
{
  return self->_assetFeatureExtractor;
}

- (NSArray)assetFetchOptionPropertySet
{
  return self->_assetFetchOptionPropertySet;
}

- (id)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_assetFetchOptionPropertySet, 0);
  objc_storeStrong((id *)&self->_assetFeatureExtractor, 0);
}

@end
