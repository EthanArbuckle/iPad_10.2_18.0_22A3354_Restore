@implementation PKW3CDateStringFromDate

uint64_t __PKW3CDateStringFromDate_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ECF21E70;
  qword_1ECF21E70 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ECF21E70, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mmZZZZZ"));
}

@end
