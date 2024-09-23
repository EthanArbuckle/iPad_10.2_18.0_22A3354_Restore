@implementation NSCharacterSet(SCRCCharacterSetExtras)

+ (id)whitespaceNewlineAndSpecialCharacterSet
{
  id v0;
  id v1;
  int i;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (whitespaceNewlineAndSpecialCharacterSet_CharacterSet)
  {
    v0 = (id)whitespaceNewlineAndSpecialCharacterSet_CharacterSet;
  }
  else
  {
    v1 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    for (i = 0; i != 15; ++i)
      objc_msgSend(v1, "appendFormat:", CFSTR("%C"), (i + 65520));
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v4, "addCharactersInString:", v1);
    v5 = objc_msgSend(v4, "copy");
    v6 = (void *)whitespaceNewlineAndSpecialCharacterSet_CharacterSet;
    whitespaceNewlineAndSpecialCharacterSet_CharacterSet = v5;

    v0 = (id)whitespaceNewlineAndSpecialCharacterSet_CharacterSet;
  }
  return v0;
}

+ (id)passwordBulletCharacterSet
{
  void *v0;

  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "addCharactersInString:", CFSTR("•"));
  objc_msgSend(v0, "addCharactersInString:", CFSTR("⦁"));
  objc_msgSend(v0, "addCharactersInString:", CFSTR(""));
  return v0;
}

+ (id)wordBreakCharacterSet
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (wordBreakCharacterSet_CharacterSetIncludesPunctuation)
  {
    v0 = (id)wordBreakCharacterSet_CharacterSetIncludesPunctuation;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceNewlineAndSpecialCharacterSet");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v1, "mutableCopy");

    objc_msgSend(v2, "addCharactersInString:", CFSTR("\x05"));
    objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "formUnionWithCharacterSet:", v3);
    v4 = objc_msgSend(v2, "copy");
    v5 = (void *)wordBreakCharacterSet_CharacterSetIncludesPunctuation;
    wordBreakCharacterSet_CharacterSetIncludesPunctuation = v4;

    v0 = (id)wordBreakCharacterSet_CharacterSetIncludesPunctuation;
  }
  return v0;
}

+ (id)emojiCharacterSet
{
  if (emojiCharacterSet_onceToken != -1)
    dispatch_once(&emojiCharacterSet_onceToken, &__block_literal_global_0);
  return (id)emojiCharacterSet_EmojiCharacterSet;
}

+ (id)modifierKeyCharacterSet
{
  if (modifierKeyCharacterSet_onceToken != -1)
    dispatch_once(&modifierKeyCharacterSet_onceToken, &__block_literal_global_13);
  return (id)modifierKeyCharacterSet_modifierKeyCharacterSet;
}

@end
