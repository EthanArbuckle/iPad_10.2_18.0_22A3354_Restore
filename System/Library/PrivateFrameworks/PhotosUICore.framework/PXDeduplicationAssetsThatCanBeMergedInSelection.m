@implementation PXDeduplicationAssetsThatCanBeMergedInSelection

void __PXDeduplicationAssetsThatCanBeMergedInSelection_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  id v8;

  v8 = a4;
  if (objc_msgSend(v8, "count") >= 2)
  {
    objc_msgSend(off_1E50B3180, "indexPathSetWithItemIndexes:dataSourceIdentifier:section:", v8, a2, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "unionIndexPathSet:", v7);

  }
}

@end
