@implementation TSKLowPriorityThreadDispatcher

+ (id)_singletonAlloc
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSKLowPriorityThreadDispatcher;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

+ (id)sharedLowPriorityDispatcher
{
  id result;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  result = (id)sharedLowPriorityDispatcher_sSingletonInstance;
  if (!sharedLowPriorityDispatcher_sSingletonInstance)
  {
    objc_sync_enter(a1);
    if (!sharedLowPriorityDispatcher_sSingletonInstance)
    {
      v4 = objc_msgSend((id)objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      sharedLowPriorityDispatcher_sSingletonInstance = v4;
      if (!v4)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSKLowPriorityThreadDispatcher sharedLowPriorityDispatcher]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKThreadDispatcher.m"), 62, CFSTR("Couldn't create singleton instance of %@"), a1);
      }
    }
    objc_sync_exit(a1);
    return (id)sharedLowPriorityDispatcher_sSingletonInstance;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSKLowPriorityThreadDispatcher allocWithZone:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKThreadDispatcher.m"), 62, CFSTR("Don't alloc a singleton"));
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (TSKLowPriorityThreadDispatcher)init
{
  TSKLowPriorityThreadDispatcher *v2;
  NSObject *v3;
  NSObject *global_queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSKLowPriorityThreadDispatcher;
  v2 = -[TSKLowPriorityThreadDispatcher init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.TSKLowPriorityThreadDispatcher", 0);
    v2->_queue = (OS_dispatch_queue *)v3;
    global_queue = dispatch_get_global_queue(-2, 0);
    dispatch_set_target_queue(v3, global_queue);
  }
  return v2;
}

- (BOOL)isSuspended
{
  return self->_suspendCount > 0;
}

- (void)suspend
{
  int *p_suspendCount;
  unsigned int v3;

  p_suspendCount = &self->_suspendCount;
  do
    v3 = __ldaxr((unsigned int *)p_suspendCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_suspendCount));
  if (!v3)
    dispatch_suspend((dispatch_object_t)self->_queue);
}

- (void)resume
{
  int *p_suspendCount;
  int v3;
  void *v4;
  uint64_t v5;

  p_suspendCount = &self->_suspendCount;
  do
    v3 = __ldaxr((unsigned int *)p_suspendCount);
  while (__stlxr(v3 - 1, (unsigned int *)p_suspendCount));
  if (v3 <= 0)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKLowPriorityThreadDispatcher resume]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKThreadDispatcher.m"), 93, CFSTR("Suspend count underflow"));
  }
  else if (v3 == 1)
  {
    dispatch_resume((dispatch_object_t)self->_queue);
  }
}

- (id)p_dispatchQueue
{
  return self->_queue;
}

@end
