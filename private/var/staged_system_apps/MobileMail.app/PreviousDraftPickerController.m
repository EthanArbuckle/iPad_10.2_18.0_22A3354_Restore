@implementation PreviousDraftPickerController

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001CD244;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA508 != -1)
    dispatch_once(&qword_1005AA508, block);
  return (OS_os_log *)(id)qword_1005AA500;
}

- (PreviousDraftPickerController)initWithMessageRepository:(id)a3
{
  id v5;
  PreviousDraftPickerController *v6;
  PreviousDraftPickerController *v7;
  MessageListCollectionHelper *v8;
  MessageListCollectionHelper *collectionHelper;
  MessageListCellLayoutValuesHelper *v10;
  MessageListCellLayoutValuesHelper *layoutValuesHelper;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *mailboxes;
  EMObjectID *v22;
  EMObjectID *composeSectionObjectID;
  void *v24;
  objc_super v26;
  void *v27;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PreviousDraftPickerController;
  v6 = -[PreviousDraftPickerController initWithStyle:](&v26, "initWithStyle:", 2);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_messageRepository, a3);
    v8 = (MessageListCollectionHelper *)objc_msgSend(objc_alloc((Class)MessageListCollectionHelper), "initWithLoggableClient:updateQueueName:sectionObjectID:", v7, CFSTR("com.apple.mobilemail.PreviousDraftPickerController.tableViewUpdate"), 0);
    collectionHelper = v7->_collectionHelper;
    v7->_collectionHelper = v8;

    v10 = (MessageListCellLayoutValuesHelper *)objc_alloc_init((Class)MessageListCellLayoutValuesHelper);
    layoutValuesHelper = v7->_layoutValuesHelper;
    v7->_layoutValuesHelper = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listGroupedCellConfiguration](UIBackgroundConfiguration, "listGroupedCellConfiguration"));
    -[MessageListCellLayoutValuesHelper setDefaultBackgroundConfiguration:](v7->_layoutValuesHelper, "setDefaultBackgroundConfiguration:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[LocalAccount localAccount](LocalAccount, "localAccount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "transientDraftsFolder"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "URL"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForExcludingMessagesInMailboxWithURL:](EMMessageListItemPredicates, "predicateForExcludingMessagesInMailboxWithURL:", v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("PREVIOUS_DRAFT_PICKER_TITLE"), &stru_100531B00, CFSTR("Main")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[EMSmartMailbox unifiedMailboxOfType:name:additionalPredicate:](EMSmartMailbox, "unifiedMailboxOfType:name:additionalPredicate:", 5, v18, v16));
    v27 = v19;
    v20 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
    mailboxes = v7->_mailboxes;
    v7->_mailboxes = (NSArray *)v20;

    v22 = (EMObjectID *)objc_msgSend(objc_alloc((Class)EMObjectID), "initAsEphemeralID:", 1);
    composeSectionObjectID = v7->_composeSectionObjectID;
    v7->_composeSectionObjectID = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v24, "addObserver:selector:name:object:", v7, "_contentSizeCategoryChanged:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PreviousDraftPickerController;
  -[PreviousDraftPickerController traitCollectionDidChange:](&v12, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController traitCollection](self, "traitCollection"));
  v6 = -[PreviousDraftPickerController mf_supportsPopoverPresentation](self, "mf_supportsPopoverPresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController layoutValuesHelper](self, "layoutValuesHelper"));
  objc_msgSend(v7, "setSupportsPopover:", v6);

  if (objc_msgSend(v5, "mf_traitDifferenceAffectsTextLayout:", v4))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController layoutValuesHelper](self, "layoutValuesHelper"));
    objc_msgSend(v8, "setTraitCollection:", v5);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController tableView](self, "tableView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cellForRowAtIndexPath:", v10));

  if (v11)
    objc_msgSend(v11, "mf_updateBackgroundColorForPopover:", -[PreviousDraftPickerController mf_supportsPopoverPresentation](self, "mf_supportsPopoverPresentation"));

}

- (void)viewLayoutMarginsDidChange
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PreviousDraftPickerController;
  -[PreviousDraftPickerController viewLayoutMarginsDidChange](&v12, "viewLayoutMarginsDidChange");
  -[PreviousDraftPickerController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController layoutValuesHelper](self, "layoutValuesHelper"));
  objc_msgSend(v11, "setSystemLayoutMargins:", v4, v6, v8, v10);

}

- (NSDirectionalEdgeInsets)mf_extraContentMargins
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSDirectionalEdgeInsets result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController traitCollection](self, "traitCollection"));
  objc_msgSend(v2, "mf_leadingEdgeToBackButtonText");
  v4 = v3;

  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  v8 = v4;
  result.trailing = v7;
  result.bottom = v6;
  result.leading = v8;
  result.top = v5;
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PreviousDraftPickerController;
  -[PreviousDraftPickerController viewDidLoad](&v12, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PREVIOUS_DRAFT_PICKER_TITLE"), &stru_100531B00, CFSTR("Main")));
  -[PreviousDraftPickerController setTitle:](self, "setTitle:", v4);

  v5 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_cancel:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController tableView](self, "tableView"));
  v8 = objc_opt_class(MessageListTableViewCell);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MessageListTableViewCell reusableIdentifier](MessageListTableViewCell, "reusableIdentifier"));
  objc_msgSend(v7, "registerClass:forCellReuseIdentifier:", v8, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController tableView](self, "tableView"));
  objc_msgSend(v10, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell), CFSTR("PreviousDraftPickerNewMessageCellIdentifier"));

  -[PreviousDraftPickerController _reloadDataSource](self, "_reloadDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController mf_updatePreferredContentSizeBasedOnTableView](self, "mf_updatePreferredContentSizeBasedOnTableView"));
  -[PreviousDraftPickerController setTableViewObserver:](self, "setTableViewObserver:", v11);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PreviousDraftPickerController;
  -[PreviousDraftPickerController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController layoutValuesHelper](self, "layoutValuesHelper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController traitCollection](self, "traitCollection"));
  objc_msgSend(v4, "setTraitCollection:", v5);

  -[PreviousDraftPickerController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
  objc_msgSend(v4, "setSystemLayoutMargins:");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PreviousDraftPickerController;
  -[PreviousDraftPickerController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[PreviousDraftPickerController mf_updateAlertSuppressionContextsForReason:](self, "mf_updateAlertSuppressionContextsForReason:", CFSTR("showed previous drafts picker"));
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PreviousDraftPickerController;
  -[PreviousDraftPickerController viewWillDisappear:](&v3, "viewWillDisappear:", a3);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  PreviousDraftPickerHeaderView *headerView;
  PreviousDraftPickerHeaderView *v8;
  double v9;
  PreviousDraftPickerHeaderView *v10;
  PreviousDraftPickerHeaderView *v11;
  PreviousDraftPickerHeaderView *v12;

  v6 = a3;
  headerView = self->_headerView;
  if (!headerView)
  {
    v8 = [PreviousDraftPickerHeaderView alloc];
    -[PreviousDraftPickerController tableView:heightForHeaderInSection:](self, "tableView:heightForHeaderInSection:", v6, a4);
    v10 = -[PreviousDraftPickerHeaderView initWithFrame:](v8, "initWithFrame:", 0.0, 0.0, 320.0, v9);
    v11 = self->_headerView;
    self->_headerView = v10;

    -[PreviousDraftPickerHeaderView setHasDrafts:](self->_headerView, "setHasDrafts:", -[PreviousDraftPickerController hasDrafts](self, "hasDrafts"));
    headerView = self->_headerView;
  }
  v12 = headerView;

  return v12;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  result = 36.0;
  if (a4 != 1)
    return 20.0;
  return result;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  double v6;
  double v7;
  NSString *v8;
  _BOOL4 IsAccessibilityCategory;

  v5 = a4;
  if (objc_msgSend(v5, "section") == (id)1)
  {
    -[PreviousDraftPickerController draftRowHeight](self, "draftRowHeight");
    v7 = v6;
  }
  else
  {
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v8);

    if (IsAccessibilityCategory)
      v7 = UITableViewAutomaticDimension;
    else
      v7 = 44.0;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController actionBlock](self, "actionBlock"));

  if (v6)
  {
    if (objc_msgSend(v5, "section"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController tableViewDataSource](self, "tableViewDataSource"));
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemIdentifierForIndexPath:", v5));

      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController messageList](self, "messageList"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "messageListItemForItemID:", v8));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1001CDEA0;
      v12[3] = &unk_10051AFB0;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v10, "onScheduler:addSuccessBlock:", v11, v12);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController actionBlock](self, "actionBlock"));
      v8[2](v8, 0, 0);
    }

  }
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  void *v20;
  void *v21;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController tableViewDataSource](self, "tableViewDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIdentifierForIndexPath:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController messageList](self, "messageList"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "messageListItemForItemID:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "result"));

  if (v10)
  {
    v21 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController undoManager](self, "undoManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MFDestructiveTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:](MFDeleteTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:", v11, v12, 5, 2));

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001CE1AC;
    v18[3] = &unk_10051B2E8;
    v18[4] = self;
    v19 = v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "swipeActionWithPreparation:completion:", v18, 0));
    v20 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v15));

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (double)draftRowHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController layoutValuesHelper](self, "layoutValuesHelper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "defaultLayoutValues"));
  objc_msgSend(v3, "defaultRowHeight");
  v5 = v4;

  return v5;
}

- (void)_reloadDataSource
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD block[5];
  _QWORD v14[4];
  id v15;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController mailboxes](self, "mailboxes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController messageRepository](self, "messageRepository"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageList simpleMessageListForMailboxes:withRepository:additionalQueryOptions:shouldUpdateDisplayDate:](EMMessageList, "simpleMessageListForMailboxes:withRepository:additionalQueryOptions:shouldUpdateDisplayDate:", v3, v4, 0, 0));
  -[PreviousDraftPickerController setMessageList:](self, "setMessageList:", v5);

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001CE57C;
  v14[3] = &unk_100523600;
  objc_copyWeak(&v15, &location);
  v6 = objc_retainBlock(v14);
  v7 = objc_alloc((Class)UITableViewDiffableDataSource);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController tableView](self, "tableView"));
  v9 = objc_msgSend(v7, "initWithTableView:cellProvider:", v8, v6);
  -[PreviousDraftPickerController setTableViewDataSource:](self, "setTableViewDataSource:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController collectionHelper](self, "collectionHelper"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "updateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001CE7A8;
  block[3] = &unk_10051AA98;
  block[4] = self;
  dispatch_sync(v11, block);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController messageList](self, "messageList"));
  objc_msgSend(v12, "beginObserving:", self);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_configureCell:(id)a3 itemID:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = objc_opt_class(MessageListTableViewCell);
    v10 = objc_opt_class(v9);
    if ((objc_opt_isKindOfClass(v7, v10) & 1) == 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", v8, v7));
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PreviousDraftPickerController.m"), 351, CFSTR("cell must be an instance of [MessageListTableViewCell class]"));

    }
  }
  v11 = v7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cellHelper"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController layoutValuesHelper](self, "layoutValuesHelper"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cellView"));
  objc_msgSend(v14, "setLayoutValuesHelper:", v13);

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1001CECB8;
  v27[3] = &unk_100521500;
  v15 = v8;
  v28 = v15;
  v16 = v12;
  v29 = v16;
  v17 = objc_retainBlock(v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController messageList](self, "messageList"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "messageListItemForItemID:", v15));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "resultIfAvailable"));
  if (v20)
  {
    ((void (*)(_QWORD *, void *))v17[2])(v17, v20);
  }
  else
  {
    objc_msgSend(v16, "setMessageListItem:style:", 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    objc_msgSend(v19, "onScheduler:addSuccessBlock:", v21, v17);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1001CED80;
    v24[3] = &unk_10051BCB8;
    v25 = v15;
    v26 = v18;
    objc_msgSend(v19, "onScheduler:addFailureBlock:", v22, v24);

  }
}

- (void)_updateHeaderViewDraftsState
{
  -[PreviousDraftPickerHeaderView setHasDrafts:](self->_headerView, "setHasDrafts:", -[PreviousDraftPickerController hasDrafts](self, "hasDrafts"));
}

- (void)_cancel:(id)a3
{
  void *v4;
  void (**v5)(id, uint64_t, _QWORD);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController actionBlock](self, "actionBlock", a3));

  if (v4)
  {
    v5 = (void (**)(id, uint64_t, _QWORD))objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController actionBlock](self, "actionBlock"));
    v5[2](v5, 2, 0);

  }
}

- (void)_contentSizeCategoryChanged:(id)a3
{
  id v4;
  id v5;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController layoutValuesHelper](self, "layoutValuesHelper", a3));
  objc_msgSend(v4, "invalidate");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController tableView](self, "tableView"));
  objc_msgSend(v5, "reloadData");

}

- (BOOL)hasDrafts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController tableViewDataSource](self, "tableViewDataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "snapshot"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController collectionHelper](self, "collectionHelper"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sectionObjectID"));
  v7 = (uint64_t)objc_msgSend(v4, "numberOfItemsInSection:", v6) > 0;

  return v7;
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  PreviousDraftPickerController *v10;
  id v11;
  id v12;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001CF0E0;
  v9[3] = &unk_10051B0A0;
  v10 = self;
  v11 = a4;
  v12 = a5;
  v7 = v12;
  v8 = v11;
  -[PreviousDraftPickerController _performDataSourceUpdateAnimated:collection:update:](v10, "_performDataSourceUpdateAnimated:collection:update:", 1, a3, v9);

}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  PreviousDraftPickerController *v10;
  id v11;
  id v12;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001CF250;
  v9[3] = &unk_10051B0A0;
  v10 = self;
  v11 = a4;
  v12 = a5;
  v7 = v12;
  v8 = v11;
  -[PreviousDraftPickerController _performDataSourceUpdateAnimated:collection:update:](v10, "_performDataSourceUpdateAnimated:collection:update:", 1, a3, v9);

}

- (void)collection:(id)a3 changedItemIDs:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001CF388;
  v7[3] = &unk_10051AE70;
  v8 = a4;
  v6 = v8;
  -[PreviousDraftPickerController _performDataSourceUpdateAnimated:collection:update:](self, "_performDataSourceUpdateAnimated:collection:update:", 1, a3, v7);

}

- (void)collection:(id)a3 deletedItemIDs:(id)a4
{
  -[PreviousDraftPickerController _deleteItemsWithIDs:fromCollection:completionHandler:](self, "_deleteItemsWithIDs:fromCollection:completionHandler:", a4, a3, 0);
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  PreviousDraftPickerController *v12;
  id v13;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001CF484;
  v10[3] = &unk_10051B0A0;
  v11 = a4;
  v12 = self;
  v13 = a5;
  v8 = v13;
  v9 = v11;
  -[PreviousDraftPickerController _performDataSourceUpdateAnimated:collection:update:](self, "_performDataSourceUpdateAnimated:collection:update:", 1, a3, v10);

}

- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  PreviousDraftPickerController *v12;
  id v13;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001CF6D0;
  v10[3] = &unk_10051B0A0;
  v11 = a4;
  v12 = self;
  v13 = a5;
  v8 = v13;
  v9 = v11;
  -[PreviousDraftPickerController _performDataSourceUpdateAnimated:collection:update:](self, "_performDataSourceUpdateAnimated:collection:update:", 1, a3, v10);

}

- (void)collectionDidFinishInitialLoad:(id)a3
{
  void *v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001CF8C8;
  v4[3] = &unk_10051AA98;
  v4[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", a3));
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)_deleteItemsWithIDs:(id)a3 fromCollection:(id)a4 completionHandler:(id)a5
{
  id v8;
  _QWORD v9[4];
  id v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001CF9CC;
  v9[3] = &unk_10051AE70;
  v10 = a3;
  v8 = v10;
  -[PreviousDraftPickerController _performDataSourceUpdateAnimated:collection:update:completionHandler:](self, "_performDataSourceUpdateAnimated:collection:update:completionHandler:", 1, a4, v9, a5);

}

- (void)_performDataSourceUpdateAnimated:(BOOL)a3 collection:(id)a4 update:(id)a5
{
  -[PreviousDraftPickerController _performDataSourceUpdateAnimated:collection:update:completionHandler:](self, "_performDataSourceUpdateAnimated:collection:update:completionHandler:", a3, a4, a5, 0);
}

- (void)_performDataSourceUpdateAnimated:(BOOL)a3 collection:(id)a4 update:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  PreviousDraftPickerController *v19;
  id v20;
  id v21;
  BOOL v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001CFC20;
  v17[3] = &unk_10051AE98;
  v13 = v10;
  v18 = v13;
  v19 = self;
  v14 = v11;
  v20 = v14;
  v22 = a3;
  v15 = v12;
  v21 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  objc_msgSend(v16, "performBlock:", v17);

}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (PreviousDraftPickerHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (UITableViewDiffableDataSource)tableViewDataSource
{
  return self->_tableViewDataSource;
}

- (void)setTableViewDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewDataSource, a3);
}

- (EMMessageRepository)messageRepository
{
  return self->_messageRepository;
}

- (void)setMessageRepository:(id)a3
{
  objc_storeStrong((id *)&self->_messageRepository, a3);
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (void)setMessageList:(id)a3
{
  objc_storeStrong((id *)&self->_messageList, a3);
}

- (MessageListCollectionHelper)collectionHelper
{
  return self->_collectionHelper;
}

- (void)setCollectionHelper:(id)a3
{
  objc_storeStrong((id *)&self->_collectionHelper, a3);
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (void)setMailboxes:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxes, a3);
}

- (EMObjectID)composeSectionObjectID
{
  return self->_composeSectionObjectID;
}

- (void)setComposeSectionObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_composeSectionObjectID, a3);
}

- (MessageListCellLayoutValuesHelper)layoutValuesHelper
{
  return self->_layoutValuesHelper;
}

- (void)setLayoutValuesHelper:(id)a3
{
  objc_storeStrong((id *)&self->_layoutValuesHelper, a3);
}

- (EFCancelable)tableViewObserver
{
  return self->_tableViewObserver;
}

- (void)setTableViewObserver:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewObserver, 0);
  objc_storeStrong((id *)&self->_layoutValuesHelper, 0);
  objc_storeStrong((id *)&self->_composeSectionObjectID, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_collectionHelper, 0);
  objc_storeStrong((id *)&self->_messageList, 0);
  objc_storeStrong((id *)&self->_messageRepository, 0);
  objc_storeStrong((id *)&self->_tableViewDataSource, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong(&self->_actionBlock, 0);
}

@end
