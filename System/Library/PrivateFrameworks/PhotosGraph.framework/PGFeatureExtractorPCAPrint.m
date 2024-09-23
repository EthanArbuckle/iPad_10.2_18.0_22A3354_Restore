@implementation PGFeatureExtractorPCAPrint

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("PCAPrint");
  return CFSTR("PCAPrint");
}

- (int64_t)featureLength
{
  return 256;
}

- (id)featureNames
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[PGFeatureExtractorPCAPrint featureLength](self, "featureLength"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PGFeatureExtractorPCAPrint featureLength](self, "featureLength") >= 1)
  {
    v4 = 0;
    v5 = 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%u"), CFSTR("PCA"), v5 - 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:atIndexedSubscript:", v6, v4);

      v4 = v5;
    }
    while (-[PGFeatureExtractorPCAPrint featureLength](self, "featureLength") > v5++);
  }
  return v3;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGFeatureExtractorPCAPrint featureValuesForAssets:error:](self, "featureValuesForAssets:error:", v8, a4, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)featureValuesForAssets:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int64_t v15;
  double v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGFeatureExtractorPCAPrint _generateError:code:message:underlyingError:](self, "_generateError:code:message:underlyingError:", a4, 0, CFSTR("PGFingerprintVersionAssetPrintTypeScene2048 print is deprecated. Use PGFingerprintVersionAssetPrintTypeSceneCLIP768 instead."), 0);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1E0D42A48];
        v15 = -[PGFeatureExtractorPCAPrint featureLength](self, "featureLength", (_QWORD)v20);
        LODWORD(v16) = 0;
        objc_msgSend(v14, "vectorRepeatingFloat:count:", v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v18);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  return v7;
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
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosGraph.PGFeatureExtractorPCAPrint"), a4, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

@end
