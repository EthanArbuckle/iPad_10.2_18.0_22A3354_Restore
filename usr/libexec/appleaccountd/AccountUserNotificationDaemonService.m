@implementation AccountUserNotificationDaemonService

- (void)postAccountUserNotificationWith:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;

  v6 = _Block_copy(a4);
  v7 = a3;
  swift_retain(self);
  sub_10008C9F4(v7);
  _Block_release(v6);

  swift_release(self);
}

@end
