@implementation SettingsSearchItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  _TtC8Settings18SettingsSearchItem *v2;
  void *v3;

  v2 = self;
  SettingsSearchItem.description.getter();

  v3 = (void *)sub_1DB4A1620();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC8Settings18SettingsSearchItem *v5;

  v4 = a3;
  v5 = self;
  SettingsSearchItem.encode(with:)((NSCoder)v4);

}

- (_TtC8Settings18SettingsSearchItem)initWithCoder:(id)a3
{
  return (_TtC8Settings18SettingsSearchItem *)SettingsSearchItem.init(coder:)(a3);
}

- (_TtC8Settings18SettingsSearchItem)init
{
  _TtC8Settings18SettingsSearchItem *result;

  result = (_TtC8Settings18SettingsSearchItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
