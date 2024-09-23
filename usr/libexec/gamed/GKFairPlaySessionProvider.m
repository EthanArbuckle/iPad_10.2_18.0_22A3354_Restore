@implementation GKFairPlaySessionProvider

- (GKFairPlaySessionProvider)initWithSession:(id)a3
{
  return (GKFairPlaySessionProvider *)sub_1001AB494((uint64_t)a3);
}

- (void)fairPlaySessionWithStoreBag:(GKStoreBag *)a3 reporter:(GKReporter *)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  GKStoreBag *v10;
  GKReporter *v11;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject(&unk_1002C7798, 48, 7);
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  swift_retain(self);
  sub_1001C15C4((uint64_t)&unk_1003165F0, (uint64_t)v9);
}

- (GKFairPlaySessionProvider)init
{
  sub_1001AD514();
}

@end
