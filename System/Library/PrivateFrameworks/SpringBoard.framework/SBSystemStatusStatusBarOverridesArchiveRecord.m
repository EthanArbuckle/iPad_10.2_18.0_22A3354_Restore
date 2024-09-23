@implementation SBSystemStatusStatusBarOverridesArchiveRecord

uint64_t __58___SBSystemStatusStatusBarOverridesArchiveRecord_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "statusBarData");
}

uint64_t __58___SBSystemStatusStatusBarOverridesArchiveRecord_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "suppressedBackgroundActivityIdentifiers");
}

void __98___SBSystemStatusStatusBarOverridesArchiveRecord__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "statusBarData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:skipIfNil:", v3, CFSTR("statusBarData"), 1);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "suppressedBackgroundActivityIdentifiers");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activeMultilinePrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendArraySection:withName:multilinePrefix:skipIfEmpty:objectTransformer:", v6, CFSTR("suppressedBackgroundActivityIdentifiers"), v7, 1, &__block_literal_global_52_1);

}

uint64_t __98___SBSystemStatusStatusBarOverridesArchiveRecord__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke_2()
{
  return STBackgroundActivityIdentifierDescription();
}

@end
