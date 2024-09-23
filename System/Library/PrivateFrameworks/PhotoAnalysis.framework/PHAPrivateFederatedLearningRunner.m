@implementation PHAPrivateFederatedLearningRunner

- (PHAPrivateFederatedLearningRunner)initWithRecipeOptions:(id)a3
{
  id v5;
  PHAPrivateFederatedLearningRunner *v6;
  PHAPrivateFederatedLearningRunner *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHAPrivateFederatedLearningRunner;
  v6 = -[PHAPrivateFederatedLearningRunner init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_options, a3);

  return v7;
}

- (id)runWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  float v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  PHAPrivateFederatedLearningRunnerResponse *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  PHAPrivateFederatedLearningModelTrainer *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  PHAPrivateFederatedLearningPackager *v52;
  void *v53;
  void *v54;
  PHAPrivateFederatedLearningRunnerResponse *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  BOOL v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  PHAPrivateFederatedLearningModelValidator *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id *v85;
  id *v86;
  void *v87;
  PHAPrivateFederatedLearningModelTrainer *v88;
  void *v89;
  id v90;
  void *v91;
  uint64_t v92;
  id v93;
  id v94;
  id v95;
  id v96;
  uint8_t buf[4];
  id v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  -[PHAPrivateFederatedLearningRunner options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = 0;
  +[PHAPrivateFederatedLearningRunner _mediaAnalysisImageProgressForPhotoLibrary:error:](PHAPrivateFederatedLearningRunner, "_mediaAnalysisImageProgressForPhotoLibrary:error:", v6, &v96);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v96;

  if (v7)
  {
    objc_msgSend(v7, "floatValue");
    v10 = v9;
    -[PHAPrivateFederatedLearningRunner options](self, "options");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "minProcessedRate");
    v13 = v12;

    if (v13 > v10)
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      -[PHAPrivateFederatedLearningRunner options](self, "options");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "minProcessedRate");
      objc_msgSend(v14, "stringWithFormat:", CFSTR("Photo Library does not have enough processed assets (%@ < %f)."), v7, v16);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      +[PHAPrivateFederatedLearningRunner _generateError:errorCode:message:underlyingError:](PHAPrivateFederatedLearningRunner, "_generateError:errorCode:message:underlyingError:", a3, 11, v17, 0);
      v18 = 0;
LABEL_30:

      goto LABEL_31;
    }
  }
  else
  {
    if (__PXLog_genericOnceToken != -1)
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_9699);
    v19 = __PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v98 = v8;
      _os_log_error_impl(&dword_1CAC16000, v19, OS_LOG_TYPE_ERROR, "Media analysis progress query returned an error: %@.", buf, 0xCu);
    }
  }
  -[PHAPrivateFederatedLearningRunner options](self, "options");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "attachmentURLs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAPrivateFederatedLearningRunner _firstAttachmentURLWithSuffixOfName:attachments:error:](PHAPrivateFederatedLearningRunner, "_firstAttachmentURLWithSuffixOfName:attachments:error:", CFSTR(".mlmodel"), v21, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v95 = 0;
    objc_msgSend(MEMORY[0x1E0C9E940], "compileModelAtURL:error:", v15, &v95);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v95;
    if (!v22)
    {
      v61 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(0, "absoluteString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "stringWithFormat:", CFSTR("Error while compiling the model at URL %@"), v24);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHAPrivateFederatedLearningRunner _generateError:errorCode:message:underlyingError:](PHAPrivateFederatedLearningRunner, "_generateError:errorCode:message:underlyingError:", a3, 8, v62, v17);
      v18 = 0;
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(CFSTR("model.espresso"), "stringByAppendingPathExtension:", CFSTR("net"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "URLByAppendingPathComponent:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "URLByAppendingPathComponent:", CFSTR("model.espresso.shape"));
    v92 = objc_claimAutoreleasedReturnValue();
    -[PHAPrivateFederatedLearningRunner options](self, "options");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "shouldValidateModel");

    if (v26)
    {
      v71 = v7;
      v79 = v22;
      v81 = v17;
      v83 = v8;
      v85 = a3;
      v87 = v24;
      v77 = -[PHAPrivateFederatedLearningModelValidator initWithEspressoModelURL:espressoModelShapeURL:]([PHAPrivateFederatedLearningModelValidator alloc], "initWithEspressoModelURL:espressoModelShapeURL:", v24, v92);
      -[PHAPrivateFederatedLearningRunner options](self, "options");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "fingerprintVersionName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAPrivateFederatedLearningRunner options](self, "options");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "modelInputName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAPrivateFederatedLearningRunner options](self, "options");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "modelOutputName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAPrivateFederatedLearningRunner options](self, "options");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "labelPolicyString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAPrivateFederatedLearningRunner options](self, "options");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "lossName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAPrivateFederatedLearningRunner options](self, "options");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "layersToTrain");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = 0;
      v65 = -[PHAPrivateFederatedLearningModelValidator isValidWithFingerprintVersionName:modelInputName:modelOutputName:labelName:labelPolicyName:lossName:layersToTrain:error:](v77, "isValidWithFingerprintVersionName:modelInputName:modelOutputName:labelName:labelPolicyName:lossName:layersToTrain:error:", v27, v28, v29, CFSTR("label"), v30, v32, v34, &v94);
      v90 = v94;

      if (!v65)
      {
        v36 = v90;
        +[PHAPrivateFederatedLearningRunner _generateError:errorCode:message:underlyingError:](PHAPrivateFederatedLearningRunner, "_generateError:errorCode:message:underlyingError:", v85, 9, CFSTR("Error validating model"), v90);

        v18 = 0;
        v17 = v81;
        v8 = v83;
        v22 = v79;
        v24 = v87;
        v62 = (void *)v92;
        v7 = v71;
        goto LABEL_28;
      }

      v17 = v81;
      v8 = v83;
      a3 = v85;
      v24 = v87;
      v22 = v79;
      v7 = v71;
    }
    -[PHAPrivateFederatedLearningRunner options](self, "options");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAPrivateFederatedLearningRunner _prepareDatasetWithOptions:error:](PHAPrivateFederatedLearningRunner, "_prepareDatasetWithOptions:error:", v35, a3);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      if (objc_msgSend(v36, "numberOfDataPoints"))
      {
        v80 = v22;
        v82 = v17;
        v84 = v8;
        v86 = a3;
        v88 = [PHAPrivateFederatedLearningModelTrainer alloc];
        v91 = v36;
        v37 = (void *)MEMORY[0x1E0CB37E8];
        -[PHAPrivateFederatedLearningRunner options](self, "options");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "learningRate");
        objc_msgSend(v37, "numberWithDouble:");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAPrivateFederatedLearningRunner options](self, "options");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "modelInputName");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAPrivateFederatedLearningRunner options](self, "options");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "modelOutputName");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAPrivateFederatedLearningRunner options](self, "options");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "lossName");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAPrivateFederatedLearningRunner options](self, "options");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "optimizerName");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = 0;
        v43 = v88;
        v89 = v24;
        v44 = -[PHAPrivateFederatedLearningModelTrainer initWithTrainingData:espressoFileURL:learningRate:modelInputName:modelOutputName:lossName:optimizerName:error:](v43, "initWithTrainingData:espressoFileURL:learningRate:modelInputName:modelOutputName:lossName:optimizerName:error:", v91, v24, v70, v68, v38, v40, v42, &v93);
        v66 = v93;

        v45 = (void *)v44;
        v78 = (void *)v44;
        if (v44)
        {
          -[PHAPrivateFederatedLearningRunner options](self, "options");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "numberOfEpochs");
          -[PHAPrivateFederatedLearningRunner options](self, "options");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "layersToTrain");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "trainForNumberOfEpochs:layersToTrain:verbose:error:", v47, v49, 0, v86);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v50
            || (objc_msgSend(v50, "parameterDeltas"),
                v51 = (void *)objc_claimAutoreleasedReturnValue(),
                v51,
                !v51))
          {
            v18 = 0;
            v17 = v82;
            v8 = v84;
            v22 = v80;
            v62 = (void *)v92;
            v60 = v66;
LABEL_27:

            v24 = v89;
            v36 = v91;
            goto LABEL_28;
          }
          v52 = objc_alloc_init(PHAPrivateFederatedLearningPackager);
          objc_msgSend(v50, "parameterDeltas");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHAPrivateFederatedLearningPackager dataPackageFromTrainingResults:error:](v52, "dataPackageFromTrainingResults:error:", v53, v86);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          v55 = [PHAPrivateFederatedLearningRunnerResponse alloc];
          -[PHAPrivateFederatedLearningRunner options](self, "options");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "layersToTrain");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "trainingLossesPerEpoch");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "trainingAccuraciesPerEpoch");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[PHAPrivateFederatedLearningRunnerResponse initWithDataPackage:layersToTrain:trainingLossesPerEpoch:trainingAccuraciesPerEpoch:](v55, "initWithDataPackage:layersToTrain:trainingLossesPerEpoch:trainingAccuraciesPerEpoch:", v54, v57, v58, v59);

          v60 = v66;
        }
        else
        {
          v63 = (void *)MEMORY[0x1E0CB3940];
          -[PHAPrivateFederatedLearningRunner options](self, "options");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "trainingTask");
          v52 = (PHAPrivateFederatedLearningPackager *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "stringWithFormat:", CFSTR("Model trainer returned nil for data provider of training task %@ and model file url %@"), v52, v89);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v66;
          +[PHAPrivateFederatedLearningRunner _generateError:errorCode:message:underlyingError:](PHAPrivateFederatedLearningRunner, "_generateError:errorCode:message:underlyingError:", v86, 7, v54, v66);
          v18 = 0;
        }

        v17 = v82;
        v8 = v84;
        v22 = v80;
        v62 = (void *)v92;
        goto LABEL_27;
      }
      +[PHAPrivateFederatedLearningRunner _generateError:errorCode:message:underlyingError:](PHAPrivateFederatedLearningRunner, "_generateError:errorCode:message:underlyingError:", a3, 10, CFSTR("Dataset size is 0."), 0);
    }
    v18 = 0;
    v62 = (void *)v92;
LABEL_28:

    goto LABEL_29;
  }
  v18 = 0;
LABEL_31:

  return v18;
}

- (id)runCoreMLModelWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  PHAPrivateFederatedLearningCoreMLModelTrainer *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;

  -[PHAPrivateFederatedLearningRunner options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attachmentURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  +[PHAPrivateFederatedLearningRunner _firstAttachmentURLWithSuffixOfName:attachments:expectedDirectory:error:](PHAPrivateFederatedLearningRunner, "_firstAttachmentURLWithSuffixOfName:attachments:expectedDirectory:error:", CFSTR(".mil"), v6, 0, &v47);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v47;

  objc_msgSend(v7, "URLByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v42 = a3;
    v10 = objc_alloc_init(MEMORY[0x1E0C9E958]);
    objc_msgSend(v10, "setComputeUnits:", 0);
    v46 = 0;
    objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:configuration:error:", v9, v10, &v46);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v46;
    v43 = v11;
    if (v11)
    {
      v39 = v7;
      v40 = v8;
      v13 = objc_alloc(MEMORY[0x1E0C9E9B8]);
      objc_msgSend(v11, "program");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAPrivateFederatedLearningRunner options](self, "options");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "learningRate");
      v45 = 0;
      v16 = objc_msgSend(v13, "initWithProgram:learningRate:error:", v14, &v45);
      v17 = v45;

      v41 = (void *)v16;
      if (v16)
      {
        v38 = v17;
        -[PHAPrivateFederatedLearningRunner options](self, "options");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "positivesDatasetName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0;
        -[PHAPrivateFederatedLearningRunner _prepareTrainingDataForBiomeStream:error:](self, "_prepareTrainingDataForBiomeStream:error:", v19, &v44);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v44;

        objc_msgSend(v20, "array");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

        if (v23)
        {
          v24 = v21;
          v25 = (void *)MEMORY[0x1E0C99E60];
          -[PHAPrivateFederatedLearningRunner options](self, "options");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "evaluationMetricNames");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setWithArray:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = -[PHAPrivateFederatedLearningCoreMLModelTrainer initWithTrainingData:programTrainer:evaluationMetricNames:]([PHAPrivateFederatedLearningCoreMLModelTrainer alloc], "initWithTrainingData:programTrainer:evaluationMetricNames:", v20, v41, v28);
          -[PHAPrivateFederatedLearningRunner options](self, "options");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHAPrivateFederatedLearningCoreMLModelTrainer trainForNumberOfEpochs:error:](v29, "trainForNumberOfEpochs:error:", objc_msgSend(v30, "numberOfEpochs"), v42);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v36 = (void *)MEMORY[0x1E0CB3940];
          -[PHAPrivateFederatedLearningRunner options](self, "options");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "positivesDatasetName");
          v29 = (PHAPrivateFederatedLearningCoreMLModelTrainer *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "stringWithFormat:", CFSTR("Prepare dataset from Biome stream %@ failed"), v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v21;
          +[PHAPrivateFederatedLearningRunner _generateError:errorCode:message:underlyingError:](PHAPrivateFederatedLearningRunner, "_generateError:errorCode:message:underlyingError:", v42, 16, v30, v21);
          v31 = 0;
        }

        v7 = v39;
        v8 = v40;
        v33 = v38;
      }
      else
      {
        v35 = (void *)MEMORY[0x1E0CB3940];
        -[PHAPrivateFederatedLearningRunner options](self, "options");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "trainingTask");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", CFSTR("Model trainer returned nil for data provider of training task %@ and model file url %@"), v20, v9);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHAPrivateFederatedLearningRunner _generateError:errorCode:message:underlyingError:](PHAPrivateFederatedLearningRunner, "_generateError:errorCode:message:underlyingError:", v42, 7, v28, v17);
        v31 = 0;
        v33 = v17;
        v7 = v39;
        v8 = v40;
      }

      v34 = v41;
    }
    else
    {
      v32 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "absoluteString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("Error while constructing the model at URL %@"), v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHAPrivateFederatedLearningRunner _generateError:errorCode:message:underlyingError:](PHAPrivateFederatedLearningRunner, "_generateError:errorCode:message:underlyingError:", v42, 15, v34, v12);
      v31 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid modelURL"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    +[PHAPrivateFederatedLearningRunner _generateError:errorCode:message:underlyingError:](PHAPrivateFederatedLearningRunner, "_generateError:errorCode:message:underlyingError:", a3, 14, v10, v8);
    v31 = 0;
  }

  return v31;
}

- (id)_prepareTrainingDataForBiomeStream:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[PHAPrivateFederatedLearningRunner options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAPrivateFederatedLearningRunner datasetBuilderForOptions:error:](PHAPrivateFederatedLearningRunner, "datasetBuilderForOptions:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "trainingDataBatchWithBiomeStream:error:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (PHAPrivateFederatedLearningRecipeOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

void __50__PHAPrivateFederatedLearningRunner_runWithError___block_invoke()
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
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoAnalysis.PHAPrivateFederatedLearningRunner"), a4, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    v9 = v13;
  }

}

+ (id)_generateEncryptionKeyFromICloudAggServiceKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  const __CFString *v8;

  v6 = a3;
  if (!v6)
  {
    v8 = CFSTR("Haruspex encryption key missing.");
    goto LABEL_5;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 1);
  if (!v7)
  {
    v8 = CFSTR("Corrupt Haruspex encryption key detected");
LABEL_5:
    objc_msgSend(a1, "_generateError:errorCode:message:underlyingError:", a4, 1, v8, 0);
    v7 = 0;
  }

  return v7;
}

+ (id)_prepareDatasetWithOptions:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  +[PHAPrivateFederatedLearningRunner datasetBuilderForOptions:error:](PHAPrivateFederatedLearningRunner, "datasetBuilderForOptions:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "datasetWithError:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)datasetBuilderForOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  PHADatasetBuilder *v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(v6, "trainingTask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("AssetFingerprintTrainingTask"));

  if (!v8)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "trainingTask");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Training task %@ is not supported"), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_generateError:errorCode:message:underlyingError:", a4, 4, v12, 0);

    goto LABEL_5;
  }
  +[PHAPrivateFederatedLearningRecipeOptions validateRecipeOptions:error:](PHAPrivateFederatedLearningRecipeOptions, "validateRecipeOptions:error:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v10 = -[PHADatasetBuilder initWithDatasetOptions:]([PHADatasetBuilder alloc], "initWithDatasetOptions:", v6);
LABEL_6:

  return v10;
}

+ (id)_firstAttachmentURLWithSuffixOfName:(id)a3 attachments:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "_firstAttachmentURLWithSuffixOfName:attachments:expectedDirectory:error:", a3, a4, 0, a5);
}

+ (id)_firstAttachmentURLWithSuffixOfName:(id)a3 attachments:(id)a4 expectedDirectory:(BOOL)a5 error:(id *)a6
{
  int v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v22;
  id v23;
  unsigned __int8 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v6 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "hasSuffix:", v8);

        if (v18)
        {
          v27 = 0;
          objc_msgSend(v16, "path");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v10, "fileExistsAtPath:isDirectory:", v19, &v27);

          if (v20 && v27 == v6)
          {
            v23 = v16;
            v22 = v11;
            goto LABEL_15;
          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v13)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing %@ resource for PFL"), v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_generateError:errorCode:message:underlyingError:", a6, 2, v22, 0);
  v23 = 0;
LABEL_15:

  return v23;
}

+ (id)_mediaAnalysisImageProgressForPhotoLibrary:(id)a3 error:(id *)a4
{
  objc_msgSend(a3, "ratioOfAssetsWithMediaAnalysisImageProcessed");
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
}

@end
