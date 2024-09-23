@implementation _LTLanguageDetectorFeatureCombinationModel

- (_LTLanguageDetectorFeatureCombinationModel)initWithConfig:(id)a3
{
  id v4;
  _LTLanguageDetectorFeatureCombinationModel *v5;
  _LTLanguageDetectorFeatureCombinationModel *v6;
  _LTLanguageDetectorFeatureCombinationModel *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *modelInput;
  void *v13;
  _BOOL4 v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSString *modelOutput;
  uint64_t v19;
  NSDictionary *languageLocaleToIdentifier;
  uint64_t v21;
  NSNumber *missingFeatureValueDefault;
  NSObject *v23;
  uint64_t v24;
  NSNumber *missingLanguageDetectorDefault;
  NSObject *v26;
  NSMutableArray *v27;
  NSMutableArray *features;
  id *v29;
  NSObject *v30;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  _QWORD v43[4];
  id *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  objc_super v50;
  _BYTE v51[24];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)_LTLanguageDetectorFeatureCombinationModel;
  v5 = -[_LTLanguageDetectorFeatureCombinationModel init](&v50, sel_init);
  v6 = v5;
  v7 = 0;
  if (v4 && v5)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:", v4);
    objc_msgSend(v8, "objectForKey:", CFSTR("features"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("compiledModelFile"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("modelInput"));
    v11 = objc_claimAutoreleasedReturnValue();
    modelInput = v6->_modelInput;
    v6->_modelInput = (NSString *)v11;

    objc_msgSend(v8, "objectForKey:", CFSTR("modelInputIsMatrix"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

    if (v14)
    {
      v16 = _LTOSLogLID();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[_LTLanguageDetectorFeatureCombinationModel initWithConfig:].cold.6();
      v6->_modelInputIsMatrix = 0;
    }
    else
    {
      objc_msgSend(v8, "valueForKey:", CFSTR("modelInputIsMatrix"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_modelInputIsMatrix = objc_msgSend(v15, "BOOLValue");

    }
    objc_msgSend(v8, "objectForKey:", CFSTR("modelOutput"));
    v17 = objc_claimAutoreleasedReturnValue();
    modelOutput = v6->_modelOutput;
    v6->_modelOutput = (NSString *)v17;

    objc_msgSend(v8, "objectForKey:", CFSTR("LanguageLocaleToIdentifier"));
    v19 = objc_claimAutoreleasedReturnValue();
    languageLocaleToIdentifier = v6->_languageLocaleToIdentifier;
    v6->_languageLocaleToIdentifier = (NSDictionary *)v19;

    if (v9 && v10 && v6->_modelInput && v6->_modelOutput)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("missingFeatureValueDefault"));
      v21 = objc_claimAutoreleasedReturnValue();
      missingFeatureValueDefault = v6->_missingFeatureValueDefault;
      v6->_missingFeatureValueDefault = (NSNumber *)v21;

      if (!v6->_missingFeatureValueDefault)
      {
        v6->_missingFeatureValueDefault = (NSNumber *)&unk_251A50B00;

        v23 = _LTOSLogLID();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          -[_LTLanguageDetectorFeatureCombinationModel initWithConfig:].cold.5((uint64_t)&v6->_missingFeatureValueDefault, v23);
      }
      objc_msgSend(v8, "objectForKey:", CFSTR("missingLanguageDetectionDefault"));
      v24 = objc_claimAutoreleasedReturnValue();
      missingLanguageDetectorDefault = v6->_missingLanguageDetectorDefault;
      v6->_missingLanguageDetectorDefault = (NSNumber *)v24;

      if (!v6->_missingLanguageDetectorDefault)
      {
        v6->_missingLanguageDetectorDefault = (NSNumber *)&unk_251A50A48;

        v26 = _LTOSLogLID();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          -[_LTLanguageDetectorFeatureCombinationModel initWithConfig:].cold.4((uint64_t)&v6->_missingLanguageDetectorDefault, v26);
      }
      v46 = 0;
      v47 = &v46;
      v48 = 0x2020000000;
      v49 = 0;
      v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      features = v6->_features;
      v6->_features = v27;

      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __61___LTLanguageDetectorFeatureCombinationModel_initWithConfig___block_invoke;
      v43[3] = &unk_251A128D8;
      v29 = v6;
      v44 = v29;
      v45 = &v46;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v43);
      if (*((_BYTE *)v47 + 24))
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(v4, "URLByDeletingLastPathComponent");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "URLByAppendingPathComponent:", v10);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = 0;
        objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", v33, &v42);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = v42;
        v36 = v29[1];
        v29[1] = (id)v34;

        if (v35 || !v29[1])
        {
          v37 = (id)_LTOSLogLID();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v33, "path");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[_LTLanguageDetectorFeatureCombinationModel initWithConfig:].cold.2(v38, (uint64_t)v51, v37);
          }

          v7 = 0;
        }
        else
        {
          v39 = (id)_LTOSLogLID();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v29[1], "modelDescription");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "description");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[_LTLanguageDetectorFeatureCombinationModel initWithConfig:].cold.3(v41, (uint64_t)v51, v39, v40);
          }

          v7 = v29;
        }

      }
      _Block_object_dispose(&v46, 8);
    }
    else
    {
      v30 = _LTOSLogLID();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[_LTLanguageDetectorFeatureCombinationModel initWithConfig:].cold.1();
      v7 = 0;
    }

  }
  return v7;
}

- (id)getAcousticLidConfidenceFromResult:(id)a3 locale:(id)a4
{
  id v6;
  void *v7;
  NSNumber *v8;
  NSNumber *missingLanguageDetectorDefault;
  NSNumber *v10;

  if (a3)
  {
    v6 = a4;
    objc_msgSend(a3, "confidences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();

    missingLanguageDetectorDefault = v8;
    if (!v8)
      missingLanguageDetectorDefault = self->_missingLanguageDetectorDefault;
    v10 = missingLanguageDetectorDefault;

  }
  else
  {
    v10 = self->_missingLanguageDetectorDefault;
  }
  return v10;
}

- (id)getModelFeatures:(id)a3 canonicalPair:(id)a4 partialSpeechResultConfidences:(id)a5 finalSpeechResults:(id)a6 modelVersion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSMutableArray *features;
  id v29;
  id v30;
  id v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE v58[24];
  void *v59;
  _QWORD v60[4];

  v60[2] = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v12 = a4;
  v13 = a5;
  v41 = a6;
  v40 = a7;
  LODWORD(a7) = self->_modelInputIsMatrix;
  v14 = objc_alloc(MEMORY[0x24BDBFFF0]);
  if ((_DWORD)a7)
  {
    v60[0] = &unk_251A50B18;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_features, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    v17 = (void *)objc_msgSend(v14, "initWithShape:dataType:error:", v16, 65600, &v57);
    v18 = (id *)&v57;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_features, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v59, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0;
    v17 = (void *)objc_msgSend(v14, "initWithShape:dataType:error:", v16, 65600, &v56);
    v18 = (id *)&v56;
  }
  v19 = *v18;

  if (v19)
  {
    v20 = 0;
  }
  else
  {
    objc_msgSend(v12, "sourceLocale");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v21);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "targetLocale");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "sourceLocale");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKeyedSubscript:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "targetLocale");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKeyedSubscript:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = 0;
    v53 = &v52;
    v54 = 0x2020000000;
    v55 = 0;
    features = self->_features;
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __140___LTLanguageDetectorFeatureCombinationModel_getModelFeatures_canonicalPair_partialSpeechResultConfidences_finalSpeechResults_modelVersion___block_invoke;
    v42[3] = &unk_251A12900;
    v42[4] = self;
    v36 = v25;
    v43 = v36;
    v29 = v17;
    v44 = v29;
    v51 = &v52;
    v30 = v27;
    v45 = v30;
    v46 = v39;
    v47 = v12;
    v38 = v37;
    v48 = v38;
    v31 = v23;
    v49 = v31;
    v50 = v40;
    -[NSMutableArray enumerateObjectsUsingBlock:](features, "enumerateObjectsUsingBlock:", v42);
    if (*((_BYTE *)v53 + 24))
    {
      v32 = (id)_LTOSLogLID();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v29, "description");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[_LTLanguageDetectorFeatureCombinationModel getModelFeatures:canonicalPair:partialSpeechResultConfidences:finalSpeechResults:modelVersion:].cold.2(v33, (uint64_t)v58, v32);
      }

      v20 = v29;
    }
    else
    {
      v34 = _LTOSLogLID();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        -[_LTLanguageDetectorFeatureCombinationModel getModelFeatures:canonicalPair:partialSpeechResultConfidences:finalSpeechResults:modelVersion:].cold.1();
      v20 = 0;
    }

    _Block_object_dispose(&v52, 8);
  }

  return v20;
}

- (id)estimateLanguage:(id)a3 languageDetectionResults:(id)a4 partialSpeechResultConfidences:(id)a5 finalSpeechResults:(id)a6 modelVersions:(id)a7 useFinalThresholds:(BOOL)a8 isLowConfidencePair:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
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
  id v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  BOOL v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  NSObject *v52;
  NSObject *v53;
  float v55;
  void *v56;
  double v57;
  double v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  float v65;
  float v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  NSObject *v72;
  NSObject *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  const __CFString *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  _BOOL4 v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  int v89;
  void *v90;
  _BOOL4 v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  id v98;
  uint8_t buf[4];
  void *v100;
  __int16 v101;
  _BOOL4 v102;
  __int16 v103;
  int v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  uint64_t v108;
  __int16 v109;
  const __CFString *v110;
  __int16 v111;
  double v112;
  __int16 v113;
  double v114;
  __int16 v115;
  _BOOL4 v116;
  _QWORD v117[2];
  _QWORD v118[2];
  NSString *modelInput;
  _QWORD v120[3];

  v91 = a8;
  v120[1] = *MEMORY[0x24BDAC8D0];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  objc_msgSend(a3, "localePair");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "canonicalLocalePair");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "sourceLocale");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    objc_msgSend(v19, "sourceLocale");
  else
    objc_msgSend(v19, "targetLocale");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "sourceLocale");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _LTPreferencesLanguageDetectorFeatureCombinationThresholdVersionForASRDataPack(v24, v23);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "sourceLocale");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "targetLocale");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26 && (objc_msgSend(v26, "isFinal") & 1) != 0)
  {
    v89 = 1;
  }
  else if (v28)
  {
    v89 = objc_msgSend(v28, "isFinal");
  }
  else
  {
    v89 = 0;
  }
  -[_LTLanguageDetectorFeatureCombinationModel getModelFeatures:canonicalPair:partialSpeechResultConfidences:finalSpeechResults:modelVersion:](self, "getModelFeatures:canonicalPair:partialSpeechResultConfidences:finalSpeechResults:modelVersion:", v14, v19, v15, v16, v23);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v92 = v26;
    v93 = v14;
    v30 = v17;
    v31 = v28;
    v96 = v15;
    v32 = objc_alloc(MEMORY[0x24BDBFF80]);
    modelInput = self->_modelInput;
    v120[0] = v29;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v120, &modelInput, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = 0;
    v34 = objc_msgSend(v32, "initWithDictionary:error:", v33, &v98);
    v35 = v98;

    v94 = v35;
    v95 = (void *)v34;
    if (v35)
    {
      v36 = _LTOSLogLID();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        -[_LTLanguageDetectorFeatureCombinationModel estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:].cold.5();
      v37 = 0;
      v15 = v96;
      v28 = v31;
      v17 = v30;
      v26 = v92;
      v14 = v93;
    }
    else
    {
      v88 = objc_alloc_init(MEMORY[0x24BDC0018]);
      -[MLModel predictionFromFeatures:options:error:](self->_mlModel, "predictionFromFeatures:options:error:", v34);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = v39;
      v87 = 0;
      if (v87)
      {
        v40 = _LTOSLogLID();
        v14 = v93;
        v15 = v96;
        v28 = v31;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          -[_LTLanguageDetectorFeatureCombinationModel estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:].cold.4();
        v37 = 0;
        v17 = v30;
        v26 = v92;
      }
      else
      {
        objc_msgSend(v39, "featureValueForName:", self->_modelOutput);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v96;
        v28 = v31;
        v85 = v41;
        if (!v41)
          goto LABEL_33;
        v42 = v41;
        objc_msgSend(v41, "multiArrayValue");
        v43 = objc_claimAutoreleasedReturnValue();
        if (!v43)
          goto LABEL_33;
        v44 = (void *)v43;
        objc_msgSend(v42, "multiArrayValue");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "count");

        v47 = v46 == 2;
        v15 = v96;
        if (v47)
        {
          objc_msgSend(v42, "multiArrayValue");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v42, "multiArrayValue");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "objectAtIndexedSubscript:", 1);
          v84 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = v30;
          v83 = v49;
          if (v49 && v84 && (objc_msgSend(v49, "doubleValue"), v51 != INFINITY))
          {
            objc_msgSend(v49, "doubleValue");
            v55 = _LTPreferencesLanguageDetectorFeatureCombinationModelThresholdsForLocale(v19, v97, v91);
            objc_msgSend(v19, "sourceLocale");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "doubleValue");
            v57 = v55;
            v26 = v92;
            if (v58 < v55)
            {
              objc_msgSend(v19, "targetLocale");
              v59 = objc_claimAutoreleasedReturnValue();

              v56 = (void *)v59;
            }
            v60 = objc_alloc(MEMORY[0x24BDF6410]);
            objc_msgSend(v19, "oppositeToLocale:", v56);
            v61 = objc_claimAutoreleasedReturnValue();
            v62 = v56;
            v63 = (void *)v61;
            v81 = v62;
            v64 = (void *)objc_msgSend(v60, "initWithSourceLocale:targetLocale:");

            v65 = _LTPreferencesLanguageDetectorFeatureCombinationModelConfidenceThresholdsForLocale(v64, v97, v91);
            v66 = v65;
            v80 = v64;
            if (a9)
            {
              v82 = 0;
              v67 = v49;
            }
            else
            {
              v68 = v65;
              v67 = v49;
              objc_msgSend(v49, "doubleValue");
              v82 = vabdd_f64(v57, v69) >= v68;
            }
            objc_msgSend(v19, "sourceLocale");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v117[0] = v70;
            v118[0] = v67;
            objc_msgSend(v19, "targetLocale");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v117[1] = v71;
            v118[1] = v84;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v118, v117, 2);
            v90 = (void *)objc_claimAutoreleasedReturnValue();

            v72 = _LTOSLogLID();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
            {
              v73 = v72;
              objc_msgSend(v81, "_ltLocaleIdentifier");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "objectForKeyedSubscript:", v81);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "doubleValue");
              v76 = v75;
              objc_msgSend(v19, "sourceLocale");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138545410;
              v77 = CFSTR("1.0-");
              v100 = v97;
              if (v81 == v78)
                v77 = &stru_251A15610;
              v101 = 1024;
              v102 = v91;
              v103 = 1024;
              v104 = v89;
              v105 = 2114;
              v106 = v74;
              v107 = 2048;
              v108 = v76;
              v109 = 2114;
              v110 = v77;
              v111 = 2048;
              v112 = v57;
              v113 = 2048;
              v114 = v66;
              v115 = 1024;
              v116 = v82;
              _os_log_debug_impl(&dword_2491B9000, v73, OS_LOG_TYPE_DEBUG, "Queried LID threshold version '%{public}@'; useFinalThresholds: %{BOOL}i; isFinalASR: %{BOOL}i; detected"
                " %{public}@, with score %f using discriminator threshold %{public}@%f and confidence offset %f (confident: %{BOOL}i)",
                buf,
                0x50u);

            }
            v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF63E8]), "initWithConfidences:isConfident:dominantLanguage:isFinal:", v90, v82, v81, 1);

            v14 = v93;
            v15 = v96;
          }
          else
          {
            v52 = _LTOSLogLID();
            v26 = v92;
            v14 = v93;
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
              -[_LTLanguageDetectorFeatureCombinationModel estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:].cold.3();
            v37 = 0;
          }

        }
        else
        {
LABEL_33:
          v53 = _LTOSLogLID();
          v17 = v30;
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            -[_LTLanguageDetectorFeatureCombinationModel estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:].cold.2();
          v37 = 0;
          v26 = v92;
          v14 = v93;
        }

      }
    }

  }
  else
  {
    v38 = _LTOSLogLID();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[_LTLanguageDetectorFeatureCombinationModel estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:].cold.1();
    v37 = 0;
  }

  return v37;
}

- (id)estimateLanguage:(id)a3 languageDetectionResults:(id)a4 partialSpeechResultConfidences:(id)a5 finalSpeechResults:(id)a6 modelVersions:(id)a7 isLowConfidencePair:(BOOL)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  objc_msgSend(v13, "localePair");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "canonicalLocalePair");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "sourceLocale");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "targetLocale");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21 && (objc_msgSend(v21, "isFinal") & 1) != 0)
  {
    v24 = 1;
  }
  else if (v23)
  {
    v24 = objc_msgSend(v23, "isFinal");
  }
  else
  {
    v24 = 0;
  }
  LOBYTE(v27) = a8;
  -[_LTLanguageDetectorFeatureCombinationModel estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:](self, "estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:", v13, v14, v15, v16, v17, v24, v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageLocaleToIdentifier, 0);
  objc_storeStrong((id *)&self->_missingLanguageDetectorDefault, 0);
  objc_storeStrong((id *)&self->_missingFeatureValueDefault, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_modelOutput, 0);
  objc_storeStrong((id *)&self->_modelInput, 0);
  objc_storeStrong((id *)&self->_mlModel, 0);
}

- (void)initWithConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Missing necessary configuration values", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)initWithConfig:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, a3, (uint64_t)a3, "Unable to load CoreML model from path: %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_16();
}

- (void)initWithConfig:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5(&dword_2491B9000, a3, (uint64_t)a3, "CoreML model loaded: %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_16();
}

- (void)initWithConfig:(uint64_t)a1 .cold.4(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  float v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_12(a1, a2);
  objc_msgSend(v2, "floatValue");
  OUTLINED_FUNCTION_3_3(v4);
  OUTLINED_FUNCTION_5(&dword_2491B9000, v3, v5, "Setting default value for missing language detector result to %f", v6);

  OUTLINED_FUNCTION_9();
}

- (void)initWithConfig:(uint64_t)a1 .cold.5(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  float v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_12(a1, a2);
  objc_msgSend(v2, "floatValue");
  OUTLINED_FUNCTION_3_3(v4);
  OUTLINED_FUNCTION_5(&dword_2491B9000, v3, v5, "Setting default value for missing feature value to %f", v6);

  OUTLINED_FUNCTION_9();
}

- (void)initWithConfig:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Setting default value for input is matrix to NO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)getModelFeatures:canonicalPair:partialSpeechResultConfidences:finalSpeechResults:modelVersion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Discarded CoreML features, as all values were defaults", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)getModelFeatures:(NSObject *)a3 canonicalPair:partialSpeechResultConfidences:finalSpeechResults:modelVersion:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5(&dword_2491B9000, a3, (uint64_t)a3, "Created CoreML features: %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_16();
}

- (void)estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Unable to compile CoreML input features", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Was unable to extract CoreML prediction", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Was unable to extract posterior values from prediction results", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Unable to perform inference on CoreML model", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Unable to construct CoreML feature provider", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
