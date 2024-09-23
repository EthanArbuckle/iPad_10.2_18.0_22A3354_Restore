@implementation WFIsInternalInstall

uint64_t __WFIsInternalInstall_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  WFIsInternalInstall___internalInstall = result;
  return result;
}

@end
