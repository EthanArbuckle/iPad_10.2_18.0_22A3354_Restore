@implementation VKTextFrameProcessor

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
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "error == ((void *)0)", "+[VKTextFrameProcessor supportedRecognitionLanguages]", 0, 0, CFSTR("Error retrieving supportedRecognitionLanguages: %@"), v4);

  return (NSArray *)v3;
}

- (VKTextFrameProcessor)init
{
  VKTextFrameProcessor *v2;
  VKTextFrameProcessorConfiguration *v3;
  VKTextFrameProcessorConfiguration *config;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  NSMutableArray *recognizedItems;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VKTextFrameProcessor;
  v2 = -[VKFrameProcessor init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VKTextFrameProcessorConfiguration);
    config = v2->_config;
    v2->_config = v3;

    v5 = MEMORY[0x1E0C83FE8];
    v6 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
    *(_OWORD *)v2->_anon_60 = *MEMORY[0x1E0C83FE8];
    *(_OWORD *)&v2->_anon_60[16] = v6;
    *(_OWORD *)&v2->_anon_60[32] = *(_OWORD *)(v5 + 32);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    recognizedItems = v2->_recognizedItems;
    v2->_recognizedItems = (NSMutableArray *)v7;

  }
  return v2;
}

- (VKTextFrameProcessorConfiguration)configuration
{
  void *v3;

  -[VKFrameProcessor lock](self, "lock");
  v3 = (void *)-[VKTextFrameProcessorConfiguration copy](self->_config, "copy");
  -[VKFrameProcessor unlock](self, "unlock");
  return (VKTextFrameProcessorConfiguration *)v3;
}

- (void)setConfiguration:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v8 = a3;
  -[VKTextFrameProcessor configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v8);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_msgSend(v8, "copy");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__VKTextFrameProcessor_setConfiguration___block_invoke;
    v9[3] = &unk_1E9462B58;
    v9[4] = self;
    v10 = v6;
    v7 = v6;
    vk_performWhileLocked(self, v9);
    -[VKFrameProcessor requestImmediateProcessing](self, "requestImmediateProcessing");

  }
}

void __41__VKTextFrameProcessor_setConfiguration___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
}

- (id)resultHandler
{
  void *v3;
  void *v4;

  -[VKFrameProcessor lock](self, "lock");
  v3 = (void *)MEMORY[0x1D8249E20](self->_resultHandler);
  -[VKFrameProcessor unlock](self, "unlock");
  v4 = (void *)MEMORY[0x1D8249E20](v3);

  return v4;
}

- (void)setResultHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__VKTextFrameProcessor_setResultHandler___block_invoke;
  v6[3] = &unk_1E9462BA8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  vk_performWhileLocked(self, v6);

}

void __41__VKTextFrameProcessor_setResultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 152);
  *(_QWORD *)(v3 + 152) = v2;

}

- (void)sendResult:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  void (**v10)(_QWORD, _QWORD);

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "allItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setWantsThrottling:", objc_msgSend(v5, "count") != 0);

    if (!v4)
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "result", "-[VKTextFrameProcessor sendResult:]", 0, 0, CFSTR("Expecting a non-nil result object."));
    objc_msgSend(a1, "resultHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(a1, "resultHandlerQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __35__VKTextFrameProcessor_sendResult___block_invoke;
        v8[3] = &unk_1E9462BD0;
        v10 = v6;
        v9 = v4;
        dispatch_async(v7, v8);

      }
      else
      {
        ((void (**)(_QWORD, void *))v6)[2](v6, v4);
      }

    }
  }

}

uint64_t __35__VKTextFrameProcessor_sendResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)applyHomographyWarpTransform:(__n128)a3
{
  id v5;
  VKRecognizedItemFrameProcessorResult *v6;
  _QWORD v7[4];
  __n128 v8;
  __n128 v9;
  __n128 v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__VKTextFrameProcessor_applyHomographyWarpTransform___block_invoke;
  v7[3] = &unk_1E9462BF8;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a1;
  v12 = &v13;
  vk_performWhileLocked(a1, v7);
  v5 = (id)v14[5];
  v6 = objc_alloc_init(VKRecognizedItemFrameProcessorResult);
  -[VKRecognizedItemFrameProcessorResult setAllItems:](v6, "setAllItems:", v5);
  -[VKRecognizedItemFrameProcessorResult setUpdatedItems:](v6, "setUpdatedItems:", v5);
  -[VKTextFrameProcessor sendResult:](a1, v6);

  _Block_object_dispose(&v13, 8);
}

void __53__VKTextFrameProcessor_applyHomographyWarpTransform___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[3];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v2 = 0;
  v29 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 80) + 96;
  v4 = *(float32x4_t *)v3;
  v5 = *(float32x4_t *)(*(_QWORD *)(a1 + 80) + 112);
  v6 = *(float32x4_t *)(*(_QWORD *)(a1 + 80) + 128);
  v7 = *(_OWORD *)(a1 + 48);
  v8 = *(_OWORD *)(a1 + 64);
  v24[0] = *(_OWORD *)(a1 + 32);
  v24[1] = v7;
  v24[2] = v8;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  do
  {
    *(__int128 *)((char *)&v25 + v2 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(v24[v2])), v5, *(float32x2_t *)&v24[v2], 1), v6, (float32x4_t)v24[v2], 2);
    ++v2;
  }
  while (v2 != 3);
  v9 = v25;
  v10 = v26;
  v11 = v27;
  *(_DWORD *)(v3 + 8) = DWORD2(v25);
  *(_QWORD *)v3 = v9;
  *(_DWORD *)(v3 + 24) = DWORD2(v10);
  *(_QWORD *)(v3 + 16) = v10;
  *(_DWORD *)(v3 + 40) = DWORD2(v11);
  *(_QWORD *)(v3 + 32) = v11;
  v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 80) + 144), "copy");
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v19++), "applyHomographyWarpTransform:", *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64), (_QWORD)v20);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

}

- (__n128)warpTransform
{
  __int128 v3;

  if (!a1)
    return (__n128)0;
  objc_msgSend(a1, "lock");
  v3 = a1[6];
  objc_msgSend(a1, "unlock");
  return (__n128)v3;
}

- (void)setWarpTransform:(__n128)a3
{
  _QWORD v4[4];
  __n128 v5;
  __n128 v6;
  __n128 v7;
  void *v8;

  if (a1)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __41__VKTextFrameProcessor_setWarpTransform___block_invoke;
    v4[3] = &unk_1E9462C20;
    v8 = a1;
    v5 = a2;
    v6 = a3;
    v7 = a4;
    vk_performWhileLocked(a1, v4);
  }
}

__n128 __41__VKTextFrameProcessor_setWarpTransform___block_invoke(uint64_t a1)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  v1 = *(_QWORD *)(a1 + 80) + 96;
  v3 = *(_OWORD *)(a1 + 48);
  result = *(__n128 *)(a1 + 64);
  *(_OWORD *)v1 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v1 + 16) = v3;
  *(__n128 *)(v1 + 32) = result;
  return result;
}

- (BOOL)wantsThrottling
{
  BOOL wantsThrottling;

  -[VKFrameProcessor lock](self, "lock");
  wantsThrottling = self->_wantsThrottling;
  -[VKFrameProcessor unlock](self, "unlock");
  return wantsThrottling;
}

- (void)setWantsThrottling:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__VKTextFrameProcessor_setWantsThrottling___block_invoke;
  v3[3] = &unk_1E9462568;
  v3[4] = self;
  v4 = a3;
  vk_performWhileLocked(self, v3);
}

uint64_t __43__VKTextFrameProcessor_setWantsThrottling___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 72) = *(_BYTE *)(result + 40);
  return result;
}

- (void)processFrame:(id)a3
{
  id v4;
  VKTextFrameProcessorConfiguration *v5;
  VKTextFrameProcessorConfiguration *currentConfig;
  id v7;

  v4 = a3;
  -[VKTextFrameProcessor configuration](self, "configuration");
  v5 = (VKTextFrameProcessorConfiguration *)objc_claimAutoreleasedReturnValue();
  currentConfig = self->_currentConfig;
  self->_currentConfig = v5;

  self->_dataType = -[VKTextFrameProcessorConfiguration dataType](self->_currentConfig, "dataType");
  -[VKTextFrameProcessor _performGatingAndRecognition:]((id *)&self->super.super.isa, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[VKTextFrameProcessor _processRecognitionResults:forFrame:](self, v7, v4);

}

- (id)_performGatingAndRecognition:(id *)a1
{
  id v3;
  void *v4;

  v3 = a2;
  if (a1)
  {
    if (objc_msgSend(a1[20], "shouldPerformTextDetectionGating"))
    {
      -[VKTextFrameProcessor _performDetection:](a1, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
        a1 = (id *)MEMORY[0x1E0C9AA60];
        goto LABEL_7;
      }
    }
    else
    {
      v4 = 0;
    }
    -[VKTextFrameProcessor _performRecognition:inputObservation:](a1, v3, v4);
    a1 = (id *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:

  return a1;
}

- (void)_processRecognitionResults:(void *)a3 forFrame:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  VKRecognizedText *v14;
  void *v15;
  VKRecognizedText *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1 && (objc_msgSend(a1, "isCancelled") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "lock");
    v19 = a1[7];
    v20 = a1[6];
    v18 = a1[8];
    v17 = a1;
    objc_msgSend(a1, "unlock");
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          v14 = [VKRecognizedText alloc];
          objc_msgSend(v6, "info");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[VKRecognizedText initWithFrameInfo:textBlockObservation:](v14, "initWithFrameInfo:textBlockObservation:", v15, v13);

          -[VKRecognizedItem applyHomographyWarpTransform:](v16, "applyHomographyWarpTransform:", *(double *)&v20, *(double *)&v19, *(double *)&v18);
          objc_msgSend(v7, "addObject:", v16);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

    -[VKTextFrameProcessor _performAssociation:](v17, v7);
  }

}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKTextFrameProcessor;
  -[VKFrameProcessor reset](&v3, sel_reset);
  -[VKTextFrameProcessor _removeAllItems]((id *)&self->super.super.isa);
}

- (void)_removeAllItems
{
  VKRecognizedItemFrameProcessorResult *v2;
  id v3;

  if (a1)
  {
    objc_msgSend(a1, "lock");
    v3 = (id)objc_msgSend(a1[18], "copy");
    objc_msgSend(a1[18], "removeAllObjects");
    objc_msgSend(a1, "unlock");
    if (objc_msgSend(v3, "count"))
    {
      v2 = objc_alloc_init(VKRecognizedItemFrameProcessorResult);
      -[VKRecognizedItemFrameProcessorResult setRemovedItems:](v2, "setRemovedItems:", v3);
      -[VKTextFrameProcessor sendResult:](a1, v2);

    }
  }
}

- (id)_performDetection:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v34 = v3;
  if (a1)
  {
    v4 = v3;
    objc_msgSend(a1, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "shouldPerformTextDetectionGating") & 1) == 0)
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "configuration.shouldPerformTextDetectionGating", "-[VKTextFrameProcessor _performDetection:]", 0, 0, CFSTR("Running detection when the configuration does not support it."));
    v6 = objc_alloc_init(MEMORY[0x1E0CEDFE0]);
    objc_msgSend(v6, "setUsesAlternateLineGrouping:", objc_msgSend(v5, "usesAlternateLineGrouping"));
    objc_msgSend(v6, "setMaximumCandidateCount:", 1);
    objc_msgSend(v6, "setDetectionOnly:", 1);
    objc_msgSend(v4, "info");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "regionOfInterest");
    objc_msgSend(v6, "setRegionOfInterest:");

    objc_msgSend(v4, "imageRequestHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v33 = v8;
    objc_msgSend(v8, "performRequests:error:", v9, &v35);
    v10 = v35;

    if (v10)
    {
      v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[VKTextFrameProcessor _performDetection:].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

    }
    objc_msgSend(v5, "comparisonPoint");
    v19 = v18;
    v21 = v20;
    v22 = objc_msgSend(v5, "documentBlockType");
    objc_msgSend(v6, "results");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v23, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v25 = v23;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v37;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v37 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v29), "closestTextBlockOfTypes:toPoint:maximumPixelDistance:", v22, 10000, v19, v21);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
            objc_msgSend(v24, "addObject:", v30);

          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v27);
    }

    VKVNRectClosestToPoint(v24, v19, v21);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)_performRecognition:(void *)a3 inputObservation:
{
  id v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  _QWORD v24[4];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _QWORD v29[2];

  v3 = a1;
  v29[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5 = *MEMORY[0x1E0C83FE8];
    v6 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
    v7 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 32);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __41__VKTextFrameProcessor_setWarpTransform___block_invoke;
    v24[3] = &unk_1E9462C20;
    v28 = a1;
    v25 = v5;
    v26 = v6;
    v27 = v7;
    v8 = a3;
    v9 = a2;
    vk_performWhileLocked(v3, v24);
    -[VKTextFrameProcessor _documentRequestForInputObservation:]((uint64_t)v3, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "info");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "regionOfInterest");
    objc_msgSend(v10, "setRegionOfInterest:");

    objc_msgSend(v9, "imageRequestHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v29[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v12, "performRequests:error:", v13, &v23);
    v14 = v23;

    if (v14)
    {
      v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[VKTextFrameProcessor _performRecognition:inputObservation:].cold.1((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);
      v3 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend(v10, "results");
      v15 = objc_claimAutoreleasedReturnValue();
      -[VKTextFrameProcessor _filterDocuments:]((uint64_t)v3, v15);
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v3;
}

- (id)_documentRequestForInputObservation:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CEDFE0]);
    objc_msgSend(v4, "setUsesAlternateLineGrouping:", objc_msgSend(*(id *)(a1 + 160), "usesAlternateLineGrouping"));
    objc_msgSend(v4, "setMaximumCandidateCount:", 1);
    objc_msgSend(v4, "setDetectionOnly:", 0);
    objc_msgSend(v4, "setUsesLanguageDetection:", objc_msgSend(*(id *)(a1 + 160), "usesLanguageDetection"));
    objc_msgSend(v4, "setUsesLanguageCorrection:", 1);
    objc_msgSend(v4, "setRecognitionLevel:", 0);
    objc_msgSend(*(id *)(a1 + 160), "customWords");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 160), "customWords");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCustomWords:", v7);

    }
    objc_msgSend(*(id *)(a1 + 160), "recognitionLanguages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8 || !objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
    objc_msgSend(v4, "setRecognitionLanguages:", v9);
    if (v3)
    {
      v13[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setInputTextBlocks:", v11);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_filterDocuments:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v6 = *(_QWORD *)(a1 + 168);
      if (v6)
        _FilterByDataType(v4, v6);
      else
        _FilterByBlockType(v4, objc_msgSend(*(id *)(a1 + 160), "documentBlockType"));
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    if (objc_msgSend(*(id *)(a1 + 160), "isForSingleItem") && objc_msgSend(v5, "count"))
    {
      objc_msgSend(*(id *)(a1 + 160), "comparisonPoint");
      VKVNRectClosestToPoint(v5, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v11 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v11;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_performAssociation:(void *)a1
{
  id v3;
  VKRecognizedItemFrameProcessorResult *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  void *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v3 = a2;
  if (a1)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__1;
    v37 = __Block_byref_object_dispose__1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__1;
    v31 = __Block_byref_object_dispose__1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__1;
    v25 = __Block_byref_object_dispose__1;
    v26 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__1;
    v19 = __Block_byref_object_dispose__1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __44__VKTextFrameProcessor__performAssociation___block_invoke;
    v8 = &unk_1E9462C48;
    v9 = v3;
    v10 = a1;
    v11 = &v27;
    v12 = &v15;
    v13 = &v33;
    v14 = &v21;
    vk_performWhileLocked(a1, &v5);
    v4 = objc_alloc_init(VKRecognizedItemFrameProcessorResult);
    -[VKRecognizedItemFrameProcessorResult setAllItems:](v4, "setAllItems:", v16[5], v5, v6, v7, v8);
    -[VKRecognizedItemFrameProcessorResult setAddedItems:](v4, "setAddedItems:", v34[5]);
    -[VKRecognizedItemFrameProcessorResult setUpdatedItems:](v4, "setUpdatedItems:", v28[5]);
    -[VKRecognizedItemFrameProcessorResult setRemovedItems:](v4, "setRemovedItems:", v22[5]);
    -[VKTextFrameProcessor sendResult:](a1, v4);

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v33, 8);

  }
}

uint64_t __44__VKTextFrameProcessor__performAssociation___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v6);
        if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "count", (_QWORD)v14))
          goto LABEL_13;
        v8 = 0;
        while (1)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "objectAtIndexedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v9, "shouldAssociateWithItem:", v7) & 1) != 0)
            break;

          if (++v8 >= (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "count"))
            goto LABEL_13;
        }
        if (v9)
        {
          objc_msgSend(v9, "associateWithItem:", v7);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v9);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v9);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "removeObjectAtIndex:", v8);

        }
        else
        {
LABEL_13:
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v7);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v7);
        }
        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "copy");
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConfig, 0);
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_recognizedItems, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (void)_performDetection:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2E0D000, a2, a3, "Error performing detection request. %@", a5, a6, a7, a8, 2u);
}

- (void)_performRecognition:(uint64_t)a3 inputObservation:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2E0D000, a2, a3, "Error performing recognition request. %@", a5, a6, a7, a8, 2u);
}

@end
