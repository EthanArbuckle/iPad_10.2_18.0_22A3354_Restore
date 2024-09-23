@implementation PGFeatureExtractorFacesFromAssetAverage

- (PGFeatureExtractorFacesFromAssetAverage)initWithFaceFeatureExtractor:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  PGFeatureExtractorFacesFromAssetAverage *v9;
  PGFeatureExtractorFacesFromAssetAverage *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGFeatureExtractorFacesFromAssetAverage;
  v9 = -[PGFeatureExtractorFacesFromAssetAverage init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_faceFeatureExtractor, a3);
    objc_storeStrong((id *)&v10->_name, a4);
  }

  return v10;
}

- (int64_t)featureLength
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PGFeatureExtractorFacesFromAssetAverage faceFeatureExtractor](self, "faceFeatureExtractor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)featureNames
{
  void *v2;
  void *v3;

  -[PGFeatureExtractorFacesFromAssetAverage faceFeatureExtractor](self, "faceFeatureExtractor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id *v21;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0D42A40]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v8)
  {
    v10 = 0;
    goto LABEL_16;
  }
  v9 = v8;
  v21 = a5;
  v10 = 0;
  v11 = *(_QWORD *)v26;
  while (2)
  {
    v12 = 0;
    v13 = v10;
    do
    {
      if (*(_QWORD *)v26 != v11)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
      objc_msgSend(v14, "photoLibrary", v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "librarySpecificFetchOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        v16 = v7;
        v10 = v13;
LABEL_14:

        v7 = 0;
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesInAsset:options:", v14, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fetchedObjects");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v13;
      -[PGFeatureExtractorFacesFromAssetAverage floatVectorWithFaces:error:](self, "floatVectorWithFaces:error:", v18, &v24);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v24;

      if (!v19)
      {

        goto LABEL_14;
      }
      objc_msgSend(v7, "appendRow:", v19);

      ++v12;
      v13 = v10;
    }
    while (v9 != v12);
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
      continue;
    break;
  }
LABEL_15:
  a5 = v21;
LABEL_16:

  if (a5)
    *a5 = objc_retainAutorelease(v10);

  return v7;
}

- (id)floatVectorWithFaces:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id *v25;
  id v26;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v6, "count"))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v26 = v6;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v8)
    {
      v9 = v8;
      v25 = a4;
      v10 = 0;
      v11 = *(_QWORD *)v30;
      while (2)
      {
        v12 = 0;
        v13 = v10;
        do
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v12);
          -[PGFeatureExtractorFacesFromAssetAverage faceFeatureExtractor](self, "faceFeatureExtractor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v13;
          objc_msgSend(v15, "floatVectorWithEntity:error:", v14, &v28);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v28;

          if (!v16)
          {
            v17 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v14, "localIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "stringWithFormat:", CFSTR("Unable to retrieve face feature vector from face %@. Returning nil."), v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[PGFeatureExtractorFacesFromAssetAverage _generateError:withCode:andMessage:underlyingError:](self, "_generateError:withCode:andMessage:underlyingError:", v25, 0, v19, v10);

            v20 = 0;
            goto LABEL_16;
          }
          objc_msgSend(v7, "addObject:", v16);

          ++v12;
          v13 = v10;
        }
        while (v9 != v12);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v9)
          continue;
        break;
      }
    }
    else
    {
      v10 = 0;
    }

    objc_msgSend(MEMORY[0x1E0D42A20], "meanVectorWithFloatVectors:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
    v6 = v26;
  }
  else
  {
    -[PGFeatureExtractorFacesFromAssetAverage faceFeatureExtractor](self, "faceFeatureExtractor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v21, "defaultFloatVectorWithError:", &v33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v33;

    if (v20)
    {
      v22 = v20;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to retrieve default face feature vector. Returning nil."));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGFeatureExtractorFacesFromAssetAverage _generateError:withCode:andMessage:underlyingError:](self, "_generateError:withCode:andMessage:underlyingError:", a4, 1, v23, v10);

    }
  }

  return v20;
}

- (BOOL)_generateError:(id *)a3 withCode:(int64_t)a4 andMessage:(id)a5 underlyingError:(id)a6
{
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB3388];
    v17 = *MEMORY[0x1E0CB2D50];
    v18 = v10;
    v19[0] = a5;
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = a5;
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@"), a6, v17, v18, v19[0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v17, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosGraph.PGFeatureExtractorFacesFromAssetAverage"), a4, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    *a3 = v15;
  }
  return 1;
}

- (MAFeatureExtractor)faceFeatureExtractor
{
  return (MAFeatureExtractor *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_faceFeatureExtractor, 0);
}

@end
