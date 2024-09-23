@implementation FormatedDateString

uint64_t ___FormatedDateString_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_FormatedDateString_dateFormatter;
  _FormatedDateString_dateFormatter = (uint64_t)v0;

  objc_msgSend((id)_FormatedDateString_dateFormatter, "setDateStyle:", 2);
  return objc_msgSend((id)_FormatedDateString_dateFormatter, "setTimeStyle:", 0);
}

@end
