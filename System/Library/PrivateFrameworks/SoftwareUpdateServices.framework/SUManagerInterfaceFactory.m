@implementation SUManagerInterfaceFactory

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1)
    dispatch_once(&sharedInstance_pred, &__block_literal_global_4);
  return (id)sharedInstance___instance_0;
}

void __43__SUManagerInterfaceFactory_sharedInstance__block_invoke()
{
  SUManagerPolicy *v0;
  void *v1;

  v0 = objc_alloc_init(SUManagerPolicy);
  v1 = (void *)sharedInstance___instance_0;
  sharedInstance___instance_0 = (uint64_t)v0;

}

@end
