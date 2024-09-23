@implementation RepresentationFromPhotoAssetURL

void __RepresentationFromPhotoAssetURL_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  __int128 v10;
  int v11;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __RepresentationFromPhotoAssetURL_block_invoke_2;
  v9[3] = &unk_1E4001E78;
  v11 = *(_DWORD *)(a1 + 64);
  v6 = *(_OWORD *)(a1 + 48);
  v5 = (id)v6;
  v10 = v6;
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __RepresentationFromPhotoAssetURL_block_invoke_3;
  v7[3] = &unk_1E4001EA0;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "assetForURL:resultBlock:failureBlock:", v3, v9, v7);

}

void __RepresentationFromPhotoAssetURL_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  NewRepresentationFromPhotoAsset(a2, *(_DWORD *)(a1 + 48));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32)))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
}

intptr_t __RepresentationFromPhotoAssetURL_block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
