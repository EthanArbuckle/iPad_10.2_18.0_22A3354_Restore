@implementation RDStagedLightweightCoreDataMigrationCoordinator.BabysitTarget

- (id)waiterID
{
  _TtCC7remindd47RDStagedLightweightCoreDataMigrationCoordinatorP33_D88389F778BE955B340162F613733C4913BabysitTarget *v2;
  Swift::String v3;
  uint64_t v4;
  Swift::String v5;
  void *object;
  NSString v7;

  v2 = self;
  _StringGuts.grow(_:)(79);
  v3._object = (void *)0x80000001007006C0;
  v3._countAndFlagsBits = 0xD00000000000004DLL;
  String.append(_:)(v3);
  v5._countAndFlagsBits = URL.path.getter(v4);
  object = v5._object;
  String.append(_:)(v5);

  swift_bridgeObjectRelease(object);
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xE000000000000000);
  return v7;
}

- (_TtCC7remindd47RDStagedLightweightCoreDataMigrationCoordinatorP33_D88389F778BE955B340162F613733C4913BabysitTarget)init
{
  _TtCC7remindd47RDStagedLightweightCoreDataMigrationCoordinatorP33_D88389F778BE955B340162F613733C4913BabysitTarget *result;

  result = (_TtCC7remindd47RDStagedLightweightCoreDataMigrationCoordinatorP33_D88389F778BE955B340162F613733C4913BabysitTarget *)_swift_stdlib_reportUnimplementedInitializer("remindd.BabysitTarget", 21, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self
     + OBJC_IVAR____TtCC7remindd47RDStagedLightweightCoreDataMigrationCoordinatorP33_D88389F778BE955B340162F613733C4913BabysitTarget_storeURL;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->crashDetectedAnalyticsEventName[OBJC_IVAR____TtCC7remindd47RDStagedLightweightCoreDataMigrationCoordinatorP33_D88389F778BE955B340162F613733C4913BabysitTarget_crashDetectedAnalyticsEventName]);
}

@end
