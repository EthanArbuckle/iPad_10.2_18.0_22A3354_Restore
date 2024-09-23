@implementation PHAPrivateFederatedLearningCoreMLModelTrainer

- (PHAPrivateFederatedLearningCoreMLModelTrainer)initWithTrainingData:(id)a3 programTrainer:(id)a4 evaluationMetricNames:(id)a5
{
  id v9;
  id v10;
  id v11;
  PHAPrivateFederatedLearningCoreMLModelTrainer *v12;
  PHAPrivateFederatedLearningCoreMLModelTrainer *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PHAPrivateFederatedLearningCoreMLModelTrainer;
  v12 = -[PHAPrivateFederatedLearningCoreMLModelTrainer init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_trainingData, a3);
    objc_storeStrong((id *)&v13->_programTrainer, a4);
    objc_storeStrong((id *)&v13->_evaluationMetricNames, a5);
  }

  return v13;
}

- (id)trainForNumberOfEpochs:(unint64_t)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  PHAPrivateFederatedLearningCoreModelTrainerResponse *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PHAPrivateFederatedLearningCoreMLModelTrainer trainingData](self, "trainingData");
  v8 = objc_claimAutoreleasedReturnValue();
  -[PHAPrivateFederatedLearningCoreMLModelTrainer trainingData](self, "trainingData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[PHAPrivateFederatedLearningCoreMLModelTrainer countForTrainingData:](PHAPrivateFederatedLearningCoreMLModelTrainer, "countForTrainingData:", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("count"));

  -[PHAPrivateFederatedLearningCoreMLModelTrainer programTrainer](self, "programTrainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAPrivateFederatedLearningCoreMLModelTrainer evaluationMetricNames](self, "evaluationMetricNames");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)v8;
  objc_msgSend(v13, "evaluateUsingTestData:evaluationMetricNames:error:", v8, v14, a4);
  v16 = objc_claimAutoreleasedReturnValue();

  v35 = (void *)v16;
  -[PHAPrivateFederatedLearningCoreMLModelTrainer unpackResults:error:](self, "unpackResults:error:", v16, a4);
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v7, "setObject:forKey:", v17, CFSTR("Pretraining"));
  v34 = (void *)v17;
  v36 = v7;
  v18 = 0;
  if (a3)
  {
    v19 = 0;
    while (1)
    {
      v20 = v18;
      -[PHAPrivateFederatedLearningCoreMLModelTrainer programTrainer](self, "programTrainer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAPrivateFederatedLearningCoreMLModelTrainer evaluationMetricNames](self, "evaluationMetricNames");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v18;
      objc_msgSend(v21, "trainUsingTrainingData:evaluationMetricNames:error:", v15, v22, &v37);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v37;

      if (!v23)
        break;
      -[PHAPrivateFederatedLearningCoreMLModelTrainer unpackResults:error:](self, "unpackResults:error:", v23, a4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Epoch %lu"), v19);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setObject:forKey:", v24, v25);

      }
      if (a3 == ++v19)
        goto LABEL_9;
    }
    if (!v18)
    {
      v30 = 0;
      v31 = v35;
      v29 = v36;
      v32 = v34;
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Empty training result"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAPrivateFederatedLearningCoreMLModelTrainer _generateError:errorCode:message:underlyingError:](PHAPrivateFederatedLearningCoreMLModelTrainer, "_generateError:errorCode:message:underlyingError:", a4, 1, v27, v18);
    v30 = 0;
    v29 = v36;
  }
  else
  {
LABEL_9:
    -[PHAPrivateFederatedLearningCoreMLModelTrainer programTrainer](self, "programTrainer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copyCurrentTrainingDelta");

    objc_msgSend(v27, "flattenedModelUpdate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v36;
    v30 = -[PHAPrivateFederatedLearningCoreModelTrainerResponse initWithDataPackage:trainingMetrics:]([PHAPrivateFederatedLearningCoreModelTrainerResponse alloc], "initWithDataPackage:trainingMetrics:", v28, v36);

  }
  v32 = v34;
  v31 = v35;

LABEL_13:
  return v30;
}

- (id)unpackResults:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "evaluationMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 < 1)
  {
    v13 = v7;
  }
  else
  {
    v10 = 0;
    do
    {
      objc_msgSend(v6, "evaluationMetrics");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "featuresAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[PHAPrivateFederatedLearningCoreMLModelTrainer _unpackEvaluationMetrics:resultDictionary:error:](self, "_unpackEvaluationMetrics:resultDictionary:error:", v12, v7, a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      ++v10;
      objc_msgSend(v6, "evaluationMetrics");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      v7 = v13;
    }
    while (v15 > v10);
  }
  v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "loss");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithObjects:", v18, 0);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("loss"));

  return v13;
}

- (id)_unpackEvaluationMetrics:(id)a3 resultDictionary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _UNKNOWN **v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  float v29;
  float v30;
  void *v31;
  float v32;
  double v33;
  void *v34;
  id v36;
  void *v37;
  id *v38;
  uint64_t v39;
  id obj;
  void *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[PHAPrivateFederatedLearningCoreMLModelTrainer evaluationMetricNames](self, "evaluationMetricNames");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v10)
  {
    v11 = v10;
    v12 = &off_1E8514000;
    v42 = *(_QWORD *)v44;
    v37 = v9;
    v38 = a5;
    v36 = v8;
    do
    {
      v13 = 0;
      v39 = v11;
      do
      {
        if (*(_QWORD *)v44 != v42)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v13);
        objc_msgSend(v8, "featureValueForName:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isUndefined"))
        {
          v16 = v12[356];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is undefined"), v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "_generateError:errorCode:message:underlyingError:", a5, 2, v17, 0);
        }
        else
        {
          objc_msgSend(v15, "multiArrayValue");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v18;
          if (v18)
          {
            objc_msgSend(v18, "shape");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "unsignedIntValue");

            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKeyedSubscript:", v14);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v23;
            if (v23)
            {
              v24 = v23;

              v22 = v24;
            }
            else if ((_DWORD)v21)
            {
              do
              {
                objc_msgSend(v22, "addObject:", &unk_1E85409A0);
                --v21;
              }
              while (v21);
            }
            if (objc_msgSend(v17, "count"))
            {
              v26 = 0;
              do
              {
                objc_msgSend(v22, "objectAtIndexedSubscript:", v26);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v27, "floatValue");
                v30 = v29;
                objc_msgSend(v17, "objectAtIndexedSubscript:", v26);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "floatValue");
                *(float *)&v33 = v30 + v32;
                objc_msgSend(v28, "numberWithFloat:", v33);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setObject:atIndexedSubscript:", v34, v26);

                ++v26;
              }
              while (v26 < objc_msgSend(v17, "count"));
            }
            v9 = v37;
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v22, v14);

            a5 = v38;
            v8 = v36;
            v12 = &off_1E8514000;
          }
          else
          {
            v25 = v12[356];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("metricMLMultiArray is undefined for %@"), v14);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "_generateError:errorCode:message:underlyingError:", a5, 3, v22, 0);
          }

          v11 = v39;
        }

        ++v13;
      }
      while (v13 != v11);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v11);
  }

  return v9;
}

- (MLArrayBatchProvider)trainingData
{
  return self->_trainingData;
}

- (MLProgramTrainer)programTrainer
{
  return self->_programTrainer;
}

- (NSSet)evaluationMetricNames
{
  return self->_evaluationMetricNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluationMetricNames, 0);
  objc_storeStrong((id *)&self->_programTrainer, 0);
  objc_storeStrong((id *)&self->_trainingData, 0);
}

+ (unint64_t)countForTrainingData:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
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
  objc_msgSend(a3, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "featureNames");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "anyObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "featureValueForName:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "multiArrayValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "shape");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v15, "unsignedIntValue");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)_generateError:(id *)a3 errorCode:(int64_t)a4 message:(id)a5 underlyingError:(id)a6
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  if (a3)
  {
    v10 = (objc_class *)MEMORY[0x1E0C99E08];
    v13 = v9;
    v11 = a5;
    v12 = objc_alloc_init(v10);
    objc_msgSend(v12, "setObject:forKey:", v11, *MEMORY[0x1E0CB2D50]);

    if (v13)
      objc_msgSend(v12, "setObject:forKey:", v13, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoAnalysis.PHAPrivateFederatedLearningCoreMLModelTrainer"), a4, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    v9 = v13;
  }

}

@end
