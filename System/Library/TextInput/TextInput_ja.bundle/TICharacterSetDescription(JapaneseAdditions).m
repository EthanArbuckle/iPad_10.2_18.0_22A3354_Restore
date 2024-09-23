@implementation TICharacterSetDescription(JapaneseAdditions)

+ (id)kanaWordCharacters
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)kanaWordCharacters_wordCharacterSet;
  if (!kanaWordCharacters_wordCharacterSet)
  {
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4D00]), "initWithBaseCharacterSet:", 3);
    objc_msgSend(v1, "invertedSetDescription");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)kanaWordCharacters_wordCharacterSet;
    kanaWordCharacters_wordCharacterSet = v2;

    v0 = (void *)kanaWordCharacters_wordCharacterSet;
  }
  return v0;
}

+ (id)romajiWordCharacters
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)romajiWordCharacters_wordCharacterSet;
  if (!romajiWordCharacters_wordCharacterSet)
  {
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4E90]), "initWithBaseCharacterSet:", 3);
    objc_msgSend(v1, "removeCharactersInString:", CFSTR(" 　"));
    objc_msgSend(v1, "invertedSetDescription");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)romajiWordCharacters_wordCharacterSet;
    romajiWordCharacters_wordCharacterSet = v2;

    v0 = (void *)romajiWordCharacters_wordCharacterSet;
  }
  return v0;
}

@end
