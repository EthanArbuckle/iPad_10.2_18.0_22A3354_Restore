@implementation PKYearStringFromDate

uint64_t __PKYearStringFromDate_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ECF21EF0;
  qword_1ECF21EF0 = (uint64_t)v0;

  objc_msgSend((id)qword_1ECF21EF0, "setLocalizedDateFormatFromTemplate:", CFSTR("yyyy"));
  return objc_msgSend((id)qword_1ECF21EF0, "setFormattingContext:", 2);
}

@end
