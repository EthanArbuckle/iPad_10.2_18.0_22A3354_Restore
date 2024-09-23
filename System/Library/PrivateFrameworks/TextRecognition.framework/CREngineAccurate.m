@implementation CREngineAccurate

- (CREngineAccurate)initWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  CREngineAccurate *v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  char *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  CRPerformanceStatistics *v23;
  void *v24;
  char v25;
  CRLineWrappingConfiguration *v26;
  CRLineWrapper *v27;
  CRPerformanceStatistics *v28;
  CRPerformanceStatistics *v29;
  CREngineAccurate *v30;
  NSObject *v31;
  objc_super v33;
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CREngineAccurate;
  v7 = -[CREngineAccurate init](&v33, sel_init);
  if (v7)
  {
    CROSLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[CREngineAccurate initWithOptions:error:]";
      _os_log_impl(&dword_1D4FB8000, v8, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

    -[CREngineAccurate setRevision:](v7, "setRevision:", +[CRImageReader defaultRevisionNumber](CRImageReader, "defaultRevisionNumber"));
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderRevisionKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (!v10)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("CRImageReaderRevisionKey"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CREngineAccurate setRevision:](v7, "setRevision:", objc_msgSend(v11, "unsignedIntegerValue"));

    }
    if (-[CREngineAccurate revision](v7, "revision") >= 3)
      v12 = -[CREngineAccurate revision](v7, "revision");
    else
      v12 = 3;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderComputeDeviceKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

    if (!v14)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderComputeDeviceKey"));
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "supportedComputeDevicesForRevision:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "containsObject:", v15);

      if ((v17 & 1) == 0)
      {
        CROSLogForCategory(0);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v15;
          _os_log_impl(&dword_1D4FB8000, v31, OS_LOG_TYPE_ERROR, "Unsupported compute device requested %@", buf, 0xCu);
        }

        if (a4)
        {
          +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -7);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_23;
      }
      -[CREngineAccurate setRequestedComputeDevice:](v7, "setRequestedComputeDevice:", v15);

    }
    +[CRNeuralTextDetector detectorForRevision:imageReaderOptions:error:](CRNeuralTextDetector, "detectorForRevision:imageReaderOptions:error:", v12, v6, a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CREngineAccurate setOcrDetector:](v7, "setOcrDetector:", v18);

    +[CRMultiModelTextRecognizer recognizerForRevision:imageReaderOptions:error:](CRMultiModelTextRecognizer, "recognizerForRevision:imageReaderOptions:error:", v12, v6, a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CREngineAccurate setOcrRecognizer:](v7, "setOcrRecognizer:", v19);

    -[CREngineAccurate ocrDetector](v7, "ocrDetector");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      -[CREngineAccurate ocrRecognizer](v7, "ocrRecognizer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21 == 0;

      if (!v22)
      {
        v23 = -[CRPerformanceStatistics initWithName:measureRecentPeak:]([CRPerformanceStatistics alloc], "initWithName:measureRecentPeak:", CFSTR("Recognition"), 0);
        -[CREngineAccurate setRecognizerStats:](v7, "setRecognizerStats:", v23);

        -[CREngineAccurate setShouldCancel:](v7, "setShouldCancel:", 0);
        if (-[CREngineAccurate revision](v7, "revision") >= 3)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderCoreMode"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "BOOLValue");

          if ((v25 & 1) == 0)
          {
            v26 = objc_alloc_init(CRLineWrappingConfiguration);
            v27 = -[CRLineWrapper initWithConfiguration:]([CRLineWrapper alloc], "initWithConfiguration:", v26);
            -[CREngineAccurate setLineWrapper:](v7, "setLineWrapper:", v27);

            v28 = -[CRPerformanceStatistics initWithName:measureRecentPeak:]([CRPerformanceStatistics alloc], "initWithName:measureRecentPeak:", CFSTR("Line Wrapping"), 1);
            -[CREngineAccurate setLineWrappingStats:](v7, "setLineWrappingStats:", v28);

            v29 = -[CRPerformanceStatistics initWithName:measureRecentPeak:]([CRPerformanceStatistics alloc], "initWithName:measureRecentPeak:", CFSTR("TableStructure"), 1);
            -[CREngineAccurate setTableStructureRecognitionStats:](v7, "setTableStructureRecognitionStats:", v29);

          }
        }
        goto LABEL_17;
      }
    }
LABEL_23:
    v30 = 0;
    goto LABEL_24;
  }
LABEL_17:
  v30 = v7;
LABEL_24:

  return v30;
}

- (void)cancel
{
  id v3;
  id v4;

  -[CREngineAccurate setShouldCancel:](self, "setShouldCancel:", 1);
  -[CREngineAccurate ocrDetector](self, "ocrDetector");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CREngineAccurate ocrRecognizer](self, "ocrRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

}

- (CRPerformanceStatistics)detectorStats
{
  void *v2;
  void *v3;

  -[CREngineAccurate ocrDetector](self, "ocrDetector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detectorStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CRPerformanceStatistics *)v3;
}

- (CRPerformanceStatistics)postProcStats
{
  void *v2;
  void *v3;

  -[CREngineAccurate ocrDetector](self, "ocrDetector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postProcStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CRPerformanceStatistics *)v3;
}

- (CRPerformanceStatistics)detectorInferenceStats
{
  void *v2;
  void *v3;

  -[CREngineAccurate ocrDetector](self, "ocrDetector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inferenceStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CRPerformanceStatistics *)v3;
}

- (CRPerformanceStatistics)recognizerInferenceStats
{
  void *v2;
  void *v3;

  -[CREngineAccurate ocrRecognizer](self, "ocrRecognizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inferenceStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CRPerformanceStatistics *)v3;
}

- (CRPerformanceStatistics)recognizerDecodingStats
{
  void *v2;
  void *v3;

  -[CREngineAccurate ocrRecognizer](self, "ocrRecognizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decodingStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CRPerformanceStatistics *)v3;
}

- (CRPerformanceStatistics)textGroupingStats
{
  void *v2;
  void *v3;

  -[CREngineAccurate ocrRecognizer](self, "ocrRecognizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupingStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CRPerformanceStatistics *)v3;
}

- (CRPerformanceStatistics)orientationCorrectionStats
{
  void *v2;
  void *v3;

  -[CREngineAccurate ocrRecognizer](self, "ocrRecognizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orientationStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CRPerformanceStatistics *)v3;
}

- (CGSize)smallestImageSizeForTextWithRelativeHeight:(double)a3 originalImageSize:(CGSize)a4
{
  double height;
  double width;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a4.height;
  width = a4.width;
  -[CREngineAccurate ocrDetector](self, "ocrDetector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CREngineAccurate ocrDetector](self, "ocrDetector");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "smallestImageSizeForTextWithRelativeHeight:originalImageSize:", a3, width, height);
    width = v10;
    height = v11;

  }
  v12 = width;
  v13 = height;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)_loadFormAnalyzerIfNeededWithImageReaderOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  CREngineAccurate *v8;
  void *v9;
  CRFormAnalyzerConfiguration *v10;
  unint64_t v11;
  id v12;
  CRPerformanceStatistics *v13;
  CRPerformanceStatistics *v14;
  CRPerformanceStatistics *v15;
  CRFormAnalyzer *v16;
  void *v17;
  void *v18;
  CRFormAnalyzer *v19;
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CREngineAccurate formAnalyzer](self, "formAnalyzer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = self;
    objc_sync_enter(v8);
    -[CREngineAccurate formAnalyzer](v8, "formAnalyzer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = objc_alloc_init(CRFormAnalyzerConfiguration);
      -[CRFormAnalyzerConfiguration setResizeInputImage:](v10, "setResizeInputImage:", 0);
      -[CRFormAnalyzerConfiguration setTileInputImage:](v10, "setTileInputImage:", 1);
      v21 = 0;
      v11 = +[CRComputeDeviceUtilities computeDeviceTypeForOptions:mtlDevice:](CRComputeDeviceUtilities, "computeDeviceTypeForOptions:mtlDevice:", v6, &v21);
      v12 = v21;
      -[CRFormAnalyzerConfiguration setComputeDeviceType:](v10, "setComputeDeviceType:", v11);
      -[CRFormAnalyzerConfiguration setMetalDevice:](v10, "setMetalDevice:", v12);
      v13 = -[CRPerformanceStatistics initWithName:measureRecentPeak:]([CRPerformanceStatistics alloc], "initWithName:measureRecentPeak:", CFSTR("Form Analysis"), 1);
      -[CREngineAccurate setFormAnalyzerStats:](v8, "setFormAnalyzerStats:", v13);

      v14 = -[CRPerformanceStatistics initWithName:measureRecentPeak:]([CRPerformanceStatistics alloc], "initWithName:measureRecentPeak:", CFSTR("Form Detection"), 0);
      -[CREngineAccurate setFormDetectionStats:](v8, "setFormDetectionStats:", v14);

      v15 = -[CRPerformanceStatistics initWithName:measureRecentPeak:]([CRPerformanceStatistics alloc], "initWithName:measureRecentPeak:", CFSTR("Form PostProcessing"), 0);
      -[CREngineAccurate setFormPostProcessingStats:](v8, "setFormPostProcessingStats:", v15);

      v16 = [CRFormAnalyzer alloc];
      -[CREngineAccurate formDetectionStats](v8, "formDetectionStats");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CREngineAccurate formPostProcessingStats](v8, "formPostProcessingStats");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[CRFormAnalyzer initWithConfiguration:error:detectionStats:postProcessingStats:](v16, "initWithConfiguration:error:detectionStats:postProcessingStats:", v10, a4, v17, v18);
      -[CREngineAccurate setFormAnalyzer:](v8, "setFormAnalyzer:", v19);

      CROSLogForCategory(6);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[CREngineAccurate _loadFormAnalyzerIfNeededWithImageReaderOptions:error:]";
        _os_log_impl(&dword_1D4FB8000, v20, OS_LOG_TYPE_DEFAULT, "%s: Form analyzer loaded.", buf, 0xCu);
      }

    }
    objc_sync_exit(v8);

  }
}

- (id)resultDocumentForDetectionResult:(id)a3 image:(id)a4 options:(id)a5 progressHandler:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD *v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t i;
  _QWORD *v25;
  void *v26;
  _BOOL4 v27;
  unint64_t v28;
  id v29;
  CRTableStructureRecognizer *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  BOOL v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  NSObject *v55;
  void *v56;
  int v57;
  void *v58;
  CRLogger *v59;
  NSObject *v60;
  void *v61;
  _BYTE *CRLogger;
  id v63;
  void *v64;
  void *v65;
  id v66;
  id v68;
  uint64_t v69;
  id *v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  _QWORD v75[5];
  id v76;
  id v77;
  __int128 *p_buf;
  char v79;
  _QWORD v80[4];
  id v81;
  CREngineAccurate *v82;
  _QWORD v83[5];
  id v84;
  id v85;
  id v86;
  uint64_t *v87;
  unint64_t v88;
  id v89;
  _QWORD v90[5];
  id v91;
  id v92;
  id v93;
  uint64_t *v94;
  id *v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  uint8_t v102[4];
  const char *v103;
  __int16 v104;
  int v105;
  __int128 buf;
  uint64_t v107;
  uint64_t (*v108)(uint64_t, uint64_t);
  void (*v109)(uint64_t);
  id v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v73 = a5;
  v96 = 0;
  v97 = &v96;
  v98 = 0x3032000000;
  v99 = __Block_byref_object_copy__16;
  v100 = __Block_byref_object_dispose__16;
  v101 = 0;
  v68 = a6;
  -[CREngineAccurate recognizerStats](self, "recognizerStats");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v90[0] = MEMORY[0x1E0C809B0];
  v90[1] = 3221225472;
  v90[2] = __89__CREngineAccurate_resultDocumentForDetectionResult_image_options_progressHandler_error___block_invoke;
  v90[3] = &unk_1E98DB140;
  v94 = &v96;
  v90[4] = self;
  v15 = v13;
  v91 = v15;
  v16 = v12;
  v92 = v16;
  v70 = a7;
  v71 = v68;
  v93 = v71;
  v95 = a7;
  objc_msgSend(v14, "measureBlock:", v90);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (_QWORD *)objc_msgSend(v16, "tableRegions");
    if (v17[1] != *v17)
    {
      v18 = (void *)MEMORY[0x1E0C99DE8];
      v19 = (_QWORD *)objc_msgSend(v16, "tableRegions");
      objc_msgSend(v18, "arrayWithCapacity:", (uint64_t)(v19[1] - *v19) >> 3);
      v20 = objc_claimAutoreleasedReturnValue();

      v74 = (void *)v20;
      CROSLogForCategory(5);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v22 = (_QWORD *)objc_msgSend(v16, "tableRegions");
        v23 = (uint64_t)(v22[1] - *v22) >> 3;
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v23;
        _os_log_impl(&dword_1D4FB8000, v21, OS_LOG_TYPE_DEBUG, "Processing %lu tables", (uint8_t *)&buf, 0xCu);
      }

      for (i = 0; ; ++i)
      {
        v25 = (_QWORD *)objc_msgSend(v16, "tableRegions");
        if (i >= (uint64_t)(v25[1] - *v25) >> 3)
          break;
        -[CREngineAccurate tableStructureRecognizer](self, "tableStructureRecognizer");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26 == 0;

        if (v27)
        {
          v89 = 0;
          v28 = +[CRComputeDeviceUtilities computeDeviceTypeForOptions:mtlDevice:](CRComputeDeviceUtilities, "computeDeviceTypeForOptions:mtlDevice:", v73, &v89);
          v29 = v89;
          v30 = -[CRTableStructureRecognizer initWithComputeDeviceType:metalDevice:]([CRTableStructureRecognizer alloc], "initWithComputeDeviceType:metalDevice:", v28, v29);
          -[CREngineAccurate setTableStructureRecognizer:](self, "setTableStructureRecognizer:", v30);

        }
        -[CREngineAccurate tableStructureRecognitionStats](self, "tableStructureRecognitionStats");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v83[0] = MEMORY[0x1E0C809B0];
        v83[1] = 3221225472;
        v83[2] = __89__CREngineAccurate_resultDocumentForDetectionResult_image_options_progressHandler_error___block_invoke_53;
        v83[3] = &unk_1E98DB168;
        v83[4] = self;
        v84 = v16;
        v87 = &v96;
        v88 = i;
        v85 = v15;
        v86 = v74;
        objc_msgSend(v31, "measureBlock:", v83);

      }
    }
  }
  v32 = (void *)objc_opt_new();
  -[CREngineAccurate ocrRecognizer](self, "ocrRecognizer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "sortAndGroupPrunedRegions:tableGroups:", v97[5], v74);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "setBlocks:", v34);
  objc_msgSend(v16, "lines");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "count");
  objc_msgSend(v32, "lines");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFilteredFeatureCount:", v36 - objc_msgSend(v37, "count"));

  objc_msgSend(v32, "lines");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CREngineAccurate _titleRegionFromRegions:](self, "_titleRegionFromRegions:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTitleRegion:", v39);

  objc_msgSend(v15, "size");
  -[CREngineAccurate _documentOutputRegionResult:imageSize:](self, "_documentOutputRegionResult:imageSize:", v32);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "url");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "URLByDeletingPathExtension");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "lastPathComponent");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (!v42)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("null%lu"), objc_msgSend(v15, "hash"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v72, "setImagePath:", v43);
  if (!v42)

  -[CREngineAccurate lineWrapper](self, "lineWrapper");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44 == 0;

  if (!v45)
  {
    -[CREngineAccurate lineWrappingStats](self, "lineWrappingStats");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __89__CREngineAccurate_resultDocumentForDetectionResult_image_options_progressHandler_error___block_invoke_58;
    v80[3] = &unk_1E98DAD40;
    v81 = v72;
    v82 = self;
    objc_msgSend(v46, "measureBlock:", v80);

  }
  if (os_variant_has_internal_diagnostics())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKey:", CFSTR("com.apple.CoreRecognition.load_cached_form_detection"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE4(v69) = objc_msgSend(v48, "BOOLValue");

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "objectForKey:", CFSTR("com.apple.CoreRecognition.save_cached_form_detection"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v69) = objc_msgSend(v50, "BOOLValue");

  }
  else
  {
    v69 = 0;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v107 = 0x3032000000;
  v108 = __Block_byref_object_copy__16;
  v109 = __Block_byref_object_dispose__16;
  v110 = 0;
  objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("CRImageReaderDetectForms"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v51, "BOOLValue"))
  {

LABEL_22:
    -[CREngineAccurate _loadFormAnalyzerIfNeededWithImageReaderOptions:error:](self, "_loadFormAnalyzerIfNeededWithImageReaderOptions:error:", v73, v70);
    CROSLogForCategory(6);
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("CRImageReaderDetectForms"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "BOOLValue");
      *(_DWORD *)v102 = 136315394;
      v103 = "-[CREngineAccurate resultDocumentForDetectionResult:image:options:progressHandler:error:]";
      v104 = 1024;
      v105 = v57;
      _os_log_impl(&dword_1D4FB8000, v55, OS_LOG_TYPE_DEFAULT, "%s: Form detection is enabled (CRImageReaderDetectForms:%d).", v102, 0x12u);

    }
    -[CREngineAccurate formAnalyzerStats](self, "formAnalyzerStats");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = __89__CREngineAccurate_resultDocumentForDetectionResult_image_options_progressHandler_error___block_invoke_67;
    v75[3] = &unk_1E98DB190;
    v79 = BYTE4(v69);
    p_buf = &buf;
    v75[4] = self;
    v76 = v15;
    v77 = v72;
    objc_msgSend(v58, "measureBlock:", v75);

    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKey:", CFSTR("com.apple.CoreRecognition.force_form_detection"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "BOOLValue");

  if (v54)
    goto LABEL_22;
  CROSLogForCategory(6);
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v102 = 136315138;
    v103 = "-[CREngineAccurate resultDocumentForDetectionResult:image:options:progressHandler:error:]";
    _os_log_impl(&dword_1D4FB8000, v60, OS_LOG_TYPE_DEFAULT, "%s: Form detection is disabled.", v102, 0xCu);
  }

LABEL_28:
  v61 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (!v61)
  {
    CRLogger = CRLogger::getCRLogger(v59);
    if (*CRLogger && (CRLogger[8] & 0x10) != 0)
    {
      v63 = (id)objc_msgSend(v72, "contentsWithTypes:", 4096);
      +[CRDataDetectorUtilities debugDataDetectorForRegion:withImage:ddQOS:](CRDataDetectorUtilities, "debugDataDetectorForRegion:withImage:ddQOS:", v72, v15, 2);
    }
    -[CREngineAccurate _detectorDebugDataForResult:](self, "_detectorDebugDataForResult:", v16);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setDetectorResults:", v64);

    v61 = v72;
    if ((_DWORD)v69)
    {
      -[CREngineAccurate formAnalyzer](self, "formAnalyzer");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "exportSerializedResults:forImage:", v72, v15);

      v61 = v72;
    }
  }
  v66 = v61;
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v96, 8);
  return v66;
}

void __89__CREngineAccurate_resultDocumentForDetectionResult_image_options_progressHandler_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
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
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRRecognizerTime", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "ocrRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "lines");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recognizeInImage:lineRegions:progressHandler:error:", v7, v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v12 = (id)CRSignpostLog_signPostOSLog;
  v13 = v12;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v13, OS_SIGNPOST_INTERVAL_END, v3, "OCRRecognizerTime", ", v14, 2u);
  }

}

void __89__CREngineAccurate_resultDocumentForDetectionResult_image_options_progressHandler_error___block_invoke_53(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
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
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRTableStructureRecognitionTime", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "tableStructureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recognizeDetectedTableInRegion:filteredResults:tableIndex:image:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "tableStructureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableGroupRegionFromResult:recognizedLines:", v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);
  }
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v10 = (id)CRSignpostLog_signPostOSLog;
  v11 = v10;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v11, OS_SIGNPOST_INTERVAL_END, v3, "OCRTableStructureRecognitionTime", ", v12, 2u);
  }

}

void __89__CREngineAccurate_resultDocumentForDetectionResult_image_options_progressHandler_error___block_invoke_58(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
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
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRLineWrappingTime", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "contentsWithTypes:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "lineWrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predictLineWrappingTypesForAllLinesInGroups:", v6);

  objc_msgSend(*(id *)(a1 + 32), "_invalidateTranscript");
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v8 = (id)CRSignpostLog_signPostOSLog;
  v9 = v8;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v9, OS_SIGNPOST_INTERVAL_END, v3, "OCRLineWrappingTime", ", v10, 2u);
  }

}

void __89__CREngineAccurate_resultDocumentForDetectionResult_image_options_progressHandler_error___block_invoke_67(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRFormDetection", ", (uint8_t *)&v21, 2u);
  }

  if (!*(_BYTE *)(a1 + 64))
    goto LABEL_10;
  objc_msgSend(*(id *)(a1 + 32), "formAnalyzer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchSerializedResultsForImage:", *(_QWORD *)(a1 + 40));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
LABEL_10:
    objc_msgSend(*(id *)(a1 + 32), "formAnalyzer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "shouldRunDetectionForDocument:", *(_QWORD *)(a1 + 48));

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "formAnalyzer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "analyzeImage:outputRegion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

      CROSLogForCategory(6);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 48), "formFieldRegions");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");
        objc_msgSend(*(id *)(a1 + 48), "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 136315650;
        v22 = "-[CREngineAccurate resultDocumentForDetectionResult:image:options:progressHandler:error:]_block_invoke";
        v23 = 2048;
        v24 = v15;
        v25 = 2112;
        v26 = (uint64_t)v16;
        _os_log_impl(&dword_1D4FB8000, v13, OS_LOG_TYPE_DEFAULT, "%s: Storing %lu parsed fields in %@.", (uint8_t *)&v21, 0x20u);

      }
    }
    else
    {
      CROSLogForCategory(6);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 48), "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(*(id *)(a1 + 48), "numberOfLines");
        v21 = 136315650;
        v22 = "-[CREngineAccurate resultDocumentForDetectionResult:image:options:progressHandler:error:]_block_invoke";
        v23 = 2112;
        v24 = (uint64_t)v17;
        v25 = 2048;
        v26 = v18;
        _os_log_impl(&dword_1D4FB8000, v13, OS_LOG_TYPE_DEFAULT, "%s: Skipping running form field detection for %@ (line count: %lu).", (uint8_t *)&v21, 0x20u);

      }
    }

    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v19 = (id)CRSignpostLog_signPostOSLog;
    v20 = v19;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v20, OS_SIGNPOST_INTERVAL_END, v3, "OCRFormDetection", ", (uint8_t *)&v21, 2u);
    }

  }
}

- (id)documentForLineRegions:(id)a3 recognitionResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CRDetectionResult *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  CREngineAccurate *v25;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_opt_new();
    -[CREngineAccurate ocrRecognizer](self, "ocrRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pruneSortAndGroupRegions:recognitionResult:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBlocks:", v10);

    v11 = objc_msgSend(v6, "count");
    objc_msgSend(v8, "lines");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFilteredFeatureCount:", v11 - objc_msgSend(v12, "count"));

    objc_msgSend(v8, "lines");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CREngineAccurate _titleRegionFromRegions:](self, "_titleRegionFromRegions:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitleRegion:", v14);

    objc_msgSend(v6, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "boundingQuad");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "normalizationSize");
    -[CREngineAccurate _documentOutputRegionResult:imageSize:](self, "_documentOutputRegionResult:imageSize:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[CREngineAccurate lineWrapper](self, "lineWrapper");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[CREngineAccurate lineWrappingStats](self, "lineWrappingStats");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __61__CREngineAccurate_documentForLineRegions_recognitionResult___block_invoke;
      v23[3] = &unk_1E98DAD40;
      v24 = v17;
      v25 = self;
      objc_msgSend(v19, "measureBlock:", v23);

    }
    v20 = -[CRDetectionResult initWithLines:]([CRDetectionResult alloc], "initWithLines:", v6);
    -[CREngineAccurate _detectorDebugDataForResult:](self, "_detectorDebugDataForResult:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDetectorResults:", v21);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __61__CREngineAccurate_documentForLineRegions_recognitionResult___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
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
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRLineWrappingTime", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "contentsWithTypes:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "lineWrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predictLineWrappingTypesForAllLinesInGroups:", v6);

  objc_msgSend(*(id *)(a1 + 32), "_invalidateTranscript");
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v8 = (id)CRSignpostLog_signPostOSLog;
  v9 = v8;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v9, OS_SIGNPOST_INTERVAL_END, v3, "OCRLineWrappingTime", ", v10, 2u);
  }

}

- (id)textDetectorResultsForImage:(id)a3 error:(id *)a4
{
  -[CREngineAccurate textDetectorResultsForImage:trackingSession:error:](self, "textDetectorResultsForImage:trackingSession:error:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)textDetectorResultsForImage:(id)a3 trackingSession:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  -[CREngineAccurate ocrDetector](self, "ocrDetector");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "detectInImage:trackingSession:error:", v8, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)supportedLanguagesForRevision:(int64_t)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;

  +[CRRecognizerConfiguration supportedLanguagesForVersion:](CRNeuralRecognizerConfiguration, "supportedLanguagesForVersion:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a4 && !v5)
  {
    +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -4);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (id)supportedComputeDevicesForRevision:(int64_t)a3
{
  void *v3;
  void *v4;

  +[CRComputeDeviceUtilities allComputeDevices](CRComputeDeviceUtilities, "allComputeDevices", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRComputeDeviceUtilities computeDevices:ofTypes:](CRComputeDeviceUtilities, "computeDevices:ofTypes:", v3, 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)preheatModelsForOptions:(id)a3 revision:(int64_t)a4 extendedTimeoutBlock:(id)a5 error:(id *)a6
{
  return 1;
}

+ (CGSize)detectorImageSizeForOptions:(id)a3 imageSize:(CGSize)a4
{
  double v4;
  double v5;
  CGSize result;

  +[CRNeuralTextDetector scaledImageSizeForOptions:imageSize:](CRNeuralTextDetector, "scaledImageSizeForOptions:imageSize:", a3, a4.width, a4.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)thresholdsForTextRegion:(id)a3 withLocale:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[CREngineAccurate ocrRecognizer](self, "ocrRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "thresholdsForTextRegion:withLocale:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)trackingResultOnSession:(id)a3 image:(id)a4 options:(id)a5 error:(id *)a6
{
  double *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  double *v21;
  void *v22;
  void *v23;
  void *v24;
  double Current;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  int v30;
  id v32;
  void *v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  double *v38;
  id v39[2];
  uint8_t v40[4];
  int v41;
  id buf;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = (double *)a3;
  v34 = a4;
  v32 = a5;
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v11 = (id)CRSignpostLog_signPostOSLog;
  v12 = os_signpost_id_generate(v11);

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v13 = (id)CRSignpostLog_signPostOSLog;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    objc_msgSend(v10, "latestResult", v32, v34);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trackedRegions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = objc_msgSend(v16, "count");
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "OCRTrackingE2E", "tracked quads: %d", (uint8_t *)&buf, 8u);

  }
  v17 = objc_initWeak(&buf, v10);
  objc_sync_enter(v10);
  v18 = objc_loadWeakRetained(&buf);
  objc_msgSend(v18, "setDidDispatchOCROnFrame:", 0);

  v19 = objc_loadWeakRetained(&buf);
  objc_msgSend(v19, "setDidRunAssociationOnFrame:", 0);

  v20 = objc_loadWeakRetained(&buf);
  -[CRImageReaderTrackingSession applyOpticalFlowTrackingForFrame:]((uint64_t)v20, v34);

  objc_sync_exit(v10);
  if (-[CRImageReaderTrackingSession shouldRunOCROnCurrentFrame]((uint64_t)v10))
  {
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __64__CREngineAccurate_trackingResultOnSession_image_options_error___block_invoke;
    v35[3] = &unk_1E98DB1E0;
    v35[4] = self;
    v36 = v34;
    objc_copyWeak(v39, &buf);
    v39[1] = a6;
    v37 = v32;
    v21 = v10;
    v38 = v21;
    if (-[CRImageReaderTrackingSession dispatchIfReady:]((uint64_t)v21, v35))
    {
      objc_msgSend(v21, "setDidDispatchOCROnFrame:", 1);
      -[CRImageReaderTrackingSession prepareSessionForOCRDispatch]((uint64_t)v21);
    }

    objc_destroyWeak(v39);
  }
  if (objc_msgSend(v10, "usesGroupedRegions", v32))
  {
    objc_msgSend(v10, "latestResult");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "regionTrackingGroups");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRTrackedDocumentOutputRegion documentWithTrackedRegionGroups:](CRTrackedDocumentOutputRegion, "documentWithTrackedRegionGroups:", v23);
  }
  else
  {
    objc_msgSend(v10, "latestResult");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trackedRegions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRTrackedDocumentOutputRegion documentWithTrackedRegions:](CRTrackedDocumentOutputRegion, "documentWithTrackedRegions:", v23);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  Current = CFAbsoluteTimeGetCurrent();
  if (v10)
    v10[16] = Current;
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v26 = (id)CRSignpostLog_signPostOSLog;
  v27 = v26;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    objc_msgSend(v10, "latestResult");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trackedRegions");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");
    *(_DWORD *)v40 = 67109120;
    v41 = v30;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v27, OS_SIGNPOST_INTERVAL_END, v12, "OCRTrackingE2E", "tracked quads: %d", v40, 8u);

  }
  objc_destroyWeak(&buf);

  return v24;
}

void __64__CREngineAccurate_trackingResultOnSession_image_options_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id *v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  char *v26;
  void *v27;
  char *v28;
  void *v29;
  id v30;
  void *v31;
  char *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  char *v38;
  void *v39;
  id v40;
  __int128 v41;
  double v42;
  __int128 v43;
  __int128 v44;
  double v45;
  __int128 v46;
  __int128 v47;
  double v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  id v52;
  uint64_t v53;
  uint8_t buf[16];
  __int128 v55;
  __int128 v56;

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
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRE2EDetectionTime", ", buf, 2u);
  }

  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v6, "textDetectorResultsForImage:trackingSession:error:", v7, WeakRetained, *(_QWORD *)(a1 + 72));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v11 = (id)CRSignpostLog_signPostOSLog;
  v12 = v11;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v12, OS_SIGNPOST_INTERVAL_END, v3, "OCRE2EDetectionTime", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("CRImageReaderDetectionOnly"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if ((v14 & 1) != 0)
  {
    v15 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "textGroupingStats");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __64__CREngineAccurate_trackingResultOnSession_image_options_error___block_invoke_71;
    v50[3] = &unk_1E98DB1B8;
    v51 = v10;
    v17 = v15;
    v18 = *(_QWORD *)(a1 + 32);
    v52 = v17;
    v53 = v18;
    objc_msgSend(v16, "measureBlock:", v50);

    v19 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "size");
    objc_msgSend(v19, "_documentOutputRegionResult:imageSize:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "resultDocumentForDetectionResult:image:options:progressHandler:error:", v10, *(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 72));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = objc_loadWeakRetained((id *)(a1 + 64));
  v22 = -[CRImageReaderTrackingSession trackedRegionType]((uint64_t)v21);
  v23 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v20, "trackingDocumentWithTrackedType:includeLines:", v22, objc_msgSend(v23, "shouldIncludeLinesInTrackingResult"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_sync_enter(v25);
  v26 = (char *)objc_loadWeakRetained((id *)(a1 + 64));
  v27 = v26;
  if (v26)
  {
    objc_copyStruct(buf, v26 + 208, 48, 1, 0);
    v41 = *(_OWORD *)buf;
    v44 = v55;
    v47 = v56;
  }
  else
  {
    v44 = 0u;
    v47 = 0u;
    v41 = 0u;
  }
  v28 = (char *)objc_loadWeakRetained((id *)(a1 + 64));
  v29 = v28;
  *(_OWORD *)buf = v41;
  v55 = v44;
  v56 = v47;
  if (v28)
    objc_copyStruct(v28 + 256, buf, 48, 1, 0);

  if (v24)
  {
    v30 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v30, "latestResult");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (char *)objc_loadWeakRetained((id *)(a1 + 64));
    v33 = v32;
    if (v32)
    {
      objc_copyStruct(buf, v32 + 256, 48, 1, 0);
      v34 = objc_msgSend(*(id *)(a1 + 56), "usesGroupedRegions", *(_QWORD *)buf, *(_QWORD *)&buf[8], v55, v56);
    }
    else
    {
      v34 = objc_msgSend(*(id *)(a1 + 56), "usesGroupedRegions", 0, 0, 0, 0, 0, 0);
    }
    objc_msgSend(v31, "resultByUpdatingWithDocument:sceneHomography:usesGroupedRegions:", v24, v34, v42, v45, v48);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_loadWeakRetained(v8);
    objc_msgSend(v36, "setLatestResult:", v35);

    v37 = objc_loadWeakRetained(v8);
    objc_msgSend(v37, "setDidRunAssociationOnFrame:", 1);

    v46 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
    v49 = *MEMORY[0x1E0C83FE8];
    v43 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 32);
    v38 = (char *)objc_loadWeakRetained(v8);
    v39 = v38;
    *(_OWORD *)buf = v49;
    v55 = v46;
    v56 = v43;
    if (v38)
      objc_copyStruct(v38 + 208, buf, 48, 1, 0);

    v40 = objc_loadWeakRetained(v8);
    -[CRImageReaderTrackingSession saveQuadsAfterAssociation]((uint64_t)v40);

  }
  objc_sync_exit(v25);

}

void __64__CREngineAccurate_trackingResultOnSession_image_options_error___block_invoke_71(id *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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

  objc_msgSend(a1[4], "lines");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1[6], "ocrRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textFeatureOrder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "lines");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "orderAndGroupRegions:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setBlocks:", v11);

  }
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

- (id)resultDocumentInImage:(id)a3 options:(id)a4 trackingSession:(id)a5 withProgressHandler:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, double);
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  char v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  CREngineAccurate *v40;
  _QWORD v41[4];
  void (**v42)(id, _QWORD, double);
  int v43;
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, _QWORD, double))a6;
  if (v14)
  {
    -[CREngineAccurate ocrRecognizer](self, "ocrRecognizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "keepAllResourcesLoadedWhenNotInUse");

    -[CREngineAccurate ocrRecognizer](self, "ocrRecognizer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setKeepAllResourcesLoadedWhenNotInUse:", 1);

    -[CREngineAccurate trackingResultOnSession:image:options:error:](self, "trackingResultOnSession:image:options:error:", v14, v12, v13, a7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CREngineAccurate ocrRecognizer](self, "ocrRecognizer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setKeepAllResourcesLoadedWhenNotInUse:", v17);
  }
  else
  {
    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v21 = (id)CRSignpostLog_signPostOSLog;
    v22 = os_signpost_id_generate(v21);

    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v23 = (id)CRSignpostLog_signPostOSLog;
    v24 = v23;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "OCRE2EDetectionTime", ", buf, 2u);
    }

    v36 = (void *)objc_opt_new();
    -[CREngineAccurate textDetectorResultsForImage:trackingSession:error:](self, "textDetectorResultsForImage:trackingSession:error:", v12, 0, a7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v26 = (id)CRSignpostLog_signPostOSLog;
    v27 = v26;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v27, OS_SIGNPOST_INTERVAL_END, v22, "OCRE2EDetectionTime", ", buf, 2u);
    }

    v20 = v36;
    if (v15 && v25)
      v15[2](v15, 0, 0.5);
    if (-[CREngineAccurate shouldCancel](self, "shouldCancel"))
    {
      if (a7)
      {
        +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -3);
        v19 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = 0;
      }
    }
    else
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("CRImageReaderDetectionOnly"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "BOOLValue");

      if ((v29 & 1) != 0)
      {
        -[CREngineAccurate textGroupingStats](self, "textGroupingStats");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __92__CREngineAccurate_resultDocumentInImage_options_trackingSession_withProgressHandler_error___block_invoke_2;
        v37[3] = &unk_1E98DB1B8;
        v31 = v25;
        v38 = v31;
        v32 = v36;
        v39 = v32;
        v40 = self;
        objc_msgSend(v30, "measureBlock:", v37);

        objc_msgSend(v12, "size");
        -[CREngineAccurate _documentOutputRegionResult:imageSize:](self, "_documentOutputRegionResult:imageSize:", v32);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CREngineAccurate _detectorDebugDataForResult:](self, "_detectorDebugDataForResult:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setDetectorResults:", v33);

      }
      else
      {
        if (v15)
        {
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __92__CREngineAccurate_resultDocumentInImage_options_trackingSession_withProgressHandler_error___block_invoke;
          v41[3] = &unk_1E98DB208;
          v42 = v15;
          v43 = 1056964608;
          v34 = (void *)MEMORY[0x1D826E9A8](v41);

        }
        else
        {
          v34 = 0;
        }
        -[CREngineAccurate resultDocumentForDetectionResult:image:options:progressHandler:error:](self, "resultDocumentForDetectionResult:image:options:progressHandler:error:", v25, v12, v13, v34, a7);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  return v19;
}

uint64_t __92__CREngineAccurate_resultDocumentInImage_options_trackingSession_withProgressHandler_error___block_invoke(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(_QWORD, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 * 0.5 + *(float *)(a1 + 40));
}

void __92__CREngineAccurate_resultDocumentInImage_options_trackingSession_withProgressHandler_error___block_invoke_2(id *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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

  objc_msgSend(a1[4], "lines");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1[6], "ocrRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textFeatureOrder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "lines");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "orderAndGroupRegions:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setBlocks:", v11);

  }
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

- (id)_blockFromGroup:(id)a3 engineResult:(id)a4 titleRegion:(id *)a5 canWrapToNextBlock:(BOOL)a6
{
  _BOOL4 v6;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  _BOOL4 v24;
  id v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v6 = a6;
  v33 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v26 = a4;
  v9 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v25, "subregions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v6;
  v11 = v10;
  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "conformsToProtocol:", &unk_1EFF145E0);
        v17 = v15;
        v18 = v17;
        if (v16)
        {
          +[CROutputRegion outputRegionFromTextRegion:confidenceThresholdProvider:injectSpaceCharacter:](CROutputRegion, "outputRegionFromTextRegion:confidenceThresholdProvider:injectSpaceCharacter:", v17, self, objc_msgSend(v17, "whitespaceInjected") ^ 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (a5)
          {
            objc_msgSend(v26, "titleRegion");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v18 == v20;

            if (v21)
              *a5 = objc_retainAutorelease(v19);
          }
          objc_msgSend(v9, "addObject:", v19);
        }
        else
        {
          +[CRLineOutputRegion lineWithDetectedRegion:](CRLineOutputRegion, "lineWithDetectedRegion:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v19);
        }

      }
      v10 = v11;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v12);
  }

  +[CRBlockOutputRegion blockWithGroupRegion:children:confidenceThresholdProvider:canWrapToNextBlock:]((uint64_t)CRBlockOutputRegion, v25, v9, (uint64_t)self, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)_documentOutputRegionResult:(id)a3 imageSize:(CGSize)a4
{
  double height;
  double width;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  CRTableCellOutputRegion *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CRTableCellOutputRegion *v20;
  CRTableOutputRegion *v21;
  void *v22;
  void *v23;
  void *v24;
  CRTableOutputRegion *v25;
  id v26;
  void *v27;
  void *v29;
  id v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t i;
  id v37;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  height = a4.height;
  width = a4.width;
  v51 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v39 = (void *)objc_opt_new();
  v29 = (void *)objc_opt_new();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v30, "blocks");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v33)
  {
    v34 = 0;
    v32 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v46 != v32)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v35 = v6;
          v7 = (void *)objc_opt_new();
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          objc_msgSend(v35, "cells");
          v37 = (id)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          if (v8)
          {
            v9 = *(_QWORD *)v42;
            do
            {
              for (j = 0; j != v8; ++j)
              {
                if (*(_QWORD *)v42 != v9)
                  objc_enumerationMutation(v37);
                v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
                -[CREngineAccurate _blockFromGroup:engineResult:titleRegion:canWrapToNextBlock:](self, "_blockFromGroup:engineResult:titleRegion:canWrapToNextBlock:", v11, 0, 0, 0);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "addObject:", v12);
                v13 = [CRTableCellOutputRegion alloc];
                objc_msgSend(v11, "boundingQuad");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v11, "rows");
                v17 = v16;
                v18 = objc_msgSend(v11, "columns");
                v20 = -[CRTableCellOutputRegion initWithBlock:quad:rowRange:colRange:](v13, "initWithBlock:quad:rowRange:colRange:", v12, v14, v15, v17, v18, v19);

                objc_msgSend(v7, "addObject:", v20);
              }
              v8 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
            }
            while (v8);
          }

          v21 = [CRTableOutputRegion alloc];
          objc_msgSend(v35, "boundingQuad");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "rowQuads");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "columnQuads");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[CRTableOutputRegion initWithCells:quad:rowQuads:colQuads:](v21, "initWithCells:quad:rowQuads:colQuads:", v7, v22, v23, v24);

          objc_msgSend(v29, "addObject:", v25);
        }
        else
        {
          v40 = v34;
          -[CREngineAccurate _blockFromGroup:engineResult:titleRegion:canWrapToNextBlock:](self, "_blockFromGroup:engineResult:titleRegion:canWrapToNextBlock:", v6, v30, &v40, 1);
          v35 = (id)objc_claimAutoreleasedReturnValue();
          v26 = v40;

          objc_msgSend(v39, "addObject:", v35);
          v34 = v26;
        }

      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v33);
  }
  else
  {
    v34 = 0;
  }

  +[CRDocumentOutputRegion documentWithRegions:title:confidence:imageSize:](CRDocumentOutputRegion, "documentWithRegions:title:confidence:imageSize:", v39, v34, 2, width, height);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTableRegions:", v29);
  objc_msgSend(v27, "collectMetadataForNumFilteredRegions:", objc_msgSend(v30, "filteredFeatureCount"));

  return v27;
}

- (id)_detectorDebugDataForResult:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  CRTextFeature *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  CRTextFeature *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD *v33;
  void *v34;
  _QWORD *v35;
  void *v36;
  unint64_t i;
  _QWORD *v38;
  id v39;
  CRTableOutputRegion *v40;
  void *v41;
  void *v42;
  void *v43;
  CRTableOutputRegion *v44;
  CRTextDetectorResults *v46;
  id v47;
  id obj;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v46 = objc_alloc_init(CRTextDetectorResults);
  v49 = (void *)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v47, "lines");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v51;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v51 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v5);
        v7 = [CRTextFeature alloc];
        objc_msgSend(v6, "boundingQuad");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "topLeft");
        v10 = v9;
        v12 = v11;
        objc_msgSend(v6, "boundingQuad");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "topRight");
        v15 = v14;
        v17 = v16;
        objc_msgSend(v6, "boundingQuad");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bottomLeft");
        v20 = v19;
        v22 = v21;
        objc_msgSend(v6, "boundingQuad");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "bottomRight");
        v26 = -[CRTextFeature initWithTopLeft:topRight:bottomLeft:bottomRight:](v7, "initWithTopLeft:topRight:bottomLeft:bottomRight:", v10, v12, v15, v17, v20, v22, v24, v25);

        -[CRTextFeature setNmsOutputScale:](v26, "setNmsOutputScale:", objc_msgSend(v6, "nmsOutputScale"));
        -[CRTextFeature setTextType:](v26, "setTextType:", objc_msgSend(v6, "textType"));
        objc_msgSend(v6, "scriptCategoryResults");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRTextFeature setScriptCategoryResults:](v26, "setScriptCategoryResults:", v27);

        objc_msgSend(v6, "scriptCategoryCounts");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRTextFeature setScriptCounts:](v26, "setScriptCounts:", v28);

        objc_msgSend(v6, "topScriptCategory");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRTextFeature setSelectedScriptCategory:](v26, "setSelectedScriptCategory:", v29);

        objc_msgSend(v49, "addObject:", v26);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v3);
  }

  objc_msgSend(v47, "pyramidScaleSize");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextDetectorResults setPyramidScaleSize:](v46, "setPyramidScaleSize:", v30);

  objc_msgSend(v47, "pyramidScaleName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextDetectorResults setPyramidScaleName:](v46, "setPyramidScaleName:", v31);

  objc_msgSend(v47, "pyramidPreIntraScaleNMSTextFeatures");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextDetectorResults setPyramidPreIntraScaleNMSTextFeatures:](v46, "setPyramidPreIntraScaleNMSTextFeatures:", v32);

  -[CRTextDetectorResults setTextFeatures:](v46, "setTextFeatures:", v49);
  if (v47)
  {
    v33 = (_QWORD *)objc_msgSend(v47, "tableRegions");
    if (v33[1] != *v33)
    {
      v34 = (void *)MEMORY[0x1E0C99DE8];
      v35 = (_QWORD *)objc_msgSend(v47, "tableRegions");
      objc_msgSend(v34, "arrayWithCapacity:", (uint64_t)(v35[1] - *v35) >> 3);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; ; ++i)
      {
        v38 = (_QWORD *)objc_msgSend(v47, "tableRegions", v46);
        if (i >= (uint64_t)(v38[1] - *v38) >> 3)
          break;
        v39 = *(id *)(*(_QWORD *)objc_msgSend(v47, "tableRegions") + 8 * i);
        v40 = [CRTableOutputRegion alloc];
        v41 = (void *)objc_opt_new();
        v42 = (void *)objc_opt_new();
        v43 = (void *)objc_opt_new();
        v44 = -[CRTableOutputRegion initWithCells:quad:rowQuads:colQuads:](v40, "initWithCells:quad:rowQuads:colQuads:", v41, v39, v42, v43);

        objc_msgSend(v36, "addObject:", v44);
      }
      -[CRTextDetectorResults setDetectedTables:](v46, "setDetectedTables:", v36);

    }
  }

  return v46;
}

- (id)_titleRegionFromRegions:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  float v13;
  float v14;
  _DWORD *v15;
  _DWORD *v16;
  unint64_t v17;
  double v18;
  float v19;
  int v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  _BOOL4 v32;
  double v33;
  double v34;
  float v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  double v44;
  double v45;
  float v46;
  _QWORD *v47;
  _QWORD **v48;
  _QWORD *v49;
  _QWORD **v50;
  unint64_t v51;
  _QWORD *v52;
  double v53;
  double v54;
  float v55;
  BOOL v56;
  uint64_t v57;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  unint64_t v64;
  uint64_t *v65;
  _QWORD *v66[2];
  void *__p;
  _BYTE *v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  void *v74;
  _BYTE *v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  if (!objc_msgSend(v59, "count"))
  {
    v21 = 0;
    goto LABEL_56;
  }
  std::vector<float>::vector(&v74, objc_msgSend(v59, "count"));
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v4 = v59;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v71;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v71 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * v8), "boundingQuad");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "size");
        v12 = v11;

        v13 = v12;
        v6 = v9 + 1;
        *((float *)v74 + v9) = v13;
        ++v8;
        ++v9;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
    }
    while (v5);
  }

  __p = 0;
  v68 = 0;
  v69 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v74, (uint64_t)v75, (v75 - (_BYTE *)v74) >> 2);
  std::__sort<std::__less<float,float> &,float *>();
  v14 = *(float *)((char *)__p + (((v68 - (_BYTE *)__p) >> 1) & 0xFFFFFFFFFFFFFFFCLL));
  v66[0] = 0;
  v66[1] = 0;
  v64 = 0;
  v65 = (uint64_t *)v66;
  v15 = v74;
  v16 = v75;
  if (v74 == v75)
    goto LABEL_27;
  v17 = 0;
  v18 = v14 * 1.7;
  v19 = v18;
  v20 = -1;
  do
  {
    LODWORD(v18) = *v15;
    if (*(float *)v15 > v19)
    {
      std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>(&v65, &v64, (uint64_t *)&v64);
      v17 = v64;
      if (v20 == -1)
        v20 = v64;
    }
    v64 = ++v17;
    ++v15;
  }
  while (v15 != v16);
  if (v20 == -1)
    goto LABEL_27;
  objc_msgSend(v4, "objectAtIndexedSubscript:", v20, v18);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[CREngineAccurate ocrRecognizer](self, "ocrRecognizer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "titleParametersForTextRegion:", v21);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "boundingQuad");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomLeft");
  if (v25 >= 0.5)
    goto LABEL_25;
  objc_msgSend(v21, "boundingQuad");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bottomRight");
  if (v27 >= 0.5)
  {
LABEL_24:

LABEL_25:
LABEL_26:

LABEL_27:
    v64 = 0;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v23 = v4;
    v36 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v61;
      do
      {
        v38 = 0;
        do
        {
          if (*(_QWORD *)v61 != v37)
            objc_enumerationMutation(v23);
          v39 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v38);
          -[CREngineAccurate ocrRecognizer](self, "ocrRecognizer");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "titleParametersForTextRegion:", v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "text");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "length");
          if (v43 >= objc_msgSend(v41, "minTitleLength"))
          {
            objc_msgSend(v39, "activationProbability");
            v45 = v44;
            objc_msgSend(v41, "minTitleProbability");
            if (v45 > v46)
            {

LABEL_51:
              v21 = v39;

              goto LABEL_52;
            }
          }
          v47 = v66[0];
          if (!v66[0])
            goto LABEL_43;
          v48 = v66;
          do
          {
            v49 = v47;
            v50 = v48;
            v51 = v47[4];
            v52 = v47 + 1;
            if (v51 >= v64)
            {
              v52 = v49;
              v48 = (_QWORD **)v49;
            }
            v47 = (_QWORD *)*v52;
          }
          while (v47);
          if (v48 == v66)
            goto LABEL_43;
          if (v51 < v64)
            v49 = v50;
          if (v64 >= v49[4])
          {
            objc_msgSend(v39, "activationProbability");
            v54 = v53;
            objc_msgSend(v41, "minTitleProbability");
            v56 = v54 > v55;

            if (v56)
              goto LABEL_51;
          }
          else
          {
LABEL_43:

          }
          ++v64;

          ++v38;
        }
        while (v38 != v36);
        v57 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
        v36 = v57;
      }
      while (v57);
    }
    v21 = 0;
    goto LABEL_52;
  }
  objc_msgSend(v21, "boundingQuad");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "topLeft");
  if (v29 >= 0.5)
  {

    goto LABEL_24;
  }
  objc_msgSend(v21, "boundingQuad");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topRight");
  v32 = v31 < 0.5;

  if (!v32)
    goto LABEL_26;
  objc_msgSend(v21, "activationProbability");
  v34 = v33;
  objc_msgSend(v23, "minTitleProbability");
  if (v34 <= v35)
    goto LABEL_26;
LABEL_52:

  std::__tree<CRCHuint128>::destroy((uint64_t)&v65, v66[0]);
  if (__p)
  {
    v68 = __p;
    operator delete(__p);
  }
  if (v74)
  {
    v75 = v74;
    operator delete(v74);
  }
LABEL_56:

  return v21;
}

- (CRPerformanceStatistics)recognizerStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRecognizerStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CRPerformanceStatistics)lineWrappingStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLineWrappingStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CRPerformanceStatistics)tableStructureRecognitionStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTableStructureRecognitionStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CRPerformanceStatistics)formAnalyzerStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFormAnalyzerStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CRPerformanceStatistics)formDetectionStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFormDetectionStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CRPerformanceStatistics)formPostProcessingStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFormPostProcessingStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (CRNeuralTextDetector)ocrDetector
{
  return (CRNeuralTextDetector *)objc_getProperty(self, a2, 64, 1);
}

- (void)setOcrDetector:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CRMultiModelTextRecognizer)ocrRecognizer
{
  return (CRMultiModelTextRecognizer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setOcrRecognizer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (CRLineWrapper)lineWrapper
{
  return (CRLineWrapper *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLineWrapper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CRTableStructureRecognizer)tableStructureRecognizer
{
  return (CRTableStructureRecognizer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTableStructureRecognizer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (CRFormAnalyzer)formAnalyzer
{
  return (CRFormAnalyzer *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFormAnalyzer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (unint64_t)revision
{
  return self->_revision;
}

- (void)setRevision:(unint64_t)a3
{
  self->_revision = a3;
}

- (BOOL)shouldCancel
{
  return self->_shouldCancel;
}

- (void)setShouldCancel:(BOOL)a3
{
  self->_shouldCancel = a3;
}

- (MLComputeDeviceProtocol)requestedComputeDevice
{
  return (MLComputeDeviceProtocol *)objc_getProperty(self, a2, 120, 1);
}

- (void)setRequestedComputeDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedComputeDevice, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_formAnalyzer, 0);
  objc_storeStrong((id *)&self->_tableStructureRecognizer, 0);
  objc_storeStrong((id *)&self->_lineWrapper, 0);
  objc_storeStrong((id *)&self->_ocrRecognizer, 0);
  objc_storeStrong((id *)&self->_ocrDetector, 0);
  objc_storeStrong((id *)&self->_formPostProcessingStats, 0);
  objc_storeStrong((id *)&self->_formDetectionStats, 0);
  objc_storeStrong((id *)&self->_formAnalyzerStats, 0);
  objc_storeStrong((id *)&self->_tableStructureRecognitionStats, 0);
  objc_storeStrong((id *)&self->_lineWrappingStats, 0);
  objc_storeStrong((id *)&self->_recognizerStats, 0);
}

@end
