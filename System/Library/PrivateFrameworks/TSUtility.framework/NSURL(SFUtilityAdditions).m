@implementation NSURL(SFUtilityAdditions)

+ (CFStringRef)properlyEscapedString:()SFUtilityAdditions
{
  return objc_autorelease((id)CFURLCreateStringByAddingPercentEscapes(0, originalString, 0, CFSTR(";?:@&=+$,"),
                                0x8000100u));
}

+ (void)improperlyEscapedString:()SFUtilityAdditions
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  if (!a3)
    return 0;
  v4 = objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(";?:@&=+$#/%<>'\"\\"));
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", objc_msgSend(a3, "length"));
  objc_msgSend(v5, "appendString:", a3);
  v6 = objc_msgSend(v5, "rangeOfCharacterFromSet:", v4);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v6;
    v9 = v7;
    do
    {
      v10 = objc_msgSend(v5, "characterAtIndex:", v8);
      objc_msgSend(v5, "replaceCharactersInRange:withString:", v8, v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_%d_"), v10));
      v8 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:range:", v4, 2, v8, objc_msgSend(v5, "length") - v8);
      v9 = v11;
    }
    while (v8 != 0x7FFFFFFFFFFFFFFFLL);
  }
  return v5;
}

+ (id)relativeURLWithEscapes:()SFUtilityAdditions
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "properlyEscapedString:");
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v1);
}

+ (id)filePathURLWithEscapes:()SFUtilityAdditions
{
  uint64_t v4;
  __CFString *v5;

  v4 = objc_msgSend(a1, "properlyEscapedString:");
  if (objc_msgSend(a3, "hasPrefix:", CFSTR("/")))
    v5 = CFSTR("file://localhost");
  else
    v5 = CFSTR("file:");
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v4));
}

- (uint64_t)isRelative
{
  if (objc_msgSend((id)objc_msgSend(a1, "relativeString"), "isEqual:", objc_msgSend(a1, "absoluteString")))return objc_msgSend((id)objc_msgSend(a1, "path"), "hasPrefix:", CFSTR("/")) ^ 1;
  else
    return 1;
}

@end
