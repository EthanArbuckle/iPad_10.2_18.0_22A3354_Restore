@implementation UIApplicationBackgroundTimeRemaining

uint64_t ___UIApplicationBackgroundTimeRemaining_block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = BKSProcessAssertionBackgroundTimeRemaining();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  return result;
}

@end
