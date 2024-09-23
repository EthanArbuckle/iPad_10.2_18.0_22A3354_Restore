@implementation DIPSystemNotificationSessionProxy

- (void)appleAccountCreatedWithAccount:(id)a3 completion:(id)a4
{
  sub_1001BB120((uint64_t)self, (int)a2, a3, a4, sub_1001BBD78);
}

- (void)appleAccountDeletedWithAccount:(id)a3 completion:(id)a4
{
  sub_1001BB120((uint64_t)self, (int)a2, a3, a4, sub_1001BC3F0);
}

- (void)appleAccountModifiedWithAccount:(id)a3 oldAccount:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  swift_retain(self);
  sub_1001BCA68(v9, (uint64_t)self, v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release(self);
}

@end
