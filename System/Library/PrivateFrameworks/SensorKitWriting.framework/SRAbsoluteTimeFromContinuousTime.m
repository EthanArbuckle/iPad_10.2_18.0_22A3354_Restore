@implementation SRAbsoluteTimeFromContinuousTime

uint64_t __SRAbsoluteTimeFromContinuousTime_block_invoke()
{
  uint64_t v0;
  uint64_t result;

  v0 = mach_continuous_time();
  _rtcStart = MEMORY[0x24954643C]();
  result = mach_continuous_time();
  _contStart = v0 + ((result - v0) >> 1);
  return result;
}

@end
