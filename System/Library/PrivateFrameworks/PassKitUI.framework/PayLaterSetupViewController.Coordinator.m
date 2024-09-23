@implementation PayLaterSetupViewController.Coordinator

- (void)payLaterSetupFlowController:(id)a3 didSelect:(id)a4
{
  void (*v6)(id);
  id v7;
  id v8;
  _TtCV9PassKitUI27PayLaterSetupViewController11Coordinator *v9;

  v6 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtCV9PassKitUI27PayLaterSetupViewController11Coordinator_didSelectAction);
  v7 = a3;
  v8 = a4;
  v9 = self;
  v6(a4);

}

- (void)payLaterSetupFlowController:(id)a3 didTerminateApplicationState:(unint64_t)a4
{
  void (*v4)(_QWORD);
  BOOL v5;
  id v7;
  _TtCV9PassKitUI27PayLaterSetupViewController11Coordinator *v8;

  v4 = *(void (**)(_QWORD))((char *)&self->super.isa
                                     + OBJC_IVAR____TtCV9PassKitUI27PayLaterSetupViewController11Coordinator_changeFundingModeTabAction);
  if (v4)
    v5 = a4 == 7;
  else
    v5 = 0;
  if (v5
    && !*(Class *)((char *)&self->super.isa
                 + OBJC_IVAR____TtCV9PassKitUI27PayLaterSetupViewController11Coordinator_controllerContext))
  {
    v7 = a3;
    v8 = self;
    sub_19D1A9EC4((uint64_t)v4);
    v4(0);
    sub_19D1A9F60((uint64_t)v4);

  }
}

- (void)payLaterSetupFlowControllerDidFinish:(id)a3
{
  id v4;
  _TtCV9PassKitUI27PayLaterSetupViewController11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_19D879AE4();

}

- (_TtCV9PassKitUI27PayLaterSetupViewController11Coordinator)init
{
  _TtCV9PassKitUI27PayLaterSetupViewController11Coordinator *result;

  result = (_TtCV9PassKitUI27PayLaterSetupViewController11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  uint64_t v4;

  v3 = *(void **)&self->parent[OBJC_IVAR____TtCV9PassKitUI27PayLaterSetupViewController11Coordinator_parent];
  v4 = *(_QWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI27PayLaterSetupViewController11Coordinator_parent + 24];
  swift_release();

  swift_release();
  sub_19D1A9F60(v4);
  swift_release();
  swift_release();
  sub_19D1A9F60(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV9PassKitUI27PayLaterSetupViewController11Coordinator_changeFundingModeTabAction));
  swift_release();
}

@end
