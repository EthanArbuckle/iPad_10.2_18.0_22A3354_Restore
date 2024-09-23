@implementation InboxViewController

- (InboxViewController)initWithModel:(id)a3 destination:(unint64_t)a4
{
  id v8;
  InboxViewController *v9;
  void *v11;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)InboxViewController;
  v9 = -[InboxViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0, 0);
  if (v9)
  {
    if (!v8)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("InboxViewController.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("model != nil"));

    }
    objc_storeStrong((id *)&v9->_model, a3);
    v9->_destination = a4;
  }

  return v9;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;
  int IsRegularInViewHierarchy;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[InboxViewController view](self, "view"));
  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v2, v3);

  if (IsRegularInViewHierarchy)
    return 30;
  else
    return 2;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)loadView
{
  InboxSwitcherViewController *v3;
  InboxSwitcherViewController *switcherViewController;
  UINavigationController *v5;
  UINavigationController *embeddedNavigationController;
  void *v7;
  InboxView *v8;

  v3 = -[InboxSwitcherViewController initWithModel:destination:]([InboxSwitcherViewController alloc], "initWithModel:destination:", self->_model, self->_destination);
  switcherViewController = self->_switcherViewController;
  self->_switcherViewController = v3;

  -[InboxSwitcherViewController setSwitcherDelegate:](self->_switcherViewController, "setSwitcherDelegate:", self);
  v5 = (UINavigationController *)objc_alloc_init((Class)UINavigationController);
  embeddedNavigationController = self->_embeddedNavigationController;
  self->_embeddedNavigationController = v5;

  -[UINavigationController pushViewController:animated:](self->_embeddedNavigationController, "pushViewController:animated:", self->_switcherViewController, 0);
  -[InboxViewController addChildViewController:](self, "addChildViewController:", self->_embeddedNavigationController);
  -[UINavigationController didMoveToParentViewController:](self->_embeddedNavigationController, "didMoveToParentViewController:", self);
  v8 = objc_alloc_init(InboxView);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_embeddedNavigationController, "view"));
  -[InboxView addSubview:](v8, "addSubview:", v7);

  -[InboxViewController setView:](self, "setView:", v8);
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UINavigationController preferredContentSize](self->_embeddedNavigationController, "preferredContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;

  v10.receiver = self;
  v10.super_class = (Class)InboxViewController;
  -[InboxViewController viewDidAppear:](&v10, "viewDidAppear:", a3);
  v4 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 138543362;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear", buf, 0xCu);

  }
  if (+[ApplicationTester testingSessionStarted](ApplicationTester, "testingSessionStarted"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("InboxViewController_ViewDidAppearNotification"), self);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  InboxViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)InboxViewController;
  -[InboxViewController viewDidDisappear:](&v8, "viewDidDisappear:", a3);
  if (self->_wantsDisplayReviewPrompt)
  {
    self->_wantsDisplayReviewPrompt = 0;
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v6 = objc_opt_respondsToSelector(WeakRetained, "attemptDisplayReviewPrompt");

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v7, "attemptDisplayReviewPrompt");

    }
  }
}

- (void)viewWillLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[InboxViewController view](self, "view"));
  objc_msgSend(v12, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_embeddedNavigationController, "view"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (BOOL)prefersForcedModalShowViewController
{
  return 1;
}

- (id)displayedDetailViewControllers
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController viewControllers](self->_embeddedNavigationController, "viewControllers"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v9 = objc_opt_class(EKEventViewController);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0
          || (v10 = objc_opt_class(CNContactViewController), (objc_opt_isKindOfClass(v8, v10) & 1) != 0))
        {
          v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));

          v5 = (void *)v11;
        }
        if (v5)
          objc_msgSend(v5, "addObject:", v8);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)inboxSwitcherViewController:(id)a3 shouldCloseAnimated:(BOOL)a4
{
  -[InboxViewController _dismissMessagesViewController](self, "_dismissMessagesViewController", a3, a4);
}

- (void)_inspectEvent:(id)a3 animated:(BOOL)a4 showComments:(BOOL)a5 proposedTimeAttendee:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int IsCompact;
  void *v16;
  unsigned __int8 v17;
  _QWORD v18[5];
  id v19;
  BOOL v20;
  BOOL v21;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[InboxViewController view](self, "view"));
  if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v12, v13))
  {

LABEL_8:
    -[InboxViewController _pushDetailViewControllerForEvent:animated:showComments:proposedTimeAttendee:](self, "_pushDetailViewControllerForEvent:animated:showComments:proposedTimeAttendee:", v10, v8, v7, v11);
    goto LABEL_9;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[InboxViewController view](self, "view"));
  IsCompact = EKUICurrentHeightSizeClassIsCompact(v14);

  if (IsCompact)
    goto LABEL_8;
  if (objc_msgSend(v10, "participationStatus") == (id)3)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->_model, "eventStore"));
    v17 = objc_msgSend(v16, "showDeclinedEvents");

    if ((v17 & 1) == 0)
    {
      -[UINavigationController _setClipUnderlapWhileTransitioning:](self->_embeddedNavigationController, "_setClipUnderlapWhileTransitioning:", 1);
      goto LABEL_8;
    }
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100041A78;
  v18[3] = &unk_1001B2D58;
  v18[4] = self;
  v19 = v10;
  v20 = v8;
  v21 = v7;
  -[InboxViewController _dismissMessagesViewControllerWithCompletion:](self, "_dismissMessagesViewControllerWithCompletion:", v18);

LABEL_9:
}

- (void)inboxSwitcherViewController:(id)a3 inspectEvent:(id)a4
{
  -[InboxViewController _inspectEvent:animated:showComments:proposedTimeAttendee:](self, "_inspectEvent:animated:showComments:proposedTimeAttendee:", a4, 1, 0, 0);
}

- (void)inboxSwitcherViewController:(id)a3 viewCommentsForEvent:(id)a4
{
  -[InboxViewController _inspectEvent:animated:showComments:proposedTimeAttendee:](self, "_inspectEvent:animated:showComments:proposedTimeAttendee:", a4, 1, 1, 0);
}

- (void)inboxSwitcherViewController:(id)a3 viewProposedTimeForAttendee:(id)a4 onEvent:(id)a5
{
  -[InboxViewController _inspectEvent:animated:showComments:proposedTimeAttendee:](self, "_inspectEvent:animated:showComments:proposedTimeAttendee:", a5, 1, 1, a4);
}

- (id)inboxSwitcherViewControllerRightBarButtonItem:(id)a3
{
  id v3;

  if (self->_destination)
    v3 = 0;
  else
    v3 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_dismissMessagesViewController");
  return v3;
}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v5;

  objc_msgSend(a3, "setDelegate:", 0, a4);
  v5 = -[UINavigationController popViewControllerAnimated:](self->_embeddedNavigationController, "popViewControllerAnimated:", 1);
}

- (BOOL)eventViewControllerShouldHideInlineEditButton
{
  return 1;
}

- (BOOL)eventViewControllerShouldShowNextPreviousRecurrenceButtons
{
  return 0;
}

- (void)attemptDisplayReviewPrompt
{
  self->_wantsDisplayReviewPrompt = 1;
}

- (BOOL)canDismiss
{
  return 1;
}

- (InboxSwitcherViewController)switcherViewController
{
  return self->_switcherViewController;
}

- (void)showEvent:(id)a3 animated:(BOOL)a4
{
  -[InboxViewController _inspectEvent:animated:showComments:proposedTimeAttendee:](self, "_inspectEvent:animated:showComments:proposedTimeAttendee:", a3, a4, 0, 0);
}

- (void)_pushDetailViewControllerForEvent:(id)a3 animated:(BOOL)a4 showComments:(BOOL)a5 proposedTimeAttendee:(id)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  EKEventViewController *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "calendar"));
  v13 = objc_msgSend(v12, "type");

  if (v13 != (id)4)
    goto LABEL_3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CalContactsProvider defaultProvider](CalContactsProvider, "defaultProvider"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "birthdayContactIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys"));
  v23 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "unifiedContactWithIdentifier:keysToFetch:", v15, v17));

  v19 = (EKEventViewController *)objc_claimAutoreleasedReturnValue(+[CNContactViewController viewControllerForContact:](CNContactViewController, "viewControllerForContact:", v18));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[CalContactsProvider defaultProvider](CalContactsProvider, "defaultProvider"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "contactStore"));
  -[EKEventViewController setContactStore:](v19, "setContactStore:", v21);

  -[EKEventViewController setShouldShowLinkedContacts:](v19, "setShouldShowLinkedContacts:", 1);
  -[EKEventViewController setDisplayMode:](v19, "setDisplayMode:", 1);
  -[EKEventViewController setActions:](v19, "setActions:", (unint64_t)-[EKEventViewController actions](v19, "actions") | 0x400);
  -[EKEventViewController setAllowsEditing:](v19, "setAllowsEditing:", 0);

  if (!v19)
  {
LABEL_3:
    if (v11)
    {
      v19 = (EKEventViewController *)objc_msgSend(objc_alloc((Class)EKUIProposedTimeEventViewController), "initWithProposedTimeAttendee:", v11);
      -[EKEventViewController setEvent:](v19, "setEvent:", v10);
      -[EKEventViewController setDelegate:](v19, "setDelegate:", self);
      v8 = 1;
    }
    else
    {
      v19 = objc_opt_new(EKEventViewController);
      v8 = 1;
      -[EKEventViewController setCalendarPreviewIsInlineDayView:](v19, "setCalendarPreviewIsInlineDayView:", 1);
      -[EKEventViewController setEvent:](v19, "setEvent:", v10);
      -[EKEventViewController setAllowsEditing:](v19, "setAllowsEditing:", 1);
      -[EKEventViewController setDelegate:](v19, "setDelegate:", self);
      -[EKEventViewController setAllowsCalendarPreview:](v19, "setAllowsCalendarPreview:", 1);
      -[EKEventViewController setShowsDetectedConferenceItem:](v19, "setShowsDetectedConferenceItem:", 1);
    }
  }
  -[UINavigationController pushViewController:animated:](self->_embeddedNavigationController, "pushViewController:animated:", v19, v8);
  if (v7)
  {
    v22 = objc_opt_class(EKEventViewController);
    if ((objc_opt_isKindOfClass(v19, v22) & 1) != 0)
      -[EKEventViewController openAttendeesDetailItem](v19, "openAttendeesDetailItem");
  }

}

- (void)_dismissMessagesViewController
{
  -[InboxViewController _dismissMessagesViewControllerWithCompletion:](self, "_dismissMessagesViewControllerWithCompletion:", 0);
}

- (void)_dismissMessagesViewControllerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InboxViewController view](self, "view"));
  objc_msgSend(v5, "endEditing:", 1);

  -[InboxSwitcherViewController inboxWillDismiss](self->_switcherViewController, "inboxWillDismiss");
  v6 = -[UINavigationController popViewControllerAnimated:](self->_embeddedNavigationController, "popViewControllerAnimated:", 0);
  if (v4)
  {
    self->_wantsDisplayReviewPrompt = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InboxViewController presentingViewController](self, "presentingViewController"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100041FBC;
    v10[3] = &unk_1001B2D80;
    v10[4] = self;
    v11 = v4;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 0, v10);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[InboxViewController doneBlock](self, "doneBlock"));

    if (v8)
    {
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[InboxViewController doneBlock](self, "doneBlock"));
      ((void (**)(_QWORD, InboxViewController *, _QWORD))v9)[2](v9, self, 0);

    }
  }

}

- (id)doneBlock
{
  return self->_doneBlock;
}

- (void)setDoneBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (InboxViewControllerDelegate)delegate
{
  return (InboxViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_doneBlock, 0);
  objc_storeStrong((id *)&self->_switcherViewController, 0);
  objc_storeStrong((id *)&self->_embeddedNavigationController, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
