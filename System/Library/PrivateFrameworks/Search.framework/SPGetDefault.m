@implementation SPGetDefault

void __SPGetDefault_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)SPGetDefault_defaultCache;
  SPGetDefault_defaultCache = v0;

}

@end
