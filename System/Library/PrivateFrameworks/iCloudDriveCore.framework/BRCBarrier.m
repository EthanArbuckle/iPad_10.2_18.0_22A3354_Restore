@implementation BRCBarrier

- (BRCBarrier)init
{
  id v2;
  dispatch_group_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BRCBarrier;
  v2 = -[BRCBarrier init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_group_create();
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    dispatch_group_enter(*((dispatch_group_t *)v2 + 1));
  }
  return (BRCBarrier *)v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BRCBarrier signalBarrier](self, "signalBarrier");
  v3.receiver = self;
  v3.super_class = (Class)BRCBarrier;
  -[BRCBarrier dealloc](&v3, sel_dealloc);
}

- (void)signalBarrier
{
  BRCBarrier *v2;
  OS_dispatch_group *barrierGroup;
  NSObject *v4;
  NSObject *group;

  v2 = self;
  objc_sync_enter(v2);
  group = v2->_barrierGroup;
  barrierGroup = v2->_barrierGroup;
  v2->_barrierGroup = 0;

  objc_sync_exit(v2);
  v4 = group;
  if (group)
  {
    dispatch_group_leave(group);
    v4 = group;
  }

}

- (void)waitForBarrier
{
  BRCBarrier *v2;
  NSObject *v3;
  NSObject *group;

  v2 = self;
  objc_sync_enter(v2);
  group = v2->_barrierGroup;
  objc_sync_exit(v2);

  v3 = group;
  if (group)
  {
    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
    v3 = group;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barrierGroup, 0);
}

@end
