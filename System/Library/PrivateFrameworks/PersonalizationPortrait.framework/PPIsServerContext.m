@implementation PPIsServerContext

void __PPIsServerContext_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  char v4;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = (void *)MEMORY[0x18D7805AC]();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.suggestd"));

  objc_autoreleasePoolPop(v1);
  PPIsServerContext__pasExprOnceResult = v4;
  objc_autoreleasePoolPop(v0);
}

@end
