@implementation CoreMLTrainer

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.iCloudSubscriptionOptimizerCore.PFLPlugin", "CoreMLTrainer");
    v3 = (void *)sLog;
    sLog = (uint64_t)v2;

  }
}

- (id)processModelURL:(id)a3
{
  id v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "hasDirectoryPath");
  v5 = sLog;
  v6 = os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      v24 = v3;
      _os_log_impl(&dword_22D863000, v5, OS_LOG_TYPE_INFO, "modelURL %@ is a directory.", buf, 0xCu);
    }
    v7 = v3;
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      v24 = v3;
      _os_log_impl(&dword_22D863000, v5, OS_LOG_TYPE_INFO, "modelURL %@ is a file URL.", buf, 0xCu);
    }
    objc_msgSend(v3, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("model.mil,metadata.json,coremldata.bin,analytics/coremldata.bin,weights/weight.bin"), "componentsSeparatedByString:", CFSTR(","));
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v8, "hasSuffix:", v13, (_QWORD)v18))
          {
            objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - objc_msgSend(v13, "length"));
            v14 = objc_claimAutoreleasedReturnValue();

            v8 = (void *)v14;
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v15 = (id)sLog;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v16;
      _os_log_impl(&dword_22D863000, v15, OS_LOG_TYPE_INFO, "modelURL is %@.", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)evaluateWithModelURL:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  float v14;
  id v15;
  unsigned int i;
  unint64_t v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  int v27;
  int k;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  double v41;
  double v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  BOOL v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t n;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  EvaluationDataSourceEspressoWrapper *v88;
  void *v89;
  void *v90;
  uint64_t m;
  void *v92;
  void *v93;
  id v94;
  id v95;
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  id v101;
  id v102;
  id v103;
  const __CFString *v104;
  void *v105;
  _QWORD v106[7];
  _QWORD v107[7];
  void *v108;
  uint8_t buf[4];
  _BYTE v110[14];
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v87 = a4;
  v80 = objc_alloc_init(MEMORY[0x24BDBFFD8]);
  objc_msgSend(v80, "setComputeUnits:", 0);
  -[CoreMLTrainer processModelURL:](self, "processModelURL:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v103 = 0;
  v77 = (void *)v9;
  objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:configuration:error:", v9, v80, &v103);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v103;
  v79 = (void *)v10;
  if (v10)
  {
    v12 = objc_alloc(MEMORY[0x24BDC0020]);
    objc_msgSend(v79, "program");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "learningRate");
    v102 = v11;
    v83 = (void *)objc_msgSend(v12, "initWithProgram:learningRate:error:", v13, &v102, v14);
    v15 = v102;

    if (v83)
    {
      v86 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
      v88 = -[EvaluationDataSourceEspressoWrapper initWithEvaluatorDataSource:]([EvaluationDataSourceEspressoWrapper alloc], "initWithEvaluatorDataSource:", v87);
      for (i = 0; ; ++i)
      {
        v17 = objc_msgSend(v87, "recordCount");
        if (v17 / (int)objc_msgSend(v87, "batchSize") <= i)
          break;
        -[EvaluationDataSourceEspressoWrapper featureProviderAtIndex:](v88, "featureProviderAtIndex:", i);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "addObject:", v18);

      }
      v101 = v15;
      v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFF60]), "initWithFeatureProviderArray:", v86);
      objc_msgSend(v83, "evaluateUsingTestData:error:");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v15;

      objc_msgSend(v76, "loss");
      v21 = v20;
      v22 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)v110 = v21;
        _os_log_impl(&dword_22D863000, v22, OS_LOG_TYPE_INFO, "loss before training is: %f", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      objc_msgSend(v87, "layersToTrain");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v97, v111, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v98;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v98 != v25)
              objc_enumerationMutation(v23);
            objc_msgSend(v92, "addObject:", *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * j));
          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v97, v111, 16);
        }
        while (v24);
      }

      v27 = objc_msgSend(v87, "numLocalIterations");
      if (v27 < 1)
      {
        v35 = -1.0;
      }
      else
      {
        for (k = 0; k != v27; ++k)
        {
          objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v92);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = v19;
          objc_msgSend(v83, "trainUsingTrainingData:evaluationMetricNames:error:", v82, v29, &v96);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v96;

          v32 = (id)sLog;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v30, "loss");
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v110 = k;
            *(_WORD *)&v110[4] = 2048;
            *(_QWORD *)&v110[6] = v33;
            _os_log_impl(&dword_22D863000, v32, OS_LOG_TYPE_INFO, "fit: iter=%d loss=%f", buf, 0x12u);
          }

          objc_msgSend(v30, "loss");
          v35 = v34;
          v36 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v30, "loss");
          objc_msgSend(v36, "numberWithDouble:");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "addObject:", v37);

          v19 = v31;
        }
        v19 = v31;
      }
      v95 = v19;
      objc_msgSend(v83, "evaluateUsingTestData:error:", v82, &v95);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v95;

      objc_msgSend(v75, "loss");
      v42 = v41;
      v43 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)v110 = v42;
        _os_log_impl(&dword_22D863000, v43, OS_LOG_TYPE_INFO, "loss after training is: %f", buf, 0xCu);
      }
      v73 = (void *)objc_msgSend(v83, "copyCurrentTrainingDelta");
      objc_msgSend(v73, "flattenedModelUpdate");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D863000, v44, OS_LOG_TYPE_INFO, "Started model evaluation", buf, 2u);
      }
      objc_msgSend(v87, "modelOutputName");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "modelInputSchemaLabelName");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)MEMORY[0x24BDBCF20];
      v108 = v85;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v108, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setWithArray:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = v40;
      objc_msgSend(v83, "evaluateUsingTestData:evaluationMetricNames:error:", v82, v47, &v94);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v94;

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      for (m = 0; ; ++m)
      {
        objc_msgSend(v89, "evaluationMetrics");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "count") > m;

        if (!v49)
          break;
        objc_msgSend(v89, "evaluationMetrics");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "featuresAtIndex:", m);
        v90 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v90, "featureValueForName:", v85);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "multiArrayValue");
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        -[EvaluationDataSourceEspressoWrapper featureProviderAtIndex:](v88, "featureProviderAtIndex:", m);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "objectForKeyedSubscript:", v84);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "multiArrayValue");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        for (n = 0; ; ++n)
        {
          v57 = objc_msgSend(v52, "count");
          v58 = objc_msgSend(v55, "count");
          v59 = v57 >= v58 ? v58 : v57;
          if (v59 <= n)
            break;
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v52, "objectAtIndexedSubscript:", n);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "doubleValue");
          objc_msgSend(v61, "numberWithDouble:");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "setValue:forKey:", v63, CFSTR("probability"));

          v64 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v55, "objectAtIndexedSubscript:", n);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "doubleValue");
          objc_msgSend(v64, "numberWithBool:", v66 > 0.0);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "setValue:forKey:", v67, CFSTR("label"));

          objc_msgSend(v93, "addObject:", v60);
        }

      }
      v106[0] = CFSTR("LossBeforeTraining");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v21);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v107[0] = v68;
      v106[1] = CFSTR("LossAfterTraining");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v42);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v107[1] = v69;
      v106[2] = CFSTR("TrainingLoss");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v35);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v107[2] = v70;
      v107[3] = v92;
      v106[3] = CFSTR("UpdatedModelIndices");
      v106[4] = CFSTR("ModelDeltas");
      v107[4] = v74;
      v106[5] = CFSTR("TrainingLosses");
      v104 = CFSTR("losses");
      v105 = v81;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v106[6] = CFSTR("OtherEvaluationMetric");
      v107[5] = v71;
      v107[6] = v93;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v107, v106, 7);
      v15 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v39 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D863000, v39, OS_LOG_TYPE_INFO, "Failed to load MLProgramTrainer.", buf, 2u);
      }
      if (v15)
      {
        v78 = objc_retainAutorelease(v15);
        v15 = 0;
        *a5 = v78;
      }
      else
      {
        v78 = 0;
      }
    }

  }
  else
  {
    v38 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v110 = v77;
      _os_log_impl(&dword_22D863000, v38, OS_LOG_TYPE_INFO, "Failed to load model from %@", buf, 0xCu);
    }
    if (v11)
    {
      v78 = objc_retainAutorelease(v11);
      v15 = 0;
      *a5 = v78;
    }
    else
    {
      v78 = 0;
      v15 = 0;
    }
  }

  return v15;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelURL, 0);
}

@end
