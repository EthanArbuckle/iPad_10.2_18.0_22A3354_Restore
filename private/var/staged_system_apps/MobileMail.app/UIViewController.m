@implementation UIViewController

- (id)mf_preferredTitle
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController childViewControllers](self, "childViewControllers", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v4)
        objc_enumerationMutation(v2);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v5), "mf_preferredTitle"));
      if (v6)
        break;
      if (v3 == (id)++v5)
      {
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v3)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v6 = 0;
  }

  return v6;
}

- (BOOL)isReappearing
{
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  unsigned __int8 v7;
  UIViewController *v8;
  unsigned __int8 v9;
  char v10;
  UIViewController *v11;
  char v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController navigationController](self, "navigationController"));
  v4 = objc_msgSend(v3, "isPopping");
  while (1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navigationController"));

    if (!v5)
      break;
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navigationController"));

    v3 = (void *)v6;
  }
  if (((objc_msgSend(v3, "isPopping") | v4) & 1) != 0)
  {
    v7 = 1;
  }
  else if ((+[UIDevice mf_isPad](UIDevice, "mf_isPad") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = self;
    v9 = -[UIViewController isPerformingModalTransition](v8, "isPerformingModalTransition");
    v7 = v9;
    if (v8)
      v10 = v9;
    else
      v10 = 1;
    if ((v10 & 1) != 0)
    {
      v11 = v8;
    }
    else
    {
      do
      {
        v7 = -[UIViewController isPerformingModalTransition](v8, "isPerformingModalTransition");
        v11 = (UIViewController *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](v8, "parentViewController"));

        if (v11)
          v12 = v7;
        else
          v12 = 1;
        v8 = v11;
      }
      while ((v12 & 1) == 0);
    }

  }
  return v7;
}

- (void)mf_updateAlertSuppressionContextsForReason:(id)a3
{
  id v4;
  void *v5;
  UIViewController *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController navigationController](self, "navigationController"));
  v6 = (UIViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleViewController"));

  if (v6 == self)
  {
    v8 = MSUserNotificationsLog(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: updating contexts", (uint8_t *)&v11, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v10, "mf_updateCurrentContexts");

  }
}

- (void)mf_updateExtraNavigationBarMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL IsAccessibilityCategory;
  double v12;
  double v13;
  double v14;
  double v15;
  NSString *v16;
  id v17;

  -[UIViewController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v16 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v16);

  if (!IsAccessibilityCategory)
  {
    -[UIViewController mf_extraNavigationBarMargins](self, "mf_extraNavigationBarMargins");
    v4 = v4 + v12;
    v6 = v6 + v13;
    v8 = v8 + v14;
    v10 = v10 + v15;
  }
  v17 = (id)objc_claimAutoreleasedReturnValue(-[UIViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v17, "setLargeTitleInsets:", v4, v6, v8, v10);

}

- (void)focus:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(-[UIViewController splitViewController](self, "splitViewController"));
  v8 = v7;

  objc_msgSend(v8, "focusViewController:sender:animated:", self, self, v3);
}

- (void)unfocus:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(-[UIViewController splitViewController](self, "splitViewController"));
  v8 = v7;

  objc_msgSend(v8, "unfocusViewController:sender:animated:", self, self, v3);
}

- (void)focusViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v5 = a5;
  v11 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(-[UIViewController splitViewController](self, "splitViewController"));
  v10 = v9;

  objc_msgSend(v10, "focusViewController:sender:animated:", self, v11, v5);
}

- (void)unfocusViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v5 = a5;
  v11 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(-[UIViewController splitViewController](self, "splitViewController"));
  v10 = v9;

  objc_msgSend(v10, "unfocusViewController:sender:animated:", self, v11, v5);
}

- (BOOL)canResignFocus
{
  return 1;
}

- (void)showPopoverViewController:(id)a3 fromBarButtonItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v10 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));
  objc_msgSend(v9, "showPopoverViewController:fromBarButtonItem:animated:", v10, v8, v5);

}

- (BOOL)canDismiss
{
  return 1;
}

- (BOOL)shouldSnapshot
{
  uint64_t v3;
  char v4;
  uint64_t v5;

  v3 = objc_opt_class(CNContactViewController);
  if ((objc_opt_isKindOfClass(self, v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_opt_class(CalendarInvitationWrapperController);
    v4 = objc_opt_isKindOfClass(self, v5) ^ 1;
  }
  return v4 & 1;
}

- (BOOL)snapshotOnTermination
{
  return 0;
}

- (id)customDefaultPNGName
{
  return CFSTR("Default");
}

- (BOOL)_isInExpandedEnvironment
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController viewIfLoaded](self, "viewIfLoaded"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "windowScene"));

  if (v4 && (v5 = objc_opt_class(MailScene), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
    v6 = objc_msgSend(v4, "isInExpandedEnvironment");
  else
    v6 = 0;

  return v6;
}

- (BOOL)wantsBarHidingWhenVerticallyCompact
{
  return 0;
}

- (int64_t)desiredContextualControllerPresentationStyle
{
  void *v3;
  id v4;

  if (!-[UIViewController _isInExpandedEnvironment](self, "_isInExpandedEnvironment"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4)
    return 2;
  else
    return 1;
}

- (BOOL)mf_viewHierarchyContainsView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[UIViewController view](self, "view"));

    if (v5 == v4)
    {
      v7 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
      v7 = -[UIViewController mf_viewHierarchyContainsView:](self, "mf_viewHierarchyContainsView:", v6);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)mf_toolbarContainsBarButtonItem:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController toolbarItems](self, "toolbarItems"));
    v6 = objc_msgSend(v5, "containsObject:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)mf_navigationItemContainsBarButtonItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController navigationItem](self, "navigationItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leftBarButtonItems"));
    if ((objc_msgSend(v6, "containsObject:", v4) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController navigationItem](self, "navigationItem"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rightBarButtonItems"));
      v7 = objc_msgSend(v9, "containsObject:", v4);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)mf_dismissPresentedViewControllerInPopover
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[UIViewController presentedViewController](self, "presentedViewController"));
  if ((objc_msgSend(v9, "_isInPopoverPresentation") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "popoverPresentationController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sourceView"));

    v5 = -[UIViewController mf_viewHierarchyContainsView:](self, "mf_viewHierarchyContainsView:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "popoverPresentationController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "barButtonItem"));

    if (-[UIViewController mf_toolbarContainsBarButtonItem:](self, "mf_toolbarContainsBarButtonItem:", v7))
    {

LABEL_5:
      -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
      goto LABEL_6;
    }
    v8 = -[UIViewController mf_navigationItemContainsBarButtonItem:](self, "mf_navigationItemContainsBarButtonItem:", v7);

    if ((v5 | v8) == 1)
      goto LABEL_5;
  }
LABEL_6:

}

- (NSDirectionalEdgeInsets)mf_extraNavigationBarMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  -[UIViewController mf_extraContentMargins](self, "mf_extraContentMargins");
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (NSDirectionalEdgeInsets)mf_extraContentMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = NSDirectionalEdgeInsetsZero.top;
  leading = NSDirectionalEdgeInsetsZero.leading;
  bottom = NSDirectionalEdgeInsetsZero.bottom;
  trailing = NSDirectionalEdgeInsetsZero.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (NSDirectionalEdgeInsets)mf_extraEditingMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = NSDirectionalEdgeInsetsZero.top;
  leading = NSDirectionalEdgeInsetsZero.leading;
  bottom = NSDirectionalEdgeInsetsZero.bottom;
  trailing = NSDirectionalEdgeInsetsZero.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:userInfo:", MFMailWillPresentPopoverNotification, v9, 0);

  objc_msgSend(v9, "_setIgnoreBarButtonItemSiblings:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController viewIfLoaded](self, "viewIfLoaded"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailPopoverManager managerForWindow:createIfNeeded:](MFMailPopoverManager, "managerForWindow:createIfNeeded:", v6, 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allPassThroughViews"));
    objc_msgSend(v9, "setPassthroughViews:", v8);

  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a3;
  v3 = objc_opt_class(UIPopoverPresentationController);
  if ((objc_opt_isKindOfClass(v5, v3) & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "postNotificationName:object:userInfo:", MFMailDidDismissPopoverNotification, v5, 0);

  }
}

- (BOOL)mf_isPresentingPreviousDraftPopoverViewController
{
  void *v3;
  void *v4;
  UIViewController *v5;
  void *v6;
  void *v7;
  BOOL v8;

  if (!-[UIViewController conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___ComposeButtonProviding))return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentedViewController](self, "presentedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "popoverPresentationController"));

  v5 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "barButtonItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController composeButtonItem](v5, "composeButtonItem"));
  v8 = v6 == v7;

  return v8;
}

@end
