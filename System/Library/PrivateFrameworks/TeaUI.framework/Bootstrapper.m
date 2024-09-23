@implementation Bootstrapper

- (void)startBootstrappingWithWindow:(id)a3 shouldOnboard:(BOOL)a4
{
  UIWindow *v6;
  _TtC5TeaUI12Bootstrapper *v7;

  v6 = (UIWindow *)a3;
  v7 = self;
  Bootstrapper.startBootstrapping(window:shouldOnboard:)(v6, a4);

}

- (void)startBootstrappingWithWindow:(id)a3 shouldOnboard:(BOOL)a4 shouldCollapseSidebar:(BOOL)a5
{
  UIWindow *v8;
  _TtC5TeaUI12Bootstrapper *v9;

  v8 = (UIWindow *)a3;
  v9 = self;
  Bootstrapper.startBootstrapping(window:shouldOnboard:shouldCollapseSidebar:)(v8, a4, a5);

}

- (void)afterBootstrapOnQueue:(id)a3 runBootstrapCallbackBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC5TeaUI12Bootstrapper *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  Bootstrapper.afterBootstrap(on:run:)((uint64_t)v8, (uint64_t)sub_1B1456244, v7);

  swift_release();
}

- (_TtC5TeaUI12Bootstrapper)init
{
  Bootstrapper.init()();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUI12Bootstrapper_mainViewControllerFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUI12Bootstrapper_onboardingViewControllerFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUI12Bootstrapper_onboardingViewDismissalAnimator);
  swift_release();

}

@end
