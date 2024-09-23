@implementation RDStagedLightweightCoreDataMigrationCoordinator

- (BOOL)shouldPerformStagedLightweightMigrationForStoreAtStoreURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC7remindd47RDStagedLightweightCoreDataMigrationCoordinator *v9;
  uint64_t v11;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  LOBYTE(a3) = sub_10032C2DC((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return a3 & 1;
}

- (BOOL)performStagedLightweightMigrationForStoreAtStoreURL:(id)a3 persistentStoreDescriptionOptionsOverride:(id)a4 postMigrationDataUpdatesTransactionAuthor:(id)a5 error:(id *)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _TtC7remindd47RDStagedLightweightCoreDataMigrationCoordinator *v17;
  uint64_t v19;

  v10 = type metadata accessor for URL(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (a4)
  {
    v14 = sub_1000151B0(0, (unint64_t *)&qword_100838010, NSObject_ptr);
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, v14, &protocol witness table for String);
  }
  if (a5)
  {
    a5 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v16 = v15;
  }
  else
  {
    v16 = 0;
  }
  v17 = self;
  sub_10032C890((uint64_t)v13, (uint64_t)a4, a5, v16);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)cloneStoreAtSourceStoreURL:(id)a3 destinationStoreURL:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  void (*v14)(_BYTE *, uint64_t);
  _BYTE v16[16];

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v16[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v11);
  v13 = &v16[-v12];
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  sub_1003305F4((uint64_t)v13, (uint64_t)v10);
  v14 = *(void (**)(_BYTE *, uint64_t))(v8 + 8);
  v14(v10, v7);
  v14(v13, v7);
  return 1;
}

+ (id)stagedMigrationsInfoForPersistentStoreAt:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __n128 v8;
  uint64_t v9;
  Class isa;
  uint64_t v12;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = sub_100331044((uint64_t)v7, v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (!v9)
    return 0;
  sub_10001A630((uint64_t *)&unk_1008473E0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (_TtC7remindd47RDStagedLightweightCoreDataMigrationCoordinator)init
{
  _TtC7remindd47RDStagedLightweightCoreDataMigrationCoordinator *result;

  result = (_TtC7remindd47RDStagedLightweightCoreDataMigrationCoordinator *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDStagedLightweightCoreDataMigrationCoordinator", 55, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->modelName[OBJC_IVAR____TtC7remindd47RDStagedLightweightCoreDataMigrationCoordinator_modelName]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7remindd47RDStagedLightweightCoreDataMigrationCoordinator_bundle));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7remindd47RDStagedLightweightCoreDataMigrationCoordinator_allModelVersionIdentifiers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7remindd47RDStagedLightweightCoreDataMigrationCoordinator_postMigrationDataUpdateByModelVersionIdentifier));
}

+ (id)createCoordinatorForMigratingReminderDataWithClientNamesOfREMCDChangeTrackingStateWhichShouldNotBeResetUponPersistentHistoryTruncation:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (a3)
    v3 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, &protocol witness table for String);
  else
    v3 = 0;
  sub_10053EEA8(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

@end
