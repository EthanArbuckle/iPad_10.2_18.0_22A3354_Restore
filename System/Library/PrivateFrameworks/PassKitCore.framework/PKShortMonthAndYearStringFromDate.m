@implementation PKShortMonthAndYearStringFromDate

uint64_t __PKShortMonthAndYearStringFromDate_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ECF21EB0;
  qword_1ECF21EB0 = (uint64_t)v0;

  objc_msgSend((id)qword_1ECF21EB0, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM yyyy"));
  return objc_msgSend((id)qword_1ECF21EB0, "setFormattingContext:", 2);
}

@end
