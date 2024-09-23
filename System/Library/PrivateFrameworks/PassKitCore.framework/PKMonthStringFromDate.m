@implementation PKMonthStringFromDate

uint64_t __PKMonthStringFromDate_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ECF21F00;
  qword_1ECF21F00 = (uint64_t)v0;

  objc_msgSend((id)qword_1ECF21F00, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM"));
  return objc_msgSend((id)qword_1ECF21F00, "setFormattingContext:", 2);
}

@end
