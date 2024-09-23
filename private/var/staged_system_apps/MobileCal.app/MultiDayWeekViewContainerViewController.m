@implementation MultiDayWeekViewContainerViewController

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MultiDayWeekViewContainerViewController;
  -[MainViewControllerContainer viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MultiDayWeekViewContainerViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setTitle:", 0);

}

- (id)currentChildViewController
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MultiDayWeekViewContainerViewController;
  v2 = -[WeekViewContainerViewController currentChildViewController](&v4, "currentChildViewController");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)childViewControllerForCompactWidthRegularHeight
{
  void *v3;
  MultiDayWeekViewController *v4;
  void *v5;
  void *v6;
  LargeWeekViewController *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = *(LargeWeekViewController **)((char *)&self->super._regularController + 1);
  if (!v3)
  {
    v4 = [MultiDayWeekViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
    v7 = -[MultiDayWeekViewController initWithModel:window:](v4, "initWithModel:window:", v5, v6);
    v8 = *(LargeWeekViewController **)((char *)&self->super._regularController + 1);
    *(LargeWeekViewController **)((char *)&self->super._regularController + 1) = v7;

    v9 = *(LargeWeekViewController **)((char *)&self->super._regularController + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MultiDayWeekViewContainerViewController navigationController](self, "navigationController"));
    objc_msgSend(v9, "setDelegate:", v10);

    v3 = *(LargeWeekViewController **)((char *)&self->super._regularController + 1);
  }
  return v3;
}

- (id)pushedNextLevelMainViewControllerContainerAnimated:(BOOL)a3
{
  return 0;
}

- (BOOL)representsDayInViewHierarchy
{
  return 1;
}

- (Class)childViewControllerClassForTraits:(id)a3
{
  return (Class)objc_opt_class(MultiDayWeekViewController);
}

- (MultiDayWeekViewController)multiDayController
{
  return *(MultiDayWeekViewController **)((char *)&self->super._regularController + 1);
}

- (void)setMultiDayController:(id)a3
{
  objc_storeStrong((id *)((char *)&self->super._regularController + 1), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->super._regularController + 1), 0);
}

@end
