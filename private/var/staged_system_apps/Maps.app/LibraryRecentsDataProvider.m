@implementation LibraryRecentsDataProvider

- (NSArray)storeSubscriptionTypes
{
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  swift_beginAccess(self->storeSubscriptionTypes, v6, 0, 0);
  v3 = *(_QWORD *)self->storeSubscriptionTypes;
  swift_bridgeObjectRetain(v3);
  sub_100008B04((uint64_t *)&unk_101499CC0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[24];

  v5 = sub_100008B04((uint64_t *)&unk_101499CC0);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  swift_beginAccess(self->storeSubscriptionTypes, v8, 1, 0);
  v7 = *(_QWORD *)self->storeSubscriptionTypes;
  *(_QWORD *)self->storeSubscriptionTypes = v6;
  swift_retain();
  swift_release();
  swift_bridgeObjectRelease(v7);
}

- (void)storeDidChangeWithTypes:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  v4 = *(_QWORD *)self->_TtCs12_SwiftObject_opaque;
  v5 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = (_QWORD *)swift_allocObject(&unk_1011A9870, 48, 7);
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = self;
  v9[5] = v4;
  swift_retain_n(self, 2);
  sub_1001B0C08((uint64_t)v7, (uint64_t)&unk_10149F470, (uint64_t)v9);
  swift_release();
  swift_release();
}

@end
