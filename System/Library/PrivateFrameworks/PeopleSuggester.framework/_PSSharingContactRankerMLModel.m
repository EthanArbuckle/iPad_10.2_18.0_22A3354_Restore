@implementation _PSSharingContactRankerMLModel

- (_PSSharingContactRankerMLModel)initWithMLModel:(id)a3 scoreThreshold:(double)a4
{
  id v6;
  _PSSharingContactRankerMLModel *v7;
  _PSSharingContactRankerMLModel *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_PSSharingContactRankerMLModel;
  v7 = -[_PSSharingContactRankerMLModel init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    -[_PSSharingContactRankerMLModel setMlModel:](v7, "setMlModel:", v6);
    -[_PSSharingContactRankerMLModel mlModel](v8, "mlModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modelDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSSharingContactRankerMLModel setMetadata:](v8, "setMetadata:", v12);

    -[_PSSharingContactRankerMLModel setScoreThreshold:](v8, "setScoreThreshold:", a4);
  }

  return v8;
}

- (_PSSharingContactRankerMLModel)initWithScoreThreshold:(double)a3
{
  _PSSharingContactRankerMLModel *v4;
  _PSSharingContactRankerMLModel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_PSSharingContactRankerMLModel;
  v4 = -[_PSSharingContactRankerMLModel init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    -[_PSSharingContactRankerMLModel setMlModel:](v4, "setMlModel:", 0);
    -[_PSSharingContactRankerMLModel loadDefaultModel](v5, "loadDefaultModel");
    -[_PSSharingContactRankerMLModel setScoreThreshold:](v5, "setScoreThreshold:", a3);
    -[_PSSharingContactRankerMLModel setMetadata:](v5, "setMetadata:", 0);
    -[_PSSharingContactRankerMLModel mlModel](v5, "mlModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[_PSSharingContactRankerMLModel mlModel](v5, "mlModel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "modelDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "metadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSSharingContactRankerMLModel setMetadata:](v5, "setMetadata:", v10);

    }
  }
  return v5;
}

- (void)loadDefaultModel
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A07F4000, log, OS_LOG_TYPE_DEBUG, "_PSSharingContactRankerMLModel - loadDefaultModel", v1, 2u);
}

- (id)giveModelDescription
{
  return -[MLModel modelDescription](self->_mlModel, "modelDescription");
}

- (id)scoresOnFeatures:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_PSSharingContactRankerMLModel mlModel](self, "mlModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSBehaviorRuleRankingUtilities batchPredictWithMLModel:featureArrayDict:](_PSBehaviorRuleRankingUtilities, "batchPredictWithMLModel:featureArrayDict:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)scoreThreshold
{
  return self->_scoreThreshold;
}

- (void)setScoreThreshold:(double)a3
{
  self->_scoreThreshold = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (MLModel)mlModel
{
  return (MLModel *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMlModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mlModel, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
