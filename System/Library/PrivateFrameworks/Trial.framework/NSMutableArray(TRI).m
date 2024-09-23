@implementation NSMutableArray(TRI)

- (BOOL)triMoveFirstItemToFrontPassingTest:()TRI
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(a1, "indexOfObjectPassingTest:");
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "removeObjectAtIndex:", v2);
    objc_msgSend(a1, "insertObject:atIndex:", v3, 0);

  }
  return v2 != 0x7FFFFFFFFFFFFFFFLL;
}

@end
