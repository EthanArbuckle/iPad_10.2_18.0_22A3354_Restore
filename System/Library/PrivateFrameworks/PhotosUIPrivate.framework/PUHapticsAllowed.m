@implementation PUHapticsAllowed

uint64_t __PUHapticsAllowed_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  PUHapticsAllowed_allowHaptics = result;
  return result;
}

@end
