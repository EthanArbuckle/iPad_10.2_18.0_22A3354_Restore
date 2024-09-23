@implementation PLParseHashtags

uint64_t __PLParseHashtags_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "invertedSet");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)PLParseHashtags_nonNumbersCharacterSet;
  PLParseHashtags_nonNumbersCharacterSet = v1;

  objc_msgSend(MEMORY[0x1E0CB3780], "alphanumericCharacterSet");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)PLParseHashtags_nonAlphanumericCharacterSet;
  PLParseHashtags_nonAlphanumericCharacterSet = v3;

  objc_msgSend((id)PLParseHashtags_nonAlphanumericCharacterSet, "addCharactersInString:", CFSTR("_"));
  return objc_msgSend((id)PLParseHashtags_nonAlphanumericCharacterSet, "invert");
}

@end
