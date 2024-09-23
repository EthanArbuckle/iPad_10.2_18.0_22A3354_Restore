@implementation NSArray(UIReferenceLibraryViewControllerAdditions_Private)

- (id)_filteredArrayOfObjectsPassingTest:()UIReferenceLibraryViewControllerAdditions_Private
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectsAtIndexes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
