@implementation TransliterateRomajiToKana

void __TransliterateRomajiToKana_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("ja"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TransliterateRomajiToKana_japanese;
  TransliterateRomajiToKana_japanese = v0;

}

@end
