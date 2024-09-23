@implementation JSCookieStorage

- (void)handleCookieDidExpire:(id)a3
{
  id v4;
  _TtC11MusicJSCore15JSCookieStorage *v5;

  v4 = a3;
  v5 = self;
  sub_F22DD0();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore15JSCookieStorage_defaultURL;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC11MusicJSCore15JSCookieStorage_indexedCookies));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC11MusicJSCore15JSCookieStorage_invalidationTimers));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC11MusicJSCore15JSCookieStorage_commonCookiesChangedNotificationObserver));
}

@end
