@implementation QPTimingNanosecondsSinceAbsoluteTime

uint64_t __QPTimingNanosecondsSinceAbsoluteTime_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&QPTimingNanosecondsSinceAbsoluteTime_sTimebaseInfo);
}

@end
