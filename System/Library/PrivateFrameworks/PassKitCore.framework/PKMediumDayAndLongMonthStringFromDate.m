@implementation PKMediumDayAndLongMonthStringFromDate

uint64_t __PKMediumDayAndLongMonthStringFromDate_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ECF21ED0;
  qword_1ECF21ED0 = (uint64_t)v0;

  objc_msgSend((id)qword_1ECF21ED0, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM d"));
  return objc_msgSend((id)qword_1ECF21ED0, "setFormattingContext:", 5);
}

@end
