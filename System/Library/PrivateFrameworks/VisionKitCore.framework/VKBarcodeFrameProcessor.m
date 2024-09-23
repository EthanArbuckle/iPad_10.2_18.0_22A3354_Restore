@implementation VKBarcodeFrameProcessor

- (VKBarcodeFrameProcessor)init
{
  VKBarcodeFrameProcessor *v2;
  VKBarcodeFrameProcessorConfiguration *v3;
  VKBarcodeFrameProcessorConfiguration *config;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  NSMutableArray *recognizedItems;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VKBarcodeFrameProcessor;
  v2 = -[VKFrameProcessor init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VKBarcodeFrameProcessorConfiguration);
    config = v2->_config;
    v2->_config = v3;

    v5 = MEMORY[0x1E0C83FE8];
    v6 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
    *(_OWORD *)v2->_anon_50 = *MEMORY[0x1E0C83FE8];
    *(_OWORD *)&v2->_anon_50[16] = v6;
    *(_OWORD *)&v2->_anon_50[32] = *(_OWORD *)(v5 + 32);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    recognizedItems = v2->_recognizedItems;
    v2->_recognizedItems = (NSMutableArray *)v7;

  }
  return v2;
}

- (VKBarcodeFrameProcessorConfiguration)configuration
{
  void *v3;

  -[VKFrameProcessor lock](self, "lock");
  v3 = (void *)-[VKBarcodeFrameProcessorConfiguration copy](self->_config, "copy");
  -[VKFrameProcessor unlock](self, "unlock");
  return (VKBarcodeFrameProcessorConfiguration *)v3;
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
  -[VKBarcodeFrameProcessor configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v8);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_msgSend(v8, "copy");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__VKBarcodeFrameProcessor_setConfiguration___block_invoke;
    v9[3] = &unk_1E9462B58;
    v9[4] = self;
    v10 = v6;
    v7 = v6;
    vk_performWhileLocked(self, v9);
    -[VKFrameProcessor requestImmediateProcessing](self, "requestImmediateProcessing");

  }
}

void __44__VKBarcodeFrameProcessor_setConfiguration___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
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
  v6[2] = __44__VKBarcodeFrameProcessor_setResultHandler___block_invoke;
  v6[3] = &unk_1E9462BA8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  vk_performWhileLocked(self, v6);

}

void __44__VKBarcodeFrameProcessor_setResultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 136);
  *(_QWORD *)(v3 + 136) = v2;

}

- (void)sendResult:(void *)a1
{
  id v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  void (**v9)(_QWORD, _QWORD);

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "result", "-[VKBarcodeFrameProcessor sendResult:]", 0, 0, CFSTR("Expecting a non-nil result object."));
    objc_msgSend(a1, "resultHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(a1, "resultHandlerQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __38__VKBarcodeFrameProcessor_sendResult___block_invoke;
        v7[3] = &unk_1E9462BD0;
        v9 = v5;
        v8 = v4;
        dispatch_async(v6, v7);

      }
      else
      {
        ((void (**)(_QWORD, void *))v5)[2](v5, v4);
      }

    }
  }

}

uint64_t __38__VKBarcodeFrameProcessor_sendResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)applyWarpTransform:(__n128)a3
{
  VKRecognizedItemFrameProcessorResult *v5;
  _QWORD v6[4];
  __n128 v7;
  __n128 v8;
  __n128 v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__17;
  v16 = __Block_byref_object_dispose__17;
  v17 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__VKBarcodeFrameProcessor_applyWarpTransform___block_invoke;
  v6[3] = &unk_1E9462BF8;
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = a1;
  v11 = &v12;
  vk_performWhileLocked(a1, v6);
  v5 = objc_alloc_init(VKRecognizedItemFrameProcessorResult);
  -[VKRecognizedItemFrameProcessorResult setAllItems:](v5, "setAllItems:", v13[5]);
  -[VKRecognizedItemFrameProcessorResult setAddedItems:](v5, "setAddedItems:", MEMORY[0x1E0C9AA60]);
  -[VKRecognizedItemFrameProcessorResult setUpdatedItems:](v5, "setUpdatedItems:", v13[5]);
  -[VKRecognizedItemFrameProcessorResult setRemovedItems:](v5, "setRemovedItems:", MEMORY[0x1E0C9AA60]);
  -[VKBarcodeFrameProcessor sendResult:](a1, v5);

  _Block_object_dispose(&v12, 8);
}

void __46__VKBarcodeFrameProcessor_applyWarpTransform___block_invoke(uint64_t a1)
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
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
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
  v3 = *(_QWORD *)(a1 + 80) + 80;
  v4 = *(float32x4_t *)v3;
  v5 = *(float32x4_t *)(*(_QWORD *)(a1 + 80) + 96);
  v6 = *(float32x4_t *)(*(_QWORD *)(a1 + 80) + 112);
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
  *(_DWORD *)(v3 + 40) = DWORD2(v11);
  *(_QWORD *)(v3 + 16) = v10;
  *(_QWORD *)(v3 + 32) = v11;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = *(id *)(*(_QWORD *)(a1 + 80) + 128);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16++), "applyHomographyWarpTransform:", *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64), (_QWORD)v20);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v14);
  }

  v17 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 80) + 128), "copy");
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

}

- (__n128)warpTransform
{
  __int128 v3;

  if (!a1)
    return (__n128)0;
  objc_msgSend(a1, "lock");
  v3 = a1[5];
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
    v4[2] = __44__VKBarcodeFrameProcessor_setWarpTransform___block_invoke;
    v4[3] = &unk_1E9462C20;
    v8 = a1;
    v5 = a2;
    v6 = a3;
    v7 = a4;
    vk_performWhileLocked(a1, v4);
  }
}

__n128 __44__VKBarcodeFrameProcessor_setWarpTransform___block_invoke(uint64_t a1)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  v1 = *(_QWORD *)(a1 + 80) + 80;
  v3 = *(_OWORD *)(a1 + 48);
  result = *(__n128 *)(a1 + 64);
  *(_OWORD *)v1 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v1 + 16) = v3;
  *(__n128 *)(v1 + 32) = result;
  return result;
}

- (BOOL)wantsThrottling
{
  return 1;
}

- (void)processFrame:(id)a3
{
  id v4;
  VKBarcodeFrameProcessorConfiguration *v5;
  VKBarcodeFrameProcessorConfiguration *currentConfig;
  id v7;

  v4 = a3;
  -[VKBarcodeFrameProcessor configuration](self, "configuration");
  v5 = (VKBarcodeFrameProcessorConfiguration *)objc_claimAutoreleasedReturnValue();
  currentConfig = self->_currentConfig;
  self->_currentConfig = v5;

  -[VKBarcodeFrameProcessor _performRecognition:]((id *)&self->super.super.isa, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[VKBarcodeFrameProcessor _processRecognitionResults:forFrame:](self, v7, v4);

}

- (id)_performRecognition:(id *)a1
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  id v18;
  _QWORD v19[4];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id *v23;
  NSObject *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = *MEMORY[0x1E0C83FE8];
    v4 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
    v5 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 32);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __44__VKBarcodeFrameProcessor_setWarpTransform___block_invoke;
    v19[3] = &unk_1E9462C20;
    v23 = a1;
    v20 = v3;
    v21 = v4;
    v22 = v5;
    v6 = a2;
    vk_performWhileLocked(a1, v19);
    -[VKBarcodeFrameProcessor _barcodeRequest]((uint64_t)a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "info");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "regionOfInterest");
    objc_msgSend(v7, "setRegionOfInterest:");

    objc_msgSend(v6, "imageRequestHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v9, "performRequests:error:", v10, &v18);
    v11 = v18;

    if (v11)
    {
      v12 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[VKBarcodeFrameProcessor _performRecognition:].cold.1((uint64_t)v11, v12);
      v13 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend(v7, "results");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(a1[18], "isForSingleItem") || !objc_msgSend(v13, "count"))
        goto LABEL_10;
      objc_msgSend(a1[18], "comparisonPoint");
      VKVNRectClosestToPoint(v13, v14, v15);
      v12 = objc_claimAutoreleasedReturnValue();
      v24 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v16 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v16;
    }

LABEL_10:
    return v13;
  }
  return 0;
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
  VKRecognizedBarcode *v14;
  void *v15;
  VKRecognizedBarcode *v16;
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
    v19 = a1[6];
    v20 = a1[5];
    v18 = a1[7];
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
          v14 = [VKRecognizedBarcode alloc];
          objc_msgSend(v6, "info");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[VKRecognizedBarcode initWithFrameInfo:barcodeObservation:](v14, "initWithFrameInfo:barcodeObservation:", v15, v13);

          -[VKRecognizedItem applyHomographyWarpTransform:](v16, "applyHomographyWarpTransform:", *(double *)&v20, *(double *)&v19, *(double *)&v18);
          objc_msgSend(v7, "addObject:", v16);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

    -[VKBarcodeFrameProcessor _performAssociation:](v17, v7);
  }

}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKBarcodeFrameProcessor;
  -[VKFrameProcessor reset](&v3, sel_reset);
  -[VKBarcodeFrameProcessor _removeAllItems]((id *)&self->super.super.isa);
}

- (void)_removeAllItems
{
  VKRecognizedItemFrameProcessorResult *v2;
  id v3;

  if (a1)
  {
    objc_msgSend(a1, "lock");
    v3 = (id)objc_msgSend(a1[16], "copy");
    objc_msgSend(a1[16], "removeAllObjects");
    objc_msgSend(a1, "unlock");
    if (objc_msgSend(v3, "count"))
    {
      v2 = objc_alloc_init(VKRecognizedItemFrameProcessorResult);
      -[VKRecognizedItemFrameProcessorResult setRemovedItems:](v2, "setRemovedItems:", v3);
      -[VKBarcodeFrameProcessor sendResult:](a1, v2);

    }
  }
}

- (id)_barcodeRequest
{
  id v2;
  void *v3;

  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CEDE50]);
    objc_msgSend(*(id *)(a1 + 144), "symbologies");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSymbologies:", v3);

  }
  else
  {
    v2 = 0;
  }
  return v2;
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
    v36 = __Block_byref_object_copy__17;
    v37 = __Block_byref_object_dispose__17;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__17;
    v31 = __Block_byref_object_dispose__17;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__17;
    v25 = __Block_byref_object_dispose__17;
    v26 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__17;
    v19 = __Block_byref_object_dispose__17;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __47__VKBarcodeFrameProcessor__performAssociation___block_invoke;
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
    -[VKBarcodeFrameProcessor sendResult:](a1, v4);

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v33, 8);

  }
}

uint64_t __47__VKBarcodeFrameProcessor__performAssociation___block_invoke(uint64_t a1)
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
        if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "count", (_QWORD)v14))
          goto LABEL_13;
        v8 = 0;
        while (1)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "objectAtIndexedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v9, "shouldAssociateWithItem:", v7) & 1) != 0)
            break;

          if (++v8 >= (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "count"))
            goto LABEL_13;
        }
        if (v9)
        {
          objc_msgSend(v9, "associateWithItem:", v7);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v9);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v9);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "removeObjectAtIndex:", v8);

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

  v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "copy");
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConfig, 0);
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_recognizedItems, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (void)_performRecognition:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2E0D000, a2, OS_LOG_TYPE_ERROR, "Error performing recognition request. %@", (uint8_t *)&v2, 0xCu);
}

@end
