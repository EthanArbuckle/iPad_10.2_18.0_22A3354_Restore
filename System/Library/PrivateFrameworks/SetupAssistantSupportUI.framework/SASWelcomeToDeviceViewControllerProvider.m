@implementation SASWelcomeToDeviceViewControllerProvider

- (UIViewController)viewController
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___SASWelcomeToDeviceViewControllerProvider_viewController);
  swift_beginAccess();
  return (UIViewController *)*v2;
}

- (void)setViewController:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___SASWelcomeToDeviceViewControllerProvider_viewController);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (SASWelcomeToDeviceViewControllerProvider)initWithText:(id)a3 finalTextColor:(id)a4 onAnimationCompleteHandler:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  SASWelcomeToDeviceViewControllerProvider *v12;

  v6 = _Block_copy(a5);
  v7 = sub_245DDB738();
  v9 = v8;
  if (v6)
  {
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v6;
    v6 = sub_245DD5C94;
  }
  else
  {
    v10 = 0;
  }
  v11 = a4;
  v12 = (SASWelcomeToDeviceViewControllerProvider *)sub_245DD5AB4(v7, v9, v11, (uint64_t)v6, v10);
  sub_245DD3954((uint64_t)v6);

  return v12;
}

- (void)startAnimation
{
  void (*v2)(void);
  SASWelcomeToDeviceViewControllerProvider *v3;

  v2 = *(void (**)(void))(**(_QWORD **)((char *)&self->super.isa
                                      + OBJC_IVAR___SASWelcomeToDeviceViewControllerProvider_viewModel)
                        + 664);
  v3 = self;
  v2();

}

- (void)stopAnimation
{
  void (*v2)(void);
  SASWelcomeToDeviceViewControllerProvider *v3;

  v2 = *(void (**)(void))(**(_QWORD **)((char *)&self->super.isa
                                      + OBJC_IVAR___SASWelcomeToDeviceViewControllerProvider_viewModel)
                        + 696);
  v3 = self;
  v2();

}

- (SASWelcomeToDeviceViewControllerProvider)init
{
  SASWelcomeToDeviceViewControllerProvider *result;

  result = (SASWelcomeToDeviceViewControllerProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

}

@end
