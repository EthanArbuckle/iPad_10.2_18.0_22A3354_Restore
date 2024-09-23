@implementation REMLLinearModel

void __43__REMLLinearModel__loadModelFromURL_error___block_invoke(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  id obj;

  v7 = (void *)a1[4];
  v8 = a3;
  objc_msgSend(v7, "URLByAppendingPathComponent:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v10 + 40);
  v11 = objc_msgSend(v8, "loadModelFromURL:error:", v9, &obj);

  objc_storeStrong((id *)(v10 + 40), obj);
  if ((v11 & 1) == 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }

}

- (BOOL)requiresDirectory
{
  return 1;
}

- (BOOL)_loadModelFromURL:(id)a3 error:(id *)a4
{
  id v6;
  NSDictionary *models;
  id v8;
  char v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__24;
  v19 = __Block_byref_object_dispose__24;
  v20 = 0;
  models = self->_models;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __43__REMLLinearModel__loadModelFromURL_error___block_invoke;
  v11[3] = &unk_24CF8F8F0;
  v8 = v6;
  v12 = v8;
  v13 = &v15;
  v14 = &v21;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](models, "enumerateKeysAndObjectsUsingBlock:", v11);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v9 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __38__REMLLinearModel_setMetricsRecorder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__REMLLinearModel_setMetricsRecorder___block_invoke_2;
  v4[3] = &unk_24CF8F9E0;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a3, "enumerateModels:", v4);

}

uint64_t __38__REMLLinearModel_setMetricsRecorder___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMetricsRecorder:", *(_QWORD *)(a1 + 32));
}

- (void)setMetricsRecorder:(id)a3
{
  id v4;
  NSDictionary *models;
  id v6;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMLLinearModel;
  -[REMLModel setMetricsRecorder:](&v9, sel_setMetricsRecorder_, v4);
  models = self->_models;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__REMLLinearModel_setMetricsRecorder___block_invoke;
  v7[3] = &unk_24CF8FA08;
  v8 = v4;
  v6 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](models, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (REMLLinearModel)initWithFeatureSet:(id)a3 interactionDescriptors:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  REMLLinearModel *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *models;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)REMLLinearModel;
  LODWORD(v8) = 0;
  LODWORD(v9) = 0;
  v10 = -[REMLModel initWithFeatureSet:priorMean:modelVarianceEpsilon:](&v28, sel_initWithFeatureSet_priorMean_modelVarianceEpsilon_, v6, v8, v9);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v23 = v7;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          +[_REMLWeightedModel weightedModelWithDescriptor:featureSet:](_REMLWeightedModel, "weightedModelWithDescriptor:featureSet:", v17, v6);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, v19);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v14);
    }

    v20 = objc_msgSend(v11, "copy");
    models = v10->_models;
    v10->_models = (NSDictionary *)v20;

    v7 = v23;
  }

  return v10;
}

- (void)trainWithFeatures:(id)a3 positiveEvent:(id)a4 interaction:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)REMLLinearModel;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[REMLModel trainWithFeatures:positiveEvent:](&v12, sel_trainWithFeatures_positiveEvent_, v10, v9);
  -[NSDictionary objectForKeyedSubscript:](self->_models, "objectForKeyedSubscript:", v8, v12.receiver, v12.super_class);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "trainModelWithFeatureMap:positiveEvent:", v10, v9);
}

- (void)_clearCache
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)REMLLinearModel;
  -[REMLModel _clearCache](&v12, sel__clearCache);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[NSDictionary allValues](self->_models, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "enumerateModels:", &__block_literal_global_54);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

uint64_t __30__REMLLinearModel__clearCache__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_clearCache");
}

- (void)_enumerateModelsForFeatureMap:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  NSDictionary *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (v7)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    obj = self->_models;
    v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          -[NSDictionary objectForKeyedSubscript:](self->_models, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "selectionFeature");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14
            || objc_msgSend(v6, "hasValueForFeature:", v14)
            && REBooleanValueForTaggedPointer(objc_msgSend(v6, "valueForFeature:", v14)))
          {
            v7[2](v7, v12, v13);
          }

        }
        v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

  }
}

- (id)predictionSetWithFeatures:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  REMLPredictionSet *v8;
  void *v9;
  void *v10;
  REMLPredictionSet *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  id v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSDictionary count](self->_models, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __45__REMLLinearModel_predictionSetWithFeatures___block_invoke;
  v16 = &unk_24CF8F8A0;
  v17 = v5;
  v18 = v4;
  v6 = v4;
  v7 = v5;
  -[REMLLinearModel _enumerateModelsForFeatureMap:usingBlock:](self, "_enumerateModelsForFeatureMap:usingBlock:", v6, &v13);
  v8 = [REMLPredictionSet alloc];
  -[REMLModel predictWithFeatures:](self, "predictWithFeatures:", v6, v13, v14, v15, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "copy");
  v11 = -[REMLPredictionSet initWithPrediction:predictionMap:](v8, "initWithPrediction:predictionMap:", v9, v10);

  return v11;
}

void __45__REMLLinearModel_predictionSetWithFeatures___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(a3, "predictWithFeatures:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

- (id)_predictWithFeatures:(id)a3
{
  id v4;
  int v5;
  char v6;
  void *v7;
  id v8;
  id v9;
  float *v10;
  float *v11;
  float *v12;
  float *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  char v35;
  uint64_t v36;
  float *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  float *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  float *v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  float *v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  float *v53;
  uint64_t v54;
  int v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v52 = 0;
  v53 = (float *)&v52;
  v54 = 0x2020000000;
  v55 = 0;
  v48 = 0;
  v49 = (float *)&v48;
  v50 = 0x2020000000;
  v51 = 0;
  v44 = 0;
  v45 = (float *)&v44;
  v46 = 0x2020000000;
  v47 = 0;
  v40 = 0;
  v41 = (float *)&v40;
  v42 = 0x2020000000;
  v43 = 0;
  v36 = 0;
  v37 = (float *)&v36;
  v38 = 0x2020000000;
  v39 = 0;
  v5 = REMLExplanationsEnabled();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __40__REMLLinearModel__predictWithFeatures___block_invoke;
  v27[3] = &unk_24CF8F8C8;
  v8 = v4;
  v28 = v8;
  v35 = v6;
  v9 = v7;
  v29 = v9;
  v30 = &v36;
  v31 = &v52;
  v32 = &v48;
  v33 = &v44;
  v34 = &v40;
  -[REMLLinearModel _enumerateModelsForFeatureMap:usingBlock:](self, "_enumerateModelsForFeatureMap:usingBlock:", v8, v27);
  v10 = v37;
  v11 = v53;
  v53[6] = v53[6] / v37[6];
  v12 = v49;
  v49[6] = v49[6] / v10[6];
  v13 = v45;
  v45[6] = v45[6] / v10[6];
  v41[6] = v41[6] / v10[6];
  *(float *)&v14 = v13[6];
  *(float *)&v15 = v11[6];
  *(float *)&v16 = v12[6];
  +[REMLPrediction predictionWithProbability:mean:variance:pessimistic:](REMLPrediction, "predictionWithProbability:mean:variance:pessimistic:", v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (REMLExplanationsEnabled())
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v18 = v9;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v56, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v24;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v18);
          objc_msgSend(v17, "addExplanation:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v21++), (_QWORD)v23);
        }
        while (v19 != v21);
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v56, 16);
      }
      while (v19);
    }

  }
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);

  return v17;
}

void __40__REMLLinearModel__predictWithFeatures___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "predictWithFeatures:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*(_BYTE *)(a1 + 88))
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v4, "explanations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v7);

  }
  objc_msgSend(v18, "weight");
  v9 = v8;
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8
                                                             + *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(v5, "probability");
  v11 = v10;
  objc_msgSend(v5, "bias");
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
                                                             + (float)(v9 * (float)(v11 + v12));
  objc_msgSend(v5, "variance");
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
                                                             + (float)(v9 * v13);
  objc_msgSend(v5, "probability");
  v15 = v14;
  objc_msgSend(v5, "bias");
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
                                                             + (float)(v9 * (float)(v15 + v16));
  objc_msgSend(v5, "pessimistic");
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24)
                                                             + (float)(v9 * v17);

}

- (BOOL)_saveModelToURL:(id)a3 error:(id *)a4
{
  id v6;
  NSDictionary *models;
  id v8;
  char v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__24;
  v19 = __Block_byref_object_dispose__24;
  v20 = 0;
  models = self->_models;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __41__REMLLinearModel__saveModelToURL_error___block_invoke;
  v11[3] = &unk_24CF8F8F0;
  v8 = v6;
  v12 = v8;
  v13 = &v15;
  v14 = &v21;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](models, "enumerateKeysAndObjectsUsingBlock:", v11);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v9 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __41__REMLLinearModel__saveModelToURL_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char v16;
  id v17;
  id obj;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v11 + 40);
  v12 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, &obj);
  objc_storeStrong((id *)(v11 + 40), obj);

  if (!v12)
    goto LABEL_3;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = 0;

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v17 = *(id *)(v15 + 40);
  v16 = objc_msgSend(v7, "saveModelToURL:error:", v8, &v17);
  objc_storeStrong((id *)(v15 + 40), v17);
  if ((v16 & 1) == 0)
  {
LABEL_3:
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

- (void)_clearModel
{
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](self->_models, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_13_2);
}

uint64_t __30__REMLLinearModel__clearModel__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "enumerateModels:", &__block_literal_global_14_2);
}

uint64_t __30__REMLLinearModel__clearModel__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_clearModel");
}

- (float)_getAveragePrediction
{
  void *v2;
  void *v3;
  float v4;
  _QWORD v6[5];
  uint64_t v7;
  float *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = (float *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[NSDictionary allValues](self->_models, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__REMLLinearModel__getAveragePrediction__block_invoke;
  v6[3] = &unk_24CF8F978;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateModels:", v6);

  v4 = v8[6];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __40__REMLLinearModel__getAveragePrediction__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  int v4;

  result = objc_msgSend(a2, "_getAveragePrediction");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (float)_getNormalizedEntropy
{
  void *v2;
  void *v3;
  float v4;
  _QWORD v6[5];
  uint64_t v7;
  float *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = (float *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[NSDictionary allValues](self->_models, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__REMLLinearModel__getNormalizedEntropy__block_invoke;
  v6[3] = &unk_24CF8F978;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateModels:", v6);

  v4 = v8[6];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __40__REMLLinearModel__getNormalizedEntropy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  int v4;

  result = objc_msgSend(a2, "_getNormalizedEntropy");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (int64_t)_getNumberOfCoordinates
{
  void *v2;
  void *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[NSDictionary allValues](self->_models, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__REMLLinearModel__getNumberOfCoordinates__block_invoke;
  v6[3] = &unk_24CF8F978;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateModels:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __42__REMLLinearModel__getNumberOfCoordinates__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "_getNumberOfCoordinates");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (unint64_t)_getTotalExampleCount
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[NSDictionary allValues](self->_models, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__REMLLinearModel__getTotalExampleCount__block_invoke;
  v6[3] = &unk_24CF8F978;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateModels:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __40__REMLLinearModel__getTotalExampleCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "_getTotalExampleCount");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (unint64_t)_getTotalPositiveCount
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[NSDictionary allValues](self->_models, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__REMLLinearModel__getTotalPositiveCount__block_invoke;
  v6[3] = &unk_24CF8F978;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateModels:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __41__REMLLinearModel__getTotalPositiveCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "_getTotalPositiveCount");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)logCoreAnalyticsMetrics
{
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](self->_models, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_15_0);
}

uint64_t __42__REMLLinearModel_logCoreAnalyticsMetrics__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "enumerateModels:", &__block_literal_global_16_0);
}

uint64_t __42__REMLLinearModel_logCoreAnalyticsMetrics__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logCoreAnalyticsMetrics");
}

- (NSDictionary)models
{
  return self->_models;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_models, 0);
}

@end
