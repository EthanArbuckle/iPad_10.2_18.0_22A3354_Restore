@implementation PKLongDateString

uint64_t __PKLongDateString_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ECF21E50;
  qword_1ECF21E50 = (uint64_t)v0;

  objc_msgSend((id)qword_1ECF21E50, "setDateStyle:", 3);
  return objc_msgSend((id)qword_1ECF21E50, "setTimeStyle:", 0);
}

@end
