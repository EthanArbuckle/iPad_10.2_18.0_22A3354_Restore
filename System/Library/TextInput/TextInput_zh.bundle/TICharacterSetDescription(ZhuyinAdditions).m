@implementation TICharacterSetDescription(ZhuyinAdditions)

+ (id)zhuyinWordCharacters
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)zhuyinWordCharacters__wordCharacterSet;
  if (!zhuyinWordCharacters__wordCharacterSet)
  {
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4E90]), "initWithBaseCharacterSet:", 3);
    objc_msgSend(v1, "removeCharactersInString:", CFSTR(" "));
    objc_msgSend(v1, "invertedSetDescription");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)zhuyinWordCharacters__wordCharacterSet;
    zhuyinWordCharacters__wordCharacterSet = v2;

    v0 = (void *)zhuyinWordCharacters__wordCharacterSet;
  }
  return v0;
}

@end
