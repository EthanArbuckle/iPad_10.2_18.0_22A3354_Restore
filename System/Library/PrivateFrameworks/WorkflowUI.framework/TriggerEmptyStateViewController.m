@implementation TriggerEmptyStateViewController

- (void)loadView
{
  _TtC10WorkflowUI31TriggerEmptyStateViewController *v2;

  v2 = self;
  TriggerEmptyStateViewController.loadView()();

}

- (_TtC10WorkflowUI31TriggerEmptyStateViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC10WorkflowUI31TriggerEmptyStateViewController *)TriggerEmptyStateViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC10WorkflowUI31TriggerEmptyStateViewController)initWithCoder:(id)a3
{
  return (_TtC10WorkflowUI31TriggerEmptyStateViewController *)TriggerEmptyStateViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_2200A0118((uint64_t)self + OBJC_IVAR____TtC10WorkflowUI31TriggerEmptyStateViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI31TriggerEmptyStateViewController_hostingController));
}

@end
