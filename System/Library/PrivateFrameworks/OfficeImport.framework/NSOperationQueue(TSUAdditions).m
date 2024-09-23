@implementation NSOperationQueue(TSUAdditions)

+ (id)tsu_newSerialOperationQueueWithName:()TSUAdditions
{
  id v4;
  NSObject *v5;

  v4 = objc_alloc_init(MEMORY[0x24BDD1710]);
  objc_msgSend(v4, "setName:", a3);
  objc_msgSend(v4, "setMaxConcurrentOperationCount:", 1);
  v5 = dispatch_queue_create((const char *)objc_msgSend(a3, "UTF8String"), 0);
  dispatch_queue_set_specific(v5, (const void *)TSUOperationQueueUtilityQueueSpecific, v5, 0);
  objc_msgSend(v4, "setUnderlyingQueue:", v5);

  return v4;
}

- (uint64_t)tsu_isCurrentQueue
{
  uint64_t result;

  if ((void *)objc_msgSend(MEMORY[0x24BDD1710], "currentQueue") == a1)
    return 1;
  result = objc_msgSend(a1, "underlyingQueue");
  if (result)
    return dispatch_get_specific((const void *)TSUOperationQueueUtilityQueueSpecific) == (void *)result;
  return result;
}

- (void)tsu_performBlock:()TSUAdditions
{
  void *v4;

  if (a3)
  {
    v4 = result;
    if (objc_msgSend(result, "tsu_isCurrentQueue"))
      return (void *)(*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
    else
      return (void *)objc_msgSend(v4, "addOperationWithBlock:", a3);
  }
  return result;
}

@end
