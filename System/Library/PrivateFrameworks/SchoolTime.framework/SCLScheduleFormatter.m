@implementation SCLScheduleFormatter

- (SCLScheduleFormatter)init
{
  SCLScheduleFormatter *v2;
  uint64_t v3;
  NSLocale *locale;
  uint64_t v5;
  NSCalendar *calendar;
  SCLTimeIntervalsFormatter *v7;
  SCLTimeIntervalsFormatter *timeIntervalsFormatter;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCLScheduleFormatter;
  v2 = -[SCLScheduleFormatter init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    v3 = objc_claimAutoreleasedReturnValue();
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v3;

    objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
    v5 = objc_claimAutoreleasedReturnValue();
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v5;

    v7 = objc_alloc_init(SCLTimeIntervalsFormatter);
    timeIntervalsFormatter = v2->_timeIntervalsFormatter;
    v2->_timeIntervalsFormatter = v7;

    -[SCLScheduleFormatter _regenerateFormatters](v2, "_regenerateFormatters");
  }
  return v2;
}

- (void)setLocale:(id)a3
{
  NSLocale *v4;
  NSLocale *locale;

  v4 = (NSLocale *)a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    v4 = (NSLocale *)objc_claimAutoreleasedReturnValue();
  }
  locale = self->_locale;
  self->_locale = v4;

  -[SCLScheduleFormatter _regenerateFormatters](self, "_regenerateFormatters");
}

- (void)setCalendar:(id)a3
{
  id v4;
  NSCalendar *v5;
  NSCalendar *calendar;
  id v7;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v4;
  v5 = (NSCalendar *)objc_msgSend(v4, "copy");
  calendar = self->_calendar;
  self->_calendar = v5;

  -[SCLScheduleFormatter _regenerateFormatters](self, "_regenerateFormatters");
}

- (void)_regenerateFormatters
{
  void *v3;
  void *v4;
  NSDateFormatter *v5;
  NSDateFormatter *standaloneWeekdayFormatter;
  NSDateFormatter *v7;
  void *v8;
  NSDateIntervalFormatter *v9;
  NSDateIntervalFormatter *weekdayIntervalFormatter;
  NSDateIntervalFormatter *v11;
  void *v12;
  NSListFormatter *v13;
  NSListFormatter *listFormatter;
  NSListFormatter *v15;
  void *v16;
  SCLTimeIntervalsFormatter *timeIntervalsFormatter;
  void *v18;
  id v19;

  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLScheduleFormatter locale](self, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocale:", v4);

  objc_msgSend(v3, "setTimeZone:", v19);
  v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
  standaloneWeekdayFormatter = self->_standaloneWeekdayFormatter;
  self->_standaloneWeekdayFormatter = v5;

  -[NSDateFormatter setCalendar:](self->_standaloneWeekdayFormatter, "setCalendar:", v3);
  v7 = self->_standaloneWeekdayFormatter;
  -[SCLScheduleFormatter locale](self, "locale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setLocale:](v7, "setLocale:", v8);

  -[NSDateFormatter setTimeZone:](self->_standaloneWeekdayFormatter, "setTimeZone:", v19);
  -[NSDateFormatter setDateFormat:](self->_standaloneWeekdayFormatter, "setDateFormat:", CFSTR("ccc\a"));
  v9 = (NSDateIntervalFormatter *)objc_alloc_init(MEMORY[0x24BDD1510]);
  weekdayIntervalFormatter = self->_weekdayIntervalFormatter;
  self->_weekdayIntervalFormatter = v9;

  -[NSDateIntervalFormatter setTimeZone:](self->_weekdayIntervalFormatter, "setTimeZone:", v19);
  -[NSDateIntervalFormatter setCalendar:](self->_weekdayIntervalFormatter, "setCalendar:", v3);
  v11 = self->_weekdayIntervalFormatter;
  -[SCLScheduleFormatter locale](self, "locale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateIntervalFormatter setLocale:](v11, "setLocale:", v12);

  -[NSDateIntervalFormatter setDateTemplate:](self->_weekdayIntervalFormatter, "setDateTemplate:", CFSTR("ccc\a"));
  v13 = (NSListFormatter *)objc_alloc_init(MEMORY[0x24BDD1640]);
  listFormatter = self->_listFormatter;
  self->_listFormatter = v13;

  v15 = self->_listFormatter;
  -[SCLScheduleFormatter locale](self, "locale");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSListFormatter setLocale:](v15, "setLocale:", v16);

  timeIntervalsFormatter = self->_timeIntervalsFormatter;
  -[SCLScheduleFormatter locale](self, "locale");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLTimeIntervalsFormatter setLocale:](timeIntervalsFormatter, "setLocale:", v18);

}

- (id)stringFromSchedule:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v32;
  void *v33;
  id v34;
  id obj;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLScheduleFormatter formatterItemsForSchedule:](self, "formatterItemsForSchedule:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v6, "count") == 1
      && (objc_msgSend(v6, "firstObject"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "days"),
          v7,
          v8 == 127))
    {
      objc_msgSend(v6, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCLScheduleFormatter timeIntervalsFormatter](self, "timeIntervalsFormatter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPrefersHoursOnly:", 0);

      -[SCLScheduleFormatter timeIntervalsFormatter](self, "timeIntervalsFormatter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervals");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringFromTimeIntervals:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v36 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      -[SCLScheduleFormatter timeIntervalsFormatter](self, "timeIntervalsFormatter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPrefersHoursOnly:", 1);

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v15 = v6;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v16)
      {
        v17 = v16;
        v32 = v6;
        v33 = v5;
        v34 = v4;
        obj = v15;
        v18 = 0;
        v19 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v38 != v19)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            -[SCLScheduleFormatter stringForWeekdaysInItem:](self, "stringForWeekdaysInItem:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[SCLScheduleFormatter timeIntervalsFormatter](self, "timeIntervalsFormatter");
            v23 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "timeIntervals");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v23, "stringFromTimeIntervals:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "timeIntervals");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v23) = (unint64_t)objc_msgSend(v26, "count") > 2;

            v18 |= v23;
            -[SCLScheduleFormatter locale](self, "locale");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[SCLScheduleFormatter _formattedCustomDailyScheduleForLocale:](self, "_formattedCustomDailyScheduleForLocale:", v27, v22, v25);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v36, "addObject:", v28);
          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v17);

        if ((v18 & 1) != 0)
          v29 = CFSTR("CustomScheduleDetailTextSemicolonSeparator");
        else
          v29 = CFSTR("CustomScheduleDetailTextCommaSeparator");
        v5 = v33;
        v4 = v34;
        v6 = v32;
      }
      else
      {

        v29 = CFSTR("CustomScheduleDetailTextCommaSeparator");
      }
      objc_msgSend(v5, "localizedStringForKey:value:table:", v29, &stru_24E29C4C8, CFSTR("SchoolTimeFormatters"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v36;
      objc_msgSend(v36, "componentsJoinedByString:", v30);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ScheduleOff"), &stru_24E29C4C8, CFSTR("SchoolTimeFormatters"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)_formattedCustomDailyScheduleForLocale:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CustomDailyScheduleFormat"), &stru_24E29C4C8, CFSTR("SchoolTimeFormatters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[SCLScheduleFormatter locale](self, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:", v5, CFSTR("%@%@"), v7, &v10, 0);

  return v8;
}

- (id)stringForWeekdaysInItem:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = v4;
  objc_msgSend(v4, "dayRanges");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v9, "count") == 1)
        {
          -[NSDateFormatter calendar](self->_standaloneWeekdayFormatter, "calendar");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "firstObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "integerValue");

          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "nextDateAfterDate:matchingUnit:value:options:", v13, 512, v12, 1024);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDateFormatter stringFromDate:](self->_standaloneWeekdayFormatter, "stringFromDate:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v15);
        }
        else
        {
          -[NSDateIntervalFormatter calendar](self->_weekdayIntervalFormatter, "calendar");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "integerValue");

          objc_msgSend(v9, "lastObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "integerValue");

          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "nextDateAfterDate:matchingUnit:value:options:", v13, 512, v17, 1024);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "nextDateAfterDate:matchingUnit:value:options:", v14, 512, v19, 1024);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v14, v15);
          -[NSDateIntervalFormatter stringFromDateInterval:](self->_weekdayIntervalFormatter, "stringFromDateInterval:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v21);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v6);
  }

  -[SCLScheduleFormatter listFormatter](self, "listFormatter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringFromItems:", v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)formatterItemsForSchedule:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SCLScheduleFormatter *v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLScheduleFormatter calendar](self, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __50__SCLScheduleFormatter_formatterItemsForSchedule___block_invoke;
  v18[3] = &unk_24E29B818;
  v19 = v4;
  v20 = v5;
  v21 = self;
  v8 = v5;
  v9 = v4;
  objc_msgSend(v6, "SCL_enumerateWeekdaysUsingBlock:", v18);

  objc_msgSend(v8, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLScheduleFormatter calendar](self, "calendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "SCL_orderedWeekdays");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __50__SCLScheduleFormatter_formatterItemsForSchedule___block_invoke_2;
  v16[3] = &unk_24E29B840;
  v17 = v12;
  v13 = v12;
  objc_msgSend(v10, "sortedArrayUsingComparator:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __50__SCLScheduleFormatter_formatterItemsForSchedule___block_invoke(id *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  SCLScheduleFormatterItem *v6;
  SCLScheduleFormatterItem *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1[4], "timeIntervalsForDay:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v9, "count");
  v5 = v9;
  if (v4)
  {
    objc_msgSend(a1[5], "objectForKeyedSubscript:", v9);
    v6 = (SCLScheduleFormatterItem *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v7 = [SCLScheduleFormatterItem alloc];
      objc_msgSend(a1[6], "calendar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[SCLScheduleFormatterItem initWithCalendar:timeIntervals:](v7, "initWithCalendar:timeIntervals:", v8, v9);

      objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v6, v9);
    }
    -[SCLScheduleFormatterItem addDay:](v6, "addDay:", a2);

    v5 = v9;
  }

}

uint64_t __50__SCLScheduleFormatter_formatterItemsForSchedule___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v5 = a3;
  v6 = objc_msgSend(a2, "earliestWeekdayInCalendar");
  v7 = objc_msgSend(v5, "earliestWeekdayInCalendar");

  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "indexOfObject:", v9);

  v11 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "indexOfObject:", v12);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "compare:", v15);

  return v16;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (SCLTimeIntervalsFormatter)timeIntervalsFormatter
{
  return self->_timeIntervalsFormatter;
}

- (NSListFormatter)listFormatter
{
  return self->_listFormatter;
}

- (NSDateFormatter)standaloneWeekdayFormatter
{
  return self->_standaloneWeekdayFormatter;
}

- (NSDateIntervalFormatter)weekdayIntervalFormatter
{
  return self->_weekdayIntervalFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekdayIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_standaloneWeekdayFormatter, 0);
  objc_storeStrong((id *)&self->_listFormatter, 0);
  objc_storeStrong((id *)&self->_timeIntervalsFormatter, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
