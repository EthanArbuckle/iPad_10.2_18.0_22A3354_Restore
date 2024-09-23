@implementation _PSFamilyFeatureExtractor

- (_PSFamilyFeatureExtractor)initWithActivity:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  _PSFamilyFeatureExtractor *v8;

  v4 = (objc_class *)MEMORY[0x1E0D15878];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithActivity:", v5);

  +[_PSFamilyUtilities featureSet](_PSFamilyUtilities, "featureSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_PSFamilyFeatureExtractor initWith:featureSet:](self, "initWith:featureSet:", v6, v7);

  return v8;
}

- (_PSFamilyFeatureExtractor)init
{
  void *v3;
  void *v4;
  _PSFamilyFeatureExtractor *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D15878]), "initWithActivity:", 0);
  +[_PSFamilyUtilities featureSet](_PSFamilyUtilities, "featureSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_PSFamilyFeatureExtractor initWith:featureSet:](self, "initWith:featureSet:", v3, v4);

  return v5;
}

- (_PSFamilyFeatureExtractor)initWith:(id)a3 featureSet:(id)a4
{
  id v7;
  id v8;
  _PSFamilyFeatureExtractor *v9;
  _PSFamilyFeatureExtractor *v10;
  id v11;
  uint64_t v12;
  _PASLazyResult *reusableEventDictsState;
  _QWORD v15[4];
  id v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_PSFamilyFeatureExtractor;
  v9 = -[_PSFamilyFeatureExtractor init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_task, a3);
    objc_storeStrong((id *)&v10->_featureSet, a4);
    v11 = objc_alloc(MEMORY[0x1E0D815E8]);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __49___PSFamilyFeatureExtractor_initWith_featureSet___block_invoke;
    v15[3] = &unk_1E43FF8B0;
    v16 = v7;
    v12 = objc_msgSend(v11, "initWithBlock:", v15);
    reusableEventDictsState = v10->_reusableEventDictsState;
    v10->_reusableEventDictsState = (_PASLazyResult *)v12;

  }
  return v10;
}

- (id)_featureInputForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_PASLazyResult result](self->_reusableEventDictsState, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSFamilyFeatureExtractor task](self, "task");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventDictForContact:usingState:", v4, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[_PSFamilyFeatureExtractor featureSet](self, "featureSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v9)
    {
      v10 = v9;
      v18 = v5;
      v19 = v4;
      v11 = 0;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKeyedSubscript:", v14, v18, v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
          {
            +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v25 = v14;
              _os_log_debug_impl(&dword_1A07F4000, v16, OS_LOG_TYPE_DEBUG, "feature %{public}@ not found in feature set", buf, 0xCu);
            }

            if (!v11)
              v11 = (void *)objc_msgSend(v7, "mutableCopy");
            objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E442A988, v14);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v10);

      if (!v11)
      {
        v5 = v18;
        v4 = v19;
        goto LABEL_20;
      }
      v8 = v7;
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v11);
      v5 = v18;
      v4 = v19;
    }
    else
    {
      v11 = 0;
    }

LABEL_20:
    v7 = v7;

  }
  return v7;
}

- (id)featureInputForContact:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[_PSFamilyFeatureExtractor _featureInputForContact:](self, "_featureInputForContact:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA70];
  v5 = v3;

  return v5;
}

- (id)featureInputsForContacts:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1A1AFCA24](v7);
        -[_PSFamilyFeatureExtractor _featureInputForContact:](self, "_featureInputForContact:", v11, (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v14);

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v8 = v7;
    }
    while (v7);
  }

  v15 = (void *)objc_msgSend(v5, "copy");
  return v15;
}

- (_CDCloudFamilyDataCollectionTask)task
{
  return self->_task;
}

- (NSSet)featureSet
{
  return self->_featureSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureSet, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_reusableEventDictsState, 0);
}

@end
