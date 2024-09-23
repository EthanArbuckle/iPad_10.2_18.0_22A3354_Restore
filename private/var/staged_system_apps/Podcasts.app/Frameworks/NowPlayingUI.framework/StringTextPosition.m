@implementation StringTextPosition

- (NSString)description
{
  unint64_t v2;
  NSString v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v6 = 0;
  v7 = 0xE000000000000000;
  v5 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12NowPlayingUI18StringTextPosition_position);
  _print_unlocked<A, B>(_:_:)(&v5, &v6, &type metadata for String.Index, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v2 = v7;
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (_TtC12NowPlayingUI18StringTextPosition)init
{
  _TtC12NowPlayingUI18StringTextPosition *result;

  result = (_TtC12NowPlayingUI18StringTextPosition *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.StringTextPosition", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
