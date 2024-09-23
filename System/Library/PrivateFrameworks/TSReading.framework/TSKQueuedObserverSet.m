@implementation TSKQueuedObserverSet

+ (id)queuedObserverSetWithChangeType:(int)a3 observer:(id)a4 changeSource:(id)a5 isClass:(BOOL)a6
{
  TSKQueuedObserverSet *v10;

  v10 = objc_alloc_init(TSKQueuedObserverSet);
  v10->mChangeType = a3;
  v10->mObserver = a4;
  v10->mChangeSource = a5;
  v10->mIsClass = a6;
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKQueuedObserverSet;
  -[TSKQueuedObserverSet dealloc](&v3, sel_dealloc);
}

@end
