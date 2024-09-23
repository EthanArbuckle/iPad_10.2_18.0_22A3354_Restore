@implementation RDCoreDataCoreSpotlightDelegate

- (id)indexName
{
  return sub_1001697A4((uint64_t)self, (uint64_t)a2, &REMDaemonCoreSpotlightIndexName);
}

- (id)bundleIdentifier
{
  return sub_1001697A4((uint64_t)self, (uint64_t)a2, &REMAppBundleIdentifier);
}

- (id)protectionClass
{
  _TtC7remindd31RDCoreDataCoreSpotlightDelegate *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;

  v2 = self;
  v3 = static NSFileProtectionType.rem_spotlightIndexFileProtection.getter();
  if (v3)
  {
    v4 = (void *)v3;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v6 = v5;

    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
  }
  else
  {

    v7 = 0;
  }
  return v7;
}

- (id)attributeSetForObject:(id)a3
{
  id v4;
  _TtC7remindd31RDCoreDataCoreSpotlightDelegate *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1001698BC(v4);

  return v6;
}

+ (void)deleteAllIndicesIfVersionOutdatedWithCompletionHandler:(id)a3
{
  uint64_t (*v3)();
  uint64_t v4;

  v3 = (uint64_t (*)())_Block_copy(a3);
  if (v3)
  {
    v4 = swift_allocObject(&unk_1007E7288, 24, 7);
    *(_QWORD *)(v4 + 16) = v3;
    v3 = sub_100119B24;
  }
  else
  {
    v4 = 0;
  }
  sub_10016E994((void (*)(_QWORD))v3, v4);
  sub_1000A5C24((uint64_t)v3, v4);
}

- (void)deleteAllIndicesWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC7remindd31RDCoreDataCoreSpotlightDelegate *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1007E7260, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_10016DDFC((uint64_t)sub_10011701C, v5);

  swift_release(v5);
}

- (void)reindexAllSearchableItemsWithAcknowledgementHandler:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _TtC7remindd31RDCoreDataCoreSpotlightDelegate *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_1007E7238, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_100119C4C;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_10016DF9C((uint64_t)v7, v6);
  sub_1000A5C24((uint64_t)v7, v6);

}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3 acknowledgementHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC7remindd31RDCoreDataCoreSpotlightDelegate *v9;

  v6 = _Block_copy(a4);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  if (v6)
  {
    v8 = swift_allocObject(&unk_1007E7210, 24, 7);
    *(_QWORD *)(v8 + 16) = v6;
    v6 = sub_1001185A4;
  }
  else
  {
    v8 = 0;
  }
  v9 = self;
  sub_10016E158(v7, (uint64_t)v6, v8);
  sub_1000A5C24((uint64_t)v6, v8);

  swift_bridgeObjectRelease();
}

- (BOOL)shouldStart
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC7remindd31RDCoreDataCoreSpotlightDelegate_shouldStart);
}

- (void)setShouldStart:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC7remindd31RDCoreDataCoreSpotlightDelegate_shouldStart) = a3;
}

- (id)initForStoreWithDescription:(id)a3 coordinator:(id)a4
{
  objc_super v7;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC7remindd31RDCoreDataCoreSpotlightDelegate____lazy_storage___contactStore) = 0;
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC7remindd31RDCoreDataCoreSpotlightDelegate_shouldStart) = 1;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RDCoreDataCoreSpotlightDelegate();
  return -[RDCoreDataCoreSpotlightDelegate initForStoreWithDescription:coordinator:](&v7, "initForStoreWithDescription:coordinator:", a3, a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7remindd31RDCoreDataCoreSpotlightDelegate____lazy_storage___contactStore));
}

@end
