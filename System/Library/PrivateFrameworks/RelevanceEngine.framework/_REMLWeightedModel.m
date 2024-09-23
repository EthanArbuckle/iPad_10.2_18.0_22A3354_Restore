@implementation _REMLWeightedModel

- (BOOL)_loadModel:(id)a3 fromURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  int v13;
  unsigned __int8 v15;

  v7 = a3;
  v8 = a4;
  v15 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v10, &v15);

  v12 = 0;
  if (v11)
  {
    v13 = v15;
    if (v13 == objc_msgSend(v7, "requiresDirectory"))
      v12 = objc_msgSend(v7, "loadModelFromURL:error:", v8, a5);
    else
      v12 = 0;
  }

  return v12;
}

+ (id)weightedModelWithDescriptor:(id)a3 featureSet:(id)a4
{
  REInteractionDescriptor *v5;
  id v6;
  void *v7;
  uint64_t v8;
  _REMLMultipleWeightedModel *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  double v15;
  double v16;
  _REMLMultipleWeightedModel *v17;
  id *v18;
  _QWORD *v19;
  _REMLSingleWeightedModel *v20;
  int v21;
  int v22;
  void *v23;
  int v24;
  double v25;
  double v26;
  REInteractionDescriptor *descriptor;
  REInteractionDescriptor *v28;
  _REMLMultipleWeightedModel *v29;
  _QWORD v31[4];
  _REMLMultipleWeightedModel *v32;
  _QWORD v33[4];
  REInteractionDescriptor *v34;
  _QWORD v35[4];
  REInteractionDescriptor *v36;

  v5 = (REInteractionDescriptor *)a3;
  v6 = a4;
  -[REInteractionDescriptor identificationFeature](v5, "identificationFeature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x24BDAC760];
  if (v7)
  {
    v9 = [_REMLMultipleWeightedModel alloc];
    -[REInteractionDescriptor identificationFeature](v5, "identificationFeature");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[REInteractionDescriptor initialProbability](v5, "initialProbability");
    v12 = v11;
    -[REInteractionDescriptor biasFeature](v5, "biasFeature");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[REInteractionDescriptor varianceEpsilon](v5, "varianceEpsilon");
    LODWORD(v15) = v14;
    LODWORD(v16) = v12;
    v17 = -[_REMLMultipleWeightedModel initWithFeature:featureSet:priorMean:biasFeature:modelVarianceEpsilon:](v9, "initWithFeature:featureSet:priorMean:biasFeature:modelVarianceEpsilon:", v10, v6, v13, v16, v15);

    v35[0] = v8;
    v35[1] = 3221225472;
    v35[2] = __61___REMLWeightedModel_weightedModelWithDescriptor_featureSet___block_invoke;
    v35[3] = &unk_24CF8F9E0;
    v18 = (id *)&v36;
    v36 = v5;
    v19 = v35;
  }
  else
  {
    v20 = [_REMLSingleWeightedModel alloc];
    -[REInteractionDescriptor initialProbability](v5, "initialProbability");
    v22 = v21;
    -[REInteractionDescriptor biasFeature](v5, "biasFeature");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[REInteractionDescriptor varianceEpsilon](v5, "varianceEpsilon");
    LODWORD(v25) = v24;
    LODWORD(v26) = v22;
    v17 = -[_REMLSingleWeightedModel initWithFeatureSet:priorMean:biasFeature:modelVarianceEpsilon:](v20, "initWithFeatureSet:priorMean:biasFeature:modelVarianceEpsilon:", v6, v23, v26, v25);

    v33[0] = v8;
    v33[1] = 3221225472;
    v33[2] = __61___REMLWeightedModel_weightedModelWithDescriptor_featureSet___block_invoke_2;
    v33[3] = &unk_24CF8F9E0;
    v18 = (id *)&v34;
    v34 = v5;
    v19 = v33;
  }
  -[_REMLMultipleWeightedModel enumerateModels:](v17, "enumerateModels:", v19);

  descriptor = v17->super._descriptor;
  v17->super._descriptor = v5;
  v28 = v5;

  v31[0] = v8;
  v31[1] = 3221225472;
  v31[2] = __61___REMLWeightedModel_weightedModelWithDescriptor_featureSet___block_invoke_3;
  v31[3] = &unk_24CF8F9E0;
  v29 = v17;
  v32 = v29;
  -[_REMLMultipleWeightedModel enumerateModels:](v29, "enumerateModels:", v31);

  return v29;
}

- (void)_configureMode:(id)a3
{
  REInteractionDescriptor *descriptor;
  _BOOL4 v5;
  float v6;
  _BOOL8 v7;
  id v8;

  descriptor = self->_descriptor;
  v8 = a3;
  v5 = -[REInteractionDescriptor enableExploreExploit](descriptor, "enableExploreExploit");
  -[REInteractionDescriptor exploreBias](self->_descriptor, "exploreBias");
  v7 = fabsf(v6) >= 0.00000011921 && v5;
  objc_msgSend(v8, "setAllowsExploreExploit:", v7);
  -[REInteractionDescriptor exploreBias](self->_descriptor, "exploreBias");
  objc_msgSend(v8, "setExploreExploitModulator:");
  -[REInteractionDescriptor trainingSimulationExploreBias](self->_descriptor, "trainingSimulationExploreBias");
  objc_msgSend(v8, "setSimulationExploreExploitModulator:");
  objc_msgSend(v8, "setWantsPredictionCache:", 0);

}

- (_REMLWeightedModel)initWithBiasFeature:(id)a3
{
  id v5;
  _REMLWeightedModel *v6;
  _REMLWeightedModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_REMLWeightedModel;
  v6 = -[_REMLWeightedModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_biasFeature, a3);

  return v7;
}

- (float)_biasForFeatureSet:(id)a3
{
  REFeature *biasFeature;
  void *v4;
  double v5;
  float v6;

  biasFeature = self->_biasFeature;
  if (!biasFeature)
    return 0.0;
  objc_msgSend(a3, "featureValueForFeature:", biasFeature);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (float)weight
{
  float result;

  -[REInteractionDescriptor weight](self->_descriptor, "weight");
  return result;
}

- (REFeature)selectionFeature
{
  return -[REInteractionDescriptor selectionFeature](self->_descriptor, "selectionFeature");
}

- (id)predictWithFeatures:(id)a3
{
  return 0;
}

- (BOOL)saveModelToURL:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)loadModelFromURL:(id)a3 error:(id *)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biasFeature, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
