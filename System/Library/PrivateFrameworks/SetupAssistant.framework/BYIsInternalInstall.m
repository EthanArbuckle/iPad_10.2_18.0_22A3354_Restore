@implementation BYIsInternalInstall

uint64_t ___BYIsInternalInstall_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _BYIsInternalInstall_internal = result;
  return result;
}

@end
