@implementation EMMessageList

- (void)displayMessagesFromThreadsWithItemIDs:(id)a3 completion:(id)a4
{
  id v5;
  EMMessageList *v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  sub_100008AC0((uint64_t *)&unk_10008B190);
  v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  sub_100008AC0(&qword_10008BF20);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = swift_allocObject(&unk_100082830, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  sub_1000135E8(v10, (uint64_t)sub_1000142E0, v9);
  swift_release();
  swift_bridgeObjectRelease(v10);

}

@end
