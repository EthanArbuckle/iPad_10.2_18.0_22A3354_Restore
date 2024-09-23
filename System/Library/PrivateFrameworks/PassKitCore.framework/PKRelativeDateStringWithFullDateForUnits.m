@implementation PKRelativeDateStringWithFullDateForUnits

uint64_t __PKRelativeDateStringWithFullDateForUnits_block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = objc_alloc_init(MEMORY[0x1E0CB38F0]);
  v1 = (void *)qword_1ECF21F48;
  qword_1ECF21F48 = (uint64_t)v0;

  objc_msgSend((id)qword_1ECF21F48, "setDateTimeStyle:", 1);
  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)qword_1ECF21F50;
  qword_1ECF21F50 = (uint64_t)v2;

  v4 = (void *)qword_1ECF21F50;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

  return objc_msgSend((id)qword_1ECF21F50, "setLocalizedDateFormatFromTemplate:", CFSTR("cccc"));
}

@end
