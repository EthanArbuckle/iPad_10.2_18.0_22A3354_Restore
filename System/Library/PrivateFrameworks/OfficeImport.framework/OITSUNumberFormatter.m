@implementation OITSUNumberFormatter

+ (void)initialize
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  v3 = (void *)sNumberingSystemForZeroChar;
  sNumberingSystemForZeroChar = (uint64_t)&unk_24F46AA00;

  v4 = objc_opt_new();
  v5 = (void *)sNumberingSystemForLocaleIdentifier;
  sNumberingSystemForLocaleIdentifier = v4;

  v6 = objc_alloc_init(MEMORY[0x24BDD1648]);
  v7 = (void *)gLockTSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific;
  gLockTSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific = (uint64_t)v6;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___OITSUNumberFormatter;
  objc_msgSendSuper2(&v8, sel_initialize);
}

+ (id)stringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  if (stringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand__once != -1)
    dispatch_once(&stringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand__once, &__block_literal_global_261);
  v4 = objc_msgSend(v3, "rangeOfCharacterFromSet:", stringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand__replacedCharacterSet);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v3;
  }
  else
  {
    v6 = v4;
    v7 = (void *)objc_msgSend(v3, "mutableCopy");
    v8 = objc_msgSend(v7, "length");
    v9 = v8 - v6;
    objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("−"), CFSTR("-"), 0, v6, v8 - v6);
    objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("﹣"), CFSTR("-"), 0, v6, v9);
    objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("－"), CFSTR("-"), 0, v6, v9);
    objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("﹢"), CFSTR("+"), 0, v6, v9);
    objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("＋"), CFSTR("+"), 0, v6, v9);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

void __88__OITSUNumberFormatter_stringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("−﹣－﹢＋"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand__replacedCharacterSet;
  stringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand__replacedCharacterSet = v0;

}

+ (int)positionOfSymbol:(id)a3 inNumberFormatSubpattern:(id)a4
{
  id v5;
  uint64_t v6;
  _BOOL4 v7;
  unint64_t v8;
  unint64_t v9;

  v5 = a4;
  v6 = objc_msgSend(v5, "rangeOfString:", a3);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    v8 = v6;
    v9 = objc_msgSend(v5, "tsu_indexOfFirstNonPrefixCharacterInNumberFormatSubpattern");
    v7 = v9 != 0x7FFFFFFFFFFFFFFFLL && v8 >= v9;
  }

  return v7;
}

+ (int)positionOfCurrencySymbolInNumberFormatSubpattern:(id)a3
{
  return objc_msgSend(a1, "positionOfSymbol:inNumberFormatSubpattern:", CFSTR("¤"), a3);
}

+ (int)positionOfMinusSignInNumberFormatSubpattern:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("-"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(a1, "positionOfSymbol:inNumberFormatSubpattern:", v6, v5);

  return (int)a1;
}

+ (id)formatString:(id)a3 transformedForNegativeStyle:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  int v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!a4)
  {
    objc_msgSend(v6, "tsu_positiveSubpatternOfNumberFormatPattern");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v14);

    objc_msgSend(v8, "appendString:", CFSTR(";"));
    objc_msgSend(v6, "tsu_positiveSubpatternOfNumberFormatPattern");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (__CFString *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(a1, "formatString:replaceOccurencesOfUnescapedString:withString:", v16, CFSTR("-"), &stru_24F3BFFF8);
    objc_msgSend(v6, "tsu_negativeSubpatternOfNumberFormatPattern");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = +[OITSUNumberFormatter positionOfMinusSignInNumberFormatSubpattern:](OITSUNumberFormatter, "positionOfMinusSignInNumberFormatSubpattern:", v17);

    if (v18)
    {
      objc_msgSend(v8, "appendString:", v16);
      if (v18 != 1)
      {
LABEL_13:

        goto LABEL_14;
      }
      v19 = CFSTR("-");
      v20 = v8;
    }
    else
    {
      objc_msgSend(v8, "appendString:", CFSTR("-"));
      v20 = v8;
      v19 = v16;
    }
    objc_msgSend(v20, "appendString:", v19);
    goto LABEL_13;
  }
  if (a4 == 1)
  {
    objc_msgSend(v6, "tsu_positiveSubpatternOfNumberFormatPattern");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v9);

    objc_msgSend(v8, "appendString:", CFSTR(";"));
    objc_msgSend(v6, "tsu_positiveSubpatternOfNumberFormatPattern");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (__CFString *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(a1, "formatString:replaceOccurencesOfUnescapedString:withString:", v11, CFSTR("-"), &stru_24F3BFFF8);
    v12 = v8;
    v13 = v11;
  }
  else
  {
    if ((a4 & 0xFFFFFFFE) != 2)
    {
      objc_msgSend(v7, "appendString:", v6);
      goto LABEL_14;
    }
    objc_msgSend(v6, "tsu_positiveSubpatternOfNumberFormatPattern");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v21);

    objc_msgSend(v8, "appendString:", CFSTR(";"));
    objc_msgSend(v6, "tsu_positiveSubpatternOfNumberFormatPattern");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (__CFString *)objc_msgSend(v22, "mutableCopy");

    objc_msgSend(a1, "formatString:replaceOccurencesOfUnescapedString:withString:", v11, CFSTR("-"), &stru_24F3BFFF8);
    objc_msgSend(v8, "appendString:", CFSTR("("));
    objc_msgSend(v8, "appendString:", v11);
    v13 = CFSTR(")");
    v12 = v8;
  }
  objc_msgSend(v12, "appendString:", v13);

LABEL_14:
  return v8;
}

+ (void)formatString:(id)a3 replaceOccurencesOfUnescapedString:(id)a4 withString:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v26 = a3;
  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_msgSend(v26, "tsu_newRangesOfEscapedCharactersInNumberFormatPattern");
  v10 = objc_msgSend(v26, "length");
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "replaceOccurrencesOfString:withString:options:range:", v7, v8, 0, 0, objc_msgSend(v11, "rangeValue"));

    if ((unint64_t)objc_msgSend(v9, "count") >= 2)
    {
      v12 = 1;
      do
      {
        v13 = objc_msgSend(v26, "length");
        objc_msgSend(v9, "objectAtIndex:", v12 - 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "rangeValue");
        v17 = v16;

        objc_msgSend(v9, "objectAtIndex:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "rangeValue");

        objc_msgSend(v26, "replaceOccurrencesOfString:withString:options:range:", v7, v8, 0, v17 + v15 - v10 + v13, v19 - (v17 + v15));
        ++v12;
      }
      while (v12 < objc_msgSend(v9, "count"));
    }
    objc_msgSend(v9, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "rangeValue");
    v23 = v22;

    v24 = v21 + v23;
    v25 = objc_msgSend(v26, "length") - (v21 + v23);
  }
  else
  {
    v25 = objc_msgSend(v26, "length");
    v24 = 0;
  }
  objc_msgSend(v26, "replaceOccurrencesOfString:withString:options:range:", v7, v8, 0, v24, v25);

}

+ (id)displayNameForCurrencyCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "formatterForLocale:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayNameForCurrencyCode:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)currencySymbolForCurrencyCode:(id)a3
{
  return (id)objc_msgSend(a1, "currencySymbolForCurrencyCode:locale:", a3, 0);
}

+ (id)currencySymbolForCurrencyCode:(id)a3 locale:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "formatterForLocale:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currencySymbolForCurrencyCode:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (unsigned)defaultDecimalPlacesForCurrencyCode:(id)a3
{
  int v3;
  void *v4;
  void *v5;
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
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[OITSUNumberFormatter defaultDecimalPlacesForCurrencyCode:]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormatter.m");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 1376, 0, "Couldn't get decimal info for a currency code.");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    LOWORD(v3) = 0;
  }
  return v3;
}

+ (id)defaultCurrencyCodeForLocale:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "formatterForLocale:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currencyCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)currentLocaleCurrencyCode
{
  return (id)objc_msgSend(a1, "defaultCurrencyCodeForLocale:", 0);
}

+ (id)currentLocaleDecimalSeparator
{
  void *v2;
  void *v3;

  +[OITSULocale currentLocale](OITSULocale, "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decimalSeparator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)currentLocaleCurrencyDecimalSeparator
{
  void *v2;
  void *v3;

  +[OITSULocale currentLocale](OITSULocale, "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currencyDecimalSeparator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)numberFormatStringSpecialSymbols
{
  return (id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("0123456789@#.-,E+;'*%‰¤"));
}

+ (id)defaultFormatStringForValueType:(int)a3 negativeStyle:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  objc_msgSend(a1, "formatterForLocale:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultFormatStringForValueType:negativeStyle:", v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)defaultFormatStringForValueType:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(a1, "formatterForLocale:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultFormatStringForValueType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)decimalSeparatorForLocale:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "formatterForLocale:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decimalSeparator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)groupingSeparatorForLocale:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "formatterForLocale:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupingSeparator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)currencyDecimalSeparatorForLocale:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "formatterForLocale:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currencyDecimalSeparator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)currencyGroupingSeparatorForLocale:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "formatterForLocale:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currencyGroupingSeparator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)percentSymbolForLocale:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "formatterForLocale:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "percentSymbol");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (unint64_t)groupingSizeForLocale:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a1, "formatterForLocale:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "groupingSize");

  return v4;
}

+ (id)userVisibleCurrencyCodes
{
  void *v2;
  int v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("SFTDefaultsShowCompleteCurrencyList"));

  if (v3)
  {
    v4 = CFLocaleCopyCommonISOCurrencyCodes();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", CFSTR("AUD"), CFSTR("CAD"), CFSTR("HKD"), CFSTR("SGD"), CFSTR("TWD"), CFSTR("USD"), CFSTR("EUR"), CFSTR("CHF"), CFSTR("SEK"), CFSTR("DKK"), CFSTR("NOK"), CFSTR("MXN"), CFSTR("GBP"), CFSTR("BRL"), CFSTR("INR"), CFSTR("KRW"), CFSTR("JPY"),
      CFSTR("CNY"),
      CFSTR("IDR"),
      CFSTR("RUB"),
      CFSTR("TRY"),
      CFSTR("THB"),
      CFSTR("PLN"),
      CFSTR("ZAR"),
      CFSTR("ARS"),
      CFSTR("SAR"),
      CFSTR("AED"),
      CFSTR("EGP"),
      CFSTR("HRK"),
      CFSTR("CZK"),
      CFSTR("ILS"),
      CFSTR("HUF"),
      CFSTR("RON"),
      CFSTR("UAH"),
      CFSTR("VND"),
      CFSTR("MYR"),
      0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUNumberFormatter currentLocaleCurrencyCode](OITSUNumberFormatter, "currentLocaleCurrencyCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "containsObject:", v5) & 1) == 0)
      objc_msgSend(v4, "insertObject:atIndex:", v5, 0);

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalCurrencyCodeFormatters, 0);
  objc_storeStrong((id *)&self->_additionalCurrencyCode, 0);
  objc_storeStrong((id *)&self->_currencyCodeToHalfWidthSymbolMap, 0);
  objc_storeStrong((id *)&self->_currencyCodeToSymbolMap, 0);
  objc_storeStrong((id *)&self->_harmonizedNumberFormatterSymbols, 0);
  objc_storeStrong((id *)&self->_transformedScientificStrings, 0);
  objc_storeStrong((id *)&self->_transformedPercentageStrings, 0);
  objc_storeStrong((id *)&self->_transformedCurrencyStrings, 0);
  objc_storeStrong((id *)&self->_transformedDecimalStrings, 0);
  objc_storeStrong((id *)&self->_percentSymbol, 0);
  objc_storeStrong((id *)&self->_currencyGroupingSeparator, 0);
  objc_storeStrong((id *)&self->_groupingSeparator, 0);
  objc_storeStrong((id *)&self->_currencyDecimalSeparator, 0);
  objc_storeStrong((id *)&self->_decimalSeparator, 0);
  objc_storeStrong((id *)&self->_decimalString, 0);
  objc_storeStrong((id *)&self->_scientificString, 0);
  objc_storeStrong((id *)&self->_percentageString, 0);
  objc_storeStrong((id *)&self->_currencyString, 0);
  objc_storeStrong((id *)&self->_scientificFormatters, 0);
  objc_storeStrong((id *)&self->_percentageFormatters, 0);
  objc_storeStrong((id *)&self->_currencyFormatters, 0);
  objc_storeStrong((id *)&self->_decimalFormatters, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

+ (__CFNumberFormatter)createHarmonizedCFNumberFormatterWithLocale:(id)a3 style:(int64_t)a4
{
  void *v5;
  __CFNumberFormatter *v6;

  +[OITSUNumberFormatter formatterForLocale:](OITSUNumberFormatter, "formatterForLocale:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFNumberFormatter *)objc_msgSend(v5, "p_createHarmonizedCFNumberFormatterOfStyle:", a4);

  return v6;
}

+ (id)formatterForLocale:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "threadDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    TSUNumberFormatterThreadDictionaryKeyForLocale(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithLocale:", v4);
      objc_msgSend(v6, "setObject:forKey:", v8, v7);
      if (+[OITSULocale localeIsAutoUpdating:](OITSULocale, "localeIsAutoUpdating:", v4))
      {
        v9 = MEMORY[0x24BDAC760];
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __52__OITSUNumberFormatter_Private__formatterForLocale___block_invoke;
        v19[3] = &unk_24F39A900;
        v10 = v5;
        v20 = v10;
        v11 = v8;
        v21 = v11;
        TSURegisterLocaleChangeObserver((uint64_t)v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("TSUNumberFormatterThreadDictionaryLocaleObserverKey"));
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *MEMORY[0x24BDD12C8];
        v17[0] = v9;
        v17[1] = 3221225472;
        v17[2] = __52__OITSUNumberFormatter_Private__formatterForLocale___block_invoke_2;
        v17[3] = &unk_24F39A928;
        v8 = v11;
        v18 = v8;
        objc_msgSend(v13, "addObserverForName:object:queue:usingBlock:", v14, v10, 0, v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "setObject:forKey:", v15, CFSTR("TSUNumberFormatterThreadDictionaryExitObserverKey"));
      }
    }

  }
  else
  {
    +[OITSULocale currentLocale](OITSULocale, "currentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "formatterForLocale:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

void __52__OITSUNumberFormatter_Private__formatterForLocale___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "p_numberPreferencesChanged:", v5);
  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "performSelector:onThread:withObject:waitUntilDone:", sel_p_numberPreferencesChanged_, *(_QWORD *)(a1 + 32), v5, 0);
  }

}

uint64_t __52__OITSUNumberFormatter_Private__formatterForLocale___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_numberPreferencesChanged:", a2);
}

- (OITSUNumberFormatter)initWithLocale:(id)a3
{
  id v4;
  OITSUNumberFormatter *v5;
  NSLocale *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSLocale *locale;
  NSMutableDictionary *v17;
  NSMutableDictionary *currencyCodeToHalfWidthSymbolMap;
  NSMutableDictionary *v19;
  NSMutableDictionary *currencyCodeToSymbolMap;
  __CFNumberFormatter *v21;
  uint64_t v22;
  NSString *currencyString;
  NSString *v24;
  NSString *currencyDecimalSeparator;
  NSString *v26;
  NSString *currencyGroupingSeparator;
  __CFNumberFormatter *v28;
  NSString *v29;
  NSString *percentSymbol;
  uint64_t v31;
  NSString *percentageString;
  __CFNumberFormatter *v33;
  uint64_t v34;
  NSString *scientificString;
  __CFNumberFormatter *v36;
  uint64_t v37;
  NSString *decimalString;
  NSString *v39;
  NSString *decimalSeparator;
  NSString *v41;
  NSString *groupingSeparator;
  void *v43;
  uint64_t v44;
  NSMutableArray *transformedDecimalStrings;
  uint64_t v46;
  NSMutableArray *transformedCurrencyStrings;
  uint64_t v48;
  NSMutableArray *transformedPercentageStrings;
  uint64_t v50;
  NSMutableArray *transformedScientificStrings;
  uint64_t i;
  NSMutableArray *v53;
  void *v54;
  NSMutableArray *v55;
  void *v56;
  NSMutableArray *v57;
  void *v58;
  NSMutableArray *v59;
  void *v60;
  objc_super v62;

  v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)OITSUNumberFormatter;
  v5 = -[OITSUNumberFormatter init](&v62, sel_init);
  if (v5)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUNumberFormatter(Private) initWithLocale:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormatter.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1527, 1, "TSUNumberFormatter cannot be initialized without a locale. Please check comments near this assertion or <rdar://problem/23557988> for details.");

      TSUCrash((uint64_t)"TSUNumberFormatter cannot be initialized without a locale. Please check comments near this assertion or <rdar://problem/23557988> for details.", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v62.receiver);
    }
    v6 = (NSLocale *)v4;
    locale = v5->_locale;
    v5->_locale = v6;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    currencyCodeToHalfWidthSymbolMap = v5->_currencyCodeToHalfWidthSymbolMap;
    v5->_currencyCodeToHalfWidthSymbolMap = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    currencyCodeToSymbolMap = v5->_currencyCodeToSymbolMap;
    v5->_currencyCodeToSymbolMap = v19;

    v21 = -[OITSUNumberFormatter p_createHarmonizedCFNumberFormatterOfStyle:](v5, "p_createHarmonizedCFNumberFormatterOfStyle:", 2);
    v22 = -[__CFString copy]((id)CFNumberFormatterGetFormat(v21), "copy");
    currencyString = v5->_currencyString;
    v5->_currencyString = (NSString *)v22;

    v24 = (NSString *)CFNumberFormatterCopyProperty(v21, (CFNumberFormatterKey)*MEMORY[0x24BDBD448]);
    currencyDecimalSeparator = v5->_currencyDecimalSeparator;
    v5->_currencyDecimalSeparator = v24;

    v26 = (NSString *)CFNumberFormatterCopyProperty(v21, (CFNumberFormatterKey)*MEMORY[0x24BDBD450]);
    currencyGroupingSeparator = v5->_currencyGroupingSeparator;
    v5->_currencyGroupingSeparator = v26;

    CFRelease(v21);
    v28 = -[OITSUNumberFormatter p_createHarmonizedCFNumberFormatterOfStyle:](v5, "p_createHarmonizedCFNumberFormatterOfStyle:", 3);
    v29 = (NSString *)CFNumberFormatterCopyProperty(v28, (CFNumberFormatterKey)*MEMORY[0x24BDBD518]);
    percentSymbol = v5->_percentSymbol;
    v5->_percentSymbol = v29;

    v31 = -[__CFString copy]((id)CFNumberFormatterGetFormat(v28), "copy");
    percentageString = v5->_percentageString;
    v5->_percentageString = (NSString *)v31;

    CFRelease(v28);
    v33 = -[OITSUNumberFormatter p_createHarmonizedCFNumberFormatterOfStyle:](v5, "p_createHarmonizedCFNumberFormatterOfStyle:", 0);
    CFNumberFormatterSetFormat(v33, CFSTR("#.##E+00"));
    v34 = -[__CFString copy]((id)CFNumberFormatterGetFormat(v33), "copy");
    scientificString = v5->_scientificString;
    v5->_scientificString = (NSString *)v34;

    CFRelease(v33);
    v36 = -[OITSUNumberFormatter p_createHarmonizedCFNumberFormatterOfStyle:](v5, "p_createHarmonizedCFNumberFormatterOfStyle:", 1);
    v37 = -[__CFString copy]((id)CFNumberFormatterGetFormat(v36), "copy");
    decimalString = v5->_decimalString;
    v5->_decimalString = (NSString *)v37;

    v39 = (NSString *)CFNumberFormatterCopyProperty(v36, (CFNumberFormatterKey)*MEMORY[0x24BDBD460]);
    decimalSeparator = v5->_decimalSeparator;
    v5->_decimalSeparator = v39;

    v41 = (NSString *)CFNumberFormatterCopyProperty(v36, (CFNumberFormatterKey)*MEMORY[0x24BDBD480]);
    groupingSeparator = v5->_groupingSeparator;
    v5->_groupingSeparator = v41;

    v43 = (void *)CFNumberFormatterCopyProperty(v36, (CFNumberFormatterKey)*MEMORY[0x24BDBD488]);
    v5->_groupingSize = objc_msgSend(v43, "unsignedIntegerValue");
    CFRelease(v36);
    v44 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
    transformedDecimalStrings = v5->_transformedDecimalStrings;
    v5->_transformedDecimalStrings = (NSMutableArray *)v44;

    v46 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
    transformedCurrencyStrings = v5->_transformedCurrencyStrings;
    v5->_transformedCurrencyStrings = (NSMutableArray *)v46;

    v48 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
    transformedPercentageStrings = v5->_transformedPercentageStrings;
    v5->_transformedPercentageStrings = (NSMutableArray *)v48;

    v50 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
    transformedScientificStrings = v5->_transformedScientificStrings;
    v5->_transformedScientificStrings = (NSMutableArray *)v50;

    for (i = 0; i != 5; ++i)
    {
      v53 = v5->_transformedDecimalStrings;
      +[OITSUNumberFormatter formatString:transformedForNegativeStyle:](OITSUNumberFormatter, "formatString:transformedForNegativeStyle:", v5->_decimalString, i);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray insertObject:atIndex:](v53, "insertObject:atIndex:", v54, i);

      v55 = v5->_transformedCurrencyStrings;
      +[OITSUNumberFormatter formatString:transformedForNegativeStyle:](OITSUNumberFormatter, "formatString:transformedForNegativeStyle:", v5->_currencyString, i);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray insertObject:atIndex:](v55, "insertObject:atIndex:", v56, i);

      v57 = v5->_transformedPercentageStrings;
      +[OITSUNumberFormatter formatString:transformedForNegativeStyle:](OITSUNumberFormatter, "formatString:transformedForNegativeStyle:", v5->_percentageString, i);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray insertObject:atIndex:](v57, "insertObject:atIndex:", v58, i);

      v59 = v5->_transformedScientificStrings;
      +[OITSUNumberFormatter formatString:transformedForNegativeStyle:](OITSUNumberFormatter, "formatString:transformedForNegativeStyle:", v5->_scientificString, i);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray insertObject:atIndex:](v59, "insertObject:atIndex:", v60, i);

    }
    v5->_fractionFormatter = -[OITSUNumberFormatter p_createHarmonizedCFNumberFormatterOfStyle:](v5, "p_createHarmonizedCFNumberFormatterOfStyle:", 1);

  }
  return v5;
}

- (void)dealloc
{
  __CFNumberFormatter *fractionFormatter;
  objc_super v4;

  fractionFormatter = self->_fractionFormatter;
  if (fractionFormatter)
  {
    CFRelease(fractionFormatter);
    self->_fractionFormatter = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)OITSUNumberFormatter;
  -[OITSUNumberFormatter dealloc](&v4, sel_dealloc);
}

- (__CFNumberFormatter)p_createHarmonizedCFNumberFormatterOfStyle:(int64_t)a3
{
  NSLocale *v5;
  BOOL v6;
  uint64_t v7;
  __CFNumberFormatter *v8;
  void *v9;
  void *v10;
  void *v11;
  OITSULocaleStructuredDictionary *harmonizedNumberFormatterSymbols;
  void *v13;
  void *v14;
  const __CFString *v15;
  OITSULocaleStructuredDictionary *v16;
  int64_t v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  OITSULocaleStructuredDictionary *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  OITSULocaleStructuredDictionary *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  OITSULocaleStructuredDictionary *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  OITSULocaleStructuredDictionary *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  OITSULocaleStructuredDictionary *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  OITSULocaleStructuredDictionary *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  OITSULocaleStructuredDictionary *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  OITSULocaleStructuredDictionary *v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  OITSULocaleStructuredDictionary *v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  OITSULocaleStructuredDictionary *v57;
  void *v58;
  void *v59;
  OITSULocaleStructuredDictionary *v60;
  void *v61;
  void *v62;
  OITSULocaleStructuredDictionary *v63;
  void *v64;
  __CFString *v65;

  v5 = self->_locale;
  v6 = +[OITSULocale localeIsAutoUpdating:](OITSULocale, "localeIsAutoUpdating:", v5);
  if (!v6)
  {
    TSULocaleNSLocaleWithHarmonizedNumberingSystem(v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (NSLocale *)v7;
  }
  v8 = CFNumberFormatterCreate(0, (CFLocaleRef)v5, (CFNumberFormatterStyle)a3);
  if (v8)
  {
    if (v6)
      goto LABEL_17;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUNumberFormatter(Private) p_createHarmonizedCFNumberFormatterOfStyle:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormatter.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1616, 0, "invalid nil value for '%{public}s'", "formatter");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    if (v6)
      goto LABEL_17;
  }
  -[OITSUNumberFormatter p_loadHarmonizedNumberFormatterSymbols](self, "p_loadHarmonizedNumberFormatterSymbols");
  TSUNumberFormatterNumberingSystemForFormatter(v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  harmonizedNumberFormatterSymbols = self->_harmonizedNumberFormatterSymbols;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("symbol-%@-decimal"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[OITSULocaleStructuredDictionary objectForKey:locale:](harmonizedNumberFormatterSymbols, "objectForKey:locale:", v13, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (const __CFString *)*MEMORY[0x24BDBD460];
    v16 = self->_harmonizedNumberFormatterSymbols;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("symbol-%@-decimal"), v11);
    v17 = a3;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSULocaleStructuredDictionary objectForKey:locale:](v16, "objectForKey:locale:", v18, v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    CFNumberFormatterSetProperty(v8, v15, v19);

    v20 = (const __CFString *)*MEMORY[0x24BDBD480];
    v21 = self->_harmonizedNumberFormatterSymbols;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("symbol-%@-group"), v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSULocaleStructuredDictionary objectForKey:locale:](v21, "objectForKey:locale:", v22, v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    CFNumberFormatterSetProperty(v8, v20, v23);

    v24 = (const __CFString *)*MEMORY[0x24BDBD448];
    v25 = self->_harmonizedNumberFormatterSymbols;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("symbol-%@-decimal"), v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSULocaleStructuredDictionary objectForKey:locale:](v25, "objectForKey:locale:", v26, v5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    CFNumberFormatterSetProperty(v8, v24, v27);

    a3 = v17;
    v28 = (const __CFString *)*MEMORY[0x24BDBD450];
    v29 = self->_harmonizedNumberFormatterSymbols;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("symbol-%@-group"), v11);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSULocaleStructuredDictionary objectForKey:locale:](v29, "objectForKey:locale:", v30, v5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    CFNumberFormatterSetProperty(v8, v28, v31);

    v32 = (const __CFString *)*MEMORY[0x24BDBD518];
    v33 = self->_harmonizedNumberFormatterSymbols;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("symbol-%@-percentSign"), v11);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSULocaleStructuredDictionary objectForKey:locale:](v33, "objectForKey:locale:", v34, v5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    CFNumberFormatterSetProperty(v8, v32, v35);

    v36 = (const __CFString *)*MEMORY[0x24BDBD520];
    v37 = self->_harmonizedNumberFormatterSymbols;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("symbol-%@-plusSign"), v11);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSULocaleStructuredDictionary objectForKey:locale:](v37, "objectForKey:locale:", v38, v5);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    CFNumberFormatterSetProperty(v8, v36, v39);

    v40 = (const __CFString *)*MEMORY[0x24BDBD4D8];
    v41 = self->_harmonizedNumberFormatterSymbols;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("symbol-%@-minusSign"), v11);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSULocaleStructuredDictionary objectForKey:locale:](v41, "objectForKey:locale:", v42, v5);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    CFNumberFormatterSetProperty(v8, v40, v43);

    v44 = (const __CFString *)*MEMORY[0x24BDBD470];
    v45 = self->_harmonizedNumberFormatterSymbols;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("symbol-%@-exponential"), v11);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSULocaleStructuredDictionary objectForKey:locale:](v45, "objectForKey:locale:", v46, v5);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    CFNumberFormatterSetProperty(v8, v44, v47);

    v48 = (const __CFString *)*MEMORY[0x24BDBD510];
    v49 = self->_harmonizedNumberFormatterSymbols;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("symbol-%@-perMille"), v11);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSULocaleStructuredDictionary objectForKey:locale:](v49, "objectForKey:locale:", v50, v5);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    CFNumberFormatterSetProperty(v8, v48, v51);

    v52 = (const __CFString *)*MEMORY[0x24BDBD490];
    v53 = self->_harmonizedNumberFormatterSymbols;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("symbol-%@-infinity"), v11);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSULocaleStructuredDictionary objectForKey:locale:](v53, "objectForKey:locale:", v54, v5);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    CFNumberFormatterSetProperty(v8, v52, v55);

    v56 = (const __CFString *)*MEMORY[0x24BDBD4E8];
    v57 = self->_harmonizedNumberFormatterSymbols;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("symbol-%@-nan"), v11);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSULocaleStructuredDictionary objectForKey:locale:](v57, "objectForKey:locale:", v58, v5);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    CFNumberFormatterSetProperty(v8, v56, v59);

  }
  v60 = self->_harmonizedNumberFormatterSymbols;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("format-%@-decimalFormat"), v11);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[OITSULocaleStructuredDictionary objectForKey:locale:](v60, "objectForKey:locale:", v61, v5);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    switch(a3)
    {
      case 0:
      case 1:
        v63 = self->_harmonizedNumberFormatterSymbols;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("format-%@-decimalFormat"), v11);
        goto LABEL_15;
      case 2:
        v63 = self->_harmonizedNumberFormatterSymbols;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("format-%@-currencyFormat"), v11);
        goto LABEL_15;
      case 3:
        v63 = self->_harmonizedNumberFormatterSymbols;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("format-%@-percentFormat"), v11);
        goto LABEL_15;
      case 4:
        v63 = self->_harmonizedNumberFormatterSymbols;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("format-%@-scientificFormat"), v11);
LABEL_15:
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[OITSULocaleStructuredDictionary objectForKey:locale:](v63, "objectForKey:locale:", v64, v5);
        v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
        CFNumberFormatterSetFormat(v8, v65);

        break;
      default:
        break;
    }
  }

LABEL_17:
  return v8;
}

- (void)p_numberPreferencesChanged:(id)a3
{
  void *v4;
  OITSUNumberFormatter *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKey:", CFSTR("TSUNumberFormatterThreadDictionaryKey"));
  v5 = (OITSUNumberFormatter *)objc_claimAutoreleasedReturnValue();
  if (v5 != self)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUNumberFormatter(Private) p_numberPreferencesChanged:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormatter.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1703, 0, "Registered wrong date formatter for date preference change notification");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  objc_msgSend(v11, "removeObjectForKey:", CFSTR("TSUNumberFormatterThreadDictionaryKey"));
  objc_msgSend(v11, "objectForKey:", CFSTR("TSUNumberFormatterThreadDictionaryLocaleObserverKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  TSURemoveLocaleChangeObserver(v8);

  objc_msgSend(v11, "removeObjectForKey:", CFSTR("TSUNumberFormatterThreadDictionaryLocaleObserverKey"));
  objc_msgSend(v11, "objectForKey:", CFSTR("TSUNumberFormatterThreadDictionaryExitObserverKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:", v9);

  objc_msgSend(v11, "removeObjectForKey:", CFSTR("TSUNumberFormatterThreadDictionaryExitObserverKey"));
}

- (BOOL)decimalFromString:(id)a3 value:(double *)a4 formatString:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  -[OITSUNumberFormatter p_decimalFormatters](self, "p_decimalFormatters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[OITSUNumberFormatter p_valueFromString:formatters:value:formatString:](self, "p_valueFromString:formatters:value:formatString:", v8, v9, a4, a5);

  return (char)a5;
}

- (BOOL)currencyFromString:(id)a3 additionalCurrencyCode:(id)a4 value:(double *)a5 formatString:(id *)a6 currencyCode:(id *)a7
{
  id v12;
  void *v13;
  id v14;
  NSString *v15;
  NSString *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL4 v28;
  NSString *additionalCurrencyCode;
  NSDictionary *additionalCurrencyCodeFormatters;
  void *v31;
  NSDictionary *v32;
  NSDictionary *v33;
  id *v34;
  NSString *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSString *v46;
  void *v48;
  id v50;
  id v51;

  v12 = a4;
  v50 = 0;
  v51 = 0;
  -[OITSUNumberFormatter p_findCurrencySymbolInString:additionalCurrencyCode:successfullString:currencyCode:](self, "p_findCurrencySymbolInString:additionalCurrencyCode:successfullString:currencyCode:", a3, v12, &v51, &v50);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v51;
  v15 = (NSString *)v50;
  v16 = v15;
  v17 = 0;
  if (v13 && v15)
  {
    -[OITSUNumberFormatter p_currencyFormatters](self, "p_currencyFormatters");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectForKeyedSubscript:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUNumberFormatter(Private) currencyFromString:additionalCurrencyCode:value:formatString:currencyCode:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormatter.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 1741, 1, v16, self->_locale);

      TSUCrash((uint64_t)"No currency formatters found for currencyCode:%{public}@ locale:%{public}@", v21, v22, v23, v24, v25, v26, v27, (uint64_t)v16);
    }
    v28 = -[OITSUNumberFormatter p_valueFromString:formatters:value:formatString:](self, "p_valueFromString:formatters:value:formatString:", v14, v18, a5, a6);
    v17 = v28;
    if (!v12 || v28)
      goto LABEL_15;
    if (self->_additionalCurrencyCode)
    {
      if ((objc_msgSend(v12, "isEqualToString:") & 1) != 0)
      {
LABEL_12:
        v34 = a6;
        v35 = self->_additionalCurrencyCode;

        -[NSDictionary objectForKey:](self->_additionalCurrencyCodeFormatters, "objectForKey:", self->_additionalCurrencyCode);
        v36 = objc_claimAutoreleasedReturnValue();

        if (!v36)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUNumberFormatter(Private) currencyFromString:additionalCurrencyCode:value:formatString:currencyCode:]");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormatter.m");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v37, v38, 1764, 1, self->_additionalCurrencyCode, self->_locale);

          TSUCrash((uint64_t)"No currency formatters found for additional currencyCode:%{public}@ locale:%{public}@", v39, v40, v41, v42, v43, v44, v45, (uint64_t)self->_additionalCurrencyCode);
        }
        v17 = -[OITSUNumberFormatter p_valueFromString:formatters:value:formatString:](self, "p_valueFromString:formatters:value:formatString:", v14, v36, a5, v34);
        v16 = v35;
        v18 = (void *)v36;
LABEL_15:

        goto LABEL_16;
      }
      additionalCurrencyCode = self->_additionalCurrencyCode;
    }
    else
    {
      additionalCurrencyCode = 0;
    }
    self->_additionalCurrencyCode = 0;

    additionalCurrencyCodeFormatters = self->_additionalCurrencyCodeFormatters;
    self->_additionalCurrencyCodeFormatters = 0;

    objc_storeStrong((id *)&self->_additionalCurrencyCode, a4);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", self->_additionalCurrencyCode);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSUNumberFormatter p_createDictionaryOfCurrencyFormattersForCurrencies:](self, "p_createDictionaryOfCurrencyFormattersForCurrencies:", v31);
    v32 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v33 = self->_additionalCurrencyCodeFormatters;
    self->_additionalCurrencyCodeFormatters = v32;

    goto LABEL_12;
  }
LABEL_16:
  if (a7)
  {
    if (v17)
      v46 = v16;
    else
      v46 = 0;
    *a7 = objc_retainAutorelease(v46);
  }

  return v17;
}

- (BOOL)percentageFromString:(id)a3 value:(double *)a4 formatString:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  -[OITSUNumberFormatter p_percentageFormatters](self, "p_percentageFormatters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[OITSUNumberFormatter p_valueFromString:formatters:value:formatString:](self, "p_valueFromString:formatters:value:formatString:", v8, v9, a4, a5);

  return (char)a5;
}

- (BOOL)scientificFromString:(id)a3 value:(double *)a4 formatString:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  -[OITSUNumberFormatter p_scientificFormatters](self, "p_scientificFormatters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[OITSUNumberFormatter p_valueFromString:formatters:value:formatString:](self, "p_valueFromString:formatters:value:formatString:", v8, v9, a4, a5);

  return (char)a5;
}

- (BOOL)fractionFromString:(id)a3 value:(double *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  char ValueFromString;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;

  v6 = a3;
  v7 = objc_msgSend(v6, "rangeOfString:", CFSTR("/"));
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || v8 == 0)
  {
    v12 = 0;
    if (!a4)
    {
LABEL_26:
      v10 = 0;
      goto LABEL_41;
    }
  }
  else
  {
    v11 = v7;
    objc_msgSend(v6, "substringWithRange:", 0, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11 + 1;
    if (v13 < objc_msgSend(v6, "length"))
    {
      objc_msgSend(v6, "substringWithRange:", v13, objc_msgSend(v6, "length") - v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "rangeOfString:", CFSTR(" "));
      if (v18 == 0x7FFFFFFFFFFFFFFFLL || v19 == 0)
      {
        v27 = 0;
        v35 = 0;
        v36 = 0;
        v38 = 0.0;
        v39 = 0.0;
        v37 = 0.0;
      }
      else
      {
        v26 = v18;
        objc_msgSend(v16, "substringWithRange:", 0, v18);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v26 + 1;
        if (v28 >= objc_msgSend(v16, "length"))
        {
          v10 = 0;
          if (a4)
            *a4 = 0.0;
          goto LABEL_40;
        }
        v34 = v17;
        objc_msgSend(v16, "substringWithRange:", v28, objc_msgSend(v16, "length") - v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringByTrimmingCharactersInSet:", v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v29;
        objc_msgSend(v29, "stringByTrimmingCharactersInSet:", v15);
        v30 = objc_claimAutoreleasedReturnValue();
        v38 = 0.0;
        v39 = 0.0;
        v37 = 0.0;
        v35 = (void *)v30;
        if (v21)
        {
          v31 = (void *)v30;
          if (!TSUImprovedCFNumberFormatterGetValueFromString(self->_fractionFormatter, v21, &v37)
            || (v22 = floor(v37), vabdd_f64(v37, v22) > 0.00001))
          {
            v10 = 0;
            v25 = 0.0;
            v17 = v34;
            if (!a4)
              goto LABEL_39;
            goto LABEL_38;
          }
          ValueFromString = TSUImprovedCFNumberFormatterGetValueFromString(self->_fractionFormatter, v31, &v39);
          v17 = v34;
          if ((ValueFromString & 1) == 0)
          {
LABEL_37:
            v10 = 0;
            v25 = 0.0;
            if (!a4)
            {
LABEL_39:

LABEL_40:
              goto LABEL_41;
            }
LABEL_38:
            *a4 = v25;
            goto LABEL_39;
          }
LABEL_17:
          if ((TSUImprovedCFNumberFormatterGetValueFromString(self->_fractionFormatter, v17, &v38) & 1) != 0
            && v38 != 0.0)
          {
            v23 = v39;
            if (v22 < 0.0)
            {
              v23 = -v39;
              v39 = -v39;
            }
            v24 = v22 + v23 / v38;
            if (__fpclassifyd(v24) != 2 && __fpclassifyd(v24) != 1)
            {
              if (!a4)
              {
                v10 = 1;
                goto LABEL_39;
              }
              v25 = v22 + v39 / v38;
              v10 = 1;
              goto LABEL_38;
            }
          }
          goto LABEL_37;
        }
        v17 = v34;
      }
      v21 = 0;
      if ((TSUImprovedCFNumberFormatterGetValueFromString(self->_fractionFormatter, v16, &v39) & 1) == 0)
        goto LABEL_37;
      v22 = 0.0;
      goto LABEL_17;
    }
    if (!a4)
      goto LABEL_26;
  }
  v10 = 0;
  *a4 = 0.0;
LABEL_41:

  return v10;
}

- (BOOL)p_valueFromString:(id)a3 formatters:(id)a4 value:(double *)a5 formatString:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  __CFNumberFormatter *v16;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v10)
  {
    v15 = 0;
    if (!a6)
      goto LABEL_14;
    goto LABEL_12;
  }
  v12 = objc_msgSend(v10, "count");
  objc_opt_class();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v13);
  if (v12)
  {
    v14 = 0;
    v15 = 1;
    while (1)
    {
      v16 = (__CFNumberFormatter *)objc_msgSend(v11, "objectAtIndex:", v14);
      if (TSUImprovedCFNumberFormatterGetValueFromString(v16, v9, a5))
        break;
      v15 = ++v14 < v12;
      if (v12 == v14)
        goto LABEL_6;
    }
    if (a6)
    {
      CFNumberFormatterGetFormat(v16);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
LABEL_6:
    v15 = 0;
  }
  objc_sync_exit(v13);

  if (a6)
  {
LABEL_12:
    if (!v15)
      *a6 = 0;
  }
LABEL_14:

  return v15;
}

- (id)p_findCurrencySymbolInString:(id)a3 additionalCurrencyCode:(id)a4 successfullString:(id *)a5 currencyCode:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  id v34;
  void *v35;
  id v37;
  id obj;
  id *v39;
  id *v40;
  uint64_t v41;
  OITSUNumberFormatter *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v10 = a3;
  v11 = a4;
  v12 = objc_msgSend(v10, "length");
  if (v12)
  {
    v13 = v12;
    v40 = a5;
    objc_opt_class();
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(obj);
    v14 = 8;
    v47 = v13;
    if (v13 < 8)
      v14 = v13;
    v48 = v14;
    TSUCurrencyCodesForLocale(self->_locale, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    v37 = v11;
    if (v16)
    {
      v41 = v16;
      v39 = a6;
      v44 = 0;
      v45 = 0;
      v17 = 0;
      v46 = 0;
      v43 = v13 - v48;
      v42 = self;
      while (1)
      {
        v18 = v15;
        objc_msgSend(v15, "objectAtIndex:", v17, v37);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[OITSUNumberFormatter currencySymbolForCurrencyCode:](self, "currencySymbolForCurrencyCode:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\u200F"), &stru_24F3BFFF8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v10, "rangeOfString:options:range:", v21, 0, 0, v48);
        v24 = v23;
        v26 = 0;
        v25 = 0x7FFFFFFFFFFFFFFFLL;
        if (v47 >= 1)
          v25 = objc_msgSend(v10, "rangeOfString:options:range:", v21, 0, v43, v48);
        if (v22 != 0x7FFFFFFFFFFFFFFFLL || v25 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v22 != 0x7FFFFFFFFFFFFFFFLL && v24 > v46)
            break;
          if (v25 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v24 = v26;
            if (v26 > v46)
              break;
          }
        }
        -[OITSUNumberFormatter halfWidthCurrencySymbolForCurrencyCode:](self, "halfWidthCurrencySymbolForCurrencyCode:", v19);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v10, "rangeOfString:options:range:", v27, 0, 0, v48);
        v30 = v29;
        v24 = 0;
        v31 = 0x7FFFFFFFFFFFFFFFLL;
        if (v47 >= 1)
        {
          v31 = objc_msgSend(v10, "rangeOfString:options:range:", v27, 0, v43, v48);
          v24 = v32;
        }
        if (v28 != 0x7FFFFFFFFFFFFFFFLL || v31 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v28 != 0x7FFFFFFFFFFFFFFFLL && v30 > v46)
          {
            v24 = v30;
            v31 = v28;
LABEL_25:
            objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", v31, v24, v21);
            v33 = (id)objc_claimAutoreleasedReturnValue();

LABEL_26:
            v34 = v21;

            if (v40)
              *v40 = objc_retainAutorelease(v33);
            if (v39)
              *v39 = objc_retainAutorelease(v19);
            v44 = v33;
            v45 = v34;
            v46 = v24;
            goto LABEL_31;
          }
          if (v31 != 0x7FFFFFFFFFFFFFFFLL && v24 > v46)
            goto LABEL_25;
        }

LABEL_31:
        ++v17;
        self = v42;
        v15 = v18;
        if (v41 == v17)
          goto LABEL_35;
      }
      v33 = v10;
      v27 = v44;
      goto LABEL_26;
    }
    v44 = 0;
    v45 = 0;
LABEL_35:

    objc_sync_exit(obj);
    v11 = v37;
    v35 = v45;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (id)displayNameForCurrencyCode:(id)a3
{
  return -[NSLocale displayNameForKey:value:](self->_locale, "displayNameForKey:value:", *MEMORY[0x24BDBCAF0], a3);
}

- (void)p_loadHarmonizedNumberFormatterSymbols
{
  NSLocale *locale;
  void *v4;
  OITSULocaleStructuredDictionary *v5;
  OITSULocaleStructuredDictionary *harmonizedNumberFormatterSymbols;
  OITSULocaleStructuredDictionary *v7;
  OITSULocaleStructuredDictionary *v8;
  OITSUNumberFormatter *obj;

  if (!self->_harmonizedNumberFormatterSymbols)
  {
    obj = self;
    objc_sync_enter(obj);
    if (!self->_harmonizedNumberFormatterSymbols)
    {
      locale = obj->_locale;
      SFUBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSULocaleStructuredDictionary dictionaryWithContentsOfFileForLocale:inDirectory:inBundle:](OITSULocaleStructuredDictionary, "dictionaryWithContentsOfFileForLocale:inDirectory:inBundle:", locale, CFSTR("NumberFormatterSymbols"), v4);
      v5 = (OITSULocaleStructuredDictionary *)objc_claimAutoreleasedReturnValue();
      harmonizedNumberFormatterSymbols = self->_harmonizedNumberFormatterSymbols;
      self->_harmonizedNumberFormatterSymbols = v5;

      if (!self->_harmonizedNumberFormatterSymbols)
      {
        +[OITSULocaleStructuredDictionary numberFormatterSymbolsFallbackDictionary](OITSULocaleStructuredDictionary, "numberFormatterSymbolsFallbackDictionary");
        v7 = (OITSULocaleStructuredDictionary *)objc_claimAutoreleasedReturnValue();
        v8 = self->_harmonizedNumberFormatterSymbols;
        self->_harmonizedNumberFormatterSymbols = v7;

      }
    }
    objc_sync_exit(obj);

  }
}

- (id)currencySymbolForCurrencyCode:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  __CFString *v8;
  NSLocale *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;

  v4 = (__CFString *)a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUNumberFormatter(Private) currencySymbolForCurrencyCode:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormatter.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 2075, 0, "can't get the currency symbol for a nil currency code. Using USD.");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    v4 = CFSTR("USD");
  }
  v7 = self->_currencyCodeToSymbolMap;
  objc_sync_enter(v7);
  -[NSMutableDictionary objectForKey:](self->_currencyCodeToSymbolMap, "objectForKey:", v4);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (+[OITSULocale localeIsAutoUpdating:](OITSULocale, "localeIsAutoUpdating:", self->_locale))
    {
      v9 = self->_locale;
      v10 = (void *)MEMORY[0x24BDBCED8];
      v11 = (void *)MEMORY[0x24BDBCEA0];
      -[NSLocale localeIdentifier](v9, "localeIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsFromLocaleIdentifier:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dictionaryWithDictionary:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setObject:forKey:", v4, *MEMORY[0x24BDBCAF0]);
      objc_msgSend(MEMORY[0x24BDBCEA0], "localeIdentifierFromComponents:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", *MEMORY[0x24BDBCAF8]);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        goto LABEL_9;
    }
    else
    {
      -[OITSUNumberFormatter p_loadHarmonizedNumberFormatterSymbols](self, "p_loadHarmonizedNumberFormatterSymbols");
      -[OITSULocaleStructuredDictionary objectForKey:locale:](self->_harmonizedNumberFormatterSymbols, "objectForKey:locale:", v4, self->_locale);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v8)
        goto LABEL_9;
    }
    -[NSMutableDictionary setObject:forKey:](self->_currencyCodeToSymbolMap, "setObject:forKey:", v8, v4);
  }
LABEL_9:
  objc_sync_exit(v7);

  if (v8)
    v17 = v8;
  else
    v17 = v4;
  v18 = v17;

  return v18;
}

- (id)halfWidthCurrencySymbolForCurrencyCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_currencyCodeToHalfWidthSymbolMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[OITSUNumberFormatter currencySymbolForCurrencyCode:](self, "currencySymbolForCurrencyCode:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (__CFString *)objc_msgSend(v6, "mutableCopy");
    CFStringTransform(v7, 0, (CFStringRef)*MEMORY[0x24BDBD608], 0);
    v5 = (void *)-[__CFString copy](v7, "copy");

    -[NSMutableDictionary setObject:forKey:](self->_currencyCodeToHalfWidthSymbolMap, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (id)currencyCode
{
  __CFString *v2;

  -[NSLocale objectForKey:](self->_locale, "objectForKey:", *MEMORY[0x24BDBCAF0]);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = CFSTR("USD");
  return v2;
}

- (id)defaultFormatStringForValueType:(int)a3 negativeStyle:(int)a4
{
  uint64_t v4;
  uint64_t v5;

  v4 = 136;
  if ((a3 - 1) < 3)
    v4 = 8 * (a3 - 1) + 144;
  if (a4 >= 4)
    v5 = 4;
  else
    v5 = a4;
  objc_msgSend(*(id *)((char *)&self->super.isa + v4), "objectAtIndex:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultFormatStringForValueType:(int)a3
{
  uint64_t v3;

  v3 = 80;
  if ((a3 - 1) < 3)
    v3 = 8 * (a3 - 1) + 56;
  return *(id *)((char *)&self->super.isa + v3);
}

- (id)decimalSeparator
{
  return self->_decimalSeparator;
}

- (id)groupingSeparator
{
  return self->_groupingSeparator;
}

- (id)currencyDecimalSeparator
{
  return self->_currencyDecimalSeparator;
}

- (id)currencyGroupingSeparator
{
  return self->_currencyGroupingSeparator;
}

- (id)percentSymbol
{
  return self->_percentSymbol;
}

- (unint64_t)groupingSize
{
  return self->_groupingSize;
}

- (id)p_createDictionaryOfCurrencyFormattersForCurrencies:(id)a3
{
  id v4;
  void *v5;
  id v6;
  __CFNumberFormatter *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = -[OITSUNumberFormatter p_createHarmonizedCFNumberFormatterOfStyle:](self, "p_createHarmonizedCFNumberFormatterOfStyle:", 2);
  CFNumberFormatterSetProperty(v7, (CFNumberFormatterKey)*MEMORY[0x24BDBD470], CFSTR("xyzzyqghbv&q"));
  CFNumberFormatterGetFormat(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tsu_positiveSubpatternOfNumberFormatPattern");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tsu_numberPortionOfNumberFormatSubpattern");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CFRelease(v7);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v11);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;- ¤%@"), v10, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v12);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤"), v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v13);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;- %@¤"), v10, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v14);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;¤-%@"), v10, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v15);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;(¤%@)"), v10, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v16);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;¤(%@)"), v10, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v17);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;(%@¤)"), v10, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v18);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;(%@)¤"), v10, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v19);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;¤%@-"), v10, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v20);

  v21 = objc_msgSend(v4, "count");
  if (v21 >= 1)
  {
    v22 = v21;
    for (i = 0; i != v22; ++i)
    {
      objc_msgSend(v4, "objectAtIndex:", i);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      p_newArrayOfCurrencyFormattersForCurrencyCode(self->_locale, v6, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v25, v24);

    }
  }

  return v5;
}

- (id)p_decimalFormatters
{
  NSArray *decimalFormatters;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  decimalFormatters = self->_decimalFormatters;
  if (!decimalFormatters)
  {
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v4);
    if (!self->_decimalFormatters)
    {
      TSUCreateArrayOfDecimalFormattersForLocale(self->_locale);
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
      __dmb(0xBu);
      v6 = self->_decimalFormatters;
      self->_decimalFormatters = v5;

    }
    objc_sync_exit(v4);

    decimalFormatters = self->_decimalFormatters;
  }
  return decimalFormatters;
}

- (id)p_currencyFormatters
{
  NSDictionary *currencyFormatters;
  void *v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *v7;

  currencyFormatters = self->_currencyFormatters;
  if (!currencyFormatters)
  {
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v4);
    if (!self->_currencyFormatters)
    {
      TSUCurrencyCodesForLocale(self->_locale, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[OITSUNumberFormatter p_createDictionaryOfCurrencyFormattersForCurrencies:](self, "p_createDictionaryOfCurrencyFormattersForCurrencies:", v5);
      v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

      __dmb(0xBu);
      v7 = self->_currencyFormatters;
      self->_currencyFormatters = v6;

    }
    objc_sync_exit(v4);

    currencyFormatters = self->_currencyFormatters;
  }
  return currencyFormatters;
}

- (id)p_percentageFormatters
{
  NSArray *percentageFormatters;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  percentageFormatters = self->_percentageFormatters;
  if (!percentageFormatters)
  {
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v4);
    if (!self->_percentageFormatters)
    {
      TSUCreateArrayOfPercentageFormattersForLocale(self->_locale);
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
      __dmb(0xBu);
      v6 = self->_percentageFormatters;
      self->_percentageFormatters = v5;

    }
    objc_sync_exit(v4);

    percentageFormatters = self->_percentageFormatters;
  }
  return percentageFormatters;
}

- (id)p_scientificFormatters
{
  NSArray *scientificFormatters;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  scientificFormatters = self->_scientificFormatters;
  if (!scientificFormatters)
  {
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v4);
    if (!self->_scientificFormatters)
    {
      TSUCreateArrayOfScientificFormattersForLocale(self->_locale);
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
      __dmb(0xBu);
      v6 = self->_scientificFormatters;
      self->_scientificFormatters = v5;

    }
    objc_sync_exit(v4);

    scientificFormatters = self->_scientificFormatters;
  }
  return scientificFormatters;
}

@end
