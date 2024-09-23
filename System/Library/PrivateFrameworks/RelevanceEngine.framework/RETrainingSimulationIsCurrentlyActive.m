@implementation RETrainingSimulationIsCurrentlyActive

uint64_t __RETrainingSimulationIsCurrentlyActive_block_invoke()
{
  uint64_t result;

  result = _REGetIsInternalBuild();
  _isInternalDevice_1 = result;
  return result;
}

@end
