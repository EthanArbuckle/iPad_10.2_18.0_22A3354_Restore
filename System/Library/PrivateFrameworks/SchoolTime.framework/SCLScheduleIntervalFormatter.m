@implementation SCLScheduleIntervalFormatter

- (SCLScheduleIntervalFormatter)init
{
  SCLScheduleIntervalFormatter *v2;
  NSCalendar *v3;
  NSTimeZone *v4;
  uint64_t v5;
  NSLocale *locale;
  NSCalendar *referenceCalendar;
  NSCalendar *v8;
  NSTimeZone *referenceTimeZone;
  NSTimeZone *v10;
  NSDateFormatter *v11;
  NSDateFormatter *shortFormatter;
  NSDateFormatter *v13;
  NSDateIntervalFormatter *v14;
  void *v15;
  void *v16;
  NSDateIntervalFormatter *briefFormatter;
  NSDateIntervalFormatter *v18;
  uint64_t v19;
  NSBundle *bundle;
  NSString *table;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)SCLScheduleIntervalFormatter;
  v2 = -[SCLScheduleIntervalFormatter init](&v23, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
    v3 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
    v4 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setTimeZone:](v3, "setTimeZone:", v4);
    objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    v5 = objc_claimAutoreleasedReturnValue();
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v5;

    referenceCalendar = v2->_referenceCalendar;
    v2->_referenceCalendar = v3;
    v8 = v3;

    referenceTimeZone = v2->_referenceTimeZone;
    v2->_referenceTimeZone = v4;
    v10 = v4;

    v11 = -[SCLScheduleIntervalFormatter newDateFormatterWithLocale:](v2, "newDateFormatterWithLocale:", v2->_locale);
    -[NSDateFormatter setDateStyle:](v11, "setDateStyle:", 0);
    -[NSDateFormatter setTimeStyle:](v11, "setTimeStyle:", 1);
    shortFormatter = v2->_shortFormatter;
    v2->_shortFormatter = v11;
    v13 = v11;

    v14 = (NSDateIntervalFormatter *)objc_alloc_init(MEMORY[0x24BDD1510]);
    -[NSDateIntervalFormatter setLocale:](v14, "setLocale:", v2->_locale);
    -[SCLScheduleIntervalFormatter referenceCalendar](v2, "referenceCalendar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateIntervalFormatter setCalendar:](v14, "setCalendar:", v15);

    -[SCLScheduleIntervalFormatter referenceTimeZone](v2, "referenceTimeZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateIntervalFormatter setTimeZone:](v14, "setTimeZone:", v16);

    -[NSDateIntervalFormatter setDateStyle:](v14, "setDateStyle:", 0);
    -[NSDateIntervalFormatter setTimeStyle:](v14, "setTimeStyle:", 1);
    briefFormatter = v2->_briefFormatter;
    v2->_briefFormatter = v14;
    v18 = v14;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = objc_claimAutoreleasedReturnValue();
    bundle = v2->_bundle;
    v2->_bundle = (NSBundle *)v19;

    table = v2->_table;
    v2->_table = (NSString *)CFSTR("SchoolTimeFormatters");

  }
  return v2;
}

- (void)setLocale:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_locale, a3);
  v5 = a3;
  -[NSDateIntervalFormatter setLocale:](self->_briefFormatter, "setLocale:", v5);
  -[NSDateFormatter setLocale:](self->_shortFormatter, "setLocale:", v5);

}

- (id)newDateFormatterWithLocale:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BDD1500];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setLocale:", v5);

  -[SCLScheduleIntervalFormatter referenceCalendar](self, "referenceCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCalendar:", v7);

  -[SCLScheduleIntervalFormatter referenceTimeZone](self, "referenceTimeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeZone:", v8);

  return v6;
}

- (id)stringFromTimeInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCLScheduleIntervalFormatter stringFromTime:toTime:](self, "stringFromTime:toTime:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)stringFromTime:(id)a3 toTime:(id)a4
{
  void *v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = 0;
  if (a3 && a4)
  {
    v7 = a4;
    objc_msgSend(a3, "dateComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLScheduleIntervalFormatter referenceCalendar](self, "referenceCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateByAddingComponents:toDate:options:", v8, v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateByAddingComponents:toDate:options:", v9, v10, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "earlierDate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 == v12)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 16, 1, v13, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "earlierDate:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = 0;
      v13 = v15;
      if (v16 != v12)
      {
LABEL_8:

        return v4;
      }
    }
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v12, v13);
    -[SCLScheduleIntervalFormatter _stringForDateInterval:startComponents:endComponents:](self, "_stringForDateInterval:startComponents:endComponents:", v17, v8, v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  return v4;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SCLScheduleIntervalFormatter stringFromTimeInterval:](self, "stringFromTimeInterval:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_stringForDateInterval:(id)a3 startComponents:(id)a4 endComponents:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[SCLScheduleIntervalFormatter formattingStyle](self, "formattingStyle"))
  {
    if (-[SCLScheduleIntervalFormatter formattingStyle](self, "formattingStyle") == 1
      && !-[SCLScheduleIntervalFormatter coalescesAMPMSymbols](self, "coalescesAMPMSymbols")
      && !-[SCLScheduleIntervalFormatter prefersHoursOnly](self, "prefersHoursOnly"))
    {
      -[SCLScheduleIntervalFormatter shortFormatter](self, "shortFormatter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringFromDate:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "endDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringFromDate:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCLScheduleIntervalFormatter _shortIntervalStringWithStart:end:](self, "_shortIntervalStringWithStart:end:", v16, v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
    if (-[SCLScheduleIntervalFormatter formattingStyle](self, "formattingStyle") != 1
      || !-[SCLScheduleIntervalFormatter coalescesAMPMSymbols](self, "coalescesAMPMSymbols")
      && !-[SCLScheduleIntervalFormatter prefersHoursOnly](self, "prefersHoursOnly"))
    {
      v13 = 0;
      goto LABEL_13;
    }
    -[SCLScheduleIntervalFormatter locale](self, "locale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLScheduleIntervalFormatter _stringForCoalescedAMPMSymbolsWithDateInterval:locale:startTimeComponents:endTimeComponents:](self, "_stringForCoalescedAMPMSymbolsWithDateInterval:locale:startTimeComponents:endTimeComponents:", v8, v11, v9, v10);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SCLScheduleIntervalFormatter briefFormatter](self, "briefFormatter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromDateInterval:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;
LABEL_11:

LABEL_13:
  return v13;
}

- (id)_shortIntervalStringWithStart:(id)a3 end:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[SCLScheduleIntervalFormatter bundle](self, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLScheduleIntervalFormatter table](self, "table");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SCHEDULE_TIME_INTERVAL_SHORT_FORMAT"), &stru_24E29C4C8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@%@"), 0, v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_stringForCoalescedAMPMSymbolsWithDateInterval:(id)a3 locale:(id)a4 startTimeComponents:(id)a5 endTimeComponents:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  _BOOL4 v21;
  char v22;
  id v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;

  v10 = a4;
  v32 = a5;
  v34 = a6;
  v11 = a3;
  v12 = -[SCLScheduleIntervalFormatter newDateFormatterWithLocale:](self, "newDateFormatterWithLocale:", v10);
  objc_msgSend(v12, "setTimeStyle:", 1);
  objc_msgSend(v12, "setDateStyle:", 0);
  objc_msgSend(v12, "setFormattingContext:", 1);
  v13 = -[SCLScheduleIntervalFormatter newDateFormatterWithLocale:](self, "newDateFormatterWithLocale:", v10);
  objc_msgSend(v13, "setFormattingContext:", 1);
  objc_msgSend(v13, "setLocalizedDateFormatFromTemplate:", CFSTR("j"));
  objc_msgSend(v11, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[SCLScheduleIntervalFormatter newDateFormatterWithLocale:](self, "newDateFormatterWithLocale:", v10);
  objc_msgSend(v16, "setLocalizedDateFormatFromTemplate:", CFSTR("a"));
  objc_msgSend(v16, "stringFromDate:", v14);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringFromDate:", v15);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDD1500];
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1500], "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v18, "containsString:", CFSTR("H"), v32))
  {

LABEL_7:
    v21 = 0;
    v22 = 1;
    goto LABEL_8;
  }
  v20 = objc_msgSend(v18, "containsString:", CFSTR("k"));

  if ((v20 & 1) != 0)
    goto LABEL_7;
  if (objc_msgSend(v33, "minute"))
  {
    v22 = 0;
    v21 = 0;
  }
  else
  {
    v21 = -[SCLScheduleIntervalFormatter prefersHoursOnly](self, "prefersHoursOnly");
    v22 = 0;
  }
LABEL_8:
  if (objc_msgSend(v36, "isEqualToString:", v35)
    && -[SCLScheduleIntervalFormatter coalescesAMPMSymbols](self, "coalescesAMPMSymbols"))
  {
    v23 = -[SCLScheduleIntervalFormatter newDateFormatterWithLocale:](self, "newDateFormatterWithLocale:", v10);
    objc_msgSend(v23, "setFormattingContext:", 1);
    if (v21)
      v24 = CFSTR("J");
    else
      v24 = CFSTR("Jmm");
    objc_msgSend(v23, "setLocalizedDateFormatFromTemplate:", v24);
    objc_msgSend(v23, "stringFromDate:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v21)
      v26 = v13;
    else
      v26 = v12;
    objc_msgSend(v26, "stringFromDate:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = v12;
  if ((v22 & 1) == 0)
  {
    v28 = objc_msgSend(v34, "minute");
    v27 = v12;
    if (!v28)
    {
      if (-[SCLScheduleIntervalFormatter prefersHoursOnly](self, "prefersHoursOnly"))
        v27 = v13;
      else
        v27 = v12;
    }
  }
  objc_msgSend(v27, "stringFromDate:", v15);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLScheduleIntervalFormatter _shortIntervalStringWithStart:end:](self, "_shortIntervalStringWithStart:end:", v25, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (unint64_t)formattingStyle
{
  return self->_formattingStyle;
}

- (void)setFormattingStyle:(unint64_t)a3
{
  self->_formattingStyle = a3;
}

- (BOOL)coalescesAMPMSymbols
{
  return self->_coalescesAMPMSymbols;
}

- (void)setCoalescesAMPMSymbols:(BOOL)a3
{
  self->_coalescesAMPMSymbols = a3;
}

- (BOOL)prefersHoursOnly
{
  return self->_prefersHoursOnly;
}

- (void)setPrefersHoursOnly:(BOOL)a3
{
  self->_prefersHoursOnly = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSDateFormatter)shortFormatter
{
  return self->_shortFormatter;
}

- (void)setShortFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_shortFormatter, a3);
}

- (NSDateIntervalFormatter)briefFormatter
{
  return self->_briefFormatter;
}

- (void)setBriefFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_briefFormatter, a3);
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
}

- (NSString)table
{
  return self->_table;
}

- (void)setTable:(id)a3
{
  objc_storeStrong((id *)&self->_table, a3);
}

- (NSCalendar)referenceCalendar
{
  return self->_referenceCalendar;
}

- (void)setReferenceCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_referenceCalendar, a3);
}

- (NSTimeZone)referenceTimeZone
{
  return self->_referenceTimeZone;
}

- (void)setReferenceTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_referenceTimeZone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceTimeZone, 0);
  objc_storeStrong((id *)&self->_referenceCalendar, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_briefFormatter, 0);
  objc_storeStrong((id *)&self->_shortFormatter, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
