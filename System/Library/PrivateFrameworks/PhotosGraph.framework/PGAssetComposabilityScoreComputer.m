@implementation PGAssetComposabilityScoreComputer

- (PGAssetComposabilityScoreComputer)initWithPhotoLibrary:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  PGAssetComposabilityScoreComputer *v9;
  PGAssetComposabilityScoreComputer *v10;
  uint64_t v11;
  CLSSimilarStacker *similarStacker;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PGAssetComposabilityScoreComputer;
  v9 = -[PGAssetComposabilityScoreComputer init](&v26, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4B260]), "initWithSimilarityModelClass:", objc_opt_class());
    similarStacker = v10->_similarStacker;
    v10->_similarStacker = (CLSSimilarStacker *)v11;

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1838]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_computeDiptychScores = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1840]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_computeTriptychScores = objc_msgSend(v14, "BOOLValue");

    v15 = *MEMORY[0x1E0CD1848];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1848]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      v19 = v18;

      -[CLSSimilarStacker overrideDistanceThreshold:forSimilarity:](v10->_similarStacker, "overrideDistanceThreshold:forSimilarity:", 0, v19);
      -[CLSSimilarStacker overrideDistanceThreshold:forSimilarity:](v10->_similarStacker, "overrideDistanceThreshold:forSimilarity:", 1, v19);
    }
    v20 = *MEMORY[0x1E0CD1850];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1850]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValue");
      v24 = v23;

      -[CLSSimilarStacker overrideDistanceThreshold:forSimilarity:](v10->_similarStacker, "overrideDistanceThreshold:forSimilarity:", 2, v24);
      -[CLSSimilarStacker overrideDistanceThreshold:forSimilarity:](v10->_similarStacker, "overrideDistanceThreshold:forSimilarity:", 3, v24);
      -[CLSSimilarStacker overrideDistanceThreshold:forSimilarity:](v10->_similarStacker, "overrideDistanceThreshold:forSimilarity:", 4, v24);
    }
  }

  return v10;
}

- (id)initForTesting
{
  id result;

  result = -[PGAssetComposabilityScoreComputer initWithPhotoLibrary:options:](self, "initWithPhotoLibrary:options:", 0, MEMORY[0x1E0C9AA70]);
  if (result)
    *((_WORD *)result + 12) = 257;
  return result;
}

- (double)identicalSimilarityThresholdWithSimilarityModelVersion:(unint64_t)a3
{
  double result;

  -[CLSSimilarStacker distanceThresholdForSimilarity:withSimilarityModelVersion:](self->_similarStacker, "distanceThresholdForSimilarity:withSimilarityModelVersion:", 0, a3);
  return result;
}

- (double)semanticalSimilarityThresholdWithSimilarityModelVersion:(unint64_t)a3
{
  double result;

  -[CLSSimilarStacker distanceThresholdForSimilarity:withSimilarityModelVersion:](self->_similarStacker, "distanceThresholdForSimilarity:withSimilarityModelVersion:", 2, a3);
  return result;
}

- (double)bestDistanceWithSimilarityModelVersion:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;

  -[PGAssetComposabilityScoreComputer identicalSimilarityThresholdWithSimilarityModelVersion:](self, "identicalSimilarityThresholdWithSimilarityModelVersion:");
  v6 = v5;
  -[PGAssetComposabilityScoreComputer semanticalSimilarityThresholdWithSimilarityModelVersion:](self, "semanticalSimilarityThresholdWithSimilarityModelVersion:", a3);
  return (v6 + v7) * 0.5;
}

- (double)composabilityScoreWithAssetDistance:(double)a3 similarityModelVersion:(unint64_t)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  double v15;
  double v16;
  double v17;

  -[PGAssetComposabilityScoreComputer identicalSimilarityThresholdWithSimilarityModelVersion:](self, "identicalSimilarityThresholdWithSimilarityModelVersion:");
  v8 = v7;
  -[PGAssetComposabilityScoreComputer semanticalSimilarityThresholdWithSimilarityModelVersion:](self, "semanticalSimilarityThresholdWithSimilarityModelVersion:", a4);
  v10 = (v9 - v8) * 0.1;
  v11 = v8 + v10;
  v12 = v8 - v10 >= a3 || v11 <= a3;
  if (!v12)
    return (a3 - v8 + v10) / (v10 + v10);
  v13 = v9 - v10;
  v17 = 1.0;
  if (v11 > a3 || v13 < a3)
  {
    v17 = 0.0;
    if (v13 < a3)
    {
      v15 = v9 + v10;
      v12 = v15 <= a3;
      v16 = (v15 - a3) / (v10 + v10);
      if (!v12)
        return v16;
    }
  }
  return v17;
}

- (double)composabilityScoreWithAssetDistance:(double)a3 andDistance:(double)a4 andDistance:(double)a5 similarityModelVersion:(unint64_t)a6
{
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  -[PGAssetComposabilityScoreComputer composabilityScoreWithAssetDistance:similarityModelVersion:](self, "composabilityScoreWithAssetDistance:similarityModelVersion:", a3);
  v11 = v10;
  -[PGAssetComposabilityScoreComputer composabilityScoreWithAssetDistance:similarityModelVersion:](self, "composabilityScoreWithAssetDistance:similarityModelVersion:", a6, a4);
  v13 = v12;
  -[PGAssetComposabilityScoreComputer composabilityScoreWithAssetDistance:similarityModelVersion:](self, "composabilityScoreWithAssetDistance:similarityModelVersion:", a6, a5);
  return (v11 + v13 + v14) / 3.0;
}

- (id)composabilityScoresOfAssetsForLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  double v23;
  uint64_t v24;
  double v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  int v39;
  int v40;
  int v41;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  int v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _QWORD v67[6];

  v67[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_computeDiptychScores)
    v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v46 = 0;
  if (self->_computeTriptychScores)
    v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v45 = 0;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CD1A60];
  v67[0] = *MEMORY[0x1E0CD19C0];
  v67[1] = v6;
  v7 = *MEMORY[0x1E0CD19F0];
  v67[2] = *MEMORY[0x1E0CD1A50];
  v67[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchPropertySets:", v8);

  v44 = v5;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v4, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0D77E18]);
  objc_msgSend(v9, "fetchedObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v10;
  objc_msgSend(v10, "prepareAssets:", v11);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v56 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v18, "localIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
    }
    while (v15);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v4;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
  if (v20)
  {
    v21 = v20;
    v49 = 0;
    v50 = 0;
    v22 = 0;
    v48 = *(_QWORD *)v52;
    v23 = 1.79769313e308;
    do
    {
      v24 = 0;
      v25 = v23;
      v26 = v22;
      do
      {
        if (*(_QWORD *)v52 != v48)
          objc_enumerationMutation(obj);
        v27 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v24);
        v28 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v12, "objectForKeyedSubscript:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v29;
        if (v49 + v24)
        {
          v30 = v12;
          v31 = objc_msgSend(v29, "clsSimilarityModelVersion");
          -[CLSSimilarStacker distanceBetweenItem:andItem:](self->_similarStacker, "distanceBetweenItem:andItem:", v22, v26);
          v23 = v32;
          if (self->_computeDiptychScores)
          {
            -[PGAssetComposabilityScoreComputer composabilityScoreWithAssetDistance:similarityModelVersion:](self, "composabilityScoreWithAssetDistance:similarityModelVersion:", v31, v32);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "addObject:", v33);

          }
          if (self->_computeTriptychScores && (unint64_t)(v49 + v24) >= 2)
          {
            -[CLSSimilarStacker distanceBetweenItem:andItem:](self->_similarStacker, "distanceBetweenItem:andItem:", v22, v50);
            -[PGAssetComposabilityScoreComputer composabilityScoreWithAssetDistance:andDistance:andDistance:similarityModelVersion:](self, "composabilityScoreWithAssetDistance:andDistance:andDistance:similarityModelVersion:", v31, v25, v23, v34);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "addObject:", v35);

          }
          v36 = v26;

          v50 = v36;
          v25 = v23;
          v12 = v30;
        }
        else
        {
          v23 = v25;
        }

        objc_autoreleasePoolPop(v28);
        ++v24;
        v26 = v22;
      }
      while (v21 != v24);
      v49 += v21;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
    }
    while (v21);

  }
  else
  {
    v50 = 0;
  }

  v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v38 = v37;
  if (self->_computeDiptychScores)
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v46, *MEMORY[0x1E0CD1858]);
  if (self->_computeTriptychScores)
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v45, *MEMORY[0x1E0CD1860]);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v39 = objc_msgSend(v46, "count");
    v40 = objc_msgSend(v45, "count");
    v41 = objc_msgSend(obj, "count");
    *(_DWORD *)buf = 67109632;
    v60 = v39;
    v61 = 1024;
    v62 = v40;
    v63 = 1024;
    v64 = v41;
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "composabilityScoresOfAssetsForLocalIdentifiers returning %d diptych scores and %d triptych scores for %d input assets", buf, 0x14u);
  }

  return v38;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_similarStacker, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
