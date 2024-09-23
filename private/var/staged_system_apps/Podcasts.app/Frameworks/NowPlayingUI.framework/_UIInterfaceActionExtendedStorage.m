@implementation _UIInterfaceActionExtendedStorage

- (_TtC12NowPlayingUI33_UIInterfaceActionExtendedStorage)init
{
  _QWORD *v2;
  _QWORD *v3;
  objc_super v5;

  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC12NowPlayingUI33_UIInterfaceActionExtendedStorage__didDismissHandler);
  *v2 = 0;
  v2[1] = 0;
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC12NowPlayingUI33_UIInterfaceActionExtendedStorage__customHandler);
  *v3 = 0;
  v3[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12NowPlayingUI33_UIInterfaceActionExtendedStorage__configuration) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _UIInterfaceActionExtendedStorage();
  return -[_UIInterfaceActionExtendedStorage init](&v5, "init");
}

- (void).cxx_destruct
{
  sub_145A0(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC12NowPlayingUI33_UIInterfaceActionExtendedStorage__didDismissHandler), *(_QWORD *)&self->_didDismissHandler[OBJC_IVAR____TtC12NowPlayingUI33_UIInterfaceActionExtendedStorage__didDismissHandler]);
  sub_145A0(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC12NowPlayingUI33_UIInterfaceActionExtendedStorage__customHandler), *(_QWORD *)&self->_didDismissHandler[OBJC_IVAR____TtC12NowPlayingUI33_UIInterfaceActionExtendedStorage__customHandler]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI33_UIInterfaceActionExtendedStorage__configuration));
}

@end
