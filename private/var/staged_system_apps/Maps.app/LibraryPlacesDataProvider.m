@implementation LibraryPlacesDataProvider

- (NSArray)storeSubscriptionTypes
{
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  swift_beginAccess(&self->storeSubscriptionTypes[7], v6, 0, 0);
  v3 = *(_QWORD *)&self->storeSubscriptionTypes[7];
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
  swift_beginAccess(&self->storeSubscriptionTypes[7], v8, 1, 0);
  v7 = *(_QWORD *)&self->storeSubscriptionTypes[7];
  *(_QWORD *)&self->storeSubscriptionTypes[7] = v6;
  swift_retain();
  swift_release();
  swift_bridgeObjectRelease(v7);
}

- (void)storeDidChangeWithTypes:(id)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)&self->lastUsedSearchTerm[7];
  v4 = *(_QWORD *)&self->lastUsedSearchTerm[15];
  swift_bridgeObjectRetain(v4);
  swift_retain();
  sub_1001CDFB4(v3, v4);
  swift_release();
  swift_bridgeObjectRelease(v4);
}

@end
