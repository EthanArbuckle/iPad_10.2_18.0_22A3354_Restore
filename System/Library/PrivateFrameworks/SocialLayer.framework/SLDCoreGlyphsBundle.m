@implementation SLDCoreGlyphsBundle

void __SLDCoreGlyphsBundle_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0CB34D0];
  if (SLDCoreGlyphsBundlePath_onceToken != -1)
    dispatch_once(&SLDCoreGlyphsBundlePath_onceToken, &__block_literal_global_51);
  v3 = (id)SLDCoreGlyphsBundlePath_bundlePath;
  objc_msgSend(v0, "bundleWithPath:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)SLDCoreGlyphsBundle_bundle;
  SLDCoreGlyphsBundle_bundle = v1;

}

@end
