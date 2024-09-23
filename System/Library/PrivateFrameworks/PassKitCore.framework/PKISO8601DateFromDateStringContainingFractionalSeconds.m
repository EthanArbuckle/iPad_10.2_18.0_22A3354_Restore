@implementation PKISO8601DateFromDateStringContainingFractionalSeconds

uint64_t __PKISO8601DateFromDateStringContainingFractionalSeconds_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v1 = (void *)qword_1ECF21E80;
  qword_1ECF21E80 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ECF21E80, "setFormatOptions:", 3955);
}

@end
