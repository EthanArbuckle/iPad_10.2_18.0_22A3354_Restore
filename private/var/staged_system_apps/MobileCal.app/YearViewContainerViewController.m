@implementation YearViewContainerViewController

- (Class)childViewControllerClassForTraits:(id)a3
{
  id v3;
  __objc2_class **v4;
  uint64_t v5;

  v3 = objc_msgSend(a3, "horizontalSizeClass");
  v4 = &off_1001B13E0;
  if (v3 != (id)1)
    v4 = off_1001B1678;
  v5 = objc_opt_class(*v4);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v5);
}

- (id)pushedNextLevelMainViewControllerContainerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v5 = -[YearViewContainerViewController currentChildViewController](self, "currentChildViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewContainerViewController _pushMonthViewControllerWithDate:animated:](self, "_pushMonthViewControllerWithDate:animated:", v7, v3));

  return v8;
}

- (id)currentChildViewController
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)YearViewContainerViewController;
  v2 = -[MainViewControllerContainer currentChildViewController](&v4, "currentChildViewController");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)childViewControllerForCompactWidthRegularHeight
{
  void *v3;
  void *v4;
  void *v5;
  CompactYearViewController *v6;
  void *v7;
  void *v8;
  MonthViewContainerViewController *v9;
  void *v10;

  v3 = *(MonthViewContainerViewController **)((char *)&self->_cachedMonthViewController + 1);
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedDate"));

    v6 = [CompactYearViewController alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
    v9 = -[YearViewController initWithCalendarDate:model:window:](v6, "initWithCalendarDate:model:window:", v5, v7, v8);
    v10 = *(MonthViewContainerViewController **)((char *)&self->_cachedMonthViewController + 1);
    *(MonthViewContainerViewController **)((char *)&self->_cachedMonthViewController + 1) = v9;

    objc_msgSend(*(id *)((char *)&self->_cachedMonthViewController + 1), "setPushDelegate:", self);
    v3 = *(MonthViewContainerViewController **)((char *)&self->_cachedMonthViewController + 1);
  }
  return v3;
}

- (id)_pushMonthViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  MonthViewContainerViewController *v17;
  MonthViewContainerViewController *v18;
  MonthViewContainerViewController *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  objc_msgSend(v7, "setSelectedDate:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewContainerViewController navigationController](self, "navigationController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewControllers"));
  if ((unint64_t)objc_msgSend(v9, "count") <= 1)
  {

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewContainerViewController navigationController](self, "navigationController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewControllers"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", 1));
    v13 = objc_opt_class(MonthViewContainerViewController);
    isKindOfClass = objc_opt_isKindOfClass(v12, v13);

    if ((isKindOfClass & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewContainerViewController navigationController](self, "navigationController"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "viewControllers"));
      v17 = (MonthViewContainerViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", 1));

      goto LABEL_9;
    }
  }
  v18 = (MonthViewContainerViewController *)*(id *)(&self->super._animatingViewTransition + 1);
  v17 = v18;
  if (!v18)
  {
    v19 = [MonthViewContainerViewController alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
    v17 = -[MainViewControllerContainer initWithModel:window:](v19, "initWithModel:window:", v20, v21);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewContainerViewController navigationController](self, "navigationController"));
  objc_msgSend(v22, "pushViewController:animated:", v17, v4);

  if (v18)
    -[MainViewController traitCollectionDidChange:](v17, "traitCollectionDidChange:", 0);
LABEL_9:
  objc_storeStrong((id *)(&self->super._animatingViewTransition + 1), v17);
  return v17;
}

- (id)childViewControllerForRegularWidthRegularHeight
{
  void *v3;
  void *v4;
  void *v5;
  LargeYearViewController *v6;
  void *v7;
  void *v8;
  CompactYearViewController *v9;
  void *v10;

  v3 = *(CompactYearViewController **)((char *)&self->_compactController + 1);
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedDate"));

    v6 = [LargeYearViewController alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
    v9 = -[YearViewController initWithCalendarDate:model:window:](v6, "initWithCalendarDate:model:window:", v5, v7, v8);
    v10 = *(CompactYearViewController **)((char *)&self->_compactController + 1);
    *(CompactYearViewController **)((char *)&self->_compactController + 1) = v9;

    objc_msgSend(*(id *)((char *)&self->_compactController + 1), "setPushDelegate:", self);
    v3 = *(CompactYearViewController **)((char *)&self->_compactController + 1);
  }
  return v3;
}

- (void)pushContentViewOfType:(int64_t)a3 date:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v5 = a5;
  v8 = a4;
  v13 = v8;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewContainerViewController navigationController](self, "navigationController"));
    objc_opt_class(RootNavigationController);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      v11 = objc_msgSend(v9, "pushCalendarViewControllerWithViewType:andDate:", a3, v13);

  }
  else
  {
    v12 = -[YearViewContainerViewController _pushMonthViewControllerWithDate:animated:](self, "_pushMonthViewControllerWithDate:animated:", v8, v5);
  }

}

- (CompactYearViewController)compactController
{
  return *(CompactYearViewController **)((char *)&self->_cachedMonthViewController + 1);
}

- (void)setCompactController:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_cachedMonthViewController + 1), a3);
}

- (LargeYearViewController)regularController
{
  return *(LargeYearViewController **)((char *)&self->_compactController + 1);
}

- (void)setRegularController:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_compactController + 1), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_compactController + 1), 0);
  objc_storeStrong((id *)((char *)&self->_cachedMonthViewController + 1), 0);
  objc_storeStrong((id *)(&self->super._animatingViewTransition + 1), 0);
}

@end
