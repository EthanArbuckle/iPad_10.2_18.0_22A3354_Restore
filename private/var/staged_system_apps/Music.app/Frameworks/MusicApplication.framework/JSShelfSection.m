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
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_64880((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore14JSShelfSection_delegate);
}

@end
