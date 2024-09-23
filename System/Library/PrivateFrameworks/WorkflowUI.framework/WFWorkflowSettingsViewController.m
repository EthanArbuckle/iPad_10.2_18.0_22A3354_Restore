@implementation WFWorkflowSettingsViewController

- (WFWorkflowSettingsViewControllerDelegate)delegate
{
  return (WFWorkflowSettingsViewControllerDelegate *)(id)sub_2202227D8();
}

- (void)setDelegate:(id)a3
{
  WFWorkflowSettingsViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_220222868();

}

- (WFWorkflowSettingsViewController)initWithWorkflow:(id)a3 database:(id)a4 hideNavigationBar:(BOOL)a5
{
  return (WFWorkflowSettingsViewController *)WorkflowSettingsViewController.init(workflow:database:hideNavigationBar:)(a3, a4, a5);
}

- (WFWorkflowSettingsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  WorkflowSettingsViewController.init(coder:)();
}

- (void)viewDidLoad
{
  WFWorkflowSettingsViewController *v2;

  v2 = self;
  sub_220222C20();

}

- (WFWorkflowSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  v5 = a4;
  WorkflowSettingsViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{

  sub_2200A0118((uint64_t)self + OBJC_IVAR___WFWorkflowSettingsViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFWorkflowSettingsViewController_hostingController));
}

@end
