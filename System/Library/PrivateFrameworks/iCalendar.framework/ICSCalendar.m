@implementation ICSCalendar

+ (id)calendarWithKnownTimeZones
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  ICSCalendar *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(MEMORY[0x1E0C99E80], "knownTimeZoneNames", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = +[ICSTimeZone timeZoneWithSystemTimeZoneName:](ICSTimeZone, "timeZoneWithSystemTimeZoneName:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  v8 = objc_alloc_init(ICSCalendar);
  v9 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend((id)_sCache, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSCalendar setComponents:](v8, "setComponents:", v11);

  return v8;
}

+ (id)name
{
  return CFSTR("VCALENDAR");
}

+ (void)setDefaultProdid:(id)a3
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  if ((id)__defaultProdid != v6)
    objc_storeStrong((id *)&__defaultProdid, a3);
  objc_sync_exit(v5);

}

+ (id)defaultProdid
{
  id v2;
  id v3;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (id)__defaultProdid;
  objc_sync_exit(v2);

  return v3;
}

+ (int)methodFromICSString:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUBLISH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REPLY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CANCEL")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REFRESH")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COUNTER")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DECLINE-COUNTER")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)ICSStringFromMethod:(int)a3
{
  if ((a3 - 1) > 7)
    return 0;
  else
    return off_1E953A7E0[a3 - 1];
}

+ (int)calendarServerAccessFromICSString:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONFIDENTIAL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUBLIC")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRIVATE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)ICSStringFromCalendarServerAccess:(int)a3
{
  if ((a3 - 1) > 3)
    return 0;
  else
    return off_1E953A820[a3 - 1];
}

+ (int64_t)compareCalendarServerAccess:(int)a3 withAccess:(int)a4
{
  if (a3 < a4)
    return -1;
  else
    return a3 > a4;
}

- (ICSCalendar)init
{
  return (ICSCalendar *)-[ICSCalendar _initWithVersionAndProdID:](self, "_initWithVersionAndProdID:", 1);
}

- (id)_initWithVersionAndProdID:(BOOL)a3
{
  _BOOL4 v3;
  ICSCalendar *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *masters;
  NSMutableDictionary *v7;
  NSMutableDictionary *occurrences;
  NSMutableSet *v9;
  NSMutableSet *keys;
  NSMutableDictionary *v11;
  NSMutableDictionary *timezones;
  NSMutableArray *v13;
  NSMutableArray *parsingErrors;
  void *v15;
  objc_super v17;

  v3 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ICSCalendar;
  v4 = -[ICSComponent init](&v17, sel_init);
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    masters = v4->_masters;
    v4->_masters = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    occurrences = v4->_occurrences;
    v4->_occurrences = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    keys = v4->_keys;
    v4->_keys = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    timezones = v4->_timezones;
    v4->_timezones = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    parsingErrors = v4->_parsingErrors;
    v4->_parsingErrors = v13;

    if (v3)
    {
      -[ICSCalendar setVersion:](v4, "setVersion:", CFSTR("2.0"));
      -[ICSCalendar setCalscale:](v4, "setCalscale:", CFSTR("GREGORIAN"));
      objc_msgSend((id)objc_opt_class(), "defaultProdid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSCalendar setProdid:](v4, "setProdid:", v15);

    }
  }
  return v4;
}

- (NSString)calscale
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("CALSCALE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setCalscale:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("CALSCALE"));
}

- (int)method
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("METHOD"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longValue");

  return v5;
}

- (void)setMethod:(int)a3
{
  id v4;

  +[ICSPredefinedValue numberWithLong:](ICSMethodValue, "numberWithLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5025, CFSTR("METHOD"));

}

- (NSString)prodid
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("PRODID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setProdid:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("PRODID"));
}

- (NSString)version
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("VERSION"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setVersion:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("VERSION"));
}

- (ICSDuration)x_apple_auto_refresh
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-AUTO-REFRESH"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICSDuration durationFromICSString:](ICSDuration, "durationFromICSString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICSDuration *)v5;
}

- (void)setX_apple_auto_refresh:(id)a3
{
  -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", a3, 5011, CFSTR("X-APPLE-AUTO-REFRESH"));
}

- (ICSColor)x_apple_calendar_color
{
  void *v2;
  void *v3;
  void *v4;
  ICSColor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ICSColor *v15;
  int v17;
  uint64_t v18;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-CALENDAR-COLOR"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length") == 7 || objc_msgSend(v4, "length") == 9)
  {
    v5 = 0;
    if (objc_msgSend(v4, "characterAtIndex:", 0) == 35)
    {
      v18 = 0;
      v17 = 0;
      v6 = (void *)MEMORY[0x1E0CB3900];
      objc_msgSend(v4, "substringWithRange:", 1, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "scannerWithString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scanHexInt:", (char *)&v18 + 4);

      v9 = (void *)MEMORY[0x1E0CB3900];
      objc_msgSend(v4, "substringWithRange:", 3, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scannerWithString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scanHexInt:", &v18);

      v12 = (void *)MEMORY[0x1E0CB3900];
      objc_msgSend(v4, "substringWithRange:", 5, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scannerWithString:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "scanHexInt:", &v17);

      v15 = [ICSColor alloc];
      v5 = -[ICSColor initWithRed:green:blue:](v15, "initWithRed:green:blue:", BYTE4(v18), v18, v17);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setX_apple_calendar_color:(id)a3
{
  void *v4;
  id v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  id v10;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = a3;
    v6 = objc_msgSend(v5, "red");
    v7 = objc_msgSend(v5, "green");
    v8 = objc_msgSend(v5, "blue");

    objc_msgSend(v4, "stringWithFormat:", CFSTR("#%02X%02X%02X"), v6, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = (id)v9;
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", v9, CFSTR("X-APPLE-CALENDAR-COLOR"));

}

- (void)setX_wr_caldesc:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-WR-CALDESC"));
}

- (NSString)x_wr_caldesc
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-WR-CALDESC"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)x_wr_calname
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-WR-CALNAME"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_wr_calname:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-WR-CALNAME"));
}

- (NSString)x_apple_language
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-LANGUAGE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_apple_language:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-APPLE-LANGUAGE"));
}

- (NSString)x_apple_region
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-REGION"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_apple_region:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-APPLE-REGION"));
}

- (NSString)x_wr_relcalid
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-WR-RELCALID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_wr_relcalid:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-WR-RELCALID"));
}

- (NSString)x_wr_timezone
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-WR-TIMEZONE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_wr_timezone:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-WR-TIMEZONE"));
}

- (id)systemTimeZoneForDate:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "tzid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "tzid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSCalendar timeZoneForKey:](self, "timeZoneForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "systemTimeZoneForDate:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v11 = (void *)MEMORY[0x1E0C99E80];
        objc_msgSend(v4, "tzid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeZoneWithName:", v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }

  return v7;
}

- (id)systemCalendarForDate:(id)a3 options:(int)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (objc_class *)MEMORY[0x1E0C99D48];
  v7 = a3;
  v8 = [v6 alloc];
  v9 = (void *)objc_msgSend(v8, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  -[ICSCalendar systemTimeZoneForDate:](self, "systemTimeZoneForDate:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v9, "setTimeZone:", v10);
  }
  else if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimeZone:", v11);

  }
  return v9;
}

- (id)systemDateForDate:(id)a3 options:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "components");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSCalendar systemTimeZoneForDate:](self, "systemTimeZoneForDate:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = 0;
    else
      v11 = (_DWORD)v4 == 1;
    if (v11)
      v12 = CFSTR("UTC");
    else
      v12 = (__CFString *)v10;
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "threadDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "objectForKey:", CFSTR("ICSCachedCalendars"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setValue:forKey:", v15, CFSTR("ICSCachedCalendars"));
    }
    objc_msgSend(v15, "objectForKey:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      -[ICSCalendar systemCalendarForDate:options:](self, "systemCalendarForDate:options:", v7, v4);
      v17 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v17;
      if (v12)
      {
        if (v17)
          objc_msgSend(v15, "setObject:forKey:", v17, v12);
      }
    }
    objc_msgSend(v16, "dateFromComponents:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)_addTimeZonesInComponent:(id)a3 toSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(v6, "components");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v8);
        -[ICSCalendar _addTimeZonesInComponent:toSet:](self, "_addTimeZonesInComponent:toSet:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i), v7);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v10);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v26 = v6;
  objc_msgSend(v6, "properties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v35;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(v14);
        v29 = v15;
        v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v15);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v31;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v31 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v22, "value");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & 1) != 0)
                {
                  objc_msgSend(v22, "tzid");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v25)
                    objc_msgSend(v7, "addObject:", v25);

                }
              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
          }
          while (v19);
        }

        v15 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v28);
  }

}

- (void)_addTimeZonesInComponent:(id)a3 toDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v6, "components");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(v8);
        -[ICSCalendar _addTimeZonesInComponent:toDictionary:](self, "_addTimeZonesInComponent:toDictionary:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i), v7);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v10);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v28 = v6;
  objc_msgSend(v6, "properties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v37;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v37 != v29)
          objc_enumerationMutation(v14);
        v31 = v15;
        v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v15);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v33;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v33 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v22, "value");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & 1) != 0)
                {
                  objc_msgSend(v22, "tzid");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v25)
                  {
                    objc_msgSend(v22, "value");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v7, "objectForKey:", v25);
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v27 || objc_msgSend(v26, "compare:", v27) == -1)
                      objc_msgSend(v7, "setObject:forKey:", v26, v25);

                  }
                }
              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
          }
          while (v19);
        }

        v15 = v31 + 1;
      }
      while (v31 + 1 != v30);
      v30 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v30);
  }

}

- (id)_timeZonesForComponents:(id)a3 options:(int)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  ICSDateTimeValue *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  ICSDateTimeValue *v22;
  ICSDateTimeValue *v23;
  void *v24;
  ICSTimeZone *v25;
  void *v27;
  void *v28;
  id v29;
  id obj;
  unsigned int v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  ICSDateTimeValue *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0C99D48]);
  v8 = (void *)objc_msgSend(v7, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:", 28, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ICSDateTimeValue initWithYear:month:day:hour:minute:second:]([ICSDateTimeValue alloc], "initWithYear:month:day:hour:minute:second:", objc_msgSend(v10, "year"), objc_msgSend(v10, "month"), objc_msgSend(v10, "day"), 0, 0, 0);
  v31 = a4;
  if ((a4 - 1) <= 1)
  {
    v27 = v10;
    v28 = v8;
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v29 = v6;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v42 != v16)
            objc_enumerationMutation(v13);
          -[ICSCalendar _addTimeZonesInComponent:toDictionary:](self, "_addTimeZonesInComponent:toDictionary:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i), v12, v27, v28);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v15);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v12, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v36)
    {
      if (v31 == 1)
        v18 = 0;
      else
        v18 = -1;
      v33 = v18;
      v34 = *(_QWORD *)v38;
      v35 = v11;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v38 != v34)
            objc_enumerationMutation(obj);
          v20 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
          objc_msgSend(v12, "objectForKey:", v20, v27, v28);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[ICSDateValue compare:](v11, "compare:", v21) == -1)
          {
            v22 = v11;

            v21 = v22;
          }
          v23 = -[ICSDateTimeValue initWithYear:month:day:hour:minute:second:]([ICSDateTimeValue alloc], "initWithYear:month:day:hour:minute:second:", objc_msgSend(v21, "year") + v33, objc_msgSend(v21, "month"), objc_msgSend(v21, "day"), objc_msgSend(v21, "hour"), objc_msgSend(v21, "minute"), objc_msgSend(v21, "second"));
          objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v20);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            v25 = -[ICSTimeZone initWithSystemTimeZone:fromDate:options:]([ICSTimeZone alloc], "initWithSystemTimeZone:fromDate:options:", v24, v23, v31);
            objc_msgSend(v32, "addObject:", v25);

          }
          v11 = v35;
        }
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v36);
    }

    v8 = v28;
    v6 = v29;
    v10 = v27;
  }

  return v32;
}

- (void)_addComponent:(id)a3 withUIDGenerator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  objc_msgSend(v16, "propertiesForName:", CFSTR("UID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
    if (v9)
      goto LABEL_11;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if (v9)
      goto LABEL_11;
  }
  if ((isKindOfClass & 1) != 0)
  {
    if (v6)
      objc_msgSend(v6, "generateUID");
    else
      +[ICSComponent makeUID](ICSComponent, "makeUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUid:", v9);
  }
LABEL_11:
  if (!v9)
    goto LABEL_20;
  -[NSMutableSet addObject:](self->_keys, "addObject:", v9);
  objc_msgSend(v16, "propertiesForName:", CFSTR("RECURRENCE-ID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NSMutableDictionary objectForKey:](self->_occurrences, "objectForKey:", v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[NSMutableDictionary setObject:forKey:](self->_occurrences, "setObject:forKey:", v12, v9);
    }
    objc_msgSend(v12, "addObject:", v16);

  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_masters, "objectForKey:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if ((isKindOfClass & 1) == 0)
        goto LABEL_20;
      NSLog(CFSTR("Duplicate UID: %@"), v9);
    }
    -[NSMutableDictionary setObject:forKey:](self->_masters, "setObject:forKey:", v16, v9);
  }
LABEL_20:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v16, "tzid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[NSMutableDictionary objectForKey:](self->_timezones, "objectForKey:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        NSLog(CFSTR("Duplicate TZID: %@"), v14);
      -[NSMutableDictionary setObject:forKey:](self->_timezones, "setObject:forKey:", v16, v14);
    }

  }
}

- (id)componentKeys
{
  return (id)-[NSMutableSet allObjects](self->_keys, "allObjects");
}

- (id)componentForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_masters, "objectForKey:", a3);
}

- (id)componentOccurrencesForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_occurrences, "objectForKey:", a3);
}

- (void)setComponents:(id)a3 timeZones:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    v4 = 2;
  else
    v4 = 0;
  -[ICSCalendar setComponents:options:](self, "setComponents:options:", a3, v4);
}

- (void)setComponents:(id)a3 options:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = *(_QWORD *)&a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v4)
  {
    -[ICSCalendar _timeZonesForComponents:options:](self, "_timeZonesForComponents:options:", v6, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v8);

  }
  objc_msgSend(v7, "addObjectsFromArray:", v6);
  v18.receiver = self;
  v18.super_class = (Class)ICSCalendar;
  -[ICSComponent setComponents:](&v18, sel_setComponents_, v7);
  -[NSMutableSet removeAllObjects](self->_keys, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_masters, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_occurrences, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_timezones, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_parsingErrors, "removeAllObjects");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[ICSCalendar _addComponent:withUIDGenerator:](self, "_addComponent:withUIDGenerator:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), 0, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v11);
  }

}

- (void)setComponents:(id)a3
{
  -[ICSCalendar setComponents:options:](self, "setComponents:options:", a3, 0);
}

- (void)addComponent:(id)a3 withUIDGenerator:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICSCalendar;
  v6 = a4;
  v7 = a3;
  -[ICSComponent addComponent:withUIDGenerator:](&v8, sel_addComponent_withUIDGenerator_, v7, v6);
  -[ICSCalendar _addComponent:withUIDGenerator:](self, "_addComponent:withUIDGenerator:", v7, v6, v8.receiver, v8.super_class);

}

- (id)timeZoneForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_timezones, "objectForKey:", a3);
}

- (void)addParsingError:(id)a3
{
  -[NSMutableArray addObject:](self->_parsingErrors, "addObject:", a3);
}

- (id)parsingErrors
{
  return (id)-[NSMutableArray copy](self->_parsingErrors, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsingErrors, 0);
  objc_storeStrong((id *)&self->_timezones, 0);
  objc_storeStrong((id *)&self->_occurrences, 0);
  objc_storeStrong((id *)&self->_masters, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

- (id)_init
{
  return -[ICSCalendar _initWithVersionAndProdID:](self, "_initWithVersionAndProdID:", 0);
}

- (void)fixPropertiesInheritance
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[ICSCalendar componentKeys](self, "componentKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[ICSCalendar componentForKey:](self, "componentForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICSCalendar componentOccurrencesForKey:](self, "componentOccurrencesForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v16;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v16 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * j), "fixPropertiesInheritance:", v9);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v12);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

}

- (void)fixComponent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("METHOD"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("METHOD"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("METHOD"));
  }
}

- (void)fixEntities
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[ICSCalendar fixComponent](self, "fixComponent");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[ICSComponent components](self, "components", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "fixComponent");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

@end
