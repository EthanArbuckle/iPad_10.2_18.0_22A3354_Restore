@implementation PXSelectionSnapshot

void __88__PXSelectionSnapshot_CMMAdditions__areAllUnsavedAssetsSelectedWithImportStatusManager___block_invoke(uint64_t a1, __int128 *a2, _BYTE *a3)
{
  void *v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v6 = *(void **)(a1 + 32);
  v7 = a2[1];
  v13 = *a2;
  v14 = v7;
  objc_msgSend(v6, "assetAtItemIndexPath:", &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(a1 + 40), "importStateForAsset:", v8);
  if (v9 == 3 || v9 == 0)
  {
    v11 = *(void **)(a1 + 48);
    v12 = a2[1];
    v13 = *a2;
    v14 = v12;
    if ((objc_msgSend(v11, "containsIndexPath:", &v13) & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      *a3 = 1;
    }
  }

}

@end
