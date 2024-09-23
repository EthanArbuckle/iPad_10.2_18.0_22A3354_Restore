@implementation RAPDirectionsStepsTableViewController

+ (Class)dataSourceClass
{
  return (Class)objc_opt_class(RAPDirectionsStepsListDataSource, a2);
}

- (RAPDirectionsStepsTableViewController)init
{
  RAPDirectionsStepsTableViewController *v2;
  RAPDirectionsStepsTableViewController *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RAPDirectionsStepsTableViewController;
  v2 = -[DirectionsStepsTableViewController init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](v2, "dataSource"));
    objc_msgSend(v4, "setRapDelegate:", v3);

  }
  return v3;
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (BOOL)RAPDirectionsStepsList:(id)a3 shouldShowFlagForStep:(id)a4 listItem:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsStepsTableViewController instructionDelegate](self, "instructionDelegate"));
  LOBYTE(self) = objc_msgSend(v9, "viewController:shouldShowFlagForStep:listItem:", self, v8, v7);

  return (char)self;
}

- (RAPDirectionsStepsTableViewControllerDelegate)instructionDelegate
{
  return (RAPDirectionsStepsTableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_instructionDelegate);
}

- (void)setInstructionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_instructionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_instructionDelegate);
}

@end
