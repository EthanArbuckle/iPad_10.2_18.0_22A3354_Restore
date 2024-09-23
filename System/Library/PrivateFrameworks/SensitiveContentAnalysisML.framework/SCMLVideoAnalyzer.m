@implementation SCMLVideoAnalyzer

- (SCMLVideoAnalyzer)initWithMLHandler:(id)a3
{
  id v5;
  SCMLVideoAnalyzer *v6;
  SCMLVideoAnalyzer *v7;
  uint64_t v8;
  SCMLImageAnalyzer *imageAnalyzer;
  SCMLVideoFrameProcessor *v10;
  void *v11;
  uint64_t v12;
  SCMLVideoFrameProcessor *frameProcessor;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SCMLVideoAnalyzer;
  v6 = -[SCMLVideoAnalyzer init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_handler, a3);
    objc_msgSend(v5, "imageAnalyzer");
    v8 = objc_claimAutoreleasedReturnValue();
    imageAnalyzer = v7->_imageAnalyzer;
    v7->_imageAnalyzer = (SCMLImageAnalyzer *)v8;

    v10 = [SCMLVideoFrameProcessor alloc];
    objc_msgSend(v5, "imageAnalyzer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SCMLVideoFrameProcessor initWithImageAnalyzer:](v10, "initWithImageAnalyzer:", v11);
    frameProcessor = v7->_frameProcessor;
    v7->_frameProcessor = (SCMLVideoFrameProcessor *)v12;

  }
  return v7;
}

- (id)analyzeVideoURL:(id)a3 config:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD block[4];
  id v19;
  SCMLVideoAnalyzer *v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v8 = a3;
  v9 = a4;
  if (a5)
    *a5 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3;
  v34 = __Block_byref_object_dispose__3;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  v29 = 0;
  v10 = (void *)MEMORY[0x249545300]();
  -[SCMLVideoAnalyzer handler](self, "handler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clientQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__SCMLVideoAnalyzer_analyzeVideoURL_config_error___block_invoke;
  block[3] = &unk_2516E4AF0;
  v13 = v9;
  v19 = v13;
  v20 = self;
  v14 = v8;
  v21 = v14;
  v22 = &v24;
  v23 = &v30;
  dispatch_sync(v12, block);

  objc_autoreleasePoolPop(v10);
  v15 = (void *)v25[5];
  if (v15)
  {
    v16 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v15);
  }
  else
  {
    v16 = (id)v31[5];
  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v16;
}

void __50__SCMLVideoAnalyzer_analyzeVideoURL_config_error___block_invoke(uint64_t a1)
{
  SCMLVideoDecoder *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id obj;

  v2 = -[SCMLVideoDecoder initWithConfig:]([SCMLVideoDecoder alloc], "initWithConfig:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "frameProcessor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAnalysisWithConfig:", *(_QWORD *)(a1 + 32));

  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v5 + 40);
  v6 = -[SCMLVideoDecoder startDecodingVideoURL:error:](v2, "startDecodingVideoURL:error:", v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6)
  {
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "sensitive") & 1) == 0)
    {
      v7 = 0;
      do
      {
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v23 = *(id *)(v8 + 40);
        -[SCMLVideoDecoder nextFrameWithError:](v2, "nextFrameWithError:", &v23);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(v8 + 40), v23);

        if (!v9)
          break;
        objc_msgSend(*(id *)(a1 + 40), "frameProcessor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "pushFrame:", v9);

        objc_msgSend(*(id *)(a1 + 40), "frameProcessor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v22 = *(id *)(v12 + 40);
        objc_msgSend(v11, "analyze:", &v22);
        v13 = objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(v12 + 40), v22);
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v15 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = v13;

        v7 = v9;
      }
      while (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "sensitive"));

    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
      && (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "sensitive") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "frameProcessor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v21 = *(id *)(v17 + 40);
      objc_msgSend(v16, "finalizeAnalysis:", &v21);
      v18 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v17 + 40), v21);
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

    }
  }

}

- (void)startAnalysisWithConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x249545300]();
  -[SCMLVideoAnalyzer handler](self, "handler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SCMLVideoAnalyzer_startAnalysisWithConfig___block_invoke;
  block[3] = &unk_2516E4B18;
  block[4] = self;
  v8 = v4;
  v10 = v8;
  dispatch_sync(v7, block);

  objc_autoreleasePoolPop(v5);
}

void __45__SCMLVideoAnalyzer_startAnalysisWithConfig___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "frameProcessor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startAnalysisWithConfig:", *(_QWORD *)(a1 + 40));

}

- (BOOL)addFrameBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v6 = (void *)MEMORY[0x249545300](self, a2, a3, a4);
  -[SCMLVideoAnalyzer handler](self, "handler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SCMLVideoAnalyzer_addFrameBuffer_error___block_invoke;
  block[3] = &unk_2516E4B40;
  block[4] = self;
  block[5] = &v11;
  block[6] = a3;
  dispatch_sync(v8, block);

  objc_autoreleasePoolPop(v6);
  LOBYTE(v6) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v6;
}

void __42__SCMLVideoAnalyzer_addFrameBuffer_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "frameProcessor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "addFrameBuffer:", *(_QWORD *)(a1 + 48));

}

- (id)analyze:(id *)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD block[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  if (a3)
    *a3 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  v5 = (void *)MEMORY[0x249545300](self, a2);
  -[SCMLVideoAnalyzer handler](self, "handler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__SCMLVideoAnalyzer_analyze___block_invoke;
  block[3] = &unk_2516E4B68;
  block[4] = self;
  block[5] = &v18;
  block[6] = &v12;
  dispatch_sync(v7, block);

  objc_autoreleasePoolPop(v5);
  if (a3)
  {
    v8 = (void *)v13[5];
    if (v8)
      *a3 = objc_retainAutorelease(v8);
  }
  v9 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __29__SCMLVideoAnalyzer_analyze___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "frameProcessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "analyze:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)finalizeAnalysis:(id *)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD block[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  if (a3)
    *a3 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  v5 = (void *)MEMORY[0x249545300](self, a2);
  -[SCMLVideoAnalyzer handler](self, "handler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SCMLVideoAnalyzer_finalizeAnalysis___block_invoke;
  block[3] = &unk_2516E4B68;
  block[4] = self;
  block[5] = &v18;
  block[6] = &v12;
  dispatch_sync(v7, block);

  objc_autoreleasePoolPop(v5);
  if (a3)
  {
    v8 = (void *)v13[5];
    if (v8)
      *a3 = objc_retainAutorelease(v8);
  }
  v9 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __38__SCMLVideoAnalyzer_finalizeAnalysis___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "frameProcessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "finalizeAnalysis:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (SCMLHandler)handler
{
  return self->_handler;
}

- (SCMLImageAnalyzer)imageAnalyzer
{
  return self->_imageAnalyzer;
}

- (SCMLVideoFrameProcessor)frameProcessor
{
  return self->_frameProcessor;
}

- (void)setFrameProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_frameProcessor, a3);
}

- (SCMLVideoDecoder)decoder
{
  return self->_decoder;
}

- (void)setDecoder:(id)a3
{
  objc_storeStrong((id *)&self->_decoder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_frameProcessor, 0);
  objc_storeStrong((id *)&self->_imageAnalyzer, 0);
  objc_storeStrong((id *)&self->_handler, 0);
}

@end
