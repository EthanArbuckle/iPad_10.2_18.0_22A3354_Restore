@implementation PPGetSourceInternPool

void __PPGetSourceInternPool_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815B8]), "initWithBehavior:copyWithZone:", 0, 0);
  v2 = (void *)PPGetSourceInternPool__pasExprOnceResult;
  PPGetSourceInternPool__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
