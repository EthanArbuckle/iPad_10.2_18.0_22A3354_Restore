@implementation CalendarsViewController

- (CalendarsViewController)initWithModel:(id)a3 destination:(unint64_t)a4
{
  id v7;
  CalendarsViewController *v8;
  CalendarsViewController *v9;
  void *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CalendarsViewController;
  v8 = -[CalendarsViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_model, a3);
    v9->_destination = a4;
    if (a4 == 2)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v10, "addObserver:selector:name:object:", v9, "_identityChanged:", CUIKCalendarModelIdentityChangedNotification, v7);

    }
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CalendarsViewController;
  -[CalendarsViewController dealloc](&v4, "dealloc");
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;
  int IsRegularInViewHierarchy;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarsViewController view](self, "view"));
  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v2, v3);

  if (IsRegularInViewHierarchy)
    return 30;
  else
    return 26;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CalendarsViewController backgroundColor](self, "backgroundColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarsViewController view](self, "view"));
  objc_msgSend(v3, "setBackgroundColor:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainView"));
  objc_msgSend(v4, "setBackgroundColor:", v5);

}

- (void)loadView
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id *p_chooser;
  UINavigationController *v9;
  UINavigationController *embeddedNavigationController;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CalendarsView *v15;
  void *chooser;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = (id)objc_claimAutoreleasedReturnValue(-[CalendarsViewController model](self, "model"));
  v3 = objc_alloc((Class)EKCalendarChooser);
  if (self->_destination == 2)
    v4 = 1000;
  else
    v4 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "eventStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sourceForSelectedIdentity"));
  *(_WORD *)((char *)&v18 + 1) = 257;
  LOBYTE(v18) = self->_destination != 2;
  v7 = objc_msgSend(v3, "initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", 1, v4, 0, 0, v5, v6, v18);

  if (self->_destination == 2)
  {
    -[CalendarsViewController addChildViewController:](self, "addChildViewController:", v7);
    p_chooser = (id *)&self->_chooser;
  }
  else
  {
    v9 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v7);
    p_chooser = (id *)&self->_embeddedNavigationController;
    embeddedNavigationController = self->_embeddedNavigationController;
    self->_embeddedNavigationController = v9;

    -[CalendarsViewController addChildViewController:](self, "addChildViewController:", self->_embeddedNavigationController);
  }
  objc_msgSend(*p_chooser, "didMoveToParentViewController:", self);
  if (v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "selectedCalendarsIgnoringFocus"));
    objc_msgSend(v7, "setSelectedCalendars:", v11);

    objc_msgSend(v7, "setDelegate:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "collapsedSectionIdentifiers"));
    objc_msgSend(v7, "setCollapsedSectionIdentifiers:", v12);

    objc_msgSend(v7, "setShowsDoneButton:", self->_destination == 0);
    objc_msgSend(v7, "setAllowsPullToRefresh:", 1);
    objc_msgSend(v7, "setShowsDeclinedEventsSetting:", objc_msgSend(v19, "invitationBearingStoresExistForEvents"));
    objc_msgSend(v7, "setShowsCompletedRemindersSetting:", 1);
    objc_msgSend(v7, "setShowDetailAccessories:", 1);
    objc_storeStrong((id *)&self->_chooser, v7);
    -[CalendarsViewController _updateChooserForFocusMode](self, "_updateChooserForFocusMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", self, "selectedCalendarsChanged:", CUIKCalendarModelFilterChangedNotification, v19);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", self, "focusModeConfigurationChanged:", CUIKCalendarModelFocusModeConfigurationChangedNotification, v19);

  }
  v15 = -[RootView initWithFrame:]([CalendarsView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  chooser = self->_embeddedNavigationController;
  if (!chooser)
    chooser = self->_chooser;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(chooser, "view"));
  -[RootView setMainView:](v15, "setMainView:", v17);
  -[CalendarsViewController setView:](self, "setView:", v15);

}

- (void)_updateChooserForFocusMode
{
  void *v3;
  _BOOL8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel unselectedCalendarsForFocusMode](self->_model, "unselectedCalendarsForFocusMode"));
  v4 = v3 != 0;

  -[EKCalendarChooser setDisableCalendarsUnselectedByFocus:](self->_chooser, "setDisableCalendarsUnselectedByFocus:", v4);
}

- (void)calendarChooserUpdatedToolbarItems
{
  id v3;

  if (!self->_embeddedNavigationController)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[EKCalendarChooser toolbarItems](self->_chooser, "toolbarItems"));
    -[CalendarsViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v3, 1);

  }
}

- (void)viewDidLoad
{
  void *embeddedNavigationController;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CalendarsViewController;
  -[CalendarsViewController viewDidLoad](&v6, "viewDidLoad");
  embeddedNavigationController = self->_embeddedNavigationController;
  if (!embeddedNavigationController)
    embeddedNavigationController = self->_chooser;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(embeddedNavigationController, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarsViewController backgroundColor](self, "backgroundColor"));
  objc_msgSend(v4, "setBackgroundColor:", v5);

}

- (BOOL)isModalInPresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  objc_super v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarsViewController embeddedNavigationController](self, "embeddedNavigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));

  objc_opt_class(UINavigationController);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v8 = objc_msgSend(v7, "isModalInPresentation");

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CalendarsViewController;
    v8 = -[CalendarsViewController isModalInPresentation](&v10, "isModalInPresentation");
  }

  return v8;
}

- (void)showCalendar:(id)a3 enableDoneInitially:(BOOL)a4
{
  -[EKCalendarChooser showCalendar:enableDoneInitially:](self->_chooser, "showCalendar:enableDoneInitially:", a3, a4);
}

- (void)selectedCalendarsChanged:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CalendarsViewController model](self, "model", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedCalendarsIgnoringFocus"));
  -[EKCalendarChooser setSelectedCalendars:](self->_chooser, "setSelectedCalendars:", v4);

}

- (void)focusModeConfigurationChanged:(id)a3
{
  -[CalendarsViewController _updateChooserForFocusMode](self, "_updateChooserForFocusMode", a3);
  -[EKCalendarChooser focusModeConfigurationChanged](self->_chooser, "focusModeConfigurationChanged");
}

- (void)_identityChanged:(id)a3
{
  EKCalendarChooser *chooser;
  void *v4;
  id v5;

  chooser = self->_chooser;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CalendarsViewController model](self, "model", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceForSelectedIdentity"));
  -[EKCalendarChooser identityChanged:](chooser, "identityChanged:", v4);

}

- (void)calendarChooserSelectionDidChange:(id)a3
{
  CUIKCalendarModel *model;
  id v5;
  void *v6;
  void *v7;

  model = self->_model;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sourceForSelectedIdentity](model, "sourceForSelectedIdentity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedCalendars"));

  -[CUIKCalendarModel updateSourceForSelectedIdentity:selectedCalendars:](model, "updateSourceForSelectedIdentity:selectedCalendars:", v6, v7);
  -[CalendarsViewController _saveFilterAndNotifyWithReason:](self, "_saveFilterAndNotifyWithReason:", CFSTR("calendar chooser selection changed"));
}

- (void)calendarChooserSelectedIdentityDidChange:(id)a3
{
  CUIKCalendarModel *model;
  void *v5;

  model = self->_model;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "sourceForSelectedIdentity"));
  -[CUIKCalendarModel updateSourceForSelectedIdentity:selectedCalendars:](model, "updateSourceForSelectedIdentity:selectedCalendars:", v5, 0);

  -[CalendarsViewController _saveFilterAndNotifyWithReason:](self, "_saveFilterAndNotifyWithReason:", CFSTR("calendar chooser selected identity changed"));
}

- (void)calendarChooserCollapsedSectionIdentifiersDidChange:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "collapsedSectionIdentifiers"));
  -[CUIKCalendarModel setCollapsedSectionIdentifiers:](self->_model, "setCollapsedSectionIdentifiers:", v4);

}

- (void)_saveFilterAndNotifyWithReason:(id)a3
{
  CUIKCalendarModel *model;
  id v5;
  id v6;

  model = self->_model;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedCalendarsIgnoringFocus](model, "selectedCalendarsIgnoringFocus"));
  -[CUIKCalendarModel setSelectedCalendarsAndRequestPreferenceSave:reason:](self->_model, "setSelectedCalendarsAndRequestPreferenceSave:reason:", v6, v5);

}

- (id)refreshCalendarsButtonPressed
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  CalAnalyticsSendEvent(CFSTR("userPerformedManualRefresh"), &off_1001BC9B0);
  v3 = objc_alloc((Class)EKAccountRefresher);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarsViewController model](self, "model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventStore"));
  v6 = objc_msgSend(v3, "initWithEventStore:", v5);

  objc_msgSend(v6, "refresh");
  return v6;
}

- (unint64_t)focusFilterMode
{
  return (unint64_t)-[CUIKCalendarModel focusFilterMode](self->_model, "focusFilterMode");
}

- (void)setFocusFilterMode:(unint64_t)a3
{
  -[CUIKCalendarModel setFocusFilterMode:](self->_model, "setFocusFilterMode:", a3);
}

- (NSSet)unselectedCalendarsForFocusMode
{
  return (NSSet *)-[CUIKCalendarModel unselectedCalendarsForFocusMode](self->_model, "unselectedCalendarsForFocusMode");
}

- (void)calendarChooserDidFinish:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);

  -[CalendarsViewController _saveFilterAndNotifyWithReason:](self, "_saveFilterAndNotifyWithReason:", CFSTR("calendar chooser dismissed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarsViewController embeddedNavigationController](self, "embeddedNavigationController"));
  v5 = objc_msgSend(v4, "popViewControllerAnimated:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarsViewController doneBlock](self, "doneBlock"));
  if (v6)
  {
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CalendarsViewController doneBlock](self, "doneBlock"));
    ((void (**)(_QWORD, CalendarsViewController *, _QWORD))v7)[2](v7, self, 0);

    -[CalendarsViewController setDoneBlock:](self, "setDoneBlock:", 0);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[CalendarsViewController _saveFilterAndNotifyWithReason:](self, "_saveFilterAndNotifyWithReason:", CFSTR("calendarsviewcontroller dismissed"));
  v5.receiver = self;
  v5.super_class = (Class)CalendarsViewController;
  -[CalendarsViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (BOOL)prefersForcedModalShowViewController
{
  return 1;
}

- (id)centeredCalendar
{
  return -[EKCalendarChooser centeredCalendar](self->_chooser, "centeredCalendar");
}

- (void)centerOnCalendar:(id)a3
{
  -[EKCalendarChooser centerOnCalendar:](self->_chooser, "centerOnCalendar:", a3);
}

- (void)showAddSubscribedCalendarWithURL:(id)a3
{
  -[EKCalendarChooser showAddSubscribedCalendarWithURL:](self->_chooser, "showAddSubscribedCalendarWithURL:", a3);
}

- (void)openAddRegularCalendarWithTitle:(id)a3
{
  -[EKCalendarChooser openAddRegularCalendarWithTitle:](self->_chooser, "openAddRegularCalendarWithTitle:", a3);
}

- (id)displayedEditor
{
  return -[EKCalendarChooser displayedEditor](self->_chooser, "displayedEditor");
}

- (id)preservedState
{
  CalendarsViewControllerPreservedState *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  Class v10;
  Class v11;
  Class v12;
  void *v13;
  uint64_t v14;
  PresentedViewControllerState *v15;
  void *v16;
  void *v17;
  void *v18;
  char *v19;
  char *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v3 = objc_alloc_init(CalendarsViewControllerPreservedState);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarChooser centeredCalendar](self->_chooser, "centeredCalendar"));
  -[CalendarsViewControllerPreservedState setCenteredCalendar:](v3, "setCenteredCalendar:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarChooser displayedEditor](self->_chooser, "displayedEditor"));
  -[CalendarsViewControllerPreservedState setDisplayedEditor:](v3, "setDisplayedEditor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = objc_claimAutoreleasedReturnValue(-[CalendarsViewController presentedViewController](self, "presentedViewController"));
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      objc_opt_class(UIActivityViewController);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0
        || (v10 = NSClassFromString(CFSTR("MFMessageComposeViewController")),
            (objc_opt_isKindOfClass(v8, v10) & 1) != 0)
        || (v11 = NSClassFromString(CFSTR("_UIContextMenuActionsOnlyViewController")),
            (objc_opt_isKindOfClass(v8, v11) & 1) != 0)
        || (v12 = NSClassFromString(CFSTR("DDParsecCollectionViewController")),
            (objc_opt_isKindOfClass(v8, v12) & 1) != 0))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentingViewController"));
        objc_msgSend(v13, "dismissViewControllerAnimated:completion:", 0, 0);

        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));
      }
      else
      {
        v15 = objc_alloc_init(PresentedViewControllerState);
        -[PresentedViewControllerState setViewController:](v15, "setViewController:", v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "popoverPresentationController"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sourceView"));
        -[PresentedViewControllerState setSourceView:](v15, "setSourceView:", v17);

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "popoverPresentationController"));
        -[PresentedViewControllerState setArrowDirection:](v15, "setArrowDirection:", objc_msgSend(v18, "permittedArrowDirections"));

        objc_msgSend(v6, "addObject:", v15);
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));

        v8 = v15;
      }

      v8 = (void *)v14;
    }
    while (v14);
  }
  if (objc_msgSend(v6, "count"))
  {
    v19 = (char *)objc_msgSend(v6, "count");
    v20 = v19 - 1;
    if (v19 != (char *)1)
    {
      v21 = 0;
      do
      {
        v22 = v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v20));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "viewController"));

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "presentingViewController"));
        objc_msgSend(v24, "dismissViewControllerAnimated:completion:", 0, 0);

        --v20;
      }
      while (v20);

    }
    -[CalendarsViewControllerPreservedState setPresentedViewControllersState:](v3, "setPresentedViewControllersState:", v6);
  }

  return v3;
}

- (void)restorePreservedState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  EKCalendarChooser *chooser;
  void *v8;
  EKCalendarChooser *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayedEditor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedCalendarsIgnoringFocus](self->_model, "selectedCalendarsIgnoringFocus"));
  -[EKCalendarChooser setSelectedCalendars:](self->_chooser, "setSelectedCalendars:", v6);

  chooser = self->_chooser;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centeredCalendar"));
  -[EKCalendarChooser centerOnCalendar:](chooser, "centerOnCalendar:", v8);

  v9 = self->_chooser;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000DA194;
  v12[3] = &unk_1001B2CD8;
  v12[4] = self;
  v13 = v4;
  v14 = v5;
  v10 = v5;
  v11 = v4;
  -[EKCalendarChooser redisplayEditor:completion:](v9, "redisplayEditor:completion:", v10, v12);

}

- (void)restorePresentedViewControllers:(id)a3 startIndex:(unint64_t)a4 presenter:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  CalendarsViewController *v32;
  id v33;
  unint64_t v34;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewControllersState"));
  if ((unint64_t)objc_msgSend(v10, "count") > a4)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", a4));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewController"));
    objc_opt_class(UINavigationController);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0
      && (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "viewControllers")),
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayedEditor")),
          v16 = objc_msgSend(v14, "containsObject:", v15),
          v15,
          v14,
          v16))
    {
      -[CalendarsViewController restorePresentedViewControllers:startIndex:presenter:](self, "restorePresentedViewControllers:startIndex:presenter:", v8, a4 + 1, v9);
    }
    else
    {
      objc_opt_class(UIColorPickerViewController);
      if ((objc_opt_isKindOfClass(v12, v17) & 1) != 0
        || (objc_opt_class(UIActivityViewController), (objc_opt_isKindOfClass(v12, v18) & 1) != 0))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sourceView"));

        if (v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sourceView"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "popoverPresentationController"));
          objc_msgSend(v21, "setSourceView:", v20);

          v22 = objc_msgSend(v11, "arrowDirection");
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "popoverPresentationController"));
          objc_msgSend(v23, "setPermittedArrowDirections:", v22);

        }
        else
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayedEditor"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "navigationController"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "view"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "popoverPresentationController"));
          objc_msgSend(v26, "setSourceView:", v25);

        }
      }
      else
      {
        objc_msgSend(v12, "setModalPresentationStyle:", 3);
      }
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1000DA448;
      v29[3] = &unk_1001B3498;
      v30 = v12;
      v31 = v9;
      v32 = self;
      v33 = v8;
      v34 = a4;
      v27 = objc_retainBlock(v29);
      ((void (*)(void))v27[2])();

    }
  }

}

- (id)backgroundColor
{
  return +[UIColor tableViewBackgroundColorOpaque](UIColor, "tableViewBackgroundColorOpaque");
}

- (BOOL)canDismiss
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarsViewController embeddedNavigationController](self, "embeddedNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewControllers"));
  v4 = objc_msgSend(v3, "count") == (id)1;

  return v4;
}

- (id)doneBlock
{
  return self->_doneBlock;
}

- (void)setDoneBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CUIKCalendarModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (UINavigationController)embeddedNavigationController
{
  return self->_embeddedNavigationController;
}

- (void)setEmbeddedNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_embeddedNavigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddedNavigationController, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong(&self->_doneBlock, 0);
  objc_storeStrong((id *)&self->_chooser, 0);
}

@end
