@implementation PXDuplicateGroupingAssetIdentifiersFromSelection

void __PXDuplicateGroupingAssetIdentifiersFromSelection_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  v7 = (objc_class *)MEMORY[0x1E0C99DE8];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __PXDuplicateGroupingAssetIdentifiersFromSelection_block_invoke_2;
  v11[3] = &unk_1E5119EE8;
  v14 = a2;
  v15 = a3;
  v12 = *(id *)(a1 + 32);
  v10 = v9;
  v13 = v10;
  objc_msgSend(v8, "enumerateIndexesUsingBlock:", v11);

  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);

}

void __PXDuplicateGroupingAssetIdentifiersFromSelection_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *(void **)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 48);
  v8 = a2;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v3, "objectAtIndexPath:", &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v4, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

@end
