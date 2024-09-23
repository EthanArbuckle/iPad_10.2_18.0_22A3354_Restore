@implementation VKCImageAnalyzer

+ (unint64_t)supportedAnalysisTypes
{
  if (supportedAnalysisTypes_onceToken != -1)
    dispatch_once(&supportedAnalysisTypes_onceToken, &__block_literal_global);
  return supportedAnalysisTypes_types;
}

void __42__VKCImageAnalyzer_supportedAnalysisTypes__block_invoke()
{
  NSObject *v0;
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (vk_deviceSupportsVisualSearch())
    supportedAnalysisTypes_types |= 0x10uLL;
  if (vk_deviceSupportsImageAnalysis())
  {
    supportedAnalysisTypes_types |= 1uLL;
    if (vk_isiOS())
      supportedAnalysisTypes_types |= 0xCuLL;
  }
  if ((vk_deviceHasNeuralEngine() & 1) != 0 || vk_isSeedBuild())
    supportedAnalysisTypes_types |= 0x20uLL;
  v0 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    VKMUIStringForAnalysisTypes(supportedAnalysisTypes_types);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_1D2E0D000, v0, OS_LOG_TYPE_DEFAULT, "Supported Analysis types: %@", (uint8_t *)&v2, 0xCu);

  }
}

+ (NSArray)supportedRecognitionLanguages
{
  id v2;
  void *v3;
  id v4;
  id v6;

  v2 = objc_alloc_init(MEMORY[0x1E0CEDFE0]);
  v6 = 0;
  objc_msgSend(v2, "supportedRecognitionLanguagesAndReturnError:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  if (v4)
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "error == ((void *)0)", "+[VKCImageAnalyzer supportedRecognitionLanguages]", 0, 0, CFSTR("Error retrieving supportedRecognitionLanguages: %@"), v4);

  return (NSArray *)v3;
}

- (VKCImageAnalyzer)init
{
  VKCImageAnalyzer *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VKCImageAnalyzer;
  v2 = -[VKCImageAnalyzer init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("AppleLiveTextEnabled"), 1, VKImageAnalyzerContext);

    -[VKCImageAnalyzer updateForLiveTextSupport](v2, "updateForLiveTextSupport");
  }
  return v2;
}

- (void)updateForLiveTextSupport
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *processingQueue;
  VKAnalyticsProcessor *v5;
  VKAnalyticsProcessor *analyticsProcessor;
  VKImageAnalyzerMadInterface *v7;
  VKImageAnalyzerMadInterface *mad;
  OS_dispatch_queue *v9;
  VKAnalyticsProcessor *v10;
  VKImageAnalyzerMadInterface *v11;

  if ((objc_msgSend((id)objc_opt_class(), "deviceSupportsImageAnalysis") & 1) != 0
    || vk_deviceSupportsVisualSearch())
  {
    v3 = (OS_dispatch_queue *)dispatch_queue_create("VKImageAnalyzer", 0);
    processingQueue = self->_processingQueue;
    self->_processingQueue = v3;

    v5 = objc_alloc_init(VKAnalyticsProcessor);
    analyticsProcessor = self->_analyticsProcessor;
    self->_analyticsProcessor = v5;

    -[VKAnalyticsProcessor setIsPublicAPI:](self->_analyticsProcessor, "setIsPublicAPI:", -[VKCImageAnalyzer _isPublicAPI](self, "_isPublicAPI"));
    +[VKImageAnalyzerMadInterface sharedInterface](VKImageAnalyzerMadInterface, "sharedInterface");
    v7 = (VKImageAnalyzerMadInterface *)objc_claimAutoreleasedReturnValue();
    mad = self->_mad;
    self->_mad = v7;

    if (vk_isInternalBuild())
      self->_createFeedbackProviders = 1;
  }
  else
  {
    -[VKCImageAnalyzer cancelAllRequests](self, "cancelAllRequests");
    v9 = self->_processingQueue;
    self->_processingQueue = 0;

    v10 = self->_analyticsProcessor;
    self->_analyticsProcessor = 0;

    v11 = self->_mad;
    self->_mad = 0;

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("AppleLiveTextEnabled"), VKImageAnalyzerContext);

  v4.receiver = self;
  v4.super_class = (Class)VKCImageAnalyzer;
  -[VKCImageAnalyzer dealloc](&v4, sel_dealloc);
}

- (void)set_isPublicAPI:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->__isPublicAPI = a3;
  -[VKCImageAnalyzer analyticsProcessor](self, "analyticsProcessor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsPublicAPI:", v3);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if ((void *)VKImageAnalyzerContext == a6)
  {
    -[VKCImageAnalyzer updateForLiveTextSupport](self, "updateForLiveTextSupport", a3, a4, a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)VKCImageAnalyzer;
    -[VKCImageAnalyzer observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (OS_dispatch_queue)realCallbackQueue
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  -[VKCImageAnalyzer callbackQueue](self, "callbackQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C80D38];
    v5 = MEMORY[0x1E0C80D38];
  }

  return (OS_dispatch_queue *)v4;
}

- (unint64_t)statusForRequestID:(int)a3
{
  return 3;
}

- (void)cancelRequestID:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[VKCImageAnalyzer mad](self, "mad");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelRequestID:", v3);

}

- (void)cancelAllRequests
{
  id v2;

  -[VKCImageAnalyzer mad](self, "mad");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllRequests");

}

- (int)processRequest:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  int v18;
  int v19;
  int v20;
  char v21;
  BOOL v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  int v26;
  _QWORD block[4];
  id v29;
  _QWORD v30[4];
  id v31;
  double v32;
  double v33;
  _QWORD v34[4];
  id v35;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v8, "analysisTypes"))
  {
    v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2E0D000, v11, OS_LOG_TYPE_INFO, "Attempting to analyze an image with no analysis types set.", buf, 2u);
    }

  }
  objc_msgSend(v8, "imageSize");
  v14 = v12;
  v15 = v13;
  if (v12 >= v13)
    v16 = v12;
  else
    v16 = v13;
  v17 = objc_msgSend(v8, "isPhotosAssetRequest");
  if (v16 < 8192.0)
    v18 = 1;
  else
    v18 = v17;
  v19 = objc_msgSend((id)objc_opt_class(), "deviceSupportsImageAnalysis");
  v20 = vk_deviceSupportsVisualSearch();
  v21 = objc_msgSend(v8, "analysisTypes");
  if (!v8 || (v18 ? (v22 = (v19 | v20) == 0) : (v22 = 1), v22))
  {
    -[VKCImageAnalyzer realCallbackQueue](self, "realCallbackQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if ((v18 & 1) != 0)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_49;
        block[3] = &unk_1E9462390;
        v29 = v10;
        dispatch_async(v23, block);

        v24 = v29;
      }
      else
      {
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_45;
        v30[3] = &unk_1E94623B8;
        v32 = v14;
        v33 = v15;
        v31 = v10;
        dispatch_async(v23, v30);

        v24 = v31;
      }
    }
    else
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke;
      v34[3] = &unk_1E9462390;
      v35 = v10;
      dispatch_async(v23, v34);

      v24 = v35;
    }

    v26 = 0;
  }
  else
  {
    if (v19)
    {
      objc_msgSend(v8, "setProcessedAnalysisTypes:", objc_msgSend(v8, "analysisTypes"));
    }
    else if ((v20 & ((v21 & 0x10) != 0)) == 1)
    {
      objc_msgSend(v8, "setProcessedAnalysisTypes:", 16);
      v25 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2E0D000, v25, OS_LOG_TYPE_INFO, "Device does not support image analysis, but does support Visual Search, limiting to just Visual Search.", buf, 2u);
      }

    }
    v26 = -[VKCImageAnalyzer _processRequest:progressHandler:completionHandler:](self, "_processRequest:progressHandler:completionHandler:", v8, v9, v10);
  }

  return v26;
}

void __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v13 = *MEMORY[0x1E0CB2D50];
  v14[0] = CFSTR("Analyzer request must not be nil");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.VisionKit.ImageAnalyzer"), -7, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v4);

  v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);

}

void __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_45(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  VKMUIStringForSize(*(double *)(a1 + 40), *(double *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("ImageSize %@ is invalid for analysis. Max supported dimension is %ld"), v3, 0x2000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB2D50];
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.VisionKit.ImageAnalyzer"), -10, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v8);

  v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_45_cold_1((uint64_t)v4, v9);

}

void __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_49(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2D50];
  v6[0] = CFSTR("Device Not Supported");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.VisionKit.ImageAnalyzer"), -4, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v4);

  if (VKCMaxPixelDimension_block_invoke_onceToken != -1)
    dispatch_once(&VKCMaxPixelDimension_block_invoke_onceToken, &__block_literal_global_52);
}

void __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (id)processRequest:(id)a3 updateHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  VKCImageAnalysis *v11;
  VKCImageAnalysisResult *v12;
  VKCImageAnalysisResult *v13;
  VKCImageAnalysis *v14;
  void *v15;
  NSObject *v16;
  _QWORD block[4];
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend((id)objc_opt_class(), "deviceSupportsImageAnalysis"))
  {
    objc_msgSend(v8, "setIsMultiPartAnalysis:", 1);
    v11 = [VKCImageAnalysis alloc];
    v12 = [VKCImageAnalysisResult alloc];
    objc_msgSend(v8, "imageSize");
    v13 = -[VKCImageAnalysisResult initWithDocumentObservation:mrcDataDetectors:imageSize:](v12, "initWithDocumentObservation:mrcDataDetectors:imageSize:", 0, 0);
    v14 = -[VKImageAnalysis initWithAnalysisResult:](v11, "initWithAnalysisResult:", v13);
    objc_msgSend(v8, "setInProcessAnalysis:", v14);

    objc_msgSend(v8, "setRequestID:", -[VKCImageAnalyzer _processRequest:progressHandler:completionHandler:](self, "_processRequest:progressHandler:completionHandler:", v8, 0, v10));
    objc_msgSend(v8, "setUpdateHandler:", v9);
    objc_msgSend(v8, "inProcessAnalysis");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VKCImageAnalyzer realCallbackQueue](self, "realCallbackQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__VKCImageAnalyzer_processRequest_updateHandler_completionHandler___block_invoke;
    block[3] = &unk_1E9462390;
    v19 = v10;
    dispatch_async(v16, block);

    v15 = 0;
  }

  return v15;
}

void __67__VKCImageAnalyzer_processRequest_updateHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2D50];
  v6[0] = CFSTR("Device Not Supported");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.VisionKit.ImageAnalyzer"), -4, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v4);

  if (VKCMaxPixelDimension_block_invoke_2_onceToken != -1)
    dispatch_once(&VKCMaxPixelDimension_block_invoke_2_onceToken, &__block_literal_global_55);
}

void __67__VKCImageAnalyzer_processRequest_updateHandler_completionHandler___block_invoke_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (int)_processRequest:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  int v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id from;
  id location;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_initWeak(&from, v8);
  _VKSignpostLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2E0D000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VKImageAnalyzerProcessRequestEvent", (const char *)&unk_1D2EDB5E1, buf, 2u);
  }

  v13 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2E0D000, v13, OS_LOG_TYPE_INFO, "Signpost Begin: \"VKImageAnalyzerProcessRequestEvent\", buf, 2u);
  }

  v14 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __70__VKCImageAnalyzer__processRequest_progressHandler_completionHandler___block_invoke;
  v30[3] = &unk_1E9462450;
  objc_copyWeak(&v33, &location);
  objc_copyWeak(&v34, &from);
  v15 = v11;
  v31 = v15;
  v16 = v10;
  v32 = v16;
  objc_msgSend(v8, "setCompletionHandler:", v30);
  v26[0] = v14;
  v26[1] = 3221225472;
  v26[2] = __70__VKCImageAnalyzer__processRequest_progressHandler_completionHandler___block_invoke_61;
  v26[3] = &unk_1E94624A0;
  objc_copyWeak(&v28, &location);
  objc_copyWeak(&v29, &from);
  v17 = v9;
  v27 = v17;
  objc_msgSend(v8, "setProgressHandler:", v26);
  -[VKCImageAnalyzer mad](self, "mad");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalyzer realCallbackQueue](self, "realCallbackQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v18, "processRequest:callbackQueue:", v8, v19);

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSinceDate:", v15);
  v22 = v21;

  v23 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v38 = v22;
    v39 = 2112;
    v40 = v8;
    _os_log_impl(&dword_1D2E0D000, v23, OS_LOG_TYPE_INFO, "Added request to Mad Interface with total method return time: %f request: %@", buf, 0x16u);
  }

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v25;
}

void __70__VKCImageAnalyzer__processRequest_progressHandler_completionHandler___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  void *v12;
  VKFeedbackProvider *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v11 = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(v11, "requestIDValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "createFeedbackProviders"))
    {
      v13 = objc_alloc_init(VKFeedbackProvider);
      -[VKFeedbackProvider setAssetsProvider:](v13, "setAssetsProvider:", v11);
      -[VKFeedbackProvider setError:](v13, "setError:", v9);
      objc_msgSend(v7, "setFeedbackProvider:", v13);

    }
    objc_msgSend(WeakRetained, "_analyticsDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "realCallbackQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__VKCImageAnalyzer__processRequest_progressHandler_completionHandler___block_invoke_2;
    block[3] = &unk_1E9462428;
    v19 = v7;
    v20 = a1[4];
    objc_copyWeak(&v28, a1 + 7);
    v21 = v9;
    v22 = v12;
    v23 = v15;
    v27 = a1[5];
    v24 = v14;
    v25 = v8;
    v26 = WeakRetained;
    v16 = v14;
    v17 = v15;
    dispatch_async(v17, block);

    objc_destroyWeak(&v28);
  }

}

void __70__VKCImageAnalyzer__processRequest_progressHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  double v23;
  NSObject *v24;
  uint64_t v25;
  dispatch_time_t v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  int v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id WeakRetained;
  void *v40;
  _QWORD block[4];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint8_t buf[4];
  _BYTE v52[24];
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "imageAnalysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
  v5 = v4;

  v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    v34 = objc_msgSend(WeakRetained, "requestID");
    objc_msgSend(*(id *)(a1 + 32), "imageAnalysisResult");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    VKMUIStringForBool(v38 != 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "text");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v37, "length");
    objc_msgSend(v2, "textDataDetectorElements");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v36, "count");
    objc_msgSend(v2, "mrcDataDetectorElements");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v35, "count");
    objc_msgSend(v2, "visualSearchResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchResult");
    v40 = v2;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resultItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    v13 = objc_loadWeakRetained((id *)(a1 + 104));
    objc_msgSend(v13, "shortLoggingDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 67111170;
    *(_DWORD *)v52 = v34;
    *(_WORD *)&v52[4] = 2048;
    *(double *)&v52[6] = v5 * 1000.0;
    *(_WORD *)&v52[14] = 2112;
    *(_QWORD *)&v52[16] = v7;
    v53 = 1024;
    v54 = v33;
    v55 = 1024;
    v56 = v32;
    v57 = 1024;
    v58 = v8;
    v59 = 1024;
    v60 = v12;
    v61 = 2112;
    v62 = v14;
    v63 = 2112;
    v64 = v15;
    _os_log_impl(&dword_1D2E0D000, v6, OS_LOG_TYPE_DEFAULT, "Calling completion handler id: %d\nTotal Processing Time %.02fms\nHas Analysis: %@\nTextLength: %d DD: %d, MRC: %d, VS:%d \nrequest: %@\nError: %@", buf, 0x48u);

    v2 = v40;
  }

  if (+[VKCInternalSettings addRandomArtificalAnalysisDelay](VKCInternalSettings, "addRandomArtificalAnalysisDelay")&& vk_isInternalBuild())
  {
    v16 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v52 = v17;
      _os_log_impl(&dword_1D2E0D000, v16, OS_LOG_TYPE_DEFAULT, "Internal setting is set, and now beginning random delay logic for request: %@", buf, 0xCu);
    }

    +[VKCInternalSettings randomDelayStartValue](VKCInternalSettings, "randomDelayStartValue");
    v19 = v18;
    +[VKCInternalSettings randomDelayEndValue](VKCInternalSettings, "randomDelayEndValue");
    v21 = v20;
    if (v19 > v20)
    {
      v22 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(double *)v52 = v19;
        *(_WORD *)&v52[8] = 2048;
        *(double *)&v52[10] = v21;
        _os_log_impl(&dword_1D2E0D000, v22, OS_LOG_TYPE_DEFAULT, "Random delay minValue (%f) > endValue (%f), swapping", buf, 0x16u);
      }

    }
    v23 = VKMRandomBetween(v19, v21);
    v24 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134218242;
      *(double *)v52 = v23;
      *(_WORD *)&v52[8] = 2112;
      *(_QWORD *)&v52[10] = v25;
      _os_log_impl(&dword_1D2E0D000, v24, OS_LOG_TYPE_DEFAULT, "Adding random delay of %f for request: %@", buf, 0x16u);
    }

    v26 = dispatch_time(0, (uint64_t)(v23 * 1000000000.0));
    v27 = *(NSObject **)(a1 + 64);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__VKCImageAnalyzer__processRequest_progressHandler_completionHandler___block_invoke_59;
    block[3] = &unk_1E9462400;
    v42 = *(id *)(a1 + 40);
    v47 = v23;
    v48 = v19;
    v49 = v21;
    v43 = *(id *)(a1 + 56);
    v50 = v5;
    v46 = *(id *)(a1 + 96);
    v44 = *(id *)(a1 + 32);
    v45 = *(id *)(a1 + 48);
    dispatch_after(v26, v27, block);

  }
  else
  {
    v28 = *(_QWORD *)(a1 + 96);
    if (v28)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v28 + 16))(v28, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  v29 = *(void **)(a1 + 72);
  if (v29)
  {
    v30 = *(_QWORD *)(a1 + 80);
    if (v30)
      objc_msgSend(v29, "_visionKitAnalyticsEventDidOccur:imageAnalyzer:", v30, *(_QWORD *)(a1 + 88));
  }
  if (*(_QWORD *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 88), "analyticsProcessor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "processAndSendEvent:", *(_QWORD *)(a1 + 80));

  }
}

uint64_t __70__VKCImageAnalyzer__processRequest_progressHandler_completionHandler___block_invoke_59(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", a1[4]);
  v4 = v3;

  v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[9];
    v7 = a1[10];
    v8 = a1[5];
    v9 = a1[11];
    v10 = a1[12];
    v12 = 134219266;
    v13 = v6;
    v14 = 2048;
    v15 = v7;
    v16 = 2048;
    v17 = v9;
    v18 = 2112;
    v19 = v8;
    v20 = 2048;
    v21 = v10;
    v22 = 2048;
    v23 = v4;
    _os_log_impl(&dword_1D2E0D000, v5, OS_LOG_TYPE_DEFAULT, "Per internal settings toggle, added random delay of %f, with min of %f, and max of %f for request completion callback for request: %@. \nUndelayed Analysis duration: %f.\nTotal duration: %f", (uint8_t *)&v12, 0x3Eu);
  }

  result = a1[8];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[6], a1[7]);
  return result;
}

void __70__VKCImageAnalyzer__processRequest_progressHandler_completionHandler___block_invoke_61(id *a1, double a2)
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9[2];

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "realCallbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__VKCImageAnalyzer__processRequest_progressHandler_completionHandler___block_invoke_2_62;
    block[3] = &unk_1E9462478;
    v9[1] = *(id *)&a2;
    objc_copyWeak(v9, a1 + 6);
    v8 = a1[4];
    dispatch_async(v6, block);

    objc_destroyWeak(v9);
  }

}

uint64_t __70__VKCImageAnalyzer__processRequest_progressHandler_completionHandler___block_invoke_2_62(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  uint64_t result;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 48);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = 134218240;
    v7 = v3;
    v8 = 1024;
    v9 = objc_msgSend(WeakRetained, "requestID");
    _os_log_impl(&dword_1D2E0D000, v2, OS_LOG_TYPE_INFO, "Reporting progress: %f for Request id: %d", (uint8_t *)&v6, 0x12u);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(double))(result + 16))(*(double *)(a1 + 48));
  return result;
}

- (void)_forceInProcessAnalysis
{
  VKImageAnalyzerMadInterface *v3;
  VKImageAnalyzerMadInterface *mad;

  -[VKCImageAnalyzer cancelAllRequests](self, "cancelAllRequests");
  +[VKImageAnalyzerInProcessMadInterface sharedInterface](VKImageAnalyzerInProcessMadInterface, "sharedInterface");
  v3 = (VKImageAnalyzerMadInterface *)objc_claimAutoreleasedReturnValue();
  mad = self->_mad;
  self->_mad = v3;

}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (BOOL)createFeedbackProviders
{
  return self->_createFeedbackProviders;
}

- (void)setCreateFeedbackProviders:(BOOL)a3
{
  self->_createFeedbackProviders = a3;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (VKImageAnalyzerMadInterface)mad
{
  return self->_mad;
}

- (void)setMad:(id)a3
{
  objc_storeStrong((id *)&self->_mad, a3);
}

- (VKAnalyzerAnalyticsDelegate)_analyticsDelegate
{
  return (VKAnalyzerAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->__analyticsDelegate);
}

- (void)set_analyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->__analyticsDelegate, a3);
}

- (VKAnalyticsProcessor)analyticsProcessor
{
  return self->_analyticsProcessor;
}

- (void)setAnalyticsProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsProcessor, a3);
}

- (BOOL)_isPublicAPI
{
  return self->__isPublicAPI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsProcessor, 0);
  objc_destroyWeak((id *)&self->__analyticsDelegate);
  objc_storeStrong((id *)&self->_mad, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

void __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2E0D000, a1, a3, "Analyzer request must not be nil.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_45_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2E0D000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

void __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2E0D000, a1, a3, "Analysis not completed because device does not support Image Analysis. This will only be logged once.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
