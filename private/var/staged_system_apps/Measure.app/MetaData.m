@implementation MetaData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC7Measure8MetaData)initWithCoder:(id)a3
{
  return (_TtC7Measure8MetaData *)sub_1000843D8(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC7Measure8MetaData *v5;

  v4 = a3;
  v5 = self;
  sub_10008461C(v4);

}

- (NSString)description
{
  _TtC7Measure8MetaData *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100084094();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC7Measure8MetaData)init
{
  _TtC7Measure8MetaData *result;

  result = (_TtC7Measure8MetaData *)_swift_stdlib_reportUnimplementedInitializer("Measure.MetaData", 16, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->bundleIdentifier[OBJC_IVAR____TtC7Measure8MetaData_bundleIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->bundleIdentifier[OBJC_IVAR____TtC7Measure8MetaData_versionString]);
}

@end
