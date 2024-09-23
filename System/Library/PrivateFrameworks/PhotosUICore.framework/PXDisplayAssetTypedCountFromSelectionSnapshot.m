@implementation PXDisplayAssetTypedCountFromSelectionSnapshot

void __PXDisplayAssetTypedCountFromSelectionSnapshot_block_invoke(uint64_t a1, _OWORD *a2, _BYTE *a3)
{
  void *v5;
  __int128 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD v10[3];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v6 = a2[1];
  v10[0] = *a2;
  v10[1] = v6;
  objc_msgSend(v5, "objectAtIndexPath:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mediaType");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_QWORD *)(v9 + 32))
  {
    if (v8 != *(_QWORD *)(v9 + 40))
    {
      *(_QWORD *)(v9 + 40) = 0;
      *a3 = 1;
    }
  }
  else
  {
    *(_QWORD *)(v9 + 32) = 0x7FFFFFFFFFFFFFFFLL;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v8;
  }

}

@end
