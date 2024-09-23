@implementation NSMutableArray(TKQueue)

- (uint64_t)tk_enqueueObject:()TKQueue
{
  return objc_msgSend(a1, "insertObject:atIndex:", a3, 0);
}

- (id)tk_dequeueObject
{
  void *v2;

  objc_msgSend(a1, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeLastObject");
  return v2;
}

- (uint64_t)tk_lastEnqueuedObject
{
  return objc_msgSend(a1, "objectAtIndex:", 0);
}

@end
