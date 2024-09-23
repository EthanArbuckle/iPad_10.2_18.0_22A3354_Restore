@implementation PHAPrivateFederatedLearningModelTrainer

- (PHAPrivateFederatedLearningModelTrainer)initWithTrainingData:(id)a3 espressoFileURL:(id)a4 learningRate:(id)a5 modelInputName:(id)a6 modelOutputName:(id)a7 lossName:(id)a8 optimizerName:(id)a9 error:(id *)a10
{
  id v17;
  id v18;
  id v19;
  PHAPrivateFederatedLearningModelTrainer *v20;
  PHAPrivateFederatedLearningModelTrainer *v21;
  NSString *labelName;
  void *v23;
  uint64_t v24;
  ETLossDefinition *lossDefinition;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  ETOptimizerDefinition *optimizerDefinition;
  PHAPrivateFederatedLearningModelTrainer *v30;
  void *v31;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v35 = a4;
  v18 = a5;
  v34 = a6;
  v33 = a7;
  v36 = a8;
  v19 = a9;
  v37.receiver = self;
  v37.super_class = (Class)PHAPrivateFederatedLearningModelTrainer;
  v20 = -[PHAPrivateFederatedLearningModelTrainer init](&v37, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_trainingData, a3);
    objc_storeStrong((id *)&v21->_espressoFileURL, a4);
    labelName = v21->_labelName;
    v21->_labelName = (NSString *)CFSTR("label");

    objc_storeStrong((id *)&v21->_inputName, a6);
    objc_storeStrong((id *)&v21->_modelOutputName, a7);
    objc_storeStrong((id *)&v21->_lossName, a8);
    objc_storeStrong((id *)&v21->_optimizerName, a9);
    objc_storeStrong((id *)&v21->_modelInferenceOutputName, a7);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "numberOfDataPoints"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](v21->_lossName, "isEqualToString:", CFSTR("mse")))
    {
      objc_msgSend(MEMORY[0x1E0D1F4A0], "L2LossWithInputName:targetInputName:lossOutputName:", v21->_modelOutputName, v21->_labelName, v21->_lossName);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[NSString isEqualToString:](v21->_lossName, "isEqualToString:", CFSTR("cross_entropy")))
        objc_msgSend(MEMORY[0x1E0D1F4A0], "crossEntropyLossWithInputName:targetInputName:lossOutputName:", v21->_modelOutputName, v21->_labelName, v21->_lossName);
      else
        objc_msgSend(MEMORY[0x1E0D1F4A0], "BuiltInLoss:", v36);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    lossDefinition = v21->_lossDefinition;
    v21->_lossDefinition = (ETLossDefinition *)v24;

    v26 = *MEMORY[0x1E0D201B0];
    v38[0] = *MEMORY[0x1E0D20190];
    v38[1] = v26;
    v39[0] = v23;
    v39[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](v21->_optimizerName, "isEqualToString:", CFSTR("sgd")))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Optimizer '%@' is not supported."), v19);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHAPrivateFederatedLearningModelTrainer _generateError:errorCode:message:underlyingError:](PHAPrivateFederatedLearningModelTrainer, "_generateError:errorCode:message:underlyingError:", a10, 4, v31, 0);

      v30 = 0;
      goto LABEL_12;
    }
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1F4B8]), "initWithOptimizationAlgorithm:parameters:error:", 0, v27, a10);
    optimizerDefinition = v21->_optimizerDefinition;
    v21->_optimizerDefinition = (ETOptimizerDefinition *)v28;

  }
  v30 = v21;
LABEL_12:

  return v30;
}

- (id)trainForNumberOfEpochs:(unint64_t)a3 layersToTrain:(id)a4 verbose:(BOOL)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  ETDataProvider *trainingData;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  unint64_t i;
  void *v25;
  void *v26;
  void *v27;
  PHAPrivateFederatedLearningModelTrainerResponse *v28;
  NSObject *v29;
  void *v30;
  id v31;
  PHAPrivateFederatedLearningModelTrainerResponse *v32;
  void *v33;
  NSObject *v34;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  uint8_t v47[16];
  id v48;
  _QWORD aBlock[5];
  id v50;
  id v51;
  uint8_t *v52;
  BOOL v53;
  uint8_t buf[8];
  uint8_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x1E0C80C00];
  v46 = a4;
  v9 = objc_alloc(MEMORY[0x1E0D1F4B0]);
  -[PHAPrivateFederatedLearningModelTrainer espressoFileURL](self, "espressoFileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0;
  v11 = (void *)objc_msgSend(v9, "initWithInferenceNetworkPath:error:", v10, &v62);
  v45 = v62;

  if (v11)
  {
    v61 = 0;
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F4D0]), "initForLayers:error:", v46, &v61);
    v12 = v61;
    v42 = v12;
    if (v44)
    {
      v13 = objc_alloc(MEMORY[0x1E0D1F4C0]);
      -[PHAPrivateFederatedLearningModelTrainer lossDefinition](self, "lossDefinition");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAPrivateFederatedLearningModelTrainer optimizerDefinition](self, "optimizerDefinition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 0;
      v43 = (void *)objc_msgSend(v13, "initWithModelDefinition:lossDefinition:variablesDefinition:optimizerDefinition:forPlatform:error:", v11, v14, v44, v15, 1, &v60);
      v40 = v60;

      if (v43)
      {
        -[PHAPrivateFederatedLearningModelTrainer _getParamsFromTask:forLayers:error:](self, "_getParamsFromTask:forLayers:error:", v43, v46, a6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          *(_QWORD *)buf = 0;
          v55 = buf;
          v56 = 0x3032000000;
          v57 = __Block_byref_object_copy__4946;
          v58 = __Block_byref_object_dispose__4947;
          v59 = 0;
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __94__PHAPrivateFederatedLearningModelTrainer_trainForNumberOfEpochs_layersToTrain_verbose_error___block_invoke_147;
          aBlock[3] = &unk_1E8520558;
          aBlock[4] = self;
          v52 = buf;
          v53 = a5;
          v37 = v17;
          v50 = v37;
          v38 = v18;
          v51 = v38;
          v39 = _Block_copy(aBlock);
          trainingData = self->_trainingData;
          v63 = *MEMORY[0x1E0D1F488];
          v20 = _Block_copy(v39);
          v64[0] = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 0;
          LOBYTE(trainingData) = objc_msgSend(v43, "doTrainingOnData:forNumberOfEpochs:withCallback:error:", trainingData, a3, v21, &v48);
          v36 = v48;

          if ((trainingData & 1) != 0)
          {
            -[PHAPrivateFederatedLearningModelTrainer _getParamsFromTask:forLayers:error:](self, "_getParamsFromTask:forLayers:error:", v43, v46, a6);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              for (i = 0; i < objc_msgSend(v16, "count"); ++i)
              {
                objc_msgSend(v16, "objectAtIndexedSubscript:", i);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "objectAtIndexedSubscript:", i);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                +[PHAPrivateFederatedLearningLayerParameterDeltas deltasFromLayerParameters:toLayerParameters:](PHAPrivateFederatedLearningLayerParameterDeltas, "deltasFromLayerParameters:toLayerParameters:", v26, v25);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "setObject:atIndexedSubscript:", v27, i);

              }
              v32 = [PHAPrivateFederatedLearningModelTrainerResponse alloc];
              -[PHAPrivateFederatedLearningModelTrainer trainingData](self, "trainingData");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = -[PHAPrivateFederatedLearningModelTrainerResponse initWithParameterDeltas:trainingLossesPerEpoch:trainingAccuraciesPerEpoch:trainingEpochs:numberOfTrainingSamples:](v32, "initWithParameterDeltas:trainingLossesPerEpoch:trainingAccuraciesPerEpoch:trainingEpochs:numberOfTrainingSamples:", v23, v37, v38, a3, objc_msgSend(v33, "numberOfDataPoints"));

            }
            else
            {
              if (__PXLog_genericOnceToken != -1)
                dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_155);
              v34 = __PXLog_genericOSLog;
              if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v47 = 0;
                _os_log_error_impl(&dword_1CAC16000, v34, OS_LOG_TYPE_ERROR, "Error retrieving trained weights and biases", v47, 2u);
              }
              v28 = 0;
            }

            v30 = v36;
          }
          else
          {
            v30 = v36;
            if (*((_QWORD *)v55 + 5))
              v31 = (id)*((_QWORD *)v55 + 5);
            else
              v31 = v36;
            +[PHAPrivateFederatedLearningModelTrainer _generateError:errorCode:message:underlyingError:](PHAPrivateFederatedLearningModelTrainer, "_generateError:errorCode:message:underlyingError:", a6, 6, CFSTR("Error training espresso model"), v31);
            v28 = 0;
          }

          _Block_object_dispose(buf, 8);
        }
        else
        {
          if (__PXLog_genericOnceToken != -1)
            dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_4944);
          v29 = __PXLog_genericOSLog;
          if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1CAC16000, v29, OS_LOG_TYPE_ERROR, "Error retrieving original weights and biases", buf, 2u);
          }
          v28 = 0;
        }

      }
      else
      {
        +[PHAPrivateFederatedLearningModelTrainer _generateError:errorCode:message:underlyingError:](PHAPrivateFederatedLearningModelTrainer, "_generateError:errorCode:message:underlyingError:", a6, 5, CFSTR("Error creating espresso task definition"), v40);
        v28 = 0;
      }

    }
    else
    {
      +[PHAPrivateFederatedLearningModelTrainer _generateError:errorCode:message:underlyingError:](PHAPrivateFederatedLearningModelTrainer, "_generateError:errorCode:message:underlyingError:", a6, 3, CFSTR("Error during espresso training variables definition"), v12);
      v28 = 0;
    }

  }
  else
  {
    +[PHAPrivateFederatedLearningModelTrainer _generateError:errorCode:message:underlyingError:](PHAPrivateFederatedLearningModelTrainer, "_generateError:errorCode:message:underlyingError:", a6, 2, CFSTR("Error during espresso model definition"), v45);
    v28 = 0;
  }

  return v28;
}

- (id)_getParamsFromTask:(id)a3 forLayers:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  PHAPrivateFederatedLearningLayerParameters *v17;
  int v18;
  void *v19;
  id v20;
  id v22;
  id v23;
  id v25;
  id v26;

  v6 = a3;
  v7 = a4;
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
    v22 = v7;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      objc_msgSend(v6, "getParameterOfType:forLayerNamed:error:", 1, v9, &v26);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v26;
      if (v10)
      {
        v25 = 0;
        objc_msgSend(v6, "getParameterOfType:forLayerNamed:error:", 2, v9, &v25);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v25;
        if (v12)
        {
          v14 = v6;
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A20]), "initWithDataTensor:", v10);
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A20]), "initWithDataTensor:", v12);
          v17 = -[PHAPrivateFederatedLearningLayerParameters initWithWeights:bias:]([PHAPrivateFederatedLearningLayerParameters alloc], "initWithWeights:bias:", v15, v16);
          objc_msgSend(v23, "setObject:atIndexedSubscript:", v17, v8);

          v6 = v14;
          v7 = v22;
          v18 = 0;
        }
        else
        {
          +[PHAPrivateFederatedLearningModelTrainer _generateError:errorCode:message:underlyingError:](PHAPrivateFederatedLearningModelTrainer, "_generateError:errorCode:message:underlyingError:", a5, 3, CFSTR("Error during espresso training variables (bias) definition"), v13);
          v18 = 1;
        }

      }
      else
      {
        +[PHAPrivateFederatedLearningModelTrainer _generateError:errorCode:message:underlyingError:](PHAPrivateFederatedLearningModelTrainer, "_generateError:errorCode:message:underlyingError:", a5, 3, CFSTR("Error during espresso training variables (weights) definition"), v11);
        v18 = 1;
      }

      if (v18)
        break;
      if (++v8 >= (unint64_t)objc_msgSend(v7, "count"))
        goto LABEL_11;
    }
    v20 = 0;
    v19 = v23;
  }
  else
  {
LABEL_11:
    v19 = v23;
    v20 = v23;
  }

  return v20;
}

- (int)_argmax:(float *)a3 size:(int)a4
{
  vDSP_Length v5;
  float __C;

  __C = -3.4028e38;
  v5 = -1;
  vDSP_maxvi(a3, 1, &__C, &v5, a4);
  return v5;
}

- (id)_averageLossAndAccuracyForBatchResults:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  double v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  float v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  void *v31;
  id v33;
  unint64_t v35;
  unint64_t v36;
  id v37;
  id v38;
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "numberOfDataPoints");
  v8 = v6;
  if (v6)
  {
    v35 = v6;
    v36 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0.0;
    v33 = v5;
    while (1)
    {
      v38 = v9;
      objc_msgSend(v5, "dataPointAtIndex:error:", v10, &v38);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v38;

      if (!v12)
      {
        +[PHAPrivateFederatedLearningModelTrainer _generateError:errorCode:message:underlyingError:](PHAPrivateFederatedLearningModelTrainer, "_generateError:errorCode:message:underlyingError:", a4, 7, CFSTR("Training output is nil."), v13);
        v31 = 0;
        v9 = v13;
        goto LABEL_21;
      }
      -[PHAPrivateFederatedLearningModelTrainer trainingData](self, "trainingData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v13;
      objc_msgSend(v14, "dataPointAtIndex:error:", v10, &v37);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v37;

      if (!v15)
        break;
      -[PHAPrivateFederatedLearningModelTrainer modelInferenceOutputName](self, "modelInferenceOutputName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[PHAPrivateFederatedLearningModelTrainer labelName](self, "labelName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = -[PHAPrivateFederatedLearningModelTrainer _trueLabelTensor:isEqualToPredictionTensor:](self, "_trueLabelTensor:isEqualToPredictionTensor:", v19, v17);
        -[PHAPrivateFederatedLearningModelTrainer lossName](self, "lossName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          v23 = 0;
          v11 = v11 + *(float *)objc_msgSend(v22, "dataPointer");
        }
        else
        {
          +[PHAPrivateFederatedLearningModelTrainer _generateError:errorCode:message:underlyingError:](PHAPrivateFederatedLearningModelTrainer, "_generateError:errorCode:message:underlyingError:", a4, 10, CFSTR("Loss output tensor is nil"), 0);
          v23 = 1;
        }
        v36 += v20;

        v5 = v33;
      }
      else
      {
        +[PHAPrivateFederatedLearningModelTrainer _generateError:errorCode:message:underlyingError:](PHAPrivateFederatedLearningModelTrainer, "_generateError:errorCode:message:underlyingError:", a4, 9, CFSTR("Prediction output tensor is nil"), 0);
        v23 = 1;
      }

      if (v23)
        goto LABEL_20;
      ++v10;
      v8 = v35;
      if (v35 == v10)
        goto LABEL_15;
    }
    +[PHAPrivateFederatedLearningModelTrainer _generateError:errorCode:message:underlyingError:](PHAPrivateFederatedLearningModelTrainer, "_generateError:errorCode:message:underlyingError:", a4, 8, CFSTR("Training data point is nil."), v9);

LABEL_20:
    v31 = 0;
  }
  else
  {
    v9 = 0;
    v36 = 0;
    v11 = 0.0;
LABEL_15:
    *(float *)&v7 = v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v25 = (float)v36;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      *(float *)&v27 = v11 / (float)v8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
      v28 = objc_claimAutoreleasedReturnValue();

      *(float *)&v29 = (float)v36 / (float)v8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
      v30 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)v28;
      v26 = (void *)v30;
    }
    v39[0] = CFSTR("loss");
    v39[1] = CFSTR("accuracy");
    v40[0] = v24;
    v40[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_21:

  return v31;
}

- (BOOL)_trueLabelTensor:(id)a3 isEqualToPredictionTensor:(id)a4
{
  id v6;
  id v7;
  float *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  int v17;

  v6 = a4;
  v7 = a3;
  v8 = (float *)objc_msgSend(v7, "dataPointer");
  v9 = objc_msgSend(v6, "dataPointer");
  objc_msgSend(v7, "shape");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "intValue");

  objc_msgSend(v6, "shape");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "intValue");

  v16 = -[PHAPrivateFederatedLearningModelTrainer _argmax:size:](self, "_argmax:size:", v8, v12);
  v17 = -[PHAPrivateFederatedLearningModelTrainer _argmax:size:](self, "_argmax:size:", v9, v15);
  return (_DWORD)v12 == 1 && (_DWORD)v15 != 1 && roundf(*v8) == (double)v17
      || v16 == v17 && vabds_f32(v8[v16], *(float *)(v9 + 4 * v16)) <= 0.1;
}

- (ETDataProvider)trainingData
{
  return self->_trainingData;
}

- (NSURL)espressoFileURL
{
  return self->_espressoFileURL;
}

- (NSArray)layersToTrain
{
  return self->_layersToTrain;
}

- (NSString)inputName
{
  return self->_inputName;
}

- (void)setInputName:(id)a3
{
  objc_storeStrong((id *)&self->_inputName, a3);
}

- (NSString)modelOutputName
{
  return self->_modelOutputName;
}

- (void)setModelOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_modelOutputName, a3);
}

- (NSString)modelInferenceOutputName
{
  return self->_modelInferenceOutputName;
}

- (void)setModelInferenceOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_modelInferenceOutputName, a3);
}

- (NSString)labelName
{
  return self->_labelName;
}

- (void)setLabelName:(id)a3
{
  objc_storeStrong((id *)&self->_labelName, a3);
}

- (NSString)lossName
{
  return self->_lossName;
}

- (void)setLossName:(id)a3
{
  objc_storeStrong((id *)&self->_lossName, a3);
}

- (NSString)optimizerName
{
  return self->_optimizerName;
}

- (void)setOptimizerName:(id)a3
{
  objc_storeStrong((id *)&self->_optimizerName, a3);
}

- (ETLossDefinition)lossDefinition
{
  return self->_lossDefinition;
}

- (void)setLossDefinition:(id)a3
{
  objc_storeStrong((id *)&self->_lossDefinition, a3);
}

- (ETOptimizerDefinition)optimizerDefinition
{
  return self->_optimizerDefinition;
}

- (void)setOptimizerDefinition:(id)a3
{
  objc_storeStrong((id *)&self->_optimizerDefinition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optimizerDefinition, 0);
  objc_storeStrong((id *)&self->_lossDefinition, 0);
  objc_storeStrong((id *)&self->_optimizerName, 0);
  objc_storeStrong((id *)&self->_lossName, 0);
  objc_storeStrong((id *)&self->_labelName, 0);
  objc_storeStrong((id *)&self->_modelInferenceOutputName, 0);
  objc_storeStrong((id *)&self->_modelOutputName, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
  objc_storeStrong((id *)&self->_layersToTrain, 0);
  objc_storeStrong((id *)&self->_espressoFileURL, 0);
  objc_storeStrong((id *)&self->_trainingData, 0);
}

BOOL __94__PHAPrivateFederatedLearningModelTrainer_trainForNumberOfEpochs_layersToTrain_verbose_error___block_invoke_147(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v20 = 0;
  objc_msgSend(v5, "_averageLossAndAccuracyForBatchResults:error:", a3, &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  v8 = v7;
  if (v6)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      if (__PXLog_genericOnceToken != -1)
        dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_148);
      v9 = (void *)__PXLog_genericOSLog;
      if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
      {
        v17 = v9;
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("loss"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accuracy"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v22 = a2;
        v23 = 2112;
        v24 = v18;
        v25 = 2112;
        v26 = v19;
        _os_log_error_impl(&dword_1CAC16000, v17, OS_LOG_TYPE_ERROR, "Epoch %lu: Loss: %@, Accuracy: %@", buf, 0x20u);

      }
    }
    v10 = *(void **)(a1 + 40);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("loss"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    v12 = *(void **)(a1 + 48);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accuracy"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);
  }
  else
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = v7;
    v13 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v15;
  }

  return v6 != 0;
}

void __94__PHAPrivateFederatedLearningModelTrainer_trainForNumberOfEpochs_layersToTrain_verbose_error___block_invoke_154()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __94__PHAPrivateFederatedLearningModelTrainer_trainForNumberOfEpochs_layersToTrain_verbose_error___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __94__PHAPrivateFederatedLearningModelTrainer_trainForNumberOfEpochs_layersToTrain_verbose_error___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

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
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoAnalysis.PHAPrivateFederatedLearningModelTrainer"), a4, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    v9 = v13;
  }

}

@end
