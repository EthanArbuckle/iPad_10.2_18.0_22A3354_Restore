@implementation IsAssetURL

void __IsAssetURL_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __IsAssetURL_block_invoke_2;
  v7[3] = &unk_1E4001EF0;
  v10 = *(_QWORD *)(a1 + 64);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __IsAssetURL_block_invoke_3;
  v5[3] = &unk_1E4001EA0;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "assetForURL:resultBlock:failureBlock:", v3, v7, v5);

}

intptr_t __IsAssetURL_block_invoke_2(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;
  void *v5;
  void *v6;

  v3 = (void (*)(void))getALAssetPropertyType;
  v4 = a2;
  v3();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForProperty:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __IsAssetURL_block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
