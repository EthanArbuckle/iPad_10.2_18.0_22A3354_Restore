@implementation StockNewsItem

+ (id)localizedStringForDate:(id)a3
{
  const __CFDate *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  __CFString *StringWithDate;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;

  v3 = (const __CFDate *)a3;
  if (v3)
  {
    if (!dateFormatter_0)
      dateFormatter_0 = (uint64_t)CFDateFormatterCreate(0, (CFLocaleRef)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale"), kCFDateFormatterShortStyle, kCFDateFormatterNoStyle);
    if (!timeFormatter)
      timeFormatter = (uint64_t)CFDateFormatterCreate(0, (CFLocaleRef)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale"), kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
    v4 = objc_alloc(MEMORY[0x24BDBCE48]);
    v5 = (void *)objc_msgSend(v4, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
    objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeZone:", v6);

    v7 = objc_msgSend(v5, "isDateInToday:", v3);
    StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, (CFDateFormatterRef)timeFormatter, v3);
    v9 = StringWithDate;
    if (v7)
    {
      v10 = StringWithDate;
    }
    else
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("%@ at %@"), &stru_24D74CF50, CFSTR("Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (__CFString *)CFDateFormatterCreateStringWithDate(0, (CFDateFormatterRef)dateFormatter_0, v3);
      objc_msgSend(v11, "stringWithFormat:", v13, v14, v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)resetLocale
{
  NSString *localizedDateString;

  if (dateFormatter_0)
  {
    CFRelease((CFTypeRef)dateFormatter_0);
    dateFormatter_0 = 0;
  }
  if (timeFormatter)
  {
    CFRelease((CFTypeRef)timeFormatter);
    timeFormatter = 0;
  }
  localizedDateString = self->_localizedDateString;
  self->_localizedDateString = 0;

}

- (StockNewsItem)initWithArchiveDictionary:(id)a3
{
  id v4;
  StockNewsItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  StockNewsItem *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)StockNewsItem;
  v5 = -[StockNewsItem init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("nih"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("nisum"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("nis"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("nid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v10)) != 0)
    {
      v12 = (void *)v11;
      -[StockNewsItem setHeadline:](v5, "setHeadline:", v6);
      -[StockNewsItem setSummary:](v5, "setSummary:", v7);
      -[StockNewsItem setSource:](v5, "setSource:", v8);
      v13 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v9, "doubleValue");
      objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[StockNewsItem setDate:](v5, "setDate:", v14);

      -[StockNewsItem setLink:](v5, "setLink:", v12);
      v15 = v5;

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)archiveDictionary
{
  id v3;
  void *v4;
  void *v5;
  NSString *headline;
  NSString *summary;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x24BDD16E0]);
  -[NSDate timeIntervalSinceReferenceDate](self->_date, "timeIntervalSinceReferenceDate");
  v4 = (void *)objc_msgSend(v3, "initWithDouble:");
  v5 = (void *)MEMORY[0x24BDBCE70];
  headline = self->_headline;
  summary = self->_summary;
  -[NSURL absoluteString](self->_link, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", headline, CFSTR("nih"), summary, CFSTR("nisum"), v4, CFSTR("nid"), v8, CFSTR("nil"), self->_source, CFSTR("nis"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setDate:(id)a3
{
  NSDate *v5;
  NSString *localizedDateString;
  NSDate *v7;

  v5 = (NSDate *)a3;
  if (self->_date != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_date, a3);
    localizedDateString = self->_localizedDateString;
    self->_localizedDateString = 0;

    v5 = v7;
  }

}

- (int64_t)chronologicalComparisonWithNewsItem:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  objc_msgSend(a3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockNewsItem date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);

  return v6;
}

- (NSString)localizedDateString
{
  NSString *localizedDateString;
  NSString *v4;
  NSString *v5;

  localizedDateString = self->_localizedDateString;
  if (!localizedDateString)
  {
    +[StockNewsItem localizedStringForDate:](StockNewsItem, "localizedStringForDate:", self->_date);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_localizedDateString;
    self->_localizedDateString = v4;

    localizedDateString = self->_localizedDateString;
  }
  return localizedDateString;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[StockNewsItem headline](self, "headline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockNewsItem date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<StockNewsItem: %p, headline: %@, date: %@>"), self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)headline
{
  return self->_headline;
}

- (void)setHeadline:(id)a3
{
  objc_storeStrong((id *)&self->_headline, a3);
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (NSURL)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
  objc_storeStrong((id *)&self->_link, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDateString, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_headline, 0);
}

@end
