@implementation CHDivingDetailChartDetailViewController

- (CHDivingDetailChartDetailViewController)initWithDataCalculator:(id)a3
{
  uint64_t v5;
  id v6;
  objc_class *v7;
  CHDivingDetailChartDetailViewController *v8;
  objc_class *v9;
  CHDivingDetailChartDetailViewController *v10;
  objc_super v12;

  v5 = OBJC_IVAR___CHDivingDetailChartDetailViewController_contentView;
  v6 = objc_allocWithZone((Class)UIView);
  v7 = (objc_class *)a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  *(Class *)((char *)&v8->super.super.super.isa + OBJC_IVAR___CHDivingDetailChartDetailViewController_hostingController) = 0;
  *(Class *)((char *)&v8->super.super.super.isa + OBJC_IVAR___CHDivingDetailChartDetailViewController_dataCalculator) = v7;
  v9 = v7;

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for DivingDetailChartDetailViewController();
  v10 = -[CHDivingDetailChartDetailViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0, 0);

  return v10;
}

- (CHDivingDetailChartDetailViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  CHDivingDetailChartDetailViewController *result;

  v5 = OBJC_IVAR___CHDivingDetailChartDetailViewController_contentView;
  v6 = objc_allocWithZone((Class)UIView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CHDivingDetailChartDetailViewController_hostingController) = 0;

  result = (CHDivingDetailChartDetailViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/DivingDetailChartDetailViewController.swift", 54, 2, 34, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  CHDivingDetailChartDetailViewController *v2;

  v2 = self;
  sub_1002FD944();

}

- (void)viewWillAppear:(BOOL)a3
{
  CHDivingDetailChartDetailViewController *v4;

  v4 = self;
  sub_1002FDC88(a3);

}

- (void)close
{
  -[CHDivingDetailChartDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (CHDivingDetailChartDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  CHDivingDetailChartDetailViewController *result;

  v4 = a4;
  result = (CHDivingDetailChartDetailViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.DivingDetailChartDetailViewController", 48, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHDivingDetailChartDetailViewController_dataCalculator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHDivingDetailChartDetailViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHDivingDetailChartDetailViewController_hostingController));
}

@end
