@implementation PXSectionedSelectionManager

uint64_t __106__PXSectionedSelectionManager_DirectionalSelection___moveSelectionFromIndexPath_inDirection_withDelegate___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return objc_msgSend(a2, "setSelectedIndexPath:", v4);
}

uint64_t __103__PXSectionedSelectionManager_DirectionalSelection___selectInitialItemForMoveInDirection_withDelegate___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return objc_msgSend(a2, "setSelectedIndexPath:", v4);
}

uint64_t __106__PXSectionedSelectionManager_DirectionalSelection___selectInitialSectionForMoveInDirection_withDelegate___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return objc_msgSend(a2, "setSelectedIndexPath:", v4);
}

uint64_t __97__PXSectionedSelectionManager_DirectionalSelection__extendSelectionToItemIndexPath_withDelegate___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *((_OWORD *)off_1E50B8778 + 1);
  v4[0] = *(_OWORD *)off_1E50B8778;
  v4[1] = v2;
  return objc_msgSend(a2, "setCursorIndexPath:", v4);
}

void __120__PXSectionedSelectionManager_DirectionalSelection___extendSelectionFromIndexPath_toIndexPath_inDirection_withDelegate___block_invoke(uint64_t a1, void *a2)
{
  _BOOL8 v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _OWORD v7[2];

  v3 = *(_BYTE *)(a1 + 72) == 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setSelectedState:forIndexPathSet:", v3, v4);
  v6 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v6;
  objc_msgSend(v5, "setCursorIndexPath:", v7);

}

void __90__PXSectionedSelectionManager_CMMAdditions__selectNonCopiedAssetsWithImportStatusManager___block_invoke(uint64_t a1, __int128 *a2)
{
  void *v4;
  __int128 v5;
  void *v6;
  uint64_t v7;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v4 = *(void **)(a1 + 32);
  v5 = a2[1];
  v11 = *a2;
  v12 = v5;
  objc_msgSend(v4, "assetAtItemIndexPath:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 40), "importStateForAsset:", v6);
  if (v7 == 3 || v7 == 0)
  {
    v9 = *(void **)(a1 + 48);
    v10 = a2[1];
    v11 = *a2;
    v12 = v10;
    objc_msgSend(v9, "addIndexPath:", &v11);
  }

}

uint64_t __90__PXSectionedSelectionManager_CMMAdditions__selectNonCopiedAssetsWithImportStatusManager___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectedIndexPaths:", *(_QWORD *)(a1 + 32));
}

@end
