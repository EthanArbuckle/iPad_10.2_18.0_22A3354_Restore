@implementation _REMLMultipleWeightedModel

- (_REMLMultipleWeightedModel)initWithFeature:(id)a3 featureSet:(id)a4 priorMean:(float)a5 biasFeature:(id)a6 modelVarianceEpsilon:(float)a7
{
  id v13;
  id v14;
  _REMLMultipleWeightedModel *v15;
  _REMLMultipleWeightedModel *v16;
  uint64_t v17;
  NSMutableDictionary *models;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_REMLMultipleWeightedModel;
  v15 = -[_REMLWeightedModel initWithBiasFeature:](&v20, sel_initWithBiasFeature_, a6);
  v16 = v15;
  if (v15)
  {
    v15->_priorMean = a5;
    objc_storeStrong((id *)&v15->_identificationFeature, a3);
    objc_storeStrong((id *)&v16->_featureSet, a4);
    v16->_varianceEpsilon = a7;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    models = v16->_models;
    v16->_models = (NSMutableDictionary *)v17;

    v16->_lock._os_unfair_lock_opaque = 0;
  }

  return v16;
}

- (void)enumerateModels:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *models;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  models = self->_models;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46___REMLMultipleWeightedModel_enumerateModels___block_invoke;
  v8[3] = &unk_24CF8FA30;
  v9 = v4;
  v7 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](models, "enumerateKeysAndObjectsUsingBlock:", v8);
  os_unfair_lock_unlock(p_lock);

}

- (id)_modelForFeatureMap:(id)a3
{
  void *v4;
  void *v5;

  REDescriptionForTaggedPointer((void *)objc_msgSend(a3, "valueForFeature:", self->_identificationFeature));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_REMLMultipleWeightedModel _modelForKey:](self, "_modelForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_modelForKey:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_models, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    *(float *)&v6 = self->_priorMean;
    *(float *)&v7 = self->_varianceEpsilon;
    +[REMLModel modelWithFeatureSet:priorMean:modelVarianceEpsilon:](REMLModel, "modelWithFeatureSet:priorMean:modelVarianceEpsilon:", self->_featureSet, v6, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_REMLWeightedModel _configureMode:](self, "_configureMode:", v5);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_models, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (void)trainModelWithFeatureMap:(id)a3 positiveEvent:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  id v9;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[_REMLMultipleWeightedModel _modelForFeatureMap:](self, "_modelForFeatureMap:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trainWithFeatures:positiveEvent:", v8, v7);

  os_unfair_lock_unlock(p_lock);
}

- (id)predictWithFeatures:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  double v10;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[_REMLMultipleWeightedModel _modelForFeatureMap:](self, "_modelForFeatureMap:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predictWithFeatures:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  -[_REMLWeightedModel _biasForFeatureSet:](self, "_biasForFeatureSet:", v5);
  v9 = v8;

  LODWORD(v10) = v9;
  objc_msgSend(v7, "setBias:", v10);

  return v7;
}

- (BOOL)saveModelToURL:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__24;
  v18 = __Block_byref_object_dispose__24;
  v19 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51___REMLMultipleWeightedModel_saveModelToURL_error___block_invoke;
  v10[3] = &unk_24CF8FA58;
  v12 = &v20;
  v7 = v6;
  v11 = v7;
  v13 = &v14;
  -[_REMLMultipleWeightedModel enumerateModels:](self, "enumerateModels:", v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v8 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

- (BOOL)loadModelFromURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v9;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        os_unfair_lock_lock(&self->_lock);
        -[_REMLMultipleWeightedModel _modelForKey:](self, "_modelForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "URLByAppendingPathComponent:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "URLByAppendingPathComponent:", CFSTR("model"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v16) = objc_msgSend(v15, "loadModelFromURL:error:", v17, a4);
        os_unfair_lock_unlock(&self->_lock);

        if (!(_DWORD)v16)
        {
          v18 = 0;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_11:

  return v18;
}

- (NSDictionary)models
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableDictionary copy](self->_models, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_models, 0);
  objc_storeStrong((id *)&self->_featureSet, 0);
  objc_storeStrong((id *)&self->_identificationFeature, 0);
}

@end
