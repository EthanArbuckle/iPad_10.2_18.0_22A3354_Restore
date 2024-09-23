@implementation _REMLSingleWeightedModel

- (BOOL)loadModelFromURL:(id)a3 error:(id *)a4
{
  void *v6;

  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[_REMLWeightedModel _loadModel:fromURL:error:](self, "_loadModel:fromURL:error:", self->_model, v6, a4);

  return (char)a4;
}

- (void)enumerateModels:(id)a3
{
  (*((void (**)(id, REMLModel *, const __CFString *))a3 + 2))(a3, self->_model, &stru_24CF92178);
}

- (_REMLSingleWeightedModel)initWithFeatureSet:(id)a3 priorMean:(float)a4 biasFeature:(id)a5 modelVarianceEpsilon:(float)a6
{
  id v10;
  _REMLSingleWeightedModel *v11;
  double v12;
  double v13;
  uint64_t v14;
  REMLModel *model;
  objc_super v17;

  v10 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_REMLSingleWeightedModel;
  v11 = -[_REMLWeightedModel initWithBiasFeature:](&v17, sel_initWithBiasFeature_, a5);
  if (v11)
  {
    *(float *)&v12 = a4;
    *(float *)&v13 = a6;
    +[REMLModel modelWithFeatureSet:priorMean:modelVarianceEpsilon:](REMLModel, "modelWithFeatureSet:priorMean:modelVarianceEpsilon:", v10, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    model = v11->_model;
    v11->_model = (REMLModel *)v14;

  }
  return v11;
}

- (void)trainModelWithFeatureMap:(id)a3 positiveEvent:(id)a4
{
  -[REMLModel trainWithFeatures:positiveEvent:](self->_model, "trainWithFeatures:positiveEvent:", a3, a4);
}

- (id)predictWithFeatures:(id)a3
{
  REMLModel *model;
  id v5;
  void *v6;
  int v7;
  int v8;
  double v9;

  model = self->_model;
  v5 = a3;
  -[REMLModel predictWithFeatures:](model, "predictWithFeatures:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_REMLWeightedModel _biasForFeatureSet:](self, "_biasForFeatureSet:", v5);
  v8 = v7;

  LODWORD(v9) = v8;
  objc_msgSend(v6, "setBias:", v9);
  return v6;
}

- (BOOL)saveModelToURL:(id)a3 error:(id *)a4
{
  void *v6;

  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[REMLModel saveModelToURL:error:](self->_model, "saveModelToURL:error:", v6, a4);

  return (char)a4;
}

- (REMLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

@end
