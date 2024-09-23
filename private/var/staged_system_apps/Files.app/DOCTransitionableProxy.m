@implementation DOCTransitionableProxy

- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  __n128 v12;
  uint64_t v13;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v11);
  swift_retain();
  sub_100160F08((uint64_t)v10, (uint64_t)self, (void (**)(_QWORD, _QWORD))v11);
  _Block_release(v11);
  _Block_release(v11);
  v12 = swift_release(self);
  (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v12);
}

- (void)getTransitionControllerForItem:(id)a3 completionBlock:(id)a4
{
  sub_100160A84((uint64_t)self, (int)a2, a3, a4, (void (*)(id, uint64_t, void *))sub_1001614D0);
}

- (void)getPopoverTrackerForItem:(id)a3 completionBlock:(id)a4
{
  sub_100160A84((uint64_t)self, (int)a2, a3, a4, (void (*)(id, uint64_t, void *))sub_100161718);
}

- (void)getViewFor:(id)a3 waitForNewThumbnail:(BOOL)a4 :(id)a5
{
  void *v8;
  id v9;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  swift_retain();
  sub_100161B5C((uint64_t)v9, a4, (uint64_t)self, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release(self);
}

- (void)getCellFor:(id)a3 :(id)a4
{
  sub_100160A84((uint64_t)self, (int)a2, a3, a4, (void (*)(id, uint64_t, void *))sub_100161E18);
}

- (void)revealWithItems:(id)a3 selectEvenIfVisible:(BOOL)a4 completionBlock:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = _Block_copy(a5);
  v9 = sub_10004F2F0(0, (unint64_t *)&qword_1006419B0, FPItem_ptr);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v9);
  v11 = swift_allocObject(&unk_1005CB038, 24, 7);
  *(_QWORD *)(v11 + 16) = v8;
  swift_retain();
  sub_100160C64(v10, a4, (uint64_t)sub_100145FB4, v11);
  swift_release(self);
  swift_bridgeObjectRelease(v10);
  swift_release(v11);
}

@end
