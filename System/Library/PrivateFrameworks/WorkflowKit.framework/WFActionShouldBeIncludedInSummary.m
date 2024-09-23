@implementation WFActionShouldBeIncludedInSummary

void __WFActionShouldBeIncludedInSummary_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E7B8D958);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WFActionShouldBeIncludedInSummary_ignoredActionIdentifiers;
  WFActionShouldBeIncludedInSummary_ignoredActionIdentifiers = v0;

}

@end
