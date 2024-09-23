@implementation RBSProcessEverythingPredicate

- (BOOL)matchesProcess:(id)a3
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  if (self == a3)
    return 1;
  v3 = a3;
  v4 = objc_opt_class();
  v5 = objc_opt_class();

  return v4 == v5;
}

+ (id)everythingPredicate
{
  RBSProcessEverythingPredicate *v2;
  void *v3;

  v2 = objc_alloc_init(RBSProcessEverythingPredicate);
  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
