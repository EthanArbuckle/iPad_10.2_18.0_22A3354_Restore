@implementation HKSPIsHomePod

uint64_t __HKSPIsHomePod_block_invoke()
{
  uint64_t result;

  result = MGGetProductType();
  if (result == 4240173202 || result == 2702125347)
    _MergedGlobals_8 = 1;
  return result;
}

@end
