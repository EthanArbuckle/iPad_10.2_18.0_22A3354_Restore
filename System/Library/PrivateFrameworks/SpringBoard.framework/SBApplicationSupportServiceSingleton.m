@implementation SBApplicationSupportServiceSingleton

+ (void)startService
{
  if (startService_onceToken_0 != -1)
    dispatch_once(&startService_onceToken_0, &__block_literal_global_158);
}

void __52__SBApplicationSupportServiceSingleton_startService__block_invoke()
{
  SBApplicationSupportServiceDelegate *v0;
  void *v1;

  v0 = objc_alloc_init(SBApplicationSupportServiceDelegate);
  v1 = (void *)__delegate_0;
  __delegate_0 = (uint64_t)v0;

}

@end
