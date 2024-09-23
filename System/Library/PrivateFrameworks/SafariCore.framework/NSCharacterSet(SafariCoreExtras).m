@implementation NSCharacterSet(SafariCoreExtras)

+ (id)safari_lockRelatedEmojiCharacterSet
{
  if (safari_lockRelatedEmojiCharacterSet_onceToken != -1)
    dispatch_once(&safari_lockRelatedEmojiCharacterSet_onceToken, &__block_literal_global_16);
  return (id)safari_lockRelatedEmojiCharacterSet_emojiRelatedToLocks;
}

+ (id)safari_asciiDigitCharacterSet
{
  if (safari_asciiDigitCharacterSet_onceToken != -1)
    dispatch_once(&safari_asciiDigitCharacterSet_onceToken, &__block_literal_global_2);
  return (id)safari_asciiDigitCharacterSet_asciiDigitCharacterSet;
}

+ (id)safari_obscuredPasswordCharacterSets
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("*"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("."), v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("•"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)safari_whitespaceAndNewlineCharacterSet
{
  if (safari_whitespaceAndNewlineCharacterSet_onceToken != -1)
    dispatch_once(&safari_whitespaceAndNewlineCharacterSet_onceToken, &__block_literal_global_11_0);
  return (id)safari_whitespaceAndNewlineCharacterSet_whitespaceAndNewlineCharacterSet;
}

@end
