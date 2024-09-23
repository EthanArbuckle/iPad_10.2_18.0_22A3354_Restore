@implementation NSString(TSUNumberFormatStringUtilities)

+ (id)tsu_numberSymbols
{
  if (tsu_numberSymbols_onceToken != -1)
    dispatch_once(&tsu_numberSymbols_onceToken, &__block_literal_global_5);
  return (id)tsu_numberSymbols_symbols;
}

- (BOOL)tsu_isNumberFormatPattern
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("0123456789@#"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tsu_stringByRemovingEscapedCharactersFromNumberFormatPattern");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v2);

  return v4 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)tsu_newRangesOfEscapedCharactersInNumberFormatPattern
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  void *v10;

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
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v4, "addObject:", v10);
    else
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v10, 0);

  }
  while (v6 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL);
  return v4;
}

- (id)tsu_stringByRemovingEscapedCharactersFromNumberFormatPattern
{
  void *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (void *)objc_msgSend(a1, "tsu_newRangesOfEscapedCharactersInNumberFormatPattern");
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", a1);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(a1, "length");
    if (objc_msgSend(v2, "count"))
    {
      v5 = 0;
      do
      {
        objc_msgSend(v2, "objectAtIndex:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "rangeValue");
        v9 = v8;

        objc_msgSend(v3, "replaceCharactersInRange:withString:", v7 - v4 + objc_msgSend(v3, "length"), v9, &stru_24F3BFFF8);
        ++v5;
      }
      while (v5 < objc_msgSend(v2, "count"));
    }
  }
  else
  {
    v3 = a1;
  }

  return v3;
}

- (unint64_t)tsu_indexOfNumberFormatSubpatternSeparator
{
  void *v2;
  uint64_t v3;
  unint64_t v4;

  v2 = (void *)objc_msgSend(a1, "tsu_newRangesOfEscapedCharactersInNumberFormatPattern");
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

- (id)tsu_positiveSubpatternOfNumberFormatPattern
{
  uint64_t v2;
  id v3;

  v2 = objc_msgSend(a1, "tsu_indexOfNumberFormatSubpatternSeparator");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = a1;
  }
  else
  {
    objc_msgSend(a1, "substringToIndex:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (__CFString)tsu_negativeSubpatternOfNumberFormatPattern
{
  uint64_t v2;
  __CFString *v3;

  v2 = objc_msgSend(a1, "tsu_indexOfNumberFormatSubpatternSeparator");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = &stru_24F3BFFF8;
  }
  else
  {
    objc_msgSend(a1, "substringFromIndex:", v2 + 1);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (uint64_t)tsu_numberPortionOfNumberFormatSubpattern
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "tsu_indexOfFirstNonPrefixCharacterInNumberFormatSubpattern");
  return objc_msgSend(a1, "substringWithRange:", v2, objc_msgSend(a1, "tsu_indexOfLastNonSuffixCharacterInNumberFormatSubpattern") - v2 + 1);
}

- (uint64_t)tsu_indexOfLastNonSuffixCharacterInNumberFormatSubpattern
{
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_msgSend(a1, "tsu_newRangesOfEscapedCharactersInNumberFormatPattern");
  objc_msgSend((id)objc_opt_class(), "tsu_numberSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "length");
  while (1)
  {
    v5 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v3, 4, 0, v4);
    v4 = v5;
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    if (!TSULocationInRanges(v5, v2))
      goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSUNumberFormatStringUtilities) tsu_indexOfLastNonSuffixCharacterInNumberFormatSubpattern]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormatter.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 194, 0, "invalid number format subpattern");

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
LABEL_6:

  return v4;
}

- (uint64_t)tsu_suffixOfNumberFormatSubpattern
{
  return objc_msgSend(a1, "substringFromIndex:", objc_msgSend(a1, "tsu_indexOfLastNonSuffixCharacterInNumberFormatSubpattern") + 1);
}

- (unint64_t)tsu_indexOfFirstNonPrefixCharacterInNumberFormatSubpattern
{
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_msgSend(a1, "tsu_newRangesOfEscapedCharactersInNumberFormatPattern");
  objc_msgSend((id)objc_opt_class(), "tsu_numberSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v3, 0, 0, objc_msgSend(a1, "length"));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSUNumberFormatStringUtilities) tsu_indexOfFirstNonPrefixCharacterInNumberFormatSubpattern]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormatter.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 223, 0, "invalid number format subpattern");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v5 = v4;
    while (TSULocationInRanges(v5, v2))
    {
      v5 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v3, 0, v5 + 1, objc_msgSend(a1, "length") - (v5 + 1));
      if (v5 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_5;
    }
  }

  return v5;
}

- (uint64_t)tsu_prefixOfNumberFormatSubpattern
{
  return objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "tsu_indexOfFirstNonPrefixCharacterInNumberFormatSubpattern"));
}

@end
