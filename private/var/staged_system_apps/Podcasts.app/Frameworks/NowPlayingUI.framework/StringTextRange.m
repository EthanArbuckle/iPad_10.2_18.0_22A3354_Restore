@implementation StringTextRange

- (UITextPosition)start
{
  return (UITextPosition *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                   + OBJC_IVAR____TtC12NowPlayingUI15StringTextRange_startPosition));
}

- (UITextPosition)end
{
  return (UITextPosition *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                   + OBJC_IVAR____TtC12NowPlayingUI15StringTextRange_endPosition));
}

- (NSString)description
{
  _TtC12NowPlayingUI15StringTextRange *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10C3AC();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC12NowPlayingUI15StringTextRange)init
{
  _TtC12NowPlayingUI15StringTextRange *result;

  result = (_TtC12NowPlayingUI15StringTextRange *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.StringTextRange", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
