@implementation MailSplitViewController

- (void)_notifyViewStateChanged:(int64_t)a3
{
  void *v5;
  void *v6;
  UITraitCollection *transitionalTraitCollection;
  void *v8;
  NSMutableDictionary *v9;

  v9 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v5, CFSTR("MailSplitViewControllerNewDisplayModeKey"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MailSplitViewController isCollapsed](self, "isCollapsed")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v6, CFSTR("MailSplitViewControllerIsCollapsedKey"));

  transitionalTraitCollection = self->_transitionalTraitCollection;
  if (transitionalTraitCollection)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", transitionalTraitCollection, CFSTR("MailSplitViewControllerNewTraitCollectionKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("MailSplitViewControllerViewStateChangedNotification"), self, v9);

}

- (id)mf_preferredTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailSplitViewController messageListContainerViewController](self, "messageListContainerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mf_preferredTitle"));

  return v3;
}

- (BOOL)isCollapsed
{
  return -[MailSplitViewController _isCollapsed](self, "_isCollapsed");
}

- (MailSplitViewController)initWithMailboxPickerNavigationController:(id)a3 messageListNavigationController:(id)a4 mailDetailNavigationController:(id)a5 scene:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MailSplitViewController *v15;
  MailSplitViewController *v16;
  uint64_t v17;
  MailboxPickerOutlineController *mailboxPickerController;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSNumber *previouslyFocusedColumn;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)MailSplitViewController;
  v15 = -[MailSplitViewController initWithStyle:](&v26, "initWithStyle:", 2);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_messageListNavController, a4);
    objc_storeStrong((id *)&v16->_messageDetailNavController, a5);
    objc_storeStrong((id *)&v16->_mailboxPickerNavController, a3);
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topViewController"));
    mailboxPickerController = v16->_mailboxPickerController;
    v16->_mailboxPickerController = (MailboxPickerOutlineController *)v17;

    objc_storeWeak((id *)&v16->_scene, v14);
    -[MailSplitViewController setDelegate:](v16, "setDelegate:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailSplitViewBackgroundColor](UIColor, "mailSplitViewBackgroundColor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MailSplitViewController view](v16, "view"));
    objc_msgSend(v20, "setBackgroundColor:", v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MailSplitViewController view](v16, "view"));
    objc_msgSend(v21, "setOpaque:", 0);

    -[MailSplitViewController _setPrefersOverlayInRegularWidthPhone:](v16, "_setPrefersOverlayInRegularWidthPhone:", 1);
    -[MailSplitViewController setViewController:forColumn:](v16, "setViewController:forColumn:", v11, 0);
    -[MailSplitViewController setViewController:forColumn:](v16, "setViewController:forColumn:", v12, 1);
    -[MailSplitViewController setViewController:forColumn:](v16, "setViewController:forColumn:", v13, 2);
    v22 = (void *)objc_opt_new(UISlidingBarConfiguration);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailSplitViewBorderColor](UIColor, "mailSplitViewBorderColor"));
    objc_msgSend(v22, "setBorderColor:", v23);

    -[MailSplitViewController setConfiguration:](v16, "setConfiguration:", v22);
    v16->_messageListHasFocus = 1;
    previouslyFocusedColumn = v16->_previouslyFocusedColumn;
    v16->_previouslyFocusedColumn = (NSNumber *)&off_100541758;

  }
  return v16;
}

- (void)splitViewControllerDidCollapse:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  self->_hasFinishedInitialLayout = 1;
  v5 = v4;
  -[MailSplitViewController _notifyViewStateChanged:](self, "_notifyViewStateChanged:", objc_msgSend(v4, "displayMode"));

}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v6;

  v6 = a3;
  if (a4 == 1)
    -[MailSplitViewController _dismissVisiblePopoverInSplitViewController](self, "_dismissVisiblePopoverInSplitViewController");
  -[MailSplitViewController _notifyViewStateChanged:](self, "_notifyViewStateChanged:", a4);

}

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  _QWORD v12[5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailSplitViewController previouslyFocusedColumn](self, "previouslyFocusedColumn", a3));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailSplitViewController previouslyFocusedColumn](self, "previouslyFocusedColumn"));
    a4 = (int64_t)objc_msgSend(v7, "integerValue");

    -[MailSplitViewController setPreviouslyFocusedColumn:](self, "setPreviouslyFocusedColumn:", 0);
  }
  else if (-[MailSplitViewController _conversationViewControllerHasReferenceMessage](self, "_conversationViewControllerHasReferenceMessage")&& !-[MailSplitViewController messageListHasFocus](self, "messageListHasFocus"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailSplitViewController viewControllerForColumn:](self, "viewControllerForColumn:", 0));
    v9 = objc_msgSend(v8, "isEditing");

    if (v9)
      a4 = 0;
  }
  else
  {
    a4 = 1;
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003A2FC;
  v12[3] = &unk_10051AA98;
  v12[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailSplitViewController mailboxPickerController](self, "mailboxPickerController"));
  objc_msgSend(v10, "updateForSplitViewCollapseStateChanged:", 1);

  return a4;
}

- (void)showMessageListViewController:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  _DWORD v10[2];
  __int16 v11;
  _BOOL4 v12;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = objc_claimAutoreleasedReturnValue(+[MailSplitViewController log](MailSplitViewController, "log"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109376;
    v10[1] = v6;
    v11 = 1024;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "showMessageListViewController: %{BOOL}d, animated: %{BOOL}d", (uint8_t *)v10, 0xEu);
  }

  -[MailSplitViewController mf_setColumn:visible:animated:completion:](self, "mf_setColumn:visible:animated:completion:", 1, v6, v5, v8);
}

- (void)setPreviouslyFocusedColumn:(id)a3
{
  objc_storeStrong((id *)&self->_previouslyFocusedColumn, a3);
}

- (NSNumber)previouslyFocusedColumn
{
  return self->_previouslyFocusedColumn;
}

- (MailNavigationController)mailboxPickerNavController
{
  return self->_mailboxPickerNavController;
}

- (MailboxPickerOutlineController)mailboxPickerController
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailSplitViewController mailboxPickerNavController](self, "mailboxPickerNavController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewControllers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));

  return (MailboxPickerOutlineController *)v4;
}

+ (NSArray)menuCommands
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = (void *)qword_1005A9E10;
  if (!qword_1005A9E10)
  {
    v3 = sub_10002C654((uint64_t)MailSplitViewController);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = sub_10002C048((uint64_t)MailSplitViewController);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v6));
    v8 = (void *)qword_1005A9E10;
    qword_1005A9E10 = v7;

    v2 = (void *)qword_1005A9E10;
  }
  return (NSArray *)v2;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C4A0;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9DF0 != -1)
    dispatch_once(&qword_1005A9DF0, block);
  return (id)qword_1005A9DE8;
}

- (void)setFocusedViewController:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailNavigationController viewControllers](self->_messageListNavController, "viewControllers"));
  -[MailSplitViewController setMessageListHasFocus:](self, "setMessageListHasFocus:", objc_msgSend(v4, "containsObject:", v5));

}

- (void)setMessageListHasFocus:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;

  if (self->_messageListHasFocus != a3)
  {
    v3 = a3;
    self->_messageListHasFocus = a3;
    v4 = objc_claimAutoreleasedReturnValue(+[MailSplitViewController log](MailSplitViewController, "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = CFSTR("conversation view");
      if (v3)
        v5 = CFSTR("message list");
      v6 = 138543362;
      v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Changed split view focus to %{public}@.", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)showMailboxPickerController:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  _DWORD v10[2];
  __int16 v11;
  _BOOL4 v12;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = objc_claimAutoreleasedReturnValue(+[MailSplitViewController log](MailSplitViewController, "log"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109376;
    v10[1] = v6;
    v11 = 1024;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "showMailboxPickerController: %{BOOL}d, animated: %{BOOL}d", (uint8_t *)v10, 0xEu);
  }

  -[MailSplitViewController mf_setColumn:visible:animated:completion:](self, "mf_setColumn:visible:animated:completion:", 0, v6, v5, v8);
}

- (void)showConversationViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  UINavigationBarAppearance *v11;
  void *v12;
  NSObject *v13;
  void **v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void *v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  _BOOL4 v21;

  v4 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(+[MailSplitViewController log](MailSplitViewController, "log"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "showConversationViewController animated: %{BOOL}d", buf, 8u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailSplitViewController scene](self, "scene"));
  if (objc_msgSend(v8, "isInExpandedEnvironment") | !v4)
  {
    v9 = 0;
LABEL_5:

    goto LABEL_8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailDetailNavigationController conversationViewController](self->_messageDetailNavController, "conversationViewController"));

  if (v9 && !objc_msgSend(v9, "conversationSortOrder"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "messageCountHint"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resultWithTimeout:error:", 0, 0.0299999993));

    if (v8)
    {
      if ((uint64_t)objc_msgSend(v8, "integerValue") < 2)
        goto LABEL_5;
      v11 = objc_opt_new(UINavigationBarAppearance);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navigationItem"));
      objc_msgSend(v12, "setScrollEdgeAppearance:", v11);

      v14 = _NSConcreteStackBlock;
      v15 = 3221225472;
      v16 = sub_1000F86C0;
      v17 = &unk_10051D7E0;
      v18 = v9;
      v19 = v6;
      v6 = objc_retainBlock(&v14);

      v13 = v18;
    }
    else
    {
      v13 = objc_claimAutoreleasedReturnValue(+[MailSplitViewController log](MailSplitViewController, "log"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_100392DF0(v13);
    }

    goto LABEL_5;
  }
LABEL_8:
  -[MailSplitViewController mf_setColumn:visible:animated:completion:](self, "mf_setColumn:visible:animated:completion:", 2, 1, v4, v6, v14, v15, v16, v17);

}

- (MessageListContainerViewController)messageListContainerViewController
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailSplitViewController messageListNavController](self, "messageListNavController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewControllers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));

  return (MessageListContainerViewController *)v4;
}

- (ConversationViewController)conversationViewController
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailSplitViewController messageDetailNavController](self, "messageDetailNavController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewControllers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));

  return (ConversationViewController *)v4;
}

- (void)_dismissVisiblePopoverInSplitViewController
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailSplitViewController splitViewController](self, "splitViewController", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewControllers"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "mf_dismissPresentedViewControllerInPopover");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)_conversationViewControllerHasReferenceMessage
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailDetailNavigationController conversationViewController](self->_messageDetailNavController, "conversationViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "referenceMessageListItem"));
  v4 = v3 != 0;

  return v4;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;
  _QWORD v9[5];
  _QWORD v10[5];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[MailSplitViewController setTransitioningSize:](self, "setTransitioningSize:", 1);
  v9[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000F8B98;
  v10[3] = &unk_10051C0B8;
  v10[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000F8E2C;
  v9[3] = &unk_10051C0B8;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v10, v9);
  v8.receiver = self;
  v8.super_class = (Class)MailSplitViewController;
  -[MailSplitViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  UITraitCollection *v6;
  UITraitCollection *transitionalTraitCollection;
  objc_super v8;

  v6 = (UITraitCollection *)a3;
  v8.receiver = self;
  v8.super_class = (Class)MailSplitViewController;
  -[MailSplitViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v8, "willTransitionToTraitCollection:withTransitionCoordinator:", v6, a4);
  transitionalTraitCollection = self->_transitionalTraitCollection;
  self->_transitionalTraitCollection = v6;

}

- (void)traitCollectionDidChange:(id)a3
{
  UITraitCollection *transitionalTraitCollection;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MailSplitViewController;
  -[MailSplitViewController traitCollectionDidChange:](&v5, "traitCollectionDidChange:", a3);
  transitionalTraitCollection = self->_transitionalTraitCollection;
  self->_transitionalTraitCollection = 0;

}

- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4
{
  unsigned __int8 v6;
  id v7;

  v6 = -[MailSplitViewController isTransitioningSize](self, "isTransitioningSize", a3);
  if (a4 == 1 && (v6 & 1) == 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MailSplitViewController messageListContainerViewController](self, "messageListContainerViewController"));
    objc_msgSend(v7, "updateForSplitViewControllerHidingMessageList");

  }
}

- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4
{
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000F9074;
  v6[3] = &unk_10051AA98;
  v6[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v6);
  return a4;
}

- (void)splitViewControllerDidExpand:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  self->_hasFinishedInitialLayout = 1;
  v5 = v4;
  -[MailSplitViewController _notifyViewStateChanged:](self, "_notifyViewStateChanged:", objc_msgSend(v4, "displayMode"));

}

- (void)splitViewControllerInteractivePresentationGestureWillBegin:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MailDetailNavigationController conversationViewController](self->_messageDetailNavController, "conversationViewController", a3));
  if (v3)
    objc_msgSend(v3, "beginInteractiveResizing");

}

- (void)splitViewControllerInteractivePresentationGestureDidEnd:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MailDetailNavigationController conversationViewController](self->_messageDetailNavController, "conversationViewController", a3));
  if (v3)
    objc_msgSend(v3, "endResizing");

}

- (UIBarButtonItem)supplementaryButtonItem
{
  void *v2;
  UIBarButtonItem *v4;
  UIBarButtonItem *supplementaryButtonItem;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (!self->_supplementaryButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", 0, 0, self, "_showMessageListViewController");
    -[UIBarButtonItem _setShowsBackButtonIndicator:](v4, "_setShowsBackButtonIndicator:", 1);
    supplementaryButtonItem = self->_supplementaryButtonItem;
    self->_supplementaryButtonItem = v4;

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailSplitViewController messageListContainerViewController](self, "messageListContainerViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
  v9 = v8;
  if (!v8)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("BACK"), &stru_100531B00, CFSTR("Main")));
  }
  -[UIBarButtonItem setTitle:](self->_supplementaryButtonItem, "setTitle:", v9);
  if (!v8)
  {

  }
  return self->_supplementaryButtonItem;
}

- (void)_showMessageListViewController
{
  -[MailSplitViewController showMessageListViewController:animated:completion:](self, "showMessageListViewController:animated:completion:", 1, 1, 0);
}

- (void)restorePrimaryNavigationState:(int64_t)a3
{
  NSNumber *previouslyFocusedColumn;
  NSNumber *v5;

  if (a3 == 2)
  {
    previouslyFocusedColumn = self->_previouslyFocusedColumn;
    v5 = (NSNumber *)&off_100541788;
  }
  else
  {
    previouslyFocusedColumn = self->_previouslyFocusedColumn;
    if (a3)
      v5 = (NSNumber *)&off_100541758;
    else
      v5 = (NSNumber *)&off_100541770;
  }
  self->_previouslyFocusedColumn = v5;

  self->_messageListHasFocus = (id)-[NSNumber integerValue](self->_previouslyFocusedColumn, "integerValue") == (id)1;
}

- (id)keyCommands
{
  char isKindOfClass;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  char v10;

  if (-[MailSplitViewController displayMode](self, "displayMode") == (id)1
    || -[MailSplitViewController isCollapsed](self, "isCollapsed"))
  {
    isKindOfClass = 1;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailSplitViewController scene](self, "scene"));
    v5 = objc_opt_class(MailConversationScene);
    isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MailSplitViewController conversationViewArrowCommands](MailSplitViewController, "conversationViewArrowCommands"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000F951C;
  v9[3] = &unk_10051EA38;
  v10 = isKindOfClass & 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_map:", v9));

  return v7;
}

+ (id)conversationViewArrowCommands
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[4];

  v2 = (void *)qword_1005A9E00;
  if (!qword_1005A9E00)
  {
    v3 = sub_1000F9714(0, (uint64_t)UIKeyInputUpArrow, 0, (uint64_t)"_selectNextMessageCommandInvoked:", 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v14[0] = v4;
    v5 = sub_1000F9714((uint64_t)v4, (uint64_t)UIKeyInputUpArrow, 0x100000, (uint64_t)"_selectNextMessageCommandInvoked:", 0, 0, (uint64_t)&off_100542498);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v14[1] = v6;
    v7 = sub_1000F9714((uint64_t)v6, (uint64_t)UIKeyInputDownArrow, 0, (uint64_t)"_selectPreviousMessageCommandInvoked:", 0, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v14[2] = v8;
    v9 = sub_1000F9714((uint64_t)v8, (uint64_t)UIKeyInputDownArrow, 0x100000, (uint64_t)"_selectPreviousMessageCommandInvoked:", 0, 0, (uint64_t)&off_1005424C0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v14[3] = v10;
    v11 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 4));
    v12 = (void *)qword_1005A9E00;
    qword_1005A9E00 = v11;

    v2 = (void *)qword_1005A9E00;
  }
  return v2;
}

- (BOOL)messageListCanPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  BOOL v12;
  void *v13;

  v6 = a4;
  v7 = objc_opt_class(UICommand);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = v6;
    if (sub_1000F9A6C(self, (char *)a3, v8))
    {
      LOBYTE(v9) = 0;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailSplitViewController messageListContainerViewController](self, "messageListContainerViewController"));
      v11 = objc_msgSend(v10, "canHandleAction:withMailMenuCommand:", a3, v8);

      v12 = "_favoriteMailboxShortcutInvoked:" == a3;
      if ("_favoriteMailboxShortcutInvoked:" == a3)
        LOBYTE(v9) = 0;
      else
        LOBYTE(v9) = v11;
      if (v12 && ((v11 ^ 1) & 1) == 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailSplitViewController mailboxPickerController](self, "mailboxPickerController"));
        v9 = objc_msgSend(v13, "isEditing") ^ 1;

      }
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)conversationViewControllerCanPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  unsigned __int8 v10;

  v6 = a4;
  v7 = objc_opt_class(UICommand);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailDetailNavigationController conversationViewController](self->_messageDetailNavController, "conversationViewController"));
    if (sub_1000F9A6C(self, (char *)a3, v8) == 1)
      v10 = objc_msgSend(v9, "canHandleAction:withMailMenuCommand:", a3, v8);
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  void *v4;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v7 = a4;
  v8 = sub_1000F9A6C(self, (char *)a3, v7);
  switch(v8)
  {
    case 0:
      v10 = objc_claimAutoreleasedReturnValue(-[MailSplitViewController messageListContainerViewController](self, "messageListContainerViewController"));
      goto LABEL_7;
    case 1:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailSplitViewController messageListContainerViewController](self, "messageListContainerViewController"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "conversationViewController"));

      break;
    case 2:
      v13.receiver = self;
      v13.super_class = (Class)MailSplitViewController;
      v9 = -[MailSplitViewController targetForAction:withSender:](&v13, "targetForAction:withSender:", a3, v7);
      v10 = objc_claimAutoreleasedReturnValue(v9);
LABEL_7:
      v4 = (void *)v10;
      break;
  }

  return v4;
}

- (MailNavigationController)messageListNavController
{
  return self->_messageListNavController;
}

- (MailDetailNavigationController)messageDetailNavController
{
  return self->_messageDetailNavController;
}

- (void)setMailboxPickerNavController:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxPickerNavController, a3);
}

- (void)setMailboxPickerController:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxPickerController, a3);
}

- (void)setSupplementaryButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryButtonItem, a3);
}

- (BOOL)messageListHasFocus
{
  return self->_messageListHasFocus;
}

- (BOOL)hasFinishedInitialLayout
{
  return self->_hasFinishedInitialLayout;
}

- (MailboxSelectionCapable)scene
{
  return (MailboxSelectionCapable *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (BOOL)isTransitioningSize
{
  return self->_transitioningSize;
}

- (void)setTransitioningSize:(BOOL)a3
{
  self->_transitioningSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslyFocusedColumn, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_supplementaryButtonItem, 0);
  objc_storeStrong((id *)&self->_mailboxPickerController, 0);
  objc_storeStrong((id *)&self->_mailboxPickerNavController, 0);
  objc_storeStrong((id *)&self->_messageDetailNavController, 0);
  objc_storeStrong((id *)&self->_messageListNavController, 0);
  objc_storeStrong((id *)&self->_transitionalTraitCollection, 0);
}

@end
