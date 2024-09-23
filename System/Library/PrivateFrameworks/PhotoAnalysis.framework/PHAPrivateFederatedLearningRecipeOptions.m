@implementation PHAPrivateFederatedLearningRecipeOptions

- (PHAPrivateFederatedLearningRecipeOptions)init
{
  PHAPrivateFederatedLearningRecipeOptions *v2;
  PHAPrivateFederatedLearningRecipeOptions *v3;
  uint64_t v4;
  id v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHAPrivateFederatedLearningRecipeOptions;
  v2 = -[PHAPrivateFederatedLearningRecipeOptions init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = MEMORY[0x1E0C9AA60];
    -[PHAPrivateFederatedLearningRecipeOptions setAttachmentURLs:](v2, "setAttachmentURLs:", MEMORY[0x1E0C9AA60]);
    -[PHAPrivateFederatedLearningRecipeOptions setNumberOfEpochs:](v3, "setNumberOfEpochs:", PHAPrivateFederatedLearningRecipeOptionsDefaultNumberOfEpochs);
    v5 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    -[PHAPrivateFederatedLearningRecipeOptions setLayersToTrain:](v3, "setLayersToTrain:", v5);

    -[PHAPrivateFederatedLearningRecipeOptions setLearningRate:](v3, "setLearningRate:", (double)(unint64_t)PHAPrivateFederatedLearningRecipeOptionsDefaultNumberOfEpochs);
    -[PHAPrivateFederatedLearningRecipeOptions setModelInputName:](v3, "setModelInputName:", PHAPrivateFederatedLearningRecipeOptionsDefaultModelInputName);
    -[PHAPrivateFederatedLearningRecipeOptions setModelOutputName:](v3, "setModelOutputName:", PHAPrivateFederatedLearningRecipeOptionsDefaultModelOutputName);
    -[PHAPrivateFederatedLearningRecipeOptions setLabelName:](v3, "setLabelName:", PHAPrivateFederatedLearningDefaultModelLabelName);
    -[PHAPrivateFederatedLearningRecipeOptions setLossName:](v3, "setLossName:", PHAPrivateFederatedLearningRecipeOptionsDefaultLossName);
    -[PHAPrivateFederatedLearningRecipeOptions setOptimizerName:](v3, "setOptimizerName:", PHAPrivateFederatedLearningRecipeOptionsDefaultOptimizerName);
    -[PHAPrivateFederatedLearningRecipeOptions setTrainingTask:](v3, "setTrainingTask:", PHAPrivateFederatedLearningRecipeOptionsDefaultTrainingTask);
    -[PHAPrivateFederatedLearningRecipeOptions setFingerprintVersionName:](v3, "setFingerprintVersionName:", PHAPrivateFederatedLearningRecipeOptionsDefaultFingerprintVersionName);
    -[PHAPrivateFederatedLearningRecipeOptions setDatasetPolicyString:](v3, "setDatasetPolicyString:", CFSTR("balanced"));
    -[PHAPrivateFederatedLearningRecipeOptions setLabelPolicyString:](v3, "setLabelPolicyString:", CFSTR("indexed"));
    -[PHAPrivateFederatedLearningRecipeOptions setPositivesDatasetName:](v3, "setPositivesDatasetName:", 0);
    -[PHAPrivateFederatedLearningRecipeOptions setPositivesSubsetName:](v3, "setPositivesSubsetName:", 0);
    -[PHAPrivateFederatedLearningRecipeOptions setNegativesDatasetName:](v3, "setNegativesDatasetName:", PHAPrivateFederatedLearningRecipeOptionsLearningDefaultNegativesDatasetName);
    -[PHAPrivateFederatedLearningRecipeOptions setNegativesSubsetName:](v3, "setNegativesSubsetName:", 0);
    -[PHAPrivateFederatedLearningRecipeOptions setTotalNumberOfSamples:](v3, "setTotalNumberOfSamples:", PHAPrivateFederatedLearningRecipeOptionsDefaultTotalNumberOfSamples);
    -[PHAPrivateFederatedLearningRecipeOptions setOversamplingRate:](v3, "setOversamplingRate:", PHAPrivateFederatedLearningRecipeOptionsDefaultOversamplingRate);
    -[PHAPrivateFederatedLearningRecipeOptions setPhotoLibrary:](v3, "setPhotoLibrary:", 0);
    -[PHAPrivateFederatedLearningRecipeOptions setGraphManager:](v3, "setGraphManager:", 0);
    -[PHAPrivateFederatedLearningRecipeOptions setShouldValidateModel:](v3, "setShouldValidateModel:", 1);
    -[PHAPrivateFederatedLearningRecipeOptions setMinProcessedRate:](v3, "setMinProcessedRate:", *(double *)&PHAPrivateFederatedLearningRecipeOptionsDefaultMinProcessRate);
    v6 = objc_alloc_init(MEMORY[0x1E0D75F50]);
    -[PHAPrivateFederatedLearningRecipeOptions setTransformersForFeatureExtractors:](v3, "setTransformersForFeatureExtractors:", v6);

    -[PHAPrivateFederatedLearningRecipeOptions setAugmenters:](v3, "setAugmenters:", v4);
    -[PHAPrivateFederatedLearningRecipeOptions setFiltersByDatasetName:](v3, "setFiltersByDatasetName:", MEMORY[0x1E0C9AA70]);
    -[PHAPrivateFederatedLearningRecipeOptions setDatasetSource:](v3, "setDatasetSource:", PHAPrivateFederatedLearningRecipeOptionsDefaultDatasetSource);
    -[PHAPrivateFederatedLearningRecipeOptions setNumberOfClasses:](v3, "setNumberOfClasses:", 2);
    -[PHAPrivateFederatedLearningRecipeOptions setLearningFramework:](v3, "setLearningFramework:", PHAPrivateFederatedLearningRecipeOptionsLearningDefaultFramework);
    -[PHAPrivateFederatedLearningRecipeOptions setEvaluationMetricNames:](v3, "setEvaluationMetricNames:", v4);
    -[PHAPrivateFederatedLearningRecipeOptions setBatchSize:](v3, "setBatchSize:", PHAPrivateFederatedLearningDefaultBatchSize);
    -[PHAPrivateFederatedLearningRecipeOptions setFeatureSize:](v3, "setFeatureSize:", PHAPrivateFederatedLearningDefaultFeatureSize);
    -[PHAPrivateFederatedLearningRecipeOptions setLabelSize:](v3, "setLabelSize:", PHAPrivateFederatedLearningDefaultLabelSize);
    -[PHAPrivateFederatedLearningRecipeOptions setBiomeInputName:](v3, "setBiomeInputName:", PHAPrivateFederatedLearningDefaultBiomeInputName);
    -[PHAPrivateFederatedLearningRecipeOptions setBiomeLabelName:](v3, "setBiomeLabelName:", PHAPrivateFederatedLearningDefaultBiomeLabelName);
  }
  return v3;
}

- (NSArray)attachmentURLs
{
  return self->_attachmentURLs;
}

- (void)setAttachmentURLs:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentURLs, a3);
}

- (unint64_t)numberOfEpochs
{
  return self->_numberOfEpochs;
}

- (void)setNumberOfEpochs:(unint64_t)a3
{
  self->_numberOfEpochs = a3;
}

- (NSArray)layersToTrain
{
  return self->_layersToTrain;
}

- (void)setLayersToTrain:(id)a3
{
  objc_storeStrong((id *)&self->_layersToTrain, a3);
}

- (double)learningRate
{
  return self->_learningRate;
}

- (void)setLearningRate:(double)a3
{
  self->_learningRate = a3;
}

- (NSString)modelInputName
{
  return self->_modelInputName;
}

- (void)setModelInputName:(id)a3
{
  objc_storeStrong((id *)&self->_modelInputName, a3);
}

- (NSString)modelOutputName
{
  return self->_modelOutputName;
}

- (void)setModelOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_modelOutputName, a3);
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

- (NSString)trainingTask
{
  return self->_trainingTask;
}

- (void)setTrainingTask:(id)a3
{
  objc_storeStrong((id *)&self->_trainingTask, a3);
}

- (NSString)fingerprintVersionName
{
  return self->_fingerprintVersionName;
}

- (void)setFingerprintVersionName:(id)a3
{
  objc_storeStrong((id *)&self->_fingerprintVersionName, a3);
}

- (int64_t)fingerprintVersion
{
  return self->_fingerprintVersion;
}

- (void)setFingerprintVersion:(int64_t)a3
{
  self->_fingerprintVersion = a3;
}

- (NSString)datasetPolicyString
{
  return self->_datasetPolicyString;
}

- (void)setDatasetPolicyString:(id)a3
{
  objc_storeStrong((id *)&self->_datasetPolicyString, a3);
}

- (int64_t)datasetPolicy
{
  return self->_datasetPolicy;
}

- (void)setDatasetPolicy:(int64_t)a3
{
  self->_datasetPolicy = a3;
}

- (NSString)labelPolicyString
{
  return self->_labelPolicyString;
}

- (void)setLabelPolicyString:(id)a3
{
  objc_storeStrong((id *)&self->_labelPolicyString, a3);
}

- (int64_t)labelPolicy
{
  return self->_labelPolicy;
}

- (void)setLabelPolicy:(int64_t)a3
{
  self->_labelPolicy = a3;
}

- (NSString)positivesDatasetName
{
  return self->_positivesDatasetName;
}

- (void)setPositivesDatasetName:(id)a3
{
  objc_storeStrong((id *)&self->_positivesDatasetName, a3);
}

- (NSString)positivesSubsetName
{
  return self->_positivesSubsetName;
}

- (void)setPositivesSubsetName:(id)a3
{
  objc_storeStrong((id *)&self->_positivesSubsetName, a3);
}

- (NSString)negativesDatasetName
{
  return self->_negativesDatasetName;
}

- (void)setNegativesDatasetName:(id)a3
{
  objc_storeStrong((id *)&self->_negativesDatasetName, a3);
}

- (NSString)negativesSubsetName
{
  return self->_negativesSubsetName;
}

- (void)setNegativesSubsetName:(id)a3
{
  objc_storeStrong((id *)&self->_negativesSubsetName, a3);
}

- (unint64_t)totalNumberOfSamples
{
  return self->_totalNumberOfSamples;
}

- (void)setTotalNumberOfSamples:(unint64_t)a3
{
  self->_totalNumberOfSamples = a3;
}

- (unint64_t)oversamplingRate
{
  return self->_oversamplingRate;
}

- (void)setOversamplingRate:(unint64_t)a3
{
  self->_oversamplingRate = a3;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (PGManager)graphManager
{
  return self->_graphManager;
}

- (void)setGraphManager:(id)a3
{
  objc_storeStrong((id *)&self->_graphManager, a3);
}

- (BOOL)shouldValidateModel
{
  return self->_shouldValidateModel;
}

- (void)setShouldValidateModel:(BOOL)a3
{
  self->_shouldValidateModel = a3;
}

- (double)minProcessedRate
{
  return self->_minProcessedRate;
}

- (void)setMinProcessedRate:(double)a3
{
  self->_minProcessedRate = a3;
}

- (PGFeatureTransformersForFeatureExtractors)transformersForFeatureExtractors
{
  return self->_transformersForFeatureExtractors;
}

- (void)setTransformersForFeatureExtractors:(id)a3
{
  objc_storeStrong((id *)&self->_transformersForFeatureExtractors, a3);
}

- (NSArray)augmenters
{
  return self->_augmenters;
}

- (void)setAugmenters:(id)a3
{
  objc_storeStrong((id *)&self->_augmenters, a3);
}

- (NSDictionary)filtersByDatasetName
{
  return self->_filtersByDatasetName;
}

- (void)setFiltersByDatasetName:(id)a3
{
  objc_storeStrong((id *)&self->_filtersByDatasetName, a3);
}

- (NSString)datasetSource
{
  return self->_datasetSource;
}

- (void)setDatasetSource:(id)a3
{
  objc_storeStrong((id *)&self->_datasetSource, a3);
}

- (unint64_t)numberOfClasses
{
  return self->_numberOfClasses;
}

- (void)setNumberOfClasses:(unint64_t)a3
{
  self->_numberOfClasses = a3;
}

- (NSString)learningFramework
{
  return self->_learningFramework;
}

- (void)setLearningFramework:(id)a3
{
  objc_storeStrong((id *)&self->_learningFramework, a3);
}

- (NSArray)evaluationMetricNames
{
  return self->_evaluationMetricNames;
}

- (void)setEvaluationMetricNames:(id)a3
{
  objc_storeStrong((id *)&self->_evaluationMetricNames, a3);
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (unint64_t)featureSize
{
  return self->_featureSize;
}

- (void)setFeatureSize:(unint64_t)a3
{
  self->_featureSize = a3;
}

- (unint64_t)labelSize
{
  return self->_labelSize;
}

- (void)setLabelSize:(unint64_t)a3
{
  self->_labelSize = a3;
}

- (NSString)biomeInputName
{
  return self->_biomeInputName;
}

- (void)setBiomeInputName:(id)a3
{
  objc_storeStrong((id *)&self->_biomeInputName, a3);
}

- (NSString)biomeLabelName
{
  return self->_biomeLabelName;
}

- (void)setBiomeLabelName:(id)a3
{
  objc_storeStrong((id *)&self->_biomeLabelName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeLabelName, 0);
  objc_storeStrong((id *)&self->_biomeInputName, 0);
  objc_storeStrong((id *)&self->_evaluationMetricNames, 0);
  objc_storeStrong((id *)&self->_learningFramework, 0);
  objc_storeStrong((id *)&self->_datasetSource, 0);
  objc_storeStrong((id *)&self->_filtersByDatasetName, 0);
  objc_storeStrong((id *)&self->_augmenters, 0);
  objc_storeStrong((id *)&self->_transformersForFeatureExtractors, 0);
  objc_storeStrong((id *)&self->_graphManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_negativesSubsetName, 0);
  objc_storeStrong((id *)&self->_negativesDatasetName, 0);
  objc_storeStrong((id *)&self->_positivesSubsetName, 0);
  objc_storeStrong((id *)&self->_positivesDatasetName, 0);
  objc_storeStrong((id *)&self->_labelPolicyString, 0);
  objc_storeStrong((id *)&self->_datasetPolicyString, 0);
  objc_storeStrong((id *)&self->_fingerprintVersionName, 0);
  objc_storeStrong((id *)&self->_trainingTask, 0);
  objc_storeStrong((id *)&self->_optimizerName, 0);
  objc_storeStrong((id *)&self->_lossName, 0);
  objc_storeStrong((id *)&self->_labelName, 0);
  objc_storeStrong((id *)&self->_modelOutputName, 0);
  objc_storeStrong((id *)&self->_modelInputName, 0);
  objc_storeStrong((id *)&self->_layersToTrain, 0);
  objc_storeStrong((id *)&self->_attachmentURLs, 0);
}

+ (int64_t)datasetPolicyForPolicyName:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("balanced")) & 1) != 0)
    {
      v5 = 0;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("balanced-strict")) & 1) != 0)
    {
      v5 = 1;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("unbalanced")))
    {
      v5 = 2;
    }
    else
    {
      v5 = -1;
    }
  }
  else
  {
    v5 = -1;
  }

  return v5;
}

+ (int64_t)labelPolicyForLabelPolicyName:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("indexed")) & 1) != 0)
    {
      v5 = 0;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("one-hot")))
    {
      v5 = 1;
    }
    else
    {
      v5 = -1;
    }
  }
  else
  {
    v5 = -1;
  }

  return v5;
}

+ (id)validateRecipeOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v26;
  void *v27;
  const __CFString *v28;
  id v29;
  id *v30;
  uint64_t v31;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0D75F68];
  objc_msgSend(v6, "fingerprintVersionName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFingerprintVersion:", objc_msgSend(v7, "fingerprintVersionForName:", v8));

  if (objc_msgSend(v6, "fingerprintVersion"))
  {
    objc_msgSend(v6, "datasetPolicyString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDatasetPolicy:", +[PHAPrivateFederatedLearningRecipeOptions datasetPolicyForPolicyName:](PHAPrivateFederatedLearningRecipeOptions, "datasetPolicyForPolicyName:", v9));

    if (objc_msgSend(v6, "datasetPolicy") == -1)
    {
      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "datasetPolicyString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("Unknown dataset policy(%@)"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = a1;
      v20 = a4;
      v21 = 2;
    }
    else
    {
      objc_msgSend(v6, "labelPolicyString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLabelPolicy:", +[PHAPrivateFederatedLearningRecipeOptions labelPolicyForLabelPolicyName:](PHAPrivateFederatedLearningRecipeOptions, "labelPolicyForLabelPolicyName:", v10));

      if (objc_msgSend(v6, "labelPolicy") != -1)
      {
        objc_msgSend(v6, "positivesDatasetName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          if ((objc_msgSend(v6, "totalNumberOfSamples") & 1) != 0
            && (!objc_msgSend(v6, "datasetPolicy") || objc_msgSend(v6, "datasetPolicy") == 1))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Value for totalNumberOfSamples (%lu) can't be odd when generator policy is 'balanced'"), objc_msgSend(v6, "totalNumberOfSamples"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = a1;
            v14 = a4;
            v15 = 5;
LABEL_21:
            objc_msgSend(v13, "_generateError:errorCode:message:underlyingError:", v14, v15, v12, 0);

            goto LABEL_13;
          }
          if (!objc_msgSend(v6, "oversamplingRate"))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Value for oversamplingRate (%lu) can't be <= 0"), objc_msgSend(v6, "oversamplingRate"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = a1;
            v14 = a4;
            v15 = 6;
            goto LABEL_21;
          }
          objc_msgSend(v6, "photoLibrary");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            objc_msgSend(v6, "graphManager");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
            {
              v24 = v6;
              goto LABEL_14;
            }
            v28 = CFSTR("Graph manager is nil");
            v29 = a1;
            v30 = a4;
            v31 = 8;
          }
          else
          {
            v28 = CFSTR("Photo library is nil");
            v29 = a1;
            v30 = a4;
            v31 = 7;
          }
        }
        else
        {
          v28 = CFSTR("Positives dataset name is nil");
          v29 = a1;
          v30 = a4;
          v31 = 4;
        }
        objc_msgSend(v29, "_generateError:errorCode:message:underlyingError:", v30, v31, v28, 0);
        goto LABEL_13;
      }
      v23 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "labelPolicyString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("Unknown label policy(%@)"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = a1;
      v20 = a4;
      v21 = 3;
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "fingerprintVersionName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Unknown fingerprint version name(%@)"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = a1;
    v20 = a4;
    v21 = 1;
  }
  objc_msgSend(v19, "_generateError:errorCode:message:underlyingError:", v20, v21, v18, 0);

LABEL_13:
  v24 = 0;
LABEL_14:

  return v24;
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
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoAnalysis.PHAPrivateFederatedLearningRecipeOptions"), a4, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    v9 = v13;
  }

}

@end
