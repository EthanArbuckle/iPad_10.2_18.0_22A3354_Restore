@implementation TSKCountedObserver

- (TSKCountedObserver)initWithObserver:(id)a3
{
  TSKCountedObserver *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSKCountedObserver;
  v4 = -[TSKCountedObserver init](&v6, sel_init);
  if (v4)
  {
    v4->mWeakObserver = (TSUWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3D18]), "initWithObject:", a3);
    v4->mCount = 1;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKCountedObserver;
  -[TSKCountedObserver dealloc](&v3, sel_dealloc);
}

- (id)observer
{
  return (id)-[TSUWeakReference object](self->mWeakObserver, "object");
}

- (unint64_t)incrementCount
{
  unint64_t v2;

  v2 = self->mCount + 1;
  self->mCount = v2;
  return v2;
}

- (unint64_t)decrementCount
{
  unint64_t mCount;
  void *v4;
  uint64_t v5;
  unint64_t result;

  mCount = self->mCount;
  if (!mCount)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKCountedObserver decrementCount]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKChangeNotifier.m"), 68, CFSTR("TSKCountedObserver - attempted to decrement past 0!"));
    mCount = self->mCount;
  }
  result = mCount - 1;
  self->mCount = mCount - 1;
  return result;
}

@end
