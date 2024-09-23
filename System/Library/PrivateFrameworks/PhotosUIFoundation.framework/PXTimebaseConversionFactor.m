@implementation PXTimebaseConversionFactor

double __PXTimebaseConversionFactor_block_invoke()
{
  double result;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  result = (float)((float)((float)info.numer * 0.000000001) / (float)info.denom);
  *(double *)&PXTimebaseConversionFactor_timebaseConversion = result;
  return result;
}

@end
