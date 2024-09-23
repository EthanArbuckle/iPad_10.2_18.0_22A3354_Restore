@implementation GPRunningBoardServicesUtility

+ (id)everythingPredicate
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(NSClassFromString(CFSTR("RBSProcessEverythingPredicate")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v2));

  return v3;
}

@end
