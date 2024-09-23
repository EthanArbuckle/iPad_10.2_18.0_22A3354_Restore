@implementation SIIsAppleInternal

uint64_t __SIIsAppleInternal_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  SIIsAppleInternal_internal = result;
  return result;
}

@end
