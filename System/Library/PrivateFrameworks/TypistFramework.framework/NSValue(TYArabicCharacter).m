@implementation NSValue(TYArabicCharacter)

+ (id)valueWithTYArabicCharacter:()TYArabicCharacter
{
  uint64_t v4;

  v4 = a3;
  objc_msgSend(a1, "valueWithBytes:objCType:", &v4, "{?=SSSS}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)arabicCharacterValue
{
  uint64_t v2;

  v2 = 0;
  objc_msgSend(a1, "getValue:", &v2);
  return v2;
}

@end
