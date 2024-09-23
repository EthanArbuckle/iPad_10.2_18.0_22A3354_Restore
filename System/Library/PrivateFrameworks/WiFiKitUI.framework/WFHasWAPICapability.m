@implementation WFHasWAPICapability

uint64_t __WFHasWAPICapability_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  WFHasWAPICapability___wapiCapability = result;
  return result;
}

uint64_t __WFHasWAPICapability_block_invoke_0()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  WFHasWAPICapability___wapiCapability_0 = result;
  return result;
}

@end
