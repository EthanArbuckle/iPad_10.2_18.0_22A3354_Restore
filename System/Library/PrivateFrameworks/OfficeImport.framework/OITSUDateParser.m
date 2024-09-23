@implementation OITSUDateParser

- (OITSUDateParser)initWithLocale:(id)a3
{
  id v5;
  OITSUDateParser *v6;
  void *v7;
  void *v8;
  id *p_locale;
  NSMutableArray *v10;
  NSMutableArray *formatCategories;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  CFDateFormatterStyle v40;
  CFDateFormatterStyle k;
  __CFDateFormatter *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  OITSUDateParser *v59;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  objc_super v70;

  v5 = a3;
  v70.receiver = self;
  v70.super_class = (Class)OITSUDateParser;
  v6 = -[OITSUDateParser init](&v70, sel_init);
  if (v6)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUDateParser initWithLocale:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUDateParser.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 92, 0, "A locale is required here");

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
    v63 = v5;
    p_locale = (id *)&v6->_locale;
    objc_storeStrong((id *)&v6->_locale, a3);
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    formatCategories = v6->_formatCategories;
    v6->_formatCategories = v10;

    -[OITSULocale gregorianCalendarLocale](v6->_locale, "gregorianCalendarLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDBCAE8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[OITSULocale gregorianCalendarLocale](v6->_locale, "gregorianCalendarLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BDBCB20]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v16 = objc_msgSend(v13, "compare:options:", CFSTR("JP"), 1) || v15 == 0;
      if (!v16 && !objc_msgSend(v15, "compare:options:", CFSTR("ja"), 1))
        v6->_isJapaneseLocale = 1;
    }
    v61 = v15;
    v62 = v13;
    v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(*p_locale, "gregorianCalendarLocale");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)TSUCreateArrayOfDateFormatStringsForLocale(v18);

    objc_msgSend(*p_locale, "gregorianCalendarLocale");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)TSUCreateArrayOfTimeFormatStringsForLocale(v20);

    v69 = v19;
    v22 = objc_msgSend(v19, "count");
    v68 = v21;
    v23 = objc_msgSend(v21, "count");
    if (v22)
    {
      v24 = 0;
      do
      {
        v66 = v24;
        objc_msgSend(v69, "objectAtIndex:");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringByAppendingString:", CFSTR(" "));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[OITSULocale gregorianCalendarLocale](v6->_locale, "gregorianCalendarLocale");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v25;
        -[OITSUDateParser p_addFormat:locale:formatCategoryMap:](v6, "p_addFormat:locale:formatCategoryMap:", v25, v27, v17);

        if (v23)
        {
          for (i = 0; i != v23; ++i)
          {
            objc_msgSend(v68, "objectAtIndex:", i);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "stringByAppendingString:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[OITSULocale gregorianCalendarLocale](v6->_locale, "gregorianCalendarLocale");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[OITSUDateParser p_addFormat:locale:formatCategoryMap:](v6, "p_addFormat:locale:formatCategoryMap:", v30, v31, v17);

          }
        }

        v24 = v66 + 1;
      }
      while (v66 + 1 != v22);
    }
    if (v23)
    {
      v32 = 0;
      do
      {
        v67 = v32;
        objc_msgSend(v68, "objectAtIndex:");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringByAppendingString:", CFSTR(" "));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[OITSULocale gregorianCalendarLocale](v6->_locale, "gregorianCalendarLocale");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v33;
        -[OITSUDateParser p_addFormat:locale:formatCategoryMap:](v6, "p_addFormat:locale:formatCategoryMap:", v33, v35, v17);

        if (v22)
        {
          for (j = 0; j != v22; ++j)
          {
            objc_msgSend(v69, "objectAtIndex:", j);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "stringByAppendingString:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[OITSULocale gregorianCalendarLocale](v6->_locale, "gregorianCalendarLocale");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[OITSUDateParser p_addFormat:locale:formatCategoryMap:](v6, "p_addFormat:locale:formatCategoryMap:", v38, v39, v17);

          }
        }

        v32 = v67 + 1;
      }
      while (v67 + 1 != v23);
    }
    v40 = kCFDateFormatterNoStyle;
    v5 = v63;
    do
    {
      for (k = kCFDateFormatterNoStyle; k != (kCFDateFormatterFullStyle|kCFDateFormatterShortStyle); ++k)
      {
        if (k | v40)
        {
          v42 = CFDateFormatterCreate(0, -[OITSULocale cfGregorianCalendarLocale](v6->_locale, "cfGregorianCalendarLocale"), v40, k);
          CFDateFormatterGetFormat(v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[OITSULocale gregorianCalendarLocale](v6->_locale, "gregorianCalendarLocale");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[OITSUDateParser p_addFormat:locale:formatCategoryMap:](v6, "p_addFormat:locale:formatCategoryMap:", v43, v44, v17);

          CFRelease(v42);
        }
      }
      ++v40;
    }
    while (v40 != (kCFDateFormatterFullStyle|kCFDateFormatterShortStyle));
    TSUDefaultDateTimeFormat(v6->_locale);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSULocale gregorianCalendarLocale](v6->_locale, "gregorianCalendarLocale");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSUDateParser p_addFormat:locale:formatCategoryMap:](v6, "p_addFormat:locale:formatCategoryMap:", v45, v46, v17);

    TSUShortestCompleteDateOnlyFormat(v6->_locale);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSULocale gregorianCalendarLocale](v6->_locale, "gregorianCalendarLocale");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSUDateParser p_addFormat:locale:formatCategoryMap:](v6, "p_addFormat:locale:formatCategoryMap:", v47, v48, v17);

    TSUShortestCompleteTimeOnlyFormat(v6->_locale);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSULocale gregorianCalendarLocale](v6->_locale, "gregorianCalendarLocale");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSUDateParser p_addFormat:locale:formatCategoryMap:](v6, "p_addFormat:locale:formatCategoryMap:", v49, v50, v17);

    TSUShortestCompleteDateTimeFormat(v6->_locale);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSULocale gregorianCalendarLocale](v6->_locale, "gregorianCalendarLocale");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSUDateParser p_addFormat:locale:formatCategoryMap:](v6, "p_addFormat:locale:formatCategoryMap:", v51, v52, v17);

    TSUDefaultDateOnlyShortFormat(v6->_locale);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSULocale gregorianCalendarLocale](v6->_locale, "gregorianCalendarLocale");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSUDateParser p_addFormat:locale:formatCategoryMap:](v6, "p_addFormat:locale:formatCategoryMap:", v53, v54, v17);

    TSUDefaultDateOnlyMediumFormat(v6->_locale);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSULocale gregorianCalendarLocale](v6->_locale, "gregorianCalendarLocale");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSUDateParser p_addFormat:locale:formatCategoryMap:](v6, "p_addFormat:locale:formatCategoryMap:", v55, v56, v17);

    TSUDefaultTimeOnlyShortFormat(v6->_locale);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSULocale gregorianCalendarLocale](v6->_locale, "gregorianCalendarLocale");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSUDateParser p_addFormat:locale:formatCategoryMap:](v6, "p_addFormat:locale:formatCategoryMap:", v57, v58, v17);

    v59 = v6;
  }

  return v6;
}

- (id)formatStringsDictionary
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_formatCategories;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "initialPattern", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);
        objc_msgSend(v10, "formatStringsDictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v7);
  }

  v19[0] = CFSTR("keys");
  v19[1] = CFSTR("values");
  v20[0] = v3;
  v20[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)dealloc
{
  __CFDateFormatter *specialCaseFormatter;
  objc_super v4;

  specialCaseFormatter = self->_specialCaseFormatter;
  if (specialCaseFormatter)
    CFRelease(specialCaseFormatter);
  v4.receiver = self;
  v4.super_class = (Class)OITSUDateParser;
  -[OITSUDateParser dealloc](&v4, sel_dealloc);
}

- (__CFDateFormatter)specialCaseDateFormatterForLocale:(id)a3
{
  CFLocaleRef v4;
  __CFDateFormatter *specialCaseFormatter;
  CFLocaleRef Locale;
  __CFDateFormatter *ADateFormatter;

  v4 = (CFLocaleRef)a3;
  specialCaseFormatter = self->_specialCaseFormatter;
  if (!specialCaseFormatter)
  {
LABEL_5:
    ADateFormatter = p_createADateFormatter(v4);
    self->_specialCaseFormatter = ADateFormatter;
    goto LABEL_6;
  }
  Locale = CFDateFormatterGetLocale(specialCaseFormatter);
  ADateFormatter = self->_specialCaseFormatter;
  if (Locale != v4)
  {
    if (ADateFormatter)
      CFRelease(self->_specialCaseFormatter);
    goto LABEL_5;
  }
LABEL_6:

  return ADateFormatter;
}

- (id)p_newDateFromStringTryingFormats:(id)a3 locale:(id)a4 formats:(id)a5 outSuccessfulFormatString:(id *)a6
{
  __CFString *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  __CFDateFormatter *v15;
  CFIndex v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  __CFString *v21;
  CFDateRef v22;
  CFDateRef v23;
  const __CFDate *v24;
  __CFString *StringWithDate;
  const __CFDate *v26;
  CFDateRef v27;
  __CFString *v28;
  void *v29;
  __CFString *v30;
  id v32;
  id *v33;
  uint64_t v34;
  id obj;
  CFRange rangep;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v10 = (__CFString *)a3;
  v11 = a4;
  v12 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUDateParser p_newDateFromStringTryingFormats:locale:formats:outSuccessfulFormatString:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUDateParser.m");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 204, 0, "A locale is now required here");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v15 = -[OITSUDateParser specialCaseDateFormatterForLocale:](self, "specialCaseDateFormatterForLocale:", v11);
  v16 = -[__CFString length](v10, "length");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v12;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v17)
  {
    v18 = v17;
    v32 = v11;
    v33 = a6;
    v19 = *(_QWORD *)v38;
    v34 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(obj);
        v21 = *(__CFString **)(*((_QWORD *)&v37 + 1) + 8 * i);
        CFDateFormatterSetFormat(v15, v21);
        rangep.location = 0;
        rangep.length = v16;
        v22 = CFDateFormatterCreateDateFromString(0, v15, v10, &rangep);
        if (v22)
        {
          v23 = v22;
          if (rangep.location || rangep.length != v16)
          {

          }
          else
          {
            v24 = (const __CFDate *)(id)TSUCreateDateWithGregorianUnitsSetToDefaultValue(v22, v21);

            StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, v15, v24);
            if (-[__CFString isEqualToString:](v10, "isEqualToString:", StringWithDate))
            {
              if (v33)
                *v33 = objc_retainAutorelease(v21);
              v26 = v24;
            }
            else
            {
              v27 = v24;
              if (-[__CFString rangeOfString:](v21, "rangeOfString:", CFSTR("yyyy")) != 0x7FFFFFFFFFFFFFFFLL)
              {
                -[__CFString tsu_stringByReplacing4DigitYearStringWith2DigitYearString](v21, "tsu_stringByReplacing4DigitYearStringWith2DigitYearString");
                v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
                CFDateFormatterSetFormat(v15, v28);
                v27 = CFDateFormatterCreateDateFromString(0, v15, v10, &rangep);

              }
              v29 = (void *)TSUCreateDateWithGregorianUnitsSetToDefaultValue(v27, v21);

              v24 = v29;
              v30 = (__CFString *)CFDateFormatterCreateStringWithDate(0, v15, v24);
              if (-[__CFString isEqualToString:](v10, "isEqualToString:", v30))
              {
                v26 = v24;
                if (v33)
                {
                  *v33 = objc_retainAutorelease(v21);
                  v26 = v24;
                }
              }
              else
              {

                v26 = 0;
              }

            }
            v19 = v34;

            if (v26)
              goto LABEL_27;
          }
        }
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v18);
    v26 = 0;
LABEL_27:
    v11 = v32;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)newDateFromString:(id)a3 preferredFormatString:(id)a4 successfulFormatString:(id *)a5 tryAggressiveFormats:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _BOOL4 v34;
  id v35;
  __CFString *v36;
  char v37;
  _QWORD v38[2];

  v6 = a6;
  v38[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  if (v10 && objc_msgSend(v10, "length"))
  {
    v12 = (__CFString *)objc_msgSend(v10, "mutableCopy");
    CFStringTransform(v12, 0, (CFStringRef)*MEMORY[0x24BDBD608], 0);
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByTrimmingCharactersInSet:](v12, "stringByTrimmingCharactersInSet:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\u200F"), &stru_24F3BFFF8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\u200E"), &stru_24F3BFFF8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && (objc_msgSend(&stru_24F3BFFF8, "isEqualToString:", v11) & 1) == 0)
    {
      v38[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[OITSULocale gregorianCalendarLocale](self->_locale, "gregorianCalendarLocale");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[OITSUDateParser p_newDateFromStringTryingFormats:locale:formats:outSuccessfulFormatString:](self, "p_newDateFromStringTryingFormats:locale:formats:outSuccessfulFormatString:", v16, v18, v17, a5);

      if (v19)
      {
        v20 = v19;
LABEL_35:

        goto LABEL_36;
      }

    }
    v34 = v6;
    v35 = v11;
    v36 = v12;
    -[NSMutableArray objectEnumerator](self->_formatCategories, "objectEnumerator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v17, "nextObject");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (!v21)
    {
      v24 = 0;
      v23 = 0;
LABEL_23:
      if (v23)
      {
        v23 = v23;
        v11 = v35;
        if (a5)
        {
          v24 = objc_retainAutorelease(v24);
          *a5 = v24;
        }
        v27 = v23;
      }
      else
      {
        if (v34)
        {
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("yy"), 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v16, "rangeOfCharacterFromSet:", v30);

          v27 = 0;
          if (v31 != 0x7FFFFFFFFFFFFFFFLL)
          {
            -[OITSULocale gregorianCalendarLocale](self->_locale, "gregorianCalendarLocale");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = -[OITSUDateParser p_newDateFromStringTryingFormats:locale:formats:outSuccessfulFormatString:](self, "p_newDateFromStringTryingFormats:locale:formats:outSuccessfulFormatString:", v16, v32, v29, a5);

          }
          v23 = 0;
        }
        else
        {
          v23 = 0;
          v27 = 0;
        }
LABEL_33:
        v11 = v35;
      }
      v20 = v27;

      v12 = v36;
      goto LABEL_35;
    }
    v23 = 0;
    v24 = 0;
    v25 = (void *)v21;
    while (1)
    {
      v26 = (void *)objc_msgSend(v25, "newDateFromString:forceAllowAMPM:successfulFormatString:perfect:", v16, self->_isJapaneseLocale, a5, &v37);
      if (v26)
      {
        v27 = v26;
        if (v37)
        {
          v22 = v25;
          goto LABEL_33;
        }
        if (v23)
        {

          if (!a5)
            goto LABEL_19;
        }
        else
        {
          if (!a5)
          {
            v23 = v26;
            goto LABEL_19;
          }
          v28 = *a5;

          v24 = v28;
          v23 = v27;
        }
        *a5 = 0;
      }
LABEL_19:
      objc_msgSend(v17, "nextObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = v22;
      if (!v22)
        goto LABEL_23;
    }
  }
  v20 = 0;
LABEL_36:

  return v20;
}

- (id)newDateFromString:(id)a3 successfulFormatString:(id *)a4
{
  return -[OITSUDateParser newDateFromString:preferredFormatString:successfulFormatString:tryAggressiveFormats:](self, "newDateFromString:preferredFormatString:successfulFormatString:tryAggressiveFormats:", a3, 0, a4, 0);
}

- (void)p_addFormat:(id)a3 locale:(id)a4 formatCategoryMap:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  OITSUDateFormatCategory *v12;
  unsigned __int16 v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v13 = 0;
  -[OITSUDateParser p_initialPatternParsingFormat:separator:](self, "p_initialPatternParsingFormat:separator:", v8, &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (OITSUDateFormatCategory *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = -[OITSUDateFormatCategory initWithInitialPattern:locale:]([OITSUDateFormatCategory alloc], "initWithInitialPattern:locale:", v11, v9);
    -[NSMutableArray addObject:](self->_formatCategories, "addObject:", v12);
    objc_msgSend(v10, "setObject:forKey:", v12, v11);
  }
  -[OITSUDateFormatCategory addSeparator:format:locale:](v12, "addSeparator:format:locale:", v13, v8, v9);

}

- (id)p_initialPatternParsingFormat:(id)a3 separator:(unsigned __int16 *)a4
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\u200F"), &stru_24F3BFFF8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\u200E"), &stru_24F3BFFF8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (p_initialPatternParsingFormat_separator__onceToken != -1)
    dispatch_once(&p_initialPatternParsingFormat_separator__onceToken, &__block_literal_global_3);
  v7 = objc_msgSend(v6, "length");
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUDateParser p_initialPatternParsingFormat:separator:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUDateParser.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 385, 0, "Zero length date format");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v10 = objc_msgSend(v6, "rangeOfCharacterFromSet:", p_initialPatternParsingFormat_separator__formatCharacterSet);
  v11 = v7;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL
    || ((v12 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:range:", p_initialPatternParsingFormat_separator__inverseFormatCharacterSet, 0, v10, v7 - v10), v12 != 0x7FFFFFFFFFFFFFFFLL)? (v11 = v12): (v11 = v7), v11 >= v7))
  {
    *a4 = 0;
  }
  else
  {
    v13 = objc_msgSend(v6, "characterAtIndex:", v11);
    if (v13 == 34)
      v14 = 39;
    else
      v14 = v13;
    *a4 = v14;
    if (v14 == 39)
    {
      if (v11 + 1 >= v7)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUDateParser p_initialPatternParsingFormat:separator:]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUDateParser.m");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 413, 0, "No character following single quote");

        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      }
      v17 = objc_msgSend(v6, "characterAtIndex:", v11 + 1);
      *a4 = v17;
      if (v17 == 39)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUDateParser p_initialPatternParsingFormat:separator:]");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUDateParser.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 415, 0, "Two single quotes in a row");

        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      }
    }
  }
  objc_msgSend(v6, "substringToIndex:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __59__OITSUDateParser_p_initialPatternParsingFormat_separator___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("GyYuUQqMLlwWdDFgEecahHKkjmsSAzZOvVXx"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)p_initialPatternParsingFormat_separator__formatCharacterSet;
  p_initialPatternParsingFormat_separator__formatCharacterSet = v0;

  objc_msgSend((id)p_initialPatternParsingFormat_separator__formatCharacterSet, "invertedSet");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)p_initialPatternParsingFormat_separator__inverseFormatCharacterSet;
  p_initialPatternParsingFormat_separator__inverseFormatCharacterSet = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_formatCategories, 0);
}

@end
