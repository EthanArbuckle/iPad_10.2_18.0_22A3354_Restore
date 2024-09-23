@implementation NSMutableArray(SBHArrayUtilities)

- (id)sbh_removeObjectsPassingTest:()SBHArrayUtilities
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectsAtIndexes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeObjectsAtIndexes:", v2);

  return v3;
}

@end
