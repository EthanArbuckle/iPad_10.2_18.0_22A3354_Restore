@implementation DisplayLinkHandler

- (void)handleDisplayLinkFired:(id)a3
{
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  _TtC12NowPlayingUIP33_D101EDA0648CD2CFE5435C114DF7055118DisplayLinkHandler *v7;

  if (a3)
  {
    v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                        + OBJC_IVAR____TtC12NowPlayingUIP33_D101EDA0648CD2CFE5435C114DF7055118DisplayLinkHandler__handler);
    v7 = self;
    swift_unknownObjectRetain(a3);
    v5 = objc_opt_self(CADisplayLink);
    v6 = swift_dynamicCastObjCClassUnconditional(a3, v5, 0, 0, 0);
    v4(v6);
    swift_unknownObjectRelease(a3);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC12NowPlayingUIP33_D101EDA0648CD2CFE5435C114DF7055118DisplayLinkHandler)init
{
  _TtC12NowPlayingUIP33_D101EDA0648CD2CFE5435C114DF7055118DisplayLinkHandler *result;

  result = (_TtC12NowPlayingUIP33_D101EDA0648CD2CFE5435C114DF7055118DisplayLinkHandler *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.DisplayLinkHandler", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->_handler[OBJC_IVAR____TtC12NowPlayingUIP33_D101EDA0648CD2CFE5435C114DF7055118DisplayLinkHandler__handler]);
}

@end
