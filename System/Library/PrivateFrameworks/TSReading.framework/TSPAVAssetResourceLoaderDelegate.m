@implementation TSPAVAssetResourceLoaderDelegate

- (TSPAVAssetResourceLoaderDelegate)initWithTSPFileDataStorage:(id)a3 contentTypeUTI:(id)a4
{
  id v7;
  id v8;
  TSPAVAssetResourceLoaderDelegate *v9;
  TSPAVAssetResourceLoaderDelegate *v10;
  uint64_t v11;
  NSString *contentTypeUTI;
  dispatch_queue_t v13;
  OS_dispatch_queue *concurrentRequestQueue;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TSPAVAssetResourceLoaderDelegate;
  v9 = -[TSPAVAssetResourceLoaderDelegate init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataStorage, a3);
    v11 = objc_msgSend(v8, "copy");
    contentTypeUTI = v10->_contentTypeUTI;
    v10->_contentTypeUTI = (NSString *)v11;

    v13 = dispatch_queue_create("TSPFileDataStorage.AVAssetResourceLoader.request", MEMORY[0x24BDAC9C0]);
    concurrentRequestQueue = v10->_concurrentRequestQueue;
    v10->_concurrentRequestQueue = (OS_dispatch_queue *)v13;

  }
  return v10;
}

- (id)delegateQueue
{
  return self->_delegateQueue;
}

- (void)_provideData:(id)a3 untilRequestCancelledForResourceLoadingRequest:(id)a4
{
  id v5;
  NSObject *data;
  _QWORD applier[4];
  id v8;

  data = a3;
  v5 = a4;
  if ((objc_msgSend(v5, "isCancelled") & 1) == 0)
  {
    applier[0] = MEMORY[0x24BDAC760];
    applier[1] = 3221225472;
    applier[2] = __96__TSPAVAssetResourceLoaderDelegate__provideData_untilRequestCancelledForResourceLoadingRequest___block_invoke;
    applier[3] = &unk_24D82A248;
    v8 = v5;
    dispatch_data_apply(data, applier);

  }
}

uint64_t __96__TSPAVAssetResourceLoaderDelegate__provideData_untilRequestCancelledForResourceLoadingRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v8;
  void *v9;
  void *v10;

  v8 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((v8 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", a4, a5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "respondWithData:", v10);

  }
  return v8 ^ 1u;
}

- (void)dealloc
{
  objc_super v3;

  -[TSUReadChannel close](self->_readChannel, "close");
  v3.receiver = self;
  v3.super_class = (Class)TSPAVAssetResourceLoaderDelegate;
  -[TSPAVAssetResourceLoaderDelegate dealloc](&v3, sel_dealloc);
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v5;
  NSObject *concurrentRequestQueue;
  id v7;
  _QWORD v9[4];
  id v10;
  TSPAVAssetResourceLoaderDelegate *v11;

  v5 = a4;
  concurrentRequestQueue = self->_concurrentRequestQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __91__TSPAVAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke;
  v9[3] = &unk_24D829818;
  v10 = v5;
  v11 = self;
  v7 = v5;
  dispatch_async(concurrentRequestQueue, v9);

  return 1;
}

void __91__TSPAVAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int8x16_t v10;
  _QWORD aBlock[4];
  int8x16_t v12;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "contentInformationRequest");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "contentInformationRequest");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setContentType:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
      objc_msgSend(v3, "setContentLength:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "encodedLength"));
      objc_msgSend(v3, "setByteRangeAccessSupported:", 1);
      objc_msgSend(*(id *)(a1 + 32), "dataRequest");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
        objc_msgSend(*(id *)(a1 + 32), "finishLoading");

    }
    objc_msgSend(*(id *)(a1 + 32), "dataRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __91__TSPAVAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_2;
      aBlock[3] = &unk_24D829D00;
      v10 = *(int8x16_t *)(a1 + 32);
      v6 = (id)v10.i64[0];
      v12 = vextq_s8(v10, v10, 8uLL);
      v7 = _Block_copy(aBlock);
      v8 = v7;
      v9 = *(_QWORD *)(a1 + 40);
      if (*(_QWORD *)(v9 + 24))
        (*((void (**)(void *))v7 + 2))(v7);
      else
        objc_msgSend(*(id *)(v9 + 8), "performIOChannelReadWithAccessor:", v7);

    }
  }
}

void __91__TSPAVAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  dispatch_queue_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v19[3];
  char v20;

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), a2);
    v5 = dispatch_queue_create("TSPFileDataStorage.AVAssetResourceLoader.Read", 0);
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v20 = 1;
    objc_msgSend(*(id *)(a1 + 40), "dataRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "currentOffset");
    objc_msgSend(*(id *)(a1 + 40), "dataRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "requestedLength");
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __91__TSPAVAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_3;
    v15[3] = &unk_24D829FB8;
    v18 = v19;
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 32);
    v16 = v10;
    v17 = v11;
    objc_msgSend(v4, "readFromOffset:length:queue:handler:", v7, v9, v5, v15);

    _Block_object_dispose(v19, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPAVAssetResourceLoaderDelegate resourceLoader:shouldWaitForLoadingOfRequestedResource:]_block_invoke_2");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPAVAssetResourceLoaderDelegate.mm");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, v14, 105, CFSTR("Expected a non-nil readChannel."));

    objc_msgSend(*(id *)(a1 + 40), "finishLoadingWithError:", 0);
  }

}

void __91__TSPAVAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_3(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    && (objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    if (v7)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      objc_msgSend(*(id *)(a1 + 32), "finishLoadingWithError:", v7);
    }
    else
    {
      if (v15)
      {
        objc_msgSend(*(id *)(a1 + 40), "_provideData:untilRequestCancelledForResourceLoadingRequest:", v15, *(_QWORD *)(a1 + 32));
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "dataRequest");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = malloc_type_malloc(objc_msgSend(v8, "requestedLength"), 0xC6DB5939uLL);

        objc_msgSend(*(id *)(a1 + 32), "dataRequest");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        bzero(v9, objc_msgSend(v10, "requestedLength"));

        objc_msgSend(*(id *)(a1 + 32), "dataRequest");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x24BDBCE50];
        objc_msgSend(*(id *)(a1 + 32), "dataRequest");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dataWithBytesNoCopy:length:", v9, objc_msgSend(v13, "requestedLength"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "respondWithData:", v14);

      }
      if (((objc_msgSend(*(id *)(a1 + 32), "isCancelled") | a2 ^ 1) & 1) == 0)
        objc_msgSend(*(id *)(a1 + 32), "finishLoading");
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentTypeUTI, 0);
  objc_storeStrong((id *)&self->_concurrentRequestQueue, 0);
  objc_storeStrong((id *)&self->_readChannel, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_dataStorage, 0);
}

@end
