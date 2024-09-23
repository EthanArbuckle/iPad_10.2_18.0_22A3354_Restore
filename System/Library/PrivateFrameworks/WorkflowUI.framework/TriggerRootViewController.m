@implementation TriggerRootViewController

- (_TtC10WorkflowUI25TriggerRootViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2201B6F08();
}

- (void)viewDidLoad
{
  _TtC10WorkflowUI25TriggerRootViewController *v2;

  v2 = self;
  TriggerRootViewController.viewDidLoad()();

}

- (void)startCreateNewPersonalAutomation
{
  _TtC10WorkflowUI25TriggerRootViewController *v2;

  v2 = self;
  TriggerRootViewController.startCreateNewPersonalAutomation()();

}

- (void)createAutomationCoordinatorDidCancel:(id)a3
{
  WFCreateAutomationCoordinator *v4;
  _TtC10WorkflowUI25TriggerRootViewController *v5;

  v4 = (WFCreateAutomationCoordinator *)a3;
  v5 = self;
  TriggerRootViewController.createAutomationCoordinatorDidCancel(_:)(v4);

}

- (void)createAutomationCoordinatorDidFinish:(id)a3
{
  WFCreateAutomationCoordinator *v4;
  _TtC10WorkflowUI25TriggerRootViewController *v5;

  v4 = (WFCreateAutomationCoordinator *)a3;
  v5 = self;
  TriggerRootViewController.createAutomationCoordinatorDidFinish(_:)(v4);

}

- (void)dataSourceDidUpdateTriggers:(id)a3
{
  id v4;
  _TtC10WorkflowUI25TriggerRootViewController *v5;

  v4 = a3;
  v5 = self;
  TriggerRootViewController.dataSourceDidUpdateTriggers(_:)((WFAutomationTriggerDataSource *)v5);

}

- (_TtC10WorkflowUI25TriggerRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  v5 = a4;
  TriggerRootViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI25TriggerRootViewController_database));
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI25TriggerRootViewController_homeManager);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI25TriggerRootViewController_createAutomationController);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI25TriggerRootViewController____lazy_storage___automationListViewController);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI25TriggerRootViewController____lazy_storage___emptyStateViewController);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI25TriggerRootViewController____lazy_storage___dataSource));
}

@end
