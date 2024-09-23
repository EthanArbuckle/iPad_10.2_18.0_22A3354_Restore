@implementation PXCMMUpdateCountsWithSelectionSnapshot

void __PXCMMUpdateCountsWithSelectionSnapshot_block_invoke(uint64_t a1, _OWORD *a2)
{
  id v4;
  __int128 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD v9[2];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(id *)(a1 + 32);
    v5 = a2[1];
    v9[0] = *a2;
    v9[1] = v5;
    objc_msgSend(v4, "assetAtItemIndexPath:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mediaType");
    if (v7 == 2)
    {
      v8 = a1 + 48;
    }
    else
    {
      if (v7 != 1)
      {
LABEL_7:

        return;
      }
      v8 = a1 + 40;
    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v8 + 8) + 24);
    goto LABEL_7;
  }
}

@end
