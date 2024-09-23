@implementation PGMeaningSceneCriteria

+ (id)criteriaKey
{
  return CFSTR("Scene");
}

+ (id)criteriaWithDictionary:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("positiveScenes"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E0C9AA60];
  if (v6)
    v9 = (void *)v6;
  else
    v9 = (void *)MEMORY[0x1E0C9AA60];
  v10 = v9;

  objc_msgSend(v5, "setPositiveScenes:", v10);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumNumberOfPositiveScenes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  if (v12 <= 1)
    v13 = 1;
  else
    v13 = v12;
  objc_msgSend(v5, "setMinimumNumberOfPositiveScenes:", v13);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumNumberOfNegativeScenes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  if (v15 <= 1)
    v16 = 1;
  else
    v16 = v15;
  objc_msgSend(v5, "setMinimumNumberOfNegativeScenes:", v16);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumNumberOfAssetsWithPositiveScenes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumNumberOfAssetsWithPositiveScenes:", objc_msgSend(v17, "unsignedIntegerValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accumulateAssetCountsWithPositiveScenes"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccumulateAssetCountsWithPositiveScenes:", objc_msgSend(v18, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumNumberOfAssetsWithNegativeScenes"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumNumberOfAssetsWithNegativeScenes:", objc_msgSend(v19, "unsignedIntegerValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumRatioOfAssetsWithPositiveScenes"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  objc_msgSend(v5, "setMinimumRatioOfAssetsWithPositiveScenes:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("negativeScenes"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    v22 = v21;
  else
    v22 = v8;
  v23 = v22;

  objc_msgSend(v5, "setNegativeScenes:", v23);
  return v5;
}

- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD v15[12];
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[4];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;

  v6 = a3;
  v7 = a4;
  -[PGMeaningSceneCriteria positiveScenes](self, "positiveScenes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  -[PGMeaningSceneCriteria negativeScenes](self, "negativeScenes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 | v11)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = v9 == 0;
    v13 = objc_msgSend(v6, "numberOfAssets");
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v19[3] = 0;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v18[3] = 0;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v16[3] = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __62__PGMeaningSceneCriteria_passesForMomentNode_momentNodeCache___block_invoke;
    v15[3] = &unk_1E842A428;
    v15[4] = self;
    v15[5] = &v20;
    v15[6] = v19;
    v15[7] = v17;
    v15[10] = v13;
    v15[11] = v11;
    v15[8] = v18;
    v15[9] = v16;
    objc_msgSend(v7, "enumerateSceneEdgesAndNodesUsingBlock:", v15);
    v12 = *((_BYTE *)v21 + 24) != 0;
    _Block_object_dispose(v16, 8);
    _Block_object_dispose(v17, 8);
    _Block_object_dispose(v18, 8);
    _Block_object_dispose(v19, 8);
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (BOOL)passesForAssets:(id)a3
{
  return 1;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D75250], "sharedTaxonomy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMeaningSceneCriteria positiveScenes](self, "positiveScenes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMeaningSceneCriteria negativeScenes](self, "negativeScenes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v22;
    v12 = 1;
    *(_QWORD *)&v9 = 138412290;
    v20 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "lowercaseString", v20, (_QWORD)v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "nodeForName:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "loggingConnection");
          v18 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v20;
            v26 = v14;
            _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_INFO, "[MEANING CRITERIA] Invalid scene name \"%@\", buf, 0xCu);
          }

          v12 = 0;
        }

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 1;
  }

  return v12 & 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  _BOOL4 v9;
  const __CFString *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMeaningSceneCriteria positiveScenes](self, "positiveScenes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGMeaningSceneCriteria negativeScenes](self, "negativeScenes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "appendFormat:", CFSTR("positiveScenes: %@\n"), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumNumberOfPositiveScenes: %d\n"), -[PGMeaningSceneCriteria minimumNumberOfPositiveScenes](self, "minimumNumberOfPositiveScenes"));
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumNumberOfAssetsWithPositiveScenes: %d\n"), -[PGMeaningSceneCriteria minimumNumberOfAssetsWithPositiveScenes](self, "minimumNumberOfAssetsWithPositiveScenes"));
  -[PGMeaningSceneCriteria minimumRatioOfAssetsWithPositiveScenes](self, "minimumRatioOfAssetsWithPositiveScenes");
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumRatioOfAssetsWithPositiveScenes: %d\n"), (int)v8);
  v9 = -[PGMeaningSceneCriteria accumulateAssetCountsWithPositiveScenes](self, "accumulateAssetCountsWithPositiveScenes");
  v10 = CFSTR("NO");
  if (v9)
    v10 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR("accumulateAssetCountsWithPositiveScenes: %@\n"), v10);
  objc_msgSend(v3, "appendFormat:", CFSTR("negativeScenes: %@\n"), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumNumberOfNegativeScenes: %d\n"), -[PGMeaningSceneCriteria minimumNumberOfNegativeScenes](self, "minimumNumberOfNegativeScenes"));
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumNumberOfAssetsWithNegativeScenes: %d\n"), -[PGMeaningSceneCriteria minimumNumberOfAssetsWithNegativeScenes](self, "minimumNumberOfAssetsWithNegativeScenes"));

  return (NSString *)v3;
}

- (NSArray)positiveScenes
{
  return self->_positiveScenes;
}

- (void)setPositiveScenes:(id)a3
{
  objc_storeStrong((id *)&self->_positiveScenes, a3);
}

- (NSArray)negativeScenes
{
  return self->_negativeScenes;
}

- (void)setNegativeScenes:(id)a3
{
  objc_storeStrong((id *)&self->_negativeScenes, a3);
}

- (unint64_t)minimumNumberOfPositiveScenes
{
  return self->_minimumNumberOfPositiveScenes;
}

- (void)setMinimumNumberOfPositiveScenes:(unint64_t)a3
{
  self->_minimumNumberOfPositiveScenes = a3;
}

- (unint64_t)minimumNumberOfNegativeScenes
{
  return self->_minimumNumberOfNegativeScenes;
}

- (void)setMinimumNumberOfNegativeScenes:(unint64_t)a3
{
  self->_minimumNumberOfNegativeScenes = a3;
}

- (unint64_t)minimumNumberOfAssetsWithPositiveScenes
{
  return self->_minimumNumberOfAssetsWithPositiveScenes;
}

- (void)setMinimumNumberOfAssetsWithPositiveScenes:(unint64_t)a3
{
  self->_minimumNumberOfAssetsWithPositiveScenes = a3;
}

- (BOOL)accumulateAssetCountsWithPositiveScenes
{
  return self->_accumulateAssetCountsWithPositiveScenes;
}

- (void)setAccumulateAssetCountsWithPositiveScenes:(BOOL)a3
{
  self->_accumulateAssetCountsWithPositiveScenes = a3;
}

- (unint64_t)minimumNumberOfAssetsWithNegativeScenes
{
  return self->_minimumNumberOfAssetsWithNegativeScenes;
}

- (void)setMinimumNumberOfAssetsWithNegativeScenes:(unint64_t)a3
{
  self->_minimumNumberOfAssetsWithNegativeScenes = a3;
}

- (double)minimumRatioOfAssetsWithPositiveScenes
{
  return self->_minimumRatioOfAssetsWithPositiveScenes;
}

- (void)setMinimumRatioOfAssetsWithPositiveScenes:(double)a3
{
  self->_minimumRatioOfAssetsWithPositiveScenes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeScenes, 0);
  objc_storeStrong((id *)&self->_positiveScenes, 0);
}

void __62__PGMeaningSceneCriteria_passesForMomentNode_momentNodeCache___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  void *v16;
  int v17;
  unint64_t v18;
  unint64_t v19;
  id v20;

  v20 = a2;
  objc_msgSend(a3, "sceneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "positiveScenes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v7);

    if (v9)
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "accumulateAssetCountsWithPositiveScenes") & 1) != 0
        || (v10 = objc_msgSend(v20, "numberOfHighConfidenceAssets"),
            v10 >= objc_msgSend(*(id *)(a1 + 32), "minimumNumberOfAssetsWithPositiveScenes")))
      {
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v20, "numberOfHighConfidenceAssets");
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      v12 = *(_QWORD *)(a1 + 80);
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (v13 >= objc_msgSend(*(id *)(a1 + 32), "minimumNumberOfPositiveScenes"))
      {
        v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        if (v14 >= objc_msgSend(*(id *)(a1 + 32), "minimumNumberOfAssetsWithPositiveScenes"))
        {
          objc_msgSend(*(id *)(a1 + 32), "minimumRatioOfAssetsWithPositiveScenes");
          if ((double)v11 / (double)v12 >= v15)
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        }
      }
    }
  }
  if (*(_QWORD *)(a1 + 88))
  {
    objc_msgSend(*(id *)(a1 + 32), "negativeScenes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", v7);

    if (v17)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += objc_msgSend(v20, "numberOfHighConfidenceAssets");
      v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      if (v18 >= objc_msgSend(*(id *)(a1 + 32), "minimumNumberOfNegativeScenes"))
      {
        v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        if (v19 >= objc_msgSend(*(id *)(a1 + 32), "minimumNumberOfAssetsWithNegativeScenes"))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          *a4 = 1;
        }
      }
    }
  }

}

@end
