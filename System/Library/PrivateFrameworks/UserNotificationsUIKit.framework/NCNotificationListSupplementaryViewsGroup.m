@implementation NCNotificationListSupplementaryViewsGroup

- (NCNotificationListSupplementaryViewsGroup)init
{
  NCNotificationListSupplementaryViewsGroup *v2;
  NSMutableArray *v3;
  NSMutableArray *orderedCells;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationListSupplementaryViewsGroup;
  v2 = -[NCNotificationListSupplementaryViewsGroup init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    orderedCells = v2->_orderedCells;
    v2->_orderedCells = v3;

  }
  return v2;
}

- (void)insertSupplementaryViewController:(id)a3 withConfiguration:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NCNotificationListSupplementaryHostingViewController *v15;
  void *v16;
  NCNotificationListCell *v17;
  NCNotificationListCell *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[NCNotificationListSupplementaryViewsGroup _existingIndexMatchingSupplementaryViewController:](self, "_existingIndexMatchingSupplementaryViewController:", v6);
  v9 = -[NCNotificationListSupplementaryViewsGroup _sortedIndexForViewController:](self, "_sortedIndexForViewController:", v6);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    v10 = 0;
  else
    v10 = v9;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      -[NCNotificationListSupplementaryViewsGroup _logDescription](self, "_logDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v13;
      _os_log_impl(&dword_1CFC3D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting new supplementary view view controller", (uint8_t *)&v20, 0xCu);

    }
    -[NCNotificationListPresentableGroup delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[NCNotificationListSupplementaryHostingViewController initWithHostedViewController:sectionIdentifier:]([NCNotificationListSupplementaryHostingViewController alloc], "initWithHostedViewController:sectionIdentifier:", v6, self->_sectionIdentifier);
    -[NCNotificationListSupplementaryHostingViewController setDelegate:](v15, "setDelegate:", self);
    -[NCNotificationListSupplementaryHostingViewController setConfiguration:animated:](v15, "setConfiguration:animated:", v7, 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v14, "backgroundGroupNameBaseForNotificationListBaseComponent:", self);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationListSupplementaryHostingViewController setMaterialGroupNameBase:](v15, "setMaterialGroupNameBase:", v16);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v14, "notificationListBaseComponent:didAddViewController:", self, v15);
    v17 = [NCNotificationListCell alloc];
    v18 = -[NCNotificationListCell initWithFrame:](v17, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[NCNotificationListCell setActionProvider:](v18, "setActionProvider:", self);
    -[NCNotificationListCell setActionHandler:](v18, "setActionHandler:", self);
    -[NSMutableArray insertObject:atIndex:](self->_orderedCells, "insertObject:atIndex:", v18, v10);
    -[NCNotificationListCell setContentViewController:](v18, "setContentViewController:", v15);
    -[NCNotificationListSupplementaryViewsGroup _matchStyleOfCell:toHostingViewController:](self, "_matchStyleOfCell:toHostingViewController:", v18, v15);
    -[NCNotificationListPresentableGroup listView](self, "listView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "insertViewAtIndex:animated:", v10, 1);

    -[NCNotificationListSupplementaryViewsGroup _updateUserInteraction](self, "_updateUserInteraction");
  }
  else
  {
    -[NCNotificationListSupplementaryViewsGroup _updateSupplementaryViewController:withConfiguration:existingIndex:proposedIndex:](self, "_updateSupplementaryViewController:withConfiguration:existingIndex:proposedIndex:", v6, v7, v8, v10);
  }

}

- (void)updateSupplementaryViewController:(id)a3 withConfiguration:(id)a4
{
  id v6;
  unint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = -[NCNotificationListSupplementaryViewsGroup _existingIndexMatchingSupplementaryViewController:](self, "_existingIndexMatchingSupplementaryViewController:", v8);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    -[NCNotificationListSupplementaryViewsGroup _updateSupplementaryViewController:withConfiguration:existingIndex:proposedIndex:](self, "_updateSupplementaryViewController:withConfiguration:existingIndex:proposedIndex:", v8, v6, v7, -[NCNotificationListSupplementaryViewsGroup _sortedIndexForViewController:](self, "_sortedIndexForViewController:", v8));

}

- (void)updatePositionIfNeededForSupplementaryViewController:(id)a3
{
  unint64_t v4;
  id v5;

  v5 = a3;
  v4 = -[NCNotificationListSupplementaryViewsGroup _existingIndexMatchingSupplementaryViewController:](self, "_existingIndexMatchingSupplementaryViewController:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[NCNotificationListSupplementaryViewsGroup _updateSupplementaryViewController:withConfiguration:existingIndex:proposedIndex:](self, "_updateSupplementaryViewController:withConfiguration:existingIndex:proposedIndex:", v5, 0, v4, -[NCNotificationListSupplementaryViewsGroup _sortedIndexForViewController:](self, "_sortedIndexForViewController:", v5));

}

- (void)removeSupplementaryViewController:(id)a3
{
  -[NCNotificationListSupplementaryViewsGroup _removeSupplementaryViewControllerAtIndex:](self, "_removeSupplementaryViewControllerAtIndex:", -[NCNotificationListSupplementaryViewsGroup _existingIndexMatchingSupplementaryViewController:](self, "_existingIndexMatchingSupplementaryViewController:", a3));
}

- (BOOL)containsSupplementaryViewController:(id)a3
{
  return -[NCNotificationListSupplementaryViewsGroup _existingIndexMatchingSupplementaryViewController:](self, "_existingIndexMatchingSupplementaryViewController:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)hostingPlatterViewForSupplementaryViewController:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;

  v4 = -[NCNotificationListSupplementaryViewsGroup _existingIndexMatchingSupplementaryViewController:](self, "_existingIndexMatchingSupplementaryViewController:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[NCNotificationListSupplementaryViewsGroup _hostingViewControllerAtIndex:](self, "_hostingViewControllerAtIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "platterView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (NSArray)hostingViewControllers
{
  id v3;
  unint64_t v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NCNotificationListSupplementaryViewsGroup count](self, "count"))
  {
    v4 = 0;
    do
    {
      -[NCNotificationListSupplementaryViewsGroup _hostingViewControllerAtIndex:](self, "_hostingViewControllerAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (v4 < -[NCNotificationListSupplementaryViewsGroup count](self, "count"));
  }
  return (NSArray *)v3;
}

- (NSArray)supplementaryViewControllers
{
  id v3;
  unint64_t v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NCNotificationListSupplementaryViewsGroup count](self, "count"))
  {
    v4 = 0;
    do
    {
      -[NCNotificationListSupplementaryViewsGroup _supplementaryViewControllerAtIndex:](self, "_supplementaryViewControllerAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (v4 < -[NCNotificationListSupplementaryViewsGroup count](self, "count"));
  }
  return (NSArray *)v3;
}

- (id)headerText
{
  return self->_groupName;
}

- (id)clearAllText
{
  void *v2;
  void *v3;

  NCUserNotificationsUIKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_CLEAR_ALL_SUPPLEMENTARY"), &stru_1E8D21F60, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldImmediatelyReveal
{
  return 1;
}

- (id)purpose
{
  const __CFString *groupingIdentifier;

  groupingIdentifier = (const __CFString *)self->_groupingIdentifier;
  if (!groupingIdentifier)
    groupingIdentifier = CFSTR("<Nil>");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bundle:%@;Group:%@"),
               self->_sectionIdentifier,
               groupingIdentifier);
}

- (void)toggleGroupedState
{
  void *v3;
  int v4;
  void *v5;
  unint64_t v6;
  char v7;
  void *v8;

  -[NCNotificationListPresentableGroup listView](self, "listView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isGrouped");

  -[NCNotificationListPresentableGroup listView](self, "listView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
    v7 = v4;
  else
    v7 = 1;
  if (v6 > 1 || (v7 & 1) == 0)
  {
    -[NCNotificationListPresentableGroup listView](self, "listView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGrouped:", v4 ^ 1u);

    -[NCNotificationListSupplementaryViewsGroup _updateUserInteraction](self, "_updateUserInteraction");
  }
}

- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[NCNotificationListSupplementaryViewsGroup _hostingViewControllerAtIndex:](self, "_hostingViewControllerAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeThatFits:", a5, 1.79769313e308);
    v10 = v9;

  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;

  -[NCNotificationListSupplementaryViewsGroup _hostingViewControllerAtIndex:](self, "_hostingViewControllerAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentVisible:", 1);
  -[NCNotificationListSupplementaryViewsGroup _cellAtIndex:](self, "_cellAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)recycleView:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationListSupplementaryViewsGroup;
  -[NCNotificationListPresentableGroup recycleView:](&v6, sel_recycleView_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NCNotificationListSupplementaryViewsGroup _hostingViewControllerForCell:](self, "_hostingViewControllerForCell:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentVisible:", 0);

  }
}

- (BOOL)shouldContinuePresentingActionButtonsForNotificationListCell:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCNotificationListSupplementaryViewsGroup _cellAtIndex:](self, "_cellAtIndex:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    return 1;
  else
    return !-[NCNotificationListPresentableGroup isGrouped](self, "isGrouped");
}

- (BOOL)shouldShowSupplementaryActionsForNotificationListCell:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  BOOL v7;

  -[NCNotificationListSupplementaryViewsGroup _configurationForCell:](self, "_configurationForCell:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supplementaryActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = objc_msgSend(v3, "preventsUserDismissal") ^ 1;
  if (v5)
    v7 = 1;
  else
    v7 = v6;

  return v7;
}

- (id)supplementaryActionsForNotificationListCell:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NCNotificationListSupplementaryViewsGroup _configurationForCell:](self, "_configurationForCell:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "supplementaryActions", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((v10 & 1) != 0)
          v10 = 1;
        else
          v10 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "pl_isDefaultAction");
        objc_msgSend(v6, "addObject:", v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  if ((objc_msgSend(v5, "preventsUserDismissal") & 1) == 0)
  {
    -[NCNotificationListSupplementaryViewsGroup _clearActionForCell:](self, "_clearActionForCell:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((v10 & 1) == 0)
      objc_msgSend(v14, "setPl_defaultAction:", 1);
    objc_msgSend(v6, "addObject:", v15);

  }
  return v6;
}

- (id)defaultActionForNotificationListCell:(id)a3
{
  void *v3;
  void *v4;

  -[NCNotificationListSupplementaryViewsGroup _configurationForCell:](self, "_configurationForCell:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)shouldShowDefaultActionForNotificationListCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[NCNotificationListSupplementaryViewsGroup _configurationForCell:](self, "_configurationForCell:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v5, "shouldHintDefaultActionForNotificationListBaseComponent:", self);
  else
    v7 = 0;

  return v7;
}

- (BOOL)shouldVerticallyStackActionButtonsForNotificationListCell:(id)a3
{
  return 0;
}

- (void)notificationListCell:(id)a3 didBeginRevealingActionsForSwipeInteraction:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NCNotificationListSupplementaryViewsGroup;
  v6 = a3;
  -[NCNotificationListPresentableGroup notificationListCell:didBeginRevealingActionsForSwipeInteraction:](&v10, sel_notificationListCell_didBeginRevealingActionsForSwipeInteraction_, v6, a4);
  -[NCNotificationListSupplementaryViewsGroup _hostingViewControllerForCell:](self, "_hostingViewControllerForCell:", v6, v10.receiver, v10.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hostedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notificationListSupplementaryViewsGroup:cancelTouches:onHostedViewController:", self, 1, v8);

}

- (void)notificationListCell:(id)a3 didBeginHidingActionsForSwipeInteraction:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NCNotificationListSupplementaryViewsGroup;
  v6 = a3;
  -[NCNotificationListPresentableGroup notificationListCell:didBeginHidingActionsForSwipeInteraction:](&v10, sel_notificationListCell_didBeginHidingActionsForSwipeInteraction_, v6, a4);
  -[NCNotificationListSupplementaryViewsGroup _hostingViewControllerForCell:](self, "_hostingViewControllerForCell:", v6, v10.receiver, v10.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hostedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notificationListSupplementaryViewsGroup:cancelTouches:onHostedViewController:", self, 0, v8);

}

- (void)supplementaryHostingViewControllerWasTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[NCNotificationListPresentableGroup isGrouped](self, "isGrouped"))
  {
    -[NCNotificationListPresentableGroup listView](self, "listView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setGrouped:", 0);

    -[NCNotificationListSupplementaryViewsGroup _updateUserInteraction](self, "_updateUserInteraction");
  }
  else
  {
    objc_msgSend(v11, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[NCNotificationListPresentableGroup delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0
        && objc_msgSend(v7, "shouldHintDefaultActionForNotificationListBaseComponent:", self))
      {
        objc_msgSend(v11, "hostedViewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[NCNotificationListSupplementaryViewsGroup _existingIndexMatchingSupplementaryViewController:](self, "_existingIndexMatchingSupplementaryViewController:", v8);

        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[NCNotificationListSupplementaryViewsGroup _cellAtIndex:](self, "_cellAtIndex:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "hintSideSwipeForDefaultAction");

        }
      }
      else
      {
        objc_msgSend(v6, "performWithSender:target:", self, 0);
      }

    }
  }

}

- (void)supplementaryHostingViewControllerPreferredContentSizeChanged:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  id v6;

  v4 = -[NCNotificationListSupplementaryViewsGroup _indexOfHostingViewController:](self, "_indexOfHostingViewController:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    if (v4 < -[NCNotificationListSupplementaryViewsGroup count](self, "count"))
    {
      -[NCNotificationListPresentableGroup listView](self, "listView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reloadViewAtIndex:", v5);

    }
  }
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_orderedCells, "count");
}

+ (id)presentableTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

- (void)clearAll
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = -[NCNotificationListSupplementaryViewsGroup count](self, "count");
  if ((uint64_t)(v4 - 1) < 0)
  {
    v6 = 1;
  }
  else
  {
    v5 = v4;
    v6 = 1;
    do
    {
      -[NCNotificationListSupplementaryViewsGroup _configurationAtIndex:](self, "_configurationAtIndex:", --v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "preventsUserDismissal");

      if ((v8 & 1) != 0)
      {
        v6 = 0;
      }
      else
      {
        -[NCNotificationListSupplementaryViewsGroup _hostingViewControllerAtIndex:](self, "_hostingViewControllerAtIndex:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);
        -[NCNotificationListSupplementaryViewsGroup _removeSupplementaryViewControllerAtIndex:](self, "_removeSupplementaryViewControllerAtIndex:", v5);

      }
    }
    while (v5 > 0);
  }
  -[NCNotificationListPresentableGroup delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "notificationListBaseComponent:requestsClearingPresentables:", self, v3);
  if ((v6 & 1) != 0)
  {
    v11 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      -[NCNotificationListSupplementaryViewsGroup _logDescription](self, "_logDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationListSupplementaryViewsGroup groupingIdentifier](self, "groupingIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "un_logDigest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v15;
      _os_log_impl(&dword_1CFC3D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ all cells are removed in group %{public}@; clean up group from section.",
        (uint8_t *)&v16,
        0x16u);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "notificationListBaseComponentDidRemoveAll:", self);
  }

}

- (void)_updateSupplementaryViewController:(id)a3 withConfiguration:(id)a4 existingIndex:(unint64_t)a5 proposedIndex:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (v11)
  {
    -[NCNotificationListSupplementaryViewsGroup _hostingViewControllerAtIndex:](self, "_hostingViewControllerAtIndex:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListSupplementaryViewsGroup _cellAtIndex:](self, "_cellAtIndex:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListSupplementaryViewsGroup _updateHostingViewController:cell:withConfiguration:](self, "_updateHostingViewController:cell:withConfiguration:", v12, v13, v11);

  }
  if (a6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = (__PAIR128__(a6, a5) - a6) >> 64;
    if (v14 != a5)
    {
      v15 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        -[NCNotificationListSupplementaryViewsGroup _logDescription](self, "_logDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543874;
        v22 = v17;
        v23 = 2050;
        v24 = a5;
        v25 = 2050;
        v26 = v14;
        _os_log_impl(&dword_1CFC3D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ updating position for existing supplementary view controller, '%{public}lu' -> '%{public}lu'", (uint8_t *)&v21, 0x20u);

      }
      -[NCNotificationListSupplementaryViewsGroup _cellAtIndex:](self, "_cellAtIndex:", a5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectAtIndex:](self->_orderedCells, "removeObjectAtIndex:", a5);
      -[NCNotificationListPresentableGroup listView](self, "listView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeViewAtIndex:animated:", a5, 0);

      -[NSMutableArray insertObject:atIndex:](self->_orderedCells, "insertObject:atIndex:", v18, v14);
      -[NCNotificationListPresentableGroup listView](self, "listView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "insertViewAtIndex:animated:", v14, 0);

    }
  }

}

- (void)_updateUserInteraction
{
  unint64_t v3;
  void *v4;

  if (-[NCNotificationListSupplementaryViewsGroup count](self, "count"))
  {
    v3 = 0;
    do
    {
      -[NCNotificationListSupplementaryViewsGroup _hostingViewControllerAtIndex:](self, "_hostingViewControllerAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHostedViewControllerUserInteractionEnabled:", -[NCNotificationListSupplementaryViewsGroup _shouldAllowHostedViewControllersUserInteraction](self, "_shouldAllowHostedViewControllersUserInteraction"));

      ++v3;
    }
    while (v3 < -[NCNotificationListSupplementaryViewsGroup count](self, "count"));
  }
}

- (BOOL)_shouldAllowHostedViewControllersUserInteraction
{
  return !-[NCNotificationListPresentableGroup isGrouped](self, "isGrouped");
}

- (void)_clearCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NCNotificationListSupplementaryViewsGroup _hostingViewControllerForCell:](self, "_hostingViewControllerForCell:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NCNotificationListSupplementaryViewsGroup _removeSupplementaryViewControllerAtIndex:](self, "_removeSupplementaryViewControllerAtIndex:", -[NCNotificationListSupplementaryViewsGroup _indexOfHostingViewController:](self, "_indexOfHostingViewController:", v4));
    -[NCNotificationListPresentableGroup delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "notificationListBaseComponent:requestsClearingPresentables:", self, v6);

    }
    if (!-[NCNotificationListSupplementaryViewsGroup count](self, "count"))
    {
      v7 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        -[NCNotificationListSupplementaryViewsGroup _logDescription](self, "_logDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationListSupplementaryViewsGroup groupingIdentifier](self, "groupingIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "un_logDigest");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v9;
        v14 = 2114;
        v15 = v11;
        _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ all cells are removed in group %{public}@; clean up group from section.",
          (uint8_t *)&v12,
          0x16u);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "notificationListBaseComponentDidRemoveAll:", self);
    }

  }
}

- (id)_clearActionForCell:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  char v20;
  id location;

  v4 = a3;
  -[NCNotificationListPresentableGroup listView](self, "listView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isGrouped") & 1) == 0)
  {

    goto LABEL_5;
  }
  v6 = -[NCNotificationListSupplementaryViewsGroup count](self, "count");

  if (v6 <= 1)
  {
LABEL_5:
    NCUserNotificationsUIKitFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_CLEAR"), &stru_1E8D21F60, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    goto LABEL_6;
  }
  NCUserNotificationsUIKitFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_CLEAR_ALL_CELL"), &stru_1E8D21F60, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 1;
LABEL_6:

  objc_initWeak(&location, self);
  v10 = (void *)MEMORY[0x1E0DC3428];
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __65__NCNotificationListSupplementaryViewsGroup__clearActionForCell___block_invoke;
  v17 = &unk_1E8D1C588;
  objc_copyWeak(&v19, &location);
  v20 = v9;
  v11 = v4;
  v18 = v11;
  objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v8, 0, CFSTR("tbd"), &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPl_defaultAction:", 1, v14, v15, v16, v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v12;
}

void __65__NCNotificationListSupplementaryViewsGroup__clearActionForCell___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setClearingAllNotificationRequestsForCellHorizontalSwipe:", 1);
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(v3, "clearAll");
    else
      objc_msgSend(v3, "_clearCell:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_updateHostingViewController:(id)a3 cell:(id)a4 withConfiguration:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a5;
  v9 = a4;
  -[NCNotificationListSupplementaryViewsGroup _configurationForCell:](self, "_configurationForCell:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if ((v11 & 1) != 0)
  {
    objc_msgSend(v13, "setConfiguration:animated:", v8, 1);
    objc_msgSend(v9, "setContentViewController:", v13);
    -[NCNotificationListSupplementaryViewsGroup _matchStyleOfCell:toHostingViewController:](self, "_matchStyleOfCell:toHostingViewController:", v9, v13);
  }
  else
  {
    -[NCNotificationListPresentableGroup delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v12, "notificationListBaseComponent:willUpdateViewController:", self, v13);

    objc_msgSend(v13, "setConfiguration:animated:", v8, 1);
    objc_msgSend(v9, "setContentViewController:", v13);
    -[NCNotificationListSupplementaryViewsGroup _matchStyleOfCell:toHostingViewController:](self, "_matchStyleOfCell:toHostingViewController:", v9, v13);

    -[NCNotificationListPresentableGroup delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "notificationListBaseComponent:didUpdateViewController:", self, v13);
  }

}

- (void)_matchStyleOfCell:(id)a3 toHostingViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a4;
  v10 = a3;
  objc_msgSend(v5, "materialGroupNameBase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMaterialGroupNameBase:", v6);

  objc_msgSend(v5, "materialTintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMaterialTintColor:", v7);

  objc_msgSend(v5, "textColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v8);

  v9 = objc_msgSend(v5, "materialRecipe");
  objc_msgSend(v10, "setMaterialRecipe:", v9);

}

- (unint64_t)_existingIndexMatchingSupplementaryViewController:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = a3;
  if (-[NCNotificationListSupplementaryViewsGroup count](self, "count"))
  {
    v5 = 0;
    while (1)
    {
      -[NCNotificationListSupplementaryViewsGroup _supplementaryViewControllerAtIndex:](self, "_supplementaryViewControllerAtIndex:", v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v6 == v4)
        break;
      if (++v5 >= -[NCNotificationListSupplementaryViewsGroup count](self, "count"))
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (unint64_t)_sortedIndexForViewController:(id)a3
{
  id v4;
  unint64_t i;
  void *v6;
  uint64_t v7;

  v4 = a3;
  if (self->_viewControllerSortComparator)
  {
    for (i = 0; i < -[NCNotificationListSupplementaryViewsGroup count](self, "count"); ++i)
    {
      -[NCNotificationListSupplementaryViewsGroup _supplementaryViewControllerAtIndex:](self, "_supplementaryViewControllerAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (*((uint64_t (**)(void))self->_viewControllerSortComparator + 2))();

      if (v7 == 1)
        break;
    }
  }
  else
  {
    i = 0x7FFFFFFFFFFFFFFFLL;
  }

  return i;
}

- (id)_logDescription
{
  __CFString *groupingIdentifier;
  void *v4;
  __CFString *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  groupingIdentifier = (__CFString *)self->_groupingIdentifier;
  if (!groupingIdentifier)
    groupingIdentifier = CFSTR("<Group w/ No ID>");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = groupingIdentifier;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ [%@: %@]"), v7, self->_sectionIdentifier, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_configurationAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[NCNotificationListSupplementaryViewsGroup _hostingViewControllerAtIndex:](self, "_hostingViewControllerAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_supplementaryViewControllerAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[NCNotificationListSupplementaryViewsGroup _hostingViewControllerAtIndex:](self, "_hostingViewControllerAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hostedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_hostingViewControllerAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[NCNotificationListSupplementaryViewsGroup _cellAtIndex:](self, "_cellAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NCNotificationListSupplementaryViewsGroup _hostingViewControllerForCell:](self, "_hostingViewControllerForCell:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_cellAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_orderedCells, "count") <= a3)
  {
    v6 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
    {
      v8 = v6;
      -[NCNotificationListSupplementaryViewsGroup _logDescription](self, "_logDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSMutableArray count](self->_orderedCells, "count");
      v11 = 138543874;
      v12 = v9;
      v13 = 2048;
      v14 = a3;
      v15 = 2048;
      v16 = v10;
      _os_log_error_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_ERROR, "%{public}@ cannot vend list view for index: %lu. array count is: %lu.", (uint8_t *)&v11, 0x20u);

    }
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_orderedCells, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)_indexOfHostingViewController:(id)a3
{
  id v4;
  NSMutableArray *orderedCells;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  orderedCells = self->_orderedCells;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__NCNotificationListSupplementaryViewsGroup__indexOfHostingViewController___block_invoke;
  v9[3] = &unk_1E8D1C5B0;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSMutableArray enumerateObjectsUsingBlock:](orderedCells, "enumerateObjectsUsingBlock:", v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __75__NCNotificationListSupplementaryViewsGroup__indexOfHostingViewController___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;

  v7 = *(void **)(a1 + 32);
  objc_msgSend(a2, "contentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (id)_configurationForCell:(id)a3
{
  void *v3;
  void *v4;

  -[NCNotificationListSupplementaryViewsGroup _hostingViewControllerForCell:](self, "_hostingViewControllerForCell:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_hostingViewControllerForCell:(id)a3
{
  return (id)objc_msgSend(a3, "contentViewController");
}

- (void)_removeSupplementaryViewControllerAtIndex:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      -[NCNotificationListSupplementaryViewsGroup _logDescription](self, "_logDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v7;
      v16 = 2048;
      v17 = a3;
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ removing supplementary view controller at index %lu", (uint8_t *)&v14, 0x16u);

    }
    -[NCNotificationListSupplementaryViewsGroup _hostingViewControllerAtIndex:](self, "_hostingViewControllerAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndex:](self->_orderedCells, "objectAtIndex:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = -[NCNotificationListPresentableGroup actionsRevealedForNotificationListCell:](self, "actionsRevealedForNotificationListCell:", v9);
    else
      v10 = 0;
    -[NSMutableArray removeObjectAtIndex:](self->_orderedCells, "removeObjectAtIndex:", a3);
    -[NCNotificationListPresentableGroup listView](self, "listView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeViewAtIndex:animated:isHorizontallyDisplaced:", a3, 1, v10);

    -[NCNotificationListPresentableGroup delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v12, "notificationListBaseComponent:didRemoveViewController:", self, v8);

  }
  if (-[NCNotificationListSupplementaryViewsGroup count](self, "count") == 1)
  {
    -[NCNotificationListPresentableGroup listView](self, "listView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setGrouped:", 1);

    -[NCNotificationListSupplementaryViewsGroup _updateUserInteraction](self, "_updateUserInteraction");
  }
}

- (NSString)groupingIdentifier
{
  return self->_groupingIdentifier;
}

- (void)setGroupingIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)viewControllerSortComparator
{
  return self->_viewControllerSortComparator;
}

- (void)setViewControllerSortComparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)isClearingAllNotificationRequestsForCellHorizontalSwipe
{
  return self->_clearingAllNotificationRequestsForCellHorizontalSwipe;
}

- (void)setClearingAllNotificationRequestsForCellHorizontalSwipe:(BOOL)a3
{
  self->_clearingAllNotificationRequestsForCellHorizontalSwipe = a3;
}

- (NSMutableArray)orderedCells
{
  return self->_orderedCells;
}

- (void)setOrderedCells:(id)a3
{
  objc_storeStrong((id *)&self->_orderedCells, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedCells, 0);
  objc_storeStrong(&self->_viewControllerSortComparator, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_groupingIdentifier, 0);
}

@end
