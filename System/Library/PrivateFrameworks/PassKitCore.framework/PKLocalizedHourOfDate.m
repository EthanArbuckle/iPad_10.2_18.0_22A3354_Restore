@implementation PKLocalizedHourOfDate

uint64_t __PKLocalizedHourOfDate_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)qword_1ECF21E38;
  qword_1ECF21E38 = (uint64_t)v0;

  v2 = (void *)qword_1ECF21E38;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  return objc_msgSend((id)qword_1ECF21E38, "setNumberStyle:", 0);
}

@end
