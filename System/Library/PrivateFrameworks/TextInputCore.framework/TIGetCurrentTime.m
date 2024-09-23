@implementation TIGetCurrentTime

double __TIGetCurrentTime_block_invoke()
{
  double result;
  unint64_t v1;
  mach_timebase_info info;

  if (!mach_timebase_info(&info))
  {
    LODWORD(result) = info.numer;
    LODWORD(v1) = info.denom;
    result = (double)*(unint64_t *)&result / (double)v1 * 0.000000001;
    TIGetCurrentTime::time_scale = *(_QWORD *)&result;
  }
  return result;
}

@end
