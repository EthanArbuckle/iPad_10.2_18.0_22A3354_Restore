@implementation TSUDateFormatter

+ (id)defaultDateTimeFormat
{
  id result;

  result = (id)defaultDateTimeFormat_sFormat;
  if (!defaultDateTimeFormat_sFormat)
  {
    result = TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterMediumStyle, kCFDateFormatterShortStyle);
    defaultDateTimeFormat_sFormat = (uint64_t)result;
  }
  return result;
}

+ (id)supportedDateFormats
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFDate *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterShortStyle, kCFDateFormatterNoStyle);
  v3 = TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterMediumStyle, kCFDateFormatterNoStyle);
  v4 = TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterLongStyle, kCFDateFormatterNoStyle);
  v5 = TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterFullStyle, kCFDateFormatterNoStyle);
  v6 = TSUDateFormatterCopyDateTimeFormatInfoDictionaryForLocale(0);
  v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "objectForKey:", TSUDateFormatterDateTimeFormatInfoDisplayedDateFormats), "mutableCopy");

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v9 = (const __CFDate *)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", 0.0);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v7);
        objc_msgSend(v8, "addObject:", TSUDateFormatterStringFromDateWithFormat(v9, *(const __CFString **)(*((_QWORD *)&v19 + 1) + 8 * v13++)));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }
  v14 = TSUDateFormatterStringFromDateWithFormat(v9, v2);
  v15 = TSUDateFormatterStringFromDateWithFormat(v9, v3);
  v16 = TSUDateFormatterStringFromDateWithFormat(v9, v4);
  v17 = TSUDateFormatterStringFromDateWithFormat(v9, v5);
  if ((objc_msgSend(v8, "containsObject:", v14) & 1) == 0)
    objc_msgSend(v7, "addObject:", v2);
  if ((objc_msgSend(v8, "containsObject:", v15) & 1) == 0)
    objc_msgSend(v7, "addObject:", v3);
  if ((objc_msgSend(v8, "containsObject:", v16) & 1) == 0)
    objc_msgSend(v7, "addObject:", v4);
  if ((objc_msgSend(v8, "containsObject:", v17) & 1) == 0)
    objc_msgSend(v7, "addObject:", v5);

  return v7;
}

+ (id)supportedTimeFormats
{
  __CFString *v2;
  __CFString *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v17;

  v2 = TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
  v3 = TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterNoStyle, kCFDateFormatterMediumStyle);
  v4 = TSUDateFormatterCopyDateTimeFormatInfoDictionaryForLocale(0);
  v5 = (void *)objc_msgSend((id)objc_msgSend(v4, "objectForKey:", TSUDateFormatterDateTimeFormatInfoDisplayedTimeFormats), "mutableCopy");

  v6 = (void *)-[__CFString mutableCopy](v2, "mutableCopy");
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", CFSTR("h"), CFSTR("hh"), 0, 0, objc_msgSend(v6, "length"));
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", CFSTR("H"), CFSTR("HH"), 0, 0, objc_msgSend(v6, "length"));
  v17 = v2;
  v7 = (void *)-[__CFString mutableCopy](v2, "mutableCopy");
  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("hh"), CFSTR("h"), 0, 0, objc_msgSend(v7, "length"));
  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("HH"), CFSTR("H"), 0, 0, objc_msgSend(v7, "length"));
  v8 = (void *)-[__CFString mutableCopy](v3, "mutableCopy");
  objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", CFSTR("h"), CFSTR("hh"), 0, 0, objc_msgSend(v8, "length"));
  objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", CFSTR("H"), CFSTR("HH"), 0, 0, objc_msgSend(v8, "length"));
  v9 = (void *)-[__CFString mutableCopy](v3, "mutableCopy");
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("hh"), CFSTR("h"), 0, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("HH"), CFSTR("H"), 0, 0, objc_msgSend(v9, "length"));
  v10 = objc_msgSend(v5, "indexOfObject:", v6);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v5, "removeObjectAtIndex:", v10);
  v11 = objc_msgSend(v5, "indexOfObject:", v7);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v11;
    objc_msgSend(v5, "removeObjectAtIndex:", v11);
    v10 = v12;
  }
  if ((objc_msgSend(v5, "containsObject:", v17) & 1) == 0)
  {
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v5, "addObject:", v17);
    else
      objc_msgSend(v5, "insertObject:atIndex:", v17, v10);
  }
  v13 = objc_msgSend(v5, "indexOfObject:", v8);
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v5, "removeObjectAtIndex:", v13);
  v14 = objc_msgSend(v5, "indexOfObject:", v9);
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = v14;
    objc_msgSend(v5, "removeObjectAtIndex:", v14);
    v13 = v15;
  }
  if ((objc_msgSend(v5, "containsObject:", v3) & 1) == 0)
  {
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v5, "addObject:", v3);
    else
      objc_msgSend(v5, "insertObject:atIndex:", v3, v13);
  }

  return v5;
}

+ (id)dateFormatStringSpecialSymbols
{
  return (id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("GyMdhHmsSEDFwWakKZ'"));
}

+ (unint64_t)p_DateTimeSplitLocationInFormatString:(id)a3
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;

  v4 = objc_msgSend(a3, "length");
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", a3);
  objc_msgSend(v5, "setCharactersToBeSkipped:", 0);
  v6 = objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("'hHmsSakKZ"));
  v11 = 0;
  v7 = objc_msgSend(v5, "scanLocation");
  if (v7 < objc_msgSend(a3, "length"))
  {
    while (1)
    {
      objc_msgSend(v5, "scanUpToCharactersFromSet:intoString:", v6, &v11);
      v8 = objc_msgSend(v5, "scanLocation");
      if (v8 >= objc_msgSend(a3, "length")
        || objc_msgSend(a3, "characterAtIndex:", objc_msgSend(v5, "scanLocation")) != 39)
      {
        break;
      }
      objc_msgSend(v5, "scanLocation");
      objc_msgSend(v5, "setScanLocation:", objc_msgSend(v5, "scanLocation") + 1);
      objc_msgSend(v5, "scanUpToString:intoString:", CFSTR("'"), &v11);
      objc_msgSend(v5, "setScanLocation:", objc_msgSend(v5, "scanLocation") + 1);
      objc_msgSend(v5, "scanLocation");
      v9 = objc_msgSend(v5, "scanLocation");
      if (v9 >= objc_msgSend(a3, "length"))
        return v4;
    }
    return objc_msgSend(v5, "scanLocation");
  }
  return v4;
}

+ (id)datePortionOfDateTimeFormatString:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "substringToIndex:", objc_msgSend(a1, "p_DateTimeSplitLocationInFormatString:"));
  return (id)objc_msgSend(v3, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet"));
}

+ (id)timePortionOfDateTimeFormatString:(id)a3
{
  unint64_t v4;
  void *v5;

  v4 = objc_msgSend(a1, "p_DateTimeSplitLocationInFormatString:");
  if (v4 >= objc_msgSend(a3, "length"))
    return &stru_24D61C228;
  v5 = (void *)objc_msgSend(a3, "substringFromIndex:", v4);
  return (id)objc_msgSend(v5, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet"));
}

+ (id)shortMonthNamesForNonCachedCurrentLocale
{
  __CFDateFormatter *v2;
  void *v3;

  v2 = CFDateFormatterCreate(0, (CFLocaleRef)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale"), kCFDateFormatterMediumStyle, kCFDateFormatterMediumStyle);
  v3 = (void *)CFDateFormatterCopyProperty(v2, (CFDateFormatterKey)*MEMORY[0x24BDBD308]);
  CFRelease(v2);
  return v3;
}

- (TSUDateFormatter)init
{
  TSUDateFormatter *v2;
  __CFDateFormatter *v3;
  __CFDateFormatter *v4;
  __CFDateFormatter *v5;
  const __CFString *v6;
  CFTimeZoneRef v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSUDateFormatter;
  v2 = -[TSUDateFormatter init](&v9, sel_init);
  if (v2)
  {
    TSUDateFormatterInit();
    v3 = CFDateFormatterCreate(0, (CFLocaleRef)sDateFormatterLocale, kCFDateFormatterMediumStyle, kCFDateFormatterNoStyle);
    v4 = CFDateFormatterCreate(0, (CFLocaleRef)sDateFormatterLocale, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
    v2->mDateOnlyFormatString = (NSString *)(id)CFDateFormatterGetFormat(v3);
    v2->mTimeOnlyFormatString = (NSString *)(id)CFDateFormatterGetFormat(v4);
    v5 = CFDateFormatterCreate(0, (CFLocaleRef)sDateFormatterLocale, kCFDateFormatterFullStyle, kCFDateFormatterFullStyle);
    v2->mFullDateFormatter = v5;
    v6 = (const __CFString *)*MEMORY[0x24BDBD340];
    v7 = TSUGetGMTTimeZone();
    CFDateFormatterSetProperty(v5, v6, v7);
    CFRelease(v3);
    CFRelease(v4);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->mFullDateFormatter);
  v3.receiver = self;
  v3.super_class = (Class)TSUDateFormatter;
  -[TSUDateFormatter dealloc](&v3, sel_dealloc);
}

- (id)fullDateString:(id)a3
{
  if (a3)
    return (id)(id)CFDateFormatterCreateStringWithDate(0, self->mFullDateFormatter, (CFDateRef)a3);
  else
    return 0;
}

- (id)appropriateOutputFormatStringForInputFormatString:(id)a3
{
  unint64_t v4;
  void *v6;
  NSString *mDateOnlyFormatString;
  id v8;
  uint64_t v9;

  v4 = TSUGregorianUnitsPresentInFormatString(a3);
  if (v4 >= 8 && (v4 & 7) != 0)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), self->mDateOnlyFormatString, self->mTimeOnlyFormatString);
  if ((v4 & 7) != 0)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    mDateOnlyFormatString = self->mDateOnlyFormatString;
  }
  else
  {
    if (v4 < 8)
    {
      v8 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUDateFormatter(Private) appropriateOutputFormatStringForInputFormatString:]");
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDateFormatter.m"), 783, CFSTR("this should never be reached"));
      return 0;
    }
    v6 = (void *)MEMORY[0x24BDD17C8];
    mDateOnlyFormatString = self->mTimeOnlyFormatString;
  }
  return (id)objc_msgSend(v6, "stringWithString:", mDateOnlyFormatString);
}

- (id)stringFromDate:(id)a3 format:(id)a4
{
  return (id)TSUDateFormatterStringFromDateWithFormat((const __CFDate *)a3, (const __CFString *)a4);
}

@end
