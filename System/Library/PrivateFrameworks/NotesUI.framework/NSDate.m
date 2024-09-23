@implementation NSDate

uint64_t __55__NSDate_NotesDateUtilities___notes_todayDateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)__notesTodayDateFormatter;
  __notesTodayDateFormatter = (uint64_t)v0;

  return objc_msgSend((id)__notesTodayDateFormatter, "setTimeStyle:", 1);
}

void __58__NSDate_NotesDateUtilities___notes_relativeDateFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)__notesRelativeDateFormatter;
  __notesRelativeDateFormatter = (uint64_t)v0;

  v2 = (void *)__notesRelativeDateFormatter;
  v3 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFormatFromTemplate:options:locale:", CFSTR("cccc"), 0, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDateFormat:", v4);

}

uint64_t __58__NSDate_NotesDateUtilities___notes_fallbackDateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)__notesFallbackFormatter;
  __notesFallbackFormatter = (uint64_t)v0;

  objc_msgSend((id)__notesFallbackFormatter, "setDoesRelativeDateFormatting:", 1);
  return objc_msgSend((id)__notesFallbackFormatter, "setDateStyle:", 1);
}

@end
