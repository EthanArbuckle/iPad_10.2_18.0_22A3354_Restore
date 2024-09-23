@implementation PXAggdLogHelper

- (void)logAddValueForScalarKey:(int64_t)a3 forKey:(__CFString *)a4
{
  PLSAggregateDictionaryAddValueForScalarKey();
}

- (void)logSetValueForScalarKey:(int64_t)a3 forKey:(__CFString *)a4
{
  PLSAggregateDictionarySetValueForScalarKey();
}

- (void)logPushValueForDistributionKey:(double)a3 forKey:(__CFString *)a4
{
  PLSAggregateDictionaryPushValueForDistributionKey();
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_270423 != -1)
    dispatch_once(&sharedInstance_onceToken_270423, &__block_literal_global_270424);
  return (id)sharedInstance_sharedInstance_270425;
}

void __33__PXAggdLogHelper_sharedInstance__block_invoke()
{
  PXAggdLogHelper *v0;
  void *v1;

  v0 = objc_alloc_init(PXAggdLogHelper);
  v1 = (void *)sharedInstance_sharedInstance_270425;
  sharedInstance_sharedInstance_270425 = (uint64_t)v0;

}

@end
