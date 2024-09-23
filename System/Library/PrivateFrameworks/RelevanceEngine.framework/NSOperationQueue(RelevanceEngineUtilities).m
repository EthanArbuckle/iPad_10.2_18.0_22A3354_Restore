@implementation NSOperationQueue(RelevanceEngineUtilities)

+ (id)re_sharedSerialOperationQueue
{
  if (re_sharedSerialOperationQueue_onceToken != -1)
    dispatch_once(&re_sharedSerialOperationQueue_onceToken, &__block_literal_global_9_0);
  return (id)re_sharedSerialOperationQueue_queue;
}

@end
