@implementation PeopleLegacyResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC6People18PeopleLegacyResult)initWithCoder:(id)a3
{
  id v3;
  _TtC6People18PeopleLegacyResult *v4;

  v3 = a3;
  v4 = (_TtC6People18PeopleLegacyResult *)sub_1C06D9154();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC6People18PeopleLegacyResult *v5;

  v4 = a3;
  v5 = self;
  sub_1C06D8F10(v4);

}

- (_TtC6People18PeopleLegacyResult)init
{
  _TtC6People18PeopleLegacyResult *result;

  result = (_TtC6People18PeopleLegacyResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1C0690F90(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC6People18PeopleLegacyResult_data), *(_QWORD *)&self->bundleID[OBJC_IVAR____TtC6People18PeopleLegacyResult_data]);
}

@end
