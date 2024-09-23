@implementation NSString(TSUCustomFormatTokenizerAdditions)

+ (uint64_t)tsu_customNumberFormatTokenStringOfType:()TSUCustomFormatTokenizerAdditions content:
{
  uint64_t v5;
  uint64_t v7;

  v5 = TSUCustomFormatTokenIdentifierCharacterForTokenType(a3);
  if (a4)
    return objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%C%C%@"), 63743, v5, a4);
  else
    return objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%C%C"), 63743, v5, v7);
}

- (BOOL)tsu_isSpecialCustomNumberFormatToken
{
  return (unint64_t)objc_msgSend(a1, "length") >= 2
      && objc_msgSend(a1, "characterAtIndex:", 0) == 63743;
}

- (BOOL)tsu_isSpecialCustomNumberFormatTokenOfType:()TSUCustomFormatTokenizerAdditions
{
  int v5;

  if ((unint64_t)objc_msgSend(a1, "length") < 2
    || objc_msgSend(a1, "characterAtIndex:", 0) != 63743)
  {
    return 0;
  }
  v5 = objc_msgSend(a1, "characterAtIndex:", 1);
  return TSUCustomFormatTokenIdentifierCharacterForTokenType(a3) == v5;
}

- (uint64_t)tsu_numberOfDigitsInCustomNumberFormatIntegerToken
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  if ((objc_msgSend(a1, "tsu_isSpecialCustomNumberFormatTokenOfType:", 1) & 1) == 0)
  {
    v2 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSUCustomFormatTokenizerAdditions) tsu_numberOfDigitsInCustomNumberFormatIntegerToken]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormatTokenizer.m"), 403, 0, "Wrong token type!");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  if ((unint64_t)objc_msgSend(a1, "length") < 3)
    return 0;
  v3 = 0;
  v4 = 2;
  do
  {
    if (objc_msgSend(a1, "characterAtIndex:", v4) != 44)
      ++v3;
    ++v4;
  }
  while (v4 < objc_msgSend(a1, "length"));
  return v3;
}

- (BOOL)tsu_customFormatIntegerTokenUsesSeparator
{
  uint64_t v2;

  if ((objc_msgSend(a1, "tsu_isSpecialCustomNumberFormatTokenOfType:", 1) & 1) == 0)
  {
    v2 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSUCustomFormatTokenizerAdditions) tsu_customFormatIntegerTokenUsesSeparator]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormatTokenizer.m"), 413, 0, "Wrong token type!");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  return objc_msgSend(a1, "characterAtIndex:", objc_msgSend(a1, "length") - 1) == 44;
}

- (void)tsu_stringByInsertingFormatGroupingSeparators:()TSUCustomFormatTokenizerAdditions
{
  uint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  if (!a3)
  {
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSUCustomFormatTokenizerAdditions) tsu_stringByInsertingFormatGroupingSeparators:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormatTokenizer.m"), 418, 0, "Need locale here.");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v6 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = objc_msgSend(a3, "groupingSize");
  v8 = objc_msgSend(a1, "length");
  if (v8)
  {
    v9 = v8 - 1;
    v10 = 1;
    do
    {
      objc_msgSend(v6, "insertString:atIndex:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), objc_msgSend(a1, "characterAtIndex:", v9)), 0);
      if (v9 && v7 && !(v10 % v7))
        objc_msgSend(v6, "insertString:atIndex:", CFSTR(","), 0);
      --v9;
      ++v10;
    }
    while (v9 != -1);
  }
  return v6;
}

+ (void)tsu_customNumberFormatIntegerTokenDisplayStringWithDigits:()TSUCustomFormatTokenizerAdditions separator:digitString:locale:
{
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;

  if (!a6)
  {
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[NSString(TSUCustomFormatTokenizerAdditions) tsu_customNumberFormatIntegerTokenDisplayStringWithDigits:separator:digitString:locale:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormatTokenizer.m"), 438, 0, "Need locale here.");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v11 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v12 = objc_msgSend(a6, "groupingSize");
  if (a3)
  {
    v13 = v12;
    v14 = 0;
    v15 = *MEMORY[0x24BDBCB10];
    do
    {
      if (v14 && v13)
      {
        if ((a3 + v14) % v13)
          v16 = 1;
        else
          v16 = a4 == 0;
        if (!v16)
          objc_msgSend(v11, "appendString:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale"), "objectForKey:", v15));
      }
      objc_msgSend(v11, "appendString:", a5);
      --v14;
    }
    while (a3 + v14);
  }
  return v11;
}

+ (uint64_t)tsu_customNumberFormatIntegerTokenRepresentedStringWithDigits:()TSUCustomFormatTokenizerAdditions separator:digitString:
{
  void *i;

  for (i = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:"); a3; --a3)
    objc_msgSend(i, "appendString:", a5);
  if (a4)
    objc_msgSend(i, "appendString:", CFSTR(","));
  return objc_msgSend(MEMORY[0x24BDD16A8], "tsu_customNumberFormatTokenStringOfType:content:", 1, i);
}

+ (void)tsu_customNumberFormatIntegerFormatStringWithDigits:()TSUCustomFormatTokenizerAdditions digitString:
{
  void *i;

  for (i = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string"); a3; --a3)
    objc_msgSend(i, "appendString:", a4);
  return i;
}

- (uint64_t)tsu_numberOfDigitsInCustomNumberFormatDecimalToken
{
  uint64_t v2;

  if ((objc_msgSend(a1, "tsu_isSpecialCustomNumberFormatTokenOfType:", 2) & 1) == 0)
  {
    v2 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSUCustomFormatTokenizerAdditions) tsu_numberOfDigitsInCustomNumberFormatDecimalToken]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormatTokenizer.m"), 472, 0, "Wrong token type!");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  return objc_msgSend(a1, "length") - 3;
}

+ (void)tsu_customNumberFormatDecimalTokenDisplayStringWithDigits:()TSUCustomFormatTokenizerAdditions digitString:
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

+ (uint64_t)tsu_customNumberFormatDecimalTokenRepresentedStringWithDigits:()TSUCustomFormatTokenizerAdditions digitString:
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
  return objc_msgSend(MEMORY[0x24BDD16A8], "tsu_customNumberFormatTokenStringOfType:content:", 2, v6);
}

+ (void)tsu_customNumberFormatDecimalFormatStringWithDigits:()TSUCustomFormatTokenizerAdditions digitString:includeDecimalSeparator:
{
  void *v8;
  void *v9;

  v8 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v9 = v8;
  if (a5)
    objc_msgSend(v8, "appendString:", CFSTR("."));
  for (; a3; --a3)
    objc_msgSend(v9, "appendString:", a4);
  return v9;
}

- (const)tsu_digitPlaceholderStringInDigitToken
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

- (id)tsu_currencyCodeFromCustomNumberFormatCurrencyToken
{
  if ((unint64_t)objc_msgSend(a1, "length") < 3)
    return +[OITSUNumberFormatter currentLocaleCurrencyCode](OITSUNumberFormatter, "currentLocaleCurrencyCode");
  else
    return (id)objc_msgSend(a1, "substringFromIndex:", 2);
}

- (uint64_t)tsu_fractionAccuracyFromCustomNumberFormatFractionToken
{
  return objc_msgSend((id)objc_msgSend(a1, "substringFromIndex:", 2), "intValue");
}

- (uint64_t)tsu_formatStringFromCustomNumberFormatScaleToken
{
  return objc_msgSend(a1, "substringFromIndex:", 3);
}

- (uint64_t)tsu_scaleCharacterInCustomNumberFormatScaleToken
{
  return objc_msgSend(a1, "characterAtIndex:", 2);
}

- (uint64_t)tsu_spaceCharacterInCustomNumberFormatSpaceToken
{
  return objc_msgSend(a1, "characterAtIndex:", 2);
}

@end
