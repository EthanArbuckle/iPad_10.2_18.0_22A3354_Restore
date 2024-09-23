@implementation DayViewContainerViewController

- (id)currentChildViewController
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DayViewContainerViewController;
  v2 = -[MainViewControllerContainer currentChildViewController](&v4, "currentChildViewController");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (Class)childViewControllerClassForTraits:(id)a3
{
  id v3;
  __objc2_class **v4;
  uint64_t v5;

  v3 = objc_msgSend(a3, "horizontalSizeClass");
  v4 = off_1001B13B0;
  if (v3 != (id)1)
    v4 = off_1001B1638;
  v5 = objc_opt_class(*v4);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v5);
}

- (id)childViewControllerForCompactWidthRegularHeight
{
  void *v3;
  void *v4;
  void *v5;
  CompactDayViewController *v6;
  void *v7;
  void *v8;
  CompactDayViewController *v9;
  void *v10;

  v3 = *(void **)(&self->super._animatingViewTransition + 1);
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedDate"));

    v6 = [CompactDayViewController alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
    v9 = -[DayViewController initWithDay:model:window:](v6, "initWithDay:model:window:", v5, v7, v8);
    v10 = *(void **)(&self->super._animatingViewTransition + 1);
    *(_QWORD *)(&self->super._animatingViewTransition + 1) = v9;

    v3 = *(void **)(&self->super._animatingViewTransition + 1);
  }
  return v3;
}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DayViewContainerViewController;
  -[DayViewContainerViewController viewIsAppearing:](&v8, "viewIsAppearing:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DayViewContainerViewController navigationController](self, "navigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationBar"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "standardAppearance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v6, "setShadowColor:", v7);

  objc_msgSend(v5, "setScrollEdgeAppearance:", v6);
}

- (id)childViewControllerForRegularWidthRegularHeight
{
  void *v3;
  void *v4;
  void *v5;
  LargeDayViewController *v6;
  void *v7;
  void *v8;
  CompactDayViewController *v9;
  void *v10;

  v3 = *(CompactDayViewController **)((char *)&self->_compactController + 1);
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedDate"));

    v6 = [LargeDayViewController alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
    v9 = -[LargeDayViewController initWithDay:model:window:](v6, "initWithDay:model:window:", v5, v7, v8);
    v10 = *(CompactDayViewController **)((char *)&self->_compactController + 1);
    *(CompactDayViewController **)((char *)&self->_compactController + 1) = v9;

    v3 = *(CompactDayViewController **)((char *)&self->_compactController + 1);
  }
  return v3;
}

- (BOOL)representsDayInViewHierarchy
{
  return 1;
}

- (CompactDayViewController)compactController
{
  return *(CompactDayViewController **)(&self->super._animatingViewTransition + 1);
}

- (void)setCompactController:(id)a3
{
  objc_storeStrong((id *)(&self->super._animatingViewTransition + 1), a3);
}

- (LargeDayViewController)regularController
{
  return *(LargeDayViewController **)((char *)&self->_compactController + 1);
}

- (void)setRegularController:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_compactController + 1), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_compactController + 1), 0);
  objc_storeStrong((id *)(&self->super._animatingViewTransition + 1), 0);
}

@end
