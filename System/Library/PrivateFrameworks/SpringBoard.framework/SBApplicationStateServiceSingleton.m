@implementation SBApplicationStateServiceSingleton

+ (void)startService
{
  if (startService_onceToken != -1)
    dispatch_once(&startService_onceToken, &__block_literal_global_6);
}

uint64_t __50__SBApplicationStateServiceSingleton_startService__block_invoke()
{
  SBApplicationStateServiceDelegate *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = objc_alloc_init(SBApplicationStateServiceDelegate);
  v1 = (void *)__delegate;
  __delegate = (uint64_t)v0;

  v2 = objc_alloc(MEMORY[0x1E0DC5B70]);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "_systemAnimationFenceExemptQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithCalloutQueue:", v3);
  v5 = (void *)__singleton;
  __singleton = v4;

  return objc_msgSend((id)__singleton, "setDelegate:", __delegate);
}

@end
