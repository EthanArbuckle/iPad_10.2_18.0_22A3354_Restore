@implementation InitializationParameters

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC8Settings24InitializationParameters *v5;

  v4 = a3;
  v5 = self;
  sub_1DB476000(v4);

}

- (_TtC8Settings24InitializationParameters)initWithCoder:(id)a3
{
  id v3;
  _TtC8Settings24InitializationParameters *v4;

  v3 = a3;
  v4 = (_TtC8Settings24InitializationParameters *)sub_1DB47D7E4(v3);

  return v4;
}

- (NSString)description
{
  _TtC8Settings24InitializationParameters *v2;
  void *v3;

  v2 = self;
  sub_1DB47641C();

  v3 = (void *)sub_1DB4A1620();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC8Settings24InitializationParameters)init
{
  _TtC8Settings24InitializationParameters *result;

  result = (_TtC8Settings24InitializationParameters *)_swift_stdlib_reportUnimplementedInitializer();
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
