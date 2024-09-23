@implementation NSOperationQueue(WLKAdditions)

+ (id)wlkDefaultConcurrentQueue
{
  if (wlkDefaultConcurrentQueue___once != -1)
    dispatch_once(&wlkDefaultConcurrentQueue___once, &__block_literal_global_2_2);
  return (id)wlkDefaultConcurrentQueue___wlkDefaultConQueue;
}

+ (id)wlkDefaultQueue
{
  if (wlkDefaultQueue___once != -1)
    dispatch_once(&wlkDefaultQueue___once, &__block_literal_global_43);
  return (id)wlkDefaultQueue___wlkDefaultQueue;
}

@end
