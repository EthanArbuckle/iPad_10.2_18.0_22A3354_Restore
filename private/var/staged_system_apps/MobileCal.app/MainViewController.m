@implementation MainViewController

- (void)extendedLaunchCompletedByViewType:(int)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (a3 >= 5)
    *(_QWORD *)&a3 = -1;
  else
    v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)&a3));
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v5, CFSTR("_MainViewControllerExtendedLaunchDidCompleteNotification_CalendarContentViewType_Key")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MainViewControllerDidCompleteExtendedLaunchNotification"), self, v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MainViewController;
  -[MainViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000640C;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  -[MainViewController setSceneTitleNeedsUpdate](self, "setSceneTitleNeedsUpdate");
}

- (void)setSceneTitleNeedsUpdate
{
  void *v3;
  void *v4;
  id v5;

  if (EKUIDeviceCanTransform(self, a2))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "windowScene"));

    if (v5)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v4, "postNotificationName:object:", CFSTR("_CalendarWindowSceneTitleRequiresUpdateNotification"), v5);

    }
  }
}

- (MainViewController)initWithWindow:(id)a3 model:(id)a4
{
  id v6;
  id v7;
  MainViewController *v8;
  MainViewController *v9;
  id WeakRetained;
  objc_class *v11;
  NSString *v12;
  void *v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MainViewController;
  v8 = -[MainViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", 0, 0);
  v9 = v8;
  if (v8)
  {
    if (!v6)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v8->_window);
      v11 = (objc_class *)objc_opt_class(v9);
      v12 = NSStringFromClass(v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v12);
      EKUIMultiwindowAssert(WeakRetained != 0, CFSTR("nil window passed into initializer for %@"));

    }
    objc_storeWeak((id *)&v9->_window, v6);
    objc_storeStrong((id *)&v9->_model, a4);
  }

  return v9;
}

- (UIWindow)window
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_window);
}

- (CUIKCalendarModel)model
{
  return self->_model;
}

- (id)shownEventEditViewController
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController viewControllerToShowFrom](self, "viewControllerToShowFrom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));

  if (!v4)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController presentedViewController](self, "presentedViewController"));
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___EKEventOrIntegrationEditView))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (id)targetViewControllerForAction:(SEL)a3 sender:(id)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  MainViewController *v11;

  if (NSSelectorFromString(CFSTR("showViewController:sender:animated:completion:")) == a3
    || "showViewController:sender:" == a3)
  {
    if (-[MainViewController prefersShowingViewControllersOnNavigationStack](self, "prefersShowingViewControllersOnNavigationStack")|| (v7 = objc_claimAutoreleasedReturnValue(-[MainViewController ekui_futureTraitCollection](self, "ekui_futureTraitCollection"))) == 0|| (v8 = (void *)v7, v9 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController ekui_futureTraitCollection](self, "ekui_futureTraitCollection")), v10 = objc_msgSend(v9, "horizontalSizeClass"), v9, v8, v10 == (id)1))
    {
      v11 = (MainViewController *)objc_claimAutoreleasedReturnValue(-[MainViewController navigationController](self, "navigationController"));
    }
    else
    {
      v11 = (MainViewController *)objc_claimAutoreleasedReturnValue(-[MainViewController managedNavigationController](self, "managedNavigationController"));
    }
  }
  else
  {
    v11 = self;
  }
  return v11;
}

- (BOOL)prefersShowingViewControllersOnNavigationStack
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[EnqueueableManagedNavigationController setSourceViewController:](self->_managedNavigationController, "setSourceViewController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MainViewController;
  -[MainViewController dealloc](&v3, "dealloc");
}

- (BOOL)wantsManagement
{
  return 1;
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (BOOL)shouldModallyPresentFirstShownViewController
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
  v3 = objc_msgSend(v2, "horizontalSizeClass") == (id)2;

  return v3;
}

- (Class)managedNavigationControllerType
{
  return (Class)objc_opt_class(EnqueueableManagedNavigationController);
}

- (UINavigationController)managedNavigationController
{
  EnqueueableManagedNavigationController *managedNavigationController;
  EnqueueableManagedNavigationController *v4;
  EnqueueableManagedNavigationController *v5;
  void *v6;
  void *v7;

  managedNavigationController = self->_managedNavigationController;
  if (!managedNavigationController)
  {
    v4 = (EnqueueableManagedNavigationController *)objc_alloc_init(-[MainViewController managedNavigationControllerType](self, "managedNavigationControllerType"));
    v5 = self->_managedNavigationController;
    self->_managedNavigationController = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController view](self->_managedNavigationController, "view"));
    objc_msgSend(v7, "setBackgroundColor:", v6);

    -[EnqueueableManagedNavigationController setDefinesPresentationContext:](self->_managedNavigationController, "setDefinesPresentationContext:", 1);
    -[EnqueueableManagedNavigationController setSourceViewController:](self->_managedNavigationController, "setSourceViewController:", self);
    -[MainViewController _setManagedNavigationControllerModalPresentationDelegates](self, "_setManagedNavigationControllerModalPresentationDelegates");
    managedNavigationController = self->_managedNavigationController;
  }
  return (UINavigationController *)managedNavigationController;
}

- (void)_setManagedNavigationControllerModalPresentationDelegates
{
  MainViewController *v3;

  if (-[MainViewController shouldModallyPresentFirstShownViewController](self, "shouldModallyPresentFirstShownViewController"))
  {
    v3 = self;
  }
  else
  {
    v3 = 0;
  }
  -[EnqueueableManagedNavigationController setModalPresentationDelegate:](self->_managedNavigationController, "setModalPresentationDelegate:", v3);
}

- (BOOL)shouldAdaptEventViewControllers
{
  return 1;
}

- (BOOL)shouldJournalMainViewControllerParent
{
  return 1;
}

- (void)invalidateManagedNavigationController
{
  _QWORD *v3;
  void *v4;
  unsigned int v5;
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000BA8E0;
  v6[3] = &unk_1001B2538;
  v6[4] = self;
  v3 = objc_retainBlock(v6);
  -[MainViewController managedNavigationControllerWillBeInvalidated](self, "managedNavigationControllerWillBeInvalidated");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController presentedViewController](self, "presentedViewController"));
  v5 = objc_msgSend(v4, "isEqual:", self->_managedNavigationController);

  if (v5)
    -[MainViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v3);
  else
    ((void (*)(_QWORD *))v3[2])(v3);

}

- (BOOL)shouldInvalidateManagedNavigationControllerOnPresentationDismissal
{
  return 1;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController traitCollection](self, "traitCollection"));
  v9 = objc_msgSend(v8, "horizontalSizeClass");
  if (v9 != objc_msgSend(v6, "horizontalSizeClass"))
  {
    -[MainViewController setEkui_futureTraitCollection:](self, "setEkui_futureTraitCollection:", v6);
    goto LABEL_5;
  }
  v10 = objc_msgSend(v8, "verticalSizeClass");
  v11 = objc_msgSend(v6, "verticalSizeClass");
  -[MainViewController setEkui_futureTraitCollection:](self, "setEkui_futureTraitCollection:", v6);
  if (v10 != v11)
  {
LABEL_5:
    -[MainViewController invalidateManagedNavigationController](self, "invalidateManagedNavigationController");
    v12.receiver = self;
    v12.super_class = (Class)MainViewController;
    -[MainViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v12, "willTransitionToTraitCollection:withTransitionCoordinator:", v6, v7);
    -[MainViewController setupUIForTraitCollection:](self, "setupUIForTraitCollection:", v6);
    goto LABEL_6;
  }
  v12.receiver = self;
  v12.super_class = (Class)MainViewController;
  -[MainViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v12, "willTransitionToTraitCollection:withTransitionCoordinator:", v6, v7);
LABEL_6:

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (a3)
  {
    -[MainViewController setEkui_futureTraitCollection:](self, "setEkui_futureTraitCollection:", 0);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController parentViewController](self, "parentViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ekui_futureTraitCollection"));
    -[MainViewController setEkui_futureTraitCollection:](self, "setEkui_futureTraitCollection:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController parentViewController](self, "parentViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ekui_futureTraitCollection"));
    -[MainViewController setupUIForTraitCollection:](self, "setupUIForTraitCollection:", v9);

  }
  v10.receiver = self;
  v10.super_class = (Class)MainViewController;
  -[MainViewController traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v5);

}

- (id)shownContactViewController
{
  uint64_t v3;

  v3 = objc_opt_class(CNContactViewController);
  return -[MainViewController _shownViewControllerWithClass:](self, "_shownViewControllerWithClass:", v3);
}

- (id)shownExpandedReminderStackViewController
{
  uint64_t v3;

  v3 = objc_opt_class(EKExpandedReminderStackViewController);
  return -[MainViewController _shownViewControllerWithClass:](self, "_shownViewControllerWithClass:", v3);
}

- (id)shownEventViewController
{
  uint64_t v3;

  v3 = objc_opt_class(EKEventViewController);
  return -[MainViewController _shownViewControllerWithClass:](self, "_shownViewControllerWithClass:", v3);
}

- (id)_shownViewControllerWithClass:(Class)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_1000BACE0;
  v13 = sub_1000BACF0;
  v14 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController viewControllerToShowFrom](self, "viewControllerToShowFrom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllers"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000BACF8;
  v8[3] = &unk_1001B4A58;
  v8[4] = &v9;
  v8[5] = a3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

- (BOOL)performModalDialogsIfNeededWithContinue:(id)a3
{
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  return 0;
}

- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  if (objc_msgSend(v12, "prefersForcedModalShowViewController"))
  {
    v13 = -[MainViewController presentationStyleOverrideForChildViewControllers](self, "presentationStyleOverrideForChildViewControllers");
    if (v13 != (id)-1)
    {
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController viewControllerToShowFrom](self, "viewControllerToShowFrom"));
      objc_msgSend(v15, "setModalPresentationStyle:", v14);

    }
  }
  v16 = (id)objc_claimAutoreleasedReturnValue(-[MainViewController viewControllerToShowFrom](self, "viewControllerToShowFrom"));
  objc_msgSend(v16, "showViewController:sender:animated:completion:", v12, v11, v6, v10);

}

- (id)augmentEventDetailsContext:(id)a3
{
  void *v4;
  CUIKCalendarModel *model;
  _QWORD v7[2];
  _QWORD v8[2];

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:"));
    objc_msgSend(v4, "setObject:forKey:", &__kCFBooleanTrue, EKUIEventDetailsContext_AllowsConferenceItem);
    objc_msgSend(v4, "setObject:forKey:", self->_model, EKUIEventDetailsContext_ModelKey);
    return v4;
  }
  else
  {
    v7[0] = EKUIEventDetailsContext_AllowsConferenceItem;
    v7[1] = EKUIEventDetailsContext_ModelKey;
    model = self->_model;
    v8[0] = &__kCFBooleanTrue;
    v8[1] = model;
    return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2));
  }
}

- (BOOL)eventViewControllerShowsInlinePreview
{
  return 1;
}

- (void)reconfigureViewController:(id)a3
{
  uint64_t v4;
  _BOOL8 v5;
  id v6;
  id v7;

  v7 = a3;
  objc_opt_class(EKEventViewController);
  if ((objc_opt_isKindOfClass(v7, v4) & 1) != 0)
  {
    v5 = -[MainViewController eventViewControllerShowsInlinePreview](self, "eventViewControllerShowsInlinePreview");
    v6 = v7;
    objc_msgSend(v6, "setAllowsCalendarPreview:", v5);
    objc_msgSend(v6, "setCalendarPreviewIsInlineDayView:", v5);

  }
}

- (BOOL)handlesNotifyOnExtendedLaunchCompletion
{
  return 0;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MainViewController;
  -[MainViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  if (-[MainViewController isViewLoaded](self, "isViewLoaded"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController view](self, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));

    if (v9)
    {
      if (!-[MainViewController disableRotationTimings](self, "disableRotationTimings"))
        -[MainViewController transitionToSizeWillStart](self, "transitionToSizeWillStart");
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000BB0B8;
      v10[3] = &unk_1001B2C38;
      v10[4] = self;
      objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v10);
    }
  }

}

- (void)transitionToSizeWillStart
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  MainViewController *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController testingRotationWillStartNotificationName](self, "testingRotationWillStartNotificationName"));
  if (v3 && +[ApplicationTester testingSessionStarted](ApplicationTester, "testingSessionStarted"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000BB1A0;
    v5[3] = &unk_1001B26A0;
    v6 = v3;
    v7 = self;
    objc_msgSend(v4, "installCACommitCompletionBlock:", v5);

  }
}

- (void)transitionToSizeDidEnd
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController testingRotationDidEndNotificationName](self, "testingRotationDidEndNotificationName"));
  if (v3)
  {
    v6 = v3;
    v4 = +[ApplicationTester testingSessionStarted](ApplicationTester, "testingSessionStarted");
    v3 = v6;
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v5, "postNotificationName:object:", v6, self);

      v3 = v6;
    }
  }

}

- (id)testingRotationWillStartNotificationName
{
  return 0;
}

- (id)testingRotationDidEndNotificationName
{
  return 0;
}

- (id)EKUI_viewHierarchy
{
  UIWindow **p_window;
  id WeakRetained;
  id v5;
  objc_class *v6;
  NSString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;

  p_window = &self->_window;
  WeakRetained = objc_loadWeakRetained((id *)&self->_window);

  v5 = objc_loadWeakRetained((id *)p_window);
  if (!WeakRetained)
  {
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v7);
    EKUIMultiwindowAssert(v5 != 0, CFSTR("No window for %@"));

    v9 = EKUIMainWindowForMultiwindowError(v8);
    v5 = (id)objc_claimAutoreleasedReturnValue(v9);
  }
  return v5;
}

- (id)preferredPreSizeClassTransitionSelectedDate
{
  return 0;
}

- (id)existingPalette
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController navigationController](self, "navigationController"));
  objc_opt_class(RootNavigationController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController navigationController](self, "navigationController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "paletteView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "containingPalette"));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)selectDate:(id)a3 andTime:(BOOL)a4 animated:(BOOL)a5
{
  -[MainViewController selectDate:animated:](self, "selectDate:animated:", a3, a5);
}

- (BOOL)isDateVisible:(id)a3
{
  return 0;
}

- (id)sceneTitle
{
  return 0;
}

- (BOOL)requiresSelfAsEventEditorDelegate
{
  return 0;
}

- (void)attemptDisplayReviewPrompt
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windowScene"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  +[EKUIAppReviewUtils displayReviewPromptIfNeededInScene:calendarModel:](EKUIAppReviewUtils, "displayReviewPromptIfNeededInScene:calendarModel:", v3, v4);

}

- (BOOL)disableRotationTimings
{
  return self->_disableRotationTimings;
}

- (void)setDisableRotationTimings:(BOOL)a3
{
  self->_disableRotationTimings = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_managedNavigationController, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  uint64_t v2;

  v2 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v2);
  return 0;
}

- (BOOL)allowsOverriddenToolbarItems
{
  uint64_t v2;

  v2 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v2);
  return 0;
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = sub_10002E49C((uint64_t)self);
  sub_1000438B0(v7, v6, v8);
}

- (void)selectDate:(id)a3 animated:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = sub_10002E49C((uint64_t)self);
  sub_1000438B0(v5, v4, v6);
}

- (int64_t)intendedSizeClass
{
  uint64_t v2;

  v2 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v2);
  return 0;
}

@end
