@implementation VKCaptureTextAnalyzer

- (VKCaptureTextAnalyzer)init
{
  VKCaptureTextAnalyzer *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *processingQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VKCaptureTextAnalyzer;
  v2 = -[VKCaptureTextAnalyzer init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.visionkit.cameratextanalysis", v3);
    processingQueue = v2->__processingQueue;
    v2->__processingQueue = (OS_dispatch_queue *)v4;

    v2->_shouldCreateFeedbackProviders = vk_isInternalBuild();
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CEE040], "globalSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "releaseCachedResources");

  v4.receiver = self;
  v4.super_class = (Class)VKCaptureTextAnalyzer;
  -[VKCaptureTextAnalyzer dealloc](&v4, sel_dealloc);
}

- (void)processRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[VKCaptureTextAnalyzer _processingRequest](self, "_processingRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v7)
  {

LABEL_7:
    v6 = v7;
    goto LABEL_8;
  }
  -[VKCaptureTextAnalyzer _pendingRequest](self, "_pendingRequest");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5 != v7)
  {
    -[VKCaptureTextAnalyzer cancelAllRequests](self, "cancelAllRequests");
    if (-[VKCaptureTextAnalyzer _isProcessing](self, "_isProcessing"))
      -[VKCaptureTextAnalyzer _setPendingRequest:](self, "_setPendingRequest:", v7);
    else
      -[VKCaptureTextAnalyzer _enqueueProcessingForRequest:](self, "_enqueueProcessingForRequest:", v7);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)cancelAllRequests
{
  void *v3;
  void *v4;
  id v5;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[VKCaptureTextAnalyzer _pendingRequest](self, "_pendingRequest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VKCaptureTextAnalyzer _processingRequest](self, "_processingRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestDidCancel:", v5);

    -[VKCaptureTextAnalyzer _setPendingRequest:](self, "_setPendingRequest:", 0);
  }
  if (v3)
    -[VKCaptureTextAnalyzer _setProcessingRequest:](self, "_setProcessingRequest:", 0);

}

- (BOOL)_isCanceledRequest:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[VKCaptureTextAnalyzer _pendingRequest](self, "_pendingRequest");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[VKCaptureTextAnalyzer _processingRequest](self, "_processingRequest");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v5 != v4 && v6 != v4;
}

- (void)_enqueueProcessingForRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  VKCaptureTextAnalyzer *v9;

  v4 = a3;
  -[VKCaptureTextAnalyzer _setProcessing:](self, "_setProcessing:", 1);
  -[VKCaptureTextAnalyzer _setProcessingRequest:](self, "_setProcessingRequest:", v4);
  -[VKCaptureTextAnalyzer _processingQueue](self, "_processingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke;
  v7[3] = &unk_1E9462B58;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke(uint64_t a1)
{
  int8x16_t *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  VKCaptureTextDetectionResult *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  VKCaptureTextDetectionResult *v15;
  id v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  VKCaptureTextDetectionResult *v27;
  void *v28;
  VKCaptureTextDetectionResult *v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  NSObject *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int8x16_t v44;
  void *v45;
  id v46;
  int8x16_t v47;
  int8x16_t v48;
  void *v49;
  _QWORD v50[4];
  int8x16_t v51;
  VKCaptureTextDetectionResult *v52;
  id v53;
  id v54;
  id v55;
  _QWORD v56[4];
  int8x16_t v57;
  VKCaptureTextDetectionResult *v58;
  _QWORD v59[5];
  id v60;
  _QWORD v61[4];
  int8x16_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  char v67;
  id v68;
  uint64_t v69;
  const __CFString *v70;
  uint64_t v71;
  id v72;
  uint8_t buf[32];
  uint64_t v74;
  _QWORD v75[3];

  v75[1] = *MEMORY[0x1E0C80C00];
  v2 = (int8x16_t *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "requestHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_documentDetectionRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0;
  objc_msgSend(v3, "performRequests:error:", v5, &v68);
  v6 = v68;

  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke_2;
  v61[3] = &unk_1E9462AB8;
  v47 = *v2;
  v63 = &v64;
  v8 = (id)v47.i64[0];
  v62 = vextq_s8(v47, v47, 8uLL);
  vk_performBlockOnMainThreadAndWait(v61);
  if (v6)
  {
    v9 = 0;
    v10 = 0;
LABEL_3:
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v71 = *MEMORY[0x1E0CB3388];
    v72 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("VKCaptureTextAnalysis"), -1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_4:
    goto LABEL_7;
  }
  if (*((_BYTE *)v65 + 24))
  {
    v9 = 0;
    v10 = 0;
    v13 = 0;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "image");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "size");
  v20 = v19;
  v22 = v21;

  objc_msgSend(*(id *)(a1 + 32), "focusQuad");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "quadMultipliedBySize:", 1.0 / v20, 1.0 / v22);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v49, "quadByFlippingPointsWithSourceFrame:", 0.0, 0.0, 1.0, 1.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "results");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v7;
  v59[1] = 3221225472;
  v59[2] = __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke_3;
  v59[3] = &unk_1E9462AE0;
  v59[4] = *(_QWORD *)(a1 + 40);
  v46 = v24;
  v60 = v46;
  objc_msgSend(v25, "vk_flatMap:", v59);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v26, "count"))
  {
    v10 = 0;
    v9 = 0;
    v6 = 0;
    v33 = -2;
    goto LABEL_20;
  }
  v27 = [VKCaptureTextDetectionResult alloc];
  objc_msgSend(*(id *)(a1 + 32), "image");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "size");
  v29 = -[VKCaptureTextDetectionResult initWithBlocks:imageSize:](v27, "initWithBlocks:imageSize:", v26);

  v56[0] = v7;
  v56[1] = 3221225472;
  v56[2] = __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke_4;
  v56[3] = &unk_1E9462B08;
  v44 = *(int8x16_t *)(a1 + 32);
  v30 = (id)v44.i64[0];
  v57 = vextq_s8(v44, v44, 8uLL);
  v10 = v29;
  v58 = v10;
  vk_performBlockOnMainThread(v56);
  objc_msgSend(*(id *)(a1 + 40), "_documentRecognitionRequestWithInputBlocks:", v26);
  v31 = objc_claimAutoreleasedReturnValue();
  v74 = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  objc_msgSend(v3, "performRequests:error:", v32, &v55);
  v45 = (void *)v31;
  v6 = v55;

  if (!v6)
  {
    objc_msgSend(v45, "results");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v43, "count");
    v35 = v34;
    if (v34 < 2)
    {
      if (!v34)
      {
        v9 = 0;
        v33 = -3;
        goto LABEL_18;
      }
    }
    else
    {
      v36 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke_cold_1(v38, buf, v35, v36);
      }

    }
    v39 = *(void **)(a1 + 40);
    objc_msgSend(v43, "firstObject");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "image");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "size");
    objc_msgSend(v39, "_imageAnalysisForDocument:imageSize:", v40);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v9 = 0;
  v33 = 0;
LABEL_19:

LABEL_20:
  if (v6)
    goto LABEL_3;
  v13 = 0;
  if (!*((_BYTE *)v65 + 24) && !v9)
  {
    v42 = (void *)MEMORY[0x1E0CB35C8];
    v69 = *MEMORY[0x1E0CB2D50];
    v70 = CFSTR("No text was found during detection or recognition.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("VKCaptureTextAnalysis"), v33, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    goto LABEL_4;
  }
LABEL_7:
  v50[0] = v7;
  v50[1] = 3221225472;
  v50[2] = __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke_36;
  v50[3] = &unk_1E9462B30;
  v48 = *(int8x16_t *)(a1 + 32);
  v14 = (id)v48.i64[0];
  v51 = vextq_s8(v48, v48, 8uLL);
  v15 = v10;
  v52 = v15;
  v16 = v9;
  v53 = v16;
  v17 = v13;
  v54 = v17;
  vk_performBlockOnMainThread(v50);

  _Block_object_dispose(&v64, 8);
}

uint64_t __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isCanceledRequest:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_blocksIntersectingQuad:inDocument:", *(_QWORD *)(a1 + 40), a2);
}

void __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke_4(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "_isCanceledRequest:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "request:didDetectTextWithResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

uint64_t __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke_36(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setProcessing:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_didProcessRequest:withDetectionResult:analysis:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_didProcessRequest:(id)a3 withDetectionResult:(id)a4 analysis:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  VKFeedbackProvider *v14;
  VKCaptureTextFeedbackAssetProvider *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (-[VKCaptureTextAnalyzer _isCanceledRequest:](self, "_isCanceledRequest:", v18))
  {
    objc_msgSend(v18, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "requestDidCancel:", v18);
  }
  else
  {
    -[VKCaptureTextAnalyzer _setProcessingRequest:](self, "_setProcessingRequest:", 0);
    if (-[VKCaptureTextAnalyzer shouldCreateFeedbackProviders](self, "shouldCreateFeedbackProviders"))
    {
      v14 = objc_alloc_init(VKFeedbackProvider);
      v15 = -[VKCaptureTextFeedbackAssetProvider initWithRequest:detectionResult:]([VKCaptureTextFeedbackAssetProvider alloc], "initWithRequest:detectionResult:", v18, v10);
      -[VKFeedbackProvider setAssetsProvider:](v14, "setAssetsProvider:", v15);

      -[VKFeedbackProvider setError:](v14, "setError:", v12);
      objc_msgSend(v11, "setFeedbackProvider:", v14);

    }
    objc_msgSend(v18, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;
    if (v12)
      objc_msgSend(v16, "request:didFailWithError:", v18, v12);
    else
      objc_msgSend(v16, "request:didRecgonizeTextWithAnalysis:", v18, v11);
  }

  -[VKCaptureTextAnalyzer _pendingRequest](self, "_pendingRequest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[VKCaptureTextAnalyzer _setPendingRequest:](self, "_setPendingRequest:", 0);
    -[VKCaptureTextAnalyzer _enqueueProcessingForRequest:](self, "_enqueueProcessingForRequest:", v17);
  }

}

- (id)_blocksIntersectingQuad:(id)a3 inDocument:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  VKQuad *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  VKQuad *v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v32 = v6;
  objc_msgSend(v6, "blocksWithTypes:inRegion:", 2, 0.0, 0.0, 1.0, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v13;
          v15 = [VKQuad alloc];
          objc_msgSend(v14, "topLeft");
          v17 = v16;
          v19 = v18;
          objc_msgSend(v14, "topRight");
          v21 = v20;
          v23 = v22;
          objc_msgSend(v14, "bottomLeft");
          v25 = v24;
          v27 = v26;
          objc_msgSend(v14, "bottomRight");
          v30 = -[VKQuad initWithTopLeft:topRight:bottomLeft:bottomRight:](v15, "initWithTopLeft:topRight:bottomLeft:bottomRight:", v17, v19, v21, v23, v25, v27, v28, v29);
          if (-[VKQuad intersectsQuad:](v30, "intersectsQuad:", v5))
            objc_msgSend(v7, "addObject:", v14);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)_imageAnalysisForDocument:(id)a3 imageSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  VKCImageAnalysisResult *v7;
  VKCImageAnalysis *v8;

  if (a3)
  {
    height = a4.height;
    width = a4.width;
    v6 = a3;
    v7 = -[VKCImageAnalysisResult initWithDocumentObservation:mrcDataDetectors:imageSize:]([VKCImageAnalysisResult alloc], "initWithDocumentObservation:mrcDataDetectors:imageSize:", v6, 0, width, height);

    v8 = -[VKImageAnalysis initWithAnalysisResult:]([VKCImageAnalysis alloc], "initWithAnalysisResult:", v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_documentDetectionRequest
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CEDFE0]);
  objc_msgSend(v2, "setDetectionOnly:", 1);
  objc_msgSend(v2, "setUsesLanguageCorrection:", 0);
  objc_msgSend(v2, "setRecognitionLevel:", 0);
  return v2;
}

- (id)_documentRecognitionRequestWithInputBlock:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v9 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  -[VKCaptureTextAnalyzer _documentRecognitionRequestWithInputBlocks:](self, "_documentRecognitionRequestWithInputBlocks:", v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_documentRecognitionRequestWithInputBlocks:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CEDFE0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDetectionOnly:", 0);
  objc_msgSend(v5, "setUsesLanguageCorrection:", 1);
  objc_msgSend(v5, "setRecognitionLevel:", 0);
  objc_msgSend(v5, "setInputTextBlocks:", v4);

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecognitionLanguages:", v6);

  return v5;
}

- (BOOL)shouldCreateFeedbackProviders
{
  return self->_shouldCreateFeedbackProviders;
}

- (void)setShouldCreateFeedbackProviders:(BOOL)a3
{
  self->_shouldCreateFeedbackProviders = a3;
}

- (OS_dispatch_queue)_processingQueue
{
  return self->__processingQueue;
}

- (VKCaptureTextAnalysisRequest)_pendingRequest
{
  return self->__pendingRequest;
}

- (void)_setPendingRequest:(id)a3
{
  objc_storeStrong((id *)&self->__pendingRequest, a3);
}

- (VKCaptureTextAnalysisRequest)_processingRequest
{
  return self->__processingRequest;
}

- (void)_setProcessingRequest:(id)a3
{
  objc_storeStrong((id *)&self->__processingRequest, a3);
}

- (BOOL)_isProcessing
{
  return self->__processing;
}

- (void)_setProcessing:(BOOL)a3
{
  self->__processing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__processingRequest, 0);
  objc_storeStrong((id *)&self->__pendingRequest, 0);
  objc_storeStrong((id *)&self->__processingQueue, 0);
}

void __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke_cold_1(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = a3;
  _os_log_error_impl(&dword_1D2E0D000, log, OS_LOG_TYPE_ERROR, "%@: unexpectedly recognized %lu documents; will use arbitrary document.",
    buf,
    0x16u);

}

@end
