@implementation RBSProcessApplicationPredicate

+ (id)applicationPredicate
{
  if (applicationPredicate_onceToken != -1)
    dispatch_once(&applicationPredicate_onceToken, &__block_literal_global_108);
  return (id)applicationPredicate__predicate;
}

void __54__RBSProcessApplicationPredicate_applicationPredicate__block_invoke()
{
  uint64_t v0;
  void *v1;
  RBSProcessApplicationPredicate *v2;

  v2 = objc_alloc_init(RBSProcessApplicationPredicate);
  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)applicationPredicate__predicate;
  applicationPredicate__predicate = v0;

}

- (BOOL)matchesProcess:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmbeddedApplication");

  return v4;
}

@end
