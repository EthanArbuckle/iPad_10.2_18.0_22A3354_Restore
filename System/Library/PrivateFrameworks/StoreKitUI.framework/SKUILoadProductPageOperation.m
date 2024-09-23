@implementation SKUILoadProductPageOperation

- (id)_initSKUILoadProductPageOperation
{
  SKUILoadProductPageOperation *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUILoadProductPageOperation _initSKUILoadProductPageOperation].cold.1();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUILoadProductPageOperation;
  v3 = -[SKUILoadProductPageOperation init](&v7, sel_init);
  if (v3)
  {
    v4 = dispatch_queue_create("com.apple.StoreKitUI.SKUILoadProductPageOperation", 0);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (SKUILoadProductPageOperation)initWithItemIdentifier:(int64_t)a3 clientContext:(id)a4
{
  id v7;
  id *v8;
  SKUILoadProductPageOperation *v9;

  v7 = a4;
  v8 = -[SKUILoadProductPageOperation _initSKUILoadProductPageOperation](self, "_initSKUILoadProductPageOperation");
  v9 = (SKUILoadProductPageOperation *)v8;
  if (v8)
  {
    objc_storeStrong(v8 + 31, a4);
    v9->_itemID = a3;
  }

  return v9;
}

- (SKUILoadProductPageOperation)initWithProductPageURLRequest:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  id *v8;
  SKUILoadProductPageOperation *v9;
  uint64_t v10;
  NSURLRequest *urlRequest;

  v6 = a3;
  v7 = a4;
  v8 = -[SKUILoadProductPageOperation _initSKUILoadProductPageOperation](self, "_initSKUILoadProductPageOperation");
  v9 = (SKUILoadProductPageOperation *)v8;
  if (v8)
  {
    objc_storeStrong(v8 + 31, a4);
    v10 = objc_msgSend(v6, "copy");
    urlRequest = v9->_urlRequest;
    v9->_urlRequest = (NSURLRequest *)v10;

  }
  return v9;
}

- (SSMetricsPageEvent)metricsPageEvent
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__70;
  v10 = __Block_byref_object_dispose__70;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__SKUILoadProductPageOperation_metricsPageEvent__block_invoke;
  v5[3] = &unk_1E73A0270;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SSMetricsPageEvent *)v3;
}

void __48__SKUILoadProductPageOperation_metricsPageEvent__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 272));
}

- (id)outputBlock
{
  NSObject *dispatchQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *(*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5_1;
  v10 = __Block_byref_object_dispose__6_1;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__SKUILoadProductPageOperation_outputBlock__block_invoke;
  v5[3] = &unk_1E73A0270;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__SKUILoadProductPageOperation_outputBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setOutputBlock:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__SKUILoadProductPageOperation_setOutputBlock___block_invoke;
  v7[3] = &unk_1E73A1578;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __47__SKUILoadProductPageOperation_setOutputBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 280) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 280);
    *(_QWORD *)(v5 + 280) = v4;

  }
}

- (void)main
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *dispatchQueue;
  id v18;
  uint64_t v19;
  void *v20;
  _QWORD block[5];
  id v22;
  _QWORD v23[6];
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  NSURLRequest *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__70;
  v44 = __Block_byref_object_dispose__70;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__70;
  v38 = __Block_byref_object_dispose__70;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__70;
  v32 = __Block_byref_object_dispose__70;
  v33 = self->_urlRequest;
  v3 = MEMORY[0x1E0C809B0];
  if (v29[5])
    goto LABEL_3;
  v4 = (void *)MEMORY[0x1BCCE6C7C]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), self->_itemID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0DAF6B0]);
  -[SKUIClientContext platformContext](self->_clientContext, "platformContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithPlatformContext:", v7);

  v46[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItemIdentifiers:", v9);

  objc_msgSend(v8, "setKeyProfile:", *MEMORY[0x1E0DAFAA0]);
  -[SKUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStoreFrontSuffix:", v10);

  v24[0] = v3;
  v24[1] = 3221225472;
  v24[2] = __36__SKUILoadProductPageOperation_main__block_invoke;
  v24[3] = &unk_1E73A6CC0;
  v11 = v5;
  v25 = v11;
  v26 = &v28;
  v27 = &v40;
  objc_msgSend(v8, "setResponseBlock:", v24);
  objc_msgSend(v8, "main");

  objc_autoreleasePoolPop(v4);
  if (v29[5])
  {
LABEL_3:
    v12 = (void *)MEMORY[0x1BCCE6C7C]();
    v13 = objc_alloc(MEMORY[0x1E0DAF698]);
    v14 = (void *)objc_msgSend(v13, "initWithURLRequest:", v29[5]);
    +[SSVURLDataConsumer consumer](SKUIProductPageDataConsumer, "consumer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDataConsumer:", v15);

    -[SKUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setStoreFrontSuffix:", v16);

    v23[0] = v3;
    v23[1] = 3221225472;
    v23[2] = __36__SKUILoadProductPageOperation_main__block_invoke_2;
    v23[3] = &unk_1E73A6E30;
    v23[4] = &v40;
    v23[5] = &v34;
    objc_msgSend(v14, "setOutputBlock:", v23);
    objc_msgSend(v14, "main");
    dispatchQueue = self->_dispatchQueue;
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __36__SKUILoadProductPageOperation_main__block_invoke_3;
    block[3] = &unk_1E739FD10;
    block[4] = self;
    v22 = v14;
    v18 = v14;
    dispatch_sync(dispatchQueue, block);

    objc_autoreleasePoolPop(v12);
  }
  -[SKUILoadProductPageOperation outputBlock](self, "outputBlock");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v19, v35[5], v41[5]);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
}

void __36__SKUILoadProductPageOperation_main__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(a2, "itemForKey:", a1[4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "productPageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C92C80]), "initWithURL:", v6);
    v8 = *(_QWORD *)(a1[5] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  v10 = objc_msgSend(v13, "copy");
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

void __36__SKUILoadProductPageOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = a2;
  v6 = objc_msgSend(a3, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = objc_msgSend(v5, "copy");
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

void __36__SKUILoadProductPageOperation_main__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 40), "metricsPageEvent");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 272);
  *(_QWORD *)(v3 + 272) = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_metricsPageEvent, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)_initSKUILoadProductPageOperation
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUILoadProductPageOperation _initSKUILoadProductPageOperation]";
}

@end
