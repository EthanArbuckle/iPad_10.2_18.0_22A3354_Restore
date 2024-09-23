@implementation PXSmartAlbumLocalizedStringsForUnitValues

void __PXSmartAlbumLocalizedStringsForUnitValues_block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(a2, "integerValue");
  v4 = *(void **)(a1 + 32);
  PXSmartAlbumLocalizedStringForUnit(v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

@end
