@implementation PPEventRankerFeaturizer

- (PPEventRankerFeaturizer)initWithTrialWrapper:(id)a3
{
  id v5;
  PPEventRankerFeaturizer *v6;
  PPEventRankerFeaturizer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPEventRankerFeaturizer;
  v6 = -[PPEventRankerFeaturizer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_trialWrapper, a3);

  return v7;
}

- (id)featureSchema
{
  void *v2;
  void *v3;
  void *DeepCopy;

  if (featureSchema_once != -1)
    dispatch_once(&featureSchema_once, &__block_literal_global_4191);
  objc_msgSend((id)_cache, "objectForKey:", CFSTR("CK"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "plistForFactorName:namespaceName:", CFSTR("EventRankerFeatureSchema.plist"), CFSTR("PERSONALIZATION_PORTRAIT_EVENTS"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      DeepCopy = 0;
      return DeepCopy;
    }
    objc_msgSend((id)_cache, "setObject:forKey:", v2, CFSTR("CK"));
  }
  DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v2, 2uLL);

  return DeepCopy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialWrapper, 0);
}

uint64_t __40__PPEventRankerFeaturizer_featureSchema__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_cache;
  _cache = v0;

  return objc_msgSend((id)_cache, "setCountLimit:", 1);
}

+ (id)scoreFeatureSchema:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  BOOL v32;
  PPEventFeatureScore *v33;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v38 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  v7 = 0;
  if (objc_msgSend(v6, "count"))
  {
    v8 = 0;
    v9 = 0.0;
    v10 = 0.0;
    v35 = v6;
    do
    {
      v36 = v8;
      v37 = v7;
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1C3BD6630]();
      objc_msgSend(v3, "objectForKeyedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allKeys");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sortedArrayUsingSelector:", sel_compare_);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v12);
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      v18 = 0.0;
      if (v17)
      {
        v19 = v17;
        v20 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v40 != v20)
              objc_enumerationMutation(v16);
            v22 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
            objc_msgSend(v3, "objectForKeyedSubscript:", v11);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Value"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v3, "objectForKeyedSubscript:", v11);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKeyedSubscript:", v22);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Weight"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v38, "addObject:", v25);
            objc_msgSend(v25, "doubleValue");
            v30 = v29;
            objc_msgSend(v28, "doubleValue");
            v18 = v18 + v30 * v31;

          }
          v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        }
        while (v19);
      }

      v10 = v10 + v18;
      v32 = v18 <= v9;
      if (v18 > v9)
        v9 = v18;
      v7 = v37;
      if (!v32)
        v7 = v36;

      v8 = v36 + 1;
      v6 = v35;
    }
    while (v36 + 1 < (unint64_t)objc_msgSend(v35, "count"));
  }
  else
  {
    v10 = 0.0;
  }
  v33 = -[PPEventFeatureScore initWithFeatureValues:weightedScore:prominentFeature:]([PPEventFeatureScore alloc], "initWithFeatureValues:weightedScore:prominentFeature:", v38, v7, v10);

  return v33;
}

+ (void)clearAssetCache
{
  objc_msgSend((id)_cache, "removeAllObjects");
}

@end
