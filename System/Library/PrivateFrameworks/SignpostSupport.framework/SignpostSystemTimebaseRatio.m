@implementation SignpostSystemTimebaseRatio

uint64_t __SignpostSystemTimebaseRatio_block_invoke()
{
  uint64_t result;
  double v1;
  mach_timebase_info info;

  info = 0;
  result = mach_timebase_info(&info);
  v1 = 1.0;
  if (info.numer != info.denom)
    v1 = (double)info.numer / (double)info.denom;
  SignpostSystemTimebaseRatio_timebaseRatio = *(_QWORD *)&v1;
  return result;
}

@end
