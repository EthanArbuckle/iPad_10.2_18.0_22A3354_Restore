@implementation GetImageForPHAssetSync

void __GetImageForPHAssetSync_block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  double *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  __int128 v10;
  _QWORD v11[4];
  __int128 v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v2 = objc_alloc_init((Class)getPHImageRequestOptionsClass());
  objc_msgSend(v2, "setVersion:", 0);
  objc_msgSend(v2, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v2, "setResizeMode:", 0);
  objc_msgSend(v2, "setDeliveryMode:", 1);
  objc_msgSend(v2, "setSynchronous:", 1);
  objc_msgSend(getPHImageManagerClass(), "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v5 = (double *)getPHImageManagerMaximumSizeSymbolLoc_ptr;
  v16 = getPHImageManagerMaximumSizeSymbolLoc_ptr;
  if (!getPHImageManagerMaximumSizeSymbolLoc_ptr)
  {
    v6 = (void *)PhotosLibrary();
    v5 = (double *)dlsym(v6, "PHImageManagerMaximumSize");
    v14[3] = (uint64_t)v5;
    getPHImageManagerMaximumSizeSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v13, 8);
  if (!v5)
    __GetImageForPHAssetSync_block_invoke_cold_1();
  v7 = *v5;
  v8 = v5[1];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __GetImageForPHAssetSync_block_invoke_2;
  v11[3] = &unk_1E9D972E0;
  v10 = *(_OWORD *)(a1 + 40);
  v9 = (id)v10;
  v12 = v10;
  objc_msgSend(v3, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v4, 0, v2, v11, v7, v8);

}

void __GetImageForPHAssetSync_block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __GetImageForPHAssetSync_block_invoke_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  __getUIActivityViewControllerClass_block_invoke_cold_1(v0);
}

@end
