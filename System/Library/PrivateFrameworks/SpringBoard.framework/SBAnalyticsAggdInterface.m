@implementation SBAnalyticsAggdInterface

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_41 != -1)
    dispatch_once(&sharedInstance_onceToken_41, &__block_literal_global_272);
  return (id)sharedInstance___interface;
}

void __42__SBAnalyticsAggdInterface_sharedInstance__block_invoke()
{
  SBAnalyticsAggdInterface *v0;
  void *v1;

  v0 = objc_alloc_init(SBAnalyticsAggdInterface);
  v1 = (void *)sharedInstance___interface;
  sharedInstance___interface = (uint64_t)v0;

}

- (void)setValue:(int64_t)a3 forScalarKey:(id)a4
{
  ADClientSetValueForScalarKey();
}

- (void)addValue:(int64_t)a3 forScalarKey:(id)a4
{
  ADClientAddValueForScalarKey();
}

@end
