@implementation PPMostCommonFeatureValue

- (id)_dominantItem
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  if (!-[NSCountedSet count](self->_itemCounts, "count"))
    return 0;
  -[NSCountedSet allObjects](self->_itemCounts, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__PPMostCommonFeatureValue__dominantItem__block_invoke;
  v7[3] = &unk_1E7E151C0;
  v7[4] = self;
  objc_msgSend(v3, "sortedArrayUsingComparator:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)itemCounts
{
  return self->_itemCounts;
}

- (PPMostCommonFeatureValue)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  id v6;
  PPMostCommonFeatureValue *v7;
  uint64_t v8;
  NSCountedSet *itemCounts;
  uint64_t v10;
  NSString *featureName;
  uint64_t v12;
  NSString *dominantItemFeatureValueKey;
  uint64_t v14;
  NSString *dominantItemCountFeatureValueKey;
  objc_super v17;

  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PPMostCommonFeatureValue;
  v7 = -[PPMostCommonFeatureValue init](&v17, sel_init);
  if (v7)
  {
    v8 = objc_opt_new();
    itemCounts = v7->_itemCounts;
    v7->_itemCounts = (NSCountedSet *)v8;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("feature_name"));
    v10 = objc_claimAutoreleasedReturnValue();
    featureName = v7->_featureName;
    v7->_featureName = (NSString *)v10;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dominant_item_name"));
    v12 = objc_claimAutoreleasedReturnValue();
    dominantItemFeatureValueKey = v7->_dominantItemFeatureValueKey;
    v7->_dominantItemFeatureValueKey = (NSString *)v12;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dominant_item_count_name"));
    v14 = objc_claimAutoreleasedReturnValue();
    dominantItemCountFeatureValueKey = v7->_dominantItemCountFeatureValueKey;
    v7->_dominantItemCountFeatureValueKey = (NSString *)v14;

  }
  return v7;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSCountedSet *itemCounts;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSString *dominantItemCountFeatureValueKey;
  void *v19;
  NSString *featureName;
  _QWORD v22[2];
  _QWORD v23[2];
  uint8_t buf[4];
  id v25;
  __int16 v26;
  NSString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "featureValueForName:", self->_featureName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "type") != 7)
    {
      -[NSCountedSet addObject:](self->_itemCounts, "addObject:", v9);
LABEL_13:
      -[PPMostCommonFeatureValue _dominantItem](self, "_dominantItem");
      v13 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLong:", -[NSCountedSet countForObject:](self->_itemCounts, "countForObject:", v13));
      v17 = objc_alloc(MEMORY[0x1E0C9E8F8]);
      dominantItemCountFeatureValueKey = self->_dominantItemCountFeatureValueKey;
      v22[0] = self->_dominantItemFeatureValueKey;
      v22[1] = dominantItemCountFeatureValueKey;
      v23[0] = v13;
      v23[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v17, "initWithDictionary:error:", v19, a5);

      goto LABEL_14;
    }
    objc_msgSend(v9, "sequenceValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "type") == 3)
    {
      itemCounts = self->_itemCounts;
      objc_msgSend(v10, "stringValues");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v10, "type") != 1)
      {
LABEL_12:

        goto LABEL_13;
      }
      itemCounts = self->_itemCounts;
      objc_msgSend(v10, "int64Values");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v12;
    -[NSCountedSet addObjectsFromArray:](itemCounts, "addObjectsFromArray:", v12);

    goto LABEL_12;
  }
  pp_default_log_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    featureName = self->_featureName;
    *(_DWORD *)buf = 138412546;
    v25 = v7;
    v26 = 2112;
    v27 = featureName;
    _os_log_fault_impl(&dword_1C392E000, v13, OS_LOG_TYPE_FAULT, "predictionFromFeatures:options:error: failed to get feature value from %@ for %@", buf, 0x16u);
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  NSCountedSet *v11;
  NSCountedSet *itemCounts;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSCountedSet *v18;
  NSCountedSet *v19;
  id v20;
  NSString *dominantItemCountFeatureValueKey;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  NSString *featureName;
  void *v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[2];
  uint8_t buf[4];
  id v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  NSString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (NSCountedSet *)objc_opt_new();
  itemCounts = self->_itemCounts;
  self->_itemCounts = v11;

  if (objc_msgSend(v9, "count") < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPNamedEntityUtils.m"), 96, CFSTR("MLBatchProvider has a negative count: %td"), objc_msgSend(v9, "count"));

  }
  if (objc_msgSend(v9, "count"))
  {
    v13 = 0;
    while (1)
    {
      objc_msgSend(v9, "featuresAtIndex:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "featureValueForName:", self->_featureName);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        break;
      -[NSCountedSet addObject:](self->_itemCounts, "addObject:", v15);

      if (++v13 >= (unint64_t)objc_msgSend(v9, "count"))
        goto LABEL_7;
    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      featureName = self->_featureName;
      *(_DWORD *)buf = 138412802;
      v35 = v9;
      v36 = 2048;
      v37 = v13;
      v38 = 2112;
      v39 = featureName;
      _os_log_fault_impl(&dword_1C392E000, v16, OS_LOG_TYPE_FAULT, "predictionsFromBatch:options:error: failed to get feature value from %@ at %tu for %@", buf, 0x20u);
    }
    v27 = 0;
  }
  else
  {
LABEL_7:
    -[PPMostCommonFeatureValue _dominantItem](self, "_dominantItem");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLong:", -[NSCountedSet countForObject:](self->_itemCounts, "countForObject:", v16));
    v18 = (NSCountedSet *)objc_opt_new();
    v19 = self->_itemCounts;
    self->_itemCounts = v18;

    v20 = objc_alloc(MEMORY[0x1E0C9E8F8]);
    dominantItemCountFeatureValueKey = self->_dominantItemCountFeatureValueKey;
    v32[0] = self->_dominantItemFeatureValueKey;
    v32[1] = dominantItemCountFeatureValueKey;
    v33[0] = v16;
    v33[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v20, "initWithDictionary:error:", v22, a5);

    if (v23)
    {
      v24 = objc_alloc(MEMORY[0x1E0C9E8E0]);
      v25 = (void *)MEMORY[0x1C3BD6630]();
      v31 = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v25);
      v27 = (void *)objc_msgSend(v24, "initWithFeatureProviderArray:", v26);

    }
    else
    {
      v27 = 0;
    }

  }
  return v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dominantItemCountFeatureValueKey, 0);
  objc_storeStrong((id *)&self->_dominantItemFeatureValueKey, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_itemCounts, 0);
}

uint64_t __41__PPMostCommonFeatureValue__dominantItem__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = a3;
  v7 = objc_msgSend(v5, "countForObject:", a2);
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "countForObject:", v6);

  v9 = -1;
  if (v7 >= v8)
    v9 = 1;
  if (v7 == v8)
    return 0;
  else
    return v9;
}

@end
