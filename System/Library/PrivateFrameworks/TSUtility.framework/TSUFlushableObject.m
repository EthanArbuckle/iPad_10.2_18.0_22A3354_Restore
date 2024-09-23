@implementation TSUFlushableObject

+ (id)allocWithZone:(_NSZone *)a3
{
  id result;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___TSUFlushableObject;
  result = objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
  if (result)
    *((_DWORD *)result + 2) = 1;
  return result;
}

- (TSUFlushableObject)init
{
  TSUFlushableObject *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSUFlushableObject;
  v2 = -[TSUFlushableObject init](&v4, sel_init);
  if (v2)
    v2->_flushingManagerIvarLock = (NSLocking *)objc_alloc_init(MEMORY[0x24BDD1788]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_flushingManagerIvarLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSUFlushableObject;
  -[TSUFlushableObject dealloc](&v3, sel_dealloc);
}

- (id)ownerRetain
{
  int *p_ownerCount;
  unsigned int v3;

  p_ownerCount = &self->_ownerCount;
  do
    v3 = __ldaxr((unsigned int *)p_ownerCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_ownerCount));
  return self;
}

- (void)ownerRelease
{
  int *p_ownerCount;
  int v4;
  TSUFlushingManager *flushingManager;
  id v6;
  uint64_t v7;
  int *p_retainCount;
  unsigned int v9;
  unsigned int v10;

  p_ownerCount = &self->_ownerCount;
  do
    v4 = __ldaxr((unsigned int *)p_ownerCount);
  while (__stlxr(v4 - 1, (unsigned int *)p_ownerCount));
  if (v4 <= 0)
  {
    v6 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFlushableObject ownerRelease]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushableObject.m"), 68, CFSTR("-ownerRelease called too many times"));
  }
  else if (v4 == 1)
  {
    -[NSLocking lock](self->_flushingManagerIvarLock, "lock");
    flushingManager = self->_flushingManager;
    if (flushingManager)
    {
      -[TSUFlushingManager removeObject:](flushingManager, "removeObject:", self);
      self->_flushingManager = 0;
    }
    -[NSLocking unlock](self->_flushingManagerIvarLock, "unlock");
  }
  p_retainCount = &self->_retainCount;
  do
  {
    v9 = __ldaxr((unsigned int *)p_retainCount);
    v10 = v9 - 1;
  }
  while (__stlxr(v10, (unsigned int *)p_retainCount));
  if (!v10)
    -[TSUFlushableObject dealloc](self, "dealloc");
}

- (id)ownerAutoreleasedAccess
{
  id v3;
  uint64_t v4;
  TSUFlushableObject *v5;
  TSUFlushingManager *flushingManager;

  if (self->_retainCount < self->_ownerCount)
  {
    v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFlushableObject ownerAutoreleasedAccess]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushableObject.m"), 92, CFSTR("Bad retain count"));
  }
  v5 = self;
  -[NSLocking lock](self->_flushingManagerIvarLock, "lock");
  flushingManager = self->_flushingManager;
  if (flushingManager)
    -[TSUFlushingManager unsafeToFlush:](flushingManager, "unsafeToFlush:", self);
  -[NSLocking unlock](self->_flushingManagerIvarLock, "unlock");
  return self;
}

- (void)ownerWillAccess
{
  id v3;
  uint64_t v4;
  TSUFlushableObject *v5;
  TSUFlushingManager *flushingManager;

  if (self->_retainCount < self->_ownerCount)
  {
    v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFlushableObject ownerWillAccess]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushableObject.m"), 112, CFSTR("Bad retain count"));
  }
  v5 = self;
  -[NSLocking lock](self->_flushingManagerIvarLock, "lock");
  flushingManager = self->_flushingManager;
  if (flushingManager)
    -[TSUFlushingManager unsafeToFlush:](flushingManager, "unsafeToFlush:", self);
  -[NSLocking unlock](self->_flushingManagerIvarLock, "unlock");
}

- (TSUFlushableObject)retain
{
  int *p_retainCount;
  unsigned int v3;

  p_retainCount = &self->_retainCount;
  do
    v3 = __ldaxr((unsigned int *)p_retainCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_retainCount));
  return self;
}

- (void)release
{
  int *p_retainCount;
  unsigned int v4;
  unsigned int v5;
  BOOL v6;
  TSUFlushingManager *flushingManager;

  p_retainCount = &self->_retainCount;
  do
  {
    v4 = __ldaxr((unsigned int *)p_retainCount);
    v5 = v4 - 1;
  }
  while (__stlxr(v4 - 1, (unsigned int *)p_retainCount));
  if (v4 == 1)
  {
    -[TSUFlushableObject dealloc](self, "dealloc");
  }
  else if (v5 == self->_ownerCount && -[TSUFlushableObject hasFlushableContent](self, "hasFlushableContent"))
  {
    objc_sync_enter(self);
    if (v5 == self->_ownerCount)
    {
      v6 = -[TSUFlushableObject hasFlushableContent](self, "hasFlushableContent");
      objc_sync_exit(self);
      if (v6)
      {
        -[NSLocking lock](self->_flushingManagerIvarLock, "lock");
        flushingManager = self->_flushingManager;
        if (flushingManager)
        {
          -[TSUFlushingManager safeToFlush:wasAccessed:](flushingManager, "safeToFlush:wasAccessed:", self, 1);
        }
        else
        {
          objc_msgSend(+[TSUFlushingManager sharedManager](TSUFlushingManager, "sharedManager"), "addObject:", self);
          self->_flushingManager = (TSUFlushingManager *)+[TSUFlushingManager sharedManager](TSUFlushingManager, "sharedManager");
        }
        -[NSLocking unlock](self->_flushingManagerIvarLock, "unlock");
      }
    }
    else
    {
      objc_sync_exit(self);
    }
  }
}

- (unint64_t)retainCount
{
  return self->_retainCount;
}

- (void)addOwner
{
  int *p_ownerCount;
  unsigned int v3;

  p_ownerCount = &self->_ownerCount;
  do
    v3 = __ldaxr((unsigned int *)p_ownerCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_ownerCount));
}

- (BOOL)hasFlushableContent
{
  return 0;
}

- (void)flush
{
  objc_sync_enter(self);
  -[TSUFlushableObject unload](self, "unload");
  self->_flushingManager = 0;
  objc_sync_exit(self);
}

@end
