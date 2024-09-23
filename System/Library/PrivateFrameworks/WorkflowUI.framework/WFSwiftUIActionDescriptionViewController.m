@implementation WFSwiftUIActionDescriptionViewController

- (WFSwiftUIActionDescriptionViewControllerDelegate)delegate
{
  sub_2202690E4();
}

- (void)setDelegate:(id)a3
{
  WFSwiftUIActionDescriptionViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_220269140();

}

- (WFSwiftUIActionDescriptionViewController)initWithAction:(id)a3
{
  return (WFSwiftUIActionDescriptionViewController *)sub_220269170((uint64_t)a3);
}

- (WFSwiftUIActionDescriptionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2202691F0();
}

- (void)viewDidLoad
{
  WFSwiftUIActionDescriptionViewController *v2;

  v2 = self;
  sub_220269270();

}

- (void)appendAction:(id)a3
{
  id v4;
  WFSwiftUIActionDescriptionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2202694EC((uint64_t)v4);

}

- (WFSwiftUIActionDescriptionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  v5 = a4;
  sub_220269590();
}

- (void).cxx_destruct
{

  sub_2200A0118((uint64_t)self + OBJC_IVAR___WFSwiftUIActionDescriptionViewController_delegate);
}

@end
