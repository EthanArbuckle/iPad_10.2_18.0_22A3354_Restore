@implementation REGetIsInternalBuild

uint64_t ___REGetIsInternalBuild_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _REGetIsInternalBuild_internal = result;
  return result;
}

@end
