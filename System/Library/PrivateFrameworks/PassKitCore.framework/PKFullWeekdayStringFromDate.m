@implementation PKFullWeekdayStringFromDate

uint64_t __PKFullWeekdayStringFromDate_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ECF21F10;
  qword_1ECF21F10 = (uint64_t)v0;

  objc_msgSend((id)qword_1ECF21F10, "setLocalizedDateFormatFromTemplate:", CFSTR("EEEE"));
  return objc_msgSend((id)qword_1ECF21F10, "setFormattingContext:", 2);
}

@end
