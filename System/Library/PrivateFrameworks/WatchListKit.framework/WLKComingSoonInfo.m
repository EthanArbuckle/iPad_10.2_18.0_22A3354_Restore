@implementation WLKComingSoonInfo

+ (id)comingSoonItemsWithDictionaries:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  WLKComingSoonInfo *v11;
  WLKComingSoonInfo *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v11 = [WLKComingSoonInfo alloc];
        v12 = -[WLKComingSoonInfo initWithDictionary:](v11, "initWithDictionary:", v10, (_QWORD)v16);
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
    v13 = v4;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

- (WLKComingSoonInfo)initWithDictionary:(id)a3 brandID:(id)a4
{
  id v6;
  void *v7;
  WLKComingSoonInfo *v8;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("channelId"));

  v8 = -[WLKComingSoonInfo initWithDictionary:](self, "initWithDictionary:", v7);
  return v8;
}

- (WLKComingSoonInfo)initWithDictionary:(id)a3
{
  id v4;
  WLKComingSoonInfo *v5;
  WLKComingSoonInfo *v6;
  uint64_t v7;
  NSString *dateFormat;
  void *v9;
  uint64_t v10;
  NSString *brandID;
  void *v12;
  uint64_t v13;
  NSString *dateString;
  objc_super v16;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("isComingSoon"));
  v5 = (WLKComingSoonInfo *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v16.receiver = self;
    v16.super_class = (Class)WLKComingSoonInfo;
    v6 = -[WLKComingSoonInfo init](&v16, sel_init);
    if (v6)
    {
      v6->_comingSoon = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", CFSTR("isComingSoon"), 0);
      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("comingSoonDate"));
      v7 = objc_claimAutoreleasedReturnValue();
      dateFormat = v6->_dateFormat;
      v6->_dateFormat = (NSString *)v7;

      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("channelId"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      brandID = v6->_brandID;
      v6->_brandID = (NSString *)v10;

      if (-[NSString length](v6->_dateFormat, "length"))
      {
        -[WLKComingSoonInfo _initializeDatesStrings](v6, "_initializeDatesStrings");
      }
      else if (v6->_comingSoon)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.WatchListKit"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("COMING_SOON"), &stru_1E68AA228, CFSTR("WatchListKit"));
        v13 = objc_claimAutoreleasedReturnValue();
        dateString = v6->_dateString;
        v6->_dateString = (NSString *)v13;

      }
    }
    self = v6;
    v5 = self;
  }

  return v5;
}

- (void)_initializeDatesStrings
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSString *v26;
  NSString *dateString;
  id v28;

  -[NSString componentsSeparatedByString:](self->_dateFormat, "componentsSeparatedByString:", CFSTR("-"));
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  if (objc_msgSend(v28, "count") == 3)
  {
    self->_precision = 2;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.WatchListKit"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("COMING_SOON_FULL_MONTH_DATE"), &stru_1E68AA228, CFSTR("WatchListKit"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setYear:", objc_msgSend(v6, "integerValue"));

    objc_msgSend(v28, "objectAtIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMonth:", objc_msgSend(v7, "integerValue"));

    objc_msgSend(v28, "objectAtIndex:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDay:", objc_msgSend(v8, "integerValue"));
    v9 = CFSTR("MMMM d");
LABEL_13:

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dateFromComponents:", v3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v23, "setTimeStyle:", 0);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setLocale:", v24);

    objc_msgSend(v23, "setLocalizedDateFormatFromTemplate:", v9);
    objc_msgSend(v23, "stringFromDate:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@"), 0, v25);
    v26 = (NSString *)objc_claimAutoreleasedReturnValue();
    dateString = self->_dateString;
    self->_dateString = v26;

    goto LABEL_14;
  }
  if (objc_msgSend(v28, "count") == 2)
  {
    self->_precision = 1;
    objc_msgSend(v28, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    v12 = objc_alloc(MEMORY[0x1E0C99D48]);
    v8 = (void *)objc_msgSend(v12, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "components:fromDate:", 4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "year");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.WatchListKit"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v11 == v15)
      v18 = CFSTR("COMING_SOON_IN_FULL_MONTH");
    else
      v18 = CFSTR("COMING_SOON_FULL_MONTH_YEAR");
    if (v11 == v15)
      v9 = CFSTR("MMMM");
    else
      v9 = CFSTR("MMMM y");
    objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_1E68AA228, CFSTR("WatchListKit"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setYear:", v11);
    objc_msgSend(v28, "objectAtIndex:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMonth:", objc_msgSend(v19, "integerValue"));

    goto LABEL_13;
  }
  if (objc_msgSend(v28, "count") == 1)
  {
    self->_precision = 0;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.WatchListKit"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("COMING_SOON_YEAR"), &stru_1E68AA228, CFSTR("WatchListKit"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setYear:", objc_msgSend(v8, "integerValue"));
    v9 = CFSTR("y");
    goto LABEL_13;
  }
LABEL_14:

}

- (BOOL)isComingSoon
{
  return self->_comingSoon;
}

- (NSString)dateString
{
  return self->_dateString;
}

- (NSString)dateFormat
{
  return self->_dateFormat;
}

- (unint64_t)precision
{
  return self->_precision;
}

- (NSString)brandID
{
  return self->_brandID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandID, 0);
  objc_storeStrong((id *)&self->_dateFormat, 0);
  objc_storeStrong((id *)&self->_dateString, 0);
}

@end
