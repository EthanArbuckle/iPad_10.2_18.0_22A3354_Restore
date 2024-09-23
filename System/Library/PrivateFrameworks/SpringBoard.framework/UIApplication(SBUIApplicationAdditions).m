@implementation UIApplication(SBUIApplicationAdditions)

- (uint64_t)sb_performBlockAfterCATransactionSynchronizedCommit:()SBUIApplicationAdditions
{
  return objc_msgSend(MEMORY[0x1E0CD28B0], "bs_performAfterSynchronizedCommit:");
}

@end
