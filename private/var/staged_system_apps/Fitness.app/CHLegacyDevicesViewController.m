@implementation CHLegacyDevicesViewController

- (CHLegacyDevicesViewController)initWithFitnessAppContext:(id)a3
{
  return (CHLegacyDevicesViewController *)sub_100570980((char *)a3);
}

- (CHLegacyDevicesViewController)initWithCoder:(id)a3
{
  id v4;
  CHLegacyDevicesViewController *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CHLegacyDevicesViewController_hostingViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CHLegacyDevicesViewController_subView) = 0;
  v4 = a3;

  result = (CHLegacyDevicesViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/LegacyDevicesViewController.swift", 44, 2, 35, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  CHLegacyDevicesViewController *v2;

  v2 = self;
  sub_100570DB4();

}

- (void)doneTapped
{
  -[CHLegacyDevicesViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (CHLegacyDevicesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  CHLegacyDevicesViewController *result;

  v4 = a4;
  result = (CHLegacyDevicesViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.LegacyDevicesViewController", 38, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHLegacyDevicesViewController_hostingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHLegacyDevicesViewController_cloudDeviceProvider));

}

@end
