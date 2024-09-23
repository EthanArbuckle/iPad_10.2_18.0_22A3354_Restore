@implementation ItemIntentsHandler

- (_TtC24FindMyWidgetIntentsItems18ItemIntentsHandler)init
{
  return (_TtC24FindMyWidgetIntentsItems18ItemIntentsHandler *)sub_10000EF54();
}

- (void)dealloc
{
  _TtC24FindMyWidgetIntentsItems18ItemIntentsHandler *v2;

  v2 = self;
  sub_10000F4B0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->instanceId[OBJC_IVAR____TtC24FindMyWidgetIntentsItems18ItemIntentsHandler_instanceId]);
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC24FindMyWidgetIntentsItems18ItemIntentsHandler_itemDataService));
}

- (void)handleItemSelector:(id)a3 completion:(id)a4
{
  sub_10000FF58(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_100011528);
}

- (id)defaultSourceForItemSelector:(id)a3
{
  id v4;
  _TtC24FindMyWidgetIntentsItems18ItemIntentsHandler *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_10000F78C(v4);

  return v6;
}

- (void)resolveSourceForItemSelector:(id)a3 withCompletion:(id)a4
{
  sub_10000FF58(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1000117D8);
}

- (void)provideSourceOptionsForItemSelector:(id)a3 withCompletion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC24FindMyWidgetIntentsItems18ItemIntentsHandler *v10;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_100019520, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = swift_allocObject(&unk_100019548, 32, 7);
  *(_QWORD *)(v8 + 16) = sub_10001218C;
  *(_QWORD *)(v8 + 24) = v7;
  v9 = a3;
  v10 = self;
  swift_retain(v7);
  sub_100011B24(v9, (uint64_t)sub_1000121B8, v8);

  swift_release(v7);
  swift_release(v8);
}

- (void)provideSourceOptionsCollectionForItemSelector:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _TtC24FindMyWidgetIntentsItems18ItemIntentsHandler *v12;

  v8 = _Block_copy(a5);
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v9;
  }
  v10 = swift_allocObject(&unk_100019430, 24, 7);
  *(_QWORD *)(v10 + 16) = v8;
  v11 = a3;
  v12 = self;
  sub_100011B24(v11, (uint64_t)sub_100010C98, v10);

  swift_bridgeObjectRelease(a4);
  swift_release(v10);
}

@end
