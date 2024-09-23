@implementation PowerUIMLRelevantDrainPredictor

- (PowerUIMLRelevantDrainPredictor)initWithDefaultsDomain:(id)a3 withContextStore:(id)a4 withTrialManager:(id)a5
{
  id v8;
  id v9;
  PowerUIMLRelevantDrainPredictor *v10;
  os_log_t v11;
  OS_os_log *log;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSMutableDictionary *modelCache;
  objc_super v20;

  v8 = a3;
  v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PowerUIMLRelevantDrainPredictor;
  v10 = -[PowerUIMLRelevantDrainPredictor init](&v20, sel_init);
  if (v10)
  {
    v11 = os_log_create("com.apple.powerui.smartcharging", "mlrelevantdrainpredictor");
    log = v10->_log;
    v10->_log = (OS_os_log *)v11;

    objc_storeStrong((id *)&v10->_defaultsDomain, a3);
    objc_storeStrong((id *)&v10->_trialManager, a5);
    objc_msgSend(&unk_24D44AFD0, "allKeys");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)kDimensions;
    kDimensions = v13;

    objc_msgSend(&unk_24D44AFF8, "allKeys");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)kMeasures;
    kMeasures = v15;

    v10->_loadModelLock._os_unfair_lock_opaque = 0;
    v10->_threshold = 0.192;
    v17 = objc_opt_new();
    modelCache = v10->_modelCache;
    v10->_modelCache = (NSMutableDictionary *)v17;

  }
  return v10;
}

- (id)loadModelFromBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *log;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_modelCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathForResource:ofType:", v4, CFSTR("mlmodelc"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURLWithPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v9;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Loading model from %@", buf, 0xCu);
    }
    v20 = 0;
    objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", v9, &v20);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v20;
    v12 = self->_log;
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        -[PowerUIMLRelevantDrainPredictor loadModelFromBundle:].cold.1((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, v12, OS_LOG_TYPE_DEFAULT, "model successfully loaded", buf, 2u);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_modelCache, "setObject:forKeyedSubscript:", v5, v4);

  }
  return v5;
}

- (id)relevantDrainPredictorModelForPhoneFirstStage80Limit
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  -[PowerUIMLRelevantDrainPredictor loadModelFromBundle:](self, "loadModelFromBundle:", CFSTR("deoc_iphone_80"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = CFSTR("model");
  v5[1] = CFSTR("threshold");
  v6[0] = v2;
  v6[1] = &unk_24D44AF80;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)relevantDrainPredictorModelForPhoneFirstStage95Limit
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  -[PowerUIMLRelevantDrainPredictor loadModelFromBundle:](self, "loadModelFromBundle:", CFSTR("deoc_iphone_95"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = CFSTR("model");
  v5[1] = CFSTR("threshold");
  v6[0] = v2;
  v6[1] = &unk_24D44AF90;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)relevantDrainPredictorModelForPhoneSecondStage80Limit
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  -[PowerUIMLRelevantDrainPredictor loadModelFromBundle:](self, "loadModelFromBundle:", CFSTR("deoc_two_stage_sequential_low_second"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = CFSTR("model");
  v5[1] = CFSTR("threshold");
  v6[0] = v2;
  v6[1] = &unk_24D44AFA0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)relevantDrainPredictorModelForPhoneSecondStage95Limit
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  -[PowerUIMLRelevantDrainPredictor loadModelFromBundle:](self, "loadModelFromBundle:", CFSTR("deoc_two_stage_sequential_high_second"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = CFSTR("model");
  v5[1] = CFSTR("threshold");
  v6[0] = v2;
  v6[1] = &unk_24D44AFB0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (MLModel)relevantDrainPredictorModel
{
  os_unfair_lock_s *p_loadModelLock;
  void *v4;
  void *v5;
  NSObject *log;
  PowerUITrialManager *trialManager;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  MLModel *v12;
  MLModel *relevantDrainPredictorModel;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  MLModel *v25;
  MLModel *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  MLModel *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  double threshold;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  double v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  p_loadModelLock = &self->_loadModelLock;
  os_unfair_lock_lock(&self->_loadModelLock);
  if (!self->_relevantDrainPredictorModel)
  {
    -[PowerUITrialManager factorForName:](self->_trialManager, "factorForName:", CFSTR("phoneDEoCModel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUITrialManager factorForName:](self->_trialManager, "factorForName:", CFSTR("thresholdForPhoneDEoCModel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v4;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Attempting to load model from Trial at path %@", buf, 0xCu);
    }
    trialManager = self->_trialManager;
    objc_msgSend(v4, "fileValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:](trialManager, "loadModelFromPath:deleteExistingFiles:", v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = self->_log;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v11, OS_LOG_TYPE_DEFAULT, "Trial DEoC model loading successful", buf, 2u);
      }
      v12 = v10;
      relevantDrainPredictorModel = self->_relevantDrainPredictorModel;
      self->_relevantDrainPredictorModel = v12;
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[PowerUIMLRelevantDrainPredictor relevantDrainPredictorModel].cold.2(v11, v14, v15, v16, v17, v18, v19, v20);
      v21 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pathForResource:ofType:", CFSTR("deoc_model_iphone"), CFSTR("mlmodelc"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "fileURLWithPath:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = 0;
      objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", v24, &v47);
      v25 = (MLModel *)objc_claimAutoreleasedReturnValue();
      relevantDrainPredictorModel = (MLModel *)v47;
      v26 = self->_relevantDrainPredictorModel;
      self->_relevantDrainPredictorModel = v25;

      v27 = self->_log;
      if (relevantDrainPredictorModel)
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[PowerUIMLRelevantDrainPredictor relevantDrainPredictorModel].cold.1((uint64_t)relevantDrainPredictorModel, v27, v28, v29, v30, v31, v32, v33);
      }
      else if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v27, OS_LOG_TYPE_DEFAULT, "DEoC model loaded from local file path", buf, 2u);
      }

    }
    objc_msgSend(v5, "doubleValue");
    if (v34 != 0.0)
    {
      v35 = v34;
      v36 = self->_log;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = (void *)MEMORY[0x24BDD16E0];
        v38 = v36;
        objc_msgSend(v37, "numberWithDouble:", v35);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v49 = v39;
        _os_log_impl(&dword_215A71000, v38, OS_LOG_TYPE_DEFAULT, "Loaded threshold from Trial: %@", buf, 0xCu);

      }
      self->_threshold = v35;
    }

  }
  os_unfair_lock_unlock(p_loadModelLock);
  v40 = self->_log;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v41 = self->_relevantDrainPredictorModel;
    v42 = v40;
    -[MLModel modelDescription](v41, "modelDescription");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "metadata");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    threshold = self->_threshold;
    *(_DWORD *)buf = 138412546;
    v49 = v44;
    v50 = 2048;
    v51 = threshold;
    _os_log_impl(&dword_215A71000, v42, OS_LOG_TYPE_DEFAULT, "Model loaded with metadata %@ \n and threshold %f", buf, 0x16u);

  }
  return self->_relevantDrainPredictorModel;
}

- (id)featuresForChargeSessionAtDate:(id)a3 withChargeStartSoC:(id)a4 withChargeAndDrainSessionHistory:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t k;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t m;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t ii;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  uint64_t n;
  id obj;
  void *v90;
  int v91;
  void *v92;
  id v93;
  id v94;
  _QWORD v95[5];
  _QWORD v96[5];
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD v101[4];
  id v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _QWORD v112[6];
  int v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _QWORD v118[6];
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t v126;
  _QWORD v127[6];
  int v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _QWORD v133[6];
  uint64_t v134;
  uint64_t *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t *v139;
  uint64_t v140;
  uint64_t v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  uint64_t v162;

  v162 = *MEMORY[0x24BDAC8D0];
  v87 = a3;
  v83 = a4;
  v8 = a5;
  v90 = (void *)objc_opt_new();
  v150 = 0u;
  v151 = 0u;
  v152 = 0u;
  v153 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v150, v161, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v151;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v151 != v10)
          objc_enumerationMutation(obj);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v150 + 1) + 8 * i), "mutableCopy");
        objc_msgSend(v90, "addObject:", v12);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v150, v161, 16);
    }
    while (v9);
  }

  if ((unint64_t)objc_msgSend(v90, "count") >= 3)
  {
    v148 = 0u;
    v149 = 0u;
    v146 = 0u;
    v147 = 0u;
    v93 = v90;
    v13 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v146, v160, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v147;
      do
      {
        v15 = 0;
        v16 = v93;
        do
        {
          if (*(_QWORD *)v147 != v14)
            objc_enumerationMutation(v16);
          v17 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * v15);
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("start"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[PowerUIPredictorHelper convertDateToSeconds:](PowerUIPredictorHelper, "convertDateToSeconds:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("charge_start_secs"));

          ++v15;
          v16 = v93;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v146, v160, 16);
      }
      while (v13);
    }

    v144 = 0u;
    v145 = 0u;
    v142 = 0u;
    v143 = 0u;
    v20 = (id)kMeasures;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v142, v159, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v143;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v143 != v22)
            objc_enumerationMutation(v20);
          v24 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * j);
          objc_msgSend(&unk_24D44B020, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[PowerUIPredictorHelper quantizeValuesInDataFrame:forColumn:withBinWidth:](PowerUIPredictorHelper, "quantizeValuesInDataFrame:forColumn:withBinWidth:", v93, v24, v25);

        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v142, v159, 16);
      }
      while (v21);
    }

    v94 = (id)objc_opt_new();
    +[PowerUIPredictorHelper convertDateToSeconds:](PowerUIPredictorHelper, "convertDateToSeconds:", v87);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    v28 = v27;

    objc_msgSend(&unk_24D44B048, "objectForKeyedSubscript:", CFSTR("charge_start_secs"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "integerValue");

    v91 = (int)v28;
    v31 = (int)v28 / v30;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setObject:forKeyedSubscript:", v32, CFSTR("curr_charge_start_secs_bin"));

    objc_msgSend(v83, "doubleValue");
    v34 = v33;
    objc_msgSend(&unk_24D44B070, "objectForKeyedSubscript:", CFSTR("charge_start_soc"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "integerValue");

    v85 = (int)v34 / v36;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setObject:forKeyedSubscript:", v37, CFSTR("curr_charge_start_soc_bin"));

    v138 = 0;
    v139 = &v138;
    v140 = 0x2020000000;
    v141 = 0;
    v134 = 0;
    v135 = &v134;
    v136 = 0x2020000000;
    v137 = 0;
    objc_msgSend(&unk_24D44B098, "objectForKeyedSubscript:", CFSTR("charge_start_secs"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "integerValue");
    v40 = (int)v31;
    v139[3] = v39 * (int)v31;

    objc_msgSend(&unk_24D44B0C0, "objectForKeyedSubscript:", CFSTR("charge_start_secs"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "integerValue");
    v135[3] = v40 + v40 * v42;

    v133[0] = MEMORY[0x24BDAC760];
    v133[1] = 3221225472;
    v133[2] = __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke;
    v133[3] = &unk_24D3FC4B8;
    v133[4] = &v138;
    v133[5] = &v134;
    -[PowerUIMLRelevantDrainPredictor addStatisticalSummaryFeaturesintoFeatureDictionary:forDataFrame:withFeatureNameSuffix:whereDimension:isFilteredWithHandler:](self, "addStatisticalSummaryFeaturesintoFeatureDictionary:forDataFrame:withFeatureNameSuffix:whereDimension:isFilteredWithHandler:", v94, v93, CFSTR("static_bin"), CFSTR("charge_start_secs"), v133);
    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    v43 = 0;
    v44 = objc_msgSend(&unk_24D44ABF0, "countByEnumeratingWithState:objects:count:", &v129, v158, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v130;
      do
      {
        v46 = 0;
        v47 = (void *)v43;
        do
        {
          if (*(_QWORD *)v130 != v45)
            objc_enumerationMutation(&unk_24D44ABF0);
          v48 = *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * v46);
          v127[0] = MEMORY[0x24BDAC760];
          v127[1] = 3221225472;
          v127[2] = __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_2;
          v127[3] = &unk_24D3FC4E0;
          v127[4] = self;
          v127[5] = v48;
          v128 = v91;
          v43 = MEMORY[0x2199EC2D0](v127);

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dynamic_bin_%@"), v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[PowerUIMLRelevantDrainPredictor addStatisticalSummaryFeaturesintoFeatureDictionary:forDataFrame:withFeatureNameSuffix:whereDimension:isFilteredWithHandler:](self, "addStatisticalSummaryFeaturesintoFeatureDictionary:forDataFrame:withFeatureNameSuffix:whereDimension:isFilteredWithHandler:", v94, v93, v49, CFSTR("charge_start_secs"), v43);

          ++v46;
          v47 = (void *)v43;
        }
        while (v44 != v46);
        v44 = objc_msgSend(&unk_24D44ABF0, "countByEnumeratingWithState:objects:count:", &v129, v158, 16);
      }
      while (v44);
    }
    v92 = (void *)v43;
    v123 = 0;
    v124 = &v123;
    v125 = 0x2020000000;
    v126 = 0;
    v119 = 0;
    v120 = &v119;
    v121 = 0x2020000000;
    v122 = 0;
    objc_msgSend(&unk_24D44B0E8, "objectForKeyedSubscript:", CFSTR("charge_start_soc"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "integerValue");
    v124[3] = v51 * (int)v85;

    objc_msgSend(&unk_24D44B110, "objectForKeyedSubscript:", CFSTR("charge_start_soc"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "integerValue");
    v120[3] = (int)v85 + (int)v85 * v53;

    v118[0] = MEMORY[0x24BDAC760];
    v118[1] = 3221225472;
    v118[2] = __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_3;
    v118[3] = &unk_24D3FC4B8;
    v118[4] = &v123;
    v118[5] = &v119;
    -[PowerUIMLRelevantDrainPredictor addStatisticalSummaryFeaturesintoFeatureDictionary:forDataFrame:withFeatureNameSuffix:whereDimension:isFilteredWithHandler:](self, "addStatisticalSummaryFeaturesintoFeatureDictionary:forDataFrame:withFeatureNameSuffix:whereDimension:isFilteredWithHandler:", v94, v93, CFSTR("static_bin"), CFSTR("charge_start_soc"), v118);
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v54 = objc_msgSend(&unk_24D44ABF0, "countByEnumeratingWithState:objects:count:", &v114, v157, 16);
    if (v54)
    {
      v55 = *(_QWORD *)v115;
      do
      {
        v56 = 0;
        v57 = v92;
        do
        {
          if (*(_QWORD *)v115 != v55)
            objc_enumerationMutation(&unk_24D44ABF0);
          v58 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * v56);
          v112[0] = MEMORY[0x24BDAC760];
          v112[1] = 3221225472;
          v112[2] = __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_4;
          v112[3] = &unk_24D3FC4E0;
          v112[4] = self;
          v112[5] = v58;
          v113 = (int)v34;
          v92 = (void *)MEMORY[0x2199EC2D0](v112);

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dynamic_bin_%@"), v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[PowerUIMLRelevantDrainPredictor addStatisticalSummaryFeaturesintoFeatureDictionary:forDataFrame:withFeatureNameSuffix:whereDimension:isFilteredWithHandler:](self, "addStatisticalSummaryFeaturesintoFeatureDictionary:forDataFrame:withFeatureNameSuffix:whereDimension:isFilteredWithHandler:", v94, v93, v59, CFSTR("charge_start_soc"), v92);

          ++v56;
          v57 = v92;
        }
        while (v54 != v56);
        v54 = objc_msgSend(&unk_24D44ABF0, "countByEnumeratingWithState:objects:count:", &v114, v157, 16);
      }
      while (v54);
    }
    for (k = 1; k != 4; ++k)
    {
      objc_msgSend(v93, "objectAtIndex:", objc_msgSend(v93, "count") - k);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      v62 = (id)kMeasures;
      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v108, v156, 16);
      if (v63)
      {
        v64 = *(_QWORD *)v109;
        do
        {
          for (m = 0; m != v63; ++m)
          {
            if (*(_QWORD *)v109 != v64)
              objc_enumerationMutation(v62);
            v66 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * m);
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("prev_%d_%@"), k, v66);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "objectForKeyedSubscript:", v66);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "setObject:forKeyedSubscript:", v68, v67);

          }
          v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v108, v156, 16);
        }
        while (v63);
      }

    }
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v69 = objc_msgSend(&unk_24D44AC08, "countByEnumeratingWithState:objects:count:", &v104, v155, 16);
    if (v69)
    {
      v70 = 0;
      v84 = *(_QWORD *)v105;
      v86 = v69;
      do
      {
        for (n = 0; n != v86; ++n)
        {
          if (*(_QWORD *)v105 != v84)
            objc_enumerationMutation(&unk_24D44AC08);
          v71 = objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * n), "integerValue");
          v101[0] = MEMORY[0x24BDAC760];
          v101[1] = 3221225472;
          v101[2] = __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_5;
          v101[3] = &unk_24D3FC508;
          v102 = v87;
          v103 = v71;
          +[PowerUIPredictorHelper filterDataFrame:forColumn:withFilterHandler:](PowerUIPredictorHelper, "filterDataFrame:forColumn:withFilterHandler:", v93, CFSTR("start"), v101);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = 0u;
          v100 = 0u;
          v97 = 0u;
          v98 = 0u;
          v73 = objc_msgSend(&unk_24D44AC20, "countByEnumeratingWithState:objects:count:", &v97, v154, 16);
          if (v73)
          {
            v74 = *(_QWORD *)v98;
            do
            {
              for (ii = 0; ii != v73; ++ii)
              {
                if (*(_QWORD *)v98 != v74)
                  objc_enumerationMutation(&unk_24D44AC20);
                v76 = objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * ii), "integerValue");
                v96[0] = MEMORY[0x24BDAC760];
                v96[1] = 3221225472;
                v96[2] = __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_6;
                v96[3] = &__block_descriptor_40_e8_B16__0_8l;
                v96[4] = v76;
                +[PowerUIPredictorHelper filterDataFrame:forColumn:withFilterHandler:](PowerUIPredictorHelper, "filterDataFrame:forColumn:withFilterHandler:", v72, CFSTR("drain_depth"), v96);
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("n_drain_below_%lu_%lddays"), v76, v71);
                v78 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v77, "count"));
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v94, "setObject:forKeyedSubscript:", v79, v78);

                v95[0] = MEMORY[0x24BDAC760];
                v95[1] = 3221225472;
                v95[2] = __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_7;
                v95[3] = &__block_descriptor_40_e8_B16__0_8l;
                v95[4] = v76;
                +[PowerUIPredictorHelper filterDataFrame:forColumn:withFilterHandler:](PowerUIPredictorHelper, "filterDataFrame:forColumn:withFilterHandler:", v72, CFSTR("drain_depth"), v95);
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("n_drain_above_%lu_%lddays"), v76, v71);
                v70 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v80, "count"));
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v94, "setObject:forKeyedSubscript:", v81, v70);

              }
              v73 = objc_msgSend(&unk_24D44AC20, "countByEnumeratingWithState:objects:count:", &v97, v154, 16);
            }
            while (v73);
          }

        }
        v86 = objc_msgSend(&unk_24D44AC08, "countByEnumeratingWithState:objects:count:", &v104, v155, 16);
      }
      while (v86);
    }
    else
    {
      v70 = 0;
    }

    _Block_object_dispose(&v119, 8);
    _Block_object_dispose(&v123, 8);

    _Block_object_dispose(&v134, 8);
    _Block_object_dispose(&v138, 8);
  }
  else
  {
    v94 = (id)MEMORY[0x24BDBD1B8];
  }

  return v94;
}

BOOL __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke(uint64_t a1, void *a2)
{
  double v3;

  v3 = (double)(int)objc_msgSend(a2, "intValue");
  return v3 >= (double)*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
      && v3 < (double)*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

uint64_t __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  double v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "doubleValue");
  return objc_msgSend(v3, "isStartSecondsValue:withinDynamicBinWindowOfLength:aroundCurrentStartSecondValue:", objc_msgSend(*(id *)(a1 + 40), "integerValue"), v4, (double)*(int *)(a1 + 48));
}

BOOL __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_3(uint64_t a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "doubleValue");
  return v3 >= (double)*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
      && v3 < (double)*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

uint64_t __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  double v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "doubleValue");
  return objc_msgSend(v3, "isStartSoCValue:withinDynamicBinWindowOfLength:aroundCurrentStartSoCValue:", objc_msgSend(*(id *)(a1 + 40), "integerValue"), v4, (double)*(int *)(a1 + 48));
}

BOOL __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_5(uint64_t a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  return -v3 <= (double)(86400 * *(_QWORD *)(a1 + 40));
}

BOOL __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "integerValue") < *(_QWORD *)(a1 + 32);
}

BOOL __118__PowerUIMLRelevantDrainPredictor_featuresForChargeSessionAtDate_withChargeStartSoC_withChargeAndDrainSessionHistory___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "integerValue") >= *(_QWORD *)(a1 + 32);
}

- (BOOL)isStartSecondsValue:(double)a3 withinDynamicBinWindowOfLength:(int)a4 aroundCurrentStartSecondValue:(double)a5
{
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  double v12;
  BOOL v13;
  BOOL v15;

  v7 = a4;
  objc_msgSend(&unk_24D44B138, "objectForKeyedSubscript:", CFSTR("charge_start_secs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (int)(a5 - (double)(objc_msgSend(v8, "integerValue") * v7));

  objc_msgSend(&unk_24D44B160, "objectForKeyedSubscript:", CFSTR("charge_start_secs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (int)((double)(objc_msgSend(v10, "integerValue") * v7) + a5);

  if (v9 < 0)
  {
    v15 = a3 >= 0.0;
    if ((double)v11 <= a3)
      v15 = 0;
    return (double)(int)(v9 + 86400 * (-v9 / 0x15180u)) <= a3 || v15;
  }
  else
  {
    v12 = (double)v9;
    if (v11 <= 86400)
    {
      return (double)v11 > a3 && v12 <= a3;
    }
    else
    {
      v13 = a3 < 86400.0;
      if (v12 > a3)
        v13 = 0;
      return (double)(v11 % 0x15180u) > a3 || v13;
    }
  }
}

- (BOOL)isStartSoCValue:(double)a3 withinDynamicBinWindowOfLength:(int)a4 aroundCurrentStartSoCValue:(double)a5
{
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  int v12;

  v7 = a4;
  objc_msgSend(&unk_24D44B188, "objectForKeyedSubscript:", CFSTR("charge_start_soc"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (int)(a5 - (double)(objc_msgSend(v8, "integerValue") * v7));

  objc_msgSend(&unk_24D44B1B0, "objectForKeyedSubscript:", CFSTR("charge_start_soc"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (int)((double)(objc_msgSend(v10, "integerValue") * v7) + a5);

  if (v11 >= 100)
    v12 = 100;
  else
    v12 = v11;
  return (double)v12 > a3 && (double)(v9 & ~(v9 >> 31)) <= a3;
}

- (void)addStatisticalSummaryFeaturesintoFeatureDictionary:(id)a3 forDataFrame:(id)a4 withFeatureNameSuffix:(id)a5 whereDimension:(id)a6 isFilteredWithHandler:(id)a7
{
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v34 = a3;
  v33 = a5;
  v11 = a6;
  +[PowerUIPredictorHelper filterDataFrame:forColumn:withFilterHandler:](PowerUIPredictorHelper, "filterDataFrame:forColumn:withFilterHandler:", a4, v11, a7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)kMeasures;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v31)
  {
    v13 = 0;
    v30 = *(_QWORD *)v40;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v40 != v30)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v14);
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v16 = objc_msgSend(&unk_24D44ABD8, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        v32 = v14;
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v36;
          do
          {
            v19 = 0;
            v20 = v13;
            do
            {
              if (*(_QWORD *)v36 != v18)
                objc_enumerationMutation(&unk_24D44ABD8);
              objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v19), "doubleValue");
              v22 = v21;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_p_%d_%d%d_at_%@_curr_%@"), v15, (int)v21, ((int)(v21 * 10.0) % 10), ((int)(v21 * 100.0) % 10), v11, v33);
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              +[PowerUIPredictorHelper percentile:forColumn:inDataFrame:](PowerUIPredictorHelper, "percentile:forColumn:inDataFrame:", v15, v12, v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setObject:forKeyedSubscript:", v23, v13);

              ++v19;
              v20 = v13;
            }
            while (v17 != v19);
            v17 = objc_msgSend(&unk_24D44ABD8, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          }
          while (v17);
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_count_at_%@_curr_%@"), v15, v11, v33);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        +[PowerUIPredictorHelper countForColumn:inDataFrame:](PowerUIPredictorHelper, "countForColumn:inDataFrame:", v15, v12);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v25, v24);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_mean_at_%@_curr_%@"), v15, v11, v33);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        +[PowerUIPredictorHelper meanForColumn:inDataFrame:](PowerUIPredictorHelper, "meanForColumn:inDataFrame:", v15, v12);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v27, v26);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_var_at_%@_curr_%@"), v15, v11, v33);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        +[PowerUIPredictorHelper varianceForColumn:inDataFrame:](PowerUIPredictorHelper, "varianceForColumn:inDataFrame:", v15, v12);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v28, v13);

        v14 = v32 + 1;
      }
      while (v32 + 1 != v31);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v31);

  }
}

- (id)predictedRelevantDrainAfterChargeSessionAtDate:(id)a3 withChargeStartSoC:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  +[PowerUISmartChargeUtilities drainSessionsInfoBetweenRelevantChargesBefore:withMinimumDuration:](PowerUISmartChargeUtilities, "drainSessionsInfoBetweenRelevantChargesBefore:withMinimumDuration:", v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUIMLRelevantDrainPredictor featuresForChargeSessionAtDate:withChargeStartSoC:withChargeAndDrainSessionHistory:](self, "featuresForChargeSessionAtDate:withChargeStartSoC:withChargeAndDrainSessionHistory:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PowerUIMLRelevantDrainPredictor predictedRelevantDrainwithFeatures:](self, "predictedRelevantDrainwithFeatures:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)predictedRelevantDrainWithFeatures:(id)a3 forSchemes:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PowerUIMLRelevantDrainPredictor *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PowerUIMLRelevantDrainPredictor *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  PowerUIMLRelevantDrainPredictor *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  NSObject *log;
  NSObject *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  id v47;
  void *v48;
  PowerUIMLRelevantDrainPredictor *v49;
  id obj;
  uint64_t v51;
  id v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v52 = (id)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v7;
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v53)
  {
    v51 = *(_QWORD *)v55;
    v47 = v6;
    v49 = self;
LABEL_3:
    v8 = 0;
    while (2)
    {
      if (*(_QWORD *)v55 != v51)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v8);
      v10 = (void *)objc_opt_new();
      switch(objc_msgSend(v9, "integerValue"))
      {
        case 1:
          -[PowerUIMLRelevantDrainPredictor relevantDrainPredictorModelForPhoneFirstStage80Limit](self, "relevantDrainPredictorModelForPhoneFirstStage80Limit");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("model"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("threshold"));
          v13 = self;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[PowerUIMLRelevantDrainPredictor predictedRelevantDrainwithFeatures:forModel:withThreshold:](v13, "predictedRelevantDrainwithFeatures:forModel:withThreshold:", v6, v12, v14);
          v15 = (id)objc_claimAutoreleasedReturnValue();

          v16 = v15;
          v17 = 80;
          goto LABEL_9;
        case 2:
          -[PowerUIMLRelevantDrainPredictor relevantDrainPredictorModelForPhoneFirstStage95Limit](self, "relevantDrainPredictorModelForPhoneFirstStage95Limit");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("model"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("threshold"));
          v13 = self;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[PowerUIMLRelevantDrainPredictor predictedRelevantDrainwithFeatures:forModel:withThreshold:](v13, "predictedRelevantDrainwithFeatures:forModel:withThreshold:", v6, v18, v19);
          v15 = (id)objc_claimAutoreleasedReturnValue();

          v16 = v15;
          v17 = 95;
LABEL_9:
          objc_msgSend(v16, "setSuggestedLimitForSignificantDrain:", v17, v47);
          goto LABEL_20;
        case 3:
          -[PowerUIMLRelevantDrainPredictor relevantDrainPredictorModelForPhoneFirstStage80Limit](self, "relevantDrainPredictorModelForPhoneFirstStage80Limit");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("model"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v20;
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("threshold"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[PowerUIMLRelevantDrainPredictor predictedRelevantDrainwithFeatures:forModel:withThreshold:](self, "predictedRelevantDrainwithFeatures:forModel:withThreshold:", v6, v21, v22);
          v23 = self;
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "setSuggestedLimitForSignificantDrain:", 80);
          if (objc_msgSend(v24, "significantDrainAhead"))
          {
            -[PowerUIMLRelevantDrainPredictor relevantDrainPredictorModelForPhoneSecondStage95Limit](v23, "relevantDrainPredictorModelForPhoneSecondStage95Limit");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("model"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("threshold"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[PowerUIMLRelevantDrainPredictor predictedRelevantDrainwithFeatures:forModel:withThreshold:](v23, "predictedRelevantDrainwithFeatures:forModel:withThreshold:", v47, v26, v27);
            v15 = (id)objc_claimAutoreleasedReturnValue();

            v6 = v47;
            objc_msgSend(v15, "setSuggestedLimitForSignificantDrain:", 95);
            objc_msgSend(v15, "setPrevStageResult:", v24);

            v10 = v25;
          }
          else
          {
            v15 = v24;
          }

          v13 = v49;
          goto LABEL_20;
        case 4:
          -[PowerUIMLRelevantDrainPredictor relevantDrainPredictorModelForPhoneFirstStage95Limit](self, "relevantDrainPredictorModelForPhoneFirstStage95Limit");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("model"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v28;
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("threshold"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v6;
          -[PowerUIMLRelevantDrainPredictor predictedRelevantDrainwithFeatures:forModel:withThreshold:](self, "predictedRelevantDrainwithFeatures:forModel:withThreshold:", v6, v29, v30);
          v32 = self;
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v33, "setSuggestedLimitForSignificantDrain:", 95);
          if ((objc_msgSend(v33, "significantDrainAhead") & 1) != 0)
          {
            v15 = v33;
            v6 = v31;
          }
          else
          {
            -[PowerUIMLRelevantDrainPredictor relevantDrainPredictorModelForPhoneSecondStage80Limit](v32, "relevantDrainPredictorModelForPhoneSecondStage80Limit");
            v34 = v31;
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("model"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("threshold"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[PowerUIMLRelevantDrainPredictor predictedRelevantDrainwithFeatures:forModel:withThreshold:](v32, "predictedRelevantDrainwithFeatures:forModel:withThreshold:", v34, v36, v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v38, "setSuggestedLimitForSignificantDrain:", 80);
            v39 = objc_msgSend(v38, "significantDrainAhead");
            v40 = v33;
            if ((v39 & 1) == 0)
            {
              objc_msgSend(v38, "setPrevStageResult:", v33);
              v40 = v38;
            }
            v15 = v40;

            v10 = v35;
            v6 = v47;
          }

          v13 = v49;
          v11 = v48;
LABEL_20:

          objc_msgSend(v15, "setScheme:", objc_msgSend(v9, "integerValue"));
          log = v13->_log;
          self = v13;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            v42 = log;
            objc_msgSend(v15, "predictionSchemeString");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v59 = v43;
            _os_log_impl(&dword_215A71000, v42, OS_LOG_TYPE_DEFAULT, "Predicted for scheme: %@", buf, 0xCu);

          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "integerValue", v47));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setObject:forKeyedSubscript:", v15, v44);

          if (v53 != ++v8)
            continue;
          v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
          if (!v53)
            goto LABEL_28;
          goto LABEL_3;
        default:
          v45 = self->_log;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            -[PowerUIMLRelevantDrainPredictor predictedRelevantDrainWithFeatures:forSchemes:].cold.1(v45);

          goto LABEL_28;
      }
    }
  }
LABEL_28:

  return v52;
}

- (id)predictedRelevantDrainwithFeatures:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PowerUIMLRelevantDrainPredictor predictedRelevantDrainWithFeatures:forSchemes:](self, "predictedRelevantDrainWithFeatures:forSchemes:", a3, &unk_24D44AC38);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)predictedRelevantDrainwithFeatures:(id)a3 forModel:(id)a4 withThreshold:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *log;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v10, "doubleValue");
  objc_msgSend(v11, "setThreshold:");
  if (v8)
  {
    objc_msgSend(v8, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFF80]), "initWithDictionary:error:", v8, 0);
      v28 = 0;
      objc_msgSend(v9, "predictionFromFeatures:error:", v14, &v28);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v28;
      if (v16)
      {
        v17 = v16;
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v17;
          _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Error in prediction %@", buf, 0xCu);
        }
        v19 = v15;
      }
      else
      {
        objc_msgSend(v15, "featureValueForName:", CFSTR("classProbability"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "dictionaryValue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "objectForKeyedSubscript:", &unk_24D4436C0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "doubleValue");
        v23 = v22;

        objc_msgSend(v11, "setConfidence:", v23);
        objc_msgSend(v10, "doubleValue");
        objc_msgSend(v11, "setThreshold:");
        objc_msgSend(v11, "confidence");
        v25 = v24;
        objc_msgSend(v11, "threshold");
        objc_msgSend(v11, "setSignificantDrainAhead:", v25 >= v26);
        v17 = v15;
      }

    }
  }

  return v11;
}

- (id)analyticsEventFromFeatures:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v20 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v18 = objc_msgSend(&unk_24D44AC08, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  v4 = 0;
  v5 = 0;
  if (v18)
  {
    v17 = *(_QWORD *)v29;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(&unk_24D44AC08);
        v19 = v6;
        v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v6);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v23 = objc_msgSend(&unk_24D44AC20, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v23)
        {
          v21 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v25 != v21)
                objc_enumerationMutation(&unk_24D44AC20);
              v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              v9 = objc_msgSend(v22, "integerValue");
              v10 = objc_msgSend(v8, "integerValue");
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("n_drain_below_%lu_%lddays"), v10, v9);
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ndays_below_%lu_%lddays"), v10, v9);
              v12 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v20, "objectForKeyedSubscript:", v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v12);

              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("n_drain_above_%lu_%lddays"), v10, v9);
              v5 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ndays_above_%lu_%lddays"), v10, v9);
              v4 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v20, "objectForKeyedSubscript:", v5);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v4);

            }
            v23 = objc_msgSend(&unk_24D44AC20, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v23);
        }
        v6 = v19 + 1;
      }
      while (v19 + 1 != v18);
      v18 = objc_msgSend(&unk_24D44AC08, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v18);
  }
  v15 = v3;

  return v15;
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_threshold = a3;
}

- (NSString)defaultsDomain
{
  return self->_defaultsDomain;
}

- (void)setDefaultsDomain:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsDomain, a3);
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (PowerUITrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
  objc_storeStrong((id *)&self->_trialManager, a3);
}

- (os_unfair_lock_s)loadModelLock
{
  return self->_loadModelLock;
}

- (void)setLoadModelLock:(os_unfair_lock_s)a3
{
  self->_loadModelLock = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSMutableDictionary)modelCache
{
  return self->_modelCache;
}

- (void)setModelCache:(id)a3
{
  objc_storeStrong((id *)&self->_modelCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelCache, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_storeStrong((id *)&self->_relevantDrainPredictorModel, 0);
}

- (void)loadModelFromBundle:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_215A71000, a2, a3, "Error loading model %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)relevantDrainPredictorModel
{
  OUTLINED_FUNCTION_6(&dword_215A71000, a1, a3, "Trial DEoC model loading failed, trying regular filepath at %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)predictedRelevantDrainWithFeatures:(os_log_t)log forSchemes:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_215A71000, log, OS_LOG_TYPE_ERROR, "Invalid scheme", v1, 2u);
}

@end
