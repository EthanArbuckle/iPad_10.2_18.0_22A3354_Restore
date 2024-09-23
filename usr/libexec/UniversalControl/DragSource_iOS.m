@implementation DragSource_iOS

- (void)checkCanHandOffCancelledItems:(NSArray *)a3 withReply:(id)a4
{
  sub_100092E98((uint64_t)self, (int)a2, a3, a4, (uint64_t)&unk_1002865D8, (uint64_t)&unk_1002ADD40);
}

- (void)handOffCancelledItems:(id)a3 withFence:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_1000078E0(0, &qword_1002ADD18, _DUIVisibleDroppedItem_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  CGSize.init(_:)(v6);
  swift_bridgeObjectRelease();
}

- (void)dragEndedWithOperation:(unint64_t)a3
{
  swift_retain();
  sub_10008FA6C(a3);
  swift_release();
}

- (void)dragFailed
{
  sub_100092DF4((uint64_t)self, (uint64_t)a2, (void (*)(__n128))sub_10008FD60);
}

- (void)dataTransferSessionFinished
{
  sub_100092DF4((uint64_t)self, (uint64_t)a2, (void (*)(__n128))sub_10008FD98);
}

- (void)requestDragPreviewsForIndexSet:(id)a3 reply:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;

  v7 = type metadata accessor for IndexSet(0, a2);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static IndexSet._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v11);
  swift_retain();
  sub_10008FF10((uint64_t)v10, (uint64_t)self, (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v11);
  _Block_release(v11);
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)updatedPresentation:(id)a3
{
  CGSize.init(_:)(a3);
}

@end
