@implementation TSUDateParser

+ (id)parserForDefaultLocale
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v3 = (void *)objc_msgSend(v2, "threadDictionary");
  v4 = (void *)objc_msgSend(v3, "objectForKey:", CFSTR("TSUDateParserThreadDictionaryKey"));
  if (!v4)
  {
    v4 = (void *)objc_msgSend(+[TSUDateParserLibrary sharedDateParserLibrary](TSUDateParserLibrary, "sharedDateParserLibrary"), "checkoutDateParser");
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("TSUDateParserThreadDictionaryKey"));
    v5 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __39__TSUDateParser_parserForDefaultLocale__block_invoke;
    v10[3] = &unk_24D61AC98;
    v10[4] = v2;
    v10[5] = v4;
    objc_msgSend(v3, "setObject:forKey:", TSURegisterLocaleChangeObserver((uint64_t)v10), CFSTR("TSUDateParserThreadDictionaryLocaleObserverKey"));
    v6 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = *MEMORY[0x24BDD12C8];
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __39__TSUDateParser_parserForDefaultLocale__block_invoke_2;
    v9[3] = &unk_24D61ACC0;
    v9[4] = v4;
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", v7, v2, 0, v9), CFSTR("TSUDateParserThreadDictionaryExitObserverKey"));
  }
  return v4;
}

uint64_t __39__TSUDateParser_parserForDefaultLocale__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t result;

  v4 = objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v5 = *(void **)(a1 + 32);
  if ((void *)v4 == v5)
    return objc_msgSend(*(id *)(a1 + 40), "datePreferencesChanged:", a2);
  result = objc_msgSend(v5, "isFinished");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "performSelector:onThread:withObject:waitUntilDone:", sel_datePreferencesChanged_, *(_QWORD *)(a1 + 32), a2, 0);
  return result;
}

uint64_t __39__TSUDateParser_parserForDefaultLocale__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "datePreferencesChanged:", a2);
}

- (TSUDateParser)initWithLocale:(__CFLocale *)a3
{
  TSUDateParser *v4;
  const __CFLocale *v5;
  const __CFString *Value;
  const __CFString *v7;
  const __CFString *v8;
  BOOL v9;
  id v10;
  const __CFArray *v11;
  const __CFArray *v12;
  CFIndex Count;
  CFIndex v14;
  CFIndex i;
  void *ValueAtIndex;
  void *v17;
  CFIndex j;
  CFIndex k;
  void *v20;
  void *v21;
  CFIndex m;
  CFDateFormatterStyle n;
  CFDateFormatterStyle ii;
  __CFDateFormatter *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)TSUDateParser;
  v4 = -[TSUDateParser init](&v27, sel_init);
  if (v4)
  {
    v4->mFormatCategories = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (a3)
      v5 = (const __CFLocale *)CFRetain(a3);
    else
      v5 = TSUCopyCurrentLocaleWithGregorianCalendar();
    v4->mLocale = v5;
    Value = (const __CFString *)CFLocaleGetValue(v5, (CFLocaleKey)*MEMORY[0x24BDBD3D8]);
    v7 = (const __CFString *)CFLocaleGetValue(v4->mLocale, (CFLocaleKey)*MEMORY[0x24BDBD418]);
    if (Value)
    {
      v8 = v7;
      v9 = CFStringCompare(Value, CFSTR("JP"), 1uLL) || v8 == 0;
      if (!v9 && CFStringCompare(v8, CFSTR("ja"), 1uLL) == kCFCompareEqualTo)
        v4->mIsJapaneseLocale = 1;
    }
    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v11 = (const __CFArray *)TSUCreateArrayOfDateFormatStringsForLocale(v4->mLocale);
    v12 = (const __CFArray *)TSUCreateArrayOfTimeFormatStringsForLocale(v4->mLocale);
    Count = CFArrayGetCount(v11);
    v14 = CFArrayGetCount(v12);
    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(v11, i);
        v17 = (void *)objc_msgSend(ValueAtIndex, "stringByAppendingString:", CFSTR(" "));
        -[TSUDateParser addFormat:locale:formatCategoryMap:](v4, "addFormat:locale:formatCategoryMap:", ValueAtIndex, v4->mLocale, v10);
        if (v14 >= 1)
        {
          for (j = 0; j != v14; ++j)
            -[TSUDateParser addFormat:locale:formatCategoryMap:](v4, "addFormat:locale:formatCategoryMap:", objc_msgSend(v17, "stringByAppendingString:", CFArrayGetValueAtIndex(v12, j)), v4->mLocale, v10);
        }
      }
    }
    if (v14 >= 1)
    {
      for (k = 0; k != v14; ++k)
      {
        v20 = (void *)CFArrayGetValueAtIndex(v12, k);
        v21 = (void *)objc_msgSend(v20, "stringByAppendingString:", CFSTR(" "));
        -[TSUDateParser addFormat:locale:formatCategoryMap:](v4, "addFormat:locale:formatCategoryMap:", v20, v4->mLocale, v10);
        if (Count >= 1)
        {
          for (m = 0; m != Count; ++m)
            -[TSUDateParser addFormat:locale:formatCategoryMap:](v4, "addFormat:locale:formatCategoryMap:", objc_msgSend(v21, "stringByAppendingString:", CFArrayGetValueAtIndex(v11, m)), v4->mLocale, v10);
        }
      }
    }
    CFRelease(v12);
    CFRelease(v11);
    for (n = kCFDateFormatterNoStyle; n != (kCFDateFormatterFullStyle|kCFDateFormatterShortStyle); ++n)
    {
      for (ii = kCFDateFormatterNoStyle; ii != (kCFDateFormatterFullStyle|kCFDateFormatterShortStyle); ++ii)
      {
        if (ii | n)
        {
          v25 = CFDateFormatterCreate(0, v4->mLocale, n, ii);
          -[TSUDateParser addFormat:locale:formatCategoryMap:](v4, "addFormat:locale:formatCategoryMap:", CFDateFormatterGetFormat(v25), v4->mLocale, v10);
          CFRelease(v25);
        }
      }
    }
    -[TSUDateParser addFormat:locale:formatCategoryMap:](v4, "addFormat:locale:formatCategoryMap:", TSUDefaultDateTimeFormat(), v4->mLocale, v10);

  }
  return v4;
}

- (void)dealloc
{
  __CFDateFormatter *mSpecialCaseFormatter;
  objc_super v4;

  mSpecialCaseFormatter = self->mSpecialCaseFormatter;
  if (mSpecialCaseFormatter)
    CFRelease(mSpecialCaseFormatter);
  v4.receiver = self;
  v4.super_class = (Class)TSUDateParser;
  -[TSUDateParser dealloc](&v4, sel_dealloc);
}

- (__CFDateFormatter)specialCaseDateFormatterForLocale:(__CFLocale *)a3
{
  __CFDateFormatter *mSpecialCaseFormatter;
  __CFDateFormatter *v6;
  __CFDateFormatter *v7;
  __CFDateFormatter *v8;
  const __CFString *v9;
  CFTimeZoneRef v10;

  mSpecialCaseFormatter = self->mSpecialCaseFormatter;
  if (!mSpecialCaseFormatter)
  {
LABEL_5:
    v7 = CFDateFormatterCreate(0, a3, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
    self->mSpecialCaseFormatter = v7;
    CFDateFormatterSetProperty(v7, (CFStringRef)*MEMORY[0x24BDBD2D0], (CFTypeRef)*MEMORY[0x24BDBD268]);
    v8 = self->mSpecialCaseFormatter;
    v9 = (const __CFString *)*MEMORY[0x24BDBD340];
    v10 = TSUGetGMTTimeZone();
    CFDateFormatterSetProperty(v8, v9, v10);
    return self->mSpecialCaseFormatter;
  }
  if (CFDateFormatterGetLocale(mSpecialCaseFormatter) != a3)
  {
    v6 = self->mSpecialCaseFormatter;
    if (v6)
      CFRelease(v6);
    goto LABEL_5;
  }
  return self->mSpecialCaseFormatter;
}

- (__CFDate)newDateFromStringTryingFormats:(__CFString *)a3 locale:(__CFLocale *)a4 formats:(id)a5 outSuccessfulFormatString:(const __CFString *)a6
{
  __CFDateFormatter *v10;
  CFLocaleRef v11;
  CFIndex Length;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __CFString *v17;
  CFDateRef v18;
  CFDateRef v19;
  __CFDate *v20;
  const __CFString **v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CFRange rangep;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v10 = -[TSUDateParser specialCaseDateFormatterForLocale:](self, "specialCaseDateFormatterForLocale:", a4);
  }
  else
  {
    v11 = TSUCopyCurrentLocaleWithGregorianCalendar();
    v10 = -[TSUDateParser specialCaseDateFormatterForLocale:](self, "specialCaseDateFormatterForLocale:", v11);
    CFRelease(v11);
  }
  Length = CFStringGetLength(a3);
  rangep.location = 0;
  rangep.length = Length;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v13)
  {
    v14 = v13;
    v22 = a6;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(a5);
        v17 = *(__CFString **)(*((_QWORD *)&v23 + 1) + 8 * i);
        CFDateFormatterSetFormat(v10, v17);
        v18 = CFDateFormatterCreateDateFromString(0, v10, a3, &rangep);
        if (v18)
        {
          v19 = v18;
          if (rangep.location || rangep.length != Length)
          {
            CFRelease(v18);
          }
          else
          {
            v20 = TSUCreateDateWithGregorianUnitsSetToDefaultValue((uint64_t)v18, v17);
            CFRelease(v19);
            if (v22)
              *v22 = CFStringCreateCopy(0, v17);
            if (v20)
              return v20;
          }
        }
      }
      v14 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v14);
  }
  return 0;
}

- (__CFDate)newDateFromString:(__CFString *)a3 preferredFormatString:(__CFString *)a4 successfulFormatString:(const __CFString *)a5 tryAggressiveFormats:(BOOL)a6
{
  _BOOL4 v6;
  __CFString *MutableCopy;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  const __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  uint64_t v22;
  char v23;

  if (!a3)
    return 0;
  v6 = a6;
  if (!CFStringGetLength(a3))
    return 0;
  MutableCopy = CFStringCreateMutableCopy(0, 0, a3);
  CFStringTransform(MutableCopy, 0, (CFStringRef)*MEMORY[0x24BDBD608], 0);
  if (a4)
  {
    if ((objc_msgSend(&stru_24D61C228, "isEqualToString:", a4) & 1) != 0)
    {
      a4 = 0;
    }
    else
    {
      v12 = +[TSUDateFormatter datePortionOfDateTimeFormatString:](TSUDateFormatter, "datePortionOfDateTimeFormatString:", a4);
      v13 = +[TSUDateFormatter timePortionOfDateTimeFormatString:](TSUDateFormatter, "timePortionOfDateTimeFormatString:", a4);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
      objc_msgSend(v14, "addObject:", a4);
      if (v12 && (objc_msgSend(&stru_24D61C228, "isEqualToString:", v12) & 1) == 0)
        objc_msgSend(v14, "addObject:", v12);
      if (v13 && (objc_msgSend(&stru_24D61C228, "isEqualToString:", v13) & 1) == 0)
        objc_msgSend(v14, "addObject:", v13);
      a4 = -[TSUDateParser newDateFromStringTryingFormats:locale:formats:outSuccessfulFormatString:](self, "newDateFromStringTryingFormats:locale:formats:outSuccessfulFormatString:", MutableCopy, self->mLocale, v14, a5);

    }
  }
  v15 = (void *)-[NSMutableArray objectEnumerator](self->mFormatCategories, "objectEnumerator");
  v23 = 0;
  if (a4)
    goto LABEL_15;
  v17 = v15;
  v18 = (void *)objc_msgSend(v15, "nextObject");
  if (v18)
  {
    a4 = 0;
    v19 = 0;
    while (1)
    {
      v20 = (__CFString *)objc_msgSend(v18, "newDateFromString:forceAllowAMPM:successfulFormatString:perfect:", MutableCopy, self->mIsJapaneseLocale, a5, &v23);
      if (v20)
      {
        v21 = v20;
        if (v23)
        {
          if (a4)
            CFRelease(a4);
          a4 = v21;
          goto LABEL_39;
        }
        if (!a4)
        {
          if (a5)
          {
            v19 = *a5;
            goto LABEL_28;
          }
LABEL_29:
          a4 = v21;
          goto LABEL_30;
        }
        CFRelease(v20);
        if (a5)
        {
          if (*a5)
            CFRelease(*a5);
          v21 = a4;
LABEL_28:
          *a5 = 0;
          goto LABEL_29;
        }
      }
LABEL_30:
      v18 = (void *)objc_msgSend(v17, "nextObject");
      if (!v18)
      {
        if (!a4)
          goto LABEL_39;
        if (a5)
          *a5 = v19;
        goto LABEL_15;
      }
    }
  }
  v19 = 0;
  a4 = 0;
LABEL_39:
  if (v19)
    CFRelease(v19);
  if (!a4 && v6)
  {
    v22 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("yy"), 0);
    a4 = 0;
    if (-[__CFString rangeOfCharacterFromSet:](MutableCopy, "rangeOfCharacterFromSet:", objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet")) != 0x7FFFFFFFFFFFFFFFLL)a4 = -[TSUDateParser newDateFromStringTryingFormats:locale:formats:outSuccessfulFormatString:](self, "newDateFromStringTryingFormats:locale:formats:outSuccessfulFormatString:", MutableCopy, self->mLocale, v22, a5);
  }
LABEL_15:
  CFRelease(MutableCopy);
  return (__CFDate *)a4;
}

- (__CFDate)newDateFromString:(__CFString *)a3 successfulFormatString:(const __CFString *)a4
{
  return -[TSUDateParser newDateFromString:preferredFormatString:successfulFormatString:tryAggressiveFormats:](self, "newDateFromString:preferredFormatString:successfulFormatString:tryAggressiveFormats:", a3, 0, a4, 0);
}

- (void)addFormat:(id)a3 locale:(__CFLocale *)a4 formatCategoryMap:(id)a5
{
  TSUDateFormatCategory *v9;
  TSUDateFormatCategory *v10;
  unsigned __int16 v11;
  uint64_t v12;

  v12 = 0;
  v11 = 0;
  -[TSUDateParser parseFormat:initialPattern:separator:](self, "parseFormat:initialPattern:separator:", a3, &v12, &v11);
  v9 = (TSUDateFormatCategory *)objc_msgSend(a5, "objectForKey:", v12);
  if (!v9)
  {
    v10 = [TSUDateFormatCategory alloc];
    v9 = -[TSUDateFormatCategory initWithInitialPattern:locale:](v10, "initWithInitialPattern:locale:", v12, a4);
    -[NSMutableArray addObject:](self->mFormatCategories, "addObject:", v9);
    objc_msgSend(a5, "setObject:forKey:", v9, v12);

  }
  -[TSUDateFormatCategory addSeparator:format:locale:](v9, "addSeparator:format:locale:", v11, a3, a4);
}

- (void)parseFormat:(id)a3 initialPattern:(id *)a4 separator:(unsigned __int16 *)a5
{
  void *v8;
  id v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  id v18;
  uint64_t v19;
  int v20;
  id v21;
  uint64_t v22;

  if (!parseFormat_initialPattern_separator__formatCharacterSet)
  {
    v8 = (void *)objc_opt_class();
    objc_sync_enter(v8);
    if (!parseFormat_initialPattern_separator__formatCharacterSet)
    {
      v9 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("GyMdhHmsSEDFwWakKZ"));
      parseFormat_initialPattern_separator__inverseFormatCharacterSet = (uint64_t)(id)objc_msgSend(v9, "invertedSet");
      __dmb(0xBu);
      parseFormat_initialPattern_separator__formatCharacterSet = (uint64_t)v9;
    }
    objc_sync_exit(v8);
  }
  v10 = objc_msgSend(a3, "length");
  if (!v10)
  {
    v11 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUDateParser(Private) parseFormat:initialPattern:separator:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDateParser.m"), 425, CFSTR("Zero length date format"));
  }
  v13 = objc_msgSend(a3, "rangeOfCharacterFromSet:", parseFormat_initialPattern_separator__formatCharacterSet);
  v14 = v10;
  if (v13 == 0x7FFFFFFFFFFFFFFFLL
    || ((v15 = objc_msgSend(a3, "rangeOfCharacterFromSet:options:range:", parseFormat_initialPattern_separator__inverseFormatCharacterSet, 0, v13, v10 - v13), v15 != 0x7FFFFFFFFFFFFFFFLL)? (v14 = v15): (v14 = v10), v14 >= v10))
  {
    *a5 = 0;
  }
  else
  {
    v16 = objc_msgSend(a3, "characterAtIndex:", v14);
    if (v16 == 34)
      v17 = 39;
    else
      v17 = v16;
    *a5 = v17;
    if (v17 == 39)
    {
      if (v14 + 1 >= v10)
      {
        v18 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUDateParser(Private) parseFormat:initialPattern:separator:]");
        objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDateParser.m"), 458, CFSTR("No character following single quote"));
      }
      v20 = objc_msgSend(a3, "characterAtIndex:", v14 + 1);
      *a5 = v20;
      if (v20 == 39)
      {
        v21 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUDateParser(Private) parseFormat:initialPattern:separator:]");
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDateParser.m"), 460, CFSTR("Two single quotes in a row"));
      }
    }
  }
  *a4 = (id)objc_msgSend(a3, "substringToIndex:", v14);
}

- (void)datePreferencesChanged:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  TSUDateParser *v6;
  uint64_t v7;

  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread", a3), "threadDictionary");
  if ((TSUDateParser *)objc_msgSend(v3, "objectForKey:", CFSTR("TSUDateParserThreadDictionaryKey")) != self)
  {
    v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUDateParser(Private) datePreferencesChanged:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDateParser.m"), 476, CFSTR("Registered wrong date parser for date preference change notification"));
  }
  v6 = self;
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("TSUDateParserThreadDictionaryKey"));
  TSURemoveLocaleChangeObserver((void *)objc_msgSend(v3, "objectForKey:", CFSTR("TSUDateParserThreadDictionaryLocaleObserverKey")));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("TSUDateParserThreadDictionaryLocaleObserverKey"));
  v7 = objc_msgSend(v3, "objectForKey:", CFSTR("TSUDateParserThreadDictionaryExitObserverKey"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", v7);
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("TSUDateParserThreadDictionaryExitObserverKey"));
  objc_msgSend(+[TSUDateParserLibrary sharedDateParserLibrary](TSUDateParserLibrary, "sharedDateParserLibrary"), "returnDateParser:", self);

}

@end
