@implementation TSUNumberFormatter

+ (void)initialize
{
  objc_super v3;

  gLockTSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific = (uint64_t)objc_alloc_init(MEMORY[0x24BDD1788]);
  gLockTSUNumberFormatterStringFromDoubleWithFormat = (uint64_t)objc_alloc_init(MEMORY[0x24BDD1788]);
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSUNumberFormatter;
  objc_msgSendSuper2(&v3, sel_initialize);
}

+ (int)positionOfSymbol:(id)a3 inNumberFormatSubpattern:(id)a4
{
  uint64_t v5;
  unint64_t v7;
  unint64_t v8;

  v5 = objc_msgSend(a4, "rangeOfString:", a3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v7 = v5;
  v8 = objc_msgSend(a4, "indexOfFirstNonPrefixCharacterInNumberFormatSubpattern");
  return v8 != 0x7FFFFFFFFFFFFFFFLL && v7 >= v8;
}

+ (int)positionOfCurrencySymbolInNumberFormatSubpattern:(id)a3
{
  return objc_msgSend(a1, "positionOfSymbol:inNumberFormatSubpattern:", CFSTR("¤"), a3);
}

+ (int)positionOfMinusSignInNumberFormatSubpattern:(id)a3
{
  return objc_msgSend(a1, "positionOfSymbol:inNumberFormatSubpattern:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("-")), a3);
}

+ (id)formatString:(id)a3 transformedForNegativeStyle:(int)a4
{
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  const __CFString *v11;
  __CFString *v12;
  int v13;
  int v14;
  const __CFString *v15;
  void *v16;

  v7 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v8 = v7;
  if (!a4)
  {
    objc_msgSend(v7, "appendString:", objc_msgSend(a3, "positiveSubpatternOfNumberFormatPattern"));
    objc_msgSend(v8, "appendString:", CFSTR(";"));
    v12 = (__CFString *)objc_msgSend((id)objc_msgSend(a3, "positiveSubpatternOfNumberFormatPattern"), "mutableCopy");
    objc_msgSend(a1, "formatString:replaceOccurencesOfUnescapedString:withString:", v12, CFSTR("-"), &stru_24D61C228);
    v13 = +[TSUNumberFormatter positionOfMinusSignInNumberFormatSubpattern:](TSUNumberFormatter, "positionOfMinusSignInNumberFormatSubpattern:", objc_msgSend(a3, "negativeSubpatternOfNumberFormatPattern"));
    if (v13)
    {
      v14 = v13;
      objc_msgSend(v8, "appendString:", v12);
      if (v14 != 1)
      {
LABEL_13:

        return v8;
      }
      v15 = CFSTR("-");
      v16 = v8;
    }
    else
    {
      objc_msgSend(v8, "appendString:", CFSTR("-"));
      v16 = v8;
      v15 = v12;
    }
    objc_msgSend(v16, "appendString:", v15);
    goto LABEL_13;
  }
  if (a4 == 1)
  {
    objc_msgSend(v7, "appendString:", objc_msgSend(a3, "positiveSubpatternOfNumberFormatPattern"));
    objc_msgSend(v8, "appendString:", CFSTR(";"));
    v9 = (__CFString *)objc_msgSend((id)objc_msgSend(a3, "positiveSubpatternOfNumberFormatPattern"), "mutableCopy");
    objc_msgSend(a1, "formatString:replaceOccurencesOfUnescapedString:withString:", v9, CFSTR("-"), &stru_24D61C228);
    v10 = v8;
    v11 = v9;
  }
  else
  {
    if ((a4 & 0xFFFFFFFE) != 2)
    {
      objc_msgSend(v7, "appendString:", a3);
      return v8;
    }
    objc_msgSend(v7, "appendString:", objc_msgSend(a3, "positiveSubpatternOfNumberFormatPattern"));
    objc_msgSend(v8, "appendString:", CFSTR(";"));
    v9 = (__CFString *)objc_msgSend((id)objc_msgSend(a3, "positiveSubpatternOfNumberFormatPattern"), "mutableCopy");
    objc_msgSend(a1, "formatString:replaceOccurencesOfUnescapedString:withString:", v9, CFSTR("-"), &stru_24D61C228);
    objc_msgSend(v8, "appendString:", CFSTR("("));
    objc_msgSend(v8, "appendString:", v9);
    v11 = CFSTR(")");
    v10 = v8;
  }
  objc_msgSend(v10, "appendString:", v11);

  return v8;
}

+ (void)formatString:(id)a3 replaceOccurencesOfUnescapedString:(id)a4 withString:(id)a5
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v17 = (id)objc_msgSend(a3, "newRangesOfEscapedCharactersInNumberFormatPattern");
  v8 = objc_msgSend(a3, "length");
  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend(a3, "replaceOccurrencesOfString:withString:options:range:", a4, a5, 0, 0, objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", 0), "rangeValue"));
    if ((unint64_t)objc_msgSend(v17, "count") >= 2)
    {
      v9 = 1;
      do
      {
        v10 = objc_msgSend(a3, "length");
        v11 = objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", v9 - 1), "rangeValue");
        objc_msgSend(a3, "replaceOccurrencesOfString:withString:options:range:", a4, a5, 0, v12 + v11 - v8 + v10, objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", v9++), "rangeValue") - (v12 + v11));
      }
      while (v9 < objc_msgSend(v17, "count"));
    }
    v13 = objc_msgSend((id)objc_msgSend(v17, "lastObject"), "rangeValue");
    v15 = v13 + v14;
    v16 = objc_msgSend(a3, "length") - (v13 + v14);
  }
  else
  {
    v16 = objc_msgSend(a3, "length");
    v15 = 0;
  }
  objc_msgSend(a3, "replaceOccurrencesOfString:withString:options:range:", a4, a5, 0, v15, v16);

}

+ (id)availableCurrencyCodes
{
  return CFLocaleCopyISOCurrencyCodes();
}

+ (id)displayNameForCurrencyCode:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "formatterForLocale:", 0), "displayNameForCurrencyCode:", a3);
}

+ (id)currencySymbolForCurrencyCode:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "formatterForLocale:", 0), "currencySymbolForCurrencyCode:", a3);
}

+ (unsigned)defaultDecimalPlacesForCurrencyCode:(id)a3
{
  int v3;
  id v4;
  uint64_t v5;
  double v7;
  int32_t defaultFractionDigits;

  defaultFractionDigits = 0;
  v7 = 0.0;
  if (CFNumberFormatterGetDecimalInfoForCurrencyCode((CFStringRef)a3, &defaultFractionDigits, &v7))
  {
    return defaultFractionDigits & ~(defaultFractionDigits >> 31);
  }
  else
  {
    v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUNumberFormatter defaultDecimalPlacesForCurrencyCode:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNumberFormatter.m"), 1629, CFSTR("Couldn't get decimal info for a currency code."));
    LOWORD(v3) = 0;
  }
  return v3;
}

+ (id)currentLocaleCurrencyCode
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "formatterForLocale:", 0), "currentLocaleCurrencyCode");
}

+ (id)currentNonCachedLocaleCurrencyCode
{
  const __CFLocale *v2;
  id result;

  v2 = (const __CFLocale *)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  result = (id)(id)CFLocaleGetValue(v2, (CFLocaleKey)*MEMORY[0x24BDBD3E0]);
  if (!result)
    return CFSTR("USD");
  return result;
}

+ (id)currentNonCachedLocaleDecimalSeparator
{
  const __CFLocale *v2;

  v2 = (const __CFLocale *)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  return (id)CFLocaleGetValue(v2, (CFLocaleKey)*MEMORY[0x24BDBD3F8]);
}

+ (id)numberFormatStringSpecialSymbols
{
  return (id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("0123456789@#.-,E+;'*%‰¤"));
}

+ (id)defaultFormatStringForValueType:(int)a3 negativeStyle:(int)a4
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "formatterForLocale:", 0), "defaultFormatStringForValueType:negativeStyle:", *(_QWORD *)&a3, *(_QWORD *)&a4);
}

+ (id)defaultFormatStringForValueType:(int)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "formatterForLocale:", 0), "defaultFormatStringForValueType:", *(_QWORD *)&a3);
}

+ (id)localizedPercentSymbol
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "formatterForLocale:", 0), "localizedPercentSymbol");
}

+ (id)userVisibleCurrencyCodes
{
  void *v2;
  CFArrayRef v3;
  const __CFArray *v4;
  id v5;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  if (objc_msgSend(v2, "BOOLForKey:", TSUDefaultsShowCompleteCurrencyList))
  {
    v3 = CFLocaleCopyCommonISOCurrencyCodes();
    v4 = v3;
  }
  else
  {
    v3 = (CFArrayRef)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", CFSTR("AUD"), CFSTR("CAD"), CFSTR("HKD"), CFSTR("SGD"), CFSTR("TWD"), CFSTR("USD"), CFSTR("EUR"), CFSTR("CHF"), CFSTR("SEK"), CFSTR("DKK"), CFSTR("NOK"), CFSTR("MXN"), CFSTR("GBP"), CFSTR("BRL"), CFSTR("INR"), CFSTR("KRW"), CFSTR("JPY"),
                       CFSTR("CNY"),
                       CFSTR("IDR"),
                       CFSTR("RUB"),
                       CFSTR("TRY"),
                       CFSTR("THB"),
                       CFSTR("PLN"),
                       CFSTR("ZAR"),
                       CFSTR("ARS"),
                       0);
    v5 = +[TSUNumberFormatter currentLocaleCurrencyCode](TSUNumberFormatter, "currentLocaleCurrencyCode");
    if ((-[__CFArray containsObject:](v3, "containsObject:", v5) & 1) == 0)
      -[__CFArray insertObject:atIndex:](v3, "insertObject:atIndex:", v5, 0);
  }
  return v3;
}

+ (id)formatterForLocale:(__CFLocale *)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[6];

  if (a3)
    return (id)objc_msgSend(objc_alloc((Class)a1), "initWithLocale:", a3);
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v6 = (void *)objc_msgSend(v5, "threadDictionary");
  v7 = (id)objc_msgSend(v6, "objectForKey:", CFSTR("TSUNumberFormatterThreadDictionaryKey"));
  if (!v7)
  {
    v7 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithLocale:", 0);
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("TSUNumberFormatterThreadDictionaryKey"));
    v8 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __50__TSUNumberFormatter_Private__formatterForLocale___block_invoke;
    v12[3] = &unk_24D61AC98;
    v12[4] = v5;
    v12[5] = v7;
    objc_msgSend(v6, "setObject:forKey:", TSURegisterLocaleChangeObserver((uint64_t)v12), CFSTR("TSUNumberFormatterThreadDictionaryLocaleObserverKey"));
    v9 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = *MEMORY[0x24BDD12C8];
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __50__TSUNumberFormatter_Private__formatterForLocale___block_invoke_2;
    v11[3] = &unk_24D61ACC0;
    v11[4] = v7;
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", v10, v5, 0, v11), CFSTR("TSUNumberFormatterThreadDictionaryExitObserverKey"));
  }
  return v7;
}

uint64_t __50__TSUNumberFormatter_Private__formatterForLocale___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t result;

  v4 = objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v5 = *(void **)(a1 + 32);
  if ((void *)v4 == v5)
    return objc_msgSend(*(id *)(a1 + 40), "numberPreferencesChanged:", a2);
  result = objc_msgSend(v5, "isFinished");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "performSelector:onThread:withObject:waitUntilDone:", sel_numberPreferencesChanged_, *(_QWORD *)(a1 + 32), a2, 0);
  return result;
}

uint64_t __50__TSUNumberFormatter_Private__formatterForLocale___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "numberPreferencesChanged:", a2);
}

- (TSUNumberFormatter)initWithLocale:(__CFLocale *)a3
{
  TSUNumberFormatter *v4;
  const __CFLocale *v5;
  __CFNumberFormatter *v6;
  __CFNumberFormatter *v7;
  __CFNumberFormatter *v8;
  __CFNumberFormatter *v9;
  uint64_t v10;
  __CFNumberFormatter *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TSUNumberFormatter;
  v4 = -[TSUNumberFormatter init](&v13, sel_init);
  if (v4)
  {
    if (a3)
      v5 = (const __CFLocale *)CFRetain(a3);
    else
      v5 = CFLocaleCopyCurrent();
    v4->mLocale = v5;
    v4->mFractionFormatter = CFNumberFormatterCreate(0, v5, kCFNumberFormatterDecimalStyle);
    v4->mCurrencyCodeToSymbolMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v4->mCurrencyCodeToHalfWidthSymbolMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v6 = CFNumberFormatterCreate(0, v4->mLocale, kCFNumberFormatterCurrencyStyle);
    v4->mCurrencyString = (NSString *)-[__CFString copy]((id)CFNumberFormatterGetFormat(v6), "copy");
    CFRelease(v6);
    v7 = CFNumberFormatterCreate(0, v4->mLocale, kCFNumberFormatterPercentStyle);
    v4->mPercentageString = (NSString *)-[__CFString copy]((id)CFNumberFormatterGetFormat(v7), "copy");
    CFRelease(v7);
    v8 = CFNumberFormatterCreate(0, v4->mLocale, kCFNumberFormatterNoStyle);
    CFNumberFormatterSetFormat(v8, CFSTR("#.##E+00"));
    v4->mScientificString = (NSString *)-[__CFString copy]((id)CFNumberFormatterGetFormat(v8), "copy");
    CFRelease(v8);
    v9 = CFNumberFormatterCreate(0, v4->mLocale, kCFNumberFormatterDecimalStyle);
    v4->mDecimalString = (NSString *)-[__CFString copy]((id)CFNumberFormatterGetFormat(v9), "copy");
    CFRelease(v9);
    v4->mTransformedDecimalStrings = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
    v4->mTransformedCurrencyStrings = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
    v4->mTransformedPercentageStrings = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
    v10 = 0;
    v4->mTransformedScientificStrings = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
    do
    {
      -[NSMutableArray insertObject:atIndex:](v4->mTransformedDecimalStrings, "insertObject:atIndex:", +[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", v4->mDecimalString, v10), v10);
      -[NSMutableArray insertObject:atIndex:](v4->mTransformedCurrencyStrings, "insertObject:atIndex:", +[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", v4->mCurrencyString, v10), v10);
      -[NSMutableArray insertObject:atIndex:](v4->mTransformedPercentageStrings, "insertObject:atIndex:", +[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", v4->mPercentageString, v10), v10);
      -[NSMutableArray insertObject:atIndex:](v4->mTransformedScientificStrings, "insertObject:atIndex:", +[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", v4->mScientificString, v10), v10);
      ++v10;
    }
    while (v10 != 5);
    v11 = CFNumberFormatterCreate(0, v4->mLocale, kCFNumberFormatterNoStyle);
    v4->mPercentSymbol = (NSString *)CFNumberFormatterCopyProperty(v11, (CFNumberFormatterKey)*MEMORY[0x24BDBD518]);
    CFRelease(v11);
  }
  return v4;
}

- (void)dealloc
{
  __CFArray *mDecimalFormatters;
  __CFArray *mCurrencyFormatters;
  __CFArray *mPercentageFormatters;
  __CFArray *mScientificFormatters;
  __CFString *mAdditionalCurrencyCode;
  __CFArray *mAdditionalCurrencyCodeFormatters;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  CFRelease(self->mLocale);
  mDecimalFormatters = self->mDecimalFormatters;
  if (mDecimalFormatters)
    CFRelease(mDecimalFormatters);
  mCurrencyFormatters = self->mCurrencyFormatters;
  if (mCurrencyFormatters)
    CFRelease(mCurrencyFormatters);
  mPercentageFormatters = self->mPercentageFormatters;
  if (mPercentageFormatters)
    CFRelease(mPercentageFormatters);
  mScientificFormatters = self->mScientificFormatters;
  if (mScientificFormatters)
    CFRelease(mScientificFormatters);
  CFRelease(self->mFractionFormatter);

  mAdditionalCurrencyCode = self->mAdditionalCurrencyCode;
  if (mAdditionalCurrencyCode)
    CFRelease(mAdditionalCurrencyCode);
  mAdditionalCurrencyCodeFormatters = self->mAdditionalCurrencyCodeFormatters;
  if (mAdditionalCurrencyCodeFormatters)
    CFRelease(mAdditionalCurrencyCodeFormatters);
  objc_msgSend((id)gLockTSUNumberFormatterStringFromDoubleWithFormat, "lock");
  sActiveFormatter = 0;
  sActiveCurrencyFormatter = 0;
  v9 = (void *)sActiveCurrencyCode;
  sActiveCurrencyCode = 0;

  v10 = (void *)sActiveFormat;
  sActiveFormat = 0;

  v11 = (void *)sActiveCurrencyFormat;
  sActiveCurrencyFormat = 0;

  objc_msgSend((id)gLockTSUNumberFormatterStringFromDoubleWithFormat, "unlock");
  v12.receiver = self;
  v12.super_class = (Class)TSUNumberFormatter;
  -[TSUNumberFormatter dealloc](&v12, sel_dealloc);
}

- (void)numberPreferencesChanged:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  TSUNumberFormatter *v6;
  uint64_t v7;

  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread", a3), "threadDictionary");
  if ((TSUNumberFormatter *)objc_msgSend(v3, "objectForKey:", CFSTR("TSUNumberFormatterThreadDictionaryKey")) != self)
  {
    v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUNumberFormatter(Private) numberPreferencesChanged:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNumberFormatter.m"), 1886, CFSTR("Registered wrong date formatter for date preference change notification"));
  }
  v6 = self;
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("TSUNumberFormatterThreadDictionaryKey"));
  TSURemoveLocaleChangeObserver((void *)objc_msgSend(v3, "objectForKey:", CFSTR("TSUNumberFormatterThreadDictionaryLocaleObserverKey")));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("TSUNumberFormatterThreadDictionaryLocaleObserverKey"));
  v7 = objc_msgSend(v3, "objectForKey:", CFSTR("TSUNumberFormatterThreadDictionaryExitObserverKey"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", v7);
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("TSUNumberFormatterThreadDictionaryExitObserverKey"));

}

- (BOOL)decimalFromString:(__CFString *)a3 value:(double *)a4 formatString:(const __CFString *)a5
{
  return -[TSUNumberFormatter valueFromString:formatters:value:formatString:currencyCode:](self, "valueFromString:formatters:value:formatString:currencyCode:", a3, -[TSUNumberFormatter p_decimalFormatters](self, "p_decimalFormatters"), a4, a5, 0);
}

- (BOOL)currencyFromString:(__CFString *)a3 additionalCurrencyCode:(__CFString *)a4 value:(double *)a5 formatString:(const __CFString *)a6 currencyCode:(const __CFString *)a7
{
  BOOL v12;
  BOOL v13;
  __CFString *mAdditionalCurrencyCode;
  __CFString *v15;
  __CFArray *v16;
  __CFString *v17;
  __CFArray *mAdditionalCurrencyCodeFormatters;
  CFTypeRef cf;

  cf = 0;
  if (-[TSUNumberFormatter findCurrencySymbolInString:additionalCurrencyCode:successTSUlString:](self, "findCurrencySymbolInString:additionalCurrencyCode:successTSUlString:", a3, a4, &cf))
  {
    v12 = -[TSUNumberFormatter valueFromString:formatters:value:formatString:currencyCode:](self, "valueFromString:formatters:value:formatString:currencyCode:", cf, -[TSUNumberFormatter p_currencyFormatters](self, "p_currencyFormatters"), a5, a6, a7);
    v13 = v12;
    if (!a4 || v12)
      goto LABEL_14;
    mAdditionalCurrencyCode = self->mAdditionalCurrencyCode;
    if (mAdditionalCurrencyCode)
    {
      if (CFStringCompare(mAdditionalCurrencyCode, a4, 0) == kCFCompareEqualTo)
      {
        mAdditionalCurrencyCodeFormatters = self->mAdditionalCurrencyCodeFormatters;
LABEL_13:
        v13 = -[TSUNumberFormatter valueFromString:formatters:value:formatString:currencyCode:](self, "valueFromString:formatters:value:formatString:currencyCode:", cf, mAdditionalCurrencyCodeFormatters, a5, a6, a7);
LABEL_14:
        CFRelease(cf);
        return v13;
      }
      v15 = self->mAdditionalCurrencyCode;
      if (v15)
        CFRelease(v15);
    }
    v16 = self->mAdditionalCurrencyCodeFormatters;
    if (v16)
      CFRelease(v16);
    v17 = (__CFString *)CFRetain(a4);
    self->mAdditionalCurrencyCode = v17;
    mAdditionalCurrencyCodeFormatters = TSUCreateArrayOfCurrencyFormattersForLocale(self->mLocale, (const __CFArray *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v17));
    self->mAdditionalCurrencyCodeFormatters = mAdditionalCurrencyCodeFormatters;
    goto LABEL_13;
  }
  return 0;
}

- (BOOL)percentageFromString:(__CFString *)a3 value:(double *)a4 formatString:(const __CFString *)a5
{
  return -[TSUNumberFormatter valueFromString:formatters:value:formatString:currencyCode:](self, "valueFromString:formatters:value:formatString:currencyCode:", a3, -[TSUNumberFormatter p_percentageFormatters](self, "p_percentageFormatters"), a4, a5, 0);
}

- (BOOL)scientificFromString:(__CFString *)a3 value:(double *)a4 formatString:(const __CFString *)a5
{
  return -[TSUNumberFormatter valueFromString:formatters:value:formatString:currencyCode:](self, "valueFromString:formatters:value:formatString:currencyCode:", a3, -[TSUNumberFormatter p_scientificFormatters](self, "p_scientificFormatters"), a4, a5, 0);
}

- (BOOL)fractionFromString:(__CFString *)a3 value:(double *)a4
{
  CFRange v7;
  BOOL v9;
  const __CFAllocator *v10;
  const __CFString *v11;
  CFIndex v12;
  const __CFString *v13;
  CFMutableStringRef MutableCopy;
  CFMutableStringRef v15;
  CFRange v16;
  const __CFString *v18;
  CFMutableStringRef v19;
  CFMutableStringRef v20;
  double v21;
  double v22;
  double v23;
  double v24;
  const __CFString *v25;
  CFIndex v26;
  double v28;
  double v29;
  double v30;
  CFRange v31;
  CFRange v32;
  CFRange v33;
  CFRange v34;

  v7 = CFStringFind(a3, CFSTR("/"), 0);
  if (v7.location != -1 && v7.length != 0)
  {
    v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v31.location = 0;
    v31.length = v7.location;
    v11 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x24BDBD240], a3, v31);
    v12 = v7.location + 1;
    if (v12 >= CFStringGetLength(a3))
    {
      v19 = 0;
      v20 = 0;
      v15 = 0;
      MutableCopy = 0;
      v18 = 0;
      v25 = 0;
      v13 = 0;
      goto LABEL_33;
    }
    v32.length = CFStringGetLength(a3) - v12;
    v32.location = v7.location + 1;
    v13 = CFStringCreateWithSubstring(v10, a3, v32);
    MutableCopy = CFStringCreateMutableCopy(v10, 0, v11);
    v15 = CFStringCreateMutableCopy(v10, 0, v13);
    CFStringTrimWhitespace(MutableCopy);
    CFStringTrimWhitespace(v15);
    v16 = CFStringFind(MutableCopy, CFSTR(" "), 0);
    if (v16.location == 0x7FFFFFFFFFFFFFFFLL || v16.length == 0)
    {
      v25 = 0;
      v18 = 0;
      v19 = 0;
      v29 = 0.0;
      v30 = 0.0;
      v28 = 0.0;
    }
    else
    {
      v33.location = 0;
      v33.length = v16.location;
      v25 = CFStringCreateWithSubstring(v10, MutableCopy, v33);
      v26 = v16.location + 1;
      if (v26 >= CFStringGetLength(MutableCopy))
      {
        v19 = 0;
        v20 = 0;
        v18 = 0;
        goto LABEL_33;
      }
      v34.length = CFStringGetLength(MutableCopy) - v26;
      v34.location = v16.location + 1;
      v18 = CFStringCreateWithSubstring(v10, MutableCopy, v34);
      v20 = CFStringCreateMutableCopy(v10, 0, v25);
      v19 = CFStringCreateMutableCopy(v10, 0, v18);
      CFStringTrimWhitespace(v20);
      CFStringTrimWhitespace(v19);
      v29 = 0.0;
      v30 = 0.0;
      v28 = 0.0;
      if (v20)
      {
        if (!TSUImprovedCFNumberFormatterGetValueFromString(self->mFractionFormatter, v20, &v28))
          goto LABEL_33;
        v21 = floor(v28);
        if (vabdd_f64(v28, v21) > 0.00001
          || (TSUImprovedCFNumberFormatterGetValueFromString(self->mFractionFormatter, v19, &v30) & 1) == 0)
        {
          goto LABEL_33;
        }
        goto LABEL_17;
      }
    }
    v20 = 0;
    if ((TSUImprovedCFNumberFormatterGetValueFromString(self->mFractionFormatter, MutableCopy, &v30) & 1) == 0)
      goto LABEL_33;
    v21 = 0.0;
LABEL_17:
    if ((TSUImprovedCFNumberFormatterGetValueFromString(self->mFractionFormatter, v15, &v29) & 1) != 0 && v29 != 0.0)
    {
      v22 = v30;
      if (v21 < 0.0)
      {
        v22 = -v30;
        v30 = -v30;
      }
      v23 = v21 + v22 / v29;
      if (__fpclassifyd(v23) != 2 && __fpclassifyd(v23) != 1)
      {
        if (!a4)
        {
          v9 = 1;
          if (!v11)
            goto LABEL_37;
          goto LABEL_36;
        }
        v24 = v21 + v30 / v29;
        v9 = 1;
LABEL_34:
        *a4 = v24;
LABEL_35:
        if (!v11)
        {
LABEL_37:
          if (v13)
            CFRelease(v13);
          if (v25)
            CFRelease(v25);
          if (v18)
            CFRelease(v18);
          if (MutableCopy)
            CFRelease(MutableCopy);
          if (v15)
            CFRelease(v15);
          if (v20)
            CFRelease(v20);
          if (v19)
            CFRelease(v19);
          return v9;
        }
LABEL_36:
        CFRelease(v11);
        goto LABEL_37;
      }
    }
LABEL_33:
    v9 = 0;
    v24 = 0.0;
    if (!a4)
      goto LABEL_35;
    goto LABEL_34;
  }
  v9 = 0;
  if (a4)
    *a4 = 0.0;
  return v9;
}

- (BOOL)valueFromString:(__CFString *)a3 formatters:(__CFArray *)a4 value:(double *)a5 formatString:(const __CFString *)a6 currencyCode:(const __CFString *)a7
{
  CFIndex Count;
  CFIndex v13;
  __CFNumberFormatter *ValueAtIndex;
  BOOL v15;
  CFStringRef Format;
  const __CFString *v17;
  CFIndex v18;

  Count = CFArrayGetCount(a4);
  if (Count >= 1)
  {
    v13 = Count;
    ValueAtIndex = (__CFNumberFormatter *)CFArrayGetValueAtIndex(a4, 0);
    if ((TSUImprovedCFNumberFormatterGetValueFromString(ValueAtIndex, a3, a5) & 1) != 0)
    {
      v15 = 1;
      if (a6)
      {
LABEL_4:
        Format = CFNumberFormatterGetFormat(ValueAtIndex);
        *a6 = (const __CFString *)CFRetain(Format);
      }
LABEL_5:
      if (a7)
      {
        v17 = (const __CFString *)CFNumberFormatterCopyProperty(ValueAtIndex, (CFNumberFormatterKey)*MEMORY[0x24BDBD440]);
LABEL_16:
        *a7 = v17;
        return v15;
      }
      return v15;
    }
    v18 = 1;
    while (v13 != v18)
    {
      ValueAtIndex = (__CFNumberFormatter *)CFArrayGetValueAtIndex(a4, v18++);
      if (TSUImprovedCFNumberFormatterGetValueFromString(ValueAtIndex, a3, a5))
      {
        v15 = v18 - 1 < v13;
        if (a6)
          goto LABEL_4;
        goto LABEL_5;
      }
    }
  }
  if (a6)
    *a6 = 0;
  v15 = 0;
  if (a7)
  {
    v17 = 0;
    goto LABEL_16;
  }
  return v15;
}

- (BOOL)findCurrencySymbolInString:(__CFString *)a3 additionalCurrencyCode:(__CFString *)a4 successTSUlString:(const __CFString *)a5
{
  CFIndex Length;
  uint64_t v10;
  CFIndex v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  const __CFString *v18;
  _BOOL4 v19;
  __CFString *MutableCopy;
  const __CFString *v21;
  const __CFString **v23;
  CFRange result;
  CFRange v25;
  CFRange v26;
  CFRange v27;
  CFRange v28;

  Length = CFStringGetLength(a3);
  if (!Length
    || ((v10 = Length, Length >= 8) ? (v11 = 8) : (v11 = Length),
        v12 = TSUCurrencyCodesForLocale(self->mLocale, (uint64_t)a4),
        (v13 = objc_msgSend(v12, "count")) == 0))
  {
    LOBYTE(v19) = 0;
    return v19;
  }
  v14 = v13;
  v23 = a5;
  v15 = 0;
  while (1)
  {
    v16 = objc_msgSend(v12, "objectAtIndex:", v15);
    v17 = -[TSUNumberFormatter currencySymbolForCurrencyCode:](self, "currencySymbolForCurrencyCode:", v16);
    v25.location = 0;
    v25.length = v11;
    if (CFStringFindWithOptions(a3, v17, v25, 0, 0))
      break;
    if (v10 >= 1)
    {
      v26.location = v10 - v11;
      v26.length = v11;
      if (CFStringFindWithOptions(a3, v17, v26, 0, 0))
        break;
    }
    v18 = -[TSUNumberFormatter halfWidthCurrencySymbolForCurrencyCode:](self, "halfWidthCurrencySymbolForCurrencyCode:", v16);
    result.location = 0;
    result.length = 0;
    v27.location = 0;
    v27.length = v11;
    if (CFStringFindWithOptions(a3, v18, v27, 0, &result))
    {
      v19 = 1;
    }
    else
    {
      if (v10 < 1)
      {
        LOBYTE(v19) = 0;
        goto LABEL_17;
      }
      v28.location = v10 - v11;
      v28.length = v11;
      v19 = CFStringFindWithOptions(a3, v18, v28, 0, &result) != 0;
    }
    if (v23 && v19)
    {
      LOBYTE(v19) = 1;
      result.length = 1;
      MutableCopy = CFStringCreateMutableCopy(0, 0, a3);
      v21 = -[TSUNumberFormatter currencySymbolForCurrencyCode:](self, "currencySymbolForCurrencyCode:", v16);
      CFStringReplace(MutableCopy, result, v21);
      *v23 = MutableCopy;
      return v19;
    }
    if (v19)
      return v19;
LABEL_17:
    if (++v15 >= v14)
      return v19;
  }
  if (v23)
    *v23 = (const __CFString *)CFRetain(a3);
  LOBYTE(v19) = 1;
  return v19;
}

- (id)displayNameForCurrencyCode:(id)a3
{
  return (id)(id)CFLocaleCopyDisplayNameForPropertyValue(self->mLocale, (CFLocaleKey)*MEMORY[0x24BDBD3E0], (CFStringRef)a3);
}

- (id)currencySymbolForCurrencyCode:(id)a3
{
  const __CFString *v3;
  id v5;
  uint64_t v6;
  NSMutableDictionary *mCurrencyCodeToSymbolMap;
  void *v8;
  const __CFString *v9;
  const __CFDictionary *ComponentsFromLocaleIdentifier;
  __CFDictionary *MutableCopy;
  const __CFString *LocaleIdentifierFromComponents;
  const __CFLocale *v13;

  v3 = (const __CFString *)a3;
  if (!a3)
  {
    v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUNumberFormatter(Private) currencySymbolForCurrencyCode:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNumberFormatter.m"), 2177, CFSTR("can't get the currency symbol for a nil currency code. Using USD."));
    v3 = CFSTR("USD");
  }
  mCurrencyCodeToSymbolMap = self->mCurrencyCodeToSymbolMap;
  objc_sync_enter(mCurrencyCodeToSymbolMap);
  v8 = (void *)-[NSMutableDictionary objectForKey:](self->mCurrencyCodeToSymbolMap, "objectForKey:", v3);
  if (!v8)
  {
    v9 = (const __CFString *)MEMORY[0x219A01708](self->mLocale);
    ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier(0, v9);
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, ComponentsFromLocaleIdentifier);
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x24BDBD3E0], v3);
    LocaleIdentifierFromComponents = CFLocaleCreateLocaleIdentifierFromComponents(0, MutableCopy);
    v13 = CFLocaleCreate(0, LocaleIdentifierFromComponents);
    v8 = (void *)objc_msgSend((id)CFLocaleGetValue(v13, (CFLocaleKey)*MEMORY[0x24BDBD3E8]), "copy");
    -[NSMutableDictionary setObject:forKey:](self->mCurrencyCodeToSymbolMap, "setObject:forKey:", v8, v3);

    CFRelease(v13);
    CFRelease(LocaleIdentifierFromComponents);
    CFRelease(MutableCopy);
    CFRelease(ComponentsFromLocaleIdentifier);
  }
  objc_sync_exit(mCurrencyCodeToSymbolMap);
  return v8;
}

- (id)halfWidthCurrencySymbolForCurrencyCode:(id)a3
{
  NSMutableDictionary *mCurrencyCodeToHalfWidthSymbolMap;
  __CFString *MutableCopy;

  mCurrencyCodeToHalfWidthSymbolMap = self->mCurrencyCodeToHalfWidthSymbolMap;
  objc_sync_enter(mCurrencyCodeToHalfWidthSymbolMap);
  MutableCopy = (__CFString *)-[NSMutableDictionary objectForKey:](self->mCurrencyCodeToHalfWidthSymbolMap, "objectForKey:", a3);
  if (!MutableCopy)
  {
    MutableCopy = CFStringCreateMutableCopy(0, 0, (CFStringRef)-[TSUNumberFormatter currencySymbolForCurrencyCode:](self, "currencySymbolForCurrencyCode:", a3));
    CFStringTransform(MutableCopy, 0, (CFStringRef)*MEMORY[0x24BDBD608], 0);
    -[NSMutableDictionary setObject:forKey:](self->mCurrencyCodeToHalfWidthSymbolMap, "setObject:forKey:", MutableCopy, a3);
    CFRelease(MutableCopy);
  }
  objc_sync_exit(mCurrencyCodeToHalfWidthSymbolMap);
  return MutableCopy;
}

- (id)currentLocaleCurrencyCode
{
  id result;

  result = (id)(id)CFLocaleGetValue(self->mLocale, (CFLocaleKey)*MEMORY[0x24BDBD3E0]);
  if (!result)
    return CFSTR("USD");
  return result;
}

- (id)defaultFormatStringForValueType:(int)a3 negativeStyle:(int)a4
{
  uint64_t v4;
  uint64_t v5;

  v4 = 112;
  if ((a3 - 1) < 3)
    v4 = 8 * (a3 - 1) + 120;
  if (a4 >= 4)
    v5 = 4;
  else
    v5 = a4;
  return (id)objc_msgSend(*(id *)((char *)&self->super.isa + v4), "objectAtIndex:", v5);
}

- (id)defaultFormatStringForValueType:(int)a3
{
  uint64_t v3;

  v3 = 96;
  if ((a3 - 1) < 3)
    v3 = 8 * (a3 - 1) + 72;
  return *(Class *)((char *)&self->super.isa + v3);
}

- (id)localizedPercentSymbol
{
  return self->mPercentSymbol;
}

- (__CFArray)p_decimalFormatters
{
  __CFArray *result;
  __CFArray *v4;

  result = self->mDecimalFormatters;
  if (!result)
  {
    objc_sync_enter(self);
    if (!self->mDecimalFormatters)
    {
      v4 = TSUCreateArrayOfDecimalFormattersForLocale(self->mLocale);
      __dmb(0xBu);
      self->mDecimalFormatters = v4;
    }
    objc_sync_exit(self);
    return self->mDecimalFormatters;
  }
  return result;
}

- (__CFArray)p_currencyFormatters
{
  __CFArray *result;
  __CFLocale *mLocale;
  const __CFArray *v5;
  __CFArray *v6;

  result = self->mCurrencyFormatters;
  if (!result)
  {
    objc_sync_enter(self);
    if (!self->mCurrencyFormatters)
    {
      mLocale = self->mLocale;
      v5 = (const __CFArray *)TSUCurrencyCodesForLocale(mLocale, 0);
      v6 = TSUCreateArrayOfCurrencyFormattersForLocale(mLocale, v5);
      __dmb(0xBu);
      self->mCurrencyFormatters = v6;
    }
    objc_sync_exit(self);
    return self->mCurrencyFormatters;
  }
  return result;
}

- (__CFArray)p_percentageFormatters
{
  __CFArray *result;
  __CFArray *v4;

  result = self->mPercentageFormatters;
  if (!result)
  {
    objc_sync_enter(self);
    if (!self->mPercentageFormatters)
    {
      v4 = TSUCreateArrayOfPercentageFormattersForLocale(self->mLocale);
      __dmb(0xBu);
      self->mPercentageFormatters = v4;
    }
    objc_sync_exit(self);
    return self->mPercentageFormatters;
  }
  return result;
}

- (__CFArray)p_scientificFormatters
{
  __CFArray *result;
  __CFArray *v4;

  result = self->mScientificFormatters;
  if (!result)
  {
    objc_sync_enter(self);
    if (!self->mScientificFormatters)
    {
      v4 = TSUCreateArrayOfScientificFormattersForLocale(self->mLocale);
      __dmb(0xBu);
      self->mScientificFormatters = v4;
    }
    objc_sync_exit(self);
    return self->mScientificFormatters;
  }
  return result;
}

@end
