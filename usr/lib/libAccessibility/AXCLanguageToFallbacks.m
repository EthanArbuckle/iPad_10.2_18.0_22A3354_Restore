@implementation AXCLanguageToFallbacks

void __AXCLanguageToFallbacks_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_allocWithZone(MEMORY[0x1E0C99D80]);
  AXCLanguageFallbackPlistPath();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithContentsOfFile:", v3);
  v2 = (void *)AXCLanguageToFallbacks_LanguageToFallback;
  AXCLanguageToFallbacks_LanguageToFallback = v1;

}

@end
