@implementation NSString(TSUNumberFormatStringUtilities)

+ (uint64_t)numberSymbols
{
  uint64_t result;
  void *v1;
  id v2;

  result = numberSymbols_symbols;
  if (!numberSymbols_symbols)
  {
    v1 = (void *)objc_opt_class();
    objc_sync_enter(v1);
    if (!numberSymbols_symbols)
    {
      v2 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("0123456789#@"));
      __dmb(0xBu);
      numberSymbols_symbols = (uint64_t)v2;
    }
    objc_sync_exit(v1);
    return numberSymbols_symbols;
  }
  return result;
}

- (id)newStringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  v8 = a1;
  if (newStringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand_once != -1)
  {
    dispatch_once(&newStringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand_once, &__block_literal_global_1);
    a1 = v8;
  }
  v1 = objc_msgSend(a1, "rangeOfCharacterFromSet:", newStringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand_replacedCharacterSet, v8);
  if (v1 == 0x7FFFFFFFFFFFFFFFLL)
    return v9;
  v3 = v1;
  v4 = (void *)objc_msgSend(v9, "mutableCopy");
  v5 = objc_msgSend(v4, "length");
  v6 = v5 - v3;
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("−"), CFSTR("-"), 0, v3, v5 - v3);
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("﹣"), CFSTR("-"), 0, v3, v6);
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("－"), CFSTR("-"), 0, v3, v6);
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("﹢"), CFSTR("+"), 0, v3, v6);
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("＋"), CFSTR("+"), 0, v3, v6);
  v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v4);

  return (id)v7;
}

- (BOOL)isNumberFormatPattern
{
  return objc_msgSend((id)objc_msgSend(a1, "stringByRemovingEscapedCharactersFromNumberFormatPattern"), "rangeOfCharacterFromSet:", objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("0123456789@#"))) != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)newRangesOfEscapedCharactersInNumberFormatPattern
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = objc_msgSend(a1, "length");
  v3 = 0;
  v4 = 0;
  do
  {
    v5 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR("'"), 0, v3, v2 - v3);
    v6 = v5;
    if (v5 == v2 - 1 || v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = 0x7FFFFFFFFFFFFFFFLL;
      if (v5 == 0x7FFFFFFFFFFFFFFFLL)
        return v4;
    }
    else
    {
      v8 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR("'"), 0, v5 + 1, v2 - (v5 + 1));
    }
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = v2 - v6;
    }
    else
    {
      v3 = v8 + 1;
      v9 = v8 - v6 + 1;
    }
    v10 = objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v6, v9);
    if (v4)
      objc_msgSend(v4, "addObject:", v10);
    else
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v10, 0);
  }
  while (v6 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL);
  return v4;
}

- (void)stringByRemovingEscapedCharactersFromNumberFormatPattern
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(a1, "newRangesOfEscapedCharactersInNumberFormatPattern");
  if (!v2)
    return a1;
  v3 = (void *)v2;
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", a1);
  v5 = objc_msgSend(a1, "length");
  if (objc_msgSend(v3, "count"))
  {
    v6 = 0;
    do
    {
      v7 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", v6), "rangeValue");
      objc_msgSend(v4, "replaceCharactersInRange:withString:", objc_msgSend(v4, "length") - v5 + v7, v8, &stru_24D61C228);
      ++v6;
    }
    while (v6 < objc_msgSend(v3, "count"));
  }

  return v4;
}

- (unint64_t)indexOfNumberFormatSubpatternSeparator
{
  void *v2;
  uint64_t v3;
  unint64_t v4;

  v2 = (void *)objc_msgSend(a1, "newRangesOfEscapedCharactersInNumberFormatPattern");
  v3 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR(";"), 0, 0, objc_msgSend(a1, "length"));
  v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = v3;
    while (TSULocationInRanges(v4, v2))
    {
      v4 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR(";"),
             0,
             v4 + 1,
             objc_msgSend(a1, "length") - (v4 + 1));
      if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v4 = 0x7FFFFFFFFFFFFFFFLL;
        break;
      }
    }
  }

  return v4;
}

- (uint64_t)positiveSubpatternOfNumberFormatPattern
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "indexOfNumberFormatSubpatternSeparator");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    return (uint64_t)a1;
  else
    return objc_msgSend(a1, "substringToIndex:", v2);
}

- (const)negativeSubpatternOfNumberFormatPattern
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "indexOfNumberFormatSubpatternSeparator");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    return &stru_24D61C228;
  else
    return (const __CFString *)objc_msgSend(a1, "substringFromIndex:", v2 + 1);
}

- (uint64_t)numberPortionOfNumberFormatSubpattern
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "indexOfFirstNonPrefixCharacterInNumberFormatSubpattern");
  return objc_msgSend(a1, "substringWithRange:", v2, objc_msgSend(a1, "indexOfLastNonSuffixCharacterInNumberFormatSubpattern") - v2 + 1);
}

- (uint64_t)indexOfLastNonSuffixCharacterInNumberFormatSubpattern
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  uint64_t v7;

  v2 = (void *)objc_msgSend(a1, "newRangesOfEscapedCharactersInNumberFormatPattern");
  v3 = objc_msgSend((id)objc_opt_class(), "numberSymbols");
  v4 = objc_msgSend(a1, "length");
  while (1)
  {
    v5 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v3, 4, 0, v4);
    v4 = v5;
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    if ((TSULocationInRanges(v5, v2) & 1) == 0)
      goto LABEL_6;
  }
  v6 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
  v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSUNumberFormatStringUtilities) indexOfLastNonSuffixCharacterInNumberFormatSubpattern]");
  objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNumberFormatter.m"), 254, CFSTR("invalid number format subpattern"));
LABEL_6:

  return v4;
}

- (uint64_t)suffixOfNumberFormatSubpattern
{
  return objc_msgSend(a1, "substringFromIndex:", objc_msgSend(a1, "indexOfLastNonSuffixCharacterInNumberFormatSubpattern") + 1);
}

- (unint64_t)indexOfFirstNonPrefixCharacterInNumberFormatSubpattern
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  uint64_t v7;

  v2 = (void *)objc_msgSend(a1, "newRangesOfEscapedCharactersInNumberFormatPattern");
  v3 = objc_msgSend((id)objc_opt_class(), "numberSymbols");
  v4 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v3, 0, 0, objc_msgSend(a1, "length"));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    v6 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSUNumberFormatStringUtilities) indexOfFirstNonPrefixCharacterInNumberFormatSubpattern]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNumberFormatter.m"), 286, CFSTR("invalid number format subpattern"));
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v5 = v4;
    while ((TSULocationInRanges(v5, v2) & 1) != 0)
    {
      v5 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v3, 0, v5 + 1, objc_msgSend(a1, "length") - (v5 + 1));
      if (v5 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_5;
    }
  }

  return v5;
}

- (uint64_t)prefixOfNumberFormatSubpattern
{
  return objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "indexOfFirstNonPrefixCharacterInNumberFormatSubpattern"));
}

@end
