@implementation InboxSwitcherViewController

- (InboxSwitcherViewController)initWithModel:(id)a3 destination:(unint64_t)a4
{
  id v7;
  InboxSwitcherViewController *v8;
  InboxSwitcherViewController *v9;
  id v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  UISegmentedControl *v20;
  UISegmentedControl *segmentedControl;
  UISegmentedControl *v22;
  void *v23;
  void *v24;
  objc_super v26;
  _QWORD v27[2];

  v7 = a3;
  v26.receiver = self;
  v26.super_class = (Class)InboxSwitcherViewController;
  v8 = -[InboxSwitcherViewController initWithNibName:bundle:](&v26, "initWithNibName:bundle:", 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_model, a3);
    v9->_destination = a4;
    v10 = objc_alloc((Class)UISegmentedControl);
    *(_QWORD *)&v11 = objc_opt_class(v9).n128_u64[0];
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v12, v11));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("New"), &stru_1001B67C0, 0));
    v27[0] = v14;
    *(_QWORD *)&v15 = objc_opt_class(v9).n128_u64[0];
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v16, v15));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Replied"), &stru_1001B67C0, 0));
    v27[1] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
    v20 = (UISegmentedControl *)objc_msgSend(v10, "initWithItems:", v19);
    segmentedControl = v9->_segmentedControl;
    v9->_segmentedControl = v20;

    -[UISegmentedControl setSelectedSegmentIndex:](v9->_segmentedControl, "setSelectedSegmentIndex:", 0);
    -[UISegmentedControl addTarget:action:forControlEvents:](v9->_segmentedControl, "addTarget:action:forControlEvents:", v9, "segmentedControlValueChanged:", 4096);
    -[UISegmentedControl sizeToFit](v9->_segmentedControl, "sizeToFit");
    if (v9->_destination != 2)
    {
      v22 = v9->_segmentedControl;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[InboxSwitcherViewController navigationItem](v9, "navigationItem"));
      objc_msgSend(v23, "setTitleView:", v22);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v24, "addObserver:selector:name:object:", v9, "identityDidChange:", CUIKCalendarModelIdentityChangedNotification, 0);

  }
  return v9;
}

- (void)setDestination:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UISegmentedControl *segmentedControl;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  self->_destination = a3;
  -[InboxNewSectionViewController setDestination:](self->_newSectionViewController, "setDestination:");
  -[InboxRepliedSectionViewController setDestination:](self->_repliedSectionViewController, "setDestination:", a3);
  if (self->_destination == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[InboxSwitcherViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v5, "setTitleView:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[InboxSwitcherViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v6, "setTitle:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController tableView](self->_repliedSectionViewController, "tableView"));
    objc_msgSend(v8, "setPreferredBackgroundColor:", v7);

    v9 = objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
  }
  else
  {
    segmentedControl = self->_segmentedControl;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[InboxSwitcherViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v11, "setTitleView:", segmentedControl);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController tableView](self->_repliedSectionViewController, "tableView"));
    objc_msgSend(v13, "setPreferredBackgroundColor:", v12);

    v9 = objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  }
  v14 = (void *)v9;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionViewController tableView](self->_repliedSectionViewController, "tableView"));
  objc_msgSend(v15, "setBackgroundColor:", v14);

  -[InboxSwitcherViewController _setDoneButtonState](self, "_setDoneButtonState");
}

- (void)loadView
{
  id v3;

  v3 = objc_alloc_init((Class)UIView);
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  -[InboxSwitcherViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)InboxSwitcherViewController;
  -[InboxSwitcherViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = -[InboxSwitcherViewController _showViewControllerAtIndex:](self, "_showViewControllerAtIndex:", 0);
  -[InboxSwitcherViewController _setDoneButtonState](self, "_setDoneButtonState");
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)InboxSwitcherViewController;
  v7 = a4;
  -[InboxSwitcherViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000AC244;
  v8[3] = &unk_1001B2C38;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

- (void)_setDoneButtonState
{
  InboxSwitcherViewControllerDelegate **p_switcherDelegate;
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;

  p_switcherDelegate = &self->_switcherDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherDelegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "inboxSwitcherViewControllerRightBarButtonItem:");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_switcherDelegate);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inboxSwitcherViewControllerRightBarButtonItem:", self));

    v8 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Setting the following right bar button item our delegate returned: [%@]", (uint8_t *)&v10, 0xCu);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[InboxSwitcherViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v9, "setRightBarButtonItem:", v7);

  }
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)InboxSwitcherViewController;
  -[InboxSwitcherViewController viewWillAppear:](&v6, "viewWillAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InboxSwitcherViewController navigationController](self, "navigationController"));
  objc_msgSend(v5, "setToolbarHidden:animated:", 1, 1);

  -[UIViewController beginAppearanceTransition:animated:](self->_currentViewController, "beginAppearanceTransition:animated:", 1, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)InboxSwitcherViewController;
  -[InboxSwitcherViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[UIViewController endAppearanceTransition](self->_currentViewController, "endAppearanceTransition");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)InboxSwitcherViewController;
  -[InboxSwitcherViewController viewWillDisappear:](&v5, "viewWillDisappear:");
  -[UIViewController beginAppearanceTransition:animated:](self->_currentViewController, "beginAppearanceTransition:animated:", 0, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)InboxSwitcherViewController;
  -[InboxSwitcherViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[UIViewController endAppearanceTransition](self->_currentViewController, "endAppearanceTransition");
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIViewController preferredContentSize](self->_currentViewController, "preferredContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)inboxNewSectionViewController:(id)a3 shouldCloseAnimated:(BOOL)a4
{
  _BOOL8 v4;
  InboxSwitcherViewControllerDelegate **p_switcherDelegate;
  id WeakRetained;
  id v8;

  v4 = a4;
  p_switcherDelegate = &self->_switcherDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherDelegate);

  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)p_switcherDelegate);
    objc_msgSend(v8, "inboxSwitcherViewController:shouldCloseAnimated:", self, v4);

  }
}

- (void)inboxNewSectionViewController:(id)a3 inspectEvent:(id)a4
{
  id WeakRetained;
  id v6;
  id v7;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherDelegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_switcherDelegate);
    objc_msgSend(v6, "inboxSwitcherViewController:inspectEvent:", self, v7);

  }
}

- (void)inboxNewSectionViewController:(id)a3 viewCommentsForEvent:(id)a4
{
  id WeakRetained;
  id v6;
  id v7;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherDelegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_switcherDelegate);
    objc_msgSend(v6, "inboxSwitcherViewController:viewCommentsForEvent:", self, v7);

  }
}

- (void)inboxNewSectionViewController:(id)a3 viewProposedTimeForAttendee:(id)a4 onEvent:(id)a5
{
  id v7;
  id WeakRetained;
  id v9;
  id v10;

  v10 = a4;
  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherDelegate);

  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained((id *)&self->_switcherDelegate);
    objc_msgSend(v9, "inboxSwitcherViewController:viewProposedTimeForAttendee:onEvent:", self, v10, v7);

  }
}

- (void)attemptDisplayReviewPrompt
{
  InboxSwitcherViewControllerDelegate **p_switcherDelegate;
  id WeakRetained;
  char v4;
  id v5;

  p_switcherDelegate = &self->_switcherDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherDelegate);
  v4 = objc_opt_respondsToSelector(WeakRetained, "attemptDisplayReviewPrompt");

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_switcherDelegate);
    objc_msgSend(v5, "attemptDisplayReviewPrompt");

  }
}

- (void)identityDidChange:(id)a3
{
  -[InboxRepliedSectionViewController setNeedsRefresh:](self->_repliedSectionViewController, "setNeedsRefresh:", 1);
}

- (void)inboxRepliedSectionViewController:(id)a3 inspectEvent:(id)a4
{
  id WeakRetained;
  id v6;
  id v7;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherDelegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_switcherDelegate);
    objc_msgSend(v6, "inboxSwitcherViewController:inspectEvent:", self, v7);

  }
}

- (id)showNewSection
{
  return -[InboxSwitcherViewController _showViewControllerAtIndex:](self, "_showViewControllerAtIndex:", 0);
}

- (id)showRepliedSection
{
  return -[InboxSwitcherViewController _showViewControllerAtIndex:](self, "_showViewControllerAtIndex:", 1);
}

- (void)inboxWillDismiss
{
  -[InboxNewSectionViewController inboxWillDismiss](self->_newSectionViewController, "inboxWillDismiss");
  -[InboxRepliedSectionViewController inboxWillDismiss](self->_repliedSectionViewController, "inboxWillDismiss");
}

- (void)segmentedControlValueChanged:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v4 = objc_msgSend(a3, "selectedSegmentIndex");
  v5 = -[InboxSwitcherViewController _showViewControllerAtIndex:](self, "_showViewControllerAtIndex:", v4);
  v8 = CFSTR("section");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v4));
  v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));

  CalAnalyticsSendEvent(CFSTR("userTappedInboxControl"), v7);
}

- (id)_viewControllerForIndex:(int64_t)a3
{
  uint64_t v5;
  InboxNewSectionViewController *v6;
  InboxNewSectionViewController *newSectionViewController;
  NSObject *v8;
  InboxNewSectionViewController *v9;
  const char *v10;
  InboxRepliedSectionViewController *v11;
  InboxRepliedSectionViewController *repliedSectionViewController;
  InboxRepliedSectionViewController *v13;
  void *v14;
  void *v15;
  NSObject *v17;
  int v18;
  int64_t v19;

  if (a3 == 1)
  {
    v5 = 48;
    if (!self->_repliedSectionViewController)
    {
      v11 = -[InboxRepliedSectionViewController initWithModel:]([InboxRepliedSectionViewController alloc], "initWithModel:", self->_model);
      repliedSectionViewController = self->_repliedSectionViewController;
      self->_repliedSectionViewController = v11;

      -[InboxRepliedSectionViewController setInboxRepliedSectionDelegate:](self->_repliedSectionViewController, "setInboxRepliedSectionDelegate:", self);
      -[InboxRepliedSectionViewController setDestination:](self->_repliedSectionViewController, "setDestination:", self->_destination);
      v8 = kCalUILogHandle;
      if (!os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
        goto LABEL_10;
      v13 = self->_repliedSectionViewController;
      v18 = 138412290;
      v19 = (int64_t)v13;
      v10 = "Generated the 'replied' section view controller: [%@]";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v18, 0xCu);
LABEL_10:
      if (self->_destination == 2)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v5), "tableView"));
        objc_msgSend(v15, "setPreferredBackgroundColor:", v14);

      }
    }
    return *(id *)((char *)&self->super.super.super.isa + v5);
  }
  if (!a3)
  {
    v5 = 40;
    if (!self->_newSectionViewController)
    {
      v6 = -[InboxNewSectionViewController initWithModel:]([InboxNewSectionViewController alloc], "initWithModel:", self->_model);
      newSectionViewController = self->_newSectionViewController;
      self->_newSectionViewController = v6;

      -[InboxNewSectionViewController setInboxNewSectionDelegate:](self->_newSectionViewController, "setInboxNewSectionDelegate:", self);
      -[InboxNewSectionViewController setDestination:](self->_newSectionViewController, "setDestination:", self->_destination);
      v8 = kCalUILogHandle;
      if (!os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
        goto LABEL_10;
      v9 = self->_newSectionViewController;
      v18 = 138412290;
      v19 = (int64_t)v9;
      v10 = "Generated the 'new' section view controller: [%@]";
      goto LABEL_9;
    }
    return *(id *)((char *)&self->super.super.super.isa + v5);
  }
  v17 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
  {
    v18 = 134217984;
    v19 = a3;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Could not find view controller for index: [%ld]", (uint8_t *)&v18, 0xCu);
  }
  return 0;
}

- (id)_showViewControllerAtIndex:(int64_t)a3
{
  UIViewController *v4;
  UIViewController **p_currentViewController;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  int v18;
  UIViewController *v19;

  v4 = (UIViewController *)objc_claimAutoreleasedReturnValue(-[InboxSwitcherViewController _viewControllerForIndex:](self, "_viewControllerForIndex:", a3));
  p_currentViewController = &self->_currentViewController;
  if (self->_currentViewController != v4)
  {
    v6 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
    {
      v18 = 138412290;
      v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Preparing to show view controller: [%@]", (uint8_t *)&v18, 0xCu);
    }
    if (*p_currentViewController)
    {
      -[UIViewController beginAppearanceTransition:animated:](*p_currentViewController, "beginAppearanceTransition:animated:", 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](*p_currentViewController, "view"));
      objc_msgSend(v7, "removeFromSuperview");

      -[UIViewController endAppearanceTransition](*p_currentViewController, "endAppearanceTransition");
      -[UIViewController removeFromParentViewController](*p_currentViewController, "removeFromParentViewController");
    }
    -[InboxSwitcherViewController addChildViewController:](self, "addChildViewController:", v4);
    -[UIViewController didMoveToParentViewController:](v4, "didMoveToParentViewController:", self);
    objc_storeStrong((id *)&self->_currentViewController, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[InboxSwitcherViewController view](self, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v4, "view"));
    objc_msgSend(v8, "bounds");
    objc_msgSend(v9, "setFrame:");
    objc_msgSend(v9, "setAutoresizingMask:", 18);
    -[UIViewController beginAppearanceTransition:animated:](v4, "beginAppearanceTransition:animated:", 1, 0);
    objc_msgSend(v8, "addSubview:", v9);
    -[UIViewController endAppearanceTransition](v4, "endAppearanceTransition");
    if (self->_destination == 2)
    {
      objc_opt_class(UIScrollView);
      if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
        v11 = v8;
      else
        v11 = 0;
      v12 = v11;
      v13 = v12;
      v14 = 1.0;
      if (v12)
      {
        objc_msgSend(v12, "contentOffset");
        if (v15 != 0.0)
          v14 = 0.0;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[InboxSwitcherViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v16, "_setManualScrollEdgeAppearanceProgress:", v14);

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController title](v4, "title"));
      -[InboxSwitcherViewController setTitle:](self, "setTitle:", v13);
    }

  }
  return v4;
}

- (InboxSwitcherViewControllerDelegate)switcherDelegate
{
  return (InboxSwitcherViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_switcherDelegate);
}

- (void)setSwitcherDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_switcherDelegate, a3);
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_switcherDelegate);
  objc_storeStrong((id *)&self->_repliedSectionViewController, 0);
  objc_storeStrong((id *)&self->_newSectionViewController, 0);
  objc_storeStrong((id *)&self->_currentViewController, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
