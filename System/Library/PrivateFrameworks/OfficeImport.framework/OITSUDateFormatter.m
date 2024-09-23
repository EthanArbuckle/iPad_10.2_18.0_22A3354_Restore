@implementation OITSUDateFormatter

+ (id)defaultDateTimeFormatForLocale:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "localeSpecificStorageForKey:", CFSTR("TSUDateFormatter_defaultDateTimeFormat"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_opt_class();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v5);
    v4 = (void *)TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterMediumStyle, kCFDateFormatterShortStyle, v3);
    objc_msgSend(v3, "setLocaleSpecificStorage:forKey:", v4, CFSTR("TSUDateFormatter_defaultDateTimeFormat"));
    objc_sync_exit(v5);

  }
  return v4;
}

+ (id)supportedDateFormatsForLocale:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  id obj;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "localeSpecificStorageForKey:", CFSTR("TSUDateFormatter_supportedDateFormats"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_opt_class();
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(obj);
    v26 = (void *)TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterShortStyle, kCFDateFormatterNoStyle, v3);
    v25 = (void *)TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterMediumStyle, kCFDateFormatterNoStyle, v3);
    v24 = (void *)TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterLongStyle, kCFDateFormatterNoStyle, v3);
    v5 = (void *)TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterFullStyle, kCFDateFormatterNoStyle, v3);
    objc_msgSend(v3, "locale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)TSUDateFormatterCopyDateTimeFormatInfoDictionaryForLocale(v6);

    objc_msgSend(v7, "objectForKey:", CFSTR("DisplayedDateFormats"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    v22 = v7;
    if (v13)
    {
      v14 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v12);
          TSUDateFormatterStringFromDateWithFormat(v11, *(void **)(*((_QWORD *)&v27 + 1) + 8 * i), v3);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v13);
    }

    TSUDateFormatterStringFromDateWithFormat(v11, v26, v3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDateFormatterStringFromDateWithFormat(v11, v25, v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDateFormatterStringFromDateWithFormat(v11, v24, v3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDateFormatterStringFromDateWithFormat(v11, v5, v3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "containsObject:", v17) & 1) == 0)
    {
      objc_msgSend(v10, "addObject:", v17);
      objc_msgSend(v12, "addObject:", v26);
    }
    if ((objc_msgSend(v10, "containsObject:", v18) & 1) == 0)
    {
      objc_msgSend(v10, "addObject:", v18);
      objc_msgSend(v12, "addObject:", v25);
    }
    if ((objc_msgSend(v10, "containsObject:", v19) & 1) == 0)
    {
      objc_msgSend(v10, "addObject:", v19);
      objc_msgSend(v12, "addObject:", v24);
    }
    if ((objc_msgSend(v10, "containsObject:", v20) & 1) == 0)
    {
      objc_msgSend(v10, "addObject:", v20);
      objc_msgSend(v12, "addObject:", v5);
    }
    v4 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setLocaleSpecificStorage:forKey:", v4, CFSTR("TSUDateFormatter_supportedDateFormats"));

    objc_sync_exit(obj);
  }

  return v4;
}

+ (id)p_supportedDateFormatMatchingFormat:(id)a3 locale:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  TSUDateFormatterStringFromDateWithFormat(v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  +[OITSUDateFormatter supportedDateFormatsForLocale:](OITSUDateFormatter, "supportedDateFormatsForLocale:", v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        TSUDateFormatterStringFromDateWithFormat(v7, v14, v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", v8) & 1) != 0)
        {
          v16 = v14;

          goto LABEL_11;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        continue;
      break;
    }
  }

  v16 = v5;
LABEL_11:

  return v16;
}

+ (id)supportedTimeFormatsForLocale:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  id obj;

  v3 = a3;
  objc_msgSend(v3, "localeSpecificStorageForKey:", CFSTR("TSUDateFormatter_supportedTimeFormats"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_opt_class();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v5);
    obj = v5;
    v6 = (void *)TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterNoStyle, kCFDateFormatterShortStyle, v3);
    v7 = (void *)TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterNoStyle, kCFDateFormatterMediumStyle, v3);
    objc_msgSend(v3, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)TSUDateFormatterCopyDateTimeFormatInfoDictionaryForLocale(v8);

    v21 = v9;
    objc_msgSend(v9, "objectForKey:", CFSTR("DisplayedTimeFormats"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    v12 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v12, "replaceOccurrencesOfString:withString:options:range:", CFSTR("h"), CFSTR("hh"), 0, 0, objc_msgSend(v12, "length"));
    objc_msgSend(v12, "replaceOccurrencesOfString:withString:options:range:", CFSTR("H"), CFSTR("HH"), 0, 0, objc_msgSend(v12, "length"));
    v13 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v13, "replaceOccurrencesOfString:withString:options:range:", CFSTR("hh"), CFSTR("h"), 0, 0, objc_msgSend(v13, "length"));
    objc_msgSend(v13, "replaceOccurrencesOfString:withString:options:range:", CFSTR("HH"), CFSTR("H"), 0, 0, objc_msgSend(v13, "length"));
    v14 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v14, "replaceOccurrencesOfString:withString:options:range:", CFSTR("h"), CFSTR("hh"), 0, 0, objc_msgSend(v14, "length"));
    objc_msgSend(v14, "replaceOccurrencesOfString:withString:options:range:", CFSTR("H"), CFSTR("HH"), 0, 0, objc_msgSend(v14, "length"));
    v15 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v15, "replaceOccurrencesOfString:withString:options:range:", CFSTR("hh"), CFSTR("h"), 0, 0, objc_msgSend(v15, "length"));
    objc_msgSend(v15, "replaceOccurrencesOfString:withString:options:range:", CFSTR("HH"), CFSTR("H"), 0, 0, objc_msgSend(v15, "length"));
    v16 = objc_msgSend(v11, "indexOfObject:", v12);
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v11, "removeObjectAtIndex:", v16);
    v17 = objc_msgSend(v11, "indexOfObject:", v13);
    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "removeObjectAtIndex:", v17);
      v16 = v17;
    }
    if ((objc_msgSend(v11, "containsObject:", v6) & 1) == 0)
    {
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v11, "addObject:", v6);
      else
        objc_msgSend(v11, "insertObject:atIndex:", v6, v16);
    }
    v18 = objc_msgSend(v11, "indexOfObject:", v14);
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v11, "removeObjectAtIndex:", v18);
    v19 = objc_msgSend(v11, "indexOfObject:", v15);
    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "removeObjectAtIndex:", v19);
      v18 = v19;
    }
    if ((objc_msgSend(v11, "containsObject:", v7) & 1) == 0)
    {
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v11, "addObject:", v7);
      else
        objc_msgSend(v11, "insertObject:atIndex:", v7, v18);
    }
    v4 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setLocaleSpecificStorage:forKey:", v4, CFSTR("TSUDateFormatter_supportedTimeFormats"));

    objc_sync_exit(obj);
  }

  return v4;
}

+ (id)p_supportedTimeFormatMatchingFormat:(id)a3 locale:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  TSUDateFormatterStringFromDateWithFormat(v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  +[OITSUDateFormatter supportedTimeFormatsForLocale:](OITSUDateFormatter, "supportedTimeFormatsForLocale:", v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        TSUDateFormatterStringFromDateWithFormat(v7, v14, v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", v8) & 1) != 0)
        {
          v16 = v14;

          goto LABEL_11;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        continue;
      break;
    }
  }

  v16 = v5;
LABEL_11:

  return v16;
}

+ (id)dateFormatStringSpecialSymbols
{
  return (id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("GyMdhHmsSEDFwWakKZ'"));
}

+ (unint64_t)p_DateTimeSplitLocationInFormatString:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  id v20;
  id v21;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCharactersToBeSkipped:", 0);
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("'hHmsSakKZ"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "scanLocation");
  if (v7 >= objc_msgSend(v3, "length"))
  {
    v9 = 0;
  }
  else
  {
    v8 = 0;
    while (1)
    {
      v21 = v8;
      objc_msgSend(v5, "scanUpToCharactersFromSet:intoString:", v6, &v21);
      v9 = v21;

      v10 = objc_msgSend(v5, "scanLocation");
      if (v10 >= objc_msgSend(v3, "length")
        || objc_msgSend(v3, "characterAtIndex:", objc_msgSend(v5, "scanLocation")) != 39)
      {
        break;
      }
      v11 = objc_msgSend(v5, "scanLocation");
      v12 = objc_msgSend(v5, "scanLocation") + 1;
      if (v12 >= objc_msgSend(v3, "length"))
        goto LABEL_14;
      objc_msgSend(v5, "setScanLocation:", objc_msgSend(v5, "scanLocation") + 1);
      v20 = v9;
      objc_msgSend(v5, "scanUpToString:intoString:", CFSTR("'"), &v20);
      v8 = v20;

      v13 = objc_msgSend(v5, "scanLocation") + 1;
      v14 = objc_msgSend(v3, "length");
      v15 = objc_msgSend(v5, "scanLocation") + 1;
      if (v13 >= v14)
      {
        if (v15 == objc_msgSend(v3, "length"))
          goto LABEL_10;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[OITSUDateFormatter p_DateTimeSplitLocationInFormatString:]");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUDateFormatter.m");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 1007, 0, "Unmatched single quote found in format string %{public}@", v3);

        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
        v15 = v11 + 1;
      }
      objc_msgSend(v5, "setScanLocation:", v15);
      v18 = objc_msgSend(v5, "scanLocation");
      if (v18 >= objc_msgSend(v3, "length"))
      {
LABEL_10:
        v9 = v8;
        goto LABEL_14;
      }
    }
    v4 = objc_msgSend(v5, "scanLocation");
  }
LABEL_14:

  return v4;
}

+ (id)datePortionOfDateTimeFormatString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "substringToIndex:", objc_msgSend(a1, "p_DateTimeSplitLocationInFormatString:", v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)timePortionOfDateTimeFormatString:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  __CFString *v8;

  v4 = a3;
  v5 = objc_msgSend(a1, "p_DateTimeSplitLocationInFormatString:", v4);
  if (v5 >= objc_msgSend(v4, "length"))
  {
    v8 = &stru_24F3BFFF8;
  }
  else
  {
    objc_msgSend(v4, "substringFromIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (OITSUDateFormatter)initWithLocale:(id)a3
{
  id v4;
  OITSUDateFormatter *v5;
  void *v6;
  __CFDateFormatter *UsingHarmonizedSymbols;
  void *v8;
  __CFDateFormatter *v9;
  uint64_t v10;
  NSString *dateOnlyFormatString;
  uint64_t v12;
  NSString *timeOnlyFormatString;
  void *v14;
  __CFDateFormatter *fullDateFormatter;
  const __CFString *v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)OITSUDateFormatter;
  v5 = -[OITSUDateFormatter init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "gregorianCalendarLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UsingHarmonizedSymbols = TSUDateFormatterCFDateFormatterCreateUsingHarmonizedSymbols(0, v6, kCFDateFormatterMediumStyle, kCFDateFormatterNoStyle);

    objc_msgSend(v4, "gregorianCalendarLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = TSUDateFormatterCFDateFormatterCreateUsingHarmonizedSymbols(0, v8, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);

    CFDateFormatterGetFormat(UsingHarmonizedSymbols);
    v10 = objc_claimAutoreleasedReturnValue();
    dateOnlyFormatString = v5->_dateOnlyFormatString;
    v5->_dateOnlyFormatString = (NSString *)v10;

    CFDateFormatterGetFormat(v9);
    v12 = objc_claimAutoreleasedReturnValue();
    timeOnlyFormatString = v5->_timeOnlyFormatString;
    v5->_timeOnlyFormatString = (NSString *)v12;

    objc_msgSend(v4, "gregorianCalendarLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_fullDateFormatter = TSUDateFormatterCFDateFormatterCreateUsingHarmonizedSymbols(0, v14, kCFDateFormatterFullStyle, kCFDateFormatterFullStyle);

    fullDateFormatter = v5->_fullDateFormatter;
    v16 = (const __CFString *)*MEMORY[0x24BDBD340];
    TSUGetGMTTimeZone();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    CFDateFormatterSetProperty(fullDateFormatter, v16, v17);

    CFRelease(UsingHarmonizedSymbols);
    CFRelease(v9);
  }

  return v5;
}

- (OITSUDateFormatter)init
{
  void *v3;
  void *v4;
  void *v5;
  OITSUDateFormatter *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUDateFormatter init]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUDateFormatter.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 1060, 0, "I don't think anyone creates these objects anymore - if they do, a locale needs to be supplied");

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  +[OITSULocale currentLocale](OITSULocale, "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[OITSUDateFormatter initWithLocale:](self, "initWithLocale:", v5);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_fullDateFormatter);
  v3.receiver = self;
  v3.super_class = (Class)OITSUDateFormatter;
  -[OITSUDateFormatter dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOnlyFormatString, 0);
  objc_storeStrong((id *)&self->_dateOnlyFormatString, 0);
}

@end
