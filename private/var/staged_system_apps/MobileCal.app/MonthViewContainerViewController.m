@implementation MonthViewContainerViewController

- (id)pushedNextLevelMainViewControllerContainerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char v15;
  void *v16;
  uint64_t v17;
  char v18;
  void *v19;
  unsigned int v20;
  void *v21;
  uint64_t v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedDate"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewContainerViewController currentChildViewController](self, "currentChildViewController"));
  v8 = objc_opt_class(LargeTextLargeMonthViewController);
  isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewContainerViewController currentChildViewController](self, "currentChildViewController"));
    v12 = objc_opt_class(CompactWidthMonthViewController);
    v10 = objc_opt_isKindOfClass(v11, v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewContainerViewController currentChildViewController](self, "currentChildViewController"));
  v14 = objc_opt_class(MultiColumnMonthViewController);
  v15 = objc_opt_isKindOfClass(v13, v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewContainerViewController currentChildViewController](self, "currentChildViewController"));
  v17 = objc_opt_class(LargeMonthViewController);
  v18 = objc_opt_isKindOfClass(v16, v17);

  if ((v10 & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v20 = objc_msgSend(v19, "showDayAsList");

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewContainerViewController currentChildViewController](self, "currentChildViewController"));
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "pushedListViewControllerWithDate:animated:", v6, v3));
    }
    else
    {
      v23 = (_os_feature_enabled_impl("Calendar", "all_on") & 1) != 0
         || _os_feature_enabled_impl("MobileCal", "two_day_view");
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
      v26 = objc_msgSend(v25, "numDaysToShow");

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewContainerViewController currentChildViewController](self, "currentChildViewController"));
      v21 = v27;
      if (v23 && v26 == (id)2)
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "pushedMultiDayViewControllerWithDate:animated:", v6, v3));
      else
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "pushedDayViewControllerWithDate:animated:", v6, v3));
    }
    goto LABEL_20;
  }
  if ((v15 & 1) != 0 || (v18 & 1) != 0 || (isKindOfClass & 1) != 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewContainerViewController currentChildViewController](self, "currentChildViewController"));
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "pushedWeekViewControllerWithDate:animated:", v6, 0));
LABEL_20:
    v24 = (void *)v22;

    goto LABEL_21;
  }
  v24 = 0;
LABEL_21:

  return v24;
}

- (id)currentChildViewController
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MonthViewContainerViewController;
  v2 = -[MainViewControllerContainer currentChildViewController](&v4, "currentChildViewController");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)childViewControllerForCompactWidthRegularHeight
{
  void *v3;
  void *v4;
  void *v5;
  CompactWidthMonthViewController *v6;
  void *v7;
  void *v8;
  CompactWidthMonthViewController *v9;
  void *v10;

  v3 = *(void **)(&self->super._animatingViewTransition + 1);
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedDate"));

    v6 = [CompactWidthMonthViewController alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
    v9 = -[CompactWidthMonthViewController initWithCalendarDate:model:window:](v6, "initWithCalendarDate:model:window:", v5, v7, v8);
    v10 = *(void **)(&self->super._animatingViewTransition + 1);
    *(_QWORD *)(&self->super._animatingViewTransition + 1) = v9;

    v3 = *(void **)(&self->super._animatingViewTransition + 1);
  }
  return v3;
}

- (Class)childViewControllerClassForTraits:(id)a3
{
  id v4;
  __objc2_class **v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "horizontalSizeClass") == (id)2)
  {
    if (objc_msgSend(v4, "verticalSizeClass") == (id)1)
    {
      v5 = off_1001B1690;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewContainerViewController traitCollection](self, "traitCollection"));
      v8 = EKUIUsesLargeTextLayout(v6, v7);

      v5 = off_1001B1640;
      if (v8)
        v5 = off_1001B1650;
    }
  }
  else
  {
    v5 = off_1001B13C8;
  }
  v9 = objc_opt_class(*v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return (Class)v10;
}

- (void)childViewControllerChangedForCurrentTraits
{
  unsigned int v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MonthViewContainerViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v4, "horizontalSizeClass") == (id)2)
  {
    v3 = -[MonthViewContainerViewController isViewLoaded](self, "isViewLoaded");

    if (v3)
      -[MainViewControllerContainer setupForViewAppearance](self, "setupForViewAppearance");
  }
  else
  {

  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  MonthViewContainerViewController *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  objc_super v18;
  uint8_t buf[4];
  MonthViewContainerViewController *v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewContainerViewController traitCollection](self, "traitCollection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewContainerViewController currentChildViewController](self, "currentChildViewController"));
  v10 = objc_opt_class(CompactWidthMonthViewController);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewContainerViewController currentChildViewController](self, "currentChildViewController"));
    v12 = objc_msgSend(v11, "dividedListMode");

  }
  else
  {
    v12 = 0;
  }
  if (objc_msgSend(v8, "horizontalSizeClass") == (id)1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewContainerViewController navigationController](self, "navigationController"));
    v14 = (MonthViewContainerViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topViewController"));

    if (v14 == self && !v12)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewControllerContainer bestDateForNewEvent](self, "bestDateForNewEvent"));
      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
        objc_msgSend(v16, "setSelectedDate:", v15);

      }
      else
      {
        v17 = kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v20 = self;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@ was unable to find bestDateForNewEvent!", buf, 0xCu);
        }
      }

    }
  }
  v18.receiver = self;
  v18.super_class = (Class)MonthViewContainerViewController;
  -[MainViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v18, "willTransitionToTraitCollection:withTransitionCoordinator:", v6, v7);

}

- (id)nextLevelWeekViewController
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedDate"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewContainerViewController currentChildViewController](self, "currentChildViewController"));
  v6 = objc_opt_class(MultiColumnMonthViewController);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewContainerViewController currentChildViewController](self, "currentChildViewController"));
  if ((isKindOfClass & 1) == 0)
  {
    v9 = objc_opt_class(LargeMonthViewController);
    v10 = objc_opt_isKindOfClass(v8, v9);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewContainerViewController currentChildViewController](self, "currentChildViewController"));
    if ((v10 & 1) == 0)
    {
      v11 = objc_opt_class(LargeTextLargeMonthViewController);
      v12 = objc_opt_isKindOfClass(v8, v11);

      if ((v12 & 1) == 0)
      {
        v13 = 0;
        goto LABEL_6;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewContainerViewController currentChildViewController](self, "currentChildViewController"));
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextLevelWeekViewControllerWithDate:", v4));

LABEL_6:
  return v13;
}

- (id)childViewControllerForRegularWidthCompactHeight
{
  void *v3;
  void *v4;
  void *v5;
  MultiColumnMonthViewController *v6;
  void *v7;
  void *v8;
  CompactWidthMonthViewController *v9;
  void *v10;

  v3 = *(CompactWidthMonthViewController **)((char *)&self->_compactWidthController + 1);
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedDate"));

    v6 = [MultiColumnMonthViewController alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
    v9 = -[MultiColumnMonthViewController initWithCalendarDate:model:window:](v6, "initWithCalendarDate:model:window:", v5, v7, v8);
    v10 = *(CompactWidthMonthViewController **)((char *)&self->_compactWidthController + 1);
    *(CompactWidthMonthViewController **)((char *)&self->_compactWidthController + 1) = v9;

    v3 = *(CompactWidthMonthViewController **)((char *)&self->_compactWidthController + 1);
  }
  return v3;
}

- (LargeMonthViewController)standardRegularController
{
  void *v3;
  void *v4;
  void *v5;
  LargeMonthViewController *v6;
  void *v7;
  void *v8;
  MultiColumnMonthViewController *v9;
  void *v10;

  v3 = *(MultiColumnMonthViewController **)((char *)&self->_compactHeightController + 1);
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedDate"));

    v6 = [LargeMonthViewController alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
    v9 = -[LargeMonthViewController initWithCalendarDate:model:window:](v6, "initWithCalendarDate:model:window:", v5, v7, v8);
    v10 = *(MultiColumnMonthViewController **)((char *)&self->_compactHeightController + 1);
    *(MultiColumnMonthViewController **)((char *)&self->_compactHeightController + 1) = v9;

    v3 = *(MultiColumnMonthViewController **)((char *)&self->_compactHeightController + 1);
  }
  return (LargeMonthViewController *)v3;
}

- (LargeTextLargeMonthViewController)largeTextRegularController
{
  void *v3;
  void *v4;
  void *v5;
  LargeTextLargeMonthViewController *v6;
  void *v7;
  void *v8;
  LargeMonthViewController *v9;
  void *v10;

  v3 = *(LargeMonthViewController **)((char *)&self->_standardRegularController + 1);
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedDate"));

    v6 = [LargeTextLargeMonthViewController alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
    v9 = -[CompactWidthMonthViewController initWithCalendarDate:model:window:](v6, "initWithCalendarDate:model:window:", v5, v7, v8);
    v10 = *(LargeMonthViewController **)((char *)&self->_standardRegularController + 1);
    *(LargeMonthViewController **)((char *)&self->_standardRegularController + 1) = v9;

    v3 = *(LargeMonthViewController **)((char *)&self->_standardRegularController + 1);
  }
  return (LargeTextLargeMonthViewController *)v3;
}

- (id)childViewControllerForRegularWidthRegularHeight
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewContainerViewController traitCollection](self, "traitCollection"));
  v5 = EKUIUsesLargeTextLayout(v3, v4);

  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewContainerViewController largeTextRegularController](self, "largeTextRegularController"));
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewContainerViewController standardRegularController](self, "standardRegularController"));
  return v6;
}

- (CompactWidthMonthViewController)compactWidthController
{
  return *(CompactWidthMonthViewController **)(&self->super._animatingViewTransition + 1);
}

- (void)setCompactWidthController:(id)a3
{
  objc_storeStrong((id *)(&self->super._animatingViewTransition + 1), a3);
}

- (MultiColumnMonthViewController)compactHeightController
{
  return *(MultiColumnMonthViewController **)((char *)&self->_compactWidthController + 1);
}

- (void)setCompactHeightController:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_compactWidthController + 1), a3);
}

- (void)setStandardRegularController:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_compactHeightController + 1), a3);
}

- (void)setLargeTextRegularController:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_standardRegularController + 1), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_standardRegularController + 1), 0);
  objc_storeStrong((id *)((char *)&self->_compactHeightController + 1), 0);
  objc_storeStrong((id *)((char *)&self->_compactWidthController + 1), 0);
  objc_storeStrong((id *)(&self->super._animatingViewTransition + 1), 0);
}

@end
