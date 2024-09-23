@implementation CDMutableCloudSyncVersions

- (NSString)description
{
  _TtC19EngagementCollector26CDMutableCloudSyncVersions *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1D6FC();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC19EngagementCollector26CDMutableCloudSyncVersions *v5;

  v4 = a3;
  v5 = self;
  sub_1DA1C(v4);

}

- (_TtC19EngagementCollector26CDMutableCloudSyncVersions)initWithCoder:(id)a3
{
  return (_TtC19EngagementCollector26CDMutableCloudSyncVersions *)CDMutableCloudSyncVersions.init(coder:)(a3);
}

- (_TtC19EngagementCollector26CDMutableCloudSyncVersions)init
{
  _TtC19EngagementCollector26CDMutableCloudSyncVersions *result;

  result = (_TtC19EngagementCollector26CDMutableCloudSyncVersions *)_swift_stdlib_reportUnimplementedInitializer("EngagementCollector.CDMutableCloudSyncVersions", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->dataType[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_dataType]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken));
}

@end
