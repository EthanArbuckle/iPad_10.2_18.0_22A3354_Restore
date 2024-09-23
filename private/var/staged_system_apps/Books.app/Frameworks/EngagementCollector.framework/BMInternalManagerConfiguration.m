@implementation BMInternalManagerConfiguration

- (BMInternalManagerConfiguration)initWithDirectory:(id)a3 shouldRunUpdatesOnSchedule:(BOOL)a4 shouldPurgeOutdatedData:(BOOL)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  objc_class *v13;
  BMInternalManagerConfiguration *v14;
  objc_super v16;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)self + OBJC_IVAR___BMInternalManagerConfiguration_localStorageDirectory, v12, v9);
  *((_BYTE *)&self->super.isa + OBJC_IVAR___BMInternalManagerConfiguration_shouldRunUpdatesOnSchedule) = a4;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___BMInternalManagerConfiguration_shouldPurgeOutdatedData) = a5;
  v13 = (objc_class *)type metadata accessor for ManagerConfiguration(0);
  v16.receiver = self;
  v16.super_class = v13;
  v14 = -[BMInternalManagerConfiguration init](&v16, "init");
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v14;
}

- (NSString)description
{
  BMInternalManagerConfiguration *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10FF0();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (BMInternalManagerConfiguration)init
{
  BMInternalManagerConfiguration *result;

  result = (BMInternalManagerConfiguration *)_swift_stdlib_reportUnimplementedInitializer("EngagementCollector.ManagerConfiguration", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___BMInternalManagerConfiguration_localStorageDirectory;
  v3 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
