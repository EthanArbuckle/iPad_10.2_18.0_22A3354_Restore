@implementation JSCookie

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore8JSCookie_originURL, &qword_10119E460);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore8JSCookie_commentURL, &qword_10119E460);
  swift_bridgeObjectRelease();
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore8JSCookie_expirationDate, (uint64_t *)&unk_1011A30A0);
}

@end
