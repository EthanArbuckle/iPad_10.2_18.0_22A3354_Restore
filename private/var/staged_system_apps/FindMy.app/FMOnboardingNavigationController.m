@implementation FMOnboardingNavigationController

- (_TtC6FindMy32FMOnboardingNavigationController)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC6FindMy32FMOnboardingNavigationController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMy32FMOnboardingNavigationController_conditionSubscription) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC6FindMy32FMOnboardingNavigationController_isDissmissable) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC6FindMy32FMOnboardingNavigationController_onboardingDelegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v6 = a3;

  result = (_TtC6FindMy32FMOnboardingNavigationController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMOnboardingNavigationController.swift", 45, 2, 73, 0);
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy32FMOnboardingNavigationController *v4;

  v4 = self;
  sub_10027D3D4(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy32FMOnboardingNavigationController *v4;

  v4 = self;
  sub_10027D57C(a3);

}

- (_TtC6FindMy32FMOnboardingNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC6FindMy32FMOnboardingNavigationController *result;

  result = (_TtC6FindMy32FMOnboardingNavigationController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMOnboardingNavigationController", 39, "init(navigationBarClass:toolbarClass:)", 38, 0);
  __break(1u);
  return result;
}

- (_TtC6FindMy32FMOnboardingNavigationController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC6FindMy32FMOnboardingNavigationController *result;

  v3 = a3;
  result = (_TtC6FindMy32FMOnboardingNavigationController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMOnboardingNavigationController", 39, "init(rootViewController:)", 25, 0);
  __break(1u);
  return result;
}

- (_TtC6FindMy32FMOnboardingNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy32FMOnboardingNavigationController *result;

  v4 = a4;
  result = (_TtC6FindMy32FMOnboardingNavigationController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMOnboardingNavigationController", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy32FMOnboardingNavigationController_mediator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMOnboardingNavigationController_noveltyViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMOnboardingNavigationController_notificationAuthViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMOnboardingNavigationController_pageViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy32FMOnboardingNavigationController_conditionSubscription));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy32FMOnboardingNavigationController_onboardingDelegate);
}

@end
