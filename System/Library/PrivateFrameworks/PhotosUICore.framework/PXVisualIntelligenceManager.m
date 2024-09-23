@implementation PXVisualIntelligenceManager

+ (BOOL)isVisualSearchSupported
{
  return ((unint64_t)objc_msgSend(a1, "supportedAnalysisTypes") >> 4) & 1;
}

+ (BOOL)isImageSegmentationSupported
{
  return ((unint64_t)objc_msgSend(a1, "supportedAnalysisTypes") >> 5) & 1;
}

+ (unint64_t)supportedAnalysisTypes
{
  if (supportedAnalysisTypes_onceToken != -1)
    dispatch_once(&supportedAnalysisTypes_onceToken, &__block_literal_global_160563);
  return supportedAnalysisTypes_supportedAnalysisTypes;
}

uint64_t __53__PXVisualIntelligenceManager_supportedAnalysisTypes__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0DC6DD8], "supportedAnalysisTypes");
  supportedAnalysisTypes_supportedAnalysisTypes = result;
  return result;
}

- (PXVisualIntelligenceManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVisualIntelligenceManager.m"), 303, CFSTR("%s is not available as initializer"), "-[PXVisualIntelligenceManager init]");

  abort();
}

- (id)_init
{
  PXVisualIntelligenceManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *workingQueue;
  NSMutableArray *v6;
  NSMutableArray *requests;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXVisualIntelligenceManager;
  v2 = -[PXVisualIntelligenceManager init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.photos.vi_workingQueue", v3);
    workingQueue = v2->_workingQueue;
    v2->_workingQueue = (OS_dispatch_queue *)v4;

    v2->_nextRequestID = 1;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    requests = v2->_requests;
    v2->_requests = v6;

  }
  return v2;
}

- (VKCImageAnalyzer)vkAnalyzer
{
  VKCImageAnalyzer *vkAnalyzer;
  VKCImageAnalyzer *v4;
  VKCImageAnalyzer *v5;
  void *v6;

  vkAnalyzer = self->_vkAnalyzer;
  if (!vkAnalyzer)
  {
    v4 = (VKCImageAnalyzer *)objc_alloc_init(MEMORY[0x1E0DC6DD8]);
    v5 = self->_vkAnalyzer;
    self->_vkAnalyzer = v4;

    -[PXVisualIntelligenceManager workingQueue](self, "workingQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageAnalyzer setCallbackQueue:](self->_vkAnalyzer, "setCallbackQueue:", v6);

    vkAnalyzer = self->_vkAnalyzer;
  }
  return vkAnalyzer;
}

- (int)requestVKImageAnalysisForAsset:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  _QWORD block[5];
  id v17;
  id v18;
  uint64_t *v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__160514;
  v21[4] = __Block_byref_object_dispose__160515;
  v22 = 0;
  -[PXVisualIntelligenceManager workingQueue](self, "workingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PXVisualIntelligenceManager_requestVKImageAnalysisForAsset_resultHandler___block_invoke;
  block[3] = &unk_1E5140380;
  v19 = &v23;
  v20 = v21;
  block[4] = self;
  v9 = v6;
  v17 = v9;
  v10 = v7;
  v18 = v10;
  dispatch_sync(v8, block);

  PLVisualIntelligenceGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v24 + 6));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v12;
    v29 = 2112;
    v30 = v13;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEBUG, "VK analyzing: requested and request added in queue, NOT sent to VKC yet, (asset_uuid = %@), requestID: %@", buf, 0x16u);

  }
  -[PXVisualIntelligenceManager _dispatchNextRequest](self, "_dispatchNextRequest");
  v14 = *((_DWORD *)v24 + 6);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  return v14;
}

- (int)requestVKImageAnalysisForAsset:(id)a3 image:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  PXVisualIntelligenceManager *v24;
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__160514;
  v30[4] = __Block_byref_object_dispose__160515;
  v31 = 0;
  -[PXVisualIntelligenceManager workingQueue](self, "workingQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __82__PXVisualIntelligenceManager_requestVKImageAnalysisForAsset_image_resultHandler___block_invoke;
  v23 = &unk_1E512FC20;
  v28 = &v32;
  v29 = v30;
  v24 = self;
  v12 = v8;
  v25 = v12;
  v13 = v9;
  v26 = v13;
  v14 = v10;
  v27 = v14;
  dispatch_sync(v11, &v20);

  PLVisualIntelligenceGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v12, "uuid", v20, v21, v22, v23, v24, v25, v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v33 + 6));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v37 = v16;
    v38 = 2112;
    v39 = v17;
    _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEBUG, "VK analyzing: requested and request added in queue, NOT sent to VKC yet, (asset_uuid = %@), requestID: %@", buf, 0x16u);

  }
  -[PXVisualIntelligenceManager _dispatchNextRequest](self, "_dispatchNextRequest");
  v18 = *((_DWORD *)v33 + 6);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

- (int)requestVKImageAnalysisForAsset:(id)a3 pixelBuffer:(__CVBuffer *)a4 orientation:(int64_t)a5 resultHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  _QWORD block[5];
  id v21;
  id v22;
  uint64_t *v23;
  _QWORD *v24;
  __CVBuffer *v25;
  int64_t v26;
  _QWORD v27[5];
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__160514;
  v27[4] = __Block_byref_object_dispose__160515;
  v28 = 0;
  CVPixelBufferRetain(a4);
  -[PXVisualIntelligenceManager workingQueue](self, "workingQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PXVisualIntelligenceManager_requestVKImageAnalysisForAsset_pixelBuffer_orientation_resultHandler___block_invoke;
  block[3] = &unk_1E512FC48;
  v23 = &v29;
  block[4] = self;
  v24 = v27;
  v13 = v10;
  v21 = v13;
  v25 = a4;
  v26 = a5;
  v14 = v11;
  v22 = v14;
  dispatch_sync(v12, block);

  CVPixelBufferRelease(a4);
  PLVisualIntelligenceGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v13, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v30 + 6));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v34 = v16;
    v35 = 2112;
    v36 = v17;
    _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEBUG, "VK analyzing: requested and request added in queue, NOT sent to VKC yet, (asset_uuid = %@), requestID: %@", buf, 0x16u);

  }
  -[PXVisualIntelligenceManager _dispatchNextRequest](self, "_dispatchNextRequest");
  v18 = *((_DWORD *)v30 + 6);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);

  return v18;
}

- (int)requestVKImageAnalysisForAsset:(id)a3 cgImage:(CGImage *)a4 orientation:(int64_t)a5 resultHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  _QWORD block[5];
  id v21;
  id v22;
  uint64_t *v23;
  _QWORD *v24;
  CGImage *v25;
  int64_t v26;
  _QWORD v27[5];
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__160514;
  v27[4] = __Block_byref_object_dispose__160515;
  v28 = 0;
  CGImageRetain(a4);
  -[PXVisualIntelligenceManager workingQueue](self, "workingQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__PXVisualIntelligenceManager_requestVKImageAnalysisForAsset_cgImage_orientation_resultHandler___block_invoke;
  block[3] = &unk_1E512FC48;
  v23 = &v29;
  block[4] = self;
  v24 = v27;
  v13 = v10;
  v21 = v13;
  v25 = a4;
  v26 = a5;
  v14 = v11;
  v22 = v14;
  dispatch_sync(v12, block);

  CGImageRelease(a4);
  PLVisualIntelligenceGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v13, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v30 + 6));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v34 = v16;
    v35 = 2112;
    v36 = v17;
    _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEBUG, "VK analyzing: requested and request added in queue, NOT sent to VKC yet, (asset_uuid = %@), requestID: %@", buf, 0x16u);

  }
  -[PXVisualIntelligenceManager _dispatchNextRequest](self, "_dispatchNextRequest");
  v18 = *((_DWORD *)v30 + 6);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);

  return v18;
}

- (void)cancelRequestByID:(int)a3
{
  NSObject *v5;
  _QWORD block[4];
  id v7;
  int v8;
  id location;

  if (a3)
  {
    objc_initWeak(&location, self);
    -[PXVisualIntelligenceManager workingQueue](self, "workingQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__PXVisualIntelligenceManager_cancelRequestByID___block_invoke;
    block[3] = &unk_1E512FC70;
    objc_copyWeak(&v7, &location);
    v8 = a3;
    dispatch_async(v5, block);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)setAnalysisSuspended:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_analysisSuspended != a3)
  {
    v3 = a3;
    self->_analysisSuspended = a3;
    PLVisualIntelligenceGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_INFO, "VK analyzing: analyzing suspend (%@)", buf, 0xCu);
    }

    if (v3)
    {
      -[PXVisualIntelligenceManager currentRequest](self, "currentRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        -[PXVisualIntelligenceManager cancelRequestByID:](self, "cancelRequestByID:", objc_msgSend(v7, "requestID"));
        objc_initWeak((id *)buf, self);
        -[PXVisualIntelligenceManager workingQueue](self, "workingQueue");
        v9 = objc_claimAutoreleasedReturnValue();
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __52__PXVisualIntelligenceManager_setAnalysisSuspended___block_invoke;
        v10[3] = &unk_1E5147280;
        objc_copyWeak(&v12, (id *)buf);
        v11 = v8;
        dispatch_async(v9, v10);

        objc_destroyWeak(&v12);
        objc_destroyWeak((id *)buf);
      }

    }
    else
    {
      -[PXVisualIntelligenceManager _dispatchNextRequest](self, "_dispatchNextRequest");
    }
  }
}

- (void)_dispatchNextRequest
{
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id location;

  if (!-[PXVisualIntelligenceManager analysisSuspended](self, "analysisSuspended"))
  {
    objc_initWeak(&location, self);
    -[PXVisualIntelligenceManager workingQueue](self, "workingQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PXVisualIntelligenceManager__dispatchNextRequest__block_invoke;
    block[3] = &unk_1E5147280;
    objc_copyWeak(&v5, &location);
    block[4] = self;
    dispatch_async(v3, block);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)_processAnalysis:(id)a3 withRequest:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void (**v11)(id, uint64_t, id, id);

  if (a4)
  {
    v7 = a5;
    v8 = a4;
    v9 = a3;
    objc_msgSend(v8, "resultHandler");
    v11 = (void (**)(id, uint64_t, id, id))objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "requestID");

    v11[2](v11, v10, v9, v7);
  }
}

- (void)_resetCurrentRequestAndDispatchNextRequest
{
  -[PXVisualIntelligenceManager setCurrentRequest:](self, "setCurrentRequest:", 0);
  -[PXVisualIntelligenceManager _dispatchNextRequest](self, "_dispatchNextRequest");
}

- (void)_logAnalysis:(id)a3 request:(id)a4 duration:(double)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  int v35;
  int v36;
  uint64_t v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  double v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  const __CFString *v49;
  __int16 v50;
  const __CFString *v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  const __CFString *v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (v11)
  {
    PLVisualIntelligenceGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "requestID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "vkRequestID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "asset");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v39 = v13;
      v40 = 2112;
      v41 = v14;
      v42 = 2112;
      v43 = *(double *)&v16;
      v44 = 2112;
      v45 = (uint64_t)v11;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "VK analyzing: requestID (PX: %@, VK: %@) failed (asset_uuid = %@): %@", buf, 0x2Au);

    }
  }
  if (v9)
  {
    v17 = objc_msgSend(v9, "hasResultsForAnalysisTypes:", 1);
    v18 = objc_msgSend(v9, "hasResultsForAnalysisTypes:", 2);
    v19 = objc_msgSend(v9, "hasResultsForAnalysisTypes:", 4);
    v20 = objc_msgSend(v9, "hasResultsForAnalysisTypes:", 8);
    v21 = objc_msgSend(v9, "hasResultsForAnalysisTypes:", 16);
    v22 = objc_msgSend(v9, "countOfDataDetectorsWithTypes:", -1);
    PLVisualIntelligenceGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v35 = v17;
      v36 = v18;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "requestID"));
      v37 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "vkRequestID"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "asset");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "uuid");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v19;
      v29 = (void *)v27;
      *(_DWORD *)buf = 138414594;
      v30 = CFSTR("NO");
      v39 = v24;
      if (v35)
        v31 = CFSTR("YES");
      else
        v31 = CFSTR("NO");
      if (v36)
        v32 = CFSTR("YES");
      else
        v32 = CFSTR("NO");
      if (v28)
        v33 = CFSTR("YES");
      else
        v33 = CFSTR("NO");
      if (v20)
        v34 = CFSTR("YES");
      else
        v34 = CFSTR("NO");
      v40 = 2112;
      v41 = v25;
      if (v21)
        v30 = CFSTR("YES");
      v42 = 2048;
      v43 = a5;
      v44 = 2112;
      v45 = v27;
      v46 = 2112;
      v47 = v31;
      v48 = 2112;
      v49 = v32;
      v50 = 2112;
      v51 = v33;
      v52 = 2112;
      v53 = v34;
      v54 = 2112;
      v55 = v30;
      v56 = 2048;
      v57 = v37;
      _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_INFO, "VK analyzing: requestID (PX: %@, VK: %@) finished in %fs, asset_uuid = %@, (texts: %@, DD: %@, MRC: %@, AppClip: %@, VisualSearch: %@) Data Detectors: %ld", buf, 0x66u);

    }
  }

}

- (BOOL)analysisSuspended
{
  return self->_analysisSuspended;
}

- (OS_dispatch_queue)workingQueue
{
  return self->_workingQueue;
}

- (int)nextRequestID
{
  return self->_nextRequestID;
}

- (void)setNextRequestID:(int)a3
{
  self->_nextRequestID = a3;
}

- (NSMutableArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
  objc_storeStrong((id *)&self->_requests, a3);
}

- (_PXVisualIntelligenceRequest)currentRequest
{
  return self->_currentRequest;
}

- (void)setCurrentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentRequest, a3);
}

- (void)setVkAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_vkAnalyzer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vkAnalyzer, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_workingQueue, 0);
}

void __51__PXVisualIntelligenceManager__dispatchNextRequest__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  CFAbsoluteTime Current;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25[3];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "currentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "requests");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_loadWeakRetained(v2);
      objc_msgSend(v8, "setCurrentRequest:", v7);

      v9 = objc_loadWeakRetained(v2);
      objc_msgSend(v9, "requests");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObject:", v7);

      objc_msgSend(v7, "vkImageRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        Current = CFAbsoluteTimeGetCurrent();
        v13 = (void *)objc_msgSend(MEMORY[0x1E0D09910], "startSignpost");
        objc_msgSend(*(id *)(a1 + 32), "vkAnalyzer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __51__PXVisualIntelligenceManager__dispatchNextRequest__block_invoke_2;
        v22[3] = &unk_1E512FCE0;
        v25[1] = *(id *)&Current;
        v15 = v7;
        v25[2] = v13;
        v16 = *(_QWORD *)(a1 + 32);
        v23 = v15;
        v24 = v16;
        objc_copyWeak(v25, v2);
        objc_msgSend(v15, "setVkRequestID:", objc_msgSend(v14, "processRequest:progressHandler:completionHandler:", v11, 0, v22));

        PLVisualIntelligenceGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "requestID"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "vkRequestID"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v27 = v18;
          v28 = 2112;
          v29 = v19;
          _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_INFO, "VK analyzing: request sent to VKC, requestID (PX: %@, VK: %@)", buf, 0x16u);

        }
        objc_destroyWeak(v25);
        v20 = v23;
      }
      else
      {
        PLVisualIntelligenceGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_ERROR, "VK analyzing: Failed to generate VK image analyze request", buf, 2u);
        }

        v20 = objc_loadWeakRetained(v2);
        objc_msgSend(v20, "_resetCurrentRequestAndDispatchNextRequest");
      }

    }
  }
}

void __51__PXVisualIntelligenceManager__dispatchNextRequest__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CFAbsoluteTime v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  int v12;
  int v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("com.apple.photos.CPAnalytics.visualIntelligenceAnalysisRequested"), *MEMORY[0x1E0D09850]);
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D09828]);

  objc_msgSend(MEMORY[0x1E0D09910], "endSignpost:forEventName:withPayload:", *(_QWORD *)(a1 + 64), *MEMORY[0x1E0D09708], v8);
  objc_msgSend(*(id *)(a1 + 40), "_logAnalysis:request:duration:error:", v5, *(_QWORD *)(a1 + 32), v6, v7);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "currentRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "requestID");
  v13 = objc_msgSend(*(id *)(a1 + 32), "requestID");

  if (v12 == v13)
  {
    v14 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v14, "_processAnalysis:withRequest:error:", v5, *(_QWORD *)(a1 + 32), v6);

    v15 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v15, "_resetCurrentRequestAndDispatchNextRequest");

  }
  else if (!v6)
  {
    PLVisualIntelligenceGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "requestID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "vkRequestID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v17;
      v21 = 2112;
      v22 = v18;
      _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "VK analyzing: requestID (PX: %@, VK: %@), VKC delivers analysis without cancel or error, but no longer needed. Needs to check cancelling or dispatching system", (uint8_t *)&v19, 0x16u);

    }
  }

}

void __52__PXVisualIntelligenceManager_setAnalysisSuspended___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "requests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));

}

void __49__PXVisualIntelligenceManager_cancelRequestByID___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "requests", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v9, "requestID") == *(_DWORD *)(a1 + 40))
        {
          v10 = objc_loadWeakRetained(v2);
          objc_msgSend(v10, "requests");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "removeObject:", v9);

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  v12 = objc_loadWeakRetained(v2);
  objc_msgSend(v12, "currentRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "requestID") == *(_DWORD *)(a1 + 40))
  {
    v14 = objc_loadWeakRetained(v2);
    objc_msgSend(v14, "vkAnalyzer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cancelRequestID:", objc_msgSend(v13, "vkRequestID"));

    v16 = objc_loadWeakRetained(v2);
    objc_msgSend(v16, "_resetCurrentRequestAndDispatchNextRequest");

    PLVisualIntelligenceGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v13, "vkRequestID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v18;
      v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_INFO, "VK analyzing: executing in VKC, cancelRequestID(PX: %@, VK: %@)", buf, 0x16u);

    }
  }

}

void __96__PXVisualIntelligenceManager_requestVKImageAnalysisForAsset_cgImage_orientation_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  _PXVisualIntelligenceRequest *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(v2, "nextRequestID");
  objc_msgSend(v2, "setNextRequestID:", (v3 + 1));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v3;
  v4 = -[_PXVisualIntelligenceRequest initWithAsset:cgImage:orientation:requestID:resultHandler:]([_PXVisualIntelligenceRequest alloc], "initWithAsset:cgImage:orientation:requestID:resultHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(a1 + 48));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 32), "requests");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

}

void __100__PXVisualIntelligenceManager_requestVKImageAnalysisForAsset_pixelBuffer_orientation_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  _PXVisualIntelligenceRequest *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(v2, "nextRequestID");
  objc_msgSend(v2, "setNextRequestID:", (v3 + 1));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v3;
  v4 = -[_PXVisualIntelligenceRequest initWithAsset:pixelBuffer:orientation:requestID:resultHandler:]([_PXVisualIntelligenceRequest alloc], "initWithAsset:pixelBuffer:orientation:requestID:resultHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(a1 + 48));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 32), "requests");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

}

void __82__PXVisualIntelligenceManager_requestVKImageAnalysisForAsset_image_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  _PXVisualIntelligenceRequest *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(v2, "nextRequestID");
  objc_msgSend(v2, "setNextRequestID:", (v3 + 1));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v3;
  v4 = -[_PXVisualIntelligenceRequest initWithAsset:image:requestID:resultHandler:]([_PXVisualIntelligenceRequest alloc], "initWithAsset:image:requestID:resultHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(a1 + 56));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 32), "requests");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

}

void __76__PXVisualIntelligenceManager_requestVKImageAnalysisForAsset_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  _PXVisualIntelligenceRequest *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(v2, "nextRequestID");
  objc_msgSend(v2, "setNextRequestID:", (v3 + 1));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v3;
  v4 = -[_PXVisualIntelligenceRequest initWithAsset:requestID:resultHandler:]([_PXVisualIntelligenceRequest alloc], "initWithAsset:requestID:resultHandler:", *(_QWORD *)(a1 + 40), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(a1 + 48));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 32), "requests");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

}

+ (PXVisualIntelligenceManager)sharedManager
{
  id WeakRetained;

  os_unfair_lock_lock((os_unfair_lock_t)&sharedManager_lock);
  WeakRetained = objc_loadWeakRetained(&sharedManager_weakManager);
  if (!WeakRetained)
  {
    WeakRetained = -[PXVisualIntelligenceManager _init]([PXVisualIntelligenceManager alloc], "_init");
    objc_storeWeak(&sharedManager_weakManager, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedManager_lock);
  return (PXVisualIntelligenceManager *)WeakRetained;
}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXVisualIntelligenceManager.m"), 307, CFSTR("%s is not available as initializer"), "+[PXVisualIntelligenceManager new]");

  abort();
}

+ (BOOL)isLiveTextSupported
{
  return objc_msgSend(a1, "supportedAnalysisTypes") & 1;
}

+ (BOOL)isAppClipSupported
{
  return ((unint64_t)objc_msgSend(a1, "supportedAnalysisTypes") >> 3) & 1;
}

+ (BOOL)isMRCSupported
{
  return ((unint64_t)objc_msgSend(a1, "supportedAnalysisTypes") >> 2) & 1;
}

+ (BOOL)canRequestVKImageAnalysisForAsset:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v9;

  v4 = a3;
  if (objc_msgSend(a1, "supportedAnalysisTypes")
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(v4, "mediaType") == 1)
  {
    v5 = objc_msgSend(v4, "playbackStyle");
    v6 = objc_msgSend(v4, "playbackStyle");
    objc_msgSend(v4, "deferredProcessingNeeded");
    v7 = PHAssetDeferredProcessingInvalidatesContentWhenCompleted();
    if (v5 == 2 || v6 == 5)
      v9 = 0;
    else
      v9 = v7 ^ 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (int)preheatResourcesForSubjectExtractionOfAsset:(id)a3
{
  id v4;
  void *v5;
  char v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CFAbsoluteTime Current;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, void *);
  void *v23;
  id v24;
  double v25;
  double v26;
  CFAbsoluteTime v27;

  v4 = a3;
  if (!objc_msgSend(a1, "canRequestVKImageAnalysisForAsset:", v4))
    goto LABEL_5;
  if (preheatResourcesForSubjectExtractionOfAsset__onceToken != -1)
    dispatch_once(&preheatResourcesForSubjectExtractionOfAsset__onceToken, &__block_literal_global_107_160557);
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", preheatResourcesForSubjectExtractionOfAsset__lastRequestedAssetUUID);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (preheatResourcesForSubjectExtractionOfAsset__lastRequestID)
      objc_msgSend(v8, "cancelImageRequest:");
    objc_msgSend(a1, "_sizeToPreheatResourcesForSubjectExtractionOfAsset:", v4);
    v11 = v10;
    v13 = v12;
    Current = CFAbsoluteTimeGetCurrent();
    v15 = preheatResourcesForSubjectExtractionOfAsset__options;
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __75__PXVisualIntelligenceManager_preheatResourcesForSubjectExtractionOfAsset___block_invoke_2;
    v23 = &unk_1E512FCB8;
    v16 = v4;
    v24 = v16;
    v25 = v11;
    v26 = v13;
    v27 = Current;
    v7 = objc_msgSend(v9, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v16, 0, v15, &v20, v11, v13);
    preheatResourcesForSubjectExtractionOfAsset__lastRequestID = v7;
    objc_msgSend(v16, "uuid", v20, v21, v22, v23);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)preheatResourcesForSubjectExtractionOfAsset__lastRequestedAssetUUID;
    preheatResourcesForSubjectExtractionOfAsset__lastRequestedAssetUUID = v17;

  }
  else
  {
LABEL_5:
    v7 = 0;
  }

  return v7;
}

+ (CGSize)_sizeToPreheatResourcesForSubjectExtractionOfAsset:(id)a3
{
  id v3;
  double v4;
  unint64_t v5;
  double v6;
  double v8;
  float v9;
  float v10;
  double v11;
  NSObject *v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  double v21;
  uint64_t v22;
  CGSize v23;
  CGSize result;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (double)(unint64_t)objc_msgSend(v3, "pixelWidth");
  v5 = objc_msgSend(v3, "pixelHeight");

  v6 = (double)v5;
  if (1.0 - (double)v5 <= 0.00000011920929 && 1.0 - v4 <= 0.00000011920929)
  {
    v8 = v4 * v6;
    v9 = 11500000.0 / (v4 * v6);
    v10 = sqrtf(v9);
    if (v10 < 1.0)
    {
      v11 = v10;
      v4 = floor(v4 * v11);
      v6 = floor(v6 * v11);
      v8 = v6 * v4;
    }
    if (v8 > 11500000.0)
    {
      PXAssertGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v23.width = v4;
        v23.height = v6;
        NSStringFromCGSize(v23);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 134218498;
        v17 = 0x4165EF3C00000000;
        v18 = 2112;
        v19 = v15;
        v20 = 2048;
        v21 = v8;
        _os_log_error_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "calculated size for preheating subject extraction resources is bigger than cap pixels, cap pixels at %.1f, output size: %@ (pixels: %.1f)", (uint8_t *)&v16, 0x20u);

      }
    }
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D820];
    v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v13 = v4;
  v14 = v6;
  result.height = v14;
  result.width = v13;
  return result;
}

void __75__PXVisualIntelligenceManager_preheatResourcesForSubjectExtractionOfAsset___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  CGFloat v8;
  void *v9;
  CFAbsoluteTime v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  CFAbsoluteTime v19;
  __int16 v20;
  void *v21;
  uint64_t v22;
  CGSize v23;

  v22 = *MEMORY[0x1E0C80C00];
  preheatResourcesForSubjectExtractionOfAsset__lastRequestID = 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLVisualIntelligenceGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCGSize(*(CGSize *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "pixelWidth");
    v23.height = (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "pixelHeight");
    v23.width = v8;
    NSStringFromCGSize(v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    objc_msgSend(v4, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544387;
    v13 = v6;
    v14 = 2114;
    v15 = v7;
    v16 = 2114;
    v17 = v9;
    v18 = 2050;
    v19 = v10;
    v20 = 2113;
    v21 = v11;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_INFO, "VK analyzing: got preheat higher res image for asset_uuid (%{public}@), targetSize: %{public}@, originalSize: %{public}@, return in %{public}.3fs, fileURL: %{private}@", (uint8_t *)&v12, 0x34u);

  }
}

uint64_t __75__PXVisualIntelligenceManager_preheatResourcesForSubjectExtractionOfAsset___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  v1 = (void *)preheatResourcesForSubjectExtractionOfAsset__options;
  preheatResourcesForSubjectExtractionOfAsset__options = (uint64_t)v0;

  objc_msgSend((id)preheatResourcesForSubjectExtractionOfAsset__options, "setLoadingMode:", 0x10000);
  objc_msgSend((id)preheatResourcesForSubjectExtractionOfAsset__options, "setDeliveryMode:", 1);
  return objc_msgSend((id)preheatResourcesForSubjectExtractionOfAsset__options, "setNetworkAccessAllowed:", 1);
}

@end
