@implementation SBSSetStatusBarShowsSyncActivity

uint64_t __SBSSetStatusBarShowsSyncActivity_block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = SBSSpringBoardServerPort();
  return SBSetAllApplicationsShowSyncIndicator(v2, *(unsigned __int8 *)(a1 + 36), *(unsigned int *)(a1 + 32));
}

@end
