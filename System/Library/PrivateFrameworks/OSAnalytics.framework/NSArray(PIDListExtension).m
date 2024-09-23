@implementation NSArray(PIDListExtension)

- (id)sortedPids
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "sortedArrayUsingSelector:", sel_compare_);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsJoinedByString:", CFSTR(","));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
