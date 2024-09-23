@implementation PGMeaningActionCriteria

+ (id)criteriaKey
{
  return CFSTR("Action");
}

+ (PGMeaningActionCriteria)criteriaWithDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActionValue:", (int)objc_msgSend(v6, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActionName:", v7);

  objc_msgSend(a1, "parseThresholdFromCriteriaDictionary:usingActionThresholdKey:", v4, CFSTR("confidenceHighPrecisionThreshold"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighPrecisionThresholdByMediaAnalysisVersion:", v8);

  objc_msgSend(a1, "parseThresholdFromCriteriaDictionary:usingActionThresholdKey:", v4, CFSTR("confidenceHighRecallThreshold"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighRecallThresholdByMediaAnalysisVersion:", v9);

  objc_msgSend(a1, "descendingSortedMediaAnalysisVersionFromCriteriaDictionary:usingActionThresholdKey:", v4, CFSTR("confidenceHighPrecisionThreshold"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDescendingSortedMediaAnalysisVersion:", v10);
  return (PGMeaningActionCriteria *)v5;
}

+ (id)parseThresholdFromCriteriaDictionary:(id)a3 usingActionThresholdKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("operatingPoints"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__PGMeaningActionCriteria_parseThresholdFromCriteriaDictionary_usingActionThresholdKey___block_invoke;
  v15[3] = &unk_1E8430348;
  v16 = v6;
  v9 = v8;
  v17 = v9;
  v18 = v5;
  v10 = v5;
  v11 = v6;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v15);
  v12 = v18;
  v13 = v9;

  return v13;
}

+ (id)descendingSortedMediaAnalysisVersionFromCriteriaDictionary:(id)a3 usingActionThresholdKey:(id)a4
{
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("operatingPoints"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v7, "setNumberStyle:", 1);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v4, "allKeys", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "numberFromString:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingDescriptors:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v16;
  }

  return v5;
}

+ (id)actionValueStringUsingActionCriteriaByValidPersonActivityMeaningLabel:(id)a3 withPersonActivityMeaningLabel:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v8, "actionValue"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_1E8436F28;
  }

  return v9;
}

+ (double)actionHighRecallThresholdForAssetMediaAnalysisVersion:(unint64_t)a3 usingActionCriteriaByValidPersonActivityMeaningLabel:(id)a4 andValidPersonActivity:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v7 = a4;
  v8 = a5;
  if (v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "highRecallThresholdByMediaAnalysisVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v9, "highRecallThresholdByMediaAnalysisVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "actionThresholdForAssetMediaAnalysisVersion:withActionThresholdByMediaAnalysisVersion:", a3, v11);
      v13 = v12;

    }
    else
    {
      v13 = 1.0;
    }

  }
  else
  {
    v13 = 1.0;
  }

  return v13;
}

void __88__PGMeaningActionCriteria_parseThresholdFromCriteriaDictionary_usingActionThresholdKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  float v8;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "floatValue");
    if (v8 > 0.0 && v8 < 1.0)
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v5);
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loggingConnection");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("actionName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "stringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v12;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v13;
      _os_log_error_impl(&dword_1CA237000, v11, OS_LOG_TYPE_ERROR, "[PGMeaningActionCriteria] Action %@ version %@ has invalid threshold %@", (uint8_t *)&v14, 0x20u);

    }
  }

}

- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4
{
  return 1;
}

- (BOOL)passesForAssets:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  id v16;
  _QWORD v17[7];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = a3;
  if (objc_msgSend(v16, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = v16;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v8, "clsFaceInformationSummary");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "faceInformationByPersonLocalIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "mediaAnalysisProperties");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "mediaAnalysisVersion");

          if (v12)
          {
            -[PGMeaningActionCriteria actionThresholdForAssetMediaAnalysisVersion:withActionThresholdByMediaAnalysisVersion:](self, "actionThresholdForAssetMediaAnalysisVersion:withActionThresholdByMediaAnalysisVersion:", v12, self->_highPrecisionThresholdByMediaAnalysisVersion);
            v17[0] = MEMORY[0x1E0C809B0];
            v17[1] = 3221225472;
            v17[2] = __43__PGMeaningActionCriteria_passesForAssets___block_invoke;
            v17[3] = &unk_1E8430320;
            v17[4] = self;
            v17[5] = &v22;
            v17[6] = v13;
            objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v17);
            if (*((_BYTE *)v23 + 24))
            {

              goto LABEL_13;
            }
          }

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_13:

  }
  v14 = *((_BYTE *)v23 + 24) != 0;
  _Block_object_dispose(&v22, 8);

  return v14;
}

- (BOOL)passesCriteriaWithTrait:(id)a3 withHighPrecisionThreshold:(double)a4
{
  id v6;
  double v7;
  BOOL v8;

  v6 = a3;
  if (objc_msgSend(v6, "type") == 1 && self->_actionValue == (int)objc_msgSend(v6, "value"))
  {
    objc_msgSend(v6, "score");
    v8 = v7 >= a4;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isValid
{
  return 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMeaningActionCriteria actionName](self, "actionName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@\n"), CFSTR("actionName"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %lu\n"), CFSTR("actionValue"), -[PGMeaningActionCriteria actionValue](self, "actionValue"));
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[PGMeaningActionCriteria highPrecisionThresholdByMediaAnalysisVersion](self, "highPrecisionThresholdByMediaAnalysisVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v10);
        -[PGMeaningActionCriteria highPrecisionThresholdByMediaAnalysisVersion](self, "highPrecisionThresholdByMediaAnalysisVersion");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("High Precision Threshold for version %@: %@\n"), v11, v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v8);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[PGMeaningActionCriteria highRecallThresholdByMediaAnalysisVersion](self, "highRecallThresholdByMediaAnalysisVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v19);
        -[PGMeaningActionCriteria highRecallThresholdByMediaAnalysisVersion](self, "highRecallThresholdByMediaAnalysisVersion");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKey:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("High Recall Threshold for version %@: %@\n"), v20, v22);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v17);
  }

  return (NSString *)v3;
}

- (double)actionThresholdForAssetMediaAnalysisVersion:(unint64_t)a3 withActionThresholdByMediaAnalysisVersion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PGMeaningActionCriteria descendingSortedMediaAnalysisVersion](self, "descendingSortedMediaAnalysisVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 1.0;
  if (v8 && objc_msgSend(v8, "unsignedIntValue") <= a3)
  {
    v10 = v8;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[PGMeaningActionCriteria descendingSortedMediaAnalysisVersion](self, "descendingSortedMediaAnalysisVersion", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v16, "unsignedIntValue") <= a3)
          {
            v17 = v16;

            v10 = v17;
            goto LABEL_13;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_13:

    objc_msgSend(v10, "stringValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v19, "doubleValue");
      v9 = v20;
    }
    else
    {
      v9 = 1.0;
    }

  }
  return v9;
}

- (NSString)actionName
{
  return self->_actionName;
}

- (void)setActionName:(id)a3
{
  objc_storeStrong((id *)&self->_actionName, a3);
}

- (int64_t)actionValue
{
  return self->_actionValue;
}

- (void)setActionValue:(int64_t)a3
{
  self->_actionValue = a3;
}

- (NSDictionary)highPrecisionThresholdByMediaAnalysisVersion
{
  return self->_highPrecisionThresholdByMediaAnalysisVersion;
}

- (void)setHighPrecisionThresholdByMediaAnalysisVersion:(id)a3
{
  objc_storeStrong((id *)&self->_highPrecisionThresholdByMediaAnalysisVersion, a3);
}

- (NSDictionary)highRecallThresholdByMediaAnalysisVersion
{
  return self->_highRecallThresholdByMediaAnalysisVersion;
}

- (void)setHighRecallThresholdByMediaAnalysisVersion:(id)a3
{
  objc_storeStrong((id *)&self->_highRecallThresholdByMediaAnalysisVersion, a3);
}

- (NSArray)descendingSortedMediaAnalysisVersion
{
  return self->_descendingSortedMediaAnalysisVersion;
}

- (void)setDescendingSortedMediaAnalysisVersion:(id)a3
{
  objc_storeStrong((id *)&self->_descendingSortedMediaAnalysisVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descendingSortedMediaAnalysisVersion, 0);
  objc_storeStrong((id *)&self->_highRecallThresholdByMediaAnalysisVersion, 0);
  objc_storeStrong((id *)&self->_highPrecisionThresholdByMediaAnalysisVersion, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
}

void __43__PGMeaningActionCriteria_passesForAssets___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "traits");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "passesCriteriaWithTrait:withHighPrecisionThreshold:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), *(double *)(a1 + 48), (_QWORD)v11);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        {
          *a4 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

}

@end
