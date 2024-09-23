@implementation JSCookie

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_56024((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore8JSCookie_originURL, &qword_14AED20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_56024((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore8JSCookie_commentURL, &qword_14AED20);
  swift_bridgeObjectRelease();
  sub_56024((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore8JSCookie_expirationDate, (uint64_t *)&unk_14AD5F0);
}

@end
