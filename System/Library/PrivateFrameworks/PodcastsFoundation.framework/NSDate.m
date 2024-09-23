@implementation NSDate

void __56__NSDate_MTAdditions__mt_dateFormatterNoYearAbbrevMonth__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dateFormatFromTemplate:options:locale:", CFSTR("MMM d"), 0, v1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)mt_dateFormatterNoYearAbbrevMonth__s__dateFormatterNoYearAbbrevMonth;
  mt_dateFormatterNoYearAbbrevMonth__s__dateFormatterNoYearAbbrevMonth = (uint64_t)v2;

  objc_msgSend((id)mt_dateFormatterNoYearAbbrevMonth__s__dateFormatterNoYearAbbrevMonth, "setDateFormat:", v6);
  v4 = (void *)mt_dateFormatterNoYearAbbrevMonth__s__dateFormatterNoYearAbbrevMonth;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

}

void __46__NSDate_MTAdditions__mt_verboseDateFormatter__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dateFormatFromTemplate:options:locale:", CFSTR("MMMM d, yyyy"), 0, v1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)mt_verboseDateFormatter__s__dateFormatterWithYear;
  mt_verboseDateFormatter__s__dateFormatterWithYear = (uint64_t)v2;

  objc_msgSend((id)mt_verboseDateFormatter__s__dateFormatterWithYear, "setDateFormat:", v6);
  v4 = (void *)mt_verboseDateFormatter__s__dateFormatterWithYear;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

}

void __53__NSDate_MTAdditions__dayOfWeekFromDate_abbreviated___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)dayOfWeekFromDate_abbreviated__formatterAbbrev;
  dayOfWeekFromDate_abbreviated__formatterAbbrev = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)dayOfWeekFromDate_abbreviated__formatterAbbrev, "setLocale:", v2);

  v3 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFormatFromTemplate:options:locale:", CFSTR("EEE"), 0, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)dayOfWeekFromDate_abbreviated__formatterAbbrev, "setDateFormat:", v4);

}

void __53__NSDate_MTAdditions__dayOfWeekFromDate_abbreviated___block_invoke_2()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)dayOfWeekFromDate_abbreviated__formatterVerbose;
  dayOfWeekFromDate_abbreviated__formatterVerbose = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)dayOfWeekFromDate_abbreviated__formatterVerbose, "setLocale:", v2);

  v3 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFormatFromTemplate:options:locale:", CFSTR("EEEE"), 0, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)dayOfWeekFromDate_abbreviated__formatterVerbose, "setDateFormat:", v4);

}

uint64_t __33__NSDate_MTAdditions__timeString__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)timeString_fmt;
  timeString_fmt = (uint64_t)v0;

  objc_msgSend((id)timeString_fmt, "setDateStyle:", 0);
  return objc_msgSend((id)timeString_fmt, "setTimeStyle:", 1);
}

void __50__NSDate_MTAdditions__mt_dateFormatterRelativeDay__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)mt_dateFormatterRelativeDay__s__dateFormatterRelativeDay;
  mt_dateFormatterRelativeDay__s__dateFormatterRelativeDay = (uint64_t)v0;

  objc_msgSend((id)mt_dateFormatterRelativeDay__s__dateFormatterRelativeDay, "setDoesRelativeDateFormatting:", 1);
  objc_msgSend((id)mt_dateFormatterRelativeDay__s__dateFormatterRelativeDay, "setDateStyle:", 2);
  objc_msgSend((id)mt_dateFormatterRelativeDay__s__dateFormatterRelativeDay, "setFormattingContext:", 4);
  v2 = (void *)mt_dateFormatterRelativeDay__s__dateFormatterRelativeDay;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

}

void __47__NSDate_MTAdditions__mt_dateFormatterWithYear__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dateFormatFromTemplate:options:locale:", CFSTR("MMM d, yyyy"), 0, v1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)mt_dateFormatterWithYear__s__dateFormatterWithYear;
  mt_dateFormatterWithYear__s__dateFormatterWithYear = (uint64_t)v2;

  objc_msgSend((id)mt_dateFormatterWithYear__s__dateFormatterWithYear, "setDateFormat:", v6);
  v4 = (void *)mt_dateFormatterWithYear__s__dateFormatterWithYear;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

}

void __47__NSDate_MTAdditions__mt_dateFormatterJustYear__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dateFormatFromTemplate:options:locale:", CFSTR("yyyy"), 0, v1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)mt_dateFormatterJustYear_justYearFormatter;
  mt_dateFormatterJustYear_justYearFormatter = (uint64_t)v2;

  objc_msgSend((id)mt_dateFormatterJustYear_justYearFormatter, "setDateFormat:", v6);
  v4 = (void *)mt_dateFormatterJustYear_justYearFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

}

void __52__NSDate_MTAdditions__mt_dateFormatterNoDayWithYear__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dateFormatFromTemplate:options:locale:", CFSTR("MMM yyyy"), 0, v1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)mt_dateFormatterNoDayWithYear__s__dateFormatterNoDayWithYear;
  mt_dateFormatterNoDayWithYear__s__dateFormatterNoDayWithYear = (uint64_t)v2;

  objc_msgSend((id)mt_dateFormatterNoDayWithYear__s__dateFormatterNoDayWithYear, "setDateFormat:", v6);
  v4 = (void *)mt_dateFormatterNoDayWithYear__s__dateFormatterNoDayWithYear;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

}

void __57__NSDate_MTAdditions__mt_dateFormatterShortStyleWithYear__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)mt_dateFormatterShortStyleWithYear_dateFormatter;
  mt_dateFormatterShortStyleWithYear_dateFormatter = (uint64_t)v0;

  objc_msgSend((id)mt_dateFormatterShortStyleWithYear_dateFormatter, "setDateStyle:", 1);
  objc_msgSend((id)mt_dateFormatterShortStyleWithYear_dateFormatter, "setTimeStyle:", 0);
  v2 = (void *)mt_dateFormatterShortStyleWithYear_dateFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

}

void __45__NSDate_MTAdditions__mt_dateFormatterNoYear__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dateFormatFromTemplate:options:locale:", CFSTR("MMMM d"), 0, v1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)mt_dateFormatterNoYear__s__dateFormatterNoYear;
  mt_dateFormatterNoYear__s__dateFormatterNoYear = (uint64_t)v2;

  objc_msgSend((id)mt_dateFormatterNoYear__s__dateFormatterNoYear, "setDateFormat:", v6);
  v4 = (void *)mt_dateFormatterNoYear__s__dateFormatterNoYear;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

}

void __50__NSDate_MTAdditions__mt_lessVerboseDateFormatter__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dateFormatFromTemplate:options:locale:", CFSTR("MMM d, yyyy"), 0, v1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)mt_lessVerboseDateFormatter__s__dateFormatterWithYear;
  mt_lessVerboseDateFormatter__s__dateFormatterWithYear = (uint64_t)v2;

  objc_msgSend((id)mt_lessVerboseDateFormatter__s__dateFormatterWithYear, "setDateFormat:", v6);
  v4 = (void *)mt_lessVerboseDateFormatter__s__dateFormatterWithYear;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

}

@end
