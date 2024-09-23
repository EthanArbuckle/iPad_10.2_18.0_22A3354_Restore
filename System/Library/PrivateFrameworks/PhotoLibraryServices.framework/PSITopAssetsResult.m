@implementation PSITopAssetsResult

- (PSITopAssetsResult)init
{
  PSITopAssetsResult *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *isolationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSITopAssetsResult;
  v2 = -[PSITopAssetsResult init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("PSITopAssetsResult.queue", 0);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)dealloc
{
  __CFArray *assetIds;
  objc_super v4;

  assetIds = self->_assetIds;
  if (assetIds)
    CFRelease(assetIds);
  v4.receiver = self;
  v4.super_class = (Class)PSITopAssetsResult;
  -[PSITopAssetsResult dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[4] = CFArrayCreateCopy(0, self->_assetIds);
  v5 = -[NSArray copy](self->_assetUUIDs, "copy");
  v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (unint64_t)assetMatchCount
{
  unint64_t result;

  result = (unint64_t)self->_assetIds;
  if (result)
    return CFArrayGetCount((CFArrayRef)result);
  return result;
}

- (NSArray)assetUUIDs
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__26320;
  v8 = __Block_byref_object_dispose__26321;
  v9 = 0;
  pl_dispatch_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

- (void)fetchAssetUUIDsWithCompletionHandler:(id)a3
{
  void (**v3)(_QWORD);
  id v4;
  void (**v5)(_QWORD);
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v3 = (void (**)(_QWORD))a3;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__26320;
  v10 = __Block_byref_object_dispose__26321;
  v11 = 0;
  pl_dispatch_sync();
  if (v3 && v7[5])
  {
    dispatch_get_global_queue(0, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    pl_dispatch_async();

  }
  else if (v3)
  {
    v3[2](v3);
  }
  _Block_object_dispose(&v6, 8);

}

- (__CFArray)assetIds
{
  return self->_assetIds;
}

- (void)setAssetIds:(__CFArray *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (PSITopAssetsResultDelegate)delegate
{
  return (PSITopAssetsResultDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __59__PSITopAssetsResult_fetchAssetUUIDsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

void __59__PSITopAssetsResult_fetchAssetUUIDsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __59__PSITopAssetsResult_fetchAssetUUIDsWithCompletionHandler___block_invoke_3;
  v6[3] = &unk_1E3667A80;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(v3 + 32);
  v6[1] = 3221225472;
  v6[4] = v3;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "fetchAssetUUIDsForAssetIDs:creationDateSorted:completionHandler:", v5, 1, v6);

}

void __59__PSITopAssetsResult_fetchAssetUUIDsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v4 = v3;
  pl_dispatch_async();

}

void __59__PSITopAssetsResult_fetchAssetUUIDsWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  v5 = *(id *)(a1 + 56);
  pl_dispatch_async();

}

uint64_t __59__PSITopAssetsResult_fetchAssetUUIDsWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __32__PSITopAssetsResult_assetUUIDs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
