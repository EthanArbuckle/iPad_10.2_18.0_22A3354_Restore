@implementation PXSmartAlbumLocalizedStringsForFlashFiredValues

void __PXSmartAlbumLocalizedStringsForFlashFiredValues_block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  __CFString *v5;
  id v6;

  v3 = objc_msgSend(a2, "BOOLValue");
  v4 = *(void **)(a1 + 32);
  if (v3)
    v5 = CFSTR("PXSmartAlbumFlashDidFire");
  else
    v5 = CFSTR("PXSmartAlbumFlashDidNotFire");
  PXLocalizedStringFromTable(v5, CFSTR("PXSmartAlbumStrings"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

}

@end
