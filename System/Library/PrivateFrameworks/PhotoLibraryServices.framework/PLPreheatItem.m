@implementation PLPreheatItem

- (id)initForCPLPrefetchingWithAssetUUID:(id)a3 format:(unsigned __int16)a4 assetsdClient:(id)a5
{
  id v8;
  id v9;
  PLPreheatItem *v10;
  PLPreheatItem *v11;
  uint64_t v12;
  NSString *assetUUID;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *CPLPrefetchingIsolationQueue;
  NSString *CPLPrefetchingDoneToken;
  dispatch_group_t v18;
  OS_dispatch_group *CPLPrefetchingWaitGroup;
  objc_super v21;

  v8 = a3;
  v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PLPreheatItem;
  v10 = -[PLPreheatItem init](&v21, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_format = a4;
    v12 = objc_msgSend(v8, "copy");
    assetUUID = v11->_assetUUID;
    v11->_assetUUID = (NSString *)v12;

    v11->_CPLPrefetching = 1;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("PLPreheatItem", v14);
    CPLPrefetchingIsolationQueue = v11->_CPLPrefetchingIsolationQueue;
    v11->_CPLPrefetchingIsolationQueue = (OS_dispatch_queue *)v15;

    CPLPrefetchingDoneToken = v11->_CPLPrefetchingDoneToken;
    v11->_CPLPrefetchingDoneToken = 0;

    v11->_CPLPrefetchingCancelled = 0;
    v18 = dispatch_group_create();
    CPLPrefetchingWaitGroup = v11->_CPLPrefetchingWaitGroup;
    v11->_CPLPrefetchingWaitGroup = (OS_dispatch_group *)v18;

    objc_storeStrong((id *)&v11->_cloudClient, a5);
  }

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t format;
  signed int v7;
  uint64_t v8;
  _BOOL8 cachingAllowed;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  format = self->_format;
  v7 = atomic_load((unsigned int *)&self->_requestCount);
  v8 = v7;
  cachingAllowed = self->_cachingAllowed;
  -[PLPreheatItem virtualCPLTaskIdentifier](self, "virtualCPLTaskIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[PLPreheatItem virtualCPLTaskIdentifier](self, "virtualCPLTaskIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR(" for Hyperion '%@'"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> fmt: %ld, [r: %ld, c: %ld], %@ "), v5, self, format, v8, cachingAllowed, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> fmt: %ld, [r: %ld, c: %ld], %@ "), v5, self, format, v8, cachingAllowed, &stru_1E36789C0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)cachedImage:(BOOL *)a3
{
  if (a3)
    *a3 = 0;
  return 0;
}

- (id)cachedImageIfAvailable:(BOOL *)a3
{
  if (a3)
    *a3 = 0;
  return 0;
}

- (BOOL)addImageHandler:(id)a3
{
  return 0;
}

- (void)startPreheatRequestWithCompletionHandler:(id)a3
{
  id v4;
  dispatch_time_t v5;
  dispatch_block_t v6;
  _QWORD block[5];
  id v8;
  dispatch_time_t v9;

  v4 = a3;
  if (-[PLPreheatItem CPLPrefetching](self, "CPLPrefetching"))
  {
    v5 = dispatch_time(0, 300000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__PLPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke;
    block[3] = &unk_1E3674C40;
    block[4] = self;
    v8 = v4;
    v9 = v5;
    v6 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
    pl_dispatch_async();

  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (void)cancelPreheatRequestWithCompletionHandler:(id)a3
{
  id v4;
  dispatch_block_t v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (-[PLPreheatItem CPLPrefetching](self, "CPLPrefetching"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59__PLPreheatItem_cancelPreheatRequestWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E3675C58;
    v6[4] = self;
    v7 = v4;
    v5 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v6);
    pl_dispatch_async();

  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }

}

- (BOOL)isCancelled
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  if (-[PLPreheatItem CPLPrefetching](self, "CPLPrefetching"))
    pl_dispatch_sync();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)setCachingAllowed:(BOOL)a3
{
  if (self->_cachingAllowed != a3)
    self->_cachingAllowed = a3;
}

- (int64_t)incrementRequestCount
{
  int *p_requestCount;
  signed int v3;

  p_requestCount = &self->_requestCount;
  do
    v3 = __ldaxr((unsigned int *)p_requestCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_requestCount));
  return v3 + 1;
}

- (int64_t)decrementRequestCount
{
  int *p_requestCount;
  signed int v3;

  p_requestCount = &self->_requestCount;
  do
    v3 = __ldaxr((unsigned int *)p_requestCount);
  while (__stlxr(v3 - 1, (unsigned int *)p_requestCount));
  return v3 - 1;
}

- (BOOL)isRetained
{
  signed int v3;

  if (self->_cachingAllowed)
    return 1;
  v3 = atomic_load((unsigned int *)&self->_requestCount);
  return v3 > 0;
}

- (unsigned)format
{
  return self->_format;
}

- (unsigned)bestFormat
{
  return self->_bestFormat;
}

- (void)setBestFormat:(unsigned __int16)a3
{
  self->_bestFormat = a3;
}

- (int64_t)imageType
{
  return self->_imageType;
}

- (CGSize)optimalSourcePixelSize
{
  double width;
  double height;
  CGSize result;

  width = self->_optimalSourcePixelSize.width;
  height = self->_optimalSourcePixelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (BOOL)CPLPrefetching
{
  return self->_CPLPrefetching;
}

- (OS_dispatch_group)CPLPrefetchingWaitGroup
{
  return self->_CPLPrefetchingWaitGroup;
}

- (NSString)virtualCPLTaskIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setVirtualCPLTaskIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BOOL)didCompleteCPLPrefetchingWithSuccessOrError
{
  return self->_didCompleteCPLPrefetchingWithSuccessOrError;
}

- (void)setDidCompleteCPLPrefetchingWithSuccessOrError:(BOOL)a3
{
  self->_didCompleteCPLPrefetchingWithSuccessOrError = a3;
}

- (BOOL)CPLPrefetchingWasCancelled
{
  return self->_CPLPrefetchingWasCancelled;
}

- (void)setCPLPrefetchingWasCancelled:(BOOL)a3
{
  self->_CPLPrefetchingWasCancelled = a3;
}

- (BOOL)cachingAllowed
{
  return self->_cachingAllowed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualCPLTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudClient, 0);
  objc_storeStrong((id *)&self->_CPLPrefetchingWaitGroup, 0);
  objc_storeStrong((id *)&self->_CPLPrefetchingDoneToken, 0);
  objc_storeStrong((id *)&self->_CPLPrefetchingIsolationQueue, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
}

uint64_t __28__PLPreheatItem_isCancelled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 76);
  return result;
}

void __59__PLPreheatItem_cancelPreheatRequestWithCompletionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 76) = 1;
  v2 = *(id **)(a1 + 32);
  if (v2[8])
  {
    notify_post((const char *)objc_msgSend(v2[8], "UTF8String"));
    v2 = *(id **)(a1 + 32);
  }
  objc_msgSend(v2, "virtualCPLTaskIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__PLPreheatItem_cancelPreheatRequestWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E3676CD8;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "cancelCPLDownloadImageDataWithVirtualTaskIdentifiers:completionHandler:", v6, v7);

  }
}

uint64_t __59__PLPreheatItem_cancelPreheatRequestWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __58__PLPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, int);
  void *v22;
  uint64_t v23;
  id v24;
  int v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 76) = 0;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v3;

  v25 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "UTF8String");
  v6 = MEMORY[0x1E0C809B0];
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __58__PLPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_2;
  v22 = &unk_1E3674040;
  v23 = v7;
  v24 = v8;
  pl_notify_register_dispatch();
  v9 = *(_QWORD **)(a1 + 32);
  v10 = (void *)v9[12];
  objc_msgSend(v9, "assetUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(*(id *)(a1 + 32), "format");
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __58__PLPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_4;
  v16[3] = &unk_1E3674090;
  v15 = *(void **)(a1 + 40);
  v16[4] = *(_QWORD *)(a1 + 32);
  v18 = 0;
  v17 = v15;
  objc_msgSend(v10, "requestCPLDownloadImageDataForAssets:format:doneTokens:completionHandler:", v12, v13, v14, v16);

}

void __58__PLPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_2(uint64_t a1, int token)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;

  notify_cancel(token);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, 0, *(unsigned __int8 *)(v3 + 76));
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(v3 + 64);
    }
  }
  *(_QWORD *)(v3 + 64) = 0;

}

void __58__PLPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  notify_cancel(*(_DWORD *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, 0, *(unsigned __int8 *)(v2 + 76));
      v2 = *(_QWORD *)(a1 + 32);
      v3 = *(void **)(v2 + 64);
    }
  }
  *(_QWORD *)(v2 + 64) = 0;

}

void __58__PLPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(a2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  objc_msgSend(*(id *)(a1 + 32), "setVirtualCPLTaskIdentifier:", v3);
  if (!v4)
  {
    v5 = *(id *)(a1 + 40);
    pl_dispatch_async();

  }
}

void __58__PLPreheatItem_startPreheatRequestWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  notify_cancel(*(_DWORD *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, 0, *(unsigned __int8 *)(v2 + 76));
      v2 = *(_QWORD *)(a1 + 32);
      v3 = *(void **)(v2 + 64);
    }
  }
  *(_QWORD *)(v2 + 64) = 0;

}

@end
