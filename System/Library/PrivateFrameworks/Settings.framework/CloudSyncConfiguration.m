@implementation CloudSyncConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC8Settings22CloudSyncConfiguration *v5;

  v4 = a3;
  v5 = self;
  sub_1DB452534(v4);

}

- (_TtC8Settings22CloudSyncConfiguration)initWithCoder:(id)a3
{
  id v3;
  _TtC8Settings22CloudSyncConfiguration *v4;

  v3 = a3;
  v4 = (_TtC8Settings22CloudSyncConfiguration *)sub_1DB452DFC(v3);

  return v4;
}

- (_TtC8Settings22CloudSyncConfiguration)init
{
  _TtC8Settings22CloudSyncConfiguration *result;

  result = (_TtC8Settings22CloudSyncConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DB45329C((uint64_t)self + OBJC_IVAR____TtC8Settings22CloudSyncConfiguration_redirectURL);
  swift_bridgeObjectRelease();
}

@end
