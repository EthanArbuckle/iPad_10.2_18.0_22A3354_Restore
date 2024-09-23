@implementation PREMachTimeToNanoseconds

uint64_t __PREMachTimeToNanoseconds_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&PREMachTimeToNanoseconds_machTimebaseInfo);
}

@end
