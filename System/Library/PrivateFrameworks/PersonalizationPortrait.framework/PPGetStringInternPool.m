@implementation PPGetStringInternPool

void __PPGetStringInternPool_block_invoke()
{
  void *v0;
  int v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)MEMORY[0x18D7805AC]();
  if (PPIsServerContext__pasOnceToken7 != -1)
    dispatch_once(&PPIsServerContext__pasOnceToken7, &__block_literal_global_98);
  v1 = PPIsServerContext__pasExprOnceResult;
  v2 = objc_alloc(MEMORY[0x1E0D815B8]);
  if (v1)
    v3 = &__block_literal_global_105;
  else
    v3 = 0;
  v4 = objc_msgSend(v2, "initWithBehavior:copyWithZone:", 0, v3);
  v5 = (void *)PPGetStringInternPool__pasExprOnceResult;
  PPGetStringInternPool__pasExprOnceResult = v4;

  objc_autoreleasePoolPop(v0);
}

id __PPGetStringInternPool_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(MEMORY[0x1E0D81660], "copyString:toZone:", a2, a3);
}

@end
