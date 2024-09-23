@implementation NSMutableString(TIExtras)

- (void)_removeCharactersFromSet:()TIExtras
{
  void *v4;
  uint64_t v5;
  void *v6;

  if (a3)
  {
    v4 = result;
    result = (void *)objc_msgSend(result, "rangeOfCharacterFromSet:options:range:", a3, 2, 0, objc_msgSend(result, "length"));
    if (result != (void *)0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = result;
      do
      {
        objc_msgSend(v4, "deleteCharactersInRange:", v6, v5);
        result = (void *)objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", a3, 2, v6, objc_msgSend(v4, "length") - (_QWORD)v6);
        v6 = result;
      }
      while (result != (void *)0x7FFFFFFFFFFFFFFFLL);
    }
  }
  return result;
}

- (void)_replaceOccurrencesOfCharacter:()TIExtras withCharacter:
{
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", v7, v6, 2, 0, objc_msgSend(a1, "length"));

}

- (void)_removeOccurrencesOfCharacter:()TIExtras
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", v2, &stru_1E243B990, 2, 0, objc_msgSend(a1, "length"));

}

@end
