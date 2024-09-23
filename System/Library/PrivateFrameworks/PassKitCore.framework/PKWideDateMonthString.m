@implementation PKWideDateMonthString

uint64_t __PKWideDateMonthString_block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)qword_1ECF21E60;
  qword_1ECF21E60 = (uint64_t)v2;

  objc_msgSend((id)qword_1ECF21E60, "setLocalizedDateFormatFromTemplate:", CFSTR("EEEE, MMMM d"));
  objc_msgSend((id)qword_1ECF21E60, "setFormattingContext:", 2);
  return objc_msgSend((id)qword_1ECF21E60, "setTimeZone:", *(_QWORD *)(a1 + 32));
}

@end
