@implementation VCPerformOnFirstUnlock

uint64_t __VCPerformOnFirstUnlock_block_invoke(uint64_t a1, int token)
{
  notify_cancel(token);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
