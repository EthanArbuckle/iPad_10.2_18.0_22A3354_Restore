@implementation PKMediumDateString

uint64_t __PKMediumDateString_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ECF21E40;
  qword_1ECF21E40 = (uint64_t)v0;

  objc_msgSend((id)qword_1ECF21E40, "setDateStyle:", 2);
  return objc_msgSend((id)qword_1ECF21E40, "setTimeStyle:", 0);
}

@end
