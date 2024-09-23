@implementation TIGetStickerTaxonomyIdentifiers

void __TIGetStickerTaxonomyIdentifiers_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  TIGetTextInputFrameworkPath();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  TILoadBundlePlist(CFSTR("StickerTaxonomyIdentifiers.plist"), v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TIGetStickerTaxonomyIdentifiers___stickerTaxonomyIdentifiers;
  TIGetStickerTaxonomyIdentifiers___stickerTaxonomyIdentifiers = v0;

}

@end
