@implementation SBPPTPerformAfterCommitWithDelay

void __SBPPTPerformAfterCommitWithDelay_block_invoke(uint64_t a1)
{
  dispatch_time_t v2;

  v2 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
  dispatch_after(v2, MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

@end
