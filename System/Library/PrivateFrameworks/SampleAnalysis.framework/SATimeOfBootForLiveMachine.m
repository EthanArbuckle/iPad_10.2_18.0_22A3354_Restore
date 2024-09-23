@implementation SATimeOfBootForLiveMachine

double __SATimeOfBootForLiveMachine_block_invoke()
{
  double v0;
  uint64_t v1;
  double result;

  v0 = (double)time(0);
  v1 = mach_continuous_time();
  result = v0 - ceil(SASecondsFromMachTimeUsingLiveTimebase(v1)) - *MEMORY[0x1E0C9ADF8];
  qword_1ED1DD8F0 = *(_QWORD *)&result;
  return result;
}

@end
