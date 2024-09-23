@implementation PLEXIFDateFormatter

void __PLEXIFDateFormatter_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)PLEXIFDateFormatter__dateFormatter;
  PLEXIFDateFormatter__dateFormatter = (uint64_t)v0;

  objc_msgSend((id)PLEXIFDateFormatter__dateFormatter, "setTimeStyle:", 0);
  objc_msgSend((id)PLEXIFDateFormatter__dateFormatter, "setDateStyle:", 0);
  objc_msgSend((id)PLEXIFDateFormatter__dateFormatter, "setDateFormat:", CFSTR("yyyy:MM:dd HH:mm:ss"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)PLEXIFDateFormatter__dateFormatter, "setLocale:", v2);

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)PLEXIFDateFormatter__dateFormatter, "setCalendar:", v3);

}

@end
