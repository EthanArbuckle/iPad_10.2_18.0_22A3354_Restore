@implementation NSDate

void __41__NSDate_Monotonic__defaultDateFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)defaultDateFormatter_f;
  defaultDateFormatter_f = (uint64_t)v0;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend((id)defaultDateFormatter_f, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)defaultDateFormatter_f, "setTimeZone:", v2);

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C99790]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)defaultDateFormatter_f, "setCalendar:", v3);

  objc_msgSend((id)defaultDateFormatter_f, "setLocale:", v4);
}

@end
