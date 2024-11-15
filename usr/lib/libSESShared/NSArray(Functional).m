@implementation NSArray(Functional)

- (id)find:()Functional
{
  return Find(a1, a3);
}

- (id)filter:()Functional
{
  return Filter(a1, a3);
}

- (BOOL)contains:()Functional
{
  void *v3;
  _BOOL8 v4;

  Find(a1, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)ses_map:()Functional
{
  return Transform(a1, a3);
}

- (id)filterMap:()Functional
{
  return TransformIf(a1, a3);
}

- (uint64_t)allSatisfy:()Functional
{
  return All(a1, a3);
}

@end
