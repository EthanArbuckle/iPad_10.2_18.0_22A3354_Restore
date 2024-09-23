@implementation PPStringAllWhiteSpace

void __PPStringAllWhiteSpace_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x18D7805AC]();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invertedSet");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)PPStringAllWhiteSpace__pasExprOnceResult;
  PPStringAllWhiteSpace__pasExprOnceResult = v2;

  objc_autoreleasePoolPop(v0);
}

@end
