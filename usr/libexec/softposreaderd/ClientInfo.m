@implementation ClientInfo

- (NSString)debugDescription
{
  _TtC14softposreaderd10ClientInfo *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10000672C();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC14softposreaderd10ClientInfo)init
{
  _TtC14softposreaderd10ClientInfo *result;

  result = (_TtC14softposreaderd10ClientInfo *)_swift_stdlib_reportUnimplementedInitializer("softposreaderd.ClientInfo", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100007858((uint64_t)self + OBJC_IVAR____TtC14softposreaderd10ClientInfo_clientID);
}

@end
