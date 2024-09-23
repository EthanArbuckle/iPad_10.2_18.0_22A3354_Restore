@implementation NSMutableIndexSet(PLAdditions)

- (void)pl_adjustIndexesForDeletions:()PLAdditions
{
  id v2;

  objc_msgSend(a1, "pl_indexSetAdjustedForDeletions:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeAllIndexes");
  objc_msgSend(a1, "addIndexes:", v2);

}

- (void)pl_adjustIndexesForInsertions:()PLAdditions
{
  id v2;

  objc_msgSend(a1, "pl_indexSetAdjustedForInsertions:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeAllIndexes");
  objc_msgSend(a1, "addIndexes:", v2);

}

@end
