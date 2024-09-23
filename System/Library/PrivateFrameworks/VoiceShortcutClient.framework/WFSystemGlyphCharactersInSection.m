@implementation WFSystemGlyphCharactersInSection

BOOL __WFSystemGlyphCharactersInSection_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  WFSystemImageNameForGlyphCharacter((unsigned __int16)objc_msgSend(a2, "intValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

@end
