@implementation PHAPrivateFederatedLearningRecipeDecoder

+ (id)decodeRecipeUserInfo:(id)a3 attachmentURLs:(id)a4 photoLibrary:(id)a5 graphManager:(id)a6 decodingError:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PHAPrivateFederatedLearningRecipeOptions *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  PHAPrivateFederatedLearningTransformersDecoder *v66;
  void *v67;
  void *v68;
  void *v69;
  PHAPrivateFederatedLearningAugmentersDecoder *v70;
  void *v71;
  void *v72;
  void *v73;
  PHAPrivateFederatedLearningFiltersDecoder *v74;
  void *v75;
  PHAPrivateFederatedLearningFiltersDecoder *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  PHAPrivateFederatedLearningRunner *v114;
  id v116;
  id v117;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a4;
  v16 = objc_alloc_init(PHAPrivateFederatedLearningRecipeOptions);
  -[PHAPrivateFederatedLearningRecipeOptions setAttachmentURLs:](v16, "setAttachmentURLs:", v15);

  objc_opt_class();
  objc_msgSend(a1, "objectOfClass:forKey:inDictionary:error:", objc_opt_class(), CFSTR("layersToTrain"), v12, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAPrivateFederatedLearningRecipeOptions setLayersToTrain:](v16, "setLayersToTrain:", v17);

  v18 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHAPrivateFederatedLearningRecipeOptions numberOfEpochs](v16, "numberOfEpochs"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v18, CFSTR("numberOfEpochs"), v12, v19, a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAPrivateFederatedLearningRecipeOptions setNumberOfEpochs:](v16, "setNumberOfEpochs:", objc_msgSend(v20, "unsignedIntegerValue"));

  v21 = objc_opt_class();
  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[PHAPrivateFederatedLearningRecipeOptions learningRate](v16, "learningRate");
  objc_msgSend(v22, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v21, CFSTR("learningRate"), v12, v23, a7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  -[PHAPrivateFederatedLearningRecipeOptions setLearningRate:](v16, "setLearningRate:");

  objc_msgSend(a1, "objectOfClass:forKey:inDictionary:error:", objc_opt_class(), CFSTR("modelInputName"), v12, a7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAPrivateFederatedLearningRecipeOptions setModelInputName:](v16, "setModelInputName:", v25);

  -[PHAPrivateFederatedLearningRecipeOptions modelInputName](v16, "modelInputName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26
    && (objc_msgSend(a1, "objectOfClass:forKey:inDictionary:error:", objc_opt_class(), CFSTR("modelOutputName"), v12, a7), v27 = (void *)objc_claimAutoreleasedReturnValue(), -[PHAPrivateFederatedLearningRecipeOptions setModelOutputName:](v16, "setModelOutputName:", v27), v27, -[PHAPrivateFederatedLearningRecipeOptions modelOutputName](v16, "modelOutputName"), v28 = (void *)objc_claimAutoreleasedReturnValue(), v28, v28))
  {
    v29 = objc_opt_class();
    -[PHAPrivateFederatedLearningRecipeOptions lossName](v16, "lossName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v29, CFSTR("lossName"), v12, v30, a7);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAPrivateFederatedLearningRecipeOptions setLossName:](v16, "setLossName:", v31);

    v32 = objc_opt_class();
    -[PHAPrivateFederatedLearningRecipeOptions optimizerName](v16, "optimizerName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v32, CFSTR("optimizerName"), v12, v33, a7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAPrivateFederatedLearningRecipeOptions setOptimizerName:](v16, "setOptimizerName:", v34);

    v35 = objc_opt_class();
    -[PHAPrivateFederatedLearningRecipeOptions trainingTask](v16, "trainingTask");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v35, CFSTR("trainingTask"), v12, v36, a7);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAPrivateFederatedLearningRecipeOptions setTrainingTask:](v16, "setTrainingTask:", v37);

    v38 = objc_opt_class();
    -[PHAPrivateFederatedLearningRecipeOptions fingerprintVersionName](v16, "fingerprintVersionName");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v38, CFSTR("fingerprintVersion"), v12, v39, a7);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAPrivateFederatedLearningRecipeOptions setFingerprintVersionName:](v16, "setFingerprintVersionName:", v40);

    v41 = objc_opt_class();
    -[PHAPrivateFederatedLearningRecipeOptions datasetPolicyString](v16, "datasetPolicyString");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v41, CFSTR("datasetPolicy"), v12, v42, a7);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAPrivateFederatedLearningRecipeOptions setDatasetPolicyString:](v16, "setDatasetPolicyString:", v43);

    v44 = objc_opt_class();
    -[PHAPrivateFederatedLearningRecipeOptions labelPolicyString](v16, "labelPolicyString");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v44, CFSTR("labelPolicy"), v12, v45, a7);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAPrivateFederatedLearningRecipeOptions setLabelPolicyString:](v16, "setLabelPolicyString:", v46);

    v47 = objc_opt_class();
    -[PHAPrivateFederatedLearningRecipeOptions positivesDatasetName](v16, "positivesDatasetName");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v47, CFSTR("positivesDatasetName"), v12, v48, a7);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAPrivateFederatedLearningRecipeOptions setPositivesDatasetName:](v16, "setPositivesDatasetName:", v49);

    v50 = objc_opt_class();
    -[PHAPrivateFederatedLearningRecipeOptions positivesSubsetName](v16, "positivesSubsetName");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v50, CFSTR("positivesSubsetName"), v12, v51, a7);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAPrivateFederatedLearningRecipeOptions setPositivesSubsetName:](v16, "setPositivesSubsetName:", v52);

    v53 = objc_opt_class();
    -[PHAPrivateFederatedLearningRecipeOptions negativesDatasetName](v16, "negativesDatasetName");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v53, CFSTR("negativesDatasetName"), v12, v54, a7);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAPrivateFederatedLearningRecipeOptions setNegativesDatasetName:](v16, "setNegativesDatasetName:", v55);

    v56 = objc_opt_class();
    -[PHAPrivateFederatedLearningRecipeOptions negativesSubsetName](v16, "negativesSubsetName");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v56, CFSTR("negativesSubsetName"), v12, v57, a7);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAPrivateFederatedLearningRecipeOptions setNegativesSubsetName:](v16, "setNegativesSubsetName:", v58);

    v59 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHAPrivateFederatedLearningRecipeOptions totalNumberOfSamples](v16, "totalNumberOfSamples"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v59, CFSTR("totalNumberOfSamples"), v12, v60, a7);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAPrivateFederatedLearningRecipeOptions setTotalNumberOfSamples:](v16, "setTotalNumberOfSamples:", objc_msgSend(v61, "unsignedIntegerValue"));

    v62 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHAPrivateFederatedLearningRecipeOptions oversamplingRate](v16, "oversamplingRate"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v62, CFSTR("oversamplingRate"), v12, v63, a7);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAPrivateFederatedLearningRecipeOptions setOversamplingRate:](v16, "setOversamplingRate:", objc_msgSend(v64, "unsignedIntegerValue"));

    -[PHAPrivateFederatedLearningRecipeOptions setPhotoLibrary:](v16, "setPhotoLibrary:", v13);
    v117 = v14;
    -[PHAPrivateFederatedLearningRecipeOptions setGraphManager:](v16, "setGraphManager:", v14);
    objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:error:", objc_opt_class(), CFSTR("transformations"), v12, a7);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v65)
      goto LABEL_5;
    v66 = objc_alloc_init(PHAPrivateFederatedLearningTransformersDecoder);
    -[PHAPrivateFederatedLearningTransformersDecoder transformersForFeatureExtractorsFromDictionary:error:](v66, "transformersForFeatureExtractorsFromDictionary:error:", v65, a7);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAPrivateFederatedLearningRecipeOptions setTransformersForFeatureExtractors:](v16, "setTransformersForFeatureExtractors:", v67);

    -[PHAPrivateFederatedLearningRecipeOptions transformersForFeatureExtractors](v16, "transformersForFeatureExtractors");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v68)
    {
      v114 = 0;
      v14 = v117;
    }
    else
    {
LABEL_5:
      v116 = v13;
      objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:error:", objc_opt_class(), CFSTR("augmentations"), v12, a7);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v69)
        goto LABEL_7;
      v70 = objc_alloc_init(PHAPrivateFederatedLearningAugmentersDecoder);
      -[PHAPrivateFederatedLearningAugmentersDecoder augmentersFromArray:error:](v70, "augmentersFromArray:error:", v69, a7);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAPrivateFederatedLearningRecipeOptions setAugmenters:](v16, "setAugmenters:", v71);

      -[PHAPrivateFederatedLearningRecipeOptions augmenters](v16, "augmenters");
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v72)
      {
        v114 = 0;
        v13 = v116;
        v14 = v117;
      }
      else
      {
LABEL_7:
        objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:error:", objc_opt_class(), CFSTR("filters"), v12, a7);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v73)
          goto LABEL_9;
        v74 = [PHAPrivateFederatedLearningFiltersDecoder alloc];
        -[PHAPrivateFederatedLearningRecipeOptions fingerprintVersionName](v16, "fingerprintVersionName");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = -[PHAPrivateFederatedLearningFiltersDecoder initWithFingeprintVersionString:](v74, "initWithFingeprintVersionString:", v75);

        -[PHAPrivateFederatedLearningFiltersDecoder filtersByDatasetNameFromDictionary:error:](v76, "filtersByDatasetNameFromDictionary:error:", v73, a7);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAPrivateFederatedLearningRecipeOptions setFiltersByDatasetName:](v16, "setFiltersByDatasetName:", v77);

        -[PHAPrivateFederatedLearningRecipeOptions filtersByDatasetName](v16, "filtersByDatasetName");
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v78)
        {
          v114 = 0;
          v13 = v116;
          v14 = v117;
        }
        else
        {
LABEL_9:
          v79 = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHAPrivateFederatedLearningRecipeOptions shouldValidateModel](v16, "shouldValidateModel"));
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v79, CFSTR("validateModel"), v12, v80, a7);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHAPrivateFederatedLearningRecipeOptions setShouldValidateModel:](v16, "setShouldValidateModel:", objc_msgSend(v81, "BOOLValue"));

          v82 = objc_opt_class();
          v83 = (void *)MEMORY[0x1E0CB37E8];
          -[PHAPrivateFederatedLearningRecipeOptions minProcessedRate](v16, "minProcessedRate");
          objc_msgSend(v83, "numberWithDouble:");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v82, CFSTR("minProcessedRate"), v12, v84, a7);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "doubleValue");
          -[PHAPrivateFederatedLearningRecipeOptions setMinProcessedRate:](v16, "setMinProcessedRate:");

          v86 = objc_opt_class();
          -[PHAPrivateFederatedLearningRecipeOptions datasetSource](v16, "datasetSource");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v86, CFSTR("datasetSource"), v12, v87, a7);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHAPrivateFederatedLearningRecipeOptions setDatasetSource:](v16, "setDatasetSource:", v88);

          v89 = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHAPrivateFederatedLearningRecipeOptions numberOfClasses](v16, "numberOfClasses"));
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v89, CFSTR("numberOfClasses"), v12, v90, a7);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHAPrivateFederatedLearningRecipeOptions setNumberOfClasses:](v16, "setNumberOfClasses:", objc_msgSend(v91, "unsignedIntegerValue"));

          v92 = objc_opt_class();
          -[PHAPrivateFederatedLearningRecipeOptions learningFramework](v16, "learningFramework");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v92, CFSTR("learningFramework"), v12, v93, a7);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHAPrivateFederatedLearningRecipeOptions setLearningFramework:](v16, "setLearningFramework:", v94);

          v95 = objc_opt_class();
          -[PHAPrivateFederatedLearningRecipeOptions evaluationMetricNames](v16, "evaluationMetricNames");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v95, CFSTR("evaluationMetricNames"), v12, v96, a7);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHAPrivateFederatedLearningRecipeOptions setEvaluationMetricNames:](v16, "setEvaluationMetricNames:", v97);

          v98 = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHAPrivateFederatedLearningRecipeOptions batchSize](v16, "batchSize"));
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v98, CFSTR("batchSize"), v12, v99, a7);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHAPrivateFederatedLearningRecipeOptions setBatchSize:](v16, "setBatchSize:", objc_msgSend(v100, "unsignedIntegerValue"));

          v101 = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHAPrivateFederatedLearningRecipeOptions featureSize](v16, "featureSize"));
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v101, CFSTR("featureSize"), v12, v102, a7);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHAPrivateFederatedLearningRecipeOptions setFeatureSize:](v16, "setFeatureSize:", objc_msgSend(v103, "unsignedIntegerValue"));

          v104 = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHAPrivateFederatedLearningRecipeOptions labelSize](v16, "labelSize"));
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v104, CFSTR("labelSize"), v12, v105, a7);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHAPrivateFederatedLearningRecipeOptions setLabelSize:](v16, "setLabelSize:", objc_msgSend(v106, "unsignedIntegerValue"));

          v107 = objc_opt_class();
          -[PHAPrivateFederatedLearningRecipeOptions biomeInputName](v16, "biomeInputName");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v107, CFSTR("biomeInputName"), v12, v108, a7);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHAPrivateFederatedLearningRecipeOptions setBiomeInputName:](v16, "setBiomeInputName:", v109);

          v110 = objc_opt_class();
          -[PHAPrivateFederatedLearningRecipeOptions biomeLabelName](v16, "biomeLabelName");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:defaultValue:error:", v110, CFSTR("biomeLabelName"), v12, v111, a7);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHAPrivateFederatedLearningRecipeOptions setBiomeLabelName:](v16, "setBiomeLabelName:", v112);

          +[PHAPrivateFederatedLearningRecipeOptions validateRecipeOptions:error:](PHAPrivateFederatedLearningRecipeOptions, "validateRecipeOptions:error:", v16, a7);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          if (v113)
            v114 = -[PHAPrivateFederatedLearningRunner initWithRecipeOptions:]([PHAPrivateFederatedLearningRunner alloc], "initWithRecipeOptions:", v16);
          else
            v114 = 0;
          v13 = v116;
          v14 = v117;

        }
      }

    }
  }
  else
  {
    v114 = 0;
  }

  return v114;
}

+ (id)optionalObjectOfClass:(Class)a3 forKey:(id)a4 inDictionary:(id)a5 defaultValue:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;

  v12 = a4;
  v13 = a6;
  objc_msgSend(a5, "objectForKeyedSubscript:", v12);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (id)v14;
  if (!v13 || v14)
  {
    if (!v14)
    {
      v16 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    v15 = v13;
  }
  objc_msgSend(a1, "castObject:withName:toClass:error:", v15, v12, a3, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v16;
}

+ (id)optionalObjectOfClass:(Class)a3 forKey:(id)a4 inDictionary:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;

  v10 = a4;
  objc_msgSend(a5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(a1, "castObject:withName:toClass:error:", v11, v10, a3, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)objectOfClass:(Class)a3 forKey:(id)a4 inDictionary:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;

  v10 = a4;
  objc_msgSend(a5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(a1, "castObject:withName:toClass:error:", v11, v10, a3, a6);
    a6 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No value for key: (%@)"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "decodingErrorWithMessage:", v12);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    a6 = 0;
  }

  return a6;
}

+ (id)castObject:(id)a3 withName:(id)a4 toClass:(Class)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a3;
  v11 = a4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a6 = (id *)v10;
  }
  else if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Object with name (%@) has class (%@), expected (%@)"), v11, objc_opt_class(), a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "decodingErrorWithMessage:", v12);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    a6 = 0;
  }

  return a6;
}

+ (id)decodingErrorWithMessage:(id)a3
{
  const __CFString *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    v3 = (const __CFString *)a3;
  else
    v3 = CFSTR("No error message");
  v10 = *MEMORY[0x1E0CB2D50];
  v11[0] = v3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0CB35C8]);

  v8 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("com.apple.PhotoAnalysis.PHAPrivateFederatedLearningRecipeDecoder"), 10001, v6);
  return v8;
}

@end
