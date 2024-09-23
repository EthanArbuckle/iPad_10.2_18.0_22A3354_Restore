@implementation NSString(TSUCustomNumberFormatAdditions)

+ (uint64_t)customNumberFormatTokenStringOfType:()TSUCustomNumberFormatAdditions content:
{
  uint64_t v5;
  uint64_t v7;

  v5 = TSUCustomNumberFormatTokenIdentifierCharacterForTokenType(a3);
  if (a4)
    return objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%C%C%@"), (unsigned __int16)TSUCustomNumberFormatSentinelCharacter, v5, a4);
  else
    return objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%C%C"), (unsigned __int16)TSUCustomNumberFormatSentinelCharacter, v5, v7);
}

- (BOOL)isSpecialCustomNumberFormatToken
{
  int v3;

  if ((unint64_t)objc_msgSend(a1, "length") < 2)
    return 0;
  v3 = objc_msgSend(a1, "characterAtIndex:", 0);
  return (unsigned __int16)TSUCustomNumberFormatSentinelCharacter == v3;
}

- (BOOL)isSpecialCustomNumberFormatTokenOfType:()TSUCustomNumberFormatAdditions
{
  int v5;
  int v6;

  if ((unint64_t)objc_msgSend(a1, "length") < 2)
    return 0;
  v5 = objc_msgSend(a1, "characterAtIndex:", 0);
  if ((unsigned __int16)TSUCustomNumberFormatSentinelCharacter != v5)
    return 0;
  v6 = objc_msgSend(a1, "characterAtIndex:", 1);
  return TSUCustomNumberFormatTokenIdentifierCharacterForTokenType(a3) == v6;
}

- (uint64_t)numberOfDigitsInCustomNumberFormatIntegerToken
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;

  if ((objc_msgSend(a1, "isSpecialCustomNumberFormatTokenOfType:", 1) & 1) == 0)
  {
    v2 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSUCustomNumberFormatAdditions) numberOfDigitsInCustomNumberFormatIntegerToken]");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormatNumberTokenDelegate.m"), 135, CFSTR("Wrong token type!"));
  }
  if ((unint64_t)objc_msgSend(a1, "length") < 3)
    return 0;
  LODWORD(v4) = 0;
  v5 = 3;
  v6 = 2;
  do
  {
    if (objc_msgSend(a1, "characterAtIndex:", v6) == 44)
      v4 = v4;
    else
      v4 = (v4 + 1);
    v6 = v5;
  }
  while (objc_msgSend(a1, "length") > (unint64_t)v5++);
  return v4;
}

- (BOOL)customFormatIntegerTokenUsesSeparator
{
  id v2;
  uint64_t v3;

  if ((objc_msgSend(a1, "isSpecialCustomNumberFormatTokenOfType:", 1) & 1) == 0)
  {
    v2 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSUCustomNumberFormatAdditions) customFormatIntegerTokenUsesSeparator]");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormatNumberTokenDelegate.m"), 146, CFSTR("Wrong token type!"));
  }
  return objc_msgSend(a1, "characterAtIndex:", objc_msgSend(a1, "length") - 1) == 44;
}

- (void)stringByInsertingFormatGroupingSeparators
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = TSUNumberFormatterGroupingSizeForLocale(0);
  v4 = objc_msgSend(a1, "length");
  v5 = v4 - 1;
  if (v4 >= 1)
  {
    v6 = 1;
    do
    {
      objc_msgSend(v2, "insertString:atIndex:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), objc_msgSend(a1, "characterAtIndex:", v5)), 0);
      if (v5 && v3 && !(v6 % v3))
        objc_msgSend(v2, "insertString:atIndex:", CFSTR(","), 0);
      --v5;
      ++v6;
    }
    while (v5 != -1);
  }
  return v2;
}

+ (void)customNumberFormatIntegerTokenDisplayStringWithDigits:()TSUCustomNumberFormatAdditions separator:digitString:
{
  void *v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  BOOL v13;

  v8 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v9 = TSUNumberFormatterGroupingSizeForLocale(0);
  if (a3)
  {
    v10 = v9;
    v11 = 0;
    v12 = *MEMORY[0x24BDBCB10];
    do
    {
      if (v11 && v10)
      {
        if ((a3 + v11) % v10)
          v13 = 1;
        else
          v13 = a4 == 0;
        if (!v13)
          objc_msgSend(v8, "appendString:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale"), "objectForKey:", v12));
      }
      objc_msgSend(v8, "appendString:", a5);
      --v11;
    }
    while (a3 + v11);
  }
  return v8;
}

+ (uint64_t)customNumberFormatIntegerTokenRepresentedStringWithDigits:()TSUCustomNumberFormatAdditions separator:digitString:
{
  void *v8;
  unsigned int v9;
  unint64_t v10;

  v8 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:");
  if (a3)
  {
    v9 = 1;
    do
    {
      objc_msgSend(v8, "appendString:", a5);
      v10 = v9++;
    }
    while (v10 < a3);
  }
  if (a4)
    objc_msgSend(v8, "appendString:", CFSTR(","));
  return objc_msgSend(MEMORY[0x24BDD16A8], "customNumberFormatTokenStringOfType:content:", 1, v8);
}

+ (void)customNumberFormatIntegerFormatStringWithDigits:()TSUCustomNumberFormatAdditions digitString:
{
  void *i;

  for (i = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string"); a3; --a3)
    objc_msgSend(i, "appendString:", a4);
  return i;
}

- (uint64_t)numberOfDigitsInCustomNumberFormatDecimalToken
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;

  if ((objc_msgSend(a1, "isSpecialCustomNumberFormatTokenOfType:", 2) & 1) == 0)
  {
    v2 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSUCustomNumberFormatAdditions) numberOfDigitsInCustomNumberFormatDecimalToken]");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormatNumberTokenDelegate.m"), 209, CFSTR("Wrong token type!"));
  }
  if ((unint64_t)objc_msgSend(a1, "length") <= 2)
  {
    v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSUCustomNumberFormatAdditions) numberOfDigitsInCustomNumberFormatDecimalToken]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormatNumberTokenDelegate.m"), 212, CFSTR("Bad token format"));
  }
  return objc_msgSend(a1, "length") - 3;
}

+ (void)customNumberFormatDecimalTokenDisplayStringWithDigits:()TSUCustomNumberFormatAdditions digitString:
{
  void *v6;
  void *v7;

  v6 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  objc_msgSend(v6, "appendString:", objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDBCB00]));
  for (; a3; --a3)
    objc_msgSend(v6, "appendString:", a4);
  return v6;
}

+ (uint64_t)customNumberFormatDecimalTokenRepresentedStringWithDigits:()TSUCustomNumberFormatAdditions digitString:
{
  void *v6;
  uint64_t v7;

  v6 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:");
  if (a3 != -1)
  {
    v7 = a3 + 1;
    do
    {
      objc_msgSend(v6, "appendString:", a4);
      --v7;
    }
    while (v7);
  }
  return objc_msgSend(MEMORY[0x24BDD16A8], "customNumberFormatTokenStringOfType:content:", 2, v6);
}

+ (void)customNumberFormatDecimalFormatStringWithDigits:()TSUCustomNumberFormatAdditions digitString:includeDecimalSeparator:
{
  void *v8;
  void *v9;
  unsigned int v10;

  v8 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v9 = v8;
  if (a5)
    objc_msgSend(v8, "appendString:", CFSTR("."));
  if (a3 >= 1)
  {
    v10 = a3 + 1;
    do
    {
      objc_msgSend(v9, "appendString:", a4);
      --v10;
    }
    while (v10 > 1);
  }
  return v9;
}

- (const)digitPlaceholderStringInDigitToken
{
  const __CFString *v2;

  v2 = CFSTR("0");
  if (objc_msgSend(a1, "rangeOfString:", CFSTR("0")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = CFSTR("#");
    if (objc_msgSend(a1, "rangeOfString:", CFSTR("#")) == 0x7FFFFFFFFFFFFFFFLL)
      return CFSTR("?");
  }
  return v2;
}

- (id)currencyCodeFromCustomNumberFormatCurrencyToken
{
  if ((unint64_t)objc_msgSend(a1, "length") < 3)
    return +[TSUNumberFormatter currentLocaleCurrencyCode](TSUNumberFormatter, "currentLocaleCurrencyCode");
  else
    return (id)objc_msgSend(a1, "substringFromIndex:", 2);
}

- (uint64_t)fractionAccuracyFromCustomNumberFormatFractionToken
{
  return objc_msgSend((id)objc_msgSend(a1, "substringFromIndex:", 2), "intValue");
}

- (uint64_t)formatStringFromCustomNumberFormatScaleToken
{
  return objc_msgSend(a1, "substringFromIndex:", 3);
}

- (uint64_t)scaleCharacterInCustomNumberFormatScaleToken
{
  return objc_msgSend(a1, "characterAtIndex:", 2);
}

- (uint64_t)spaceCharacterInCustomNumberFormatSpaceToken
{
  return objc_msgSend(a1, "characterAtIndex:", 2);
}

@end
