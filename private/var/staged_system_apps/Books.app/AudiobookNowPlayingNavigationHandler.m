@implementation AudiobookNowPlayingNavigationHandler

- (_TtC5Books36AudiobookNowPlayingNavigationHandler)init
{
  char *v3;
  objc_super v5;

  v3 = (char *)self + OBJC_IVAR____TtC5Books36AudiobookNowPlayingNavigationHandler_delegate;
  *((_QWORD *)v3 + 1) = 0;
  swift_unknownObjectWeakInit(v3, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC5Books36AudiobookNowPlayingNavigationHandler_viewController, 0);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AudiobookNowPlayingNavigationHandler();
  return -[AudiobookNowPlayingNavigationHandler init](&v5, "init");
}

- (void).cxx_destruct
{
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books36AudiobookNowPlayingNavigationHandler_delegate);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books36AudiobookNowPlayingNavigationHandler_viewController);
}

@end
