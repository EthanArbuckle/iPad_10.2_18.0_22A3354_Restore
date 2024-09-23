@implementation WRMachTimebaseForLiveMachine

uint64_t __WRMachTimebaseForLiveMachine_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&WRMachTimebaseForLiveMachine_timebase);
}

@end
