@implementation TSUDateFormatCategoryEntry

- (TSUDateFormatCategoryEntry)initWithSeparator:(unsigned __int16)a3
{
  TSUDateFormatCategoryEntry *v4;
  TSUDateFormatCategoryEntry *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSUDateFormatCategoryEntry;
  v4 = -[TSUDateFormatCategoryEntry init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->mSeparator = a3;
    v4->mFormatters = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    v5->mFormatStrings = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->mFormatters);

  v3.receiver = self;
  v3.super_class = (Class)TSUDateFormatCategoryEntry;
  -[TSUDateFormatCategoryEntry dealloc](&v3, sel_dealloc);
}

- (unsigned)separator
{
  return self->mSeparator;
}

- (void)addFormat:(id)a3 locale:(__CFLocale *)a4
{
  __CFDateFormatter *v7;
  const __CFString *v8;
  CFTimeZoneRef v9;
  uint64_t v10;
  id v11;
  const void *v12;
  id v13;

  if ((-[NSMutableSet containsObject:](self->mFormatStrings, "containsObject:") & 1) == 0)
  {
    -[NSMutableSet addObject:](self->mFormatStrings, "addObject:", a3);
    v7 = CFDateFormatterCreate(0, a4, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
    CFDateFormatterSetProperty(v7, (CFStringRef)*MEMORY[0x24BDBD2D0], (CFTypeRef)*MEMORY[0x24BDBD268]);
    v8 = (const __CFString *)*MEMORY[0x24BDBD340];
    v9 = TSUGetGMTTimeZone();
    CFDateFormatterSetProperty(v7, v8, v9);
    v10 = objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = objc_alloc(MEMORY[0x24BDBCE48]);
    v13 = (id)objc_msgSend(v11, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
    v12 = (const void *)objc_msgSend(v13, "dateFromComponents:", objc_msgSend(v13, "components:fromDate:", 4, v10));
    CFDateFormatterSetProperty(v7, (CFStringRef)*MEMORY[0x24BDBD2C0], v12);
    CFDateFormatterSetFormat(v7, (CFStringRef)a3);
    CFArrayAppendValue(self->mFormatters, v7);
    CFRelease(v7);

  }
}

- (__CFDate)newDateFromString:(__CFString *)a3 forceAllowAMPM:(BOOL)a4 successfulFormatString:(const __CFString *)a5 perfect:(BOOL *)a6
{
  CFIndex Length;
  CFIndex Count;
  CFIndex v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  __CFDateFormatter *ValueAtIndex;
  CFDateRef v16;
  BOOL v17;
  CFTypeRef v18;
  CFTypeRef v19;
  __CFString *Format;
  const __CFDate *v21;
  const __CFString *StringWithDate;
  const __CFString **v23;
  const __CFString *v26;
  BOOL *v27;
  const __CFDate *cf;
  TSUDateFormatCategoryEntry *v30;
  _BOOL4 v31;
  CFRange rangep;

  v31 = a4;
  Length = CFStringGetLength(a3);
  v30 = self;
  Count = CFArrayGetCount(self->mFormatters);
  v27 = a6;
  *a6 = 0;
  if (Count < 1)
    return 0;
  v11 = Count;
  cf = 0;
  v26 = 0;
  v12 = (const __CFString *)*MEMORY[0x24BDBD2B8];
  v13 = (const __CFString *)*MEMORY[0x24BDBD2E8];
  v14 = 1;
  do
  {
    ValueAtIndex = (__CFDateFormatter *)CFArrayGetValueAtIndex(v30->mFormatters, v14 - 1);
    rangep.location = 0;
    rangep.length = Length;
    v16 = CFDateFormatterCreateDateFromString(0, ValueAtIndex, a3, &rangep);
    if (v16)
      v17 = 1;
    else
      v17 = !v31;
    if (!v17)
    {
      v18 = CFDateFormatterCopyProperty(ValueAtIndex, v12);
      v19 = CFDateFormatterCopyProperty(ValueAtIndex, v13);
      CFDateFormatterSetProperty(ValueAtIndex, v12, CFSTR("AM"));
      CFDateFormatterSetProperty(ValueAtIndex, v13, CFSTR("PM"));
      rangep.location = 0;
      rangep.length = Length;
      v16 = CFDateFormatterCreateDateFromString(0, ValueAtIndex, a3, &rangep);
      CFDateFormatterSetProperty(ValueAtIndex, v12, v18);
      CFDateFormatterSetProperty(ValueAtIndex, v13, v19);
      CFRelease(v18);
      CFRelease(v19);
    }
    if (!v16)
      goto LABEL_18;
    if (rangep.location || rangep.length != Length)
    {
      CFRelease(v16);
LABEL_18:
      v21 = 0;
      continue;
    }
    Format = (__CFString *)CFDateFormatterGetFormat(ValueAtIndex);
    v21 = TSUCreateDateWithGregorianUnitsSetToDefaultValue((uint64_t)v16, Format);
    CFRelease(v16);
    if (a5)
      *a5 = CFStringCreateCopy(0, Format);
    StringWithDate = CFDateFormatterCreateStringWithDate(0, ValueAtIndex, v21);
    if (CFStringCompare(StringWithDate, a3, 1uLL) == kCFCompareEqualTo)
    {
      *v27 = 1;
      goto LABEL_25;
    }
    if (cf)
    {
      CFRelease(v21);
      if (a5)
      {
        CFRelease(*a5);
        v23 = a5;
LABEL_22:
        v21 = 0;
        *v23 = 0;
        goto LABEL_25;
      }
    }
    else
    {
      v23 = a5;
      if (a5)
      {
        v26 = *a5;
        cf = v21;
        goto LABEL_22;
      }
      cf = v21;
    }
    v21 = 0;
LABEL_25:
    CFRelease(StringWithDate);
    if (v21)
      break;
  }
  while (v14++ < v11);
  if (v21 || !cf)
  {
    if (cf)
      CFRelease(cf);
    if (v26)
      CFRelease(v26);
    return v21;
  }
  else
  {
    if (a5)
      *a5 = v26;
    return cf;
  }
}

@end
