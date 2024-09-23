@implementation _PSFamilyMLModel

- (_PSFamilyMLModel)init
{
  _PSFamilyMLModel *v2;
  _PSFamilyMLModel *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PSFamilyMLModel;
  v2 = -[_PSFamilyMLModel init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_PSFamilyMLModel initializeModels](v2, "initializeModels");
  return v3;
}

- (_PSFamilyMLModel)initWithActivity:(id)a3
{
  id v5;
  _PSFamilyMLModel *v6;
  _PSFamilyMLModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PSFamilyMLModel;
  v6 = -[_PSFamilyMLModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activity, a3);
    -[_PSFamilyMLModel initializeModels](v7, "initializeModels");
  }

  return v7;
}

- (_PSFamilyMLModel)initWithModels:(id)a3
{
  id v5;
  _PSFamilyMLModel *v6;
  _PSFamilyMLModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PSFamilyMLModel;
  v6 = -[_PSFamilyMLModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_models, a3);

  return v7;
}

- (void)initializeModels
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a1, "count");
  objc_msgSend(a1, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218498;
  v7 = 4;
  v8 = 2048;
  v9 = v4;
  v10 = 2114;
  v11 = v5;
  _os_log_error_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_ERROR, "Failed to load all %tu models (successfully loaded %tu models: %{public}@)", (uint8_t *)&v6, 0x20u);

}

- (void)commonInit
{
  OS_xpc_object *v3;
  id v4;
  OS_xpc_object *v5;
  _PASLazyResult *v6;
  _PASLazyResult *extractor;
  _QWORD v8[4];
  OS_xpc_object *v9;

  v3 = self->_activity;
  v4 = objc_alloc(MEMORY[0x1E0D815E8]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __30___PSFamilyMLModel_commonInit__block_invoke;
  v8[3] = &unk_1E4400168;
  v9 = v3;
  v5 = v3;
  v6 = (_PASLazyResult *)objc_msgSend(v4, "initWithBlock:", v8);
  extractor = self->_extractor;
  self->_extractor = v6;

}

- (BOOL)isFamilyContact:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[_PSFamilyMLModel predictionForContact:](self, "predictionForContact:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureValueForName:", CFSTR("labelFinal"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "int64Value");

  return v5 != 0;
}

- (id)familyProbability:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[_PSFamilyMLModel predictionForContact:](self, "predictionForContact:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureValueForName:", CFSTR("classProbability"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)familiesPredictionForContacts:(id)a3 withMaxSuggestion:(int64_t)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        -[_PSFamilyMLModel familyProbability:](self, "familyProbability:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", &unk_1E442AB68);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v35[0] = v11;
        v35[1] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_msgSend(v6, "insertObject:atIndex:", v14, objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v14, 0, objc_msgSend(v6, "count"), 1024, &__block_literal_global_11));
          if (objc_msgSend(v6, "count") > (unint64_t)a4)
            objc_msgSend(v6, "removeLastObject");
        }
        else
        {
          objc_msgSend(0, "addObject:", v14);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v18);
  }

  v22 = (void *)objc_msgSend(v15, "copy");
  return v22;
}

- (id)predictionForContact:(id)a3 featureDict:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v5 = a4;
  if (+[_PSFamilyUtilities featureDictionaryPassesHeuristic:](_PSFamilyUtilities, "featureDictionaryPassesHeuristic:", v5))
  {
    v9 = 0;
    v6 = (void *)objc_msgSend(objc_alloc((Class)getMLDictionaryFeatureProviderClass_0()), "initWithDictionary:error:", v5, &v9);
    -[_PSFamilyMLModel ensemblePredictionForInputFeatures:](self, "ensemblePredictionForInputFeatures:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)predictionForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_PSFamilyMLModel getFeatureDictForContact:](self, "getFeatureDictForContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSFamilyMLModel predictionForContact:featureDict:](self, "predictionForContact:featureDict:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getFeatureDictForContact:(id)a3
{
  _PASLazyResult *extractor;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  extractor = self->_extractor;
  v4 = a3;
  -[_PASLazyResult result](extractor, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureInputForContact:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = (void *)MEMORY[0x1E0C9AA70];
  v8 = v7;

  return v8;
}

- (id)defaultModelForPrediction
{
  return -[_PSFamilyMLModel getModelWithModelName:](self, "getModelWithModelName:", CFSTR("model_rf"));
}

- (id)getModelWithModelName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_PSFamilyMLModel models](self, "models");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)loadModelFromUrlResource:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForResource:withExtension:", v3, CFSTR("mlmodelc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v6 = (void *)getMLModelClass_softClass_4;
  v18 = getMLModelClass_softClass_4;
  if (!getMLModelClass_softClass_4)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getMLModelClass_block_invoke_4;
    v14[3] = &unk_1E43FEA00;
    v14[4] = &v15;
    __getMLModelClass_block_invoke_4((uint64_t)v14);
    v6 = (void *)v16[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v15, 8);
  v13 = 0;
  objc_msgSend(v7, "modelWithContentsOfURL:error:", v5, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (v9)
  {
    +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[_PSFamilyMLModel loadModelFromUrlResource:].cold.1(v5, (uint64_t)v9, v10);

    v11 = 0;
  }
  else
  {
    v11 = v8;
  }

  return v11;
}

- (id)defaultPredictionForInputFeatures:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v17;

  v4 = a3;
  -[_PSFamilyMLModel defaultModelForPrediction](self, "defaultModelForPrediction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v5, "predictionFromFeatures:error:", v4, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v17;
  if (v7)
  {
    +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_PSFamilyMLModel defaultPredictionForInputFeatures:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

    v15 = 0;
  }
  else
  {
    v15 = v6;
  }

  return v15;
}

- (id)ensemblePredictionForInputFeatures:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _BOOL8 v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  double v38;
  uint64_t i;
  void *v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  _BOOL8 v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[_PSFamilyMLModel getPredictionFromModel:withInputFeatures:](self, "getPredictionFromModel:withInputFeatures:", CFSTR("model_dt"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "featureValueForName:", CFSTR("labelFinal"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "int64Value");

  objc_msgSend(v6, "featureValueForName:", CFSTR("classProbability"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryValue");
  v10 = objc_claimAutoreleasedReturnValue();

  v65 = (void *)v10;
  objc_msgSend(v5, "addObject:", v10);
  -[_PSFamilyMLModel getPredictionFromModel:withInputFeatures:](self, "getPredictionFromModel:withInputFeatures:", CFSTR("model_rf"), v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "featureValueForName:", CFSTR("labelFinal"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "int64Value");

  v14 = v13 + v8;
  v64 = v11;
  objc_msgSend(v11, "featureValueForName:", CFSTR("classProbability"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v16);
  -[_PSFamilyMLModel getPredictionFromModel:withInputFeatures:](self, "getPredictionFromModel:withInputFeatures:", CFSTR("model_gbdt"), v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "featureValueForName:", CFSTR("labelFinal"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "int64Value");

  v20 = v14 + v19;
  objc_msgSend(v17, "featureValueForName:", CFSTR("classProbability"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dictionaryValue");
  v22 = objc_claimAutoreleasedReturnValue();

  v63 = (void *)v22;
  objc_msgSend(v5, "addObject:", v22);
  -[_PSFamilyMLModel getPredictionFromModel:withInputFeatures:](self, "getPredictionFromModel:withInputFeatures:", CFSTR("IP_model_gbdt"), v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "featureValueForName:", CFSTR("target"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "int64Value");

  v26 = v20 + 3 * v25;
  v62 = v23;
  objc_msgSend(v23, "featureValueForName:", CFSTR("classProbability"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dictionaryValue");
  v28 = objc_claimAutoreleasedReturnValue();

  v61 = (void *)v28;
  objc_msgSend(v5, "addObject:", v28);
  v29 = v26 > 1;
  v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v31 = v5;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
  if (v32)
  {
    v33 = v32;
    v59 = v29;
    v60 = v17;
    v34 = v4;
    v35 = v16;
    v36 = v6;
    v37 = *(_QWORD *)v68;
    v38 = 0.0;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v68 != v37)
          objc_enumerationMutation(v31);
        objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "objectForKey:", &unk_1E442AB68, v59, v60);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "doubleValue");
        v42 = v41;

        v38 = v38 + v42;
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    }
    while (v33);
    v43 = v38 * 0.25;
    v6 = v36;
    v16 = v35;
    v4 = v34;
    v29 = v59;
    v17 = v60;
  }
  else
  {
    v43 = 0.0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKey:", v44, &unk_1E442AB68);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 - v43);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKey:", v45, &unk_1E442AB80);

  v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v46, "setObject:forKey:", v30, CFSTR("classProbability"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v29);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setObject:forKey:", v47, CFSTR("labelFinal"));

  v66 = 0;
  v48 = (void *)objc_msgSend(objc_alloc((Class)getMLDictionaryFeatureProviderClass_0()), "initWithDictionary:error:", v46, &v66);
  v49 = v66;
  if (v49)
  {
    +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      -[_PSFamilyMLModel ensemblePredictionForInputFeatures:].cold.1((uint64_t)v49, v50, v51, v52, v53, v54, v55, v56);

    v57 = 0;
  }
  else
  {
    v57 = v48;
  }

  return v57;
}

- (id)getPredictionFromModel:(id)a3 withInputFeatures:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v14;

  v6 = a3;
  v7 = a4;
  -[_PSFamilyMLModel getModelWithModelName:](self, "getModelWithModelName:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v8, "predictionFromFeatures:error:", v7, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v14;
  if (v10)
  {
    +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_PSFamilyMLModel getPredictionFromModel:withInputFeatures:].cold.1();

    v12 = 0;
  }
  else
  {
    v12 = v9;
  }

  return v12;
}

- (NSDictionary)models
{
  return self->_models;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_models, 0);
  objc_storeStrong((id *)&self->_extractor, 0);
}

- (void)loadModelFromUrlResource:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[14];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  v7 = a2;
  _os_log_fault_impl(&dword_1A07F4000, a3, OS_LOG_TYPE_FAULT, "Error loading compiled CoreML Model from path %@ : %@", v6, 0x16u);

}

- (void)defaultPredictionForInputFeatures:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a2, a3, "Error while making prediction from features: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)ensemblePredictionForInputFeatures:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a2, a3, "Error while preparing prediction result for ensemble modeling:  %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getPredictionFromModel:withInputFeatures:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  v3 = v0;
  _os_log_error_impl(&dword_1A07F4000, v1, OS_LOG_TYPE_ERROR, "Error while using %@ model to make prediction from features: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
