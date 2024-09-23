@implementation GetPHAssetForAssetURLSync

intptr_t __GetPHAssetForAssetURLSync_block_invoke(uint64_t a1)
{
  id PHAssetClass;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  PHAssetClass = getPHAssetClass();
  v9[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(PHAssetClass, "fetchAssetsWithALAssetURLs:options:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end
