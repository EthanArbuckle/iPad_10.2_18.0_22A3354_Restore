@implementation PKOrdinalStringForInteger

uint64_t __PKOrdinalStringForInteger_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)qword_1ECF21CF8;
  qword_1ECF21CF8 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ECF21CF8, "setNumberStyle:", 6);
}

@end
