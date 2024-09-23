@implementation SLUEStatisticsModule

- (SLUEStatisticsModule)initWithConfig:(id)a3 error:(id *)a4
{
  id v6;
  SLUEStatisticsModule *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *outputNodeName;
  NSString **p_outputNodeName;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  MLModel *uesModel;
  MLModel *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  SLUEStatisticsModule *v37;
  void *v38;
  uint64_t v39;
  NSDictionary *inputSpecs;
  void *v41;
  uint64_t v42;
  NSDictionary *outputSpecs;
  id *v45;
  void *v46;
  id v47;
  objc_super v48;
  const __CFString *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  void *v56;
  const __CFString *v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v48.receiver = self;
  v48.super_class = (Class)SLUEStatisticsModule;
  v7 = -[SLUEStatisticsModule init](&v48, sel_init);
  if (!v7)
    goto LABEL_30;
  if (SLLogInitIfNeeded_once != -1)
    dispatch_once(&SLLogInitIfNeeded_once, &__block_literal_global);
  objc_msgSend(MEMORY[0x24BE28430], "decodeJsonFromFile:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing config for User Engagement Stats model %@"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD1540];
    v57 = CFSTR("reason");
    v58[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sl"), 118, v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v17 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "-[SLUEStatisticsModule initWithConfig:error:]";
      v55 = 2112;
      v56 = v13;
      _os_log_error_impl(&dword_213B50000, v17, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      if (v16)
        goto LABEL_21;
    }
    else if (v16)
    {
LABEL_21:
      if (a4)
      {
        v16 = objc_retainAutorelease(v16);
        *a4 = v16;
      }

      goto LABEL_24;
    }

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("outputNodeName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("outputNodeName"));
    v10 = objc_claimAutoreleasedReturnValue();
    p_outputNodeName = &v7->_outputNodeName;
    outputNodeName = v7->_outputNodeName;
    v7->_outputNodeName = (NSString *)v10;
  }
  else
  {
    p_outputNodeName = &v7->_outputNodeName;
    outputNodeName = v7->_outputNodeName;
    v7->_outputNodeName = 0;
  }

  if (!*p_outputNodeName)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing output name for EUS %@"), v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)MEMORY[0x24BDD1540];
    v51 = CFSTR("reason");
    v52 = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sl"), 118, v35);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v36 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "-[SLUEStatisticsModule initWithConfig:error:]";
      v55 = 2112;
      v56 = v13;
      _os_log_error_impl(&dword_213B50000, v36, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      if (v16)
        goto LABEL_21;
    }
    else if (v16)
    {
      goto LABEL_21;
    }

  }
  objc_msgSend(v6, "stringByDeletingLastPathComponent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("modelFile"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByAppendingPathComponent:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(MEMORY[0x24BDBFFD8]);
  objc_msgSend(v22, "setComputeUnits:", 0);
  v47 = 0;
  objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:configuration:error:", v21, v22, &v47);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v47;
  uesModel = v7->_uesModel;
  v7->_uesModel = (MLModel *)v23;

  v26 = v7->_uesModel;
  if (v26 && !v24)
    goto LABEL_29;
  v45 = a4;
  v46 = v18;
  v27 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v24, "localizedDescription");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringWithFormat:", CFSTR("Unable to create model with error %@"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x24BDD1540];
  v49 = CFSTR("reason");
  v50 = v29;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sl"), 118, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v54 = "-[SLUEStatisticsModule initWithConfig:error:]";
    v55 = 2114;
    v56 = v29;
    _os_log_error_impl(&dword_213B50000, v33, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    if (v32)
      goto LABEL_16;
    goto LABEL_28;
  }
  if (!v32)
  {
LABEL_28:

    v26 = v7->_uesModel;
    v18 = v46;
LABEL_29:
    -[MLModel modelDescription](v26, "modelDescription");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "inputDescriptionsByName");
    v39 = objc_claimAutoreleasedReturnValue();
    inputSpecs = v7->_inputSpecs;
    v7->_inputSpecs = (NSDictionary *)v39;

    -[MLModel modelDescription](v7->_uesModel, "modelDescription");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "outputDescriptionsByName");
    v42 = objc_claimAutoreleasedReturnValue();
    outputSpecs = v7->_outputSpecs;
    v7->_outputSpecs = (NSDictionary *)v42;

LABEL_30:
    v37 = v7;
    goto LABEL_31;
  }
LABEL_16:
  if (v45)
    *v45 = objc_retainAutorelease(v32);

LABEL_24:
  v37 = 0;
LABEL_31:

  return v37;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[SLUEStatisticsModule dealloc]";
    _os_log_impl(&dword_213B50000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)SLUEStatisticsModule;
  -[SLUEStatisticsModule dealloc](&v4, sel_dealloc);
}

- (id)getEncodedValue:(id)a3
{
  id v3;
  SLUEStatisticsCohortTypeEncoding *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;

  v3 = a3;
  v4 = -[SLUEStatisticsCohortTypeEncoding initWithDefaults]([SLUEStatisticsCohortTypeEncoding alloc], "initWithDefaults");
  -[SLUEStatisticsCohortTypeEncoding rawValueEncoded](v4, "rawValueEncoded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SLUEStatisticsCohortTypeEncoding rawValueEncoded](v4, "rawValueEncoded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[SLUEStatisticsCohortTypeEncoding rawValueEncoded](v4, "rawValueEncoded");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)processInputFeatures:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  NSObject *v36;
  float v37;
  void *v38;
  void *v39;
  double v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  NSObject *v49;
  double v50;
  void *v51;
  id v52;
  void *v53;
  MLModel *uesModel;
  double v55;
  id v56;
  double v57;
  double v58;
  NSObject *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  NSObject *v63;
  void *v64;
  char v65;
  void *v66;
  void *v67;
  float v68;
  float v69;
  NSObject *v70;
  SLUEStatisticsModuleResult *v71;
  double v72;
  SLUEStatisticsModuleResult *v73;
  void *v74;
  double v75;
  NSObject *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  NSObject *v86;
  uint64_t v87;
  NSObject *v88;
  double v89;
  double v90;
  void *v91;
  uint64_t v92;
  void *v93;
  double v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  uint64_t v99;
  id v100;
  id v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint8_t buf[4];
  const char *v107;
  __int16 v108;
  double v109;
  __int16 v110;
  uint64_t v111;
  const __CFString *v112;
  void *v113;
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cohortType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLUEStatisticsModule getEncodedValue:](self, "getEncodedValue:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    v95 = v7;
    objc_msgSend(v7, "floatValue");
    objc_msgSend(v8, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "requestCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "intendedCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "unintendedCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v12);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "buttonPressCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "voiceTriggerCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v14);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "voiceTriggerIntendedCount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v15);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "voiceTriggerUnintendedCount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v16);

    v17 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "intendedRatio");
    objc_msgSend(v17, "numberWithFloat:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v18);

    v19 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "voiceTriggerRequestRatio");
    objc_msgSend(v19, "numberWithFloat:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v20);

    v21 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "voiceTriggerIntendedRatio");
    objc_msgSend(v21, "numberWithFloat:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v22);

    v23 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "buttonPressRequestRatio");
    objc_msgSend(v23, "numberWithFloat:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v24);

    v25 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "buttonPressIntendedRatio");
    objc_msgSend(v25, "numberWithFloat:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v26);

    v27 = (void *)MEMORY[0x24BDD16E0];
    v97 = v4;
    objc_msgSend(v4, "sdsdRetryCount");
    objc_msgSend(v27, "numberWithFloat:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v28);

    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v96 = v5;
    v29 = v5;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v103;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v103 != v32)
            objc_enumerationMutation(v29);
          v34 = (void *)SLLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
          {
            v35 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
            v36 = v34;
            objc_msgSend(v35, "floatValue");
            *(_DWORD *)buf = 136315394;
            v107 = "-[SLUEStatisticsModule processInputFeatures:]";
            v108 = 2048;
            v109 = v37;
            _os_log_impl(&dword_213B50000, v36, OS_LOG_TYPE_INFO, "%s num from inputFeaturesArr is %f", buf, 0x16u);

          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
      }
      while (v31);
    }

    -[NSDictionary objectForKeyedSubscript:](self->_inputSpecs, "objectForKeyedSubscript:", CFSTR("input_1"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "multiArrayConstraint");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "shape");
    v40 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

    v41 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v107 = "-[SLUEStatisticsModule processInputFeatures:]";
      v108 = 2112;
      v109 = v40;
      _os_log_impl(&dword_213B50000, v41, OS_LOG_TYPE_INFO, "%s Input shape: %@", buf, 0x16u);
    }
    v42 = objc_msgSend(v29, "count");
    objc_msgSend(*(id *)&v40, "objectAtIndexedSubscript:", 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "unsignedIntValue");

    if (v42 == v44)
    {
      v94 = v40;
      v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFFF0]), "initWithScalars:shape:dataType:", v29, &unk_24D0CB3D0, 65568);
      if (objc_msgSend(v45, "count") >= 1)
      {
        v46 = 0;
        do
        {
          v47 = objc_retainAutorelease(v45);
          v48 = objc_msgSend(v47, "dataPointer");
          v49 = SLLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
          {
            v50 = *(float *)(v48 + 4 * v46);
            *(_DWORD *)buf = 136315394;
            v107 = "-[SLUEStatisticsModule processInputFeatures:]";
            v108 = 2048;
            v109 = v50;
            _os_log_impl(&dword_213B50000, v49, OS_LOG_TYPE_INFO, "%s num from processedInputFeatures %f", buf, 0x16u);
          }
          ++v46;
        }
        while (objc_msgSend(v47, "count") > v46);
      }
      if (v45)
      {
        v112 = CFSTR("input_1");
        v113 = v45;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1);
        v101 = 0;
        *(double *)&v99 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFF80]), "initWithDictionary:error:", v99, &v101);
        v52 = v101;
        v53 = v52;
        v4 = v97;
        if (!v51 || v52)
        {
          v77 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v52, "localizedDescription");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "stringWithFormat:", CFSTR("Failed to create feature with error %@"), v78);
          v57 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

          v79 = SLLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v107 = "-[SLUEStatisticsModule processInputFeatures:]";
            v108 = 2114;
            v109 = v57;
            _os_log_error_impl(&dword_213B50000, v79, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
          }
          v73 = 0;
          v40 = v94;
          v75 = *(double *)&v99;
        }
        else
        {
          uesModel = self->_uesModel;
          v100 = 0;
          v93 = v51;
          -[MLModel predictionFromFeatures:error:](uesModel, "predictionFromFeatures:error:", v51, &v100);
          v55 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          v56 = v100;
          v53 = v56;
          if (v55 == 0.0 || v56)
          {
            v57 = v55;
            v80 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v56, "localizedDescription");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "stringWithFormat:", CFSTR("Failed to get output with error %@"), v81);
            *(double *)&v92 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

            v82 = SLLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v107 = "-[SLUEStatisticsModule processInputFeatures:]";
              v108 = 2114;
              v83 = (void *)v92;
              v109 = *(double *)&v92;
              _os_log_error_impl(&dword_213B50000, v82, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
              v73 = 0;
              v40 = v94;
              v75 = *(double *)&v99;
            }
            else
            {
              v73 = 0;
              v40 = v94;
              v75 = *(double *)&v99;
              v83 = (void *)v92;
            }
          }
          else
          {
            v57 = v55;
            objc_msgSend(*(id *)&v55, "featureValueForName:", self->_outputNodeName);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "multiArrayValue");
            v58 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            v59 = SLLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v107 = "-[SLUEStatisticsModule processInputFeatures:]";
              v108 = 2112;
              v109 = v58;
              _os_log_impl(&dword_213B50000, v59, OS_LOG_TYPE_DEFAULT, "%s output: %@", buf, 0x16u);
            }
            -[NSDictionary objectForKeyedSubscript:](self->_outputSpecs, "objectForKeyedSubscript:", self->_outputNodeName);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "multiArrayConstraint");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "shape");
            *(double *)&v62 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

            v63 = SLLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v107 = "-[SLUEStatisticsModule processInputFeatures:]";
              v108 = 2112;
              v109 = *(double *)&v62;
              _os_log_impl(&dword_213B50000, v63, OS_LOG_TYPE_INFO, "%s Output shape: %@", buf, 0x16u);
            }
            objc_msgSend(*(id *)&v58, "shape");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = objc_msgSend(v64, "isEqualToArray:", v62);

            v40 = v94;
            v90 = v58;
            v98 = (void *)v62;
            if ((v65 & 1) != 0)
            {
              objc_msgSend(*(id *)&v58, "convert1dMLMultiArrayToNSArray");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "firstObject");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "floatValue");
              v69 = v68;

              v70 = SLLogContextFacilityCoreSpeech;
              if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v107 = "-[SLUEStatisticsModule processInputFeatures:]";
                v108 = 2048;
                v109 = v69;
                _os_log_impl(&dword_213B50000, v70, OS_LOG_TYPE_INFO, "%s Score is %f", buf, 0x16u);
              }
              v71 = [SLUEStatisticsModuleResult alloc];
              *(float *)&v72 = v69;
              v73 = -[SLUEStatisticsModuleResult initWithScore:](v71, "initWithScore:", v72);

            }
            else
            {
              v84 = (void *)SLLogContextFacilityCoreSpeech;
              if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
              {
                v88 = v84;
                objc_msgSend(*(id *)&v58, "shape");
                v89 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                *(_DWORD *)buf = 136315650;
                v107 = "-[SLUEStatisticsModule processInputFeatures:]";
                v108 = 2112;
                v109 = v89;
                v110 = 2112;
                v111 = v62;
                _os_log_error_impl(&dword_213B50000, v88, OS_LOG_TYPE_ERROR, "%s Output shape %@ does not match expected shape %@", buf, 0x20u);

              }
              v73 = 0;
            }
            v83 = v91;
            v51 = v93;
            v75 = *(double *)&v99;

          }
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create Input features multiarray"));
        v75 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        v76 = SLLogContextFacilityCoreSpeech;
        v4 = v97;
        if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v107 = "-[SLUEStatisticsModule processInputFeatures:]";
          v108 = 2114;
          v109 = v75;
          _os_log_error_impl(&dword_213B50000, v76, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
        }
        v53 = 0;
        v73 = 0;
        v40 = v94;
      }

    }
    else
    {
      v74 = (void *)SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v86 = v74;
        *(double *)&v87 = COERCE_DOUBLE(objc_msgSend(v29, "count"));
        *(_DWORD *)buf = 136315394;
        v107 = "-[SLUEStatisticsModule processInputFeatures:]";
        v108 = 2048;
        v109 = *(double *)&v87;
        _os_log_error_impl(&dword_213B50000, v86, OS_LOG_TYPE_ERROR, "%s inputFeaturesArr shape %lu does not match input shape", buf, 0x16u);

      }
      v53 = 0;
      v73 = 0;
    }
    v7 = v95;
    v5 = v96;

  }
  else
  {
    v73 = 0;
  }

  return v73;
}

- (NSDictionary)inputSpecs
{
  return self->_inputSpecs;
}

- (void)setInputSpecs:(id)a3
{
  objc_storeStrong((id *)&self->_inputSpecs, a3);
}

- (NSDictionary)outputSpecs
{
  return self->_outputSpecs;
}

- (void)setOutputSpecs:(id)a3
{
  objc_storeStrong((id *)&self->_outputSpecs, a3);
}

- (MLModel)uesModel
{
  return self->_uesModel;
}

- (void)setUesModel:(id)a3
{
  objc_storeStrong((id *)&self->_uesModel, a3);
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
  objc_storeStrong((id *)&self->_assetVersion, a3);
}

- (NSString)outputNodeName
{
  return self->_outputNodeName;
}

- (void)setOutputNodeName:(id)a3
{
  objc_storeStrong((id *)&self->_outputNodeName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputNodeName, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_uesModel, 0);
  objc_storeStrong((id *)&self->_outputSpecs, 0);
  objc_storeStrong((id *)&self->_inputSpecs, 0);
}

@end
