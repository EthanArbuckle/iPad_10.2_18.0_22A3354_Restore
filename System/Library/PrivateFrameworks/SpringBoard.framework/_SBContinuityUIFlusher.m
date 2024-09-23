@implementation _SBContinuityUIFlusher

- (void)flushUIWithCompletion:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "bs_performAfterSynchronizedCommit:", a3);
}

@end
