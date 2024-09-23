@implementation MachTimebase

uint64_t __MachTimebase_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&MachTimebase_info);
}

@end
