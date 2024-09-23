@implementation SCMLHandler

- (SCMLHandler)initWithOptions:(id)a3 error:(id *)a4
{
  id v7;
  SCMLHandler *v8;
  SCMLHandler *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *clientQueue;
  SCMLPerformance *v12;
  SCMLPerformance *perfResults;
  void *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  id v25;
  void *v26;
  SCMLHandler *v27;
  _QWORD v29[4];
  id v30;
  SCMLHandler *v31;
  uint64_t *v32;
  uint64_t *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _QWORD v41[3];
  char v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  objc_super v47;

  v7 = a3;
  if (a4)
    *a4 = 0;
  v47.receiver = self;
  v47.super_class = (Class)SCMLHandler;
  v8 = -[SCMLHandler init](&v47, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_21;
  objc_storeStrong((id *)&v8->_options, a3);
  v10 = dispatch_queue_create("comm_safety_handler", 0);
  clientQueue = v9->_clientQueue;
  v9->_clientQueue = (OS_dispatch_queue *)v10;

  v12 = -[SCMLPerformance initWithOptions:]([SCMLPerformance alloc], "initWithOptions:", v7);
  perfResults = v9->_perfResults;
  v9->_perfResults = v12;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 1;
  objc_msgSend(v7, "objectForKey:", SCMLUseImageAnalyzer[0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", SCMLUseImageAnalyzer[0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", SCMLUseImageAnalyzer[0]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    v19 = objc_msgSend(v18, "BOOLValue");
    *((_BYTE *)v44 + 24) = v19;
    if ((isKindOfClass & 1) != 0)

  }
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v42 = 0;
  objc_msgSend(v7, "objectForKeyedSubscript:", SCMLUseTextAnalyzer[0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v21 = objc_opt_isKindOfClass();
  if ((v21 & 1) != 0)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", SCMLUseTextAnalyzer[0]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  v23 = objc_msgSend(v22, "BOOLValue");
  if ((v21 & 1) != 0)

  v42 = v23;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  v40 = 0;
  -[SCMLHandler perfResults](v9, "perfResults");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __37__SCMLHandler_initWithOptions_error___block_invoke;
  v29[3] = &unk_2516E46F8;
  v32 = &v43;
  v25 = v14;
  v30 = v25;
  v31 = v9;
  v33 = &v35;
  v34 = v41;
  objc_msgSend(v24, "run:block:", CFSTR("Create"), v29);

  v26 = (void *)v36[5];
  if (a4 && v26)
    *a4 = objc_retainAutorelease(v26);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v43, 8);

  if (v26)
    v27 = 0;
  else
LABEL_21:
    v27 = v9;

  return v27;
}

void __37__SCMLHandler_initWithOptions_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  SCMLImageAnalyzer *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id obj;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v2 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(*(id *)(a1 + 32), "resourcePath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v3;
    v16[1] = CFSTR("Models/ImageModel");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "fileURLWithPathComponents:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = [SCMLImageAnalyzer alloc];
    objc_msgSend(*(id *)(a1 + 40), "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v8 + 40);
    v9 = -[SCMLImageAnalyzer initWithModelURL:options:error:](v6, "initWithModelURL:options:error:", v5, v7, &obj);
    objc_storeStrong((id *)(v8 + 40), obj);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(v10 + 16);
    *(_QWORD *)(v10 + 16) = v9;

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", SCMLErrorDomain[0], 1, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

    }
  }
}

- (id)analyzeImage:(CGImage *)a3 error:(id *)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v7 = (void *)MEMORY[0x249545300](self, a2);
  -[SCMLHandler clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __34__SCMLHandler_analyzeImage_error___block_invoke;
  v13[3] = &unk_2516E4720;
  v13[4] = self;
  v13[5] = &v20;
  v13[6] = &v14;
  v13[7] = a3;
  dispatch_sync(v8, v13);

  objc_autoreleasePoolPop(v7);
  v9 = (void *)v21[5];
  if (!v9)
  {
    if (a4)
    {
      v10 = (void *)v15[5];
      if (v10)
      {
        *a4 = objc_retainAutorelease(v10);
        v9 = (void *)v21[5];
      }
    }
  }
  v11 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __34__SCMLHandler_analyzeImage_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "imageAnalyzer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "analyzeImage:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (int64_t)classifyImage:(CGImage *)a3 error:(id *)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  int64_t v10;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  if (a4)
    *a4 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v7 = (void *)MEMORY[0x249545300](self, a2);
  -[SCMLHandler clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __35__SCMLHandler_classifyImage_error___block_invoke;
  v12[3] = &unk_2516E4748;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = &v19;
  v12[7] = a3;
  dispatch_sync(v8, v12);

  objc_autoreleasePoolPop(v7);
  if (a4)
  {
    v9 = (void *)v14[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = v20[3];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __35__SCMLHandler_classifyImage_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "imageAnalyzer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "classifyImage:error:", v3, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", SCMLImageSensitivity[0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v6, "unsignedIntegerValue");

  }
}

- (id)analyzePixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v7 = (void *)MEMORY[0x249545300](self, a2);
  -[SCMLHandler clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __40__SCMLHandler_analyzePixelBuffer_error___block_invoke;
  v13[3] = &unk_2516E4720;
  v13[4] = self;
  v13[5] = &v20;
  v13[6] = &v14;
  v13[7] = a3;
  dispatch_sync(v8, v13);

  objc_autoreleasePoolPop(v7);
  v9 = (void *)v21[5];
  if (!v9)
  {
    if (a4)
    {
      v10 = (void *)v15[5];
      if (v10)
      {
        *a4 = objc_retainAutorelease(v10);
        v9 = (void *)v21[5];
      }
    }
  }
  v11 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __40__SCMLHandler_analyzePixelBuffer_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "imageAnalyzer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "analyzePixelBuffer:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (int64_t)classifyPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  int64_t v10;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  if (a4)
    *a4 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v7 = (void *)MEMORY[0x249545300](self, a2);
  -[SCMLHandler clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __41__SCMLHandler_classifyPixelBuffer_error___block_invoke;
  v12[3] = &unk_2516E4748;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = &v19;
  v12[7] = a3;
  dispatch_sync(v8, v12);

  objc_autoreleasePoolPop(v7);
  if (a4)
  {
    v9 = (void *)v14[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = v20[3];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __41__SCMLHandler_classifyPixelBuffer_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "imageAnalyzer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "classifyPixelBuffer:error:", v3, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", SCMLImageSensitivity[0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v6, "unsignedIntegerValue");

  }
}

- (id)getOperatingPointDataForClassName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD block[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  if (a4)
    *a4 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v7 = (void *)MEMORY[0x249545300]();
  -[SCMLHandler clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SCMLHandler_getOperatingPointDataForClassName_error___block_invoke;
  block[3] = &unk_2516E4770;
  v15 = &v23;
  v9 = v6;
  v14 = v9;
  v16 = &v17;
  dispatch_sync(v8, block);

  objc_autoreleasePoolPop(v7);
  if (a4)
  {
    v10 = (void *)v18[5];
    if (v10)
      *a4 = objc_retainAutorelease(v10);
  }
  v11 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v11;
}

void __55__SCMLHandler_getOperatingPointDataForClassName_error___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v2, "resourcePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v13[1] = CFSTR("Models/ImageModel");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPathComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = a1[4];
  v8 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v8 + 40);
  +[SCMLImageAnalyzer getOperatingPointDataForClassName:modelURL:error:](SCMLImageAnalyzer, "getOperatingPointDataForClassName:modelURL:error:", v7, v6, &obj);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  v10 = *(_QWORD *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

- (id)classifyPixelBuffer:(__CVBuffer *)a3 stagedText:(id)a4 inConversationWithIdentifier:(id)a5 error:(id *)a6
{
  -[SCMLHandler classifyPixelBuffer:startDate:endDate:stagedText:inConversationWithIdentifier:error:](self, "classifyPixelBuffer:startDate:endDate:stagedText:inConversationWithIdentifier:error:", a3, 0, 0, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)classifyPixelBuffer:(__CVBuffer *)a3 startDate:(id)a4 endDate:(id)a5 stagedText:(id)a6 inConversationWithIdentifier:(id)a7 error:(id *)a8
{
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  -[SCMLHandler clientQueue](self, "clientQueue", a3, a4, a5, a6, a7);
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __99__SCMLHandler_classifyPixelBuffer_startDate_endDate_stagedText_inConversationWithIdentifier_error___block_invoke;
  v15[3] = &unk_2516E4720;
  v15[4] = self;
  v15[5] = &v22;
  v15[6] = &v16;
  v15[7] = a3;
  dispatch_sync(v11, v15);

  if (a8)
  {
    v12 = (void *)v17[5];
    if (v12)
      *a8 = objc_retainAutorelease(v12);
  }
  v13 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __99__SCMLHandler_classifyPixelBuffer_startDate_endDate_stagedText_inConversationWithIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "imageAnalyzer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "classifyPixelBuffer:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)performanceStatistics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCMLHandler perfResults](self, "perfResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v5);

  -[SCMLHandler imageAnalyzer](self, "imageAnalyzer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performanceResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v7);

  v8 = (void *)objc_msgSend(v3, "copy");
  return v8;
}

+ (BOOL)supportsANE
{
  if (+[SCMLHandler supportsANE]::once_token != -1)
    dispatch_once(&+[SCMLHandler supportsANE]::once_token, &__block_literal_global);
  return +[SCMLHandler supportsANE]::supportsANE;
}

uint64_t __26__SCMLHandler_supportsANE__block_invoke()
{
  uint64_t result;

  result = MGIsQuestionValid();
  if ((_DWORD)result)
  {
    result = MGGetBoolAnswer();
    +[SCMLHandler supportsANE]::supportsANE = result;
  }
  return result;
}

+ (BOOL)supportsCPU
{
  return objc_msgSend((id)objc_opt_class(), "supportsANE") ^ 1;
}

+ (BOOL)isImageSensitiveForLabel:(id)a3 confidenceScore:(double)a4 classificationMode:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v11;

  v8 = a3;
  +[SCMLHandler currentModelVersion](SCMLHandler, "currentModelVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  LOBYTE(a5) = objc_msgSend(a1, "isImageSensitiveForLabel:confidenceScore:classificationMode:modelVersion:error:", v8, a5, v9, &v11, a4);

  return a5;
}

+ (id)currentModelVersion
{
  return CFSTR("1.7.6");
}

+ (BOOL)isImageSensitiveForLabel:(id)a3 confidenceScore:(double)a4 classificationMode:(unint64_t)a5 modelVersion:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  double v14;

  v11 = a3;
  v12 = a6;
  +[SCMLImageModelThresholds instance](SCMLImageModelThresholds, "instance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "thresholdForLabel:classificationMode:modelVersion:error:", v11, a5, v12, a7);
  LOBYTE(a7) = v14 <= a4;

  return (char)a7;
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (SCMLImageAnalyzer)imageAnalyzer
{
  return (SCMLImageAnalyzer *)objc_getProperty(self, a2, 16, 1);
}

- (SCMLTextAnalyzer)textAnalyzer
{
  return (SCMLTextAnalyzer *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (SCMLPerformance)perfResults
{
  return self->_perfResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perfResults, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_textAnalyzer, 0);
  objc_storeStrong((id *)&self->_imageAnalyzer, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end
