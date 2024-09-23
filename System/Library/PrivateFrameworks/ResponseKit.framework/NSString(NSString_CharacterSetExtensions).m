@implementation NSString(NSString_CharacterSetExtensions)

- (BOOL)consistsOfCharactersFromSet:()NSString_CharacterSetExtensions options:
{
  void *v6;
  _BOOL8 v7;

  objc_msgSend(a3, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:", v6, a4) == 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

@end
