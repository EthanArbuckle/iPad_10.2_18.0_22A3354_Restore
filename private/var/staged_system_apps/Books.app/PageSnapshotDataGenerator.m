@implementation PageSnapshotDataGenerator

- (void)snapshotWithPageNumber:(int64_t)a3 size:(CGSize)a4 completion:(id)a5
{
  void *v7;

  v7 = _Block_copy(a5);
  _Block_copy(v7);
  swift_retain(self);
  sub_10036F5E4(a3, (uint64_t)self, (void (**)(_QWORD, _QWORD))v7);
  _Block_release(v7);
  _Block_release(v7);
  swift_release(self);
}

@end
