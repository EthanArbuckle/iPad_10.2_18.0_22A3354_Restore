@implementation _HKSPSynchronized

- (void)performBlock:(id)a3
{
  _HKSPSynchronized *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  v4 = self;
  objc_sync_enter(v4);
  v5[2]();
  objc_sync_exit(v4);

}

@end
