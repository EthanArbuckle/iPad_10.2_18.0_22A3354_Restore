@implementation GKGameActivityStore

- (GKGameActivityStore)init
{
  return (GKGameActivityStore *)GameActivityStore.init()();
}

- (void)add:(GKGameActivityInternal *)a3 completionHandler:(id)a4
{
  sub_100185AB4((uint64_t)self, (int)a2, a3, a4, (uint64_t)&unk_1002C60F8, (uint64_t)&unk_1003154F0);
}

- (void)fetchAndRemoveLatestActivityWithBundleID:(NSString *)a3 completionHandler:(id)a4
{
  sub_100185AB4((uint64_t)self, (int)a2, a3, a4, (uint64_t)&unk_1002C60D0, (uint64_t)&unk_1003154E0);
}

- (void)fetchActivitiesWithBundleID:(NSString *)a3 ascending:(BOOL)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  NSString *v10;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_1002C60A8, 48, 7);
  *(_QWORD *)(v9 + 16) = a3;
  *(_BYTE *)(v9 + 24) = a4;
  *(_QWORD *)(v9 + 32) = v8;
  *(_QWORD *)(v9 + 40) = self;
  v10 = a3;
  swift_retain(self);
  sub_1001C15C4((uint64_t)&unk_1003154D0, v9);
}

- (void)removeActivitiesForBundleID:(NSString *)a3 completionHandler:(id)a4
{
  sub_100185AB4((uint64_t)self, (int)a2, a3, a4, (uint64_t)&unk_1002C6080, (uint64_t)&unk_1003154C0);
}

- (void)removeAllActivitiesWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1002C6058, 32, 7);
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  swift_retain(self);
  sub_1001C15C4((uint64_t)&unk_1003154B0, v5);
}

@end
