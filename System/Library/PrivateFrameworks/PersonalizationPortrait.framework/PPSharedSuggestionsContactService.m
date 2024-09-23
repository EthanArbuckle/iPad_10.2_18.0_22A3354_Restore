@implementation PPSharedSuggestionsContactService

void __PPSharedSuggestionsContactService_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  objc_msgSend(MEMORY[0x1E0D19970], "serviceForContacts");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)PPSharedSuggestionsContactService__pasExprOnceResult;
  PPSharedSuggestionsContactService__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
