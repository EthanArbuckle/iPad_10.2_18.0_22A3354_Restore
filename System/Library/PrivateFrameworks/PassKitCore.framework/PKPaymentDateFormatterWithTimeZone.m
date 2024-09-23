@implementation PKPaymentDateFormatterWithTimeZone

uint64_t __PKPaymentDateFormatterWithTimeZone_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ECF21FD8;
  qword_1ECF21FD8 = (uint64_t)v0;

  v2 = (void *)qword_1ECF21FD8;
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCalendar:", v3);

  v4 = (void *)qword_1ECF21FD8;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

  return objc_msgSend((id)qword_1ECF21FD8, "setDateFormat:", CFSTR("yyyy-MM-dd"));
}

@end
