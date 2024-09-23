@implementation PKRFC1123StringForDate

void __PKRFC1123StringForDate_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ECF21F68;
  qword_1ECF21F68 = (uint64_t)v0;

  v2 = (void *)qword_1ECF21F68;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend((id)qword_1ECF21F68, "setDateFormat:", CFSTR("EEE, dd MMM yyyy HH:mm:ss zzz"));
  v4 = (void *)qword_1ECF21F68;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

}

@end
