@implementation PXMediaProvider(Preheating)

+ (id)preheatQueue
{
  if (preheatQueue_onceToken != -1)
    dispatch_once(&preheatQueue_onceToken, &__block_literal_global_186064);
  return (id)preheatQueue_sharedPreheatQueue;
}

@end
