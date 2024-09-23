@implementation TIGetMachTimeScale

double ___TIGetMachTimeScale_block_invoke()
{
  unint64_t v0;
  unint64_t v1;
  double result;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  result = (double)v0 / (double)v1 / 1000000000.0;
  _TIGetMachTimeScale_scale = *(_QWORD *)&result;
  return result;
}

@end
