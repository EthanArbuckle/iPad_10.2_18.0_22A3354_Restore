@implementation NSCharacterSet

void __71__NSCharacterSet_SafariCoreExtras__safari_lockRelatedEmojiCharacterSet__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3780]);
  objc_msgSend(v0, "addCharactersInRange:", 128271, 5);
  objc_msgSend(v0, "addCharactersInString:", CFSTR(""));
  v1 = (void *)safari_lockRelatedEmojiCharacterSet_emojiRelatedToLocks;
  safari_lockRelatedEmojiCharacterSet_emojiRelatedToLocks = (uint64_t)v0;

}

void __65__NSCharacterSet_SafariCoreExtras__safari_asciiDigitCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 48, 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)safari_asciiDigitCharacterSet_asciiDigitCharacterSet;
  safari_asciiDigitCharacterSet_asciiDigitCharacterSet = v0;

}

uint64_t __75__NSCharacterSet_SafariCoreExtras__safari_whitespaceAndNewlineCharacterSet__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "mutableCopy");
  v2 = (void *)safari_whitespaceAndNewlineCharacterSet_whitespaceAndNewlineCharacterSet;
  safari_whitespaceAndNewlineCharacterSet_whitespaceAndNewlineCharacterSet = v1;

  return objc_msgSend((id)safari_whitespaceAndNewlineCharacterSet_whitespaceAndNewlineCharacterSet, "addCharactersInString:", CFSTR("\uFFFC"));
}

@end
