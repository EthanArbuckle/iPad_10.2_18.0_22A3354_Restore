@implementation NSDate(NotesDateUtilities)

- (id)userFriendlyStringWithTime
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  if (!__notesDisplayDateFormatterWithYear)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = (void *)__notesDisplayDateFormatterWithYear;
    __notesDisplayDateFormatterWithYear = (uint64_t)v3;

    objc_msgSend((id)__notesDisplayDateFormatterWithYear, "setLocale:", v2);
    objc_msgSend((id)__notesDisplayDateFormatterWithYear, "setDateStyle:", 0);
    objc_msgSend((id)__notesDisplayDateFormatterWithYear, "setTimeStyle:", 0);
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("MMMMdyjmm"), 0, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend((id)__notesDisplayDateFormatterWithYear, "setDateFormat:", v5);

  }
  v6 = a1;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v9;
  }
  objc_msgSend((id)__notesDisplayDateFormatterWithYear, "stringFromDate:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_notes_todayDateFormatter
{
  if (_notes_todayDateFormatter_onceToken != -1)
    dispatch_once(&_notes_todayDateFormatter_onceToken, &__block_literal_global_73);
  return (id)__notesTodayDateFormatter;
}

+ (id)_notes_relativeDateFormatter
{
  if (_notes_relativeDateFormatter_onceToken != -1)
    dispatch_once(&_notes_relativeDateFormatter_onceToken, &__block_literal_global_4);
  return (id)__notesRelativeDateFormatter;
}

+ (id)_notes_fallbackDateFormatter
{
  if (_notes_fallbackDateFormatter_onceToken != -1)
    dispatch_once(&_notes_fallbackDateFormatter_onceToken, &__block_literal_global_7);
  return (id)__notesFallbackFormatter;
}

- (id)userFriendlyString
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _calendar();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)__Today;
  if (!__Today)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _dateForDay(v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)__Today;
    __Today = v5;

    v3 = (void *)__Today;
  }
  v7 = v3;
  objc_msgSend(v2, "dateByAddingUnit:value:toDate:options:", 16, -1, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingUnit:value:toDate:options:", 0x2000, -1, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "compare:", v7);

  if (v10 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "_notes_todayDateFormatter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(a1, "compare:", v8) == 1 || objc_msgSend(a1, "compare:", v9) != 1)
      goto LABEL_9;
    objc_msgSend(MEMORY[0x1E0C99D68], "_notes_relativeDateFormatter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  objc_msgSend(v11, "stringFromDate:", a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0C99D68], "_notes_fallbackDateFormatter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringFromDate:", a1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

@end
