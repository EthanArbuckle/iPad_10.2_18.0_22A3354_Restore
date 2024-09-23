@implementation GetImageUTIForPHAssetSync

void __GetImageUTIForPHAssetSync_block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;

  v2 = objc_alloc_init((Class)getPHImageRequestOptionsClass());
  objc_msgSend(v2, "setVersion:", 0);
  objc_msgSend(v2, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v2, "setDeliveryMode:", 2);
  objc_msgSend(v2, "setSynchronous:", 1);
  objc_msgSend(getPHImageManagerClass(), "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __GetImageUTIForPHAssetSync_block_invoke_2;
  v7[3] = &unk_1E9D97280;
  v6 = *(_OWORD *)(a1 + 40);
  v5 = (id)v6;
  v8 = v6;
  objc_msgSend(v3, "requestImageDataAndOrientationForAsset:options:resultHandler:", v4, v2, v7);

}

void __GetImageUTIForPHAssetSync_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  v7 = v6;
  if (a2 && v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
