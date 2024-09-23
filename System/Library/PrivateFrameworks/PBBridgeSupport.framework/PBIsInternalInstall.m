@implementation PBIsInternalInstall

uint64_t __PBIsInternalInstall_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  PBIsInternalInstall___internalInstall = result;
  return result;
}

@end
