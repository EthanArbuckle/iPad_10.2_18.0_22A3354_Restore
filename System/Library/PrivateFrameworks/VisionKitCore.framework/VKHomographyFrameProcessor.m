@implementation VKHomographyFrameProcessor

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
  v6[2] = __47__VKHomographyFrameProcessor_setResultHandler___block_invoke;
  v6[3] = &unk_1E9462BA8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  vk_performWhileLocked(self, v6);

}

void __47__VKHomographyFrameProcessor_setResultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

}

- (void)sendResult:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  void (**v9)(_QWORD, _QWORD);

  v4 = a3;
  if (!v4)
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "result", "-[VKHomographyFrameProcessor sendResult:]", 0, 0, CFSTR("Expecting a non-nil result object."));
  -[VKHomographyFrameProcessor resultHandler](self, "resultHandler");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[VKFrameProcessor resultHandlerQueue](self, "resultHandlerQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __41__VKHomographyFrameProcessor_sendResult___block_invoke;
      v7[3] = &unk_1E9462BD0;
      v9 = v5;
      v8 = v4;
      dispatch_async(v6, v7);

    }
    else
    {
      ((void (**)(_QWORD, id))v5)[2](v5, v4);
    }

  }
}

uint64_t __41__VKHomographyFrameProcessor_sendResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)processFrame:(id)a3
{
  id v4;
  id v5;
  VNTrackHomographyRequest *v6;
  VNTrackHomographyRequest *homographyRequest;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  VKHomographyFrameProcessorResult *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  __int128 v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_homographyRequest)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEE050]);
    v24 = *MEMORY[0x1E0CA2E18];
    v25 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v6 = (VNTrackHomographyRequest *)objc_msgSend(v5, "initWithFrameAnalysisSpacing:completionHandler:", &v24, 0);
    homographyRequest = self->_homographyRequest;
    self->_homographyRequest = v6;

  }
  objc_msgSend(v4, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "regionOfInterest");
  -[VNTrackHomographyRequest setRegionOfInterest:](self->_homographyRequest, "setRegionOfInterest:");

  objc_msgSend(v4, "imageRequestHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = self->_homographyRequest;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v9, "performRequests:error:", v10, &v23);
  v11 = v23;

  if (v11)
  {
    v12 = (VKHomographyFrameProcessorResult *)os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
    if (os_log_type_enabled(&v12->super.super, OS_LOG_TYPE_ERROR))
      -[VKBarcodeFrameProcessor _performRecognition:].cold.1((uint64_t)v11, &v12->super.super);
    goto LABEL_6;
  }
  if (!-[VKFrameProcessor isCancelled](self, "isCancelled"))
  {
    -[VNTrackHomographyRequest results](self->_homographyRequest, "results");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      -[VNTrackHomographyRequest results](self->_homographyRequest, "results");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "warpTransform");
      v21 = v18;
      v22 = v17;
      v20 = v19;

      v12 = objc_alloc_init(VKHomographyFrameProcessorResult);
      -[VKHomographyFrameProcessorResult setWarpTransform:](v12, "setWarpTransform:", v22, v21, v20);
      -[VKHomographyFrameProcessor sendResult:](self, "sendResult:", v12);
LABEL_6:

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_homographyRequest, 0);
}

@end
