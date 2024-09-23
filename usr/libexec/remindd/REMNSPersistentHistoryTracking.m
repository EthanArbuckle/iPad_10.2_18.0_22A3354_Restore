@implementation REMNSPersistentHistoryTracking

- (void)withManagedObjectContext:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC7remindd30REMNSPersistentHistoryTracking *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1007EA5F8, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_10021B1BC((uint64_t)sub_10021B6C0, v5);

  swift_release(v5);
}

- (id)_accountIdentifierForPersistenceStoreID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _TtC7remindd30REMNSPersistentHistoryTracking *v7;
  NSString v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v6 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC7remindd30REMNSPersistentHistoryTracking_storeController);
  v7 = self;
  v8 = String._bridgeToObjectiveC()();
  v9 = objc_msgSend(v6, "accountIdentifierForStoreID:", v8);

  if (v9)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v11 = v10;

    swift_bridgeObjectRelease(v5);
    v12 = String._bridgeToObjectiveC()();
    v5 = v11;
  }
  else
  {

    v12 = 0;
  }
  swift_bridgeObjectRelease(v5);
  return v12;
}

- (id)_persistenceStoreForAccountID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _TtC7remindd30REMNSPersistentHistoryTracking *v7;
  NSString v8;
  id v9;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v6 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC7remindd30REMNSPersistentHistoryTracking_storeController);
  v7 = self;
  v8 = String._bridgeToObjectiveC()();
  v9 = objc_msgSend(v6, "storeForAccountIdentifier:", v8);

  swift_bridgeObjectRelease(v5);
  return v9;
}

- (id)_persistenceStoresForAccountTypes:(id)a3
{
  void *v4;
  _TtC7remindd30REMNSPersistentHistoryTracking *v5;
  Class isa;
  id v7;
  unint64_t v8;
  Class v9;

  static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, &protocol witness table for AnyHashable);
  v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC7remindd30REMNSPersistentHistoryTracking_storeController);
  v5 = self;
  isa = Set._bridgeToObjectiveC()().super.isa;
  v7 = objc_msgSend(v4, "storesForAccountTypes:", isa);

  v8 = sub_10021B660();
  static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, v8);

  swift_bridgeObjectRelease();
  v9 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v9;
}

- (_TtC7remindd30REMNSPersistentHistoryTracking)init
{
  _TtC7remindd30REMNSPersistentHistoryTracking *result;

  result = (_TtC7remindd30REMNSPersistentHistoryTracking *)_swift_stdlib_reportUnimplementedInitializer("remindd.REMNSPersistentHistoryTracking", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7remindd30REMNSPersistentHistoryTracking_storeController));
}

@end
