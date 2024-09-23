@implementation PKMediumDayLongMonthAndTimeStringFromDate

uint64_t __PKMediumDayLongMonthAndTimeStringFromDate_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ECF21F20;
  qword_1ECF21F20 = (uint64_t)v0;

  objc_msgSend((id)qword_1ECF21F20, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMdhmma"));
  return objc_msgSend((id)qword_1ECF21F20, "setFormattingContext:", 5);
}

@end
