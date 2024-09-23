@implementation TVPPerformBlockOnMainThreadIfNeeded

uint64_t __TVPPerformBlockOnMainThreadIfNeeded_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
