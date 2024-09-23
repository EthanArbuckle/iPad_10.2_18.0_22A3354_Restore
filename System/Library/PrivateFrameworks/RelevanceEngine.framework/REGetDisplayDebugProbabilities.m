@implementation REGetDisplayDebugProbabilities

uint64_t __REGetDisplayDebugProbabilities_block_invoke()
{
  uint64_t result;

  result = _REGetIsInternalBuild();
  _isInternalDevice_6 = result;
  return result;
}

@end
