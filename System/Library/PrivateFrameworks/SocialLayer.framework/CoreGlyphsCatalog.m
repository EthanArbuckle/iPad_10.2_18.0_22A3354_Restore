@implementation CoreGlyphsCatalog

void __CoreGlyphsCatalog_block_invoke()
{
  id v0;
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v0 = objc_alloc(MEMORY[0x1E0D1A6A8]);
  if (SLDCoreGlyphsBundle_onceToken != -1)
    dispatch_once(&SLDCoreGlyphsBundle_onceToken, &__block_literal_global_50);
  v5 = 0;
  v1 = (id)SLDCoreGlyphsBundle_bundle;
  v2 = objc_msgSend(v0, "initWithName:fromBundle:error:", CFSTR("Assets"), v1, &v5);
  v3 = v5;
  v4 = (void *)CoreGlyphsCatalog_catalog;
  CoreGlyphsCatalog_catalog = v2;

}

@end
