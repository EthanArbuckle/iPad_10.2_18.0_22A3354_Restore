@implementation PXStoryColorGradingRepositoryFactory

+ (PXStoryColorGradingRepository)sharedRepository
{
  if (sharedRepository_onceToken != -1)
    dispatch_once(&sharedRepository_onceToken, &__block_literal_global_84281);
  return (PXStoryColorGradingRepository *)(id)sharedRepository_sharedRepository;
}

uint64_t __56__PXStoryColorGradingRepositoryFactory_sharedRepository__block_invoke()
{
  PXStoryConcreteColorGradingRepository *v0;
  void *v1;

  v0 = objc_alloc_init(PXStoryConcreteColorGradingRepository);
  v1 = (void *)sharedRepository_sharedRepository;
  sharedRepository_sharedRepository = (uint64_t)v0;

  return objc_msgSend((id)sharedRepository_sharedRepository, "startPreloadingWithCompletionHandler:", 0);
}

@end
