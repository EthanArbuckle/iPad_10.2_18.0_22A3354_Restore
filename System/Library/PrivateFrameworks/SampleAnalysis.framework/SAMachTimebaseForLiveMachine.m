@implementation SAMachTimebaseForLiveMachine

uint64_t __SAMachTimebaseForLiveMachine_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&qword_1ED1DD908);
}

@end
