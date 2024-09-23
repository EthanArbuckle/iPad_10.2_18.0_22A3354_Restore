@implementation JSShelfSection

- (NSString)description
{
  _TtC11MusicJSCore14JSShelfSection *v2;
  NSString v3;

  v2 = self;
  JSShelfSection.description.getter();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10013C71C((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore14JSShelfSection_delegate, v3);
}

@end
