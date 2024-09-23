@implementation PKCalendarUnitIntervalString

uint64_t __PKCalendarUnitIntervalString_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)qword_1ECF21F58;
  qword_1ECF21F58 = (uint64_t)v0;

  objc_msgSend((id)qword_1ECF21F58, "setUnitsStyle:", 3);
  objc_msgSend((id)qword_1ECF21F58, "setZeroFormattingBehavior:", 14);
  return objc_msgSend((id)qword_1ECF21F58, "setFormattingContext:", 5);
}

@end
