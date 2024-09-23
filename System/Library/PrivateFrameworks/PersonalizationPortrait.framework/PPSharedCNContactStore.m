@implementation PPSharedCNContactStore

void __PPSharedCNContactStore_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  PPNewCNContactStore();
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)PPSharedCNContactStore__pasExprOnceResult;
  PPSharedCNContactStore__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
