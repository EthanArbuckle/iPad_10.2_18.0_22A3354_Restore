@implementation TSUDateFormatCategory

- (TSUDateFormatCategory)initWithInitialPattern:(id)a3 locale:(__CFLocale *)a4
{
  TSUDateFormatCategory *v6;
  __CFDateFormatter *v7;
  __CFDateFormatter *mInitialFormatter;
  const __CFString *v9;
  CFTimeZoneRef v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSUDateFormatCategory;
  v6 = -[TSUDateFormatCategory init](&v12, sel_init);
  if (v6)
  {
    v7 = CFDateFormatterCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a4, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
    v6->mInitialFormatter = v7;
    CFDateFormatterSetProperty(v7, (CFStringRef)*MEMORY[0x24BDBD2D0], (CFTypeRef)*MEMORY[0x24BDBD268]);
    mInitialFormatter = v6->mInitialFormatter;
    v9 = (const __CFString *)*MEMORY[0x24BDBD340];
    v10 = TSUGetGMTTimeZone();
    CFDateFormatterSetProperty(mInitialFormatter, v9, v10);
    CFDateFormatterSetFormat(v6->mInitialFormatter, (CFStringRef)a3);
    v6->mEntries = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->mInitialFormatter);

  v3.receiver = self;
  v3.super_class = (Class)TSUDateFormatCategory;
  -[TSUDateFormatCategory dealloc](&v3, sel_dealloc);
}

- (void)addSeparator:(unsigned __int16)a3 format:(id)a4 locale:(__CFLocale *)a5
{
  uint64_t v7;
  TSUDateFormatCategoryEntry *v9;

  v7 = a3;
  v9 = -[TSUDateFormatCategory entryForSeparator:](self, "entryForSeparator:");
  if (!v9)
  {
    v9 = -[TSUDateFormatCategoryEntry initWithSeparator:]([TSUDateFormatCategoryEntry alloc], "initWithSeparator:", v7);
    -[NSMutableArray addObject:](self->mEntries, "addObject:", v9);

  }
  -[TSUDateFormatCategoryEntry addFormat:locale:](v9, "addFormat:locale:", a4, a5);
}

- (id)entryForSeparator:(unsigned __int16)a3
{
  int v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v5 = -[NSMutableArray count](self->mEntries, "count");
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  while (1)
  {
    v8 = (void *)-[NSMutableArray objectAtIndex:](self->mEntries, "objectAtIndex:", v7);
    if (objc_msgSend(v8, "separator") == v3)
      break;
    if (v6 == ++v7)
      return 0;
  }
  return v8;
}

- (__CFDate)newDateFromString:(__CFString *)a3 forceAllowAMPM:(BOOL)a4 successfulFormatString:(const __CFString *)a5 perfect:(BOOL *)a6
{
  _BOOL8 v8;
  CFIndex Length;
  int AbsoluteTimeFromString;
  __CFDate *result;
  BOOL v14;
  uint64_t CharacterAtIndex;
  CFRange v17;

  v8 = a4;
  Length = CFStringGetLength(a3);
  v17.location = 0;
  v17.length = Length;
  AbsoluteTimeFromString = CFDateFormatterGetAbsoluteTimeFromString(self->mInitialFormatter, a3, &v17, 0);
  result = 0;
  if (AbsoluteTimeFromString)
    v14 = v17.location == 0;
  else
    v14 = 0;
  if (v14 && v17.length >= 1)
  {
    if (v17.length >= Length)
      CharacterAtIndex = 0;
    else
      CharacterAtIndex = CFStringGetCharacterAtIndex(a3, v17.length);
    result = -[TSUDateFormatCategory entryForSeparator:](self, "entryForSeparator:", CharacterAtIndex);
    if (result)
      return (__CFDate *)-[__CFDate newDateFromString:forceAllowAMPM:successfulFormatString:perfect:](result, "newDateFromString:forceAllowAMPM:successfulFormatString:perfect:", a3, v8, a5, a6);
  }
  return result;
}

@end
