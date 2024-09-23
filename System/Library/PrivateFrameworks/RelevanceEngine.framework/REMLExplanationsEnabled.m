@implementation REMLExplanationsEnabled

uint64_t __REMLExplanationsEnabled_block_invoke()
{
  uint64_t result;

  result = _REGetIsInternalBuild();
  _isInternalDevice_11 = result;
  return result;
}

@end
