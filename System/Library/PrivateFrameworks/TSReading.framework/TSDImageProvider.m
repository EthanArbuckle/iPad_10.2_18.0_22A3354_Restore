@implementation TSDImageProvider

+ (id)allocWithZone:(_NSZone *)a3
{
  id result;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___TSDImageProvider;
  result = objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
  if (result)
    atomic_store(1u, (unsigned int *)result + 10);
  return result;
}

- (TSDImageProvider)initWithImageData:(id)a3
{
  void *v5;
  uint64_t v6;
  TSDImageProvider *v7;
  objc_super v9;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageProvider initWithImageData:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageProvider.mm"), 47, CFSTR("invalid nil value for '%s'"), "imageData");
  }
  v9.receiver = self;
  v9.super_class = (Class)TSDImageProvider;
  v7 = -[TSDImageProvider init](&v9, sel_init);
  if (v7)
  {
    v7->mImageData = (TSPData *)a3;
    -[TSDImageProvider i_commonInit](v7, "i_commonInit");
  }
  return v7;
}

- (void)i_commonInit
{
  self->mInterestLock._os_unfair_lock_opaque = 0;
  self->mOwnerCount.__a_.__a_value = 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDImageProvider;
  -[TSDImageProvider dealloc](&v3, sel_dealloc);
}

- (id)imageData
{
  return self->mImageData;
}

- (CGSize)naturalSize
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  CGSize result;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageProvider naturalSize]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageProvider.mm"), 79, CFSTR("subclasses of TSDImageProvider must implement -naturalSize"));
  v4 = 100.0;
  v5 = 100.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (unint64_t)imageGamut
{
  return 0;
}

- (BOOL)isValid
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageProvider isValid]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageProvider.mm"), 96, CFSTR("subclasses of TSDImageProvider must implement -isValid"));
  return 1;
}

- (BOOL)isError
{
  return 0;
}

- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageProvider drawImageInContext:rect:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageProvider.mm"), 108, CFSTR("subclasses of TSDImageProvider must implement -drawImageInContext:rect:"));
}

- (int)interest
{
  return self->mInterest;
}

- (void)addInterest
{
  os_unfair_lock_s *p_mInterestLock;

  p_mInterestLock = &self->mInterestLock;
  os_unfair_lock_lock(&self->mInterestLock);
  ++self->mInterest;
  os_unfair_lock_unlock(p_mInterestLock);
}

- (void)removeInterest
{
  os_unfair_lock_s *p_mInterestLock;

  p_mInterestLock = &self->mInterestLock;
  os_unfair_lock_lock(&self->mInterestLock);
  --self->mInterest;
  os_unfair_lock_unlock(p_mInterestLock);
}

- (void)flushIfInterestLessThan:(int)a3
{
  os_unfair_lock_s *p_mInterestLock;

  p_mInterestLock = &self->mInterestLock;
  os_unfair_lock_lock(&self->mInterestLock);
  if (self->mInterest < a3)
    -[TSDImageProvider flush](self, "flush");
  os_unfair_lock_unlock(p_mInterestLock);
}

- (void)setFlushingManager:(id)a3
{
  self->mFlushingManager = (TSUFlushingManager *)a3;
}

- (BOOL)hasFlushableContent
{
  return 0;
}

- (void)addOwner
{
  atomic<int> *p_mOwnerCount;
  unsigned int v3;

  p_mOwnerCount = &self->mOwnerCount;
  do
    v3 = __ldaxr((unsigned int *)p_mOwnerCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_mOwnerCount));
}

- (void)removeOwner
{
  atomic<int> *p_mOwnerCount;
  int v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  TSUFlushingManager *mFlushingManager;

  p_mOwnerCount = &self->mOwnerCount;
  v4 = atomic_load((unsigned int *)&self->mOwnerCount);
  if (v4 <= 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageProvider removeOwner]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageProvider.mm"), 184, CFSTR("-removeOwner called too many times"));
  }
  do
  {
    v7 = __ldaxr((unsigned int *)p_mOwnerCount);
    v8 = v7 - 1;
  }
  while (__stlxr(v8, (unsigned int *)p_mOwnerCount));
  if (!v8)
  {
    mFlushingManager = self->mFlushingManager;
    if (mFlushingManager)
      -[TSUFlushingManager removeObject:](mFlushingManager, "removeObject:", self);
  }
}

- (void)ownerAccess
{
  signed int v3;
  signed int v4;
  void *v5;
  uint64_t v6;
  TSDImageProvider *v7;
  TSUFlushingManager *mFlushingManager;

  v3 = atomic_load((unsigned int *)&self->mRetainCount);
  v4 = atomic_load((unsigned int *)&self->mOwnerCount);
  if (v3 < v4)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageProvider ownerAccess]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageProvider.mm"), 198, CFSTR("Bad retain count"));
  }
  v7 = self;
  mFlushingManager = self->mFlushingManager;
  if (mFlushingManager)
    -[TSUFlushingManager removeObject:](mFlushingManager, "removeObject:", self);
}

- (TSDImageProvider)retain
{
  atomic<int> *p_mRetainCount;
  unsigned int v3;

  p_mRetainCount = &self->mRetainCount;
  do
    v3 = __ldaxr((unsigned int *)p_mRetainCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_mRetainCount));
  return self;
}

- (void)release
{
  atomic<int> *p_mRetainCount;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;

  p_mRetainCount = &self->mRetainCount;
  do
  {
    v4 = __ldaxr((unsigned int *)p_mRetainCount);
    v5 = v4 - 1;
  }
  while (__stlxr(v4 - 1, (unsigned int *)p_mRetainCount));
  if (v4 == 1)
  {
    -[TSDImageProvider dealloc](self, "dealloc");
  }
  else
  {
    v6 = atomic_load((unsigned int *)&self->mOwnerCount);
    if (v5 == v6 && -[TSDImageProvider hasFlushableContent](self, "hasFlushableContent"))
    {
      objc_sync_enter(self);
      v7 = atomic_load((unsigned int *)&self->mOwnerCount);
      if (v5 == v7)
      {
        if (-[TSDImageProvider hasFlushableContent](self, "hasFlushableContent"))
          objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C78], "sharedManager"), "addObject:", self);
      }
      objc_sync_exit(self);
    }
  }
}

- (unint64_t)retainCount
{
  return (int)atomic_load((unsigned int *)&self->mRetainCount);
}

@end
