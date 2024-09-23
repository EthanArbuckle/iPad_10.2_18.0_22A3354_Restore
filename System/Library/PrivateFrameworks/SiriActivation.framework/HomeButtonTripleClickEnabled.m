@implementation HomeButtonTripleClickEnabled

uint64_t ___HomeButtonTripleClickEnabled_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAccessibilityState");
}

@end
