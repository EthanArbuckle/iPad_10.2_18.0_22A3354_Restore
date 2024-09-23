@implementation NSArray(SearchUIExtension)

- (id)searchui_safeObjectAtIndex:()SearchUIExtension
{
  void *v5;

  if (objc_msgSend(a1, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end
