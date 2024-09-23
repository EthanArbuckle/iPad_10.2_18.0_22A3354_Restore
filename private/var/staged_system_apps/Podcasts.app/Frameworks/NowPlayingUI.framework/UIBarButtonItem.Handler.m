@implementation UIBarButtonItem.Handler

- (void)handleBarButtonAction:(id)a3
{
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  _TtCE12NowPlayingUICSo15UIBarButtonItemP33_3C2750B9C1FB5BBBDC498E18BB98C28C7Handler *v7;

  if (a3)
  {
    v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                        + OBJC_IVAR____TtCE12NowPlayingUICSo15UIBarButtonItemP33_3C2750B9C1FB5BBBDC498E18BB98C28C7Handler__handler);
    v7 = self;
    swift_unknownObjectRetain(a3);
    v5 = objc_opt_self(UIBarButtonItem);
    v6 = swift_dynamicCastObjCClassUnconditional(a3, v5, 0, 0, 0);
    v4(v6);
    swift_unknownObjectRelease(a3);

  }
  else
  {
    __break(1u);
  }
}

- (_TtCE12NowPlayingUICSo15UIBarButtonItemP33_3C2750B9C1FB5BBBDC498E18BB98C28C7Handler)init
{
  _TtCE12NowPlayingUICSo15UIBarButtonItemP33_3C2750B9C1FB5BBBDC498E18BB98C28C7Handler *result;

  result = (_TtCE12NowPlayingUICSo15UIBarButtonItemP33_3C2750B9C1FB5BBBDC498E18BB98C28C7Handler *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.Handler", 20, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->_handler[OBJC_IVAR____TtCE12NowPlayingUICSo15UIBarButtonItemP33_3C2750B9C1FB5BBBDC498E18BB98C28C7Handler__handler]);
}

@end
