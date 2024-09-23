@implementation VKTextWithTrackingFrameProcessor

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
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "error == ((void *)0)", "+[VKTextWithTrackingFrameProcessor supportedRecognitionLanguages]", 0, 0, CFSTR("Error retrieving supportedRecognitionLanguages: %@"), v4);

  return (NSArray *)v3;
}

- (VKTextWithTrackingFrameProcessor)init
{
  VKTextWithTrackingFrameProcessor *v2;
  VKTextFrameProcessorConfiguration *v3;
  VKTextFrameProcessorConfiguration *config;
  uint64_t v5;
  NSMutableOrderedSet *recognizedItems;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VKTextWithTrackingFrameProcessor;
  v2 = -[VKFrameProcessor init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VKTextFrameProcessorConfiguration);
    config = v2->_config;
    v2->_config = v3;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v5 = objc_claimAutoreleasedReturnValue();
    recognizedItems = v2->_recognizedItems;
    v2->_recognizedItems = (NSMutableOrderedSet *)v5;

  }
  return v2;
}

- (BOOL)wantsThrottling
{
  return 0;
}

- (void)reset
{
  VNRecognizeDocumentsRequest *request;
  void *v4;
  VKRecognizedItemFrameProcessorResult *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VKTextWithTrackingFrameProcessor;
  -[VKFrameProcessor reset](&v6, sel_reset);
  -[VKFrameProcessor lock](self, "lock");
  request = self->_request;
  self->_request = 0;

  v4 = (void *)-[NSMutableOrderedSet copy](self->_recognizedItems, "copy");
  -[NSMutableOrderedSet removeAllObjects](self->_recognizedItems, "removeAllObjects");
  -[VKFrameProcessor unlock](self, "unlock");
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(VKRecognizedItemFrameProcessorResult);
    -[VKRecognizedItemFrameProcessorResult setRemovedItems:](v5, "setRemovedItems:", v4);
    -[VKTextWithTrackingFrameProcessor sendResult:](self, v5);

  }
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
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "result", "-[VKTextWithTrackingFrameProcessor sendResult:]", 0, 0, CFSTR("Expecting a non-nil result object."));
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
        v7[2] = __47__VKTextWithTrackingFrameProcessor_sendResult___block_invoke;
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
  -[VKTextWithTrackingFrameProcessor configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v8);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_msgSend(v8, "copy");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__VKTextWithTrackingFrameProcessor_setConfiguration___block_invoke;
    v9[3] = &unk_1E9462B58;
    v9[4] = self;
    v10 = v6;
    v7 = v6;
    vk_performWhileLocked(self, v9);
    -[VKTextWithTrackingFrameProcessor reset](self, "reset");
    -[VKFrameProcessor requestImmediateProcessing](self, "requestImmediateProcessing");

  }
}

void __53__VKTextWithTrackingFrameProcessor_setConfiguration___block_invoke(uint64_t a1)
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
  v6[2] = __53__VKTextWithTrackingFrameProcessor_setResultHandler___block_invoke;
  v6[3] = &unk_1E9462BA8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  vk_performWhileLocked(self, v6);

}

void __53__VKTextWithTrackingFrameProcessor_setResultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 96);
  *(_QWORD *)(v3 + 96) = v2;

}

uint64_t __47__VKTextWithTrackingFrameProcessor_sendResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_createRequest
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;

  if (!a1)
    return 0;
  v2 = objc_alloc(MEMORY[0x1E0CEDFE0]);
  v3 = objc_msgSend(*(id *)(a1 + 112), "documentBlockType");
  v12 = *MEMORY[0x1E0CA2E68];
  v13 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v4 = (void *)objc_msgSend(v2, "initWithFrameAnalysisSpacing:trackingLevelBlockType:completionHandler:", &v12, v3, 0);
  objc_msgSend(v4, "setUsesAlternateLineGrouping:", objc_msgSend(*(id *)(a1 + 112), "usesAlternateLineGrouping"));
  objc_msgSend(v4, "setUsesLanguageDetection:", objc_msgSend(*(id *)(a1 + 112), "usesLanguageDetection"));
  objc_msgSend(v4, "setUsesLanguageCorrection:", 1);
  objc_msgSend(v4, "setRecognitionLevel:", 0);
  objc_msgSend(*(id *)(a1 + 112), "customWords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 112), "customWords");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCustomWords:", v7);

  }
  objc_msgSend(*(id *)(a1 + 112), "recognitionLanguages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8 || !objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  objc_msgSend(v4, "setRecognitionLanguages:", v9);

  return v4;
}

- (void)processFrame:(id)a3
{
  id v4;
  VKTextFrameProcessorConfiguration *v5;
  VKTextFrameProcessorConfiguration *currentConfig;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[VKTextWithTrackingFrameProcessor configuration](self, "configuration");
  v5 = (VKTextFrameProcessorConfiguration *)objc_claimAutoreleasedReturnValue();
  currentConfig = self->_currentConfig;
  self->_currentConfig = v5;

  self->_dataType = -[VKTextFrameProcessorConfiguration dataType](self->_currentConfig, "dataType");
  -[VKTextWithTrackingFrameProcessor _performRecognitionAndTracking:](self, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__VKTextWithTrackingFrameProcessor_processFrame___block_invoke;
  v10[3] = &unk_1E9462C70;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v9, "vk_compactMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKTextWithTrackingFrameProcessor _processResults:](self, v8);

}

- (_QWORD)_performRecognitionAndTracking:(_QWORD *)a1
{
  _QWORD *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v14;
  _QWORD v15[2];

  v2 = a1;
  v15[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = a2;
    objc_msgSend(v3, "imageRequestHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lock");
    v5 = (void *)v2[13];
    if (!v5)
    {
      -[VKTextWithTrackingFrameProcessor _createRequest]((uint64_t)v2);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v2[13];
      v2[13] = v6;

      v5 = (void *)v2[13];
    }
    v8 = v5;
    objc_msgSend(v2, "unlock");
    objc_msgSend(v3, "info");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "regionOfInterest");
    objc_msgSend(v8, "setRegionOfInterest:");

    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v4, "performRequests:error:", v10, &v14);
    v11 = v14;

    objc_msgSend(v8, "results");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKTextWithTrackingFrameProcessor _filterDocuments:]((uint64_t)v2, v12);
    v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

VKRecognizedText *__49__VKTextWithTrackingFrameProcessor_processFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  VKRecognizedText *v4;
  void *v5;
  VKRecognizedText *v6;

  v3 = a2;
  v4 = [VKRecognizedText alloc];
  objc_msgSend(*(id *)(a1 + 32), "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VKRecognizedText initWithFrameInfo:textBlockObservation:](v4, "initWithFrameInfo:textBlockObservation:", v5, v3);

  return v6;
}

- (void)_processResults:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  VKRecognizedItemFrameProcessorResult *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__1;
    v19 = __Block_byref_object_dispose__1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__VKTextWithTrackingFrameProcessor__processResults___block_invoke;
    v10[3] = &unk_1E9462C98;
    v10[4] = a1;
    v6 = v3;
    v11 = v6;
    v7 = v5;
    v12 = v7;
    v8 = v4;
    v13 = v8;
    v14 = &v15;
    vk_performWhileLocked(a1, v10);
    v9 = objc_alloc_init(VKRecognizedItemFrameProcessorResult);
    -[VKRecognizedItemFrameProcessorResult setAllItems:](v9, "setAllItems:", v6);
    -[VKRecognizedItemFrameProcessorResult setAddedItems:](v9, "setAddedItems:", v8);
    -[VKRecognizedItemFrameProcessorResult setUpdatedItems:](v9, "setUpdatedItems:", v7);
    -[VKRecognizedItemFrameProcessorResult setRemovedItems:](v9, "setRemovedItems:", v16[5]);
    -[VKTextWithTrackingFrameProcessor sendResult:](a1, v9);

    _Block_object_dispose(&v15, 8);
  }

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
      v6 = *(_QWORD *)(a1 + 120);
      if (v6)
        _FilterByDataType(v4, v6);
      else
        _FilterByBlockType(v4, objc_msgSend(*(id *)(a1 + 112), "documentBlockType"));
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    if (objc_msgSend(*(id *)(a1 + 112), "isForSingleItem") && objc_msgSend(v5, "count"))
    {
      objc_msgSend(*(id *)(a1 + 112), "comparisonPoint");
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

void __52__VKTextWithTrackingFrameProcessor__processResults___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithOrderedSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", *(_QWORD *)(a1 + 40));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v2, "containsObject:", v9, (_QWORD)v15))
        {
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
          objc_msgSend(v2, "removeObject:", v9);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  objc_msgSend(v2, "array");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 88);
  *(_QWORD *)(v13 + 88) = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConfig, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_recognizedItems, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
