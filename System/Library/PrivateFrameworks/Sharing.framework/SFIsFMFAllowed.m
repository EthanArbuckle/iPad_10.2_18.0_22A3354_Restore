@implementation SFIsFMFAllowed

uint64_t __SFIsFMFAllowed_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  SFIsFMFAllowed_isFMFAllowed = result;
  return result;
}

@end
