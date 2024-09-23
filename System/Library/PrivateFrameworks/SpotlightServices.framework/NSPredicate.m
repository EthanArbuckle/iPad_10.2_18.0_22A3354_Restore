@implementation NSPredicate

BOOL __62__NSPredicate_RelativeRanks___predicateForItemsWithAttribute___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(a2, "attributes"), *(int *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

@end
