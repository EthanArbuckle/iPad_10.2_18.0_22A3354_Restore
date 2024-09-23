@implementation DownloadRemovalObserver

- (void)removeDownloadedEpisodeWithUuid:(id)a3 completion:(id)a4
{
  void (*v6)(void);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = (void (*)(void))_Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  if (v6)
  {
    v10 = swift_allocObject(&unk_1004C33B8, 24, 7);
    *(_QWORD *)(v10 + 16) = v6;
    v6 = (void (*)(void))sub_100048D5C;
  }
  else
  {
    v10 = 0;
  }
  swift_retain();
  sub_100326A4C(v7, v9, v6);
  sub_10002CA30((uint64_t)v6, v10);
  swift_release(self);
  swift_bridgeObjectRelease(v9);
}

@end
