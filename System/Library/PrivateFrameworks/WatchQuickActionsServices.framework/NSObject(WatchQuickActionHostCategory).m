@implementation NSObject(WatchQuickActionHostCategory)

- (void)setQuickActionHostObserver:()WatchQuickActionHostCategory
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_getAssociatedObject(a1, &WQAHostObserverIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setHostObserver:", 0);
  if (v7)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setHostObserver:", v7);
    objc_setAssociatedObject(a1, &WQAHostObserverIdentifier, v6, (void *)1);

  }
  else
  {
    objc_setAssociatedObject(a1, &WQAHostObserverIdentifier, 0, (void *)1);
  }

}

@end
