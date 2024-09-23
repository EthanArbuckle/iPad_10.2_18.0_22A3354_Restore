@implementation WeekViewContainerViewController

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WeekViewContainerViewController;
  -[WeekViewContainerViewController viewIsAppearing:](&v8, "viewIsAppearing:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewContainerViewController navigationController](self, "navigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationBar"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "standardAppearance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v6, "setShadowColor:", v7);

  objc_msgSend(v5, "setScrollEdgeAppearance:", v6);
}

- (id)currentChildViewController
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WeekViewContainerViewController;
  v2 = -[MainViewControllerContainer currentChildViewController](&v4, "currentChildViewController");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (BOOL)shouldRemoveSelfFromNavigationStackIfTraitCollectionIsUnsupported
{
  return 1;
}

- (id)pushedNextLevelMainViewControllerContainerAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedDate"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  if ((objc_msgSend(v6, "showExperimentalUI") & 1) == 0)
  {

    goto LABEL_5;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v8 = objc_msgSend(v7, "showDayAsList");

  if (!v8)
  {
LABEL_5:
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewContainerViewController currentChildViewController](self, "currentChildViewController"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pushedDayViewControllerWithDate:animated:", v5, 0));
    goto LABEL_6;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewContainerViewController currentChildViewController](self, "currentChildViewController"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pushedListViewControllerWithDate:animated:", v5, 0));
LABEL_6:
  v11 = (void *)v10;

  return v11;
}

- (id)childViewControllerForCompactWidthCompactHeight
{
  void *v3;
  CompactWidthWeekViewController *v4;
  void *v5;
  void *v6;
  CompactWidthWeekViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = *(void **)(&self->super._animatingViewTransition + 1);
  if (!v3)
  {
    v4 = [CompactWidthWeekViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
    v7 = -[CompactWidthWeekViewController initWithModel:window:](v4, "initWithModel:window:", v5, v6);
    v8 = *(void **)(&self->super._animatingViewTransition + 1);
    *(_QWORD *)(&self->super._animatingViewTransition + 1) = v7;

    v9 = *(void **)(&self->super._animatingViewTransition + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewContainerViewController navigationController](self, "navigationController"));
    objc_msgSend(v9, "setDelegate:", v10);

    *(_QWORD *)&v11 = objc_opt_class(self).n128_u64[0];
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v12, v11));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Week"), &stru_1001B67C0, 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewContainerViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v15, "setTitle:", v14);

    v3 = *(void **)(&self->super._animatingViewTransition + 1);
  }
  return v3;
}

- (id)childViewControllerForRegularWidthRegularHeight
{
  void *v3;
  LargeWeekViewController *v4;
  void *v5;
  void *v6;
  CompactWidthWeekViewController *v7;
  void *v8;

  v3 = *(CompactWidthWeekViewController **)((char *)&self->_compactController + 1);
  if (!v3)
  {
    v4 = [LargeWeekViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
    v7 = -[LargeWeekViewController initWithModel:window:](v4, "initWithModel:window:", v5, v6);
    v8 = *(CompactWidthWeekViewController **)((char *)&self->_compactController + 1);
    *(CompactWidthWeekViewController **)((char *)&self->_compactController + 1) = v7;

    v3 = *(CompactWidthWeekViewController **)((char *)&self->_compactController + 1);
  }
  return v3;
}

- (Class)childViewControllerClassForTraits:(id)a3
{
  id v3;
  __objc2_class **v4;
  uint64_t v5;

  v3 = objc_msgSend(a3, "horizontalSizeClass");
  v4 = off_1001B13D0;
  if (v3 != (id)1)
    v4 = off_1001B1668;
  objc_opt_class(*v4);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v5);
}

- (void)viewSwitcherSwitchedToViewWithDate:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewContainerViewController currentChildViewController](self, "currentChildViewController"));
  v5 = objc_opt_respondsToSelector(v4, "viewSwitcherSwitchedToViewWithDate:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewContainerViewController currentChildViewController](self, "currentChildViewController"));
    objc_msgSend(v6, "viewSwitcherSwitchedToViewWithDate:", v7);

  }
}

- (BOOL)hidesBackButton
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewContainerViewController currentChildViewController](self, "currentChildViewController"));
  objc_opt_class(CompactWidthWeekViewController);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

- (BOOL)allEventsIndividuallyRepresented:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[WeekViewContainerViewController currentChildViewController](self, "currentChildViewController", (_QWORD)v15));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "occurrenceViewForEvent:", v9));

      if (!v11)
        break;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "occurrences"));
      v13 = objc_msgSend(v12, "count");

      if ((unint64_t)v13 > 1)
      {
        LOBYTE(v11) = 0;
        break;
      }
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        LOBYTE(v11) = 1;
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return (char)v11;
}

- (CompactWidthWeekViewController)compactController
{
  return *(CompactWidthWeekViewController **)(&self->super._animatingViewTransition + 1);
}

- (void)setCompactController:(id)a3
{
  objc_storeStrong((id *)(&self->super._animatingViewTransition + 1), a3);
}

- (LargeWeekViewController)regularController
{
  return *(LargeWeekViewController **)((char *)&self->_compactController + 1);
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
