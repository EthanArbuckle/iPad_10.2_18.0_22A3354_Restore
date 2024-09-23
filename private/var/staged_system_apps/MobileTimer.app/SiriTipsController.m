@implementation SiriTipsController

- (_TtP11MobileTimer26SiriTipsControllerDelegate_)delegate
{
  _QWORD *v2;
  _BYTE v4[24];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_delegate);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_delegate, v4, 0, 0);
  return (_TtP11MobileTimer26SiriTipsControllerDelegate_ *)(id)swift_unknownObjectRetain(*v2);
}

- (void)setDelegate:(id)a3
{
  id *v4;
  id v5;
  char v6[24];

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_delegate);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_delegate, v6, 1, 0);
  v5 = *v4;
  *v4 = a3;
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRelease(v5);
}

- (void)dealloc
{
  void (*v2)(void);
  _TtC11MobileTimer18SiriTipsController *v3;
  objc_super v4;

  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xD8);
  v3 = self;
  v2();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for SiriTipsController();
  -[SiriTipsController dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_delegate));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_checkForSiriTipsTask));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_updateTipStatusTask));
}

- (void)checkForSiriTips
{
  _TtC11MobileTimer18SiriTipsController *v2;

  v2 = self;
  sub_10005BB24();

}

- (void)cancel
{
  _TtC11MobileTimer18SiriTipsController *v2;

  v2 = self;
  sub_10005D9A0();

}

- (_TtC11MobileTimer18SiriTipsController)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_delegate) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_tipView) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_checkForSiriTipsTask) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_updateTipStatusTask) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SiriTipsController();
  return -[SiriTipsController init](&v3, "init");
}

@end
