@implementation DragSink_iOS

- (void)performDropWithItemCollection:(id)a3 dataProviderEndpoint:(id)a4 visibleDroppedItems:(id)a5 reply:(id)a6
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;

  v10 = _Block_copy(a6);
  v11 = sub_1000078E0(0, &qword_1002ADD18, _DUIVisibleDroppedItem_ptr);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, v11);
  _Block_copy(v10);
  v13 = a3;
  v14 = a4;
  swift_retain();
  sub_1000926C8((uint64_t)v13, (uint64_t)v14, v12, (uint64_t)self, (void (**)(_QWORD, _QWORD, _QWORD))v10);
  _Block_release(v10);

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)handOffDroppedItems:(id)a3 withFence:(id)a4
{
  uint64_t v5;

  v5 = sub_1000078E0(0, &qword_1002ADD18, _DUIVisibleDroppedItem_ptr);
  static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  swift_bridgeObjectRelease();
}

- (void)dragEnded
{
  sub_100092DF4((uint64_t)self, (uint64_t)a2, (void (*)(__n128))sub_100092AF0);
}

- (void)requestDragPreviewsForIndexSet:(NSIndexSet *)a3 reply:(id)a4
{
  sub_100092E98((uint64_t)self, (int)a2, a3, a4, (uint64_t)&unk_1002863D0, (uint64_t)&unk_1002ADCC8);
}

@end
