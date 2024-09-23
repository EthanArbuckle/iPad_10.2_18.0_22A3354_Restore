@implementation OITSUDateFormatter_FormatterCache

- (OITSUDateFormatter_FormatterCache)init
{
  OITSUDateFormatter_FormatterCache *v2;
  uint64_t v3;
  NSLock *dateFormatterCacheLock;
  uint64_t v5;
  NSMutableDictionary *dateFormatterCache;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OITSUDateFormatter_FormatterCache;
  v2 = -[OITSUDateFormatter_FormatterCache init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    dateFormatterCacheLock = v2->_dateFormatterCacheLock;
    v2->_dateFormatterCacheLock = (NSLock *)v3;

    v5 = objc_opt_new();
    dateFormatterCache = v2->_dateFormatterCache;
    v2->_dateFormatterCache = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (id)dateFormatterStringFromDate:(id)a3 withFormat:(id)a4 locale:(id)a5
{
  const __CFDate *v8;
  __CFString *v9;
  id v10;
  __CFString *StringWithDate;
  __CFDateFormatter *UsingHarmonizedSymbols;
  void *v13;
  const __CFString *v14;
  void *v15;

  v8 = (const __CFDate *)a3;
  v9 = (__CFString *)a4;
  v10 = a5;
  StringWithDate = 0;
  if (v8 && v9)
  {
    -[NSLock lock](self->_dateFormatterCacheLock, "lock");
    UsingHarmonizedSymbols = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_dateFormatterCache, "objectForKey:", v9);
    if (!UsingHarmonizedSymbols)
    {
      objc_msgSend(v10, "gregorianCalendarLocale");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      UsingHarmonizedSymbols = TSUDateFormatterCFDateFormatterCreateUsingHarmonizedSymbols(0, v13, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);

      v14 = (const __CFString *)*MEMORY[0x24BDBD340];
      TSUGetGMTTimeZone();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      CFDateFormatterSetProperty(UsingHarmonizedSymbols, v14, v15);

      CFDateFormatterSetFormat(UsingHarmonizedSymbols, v9);
      -[NSMutableDictionary setObject:forKey:](self->_dateFormatterCache, "setObject:forKey:", UsingHarmonizedSymbols, v9);

    }
    StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, UsingHarmonizedSymbols, v8);
    -[NSLock unlock](self->_dateFormatterCacheLock, "unlock");
  }

  return StringWithDate;
}

+ (id)dateFormatterStringFromDate:(id)a3 withFormat:(id)a4 locale:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "localeSpecificStorageForKey:", CFSTR("TSUDateFormatter_FormatterCache"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = a1;
    objc_sync_enter(v12);
    objc_msgSend(v10, "localeSpecificStorageForKey:", CFSTR("TSUDateFormatter_FormatterCache"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v11 = (void *)objc_opt_new();
      objc_msgSend(v10, "setLocaleSpecificStorage:forKey:", v11, CFSTR("TSUDateFormatter_FormatterCache"));
    }
    objc_sync_exit(v12);

  }
  objc_msgSend(v11, "dateFormatterStringFromDate:withFormat:locale:", v8, v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatterCache, 0);
  objc_storeStrong((id *)&self->_dateFormatterCacheLock, 0);
}

@end
