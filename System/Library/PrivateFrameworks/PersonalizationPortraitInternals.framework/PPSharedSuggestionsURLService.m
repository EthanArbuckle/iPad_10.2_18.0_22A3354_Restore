@implementation PPSharedSuggestionsURLService

void __PPSharedSuggestionsURLService_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  PPNewSuggestionsURLService();
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)PPSharedSuggestionsURLService__pasExprOnceResult;
  PPSharedSuggestionsURLService__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
