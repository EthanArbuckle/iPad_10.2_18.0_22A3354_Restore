@implementation PHACurareShadowEvaluationRunner

- (PHACurareShadowEvaluationRunner)initWithRecipeOptions:(id)a3
{
  id v5;
  PHACurareShadowEvaluationRunner *v6;
  PHACurareShadowEvaluationRunner *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHACurareShadowEvaluationRunner;
  v6 = -[PHACurareShadowEvaluationRunner init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_options, a3);

  return v7;
}

- (BOOL)runWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  id v22;
  NSObject *v23;
  id v25;
  __int128 v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  +[PHACurareShadowEvaluationRunner runnerLog](PHACurareShadowEvaluationRunner, "runnerLog");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAC16000, v5, OS_LOG_TYPE_INFO, "Begin runWithError", buf, 2u);
  }

  -[PHACurareShadowEvaluationRunner getDatasetWithError:](self, "getDatasetWithError:", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (*a3 || !v6)
  {
    +[PHACurareShadowEvaluationRunner runnerLog](PHACurareShadowEvaluationRunner, "runnerLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v22 = *a3;
      *(_DWORD *)buf = 138412290;
      v33 = v22;
      _os_log_error_impl(&dword_1CAC16000, v8, OS_LOG_TYPE_ERROR, "getDatasetWithError failed with error: %@", buf, 0xCu);
    }
LABEL_24:
    v21 = 0;
  }
  else
  {
    v8 = objc_opt_new();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[PHACurareShadowEvaluationRunner options](self, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modelInfoArray");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v10;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v11)
    {
      v13 = v11;
      v14 = *(_QWORD *)v29;
      *(_QWORD *)&v12 = 138412290;
      v26 = v12;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v16, "valueForKeyPath:", CFSTR("modelPath"), v26);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[PHACurareShadowEvaluationRunner runnerLog](PHACurareShadowEvaluationRunner, "runnerLog");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v26;
            v33 = v17;
            _os_log_impl(&dword_1CAC16000, v18, OS_LOG_TYPE_INFO, "Model path at runWithError: %@", buf, 0xCu);
          }

          -[PHACurareShadowEvaluationRunner evaluateModel:datasetDictionary:error:](self, "evaluateModel:datasetDictionary:error:", v16, v7, a3);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v19 || *a3)
          {
            +[PHACurareShadowEvaluationRunner runnerLog](PHACurareShadowEvaluationRunner, "runnerLog");
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              v25 = *a3;
              *(_DWORD *)buf = 138412546;
              v33 = v17;
              v34 = 2112;
              v35 = v25;
              _os_log_error_impl(&dword_1CAC16000, v23, OS_LOG_TYPE_ERROR, "evaluateModel failed on positive dataset for model %@, failed with error: %@", buf, 0x16u);
            }

            goto LABEL_24;
          }
          -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v19, v17);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v13)
          continue;
        break;
      }
    }

    +[PHACurareShadowEvaluationRunner runnerLog](PHACurareShadowEvaluationRunner, "runnerLog");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v20, OS_LOG_TYPE_INFO, "Call generateCAEventForResults", buf, 2u);
    }

    -[PHACurareShadowEvaluationRunner generateCAEventForResults:](self, "generateCAEventForResults:", v8);
    v21 = 1;
  }

  return v21;
}

- (void)generateCAEventForResults:(id)a3
{
  NSObject *v4;
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
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  int v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  id obj;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  const __CFString *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _QWORD v57[23];
  _QWORD v58[26];

  v58[23] = *MEMORY[0x1E0C80C00];
  v39 = a3;
  +[PHACurareShadowEvaluationRunner runnerLog](PHACurareShadowEvaluationRunner, "runnerLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAC16000, v4, OS_LOG_TYPE_INFO, "Begin generateCAEventForResults", buf, 2u);
  }

  v57[0] = CFSTR("model1_name");
  v57[1] = CFSTR("model1_positive_numberOfCorrectSamples");
  v58[0] = CFSTR("nil");
  v58[1] = CFSTR("nil");
  v57[2] = CFSTR("model1_positive_lossMetric");
  v57[3] = CFSTR("model1_positive_prediction_mean");
  v58[2] = CFSTR("nil");
  v58[3] = CFSTR("nil");
  v57[4] = CFSTR("model1_positive_prediction_stddev");
  v57[5] = CFSTR("model1_negative_numberOfCorrectSamples");
  v58[4] = CFSTR("nil");
  v58[5] = CFSTR("nil");
  v57[6] = CFSTR("model1_negative_lossMetric");
  v57[7] = CFSTR("model1_negative_prediction_mean");
  v58[6] = CFSTR("nil");
  v58[7] = CFSTR("nil");
  v57[8] = CFSTR("model1_negative_prediction_stddev");
  v57[9] = CFSTR("model2_name");
  v58[8] = CFSTR("nil");
  v58[9] = CFSTR("nil");
  v57[10] = CFSTR("model2_positive_numberOfCorrectSamples");
  v57[11] = CFSTR("model2_positive_lossMetric");
  v58[10] = CFSTR("nil");
  v58[11] = CFSTR("nil");
  v57[12] = CFSTR("model2_positive_prediction_mean");
  v57[13] = CFSTR("model2_positive_prediction_stddev");
  v58[12] = CFSTR("nil");
  v58[13] = CFSTR("nil");
  v57[14] = CFSTR("model2_negative_numberOfCorrectSamples");
  v57[15] = CFSTR("model2_negative_lossMetric");
  v58[14] = CFSTR("nil");
  v58[15] = CFSTR("nil");
  v57[16] = CFSTR("model2_negative_prediction_mean");
  v57[17] = CFSTR("model2_negative_prediction_stddev");
  v58[16] = CFSTR("nil");
  v58[17] = CFSTR("nil");
  v57[18] = CFSTR("positive_numberOfSamples");
  v57[19] = CFSTR("negative_numberOfSamples");
  v58[18] = CFSTR("nil");
  v58[19] = CFSTR("nil");
  v57[20] = CFSTR("trial_deplyomentID");
  -[PHACurareShadowEvaluationRunner options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trialDeploymentID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v58[20] = v6;
  v57[21] = CFSTR("trial_experimentID");
  -[PHACurareShadowEvaluationRunner options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trialExperimentID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v58[21] = v8;
  v57[22] = CFSTR("trial_treatmentID");
  -[PHACurareShadowEvaluationRunner options](self, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trialTreatmentID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v58[22] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v39, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v14;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v40)
  {
    v38 = *(_QWORD *)v48;
    v15 = 1;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v48 != v38)
          objc_enumerationMutation(obj);
        v41 = v16;
        objc_msgSend(v39, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v16));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v42 = v17;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v44;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v44 != v20)
                objc_enumerationMutation(v42);
              v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
              v23 = objc_msgSend(v22, "isPositiveData");
              v24 = CFSTR("negative");
              if (v23)
                v24 = CFSTR("positive");
              v25 = v24;
              objc_msgSend(v22, "modelName");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("model%d_name"), v15);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v26, v27);

              objc_msgSend(v22, "numberOfCorrectSamples");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("model%d_%@_numberOfCorrectSamples"), v15, v25);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v28, v29);

              objc_msgSend(v22, "meanPredictionValue");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("model%d_%@_prediction_mean"), v15, v25);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v30, v31);

              objc_msgSend(v22, "stddevPredictionValue");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("model%d_%@_prediction_stddev"), v15, v25);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v32, v33);

              objc_msgSend(v22, "numberOfTotalSamples");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_numberOfSamples"), v25);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v12, "setObject:forKeyedSubscript:", v34, v35);
            }
            v19 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
          }
          while (v19);
        }
        v15 = (v15 + 1);

        v16 = v41 + 1;
      }
      while (v41 + 1 != v40);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v40);
  }

  +[PHACurareShadowEvaluationRunner runnerLog](PHACurareShadowEvaluationRunner, "runnerLog");
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v52 = CFSTR("com.apple.com.apple.PhotoAnalysis.PhotoAnalysisLighthousePlugin.modelMetricsV6");
    v53 = 2114;
    v54 = v12;
    _os_log_impl(&dword_1CAC16000, v36, OS_LOG_TYPE_DEFAULT, "Sending event to %{public}@, payload: %{public}@", buf, 0x16u);
  }

  AnalyticsSendEvent();
}

- (id)evaluateModel:(id)a3 datasetDictionary:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  PHACurareShadowEvaluationEvaluator *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PHACurareShadowEvaluationEvaluator *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  void *v32;
  id v35;
  uint8_t buf[4];
  NSObject *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = [PHACurareShadowEvaluationEvaluator alloc];
  -[PHACurareShadowEvaluationRunner options](self, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "modelInputName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHACurareShadowEvaluationRunner options](self, "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "modelOutputName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHACurareShadowEvaluationRunner options](self, "options");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lossName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PHACurareShadowEvaluationEvaluator initWithModelInputName:modelOutputName:lossName:](v9, "initWithModelInputName:modelOutputName:lossName:", v11, v13, v15);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("modelPath"));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17 && -[NSObject length](v17, "length"))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("labelIndex"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "intValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("labelOperatingPoint"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "floatValue");
    v23 = v22;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kPositive"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kNegative"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    LODWORD(v26) = v23;
    -[PHACurareShadowEvaluationEvaluator evaluateModelAtPath:labelIndex:labelOperatingPoint:positiveEvaluationData:negativeEvaluationData:error:](v16, "evaluateModelAtPath:labelIndex:labelOperatingPoint:positiveEvaluationData:negativeEvaluationData:error:", v18, v20, v24, v25, &v35, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v35;

    +[PHACurareShadowEvaluationRunner runnerLog](PHACurareShadowEvaluationRunner, "runnerLog");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (!v27 || v28)
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v28;
        _os_log_error_impl(&dword_1CAC16000, v30, OS_LOG_TYPE_ERROR, "Failed to generate results for dataset with error: %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to evaluate model: %@ on dataset"), v18);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHACurareShadowEvaluationUtilities generateError:errorCode:errorDomain:message:underlyingError:](PHACurareShadowEvaluationUtilities, "generateError:errorCode:errorDomain:message:underlyingError:", a5, 6, CFSTR("com.apple.PhotoAnalysis.PHACurareShadowEvaluationRunner"), v32, v28);

      v31 = 0;
    }
    else
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v18;
        _os_log_impl(&dword_1CAC16000, v30, OS_LOG_TYPE_INFO, "Generated result for model: %@", buf, 0xCu);
      }

      v31 = v27;
    }

  }
  else
  {
    +[PHACurareShadowEvaluationRunner runnerLog](PHACurareShadowEvaluationRunner, "runnerLog");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAC16000, v28, OS_LOG_TYPE_ERROR, "modelPath is empty", buf, 2u);
    }
    v31 = 0;
  }

  return v31;
}

- (id)getDatasetWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[PHACurareShadowEvaluationRunner options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHACurareShadowEvaluationDataset prepareDatasetForEvaluationTaskWithRecipeOptions:error:](PHACurareShadowEvaluationDataset, "prepareDatasetForEvaluationTaskWithRecipeOptions:error:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    +[PHACurareShadowEvaluationRunner runnerLog](PHACurareShadowEvaluationRunner, "runnerLog");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = 0;
      _os_log_error_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_ERROR, "Failed to create allData with error: %@", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to generate dataset for all data"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHACurareShadowEvaluationUtilities generateError:errorCode:errorDomain:message:underlyingError:](PHACurareShadowEvaluationUtilities, "generateError:errorCode:errorDomain:message:underlyingError:", a3, 5, CFSTR("com.apple.PhotoAnalysis.PHACurareShadowEvaluationRunner"), v8, 0);

  }
  return v5;
}

- (PHACurareShadowEvaluationRecipeOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

+ (id)runnerLog
{
  if (runnerLog_onceToken != -1)
    dispatch_once(&runnerLog_onceToken, &__block_literal_global_922);
  return (id)runnerLog_runnerLog;
}

void __44__PHACurareShadowEvaluationRunner_runnerLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PhotoAnalysis.PhotoAnalysisLighthousePlugin", "Runner");
  v1 = (void *)runnerLog_runnerLog;
  runnerLog_runnerLog = (uint64_t)v0;

}

@end
