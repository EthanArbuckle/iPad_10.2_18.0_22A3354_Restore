@implementation CRMultiModelTextRecognizer

- (CRMultiModelTextRecognizer)initWithConfigurationOptions:(id)a3
{
  id v5;
  CRMultiModelTextRecognizer *v6;
  CRMultiModelTextRecognizer *v7;
  void *v8;
  unint64_t v9;
  CRTextOrientationCorrector *v10;
  CRTextOrientationCorrector *orientationCorrector;
  CRPerformanceStatistics *v12;
  CRPerformanceStatistics *orientationStats;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRMultiModelTextRecognizer;
  v6 = -[CRMultiModelTextRecognizer init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configurationOptions, a3);
    v7->_keepAllResourcesLoadedWhenNotInUse = 0;
    objc_msgSend(v5, "objectForKey:", CFSTR("CRImageReaderRevisionKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    if (v9 >= 3)
    {
      v10 = -[CRTextOrientationCorrector initWithOptions:error:]([CRTextOrientationCorrector alloc], "initWithOptions:error:", v5, 0);
      orientationCorrector = v7->_orientationCorrector;
      v7->_orientationCorrector = v10;

      v12 = -[CRPerformanceStatistics initWithName:measureRecentPeak:]([CRPerformanceStatistics alloc], "initWithName:measureRecentPeak:", CFSTR("Orientation Correction"), 0);
      orientationStats = v7->_orientationStats;
      v7->_orientationStats = v12;

    }
  }

  return v7;
}

+ (id)sortedSupportedLanguages:(id)a3 byPreferredLanguages:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(v5, "mutableCopy");
  +[CRRecognizerConfiguration languageSetFromInputLanguages:supportedLanguages:](CRRecognizerConfiguration, "languageSetFromInputLanguages:supportedLanguages:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v15 = objc_msgSend(v7, "indexOfObject:", v14);
        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v7, "removeObjectAtIndex:", v15);
          objc_msgSend(v7, "insertObject:atIndex:", v14, v11++);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

+ (id)recognizerForRevision:(unint64_t)a3 imageReaderOptions:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  CRSingleLocaleTextRecognizer *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a4;
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v7, "objectForKey:", CFSTR("CRImageReaderRevisionKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  if (v10 != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("CRImageReaderRevisionKey"));

  }
  if (a3 - 1 < 2)
    goto LABEL_4;
  if (a3 != 3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Unexpected Recognizer Revision %ld"), a3);
    v12 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CRImageReaderDisableScriptDetection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if ((v14 & 1) != 0)
  {
LABEL_4:
    v12 = -[CRSingleLocaleTextRecognizer initWithImageReaderOptions:error:]([CRSingleLocaleTextRecognizer alloc], "initWithImageReaderOptions:error:", v8, a5);
  }
  else
  {
    +[CRRecognizerConfiguration supportedLanguagesForVersion:](CRNeuralRecognizerConfiguration, "supportedLanguagesForVersion:", 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_opt_class();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CRImageReaderLanguageKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sortedSupportedLanguages:byPreferredLanguages:", v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("CRImageReaderLanguageKey"));

    v12 = -[CRMultiLocaleTextRecognizer initWithImageReaderOptions:error:]([CRMultiLocaleTextRecognizer alloc], "initWithImageReaderOptions:error:", v8, a5);
  }
LABEL_9:

  return v12;
}

- (void)cancel
{
  CRMultiModelTextRecognizer *obj;

  obj = self;
  objc_sync_enter(obj);
  -[CRMultiModelTextRecognizer setShouldCancel:](obj, "setShouldCancel:", 1);
  objc_sync_exit(obj);

}

- (BOOL)preheatWithError:(id *)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v20;
  id obj;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[CRMultiModelTextRecognizer configuration](self, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRNeuralTextRecognizer localeToModelClassMappingForRevision:](CRNeuralTextRecognizer, "localeToModelClassMappingForRevision:", objc_msgSend(v20, "revision"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v3, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v5)
  {
    v6 = v5;
    v23 = 0;
    v7 = *(_QWORD *)v26;
    v8 = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v11 = objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        if (objc_msgSend(v4, "containsObject:", v11))
        {
          CROSLogForCategory(3);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v10;
            _os_log_impl(&dword_1D4FB8000, v12, OS_LOG_TYPE_DEFAULT, "Skipping preheat for %@, model already loaded", buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v4, "addObject:", v11);
          CROSLogForCategory(3);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v10;
            _os_log_impl(&dword_1D4FB8000, v13, OS_LOG_TYPE_DEFAULT, "Preheating %@ model", buf, 0xCu);
          }

          -[CRMultiModelTextRecognizer recognizerForIdentifier:](self, "recognizerForIdentifier:", v10);
          v12 = objc_claimAutoreleasedReturnValue();
          v24 = 0;
          v14 = -[NSObject preheatWithError:](v12, "preheatWithError:", &v24);
          v15 = v24;
          v8 &= v14;
          CROSLogForCategory(3);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v30 = v10;
            v31 = 1024;
            v32 = v8;
            v33 = 2112;
            v34 = v15;
            _os_log_impl(&dword_1D4FB8000, v16, OS_LOG_TYPE_DEFAULT, "Preheating %@ model complete (success=%d | err=%@)", buf, 0x1Cu);
          }

          if (v15)
          {
            v17 = v15;

            v23 = v17;
          }

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v6);
  }
  else
  {
    v23 = 0;
    LOBYTE(v8) = 1;
  }

  if (a3)
    *a3 = objc_retainAutorelease(v23);

  return v8 & 1;
}

- (id)thresholdsForTextRegion:(id)a3 withLocale:(id)a4
{
  id v6;
  void *v7;
  CRNeuralRecognizerConfiguration *v8;
  void *v9;
  CRNeuralRecognizerConfiguration *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[CRMultiModelTextRecognizer identifierForTextRegion:](self, "identifierForTextRegion:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [CRNeuralRecognizerConfiguration alloc];
  -[CRMultiModelTextRecognizer configurationOptions](self, "configurationOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v10 = -[CRNeuralRecognizerConfiguration initWithLocale:imageReaderOptions:error:](v8, "initWithLocale:imageReaderOptions:error:", v7, v9, &v26);
  v11 = v26;

  if (v10)
  {
    v25 = v11;
    v12 = -[CRNeuralRecognizerConfiguration decodeWithLM](v10, "decodeWithLM");
    confidenceThresholds();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[CRMultiModelTextRecognizer configuration](self, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "revision"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = v20;
    }
    else
    {
      -[CRNeuralRecognizerConfiguration confidenceThresholds](v10, "confidenceThresholds");
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = v21;

    v11 = v25;
  }
  else
  {
    CROSLogForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v7;
      _os_log_impl(&dword_1D4FB8000, v22, OS_LOG_TYPE_FAULT, "Unable to create neural recognizer configuration for ID %@", buf, 0xCu);
    }

    +[CRConfidenceThresholds defaultConfidenceThresholds](CRConfidenceThresholds, "defaultConfidenceThresholds");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (id)titleParametersForTextRegion:(id)a3
{
  void *v4;
  CRNeuralRecognizerConfiguration *v5;
  void *v6;
  CRNeuralRecognizerConfiguration *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CRMultiModelTextRecognizer identifierForTextRegion:](self, "identifierForTextRegion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [CRNeuralRecognizerConfiguration alloc];
  -[CRMultiModelTextRecognizer configurationOptions](self, "configurationOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v7 = -[CRNeuralRecognizerConfiguration initWithLocale:imageReaderOptions:error:](v5, "initWithLocale:imageReaderOptions:error:", v4, v6, &v13);
  v8 = v13;

  if (v7)
  {
    -[CRNeuralRecognizerConfiguration titleParameters](v7, "titleParameters");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CROSLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_1D4FB8000, v10, OS_LOG_TYPE_FAULT, "Unable to create neural recognizer configuration for ID %@", buf, 0xCu);
    }

    +[CRTitleParameters defaultTitleParameters](CRTitleParameters, "defaultTitleParameters");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v9;

  return v11;
}

- (id)recognizeInImage:(id)a3 lineRegions:(id)a4 progressHandler:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  qos_class_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v28;
  dispatch_group_t v29;
  dispatch_queue_t v30;
  dispatch_semaphore_t v31;
  void *v32;
  _QWORD v33[4];
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  CRMultiModelTextRecognizer *v37;
  id v38;
  id v39;
  id v40;
  uint64_t *v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD v45[4];
  id v46;
  CRMultiModelTextRecognizer *v47;
  id v48;
  _QWORD *v49;
  uint64_t *v50;
  _QWORD v51[5];
  id v52;
  uint64_t v53;
  id *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _QWORD v59[4];
  int v60;
  _QWORD v61[4];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (-[CRMultiModelTextRecognizer _isCancelled](self, "_isCancelled"))
  {
    if (a6)
    {
      +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -3);
      v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }
  else if (objc_msgSend(v11, "count"))
  {
    v62 = 0;
    v63 = &v62;
    v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__18;
    v66 = __Block_byref_object_dispose__18;
    v67 = 0;
    v61[0] = 0;
    v61[1] = v61;
    v61[2] = 0x2020000000;
    v61[3] = 0;
    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x2810000000;
    v59[3] = &unk_1D5168E96;
    v60 = 0;
    v31 = dispatch_semaphore_create(2);
    v14 = qos_class_self();
    dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], v14, 0);
    v28 = objc_claimAutoreleasedReturnValue();
    v30 = dispatch_queue_create("com.apple.CoreRecognition.multiModelRecognizeText", v28);
    v29 = dispatch_group_create();
    v53 = 0;
    v54 = (id *)&v53;
    v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__18;
    v57 = __Block_byref_object_dispose__18;
    v58 = 0;
    v32 = (void *)objc_opt_new();
    -[CRMultiModelTextRecognizer configuration](self, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "skipRecognition");

    if ((v16 & 1) == 0)
    {
      -[CRMultiModelTextRecognizer configuration](self, "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "imageByConvertingToColorSpace:", objc_msgSend(v17, "colorSpace"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x3032000000;
      v51[3] = __Block_byref_object_copy__18;
      v51[4] = __Block_byref_object_dispose__18;
      v52 = 0;
      -[CRMultiModelTextRecognizer orientationCorrector](self, "orientationCorrector");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = MEMORY[0x1E0C809B0];
      if (v19)
      {
        -[CRMultiModelTextRecognizer orientationStats](self, "orientationStats");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = v20;
        v45[1] = 3221225472;
        v45[2] = __81__CRMultiModelTextRecognizer_recognizeInImage_lineRegions_progressHandler_error___block_invoke;
        v45[3] = &unk_1E98DB870;
        v46 = v11;
        v47 = self;
        v49 = v51;
        v48 = v18;
        v50 = &v53;
        objc_msgSend(v21, "measureBlock:", v45);

      }
      if (!v54[5])
        objc_storeStrong(v54 + 5, a4);
      -[CRMultiModelTextRecognizer textFeatureSplitter](self, "textFeatureSplitter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v54[5];
      v33[0] = v20;
      v33[1] = 3221225472;
      v33[2] = __81__CRMultiModelTextRecognizer_recognizeInImage_lineRegions_progressHandler_error___block_invoke_22;
      v33[3] = &unk_1E98DB908;
      v24 = v29;
      v34 = v24;
      v35 = v30;
      v36 = v31;
      v37 = self;
      v41 = &v62;
      v10 = v18;
      v38 = v10;
      v42 = v51;
      v40 = v12;
      v43 = v59;
      v44 = v61;
      v39 = v32;
      objc_msgSend(v22, "enumerateLineRegions:usingBlock:", v23, v33);

      dispatch_group_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
      if (a6)
      {
        v25 = (void *)v63[5];
        if (v25)
          *a6 = objc_retainAutorelease(v25);
      }

      _Block_object_dispose(v51, 8);
    }
    if (v54[5])
    {
      -[CRMultiModelTextRecognizer textFeatureSplitter](self, "textFeatureSplitter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "pruneAndFilterLineRegions:recognitionResult:", v54[5], v32);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }

    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(v59, 8);
    _Block_object_dispose(v61, 8);
    _Block_object_dispose(&v62, 8);

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

void __81__CRMultiModelTextRecognizer_recognizeInImage_lineRegions_progressHandler_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  double y;
  double x;
  double height;
  double width;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  CRMetalPolygonRectifier *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  void *v55;
  id obj;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  void *v64;
  _BYTE v65[128];
  uint64_t v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v66 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sortedArrayUsingComparator:", &__block_literal_global_37);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
  if (!v2)
    goto LABEL_19;
  v3 = v2;
  v4 = 0;
  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = *(_QWORD *)v60;
  do
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v60 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
      objc_msgSend(v11, "polygon");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(v11, "polygon");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v14, "pointCount") <= 3)
        {

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "configuration");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "rectifyPolygons");

          if (v16)
          {
            objc_msgSend(v11, "polygon");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "denormalizedPolyline");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "boundingRect");
            goto LABEL_13;
          }
        }
      }
      objc_msgSend(v11, "boundingQuad");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "baselineAngle");
      v25 = fabs(v24);
      objc_msgSend(*(id *)(a1 + 40), "configuration");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "angleThresholdForRotatedCrops");
      v28 = v27;

      if (v25 <= v28)
        continue;
      objc_msgSend(v11, "boundingQuad");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "denormalizedQuad");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "boundingBox");
LABEL_13:
      v69.origin.x = v19;
      v69.origin.y = v20;
      v69.size.width = v21;
      v69.size.height = v22;
      v67.origin.x = x;
      v67.origin.y = y;
      v67.size.width = width;
      v67.size.height = height;
      v68 = CGRectUnion(v67, v69);
      x = v68.origin.x;
      y = v68.origin.y;
      width = v68.size.width;
      height = v68.size.height;

      v4 = 1;
    }
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
  }
  while (v3);
  if ((v4 & 1) != 0 && _os_feature_enabled_impl())
  {
    v29 = [CRMetalPolygonRectifier alloc];
    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "metalDevice");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[CRMetalPolygonRectifier initWithDevice:sourceImage:regionOfInterest:](v29, "initWithDevice:sourceImage:regionOfInterest:", v31, *(_QWORD *)(a1 + 48), x, y, width, height);
    v33 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v34 = *(void **)(v33 + 40);
    *(_QWORD *)(v33 + 40) = v32;

  }
LABEL_19:
  objc_msgSend(*(id *)(a1 + 40), "orientationCorrector");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = *(_QWORD *)(a1 + 48);
  v37 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v58 = 0;
  objc_msgSend(v35, "regionsByCorrectingOrientationOnSortedRegions:correctAllRegions:image:rectifier:error:", obj, 0, v36, v37, &v58);
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = v58;
  v40 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v41 = *(void **)(v40 + 40);
  *(_QWORD *)(v40 + 40) = v38;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    CROSLogForCategory(0);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v39, "description");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v64 = v43;
      _os_log_impl(&dword_1D4FB8000, v42, OS_LOG_TYPE_ERROR, "Encountered error during orientation correction. %@", buf, 0xCu);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "scriptDetectionDisabled");

  if ((v45 & 1) != 0 || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v51 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "orientationCorrector");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v48 = *(_QWORD *)(a1 + 48);
    v49 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v57 = 0;
    objc_msgSend(v46, "regionsByCorrectingSequenceScriptOnSortedRegions:correctAllRegions:image:rectifier:error:", v47, 0, v48, v49, &v57);
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = v57;
    v52 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v53 = *(void **)(v52 + 40);
    *(_QWORD *)(v52 + 40) = v50;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      CROSLogForCategory(0);
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v51, "description");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v64 = v55;
        _os_log_impl(&dword_1D4FB8000, v54, OS_LOG_TYPE_ERROR, "Encountered error during sequence script correction. %@", buf, 0xCu);

      }
    }
  }

}

uint64_t __81__CRMultiModelTextRecognizer_recognizeInImage_lineRegions_progressHandler_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "aspectRatio");
  v6 = v5;
  objc_msgSend(v4, "aspectRatio");
  v8 = v7;

  if (v6 > v8)
    return 1;
  else
    return -1;
}

void __81__CRMultiModelTextRecognizer_recognizeInImage_lineRegions_progressHandler_error___block_invoke_22(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  double v28;

  v7 = a2;
  v8 = a3;
  v9 = *(NSObject **)(a1 + 32);
  v10 = *(NSObject **)(a1 + 40);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__CRMultiModelTextRecognizer_recognizeInImage_lineRegions_progressHandler_error___block_invoke_2_23;
  v17[3] = &unk_1E98DB8E0;
  v11 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v13 = *(void **)(a1 + 64);
  v18 = v11;
  v19 = v12;
  v14 = *(_QWORD *)(a1 + 88);
  v20 = v7;
  v25 = v14;
  v21 = v13;
  v22 = v8;
  v26 = *(_QWORD *)(a1 + 96);
  v24 = *(id *)(a1 + 80);
  v27 = *(_OWORD *)(a1 + 104);
  v28 = a4;
  v23 = *(id *)(a1 + 72);
  v15 = v8;
  v16 = v7;
  dispatch_group_async(v9, v10, v17);

}

void __81__CRMultiModelTextRecognizer_recognizeInImage_lineRegions_progressHandler_error___block_invoke_2_23(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD v19[4];

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(*(id *)(a1 + 40), "recognizerForIdentifier:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    v3 = -5;
    goto LABEL_5;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "_isCancelled"))
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    v3 = -3;
LABEL_5:
    +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    goto LABEL_10;
  }
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__CRMultiModelTextRecognizer_recognizeInImage_lineRegions_progressHandler_error___block_invoke_3;
  v14[3] = &unk_1E98DB898;
  v15 = *(id *)(a1 + 80);
  v16 = *(_OWORD *)(a1 + 104);
  v18 = *(_QWORD *)(a1 + 120);
  v17 = v19;
  v13 = 0;
  objc_msgSend(v2, "recognizeInImage:lineRegions:rectifier:progressHandler:error:", v7, v8, v9, v14, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v13;
  v12 = v13;
  objc_msgSend(*(id *)(a1 + 72), "addContentsOfRecognitionResult:shouldOverwriteExistingHandler:", v10, &__block_literal_global_26_2);
  if (v12 || !v10)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v11);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

  _Block_object_dispose(v19, 8);
LABEL_10:

}

void __81__CRMultiModelTextRecognizer_recognizeInImage_lineRegions_progressHandler_error___block_invoke_3(uint64_t a1, double a2)
{
  if (*(_QWORD *)(a1 + 32))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24)
                                                                + *(double *)(a1 + 64)
                                                                * (a2
                                                                 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                             + 24));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
    (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                             + 24));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
  }
}

BOOL __81__CRMultiModelTextRecognizer_recognizeInImage_lineRegions_progressHandler_error___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  _BOOL8 v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activationProbability");
    v10 = v9;
    objc_msgSend(v4, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activationProbability");
    v13 = v10 > v12;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)pruneSortAndGroupRegions:(id)a3 recognitionResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__18;
  v21 = __Block_byref_object_dispose__18;
  v22 = 0;
  -[CRMultiModelTextRecognizer groupingStats](self, "groupingStats");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__CRMultiModelTextRecognizer_pruneSortAndGroupRegions_recognitionResult___block_invoke;
  v13[3] = &unk_1E98DB930;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v16 = &v17;
  objc_msgSend(v8, "measureBlock:", v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __73__CRMultiModelTextRecognizer_pruneSortAndGroupRegions_recognitionResult___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v2 = (id)CRSignpostLog_signPostOSLog;
  v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v4 = (id)CRSignpostLog_signPostOSLog;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRTextGroupingTime", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "textFeatureSplitter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pruneAndFilterLineRegions:recognitionResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "textFeatureSplitter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "groupLineRegions:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v12 = (id)CRSignpostLog_signPostOSLog;
  v13 = v12;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v13, OS_SIGNPOST_INTERVAL_END, v3, "OCRTextGroupingTime", ", v14, 2u);
  }

}

- (id)sortAndGroupPrunedRegions:(id)a3 tableGroups:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__18;
  v21 = __Block_byref_object_dispose__18;
  v22 = 0;
  -[CRMultiModelTextRecognizer groupingStats](self, "groupingStats");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__CRMultiModelTextRecognizer_sortAndGroupPrunedRegions_tableGroups___block_invoke;
  v13[3] = &unk_1E98DB930;
  v16 = &v17;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  objc_msgSend(v8, "measureBlock:", v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __68__CRMultiModelTextRecognizer_sortAndGroupPrunedRegions_tableGroups___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v2 = (id)CRSignpostLog_signPostOSLog;
  v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v4 = (id)CRSignpostLog_signPostOSLog;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRTextGroupingTime", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "textFeatureSplitter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "groupLineRegions:tableGroups:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v10 = (id)CRSignpostLog_signPostOSLog;
  v11 = v10;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v11, OS_SIGNPOST_INTERVAL_END, v3, "OCRTextGroupingTime", ", v12, 2u);
  }

}

- (id)recognizerForIdentifier:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("recognizerForIdentifier must be overridden."));
  return 0;
}

- (CRPerformanceStatistics)inferenceStats
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("inferenceStats must be overridden."));
  return 0;
}

- (CRPerformanceStatistics)decodingStats
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("decodingStats must be overridden."));
  return 0;
}

- (CRPerformanceStatistics)groupingStats
{
  void *v3;
  CRPerformanceStatistics *v4;

  -[CRMultiModelTextRecognizer groupingStatsStorage](self, "groupingStatsStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[CRPerformanceStatistics initWithName:measureRecentPeak:]([CRPerformanceStatistics alloc], "initWithName:measureRecentPeak:", CFSTR("Text Grouping"), 0);
    -[CRMultiModelTextRecognizer setGroupingStatsStorage:](self, "setGroupingStatsStorage:", v4);

  }
  return -[CRMultiModelTextRecognizer groupingStatsStorage](self, "groupingStatsStorage");
}

- (id)identifierForTextRegion:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("identifierForTextRegion must be overridden."));
  return 0;
}

- (BOOL)_isCancelled
{
  CRMultiModelTextRecognizer *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[CRMultiModelTextRecognizer shouldCancel](v2, "shouldCancel");
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)keepAllResourcesLoadedWhenNotInUse
{
  return self->_keepAllResourcesLoadedWhenNotInUse;
}

- (void)setKeepAllResourcesLoadedWhenNotInUse:(BOOL)a3
{
  self->_keepAllResourcesLoadedWhenNotInUse = a3;
}

- (CRPerformanceStatistics)orientationStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOrientationStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CRRecognizerConfiguration)configuration
{
  return (CRRecognizerConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)configurationOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConfigurationOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CRMultiModelTextFeatureSplitter)textFeatureSplitter
{
  return (CRMultiModelTextFeatureSplitter *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTextFeatureSplitter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)shouldCancel
{
  return self->_shouldCancel;
}

- (void)setShouldCancel:(BOOL)a3
{
  self->_shouldCancel = a3;
}

- (CRPerformanceStatistics)groupingStatsStorage
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 48, 1);
}

- (void)setGroupingStatsStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CRTextOrientationCorrector)orientationCorrector
{
  return (CRTextOrientationCorrector *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOrientationCorrector:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orientationCorrector, 0);
  objc_storeStrong((id *)&self->_groupingStatsStorage, 0);
  objc_storeStrong((id *)&self->_textFeatureSplitter, 0);
  objc_storeStrong((id *)&self->_configurationOptions, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_orientationStats, 0);
}

@end
