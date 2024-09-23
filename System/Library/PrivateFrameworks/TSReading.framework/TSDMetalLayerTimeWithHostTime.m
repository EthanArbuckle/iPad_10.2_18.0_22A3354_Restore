@implementation TSDMetalLayerTimeWithHostTime

double __TSDMetalLayerTimeWithHostTime_block_invoke()
{
  double result;
  unint64_t v1;
  mach_timebase_info info;

  info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(result) = info.numer;
    LODWORD(v1) = info.denom;
    result = (double)*(unint64_t *)&result / (double)v1 * 0.000000001;
    __timeScale = *(_QWORD *)&result;
  }
  return result;
}

@end
