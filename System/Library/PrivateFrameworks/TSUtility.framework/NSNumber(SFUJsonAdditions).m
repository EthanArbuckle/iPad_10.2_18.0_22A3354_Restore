@implementation NSNumber(SFUJsonAdditions)

- (uint64_t)appendJsonStringToString:()SFUJsonAdditions
{
  const __CFString *v5;

  if (*(_BYTE *)objc_msgSend(a1, "objCType") == 99)
  {
    if (objc_msgSend(a1, "BOOLValue"))
      v5 = CFSTR("true");
    else
      v5 = CFSTR("false");
  }
  else
  {
    v5 = (const __CFString *)objc_msgSend(a1, "stringValue");
  }
  return objc_msgSend(a3, "appendString:", v5);
}

@end
