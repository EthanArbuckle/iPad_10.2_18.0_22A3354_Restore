@implementation MessageListViewController

- (UIBarButtonItem)markButtonItem
{
  UIBarButtonItem *markButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  markButtonItem = self->_markButtonItem;
  if (!markButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithPrimaryAction:", 0);
    v5 = self->_markButtonItem;
    self->_markButtonItem = v4;

    if (-[MessageListViewController _shouldShowButtonImages](self, "_shouldShowButtonImages"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphMarkElipsis));
      -[UIBarButtonItem setImage:](self->_markButtonItem, "setImage:", v6);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MARK_BUTTON"), &stru_100531B00, CFSTR("Main")));
      -[UIBarButtonItem setTitle:](self->_markButtonItem, "setTitle:", v7);

    }
    -[UIBarButtonItem setSecondaryActionsArePrimary:](self->_markButtonItem, "setSecondaryActionsArePrimary:", 1);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10012CD54;
    v9[3] = &unk_10051FE58;
    objc_copyWeak(&v10, &location);
    -[UIBarButtonItem _setSecondaryActionsProvider:](self->_markButtonItem, "_setSecondaryActionsProvider:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    markButtonItem = self->_markButtonItem;
  }
  return markButtonItem;
}

- (void)_reloadFlattenedMailboxes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController flattenedMailboxesFuture](self, "flattenedMailboxesFuture"));
  objc_msgSend(v3, "cancel");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
  if (objc_msgSend(v4, "isUnifiedMailbox"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "future"));
    -[MessageListViewController setFlattenedMailboxesFuture:](self, "setFlattenedMailboxesFuture:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_map:", &stru_10051FA20));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v8));
    v10 = objc_msgSend(objc_alloc((Class)EMQuery), "initWithTargetClass:predicate:sortDescriptors:", objc_opt_class(EMMailbox), v9, &__NSArray0__struct);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxRepository](self, "mailboxRepository"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100122D18;
    v15[3] = &unk_10051E288;
    v12 = v5;
    v16 = v12;
    objc_msgSend(v11, "performQuery:completionHandler:", v10, v15);

  }
  else if ((objc_msgSend(v4, "containsSmartMailbox") & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithResult:](EFFuture, "futureWithResult:", v13));
    -[MessageListViewController setFlattenedMailboxesFuture:](self, "setFlattenedMailboxesFuture:", v14);

  }
}

- (MessageTriageInteractionHelper)messageTriageInteractionHelper
{
  MessageTriageInteractionHelper *messageTriageInteractionHelper;
  MessageTriageInteractionHelper *v4;
  void *v5;
  MessageTriageInteractionHelper *v6;
  MessageTriageInteractionHelper *v7;

  messageTriageInteractionHelper = self->_messageTriageInteractionHelper;
  if (!messageTriageInteractionHelper)
  {
    v4 = [MessageTriageInteractionHelper alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
    v6 = -[MessageTriageInteractionHelper initWithDataSource:triageInteractionDelegate:scene:presentingViewController:](v4, "initWithDataSource:triageInteractionDelegate:scene:presentingViewController:", self, self, v5, self);
    v7 = self->_messageTriageInteractionHelper;
    self->_messageTriageInteractionHelper = v6;

    messageTriageInteractionHelper = self->_messageTriageInteractionHelper;
  }
  return messageTriageInteractionHelper;
}

- (void)messageListDataSourceDidSkipUpdate:(id)a3 section:(id)a4 change:(id)a5
{
  id v5;
  void *v6;
  uint64_t v7;
  MessageListViewController *v8;
  id v9;

  v8 = self;
  v5 = a5;
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_10003A64C, &unk_10051A910, v8));
  objc_msgSend(v6, "performBlock:", &v7);

}

- (void)_invalidateCachedUseCompactRows
{
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  MessageListViewController *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  _BOOL4 v24;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v5 = objc_msgSend(v4, "isInExpandedEnvironment");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "verticalSizeClass");

  v8 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class(self);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v15 = 138413314;
    v16 = v11;
    v17 = 2048;
    v18 = self;
    v19 = 2114;
    v20 = v13;
    v21 = 1024;
    v22 = v5;
    v23 = 1024;
    v24 = v7 == (id)1;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%@: %p> %{public}@ isInExpandedEnvironment: %{BOOL}d, isVerticallyCompact: %{BOOL}d", (uint8_t *)&v15, 0x2Cu);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
  objc_msgSend(v14, "setIsCompact:", v5 & (v7 == (id)1));

}

- (id)currentEditButtonItem
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (-[MessageListViewController _shouldDisplaySearchButtons](self, "_shouldDisplaySearchButtons"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchEditButtonItem](self, "searchEditButtonItem"));

    if (!v3)
    {
      v4 = +[UIBarButtonItem mf_newMultiBarButtonItemWithTarget:action:](UIBarButtonItem, "mf_newMultiBarButtonItemWithTarget:action:", self, "_editButtonTapped:");
      -[MessageListViewController setSearchEditButtonItem:](self, "setSearchEditButtonItem:", v4);

    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchEditButtonItem](self, "searchEditButtonItem"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController multiEditButtonItem](self, "multiEditButtonItem"));

    if (!v6)
    {
      v7 = +[UIBarButtonItem mf_newMultiBarButtonItemWithTarget:action:](UIBarButtonItem, "mf_newMultiBarButtonItemWithTarget:action:", self, "_editButtonTapped:");
      -[MessageListViewController setMultiEditButtonItem:](self, "setMultiEditButtonItem:", v7);

    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController multiEditButtonItem](self, "multiEditButtonItem"));
  }
  return v5;
}

- (id)mf_preferredTitle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  return v4;
}

- (MessageListSearchViewController)messageListSearchViewController
{
  MessageListSearchViewController *messageListSearchViewController;
  MessageListSearchViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MessageListSearchViewController *v9;

  messageListSearchViewController = self->_messageListSearchViewController;
  if (!messageListSearchViewController)
  {
    v4 = [MessageListSearchViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController accountsProvider](self, "accountsProvider"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController contactStore](self, "contactStore"));
    v9 = -[MessageListSearchViewController initWithMainScene:mailboxes:accountsProvider:favoritesShortcutsProvider:contactStore:](v4, "initWithMainScene:mailboxes:accountsProvider:favoritesShortcutsProvider:contactStore:", v5, v6, v7, 0, v8);
    -[MessageListViewController setMessageListSearchViewController:](self, "setMessageListSearchViewController:", v9);

    messageListSearchViewController = self->_messageListSearchViewController;
  }
  return messageListSearchViewController;
}

- (void)_applyScrollableHint
{
  uint64_t (**v3)(_QWORD);
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  MessageListViewController *v20;
  __int16 v21;
  id v22;

  v3 = (uint64_t (**)(_QWORD))objc_claimAutoreleasedReturnValue(-[MessageListViewController scrollableHintBlock](self, "scrollableHintBlock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController navigationController](self, "navigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "toolbar"));

  if (v3)
  {
    v6 = v3[2](v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
    objc_msgSend(v8, "frame");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v11));

    if (v12)
    {
      v13 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (objc_class *)objc_opt_class(self);
        v15 = NSStringFromClass(v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v17 = 138412802;
        v18 = v16;
        v19 = 2048;
        v20 = self;
        v21 = 2048;
        v22 = objc_msgSend(v12, "integerValue");
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "<%@: %p> Setting toolbar._appearanceHint:%ld", (uint8_t *)&v17, 0x20u);

      }
      objc_msgSend(v5, "_setAppearanceHint:", objc_msgSend(v12, "integerValue"));
    }

  }
}

- (void)_setMailboxes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));

  if (v4)
    -[MessageListViewController _callUpdateScrollableHintBlock](self, "_callUpdateScrollableHintBlock");
  -[MessageListViewController setPrimitiveMailboxes:](self, "setPrimitiveMailboxes:", v7);
  if (v7)
    -[MessageListViewController _applyScrollableHint](self, "_applyScrollableHint");
  -[MessageListViewController _updateResolvedMailboxObjectIDs](self, "_updateResolvedMailboxObjectIDs");
  -[MessageListViewController _reloadFlattenedMailboxes](self, "_reloadFlattenedMailboxes");
  -[MessageListViewController _updateTitle](self, "_updateTitle");
  -[MessageListViewController _updateStatusObservers](self, "_updateStatusObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
  -[MessageListViewController _initializeMailboxBrowseUserActivityWithMailboxes:](self, "_initializeMailboxBrowseUserActivityWithMailboxes:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController cellsController](self, "cellsController"));
  objc_msgSend(v6, "reportMessageListCellMetrics");

}

- (void)_updateLayoutMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;

  -[MessageListViewController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v32 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController layoutValuesHelper](self, "layoutValuesHelper"));
  objc_msgSend(v32, "setSystemLayoutMargins:", v4, v6, v8, v10);

  -[MessageListViewController mf_updateExtraNavigationBarMargins](self, "mf_updateExtraNavigationBarMargins");
  v33 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
  objc_msgSend(v33, "layoutMargins");
  v12 = v11;
  v14 = v13;

  v34 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
  objc_msgSend(v34, "layoutMargins");
  v16 = v15;

  v35 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
  objc_msgSend(v35, "layoutMargins");
  v18 = v17;

  v36 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchBar](self, "searchBar"));
  objc_msgSend(v36, "_setOverrideContentInsets:forRectEdges:", 10, v12, v16, v14, v18);

  if (-[MessageListViewController focusAllowed](self, "focusAllowed"))
  {
    v37 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
    v19 = 0.0;
    if (objc_msgSend(v37, "useSplitViewStyling"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
      objc_msgSend(v20, "safeAreaInsets");
      v19 = v16 - v21;

    }
    v38 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
    v22 = 0.0;
    if (objc_msgSend(v38, "useSplitViewStyling"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
      objc_msgSend(v23, "directionalLayoutMargins");
      v22 = v24;

    }
    v39 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController layoutValuesHelper](self, "layoutValuesHelper"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "defaultLayoutValues"));
    objc_msgSend(v25, "leadingToIndicatorMargin");
    v27 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController layoutValuesHelper](self, "layoutValuesHelper"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "defaultLayoutValues"));
    objc_msgSend(v29, "indicatorToTrailingMargin");
    v31 = v22 + v30;

    v40 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController delegate](self, "delegate"));
    objc_msgSend(v40, "messageListViewController:updateLayoutMarginsForFocusBannerView:", self, 0.0, v19 + v27, 0.0, v31);

  }
}

- (void)_configureSearch
{
  void *v3;
  MFSearchController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (!-[MessageListViewController isSearchViewController](self, "isSearchViewController"))
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSearchViewController](self, "messageListSearchViewController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchController](self, "searchController"));

    if (!v3)
    {
      v4 = -[MFSearchController initWithSearchResultsController:]([MFSearchController alloc], "initWithSearchResultsController:", v11);
      -[MFSearchController setDelegate:](v4, "setDelegate:", self);
      -[MFSearchController setSearchResultsUpdater:](v4, "setSearchResultsUpdater:", v11);
      -[MessageListViewController setSearchController:](self, "setSearchController:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchController searchBar](v4, "searchBar"));
      objc_msgSend(v5, "setDelegate:", v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchTextField"));
      objc_msgSend(v6, "setDelegate:", v11);

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchTextField"));
      objc_msgSend(v7, "setPasteDelegate:", v11);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchController](self, "searchController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mf_navigationItem](self, "mf_navigationItem"));
    objc_msgSend(v9, "setSearchController:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mf_navigationItem](self, "mf_navigationItem"));
    objc_msgSend(v10, "setHidesSearchBarWhenScrolling:", 1);

  }
}

- (MFSearchBar)searchBar
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchController](self, "searchController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchBar"));

  return (MFSearchBar *)v3;
}

- (id)numberOfItemsInDataSourceExcludingTips
{
  void *v1;
  id v2;

  if (!a1)
    return 0;
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dataSource"));
  v2 = objc_msgSend(v1, "numberOfItems");

  return v2;
}

- (UIBarButtonItem)composeButtonItem
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  NSString *v6;
  UIBarButtonItem *composeButtonItem;
  UIBarButtonItem *v8;
  UIBarButtonItem **p_composeButtonItem;
  UIBarButtonItem *v10;
  UIBarButtonItem *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  if (!v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = (objc_class *)objc_opt_class(self);
      v6 = NSStringFromClass(v5);
      objc_claimAutoreleasedReturnValue(v6);
      sub_100393424();
    }

  }
  composeButtonItem = self->_composeButtonItem;
  if (!composeButtonItem)
  {
    v8 = (UIBarButtonItem *)objc_msgSend(v3, "newComposeButtonItem");
    p_composeButtonItem = &self->_composeButtonItem;
    v10 = *p_composeButtonItem;
    *p_composeButtonItem = v8;

    composeButtonItem = *p_composeButtonItem;
  }
  v11 = composeButtonItem;

  return v11;
}

- (id)continuityMailboxActivityPayloadFromMailboxes:(id)a3 account:(id)a4 currentActivityPayload:(id)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD *v18;

  v6 = a3;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  v9 = objc_opt_class(EMSmartMailbox);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = v8;
    if (v10)
    {
      v11 = v10;
      if (!objc_msgSend(v10, "smartMailboxType"))
      {
        v12 = (id *)&MSMailActivityHandoffBrowseMailboxSpecialMailboxTypeVIP;
        goto LABEL_14;
      }
      if (objc_msgSend(v11, "smartMailboxType") == (id)8 && objc_msgSend(v11, "type") == (id)7)
      {
        v12 = (id *)&MSMailActivityHandoffBrowseMailboxSpecialMailboxTypeAllInboxes;
LABEL_14:
        v16 = *v12;
        goto LABEL_15;
      }
      goto LABEL_12;
    }
  }
  if (objc_msgSend(v6, "count") == (id)1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "url"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absoluteString"));

    v11 = 0;
    v16 = 0;
    goto LABEL_16;
  }
  if (!objc_msgSend(0, "isInboxMailbox"))
  {
    v11 = 0;
LABEL_12:
    v16 = 0;
    goto LABEL_15;
  }
  v16 = MSMailActivityHandoffBrowseMailboxSpecialMailboxTypeAllInboxes;
  v11 = 0;
LABEL_15:
  v15 = 0;
LABEL_16:
  v17 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v17, "setDictionary:", v7);
  if (v16)
  {
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, MSMailActivityHandoffBrowseMailboxKeySpecialMailboxType);
    v18 = &MSMailActivityHandoffBrowseMailboxKeyRemoteMailboxURL;
  }
  else
  {
    if (!v15)
    {

      v17 = 0;
      goto LABEL_21;
    }
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, MSMailActivityHandoffBrowseMailboxKeyRemoteMailboxURL);
    v18 = &MSMailActivityHandoffBrowseMailboxKeySpecialMailboxType;
  }
  objc_msgSend(v17, "removeObjectForKey:", *v18);
LABEL_21:

  return v17;
}

- (ConversationViewController)conversationViewController
{
  ConversationViewController *conversationViewController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ConversationViewController *v8;
  ConversationViewController *v9;
  ConversationViewController *v10;
  ConversationViewController *v11;

  conversationViewController = self->_conversationViewController;
  if (!conversationViewController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "splitViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageDetailNavController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "conversationViewController"));

    if (v7)
    {
      v8 = v7;
      v9 = self->_conversationViewController;
      self->_conversationViewController = v8;
    }
    else
    {
      v10 = -[ConversationViewController initWithScene:]([ConversationViewController alloc], "initWithScene:", v4);
      v11 = self->_conversationViewController;
      self->_conversationViewController = v10;

      -[ConversationViewControllerBase setDelegate:](self->_conversationViewController, "setDelegate:", self);
      -[ConversationViewControllerBase setIsPrimary:](self->_conversationViewController, "setIsPrimary:", 1);
      v9 = (ConversationViewController *)objc_claimAutoreleasedReturnValue(-[MessageListViewController diagnosticsHelper](self, "diagnosticsHelper"));
      -[ConversationViewController setDiagnosticsHelper:](self->_conversationViewController, "setDiagnosticsHelper:", v9);
    }

    conversationViewController = self->_conversationViewController;
  }
  return conversationViewController;
}

- (void)_registerViewInteractions
{
  void *v3;
  void *v4;
  UIInteraction *searchMessagesInteraction;
  void *v6;
  void *v7;
  UIInteraction *changeFilterStateInteraction;
  id v9;
  id v10;

  if (!-[MessageListViewController isSearchViewController](self, "isSearchViewController"))
  {
    if (!self || !self->_searchMessagesInteraction)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController createSearchMessagesInteraction](self, "createSearchMessagesInteraction"));
      sub_10003EA04((uint64_t)self, v3);

      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchBar](self, "searchBar"));
      if (self)
        searchMessagesInteraction = self->_searchMessagesInteraction;
      else
        searchMessagesInteraction = 0;
      v9 = v4;
      objc_msgSend(v4, "addInteraction:", searchMessagesInteraction);

    }
    if (!self || !self->_changeFilterStateInteraction)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController createChangeFilterStateInteraction](self, "createChangeFilterStateInteraction"));
      sub_10003EC94((uint64_t)self, v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
      if (self)
        changeFilterStateInteraction = self->_changeFilterStateInteraction;
      else
        changeFilterStateInteraction = 0;
      v10 = v7;
      objc_msgSend(v7, "addInteraction:", changeFilterStateInteraction);

    }
  }
}

- (BOOL)messageListRecentSectionDataSourceIsInExpandedEnvironment:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene", a3));
  v4 = objc_msgSend(v3, "isInExpandedEnvironment");

  return v4;
}

- (BOOL)_isInSearch
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchController](self, "searchController"));
  v3 = objc_msgSend(v2, "isActive");

  return v3;
}

- (MFSearchController)searchController
{
  return self->_searchController;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
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
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v3 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MessageListViewController;
  -[MessageListViewController viewWillAppear:](&v20, "viewWillAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController traitCollection](self, "traitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
  objc_msgSend(v6, "setUseSplitViewStyling:", objc_msgSend(v5, "mf_useSplitViewStyling"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dockContainer"));
  objc_msgSend(v8, "addPresentationControllerDelegateObserver:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController layoutValuesHelper](self, "layoutValuesHelper"));
  objc_msgSend(v9, "setTraitCollection:", v5);
  -[MessageListViewController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
  objc_msgSend(v9, "setSystemLayoutMargins:");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
  objc_msgSend(v9, "updateTintColorFromView:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  if (!-[MessageListViewController isSearchViewController](self, "isSearchViewController")
    && (-[MessageListViewController didNotifyExtendedLaunchTracker](self, "didNotifyExtendedLaunchTracker") & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "extendedLaunchTracker"));
    objc_msgSend(v12, "observeViewController:scene:", self, v11);

  }
  -[MessageListViewController _invalidateCachedUseCompactRows](self, "_invalidateCachedUseCompactRows");
  -[MessageListViewController updateBarButtons](self, "updateBarButtons");
  *((_BYTE *)self + 8) |= 1u;
  if (objc_msgSend(v6, "containsOutbox"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "daemonInterface"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "outgoingMessageRepository"));
    objc_msgSend(v14, "suspendDeliveryQueue");

  }
  if (-[MessageListViewController isReappearing](self, "isReappearing"))
  {
    if (!objc_msgSend(v11, "isInExpandedEnvironment"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
      -[MessageListViewController deselectAllItemsInCollectionView:animated:](self, "deselectAllItemsInCollectionView:animated:", v17, v3);

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "splitViewController"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController parentViewController](self, "parentViewController"));
      objc_msgSend(v16, "setFocusedViewController:", v18);

      goto LABEL_12;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController lastSelectedItemID](self, "lastSelectedItemID"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController lastSelectedItemID](self, "lastSelectedItemID"));
      -[MessageListViewController selectRowOfItemID:scrollToVisible:animated:](self, "selectRowOfItemID:scrollToVisible:animated:", v16, 0, v3);
LABEL_12:

    }
  }
  else
  {
    -[MessageListViewController _doInitialMessageSelection](self, "_doInitialMessageSelection");
  }
  -[MessageListViewController _registerViewInteractions](self, "_registerViewInteractions");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
  objc_msgSend(v19, "setNeedsUpdateContentUnavailableConfiguration");

}

- (id)mailboxQualifier
{
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
  v4 = objc_msgSend(v3, "containsDraftsMailbox");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DRAFTS_FORMAT"), &stru_100531B00, CFSTR("Main")));
  }
  else
  {
    v7 = -[MessageListViewController _isFlaggedMailbox](self, "_isFlaggedMailbox");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v8;
    if (v7)
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FLAGGED_FORMAT"), &stru_100531B00, CFSTR("Main")));
    else
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("UNREAD_FORMAT"), &stru_100531B00, CFSTR("Main")));
  }
  v9 = (void *)v6;

  return v9;
}

- (void)_updateBackButtonImageWithCount:(unint64_t)a3
{
  void *v5;
  unsigned int v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
  v19 = v5;
  if (a3 - 1 > 0x3E6)
  {
    v7 = 0;
  }
  else
  {
    if ((objc_msgSend(v5, "containsDraftsMailbox") & 1) != 0)
      v6 = 1;
    else
      v6 = objc_msgSend(v19, "containsOutbox");
    v7 = v6 ^ 1;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController title](self, "title"));
  if (v7)
  {
    if (-[MessageListViewController currentUnreadCount](self, "currentUnreadCount") != a3)
    {
      -[MessageListViewController setCurrentUnreadCount:](self, "setCurrentUnreadCount:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter ef_formatUnsignedInteger:withGrouping:](NSNumberFormatter, "ef_formatUnsignedInteger:withGrouping:", a3, 1));
      v10 = sub_1001BE4DC(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithImage:style:target:action:", v11, 0, 0, 0);
      objc_msgSend(v12, "setTitle:", v8);
      v13 = sub_1001BE810(v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      objc_msgSend(v12, "setLargeContentSizeImage:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mf_navigationItem](self, "mf_navigationItem"));
      objc_msgSend(v15, "setBackBarButtonItem:", v12);

LABEL_12:
    }
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mf_navigationItem](self, "mf_navigationItem"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "backBarButtonItem"));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mf_navigationItem](self, "mf_navigationItem"));
      objc_msgSend(v18, "setBackBarButtonItem:", 0);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
      objc_msgSend(v11, "_setNavigationBarTitleViewNeedsLayout");
      goto LABEL_12;
    }
  }

}

- (MailMainScene)scene
{
  return (MailMainScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (id)_observedMailboxesAndSmartMailboxPredicate
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003A8B8;
  v16[3] = &unk_10051B028;
  v5 = v3;
  v17 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_filter:", v16));

  if (objc_msgSend(v6, "count")
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state")),
        v8 = objc_msgSend(v7, "containsSmartMailbox"),
        v7,
        !v8))
  {
    v13 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController accountsProvider](self, "accountsProvider"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayedAccounts"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ef_compactMap:", &stru_10051F920));

    if (objc_msgSend(v5, "count"))
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v5));
    else
      v13 = 0;

    v6 = (void *)v12;
  }
  v14 = objc_msgSend(objc_alloc((Class)EFPair), "initWithFirst:second:", v6, v13);

  return v14;
}

- (void)_updateTitle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (!-[MessageListViewController isSearchViewController](self, "isSearchViewController"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SEARCH_ALL_MAILBOXES"), &stru_100531B00, CFSTR("Main")));

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchBar](self, "searchBar"));
    objc_msgSend(v4, "setPlaceholder:", v14);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
    if ((objc_msgSend(v5, "isSelectAll") & 1) != 0
      || (v6 = objc_msgSend(v5, "count"), (v7 = v6) == 0)
      || v6 == (id)1 && (-[MessageListViewController isEditing](self, "isEditing") & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MESSAGES_SELECTED_FORMAT%1$lu"), &stru_100531B00, CFSTR("Main")));
      v10 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v7));
    }
    v11 = (void *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mf_navigationItem](self, "mf_navigationItem"));
    objc_msgSend(v12, "setTitle:", v11);

    -[MessageListViewController _updateBackButtonImage](self, "_updateBackButtonImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
    objc_msgSend(v13, "mf_resetPreferredTitle");

  }
}

- (void)_startObservationForStatusBarBadgeCountWithObservedMailboxes:(id)a3 smartMailboxPredicate:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailStatusViewController](self, "mailStatusViewController"));
  objc_msgSend(v7, "stopObserving");

  v8 = -[MessageListViewController isSearchViewController](self, "isSearchViewController");
  v9 = CFSTR("Message list status");
  if (v8)
    v9 = CFSTR("Search status");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController updatedPredicateForFocusedAccounts:](self, "updatedPredicateForFocusedAccounts:", v6));
  v12 = sub_100121094(self, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailStatusViewController](self, "mailStatusViewController"));
  objc_msgSend(v14, "startObservingForVisibleMailboxes:delegate:filterPredicate:label:", v15, self, v13, v10);

}

- (void)_initializeMailboxBrowseUserActivityWithMailboxes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "account"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxBrowseActivityPayload](self, "mailboxBrowseActivityPayload"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController continuityMailboxActivityPayloadFromMailboxes:account:currentActivityPayload:](self, "continuityMailboxActivityPayloadFromMailboxes:account:currentActivityPayload:", v33, v5, v6));

  -[MessageListViewController setMailboxBrowseActivityPayload:](self, "setMailboxBrowseActivityPayload:", 0);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v7);
    -[MessageListViewController setMailboxBrowseActivityPayload:](self, "setMailboxBrowseActivityPayload:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxBrowseActivityPayload](self, "mailboxBrowseActivityPayload"));
    v10 = MSMailActivityHandoffTypeBrowseMailbox;
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MSMailActivityHandoffTypeBrowseMailbox, MSMailActivityHandoffTypeKey);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController userActivity](self, "userActivity"));
    v12 = v11;
    if (!v11
      || (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activityType")),
          v14 = objc_msgSend(v13, "isEqualToString:", v10),
          v13,
          (v14 & 1) == 0))
    {
      v15 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", v10);

      v12 = v15;
      -[MessageListViewController setUserActivity:](self, "setUserActivity:", v15);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "firstObject"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxBrowseActivityPayload](self, "mailboxBrowseActivityPayload"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", MSMailActivityHandoffBrowseMailboxKeyRemoteMailboxURL));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v18)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("BROWSING_FOLDER_FROM_ACCOUNT_TITLE"), &stru_100531B00, CFSTR("Main")));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v21, v22));
      objc_msgSend(v12, "setTitle:", v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectID"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "url"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "absoluteString"));
      objc_msgSend(v12, "setTargetContentIdentifier:", v26);

    }
    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("BROWSING_SPECIAL_FOLDER_TITLE"), &stru_100531B00, CFSTR("Main")));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v28));
      objc_msgSend(v12, "setTitle:", v29);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxBrowseActivityPayload](self, "mailboxBrowseActivityPayload"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", MSMailActivityHandoffBrowseMailboxKeySpecialMailboxType));
      objc_msgSend(v12, "setTargetContentIdentifier:", v25);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxBrowseActivityPayload](self, "mailboxBrowseActivityPayload"));
    objc_msgSend(v12, "setUserInfo:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxBrowseActivityPayload](self, "mailboxBrowseActivityPayload"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController requiredUserInfoKeysFromUserActivityPayload:](self, "requiredUserInfoKeysFromUserActivityPayload:", v31));
    objc_msgSend(v12, "setRequiredUserInfoKeys:", v32);

    objc_msgSend(v12, "setEligibleForSearch:", 1);
    objc_msgSend(v12, "setEligibleForPrediction:", 0);
    objc_msgSend(v12, "becomeCurrent");

  }
}

- (void)viewDidLoad
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void **v23;
  uint64_t v24;
  id (*v25)(uint64_t, uint64_t, void *);
  void *v26;
  id v27;
  id location;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)MessageListViewController;
  -[MessageListViewController viewDidLoad](&v29, "viewDidLoad");
  -[MessageListViewController _invalidateCachedUseCompactRows](self, "_invalidateCachedUseCompactRows");
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  v23 = _NSConcreteStackBlock;
  v24 = 3221225472;
  v25 = sub_100008E9C;
  v26 = &unk_10051D300;
  objc_copyWeak(&v27, &location);
  v4 = objc_msgSend(v3, "initWithSectionProvider:", &v23);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view", v23, v24, v25, v26));
  v6 = objc_alloc((Class)UICollectionView);
  objc_msgSend(v5, "bounds");
  v7 = objc_msgSend(v6, "initWithFrame:collectionViewLayout:", v4);
  v8 = objc_opt_class(MessageListCollectionViewCell);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MessageListCollectionViewCell reusableIdentifier](MessageListCollectionViewCell, "reusableIdentifier"));
  objc_msgSend(v7, "registerClass:forCellWithReuseIdentifier:", v8, v9);

  objc_msgSend(v7, "_setAllowsVisibleCellUpdatesDuringUpdateAnimations:", 1);
  objc_msgSend(v7, "setAutoresizingMask:", 18);
  objc_msgSend(v7, "setDelegate:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailMessageListBackgroundColor](UIColor, "mailMessageListBackgroundColor"));
  objc_msgSend(v7, "setBackgroundColor:", v10);

  objc_msgSend(v7, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v7, "setKeyboardDismissMode:", 2);
  objc_msgSend(v7, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailMessageList);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController refreshControl](self, "refreshControl"));
  objc_msgSend(v7, "setRefreshControl:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListDragDropHelper](self, "messageListDragDropHelper"));
  objc_msgSend(v7, "setDragDelegate:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListDragDropHelper](self, "messageListDragDropHelper"));
  objc_msgSend(v7, "setDropDelegate:", v13);

  -[MessageListViewController setCollectionView:](self, "setCollectionView:", v7);
  v14 = +[UIDevice mf_isPad](UIDevice, "mf_isPad");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "panGestureRecognizer"));
  objc_msgSend(v16, "setDelaysTouchesBegan:", v14);

  v17 = objc_alloc((Class)MessageListPositionHelper);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "collectionViewDataSource"));
  v20 = objc_msgSend(v17, "initWithCollectionView:dataSource:", v7, v19);
  -[MessageListViewController setMessageListPositionHelper:](self, "setMessageListPositionHelper:", v20);

  objc_msgSend(v5, "addSubview:", v7);
  -[MessageListViewController _configureSearch](self, "_configureSearch");
  -[MessageListViewController setPrimitiveFocusFilterEnabled:](self, "setPrimitiveFocusFilterEnabled:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v22, "addObserver:selector:name:object:", self, "_sceneDidEnterBackground:", UISceneDidEnterBackgroundNotification, v21);

  +[MUIIntelligenceLightDefaults setInitialSettingsIfNecessary](MUIIntelligenceLightDefaults, "setInitialSettingsIfNecessary");
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)_updateNavigationBarButtons
{
  id v3;
  int64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[5];

  if (-[MessageListViewController _shouldProcessButtonUpdates](self, "_shouldProcessButtonUpdates"))
  {
    v3 = -[MessageListViewController isEditing](self, "isEditing");
    v27 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController currentEditButtonItem](self, "currentEditButtonItem"));
    +[UIBarButtonItem mf_configureMultiBarButtonItem:usingStyle:](UIBarButtonItem, "mf_configureMultiBarButtonItem:usingStyle:");
    v4 = -[MessageListViewController numberOfItemsInDataSourceExcludingTips](self, "numberOfItemsInDataSourceExcludingTips");
    objc_msgSend(v27, "setEnabled:", v4 > 0);
    if (_os_feature_enabled_impl("Mail", "CatchUpHighlights")
      && EMIsGreymatterAvailableWithOverride())
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
      v7 = objc_msgSend(v6, "containsInbox");

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController currentConfigureMenuButtonItem](self, "currentConfigureMenuButtonItem"));
        objc_msgSend(v5, "addObject:", v8);

      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController selectMessageListViewButtonItem](self, "selectMessageListViewButtonItem"));
      objc_msgSend(v9, "setEnabled:", v4 > 0);
      objc_msgSend(v5, "addObject:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mf_navigationItem](self, "mf_navigationItem"));
      objc_msgSend(v10, "setRightBarButtonItems:", v5);

    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mf_navigationItem](self, "mf_navigationItem"));
      objc_msgSend(v5, "setRightBarButtonItem:", v27);
    }

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10003B184;
    v28[3] = &unk_10051AA98;
    v28[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v28);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mf_navigationItem](self, "mf_navigationItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_bottomPalette"));
    objc_msgSend(v12, "setUserInteractionEnabled:", v3 ^ 1);

    if ((_DWORD)v3)
      v13 = 0.5;
    else
      v13 = 1.0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mf_navigationItem](self, "mf_navigationItem"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_bottomPalette"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentView"));
    objc_msgSend(v16, "setAlpha:", v13);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "splitViewController"));
    objc_msgSend(v18, "_setForceDisplayModeBarButtonHidden:", v3);

    if (sub_1000403B8(self))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
      if (objc_msgSend(v19, "isSelectAll"))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
        if (objc_msgSend(v20, "isSelectAll"))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "itemIDs"));
          v23 = objc_msgSend(v22, "count") == 0;

        }
        else
        {
          v23 = 1;
        }

      }
      else
      {
        v23 = 0;
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController selectAllButtonItem](self, "selectAllButtonItem"));
      +[UIBarButtonItem mf_configureSelectionBarButtonItem:usingStyle:](UIBarButtonItem, "mf_configureSelectionBarButtonItem:usingStyle:", v25, v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController selectAllButtonItem](self, "selectAllButtonItem"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mf_navigationItem](self, "mf_navigationItem"));
      objc_msgSend(v26, "setLeftBarButtonItem:", v24);

    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mf_navigationItem](self, "mf_navigationItem"));
      objc_msgSend(v24, "setLeftBarButtonItem:", 0);
    }

  }
}

- (void)_updateStatusObservers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _observedMailboxesAndSmartMailboxPredicate](self, "_observedMailboxesAndSmartMailboxPredicate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "first"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "second"));
  v6 = sub_100121094(self, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_100011278(self, v10, v7);

  -[MessageListViewController _startObservationForStatusBarBadgeCountWithObservedMailboxes:smartMailboxPredicate:](self, "_startObservationForStatusBarBadgeCountWithObservedMailboxes:smartMailboxPredicate:", v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageTriageInteractionHelper](self, "messageTriageInteractionHelper"));
  objc_msgSend(v8, "startObservingMailboxes:", v4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListFetchHelper](self, "messageListFetchHelper"));
  objc_msgSend(v9, "setMailboxes:", v4);

}

- (void)_updateResolvedMailboxObjectIDs
{
  NSMutableSet *v3;
  NSMutableSet *resolvedMailboxObjectIDs;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableSet *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  NSMutableSet *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  MessageListViewController *v28;
  __int16 v29;
  NSMutableSet *v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];

  v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  resolvedMailboxObjectIDs = self->_resolvedMailboxObjectIDs;
  self->_resolvedMailboxObjectIDs = v3;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(EMSmartMailbox);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        {
          buf[0] = 0;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mailboxScope"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxRepository](self, "mailboxRepository"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allMailboxObjectIDsWithMailboxTypeResolver:forExclusion:", v12, buf));

          -[NSMutableSet unionSet:](self->_resolvedMailboxObjectIDs, "unionSet:", v13);
        }
        else
        {
          v14 = self->_resolvedMailboxObjectIDs;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectID", (_QWORD)v21));
          -[NSMutableSet addObject:](v14, "addObject:", v15);

        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v6);
  }

  v16 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (objc_class *)objc_opt_class(self);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = self->_resolvedMailboxObjectIDs;
    *(_DWORD *)buf = 138413058;
    v26 = v19;
    v27 = 2048;
    v28 = self;
    v29 = 2114;
    v30 = v20;
    v31 = 2114;
    v32 = v5;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "<%@: %p> Updated resolved mailbox object ids: %{public}@, mailboxes: %{public}@", buf, 0x2Au);

  }
}

- (MessageListViewController)initWithMainScene:(id)a3 mailboxes:(id)a4 accountsProvider:(id)a5 favoritesShortcutsProvider:(id)a6 contactStore:(id)a7 diagnosticsHelper:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MessageListViewController *v21;
  EFLocked *v22;
  EFLocked *isRefreshing;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v26 = a5;
  v25 = a6;
  v27 = a7;
  v16 = a8;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "daemonInterface"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "daemonInterface"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "focusController"));
  v28.receiver = self;
  v28.super_class = (Class)MessageListViewController;
  v21 = -[MessageListViewController initWithDaemonInterface:focusController:mailboxes:contactStore:diagnosticsHelper:](&v28, "initWithDaemonInterface:focusController:mailboxes:contactStore:diagnosticsHelper:", v18, v20, v15, v27, v16);

  if (v21)
  {
    objc_storeWeak((id *)&v21->_scene, v14);
    objc_storeStrong((id *)&v21->_accountsProvider, a5);
    objc_storeStrong((id *)&v21->_favoritesShortcutsProvider, a6);
    v22 = (EFLocked *)objc_msgSend(objc_alloc((Class)EFLocked), "initWithObject:", &__kCFBooleanFalse);
    isRefreshing = v21->_isRefreshing;
    v21->_isRefreshing = v22;

    -[MessageListViewController _commonInitWithDaemonInterface:mailboxes:](v21, "_commonInitWithDaemonInterface:mailboxes:", v17, v15);
  }

  return v21;
}

- (void)_updateToolbarButtons
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  id v13;
  _QWORD *v14;
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  id v19;
  _QWORD *v20;
  unsigned int v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD *v34;
  unsigned __int8 v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  MessageListViewController *v43;
  id v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  unsigned __int8 v59;

  if (-[MessageListViewController _shouldProcessButtonUpdates](self, "_shouldProcessButtonUpdates"))
  {
    v35 = -[MessageListViewController isEditing](self, "isEditing");
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController deleteButtonItem](self, "deleteButtonItem"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController moveButtonItem](self, "moveButtonItem"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController markButtonItem](self, "markButtonItem"));
    v26 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController currentEditButtonItem](self, "currentEditButtonItem"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem mf_newFixedSpaceItem](UIBarButtonItem, "mf_newFixedSpaceItem"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController filterButtonItem](self, "filterButtonItem", v3));
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10012A844;
    v52[3] = &unk_10051FB70;
    v59 = v35;
    v52[4] = self;
    v5 = v27;
    v53 = v5;
    v6 = v26;
    v54 = v6;
    v7 = v28;
    v55 = v7;
    v8 = v29;
    v56 = v8;
    v32 = v25;
    v57 = v32;
    v9 = v3;
    v58 = v9;
    v34 = objc_retainBlock(v52);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10012A9D0;
    v47[3] = &unk_10051FB98;
    v47[4] = self;
    v31 = v5;
    v48 = v31;
    v10 = v6;
    v49 = v10;
    v30 = v7;
    v50 = v30;
    v11 = v8;
    v51 = v11;
    v12 = objc_retainBlock(v47);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10000D710;
    v45[3] = &unk_10051FBC0;
    v45[4] = self;
    v13 = v9;
    v46 = v13;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10012AAA4;
    v40[3] = &unk_10051FBE8;
    v14 = objc_retainBlock(v45);
    v44 = v14;
    v15 = v4;
    v41 = v15;
    v16 = v10;
    v42 = v16;
    v43 = self;
    v17 = objc_retainBlock(v40);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10000B710;
    v36[3] = &unk_10051FC10;
    v36[4] = self;
    v18 = v14;
    v39 = v18;
    v33 = v15;
    v37 = v33;
    v19 = v16;
    v38 = v19;
    v20 = objc_retainBlock(v36);
    if (-[MessageListViewController _shouldDisplaySearchButtons](self, "_shouldDisplaySearchButtons"))
    {
      v21 = -[MessageListViewController isSearchSuggestionsVisible](self, "isSearchSuggestionsVisible");
      if (v21)
        v22 = v12;
      else
        v22 = v34;
      if (!v21)
        goto LABEL_13;
    }
    else
    {
      v22 = v12;
    }
    if ((v35 & 1) == 0)
    {
      if (-[MessageListViewController isFilterButtonEnabled](self, "isFilterButtonEnabled"))
        v22 = v17;
      else
        v22 = v20;
    }
LABEL_13:
    v23 = ((uint64_t (*)(void))v22[2])();
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    -[MessageListViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v24, 1);

  }
}

- (void)_commonInitWithDaemonInterface:(id)a3 mailboxes:(id)a4
{
  id v6;
  id v7;
  MessageListDragDropHelper *v8;
  MessageListDragDropHelper *messageListDragDropHelper;
  NSMutableSet *v10;
  NSMutableSet *indexPathsForConfiguredCollectionViewCells;
  void *v12;
  void *v13;
  void *v14;
  MailStatusObserver *v15;
  void *v16;
  MailStatusObserver *v17;
  MailStatusObserver *mailStatusObserver;
  MailStatusViewController *v19;
  void *v20;
  void *v21;
  MailStatusViewController *v22;
  MailStatusViewController *mailStatusViewController;
  EFScheduler *v24;
  EFScheduler *parsecEventQueue;
  id v26;
  objc_class *v27;
  NSString *v28;
  void *v29;
  EMCollectionItemIDStateCapturer *v30;
  EMCollectionItemIDStateCapturer *stateCapturer;
  _BOOL8 v32;
  NSObject *v33;
  objc_class *v34;
  NSString *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40[2];
  _BYTE buf[12];
  __int16 v42;
  MessageListViewController *v43;

  v6 = a3;
  v7 = a4;
  v8 = -[MessageListDragDropHelper initWithDataSource:delegate:]([MessageListDragDropHelper alloc], "initWithDataSource:delegate:", self, self);
  messageListDragDropHelper = self->_messageListDragDropHelper;
  self->_messageListDragDropHelper = v8;

  v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  indexPathsForConfiguredCollectionViewCells = self->_indexPathsForConfiguredCollectionViewCells;
  self->_indexPathsForConfiguredCollectionViewCells = v10;

  -[MessageListViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
  -[MessageListViewController updateState:withMailboxes:](self, "updateState:withMailboxes:", v12, v7);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "_updateThreadingPreference:", MailApplicationsDisableThreadingKeyChanged, 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "_updateListForChange:", MailApplicationDidChangePreviewLinesNotification, 0);
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "_updateListForChange:", MailApplicationDidChangeShowToCCNotification, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "outgoingMessageRepository"));
  v15 = [MailStatusObserver alloc];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxRepository](self, "mailboxRepository"));
  v17 = -[MailStatusObserver initWithMailboxRepository:delegate:](v15, "initWithMailboxRepository:delegate:", v16, self);
  mailStatusObserver = self->_mailStatusObserver;
  self->_mailStatusObserver = v17;

  v19 = [MailStatusViewController alloc];
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxRepository](self, "mailboxRepository"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v22 = -[MailStatusViewController initWithMailboxRepository:outgoingMessageRepository:scene:](v19, "initWithMailboxRepository:outgoingMessageRepository:scene:", v20, v14, v21);
  mailStatusViewController = self->_mailStatusViewController;
  self->_mailStatusViewController = v22;

  -[MessageListViewController _updateResolvedMailboxObjectIDs](self, "_updateResolvedMailboxObjectIDs");
  -[MessageListViewController _updateStatusObservers](self, "_updateStatusObservers");
  v24 = (EFScheduler *)objc_claimAutoreleasedReturnValue(+[EFScheduler serialDispatchQueueSchedulerWithName:qualityOfService:](EFScheduler, "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.mobilemail.MessageListViewController.parsecFeedback"), 17));
  parsecEventQueue = self->_parsecEventQueue;
  self->_parsecEventQueue = v24;

  EFRegisterContentProtectionObserver(self, &_dispatch_main_q);
  v26 = objc_alloc((Class)EMCollectionItemIDStateCapturer);
  v27 = (objc_class *)objc_opt_class(self);
  v28 = NSStringFromClass(v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = (EMCollectionItemIDStateCapturer *)objc_msgSend(v26, "initWithTitle:delegate:", v29, self);
  stateCapturer = self->_stateCapturer;
  self->_stateCapturer = v30;

  v32 = -[MessageListViewController isSearchViewController](self, "isSearchViewController");
  if (v32)
  {
    v33 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (objc_class *)objc_opt_class(self);
      v35 = NSStringFromClass(v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v36;
      v42 = 2048;
      v43 = self;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "<%@: %p> Skip web view preallocation", buf, 0x16u);

    }
  }
  else if (qword_1005A9FF8 != -1)
  {
    dispatch_once(&qword_1005A9FF8, &stru_10051F828);
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
  objc_msgSend(v37, "setIsSearch:", v32);

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler globalAsyncScheduler](EFScheduler, "globalAsyncScheduler"));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10011F2E8;
  v39[3] = &unk_10051C460;
  objc_copyWeak(v40, (id *)buf);
  v40[1] = (id)1;
  objc_msgSend(v38, "performBlock:", v39);

  objc_destroyWeak(v40);
  objc_destroyWeak((id *)buf);

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  NSObject *v14;
  unsigned __int8 v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  const __CFString *v23;
  void *v24;
  MessageListViewController *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  objc_class *v29;
  NSString *v30;
  MessageListViewController *v31;
  unsigned int v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  MessageListViewController *v37;
  void *v38;
  id v39;
  uint8_t buf[4];
  MessageListViewController *v41;
  __int16 v42;
  MessageListViewController *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  _BOOL4 v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  unsigned int v51;
  __int16 v52;
  unsigned int v53;
  __int16 v54;
  uint64_t v55;

  v7 = a4;
  v8 = a5;
  v9 = objc_opt_class(MessageListCollectionViewCell);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    v10 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cellHelper"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cellView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "messageListItem"));
    if ((objc_msgSend(v10, "isHidden") & 1) != 0
      || (objc_msgSend(v10, "isHiddenOrHasHiddenAncestor") & 1) != 0)
    {
      goto LABEL_7;
    }
    objc_msgSend(v10, "alpha");
    if (v13 < 0.0)
      v13 = -v13;
    if (v13 < 2.22044605e-16)
    {
LABEL_7:
      v14 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v25 = (MessageListViewController *)objc_msgSend(v8, "section");
        v34 = objc_msgSend(v8, "item");
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_layoutAttributes"));
        v32 = objc_msgSend(v10, "isHidden");
        v26 = objc_msgSend(v10, "isHiddenOrHasHiddenAncestor");
        objc_msgSend(v10, "alpha");
        *(_DWORD *)buf = 134219778;
        v41 = self;
        v42 = 2048;
        v43 = v25;
        v44 = 2048;
        v45 = v34;
        v46 = 1024;
        v47 = v12 != 0;
        v48 = 2114;
        v49 = (uint64_t)v36;
        v50 = 1024;
        v51 = v32;
        v52 = 1024;
        v53 = v26;
        v54 = 2048;
        v55 = v27;
        _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "%p: Cell is unexpectedly hidden:\n\tindexPath: (%ld, %ld)\n\thasItem: %{BOOL}d\n\tlayoutAttributes: %{public}@\n\tisHidden: %{BOOL}d\n\tisHiddenOrHasHiddenAncestor: %{BOOL}d\n\talpha: %f", buf, 0x46u);

      }
    }
    v39 = 0;
    v15 = objc_msgSend(v38, "verifyContentVisibility:", &v39);
    v16 = v39;
    if ((v15 & 1) == 0)
    {
      v17 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v37 = (MessageListViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ef_publicDescription"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ef_publicDescription"));
        v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_layoutAttributes"));
        *(_DWORD *)buf = 134219010;
        v41 = self;
        v42 = 2114;
        v43 = v37;
        v44 = 2114;
        v45 = v35;
        v46 = 1024;
        v47 = v12 != 0;
        v48 = 2114;
        v49 = v28;
        v33 = (void *)v28;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%p: Cell is unexpectedly hidden - %{public}@:\n\tindexPath: %{public}@\n\thasItem: %{BOOL}d\n\tlayoutAttributes: %{public}@", buf, 0x30u);

      }
    }
    if (v12)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "daemonInterface"));
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "interactionLogger"));

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListType](self, "messageListType"));
      v22 = objc_msgSend(v8, "row");
      v23 = sub_100123B54((uint64_t)objc_msgSend(v11, "style"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      -[NSObject messageListDisplayStartedForListItem:messageListType:row:cellStyle:](v20, "messageListDisplayStartedForListItem:messageListType:row:cellStyle:", v12, v21, v22, v24);

    }
    else
    {
      v20 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v29 = (objc_class *)objc_opt_class(self);
        v30 = NSStringFromClass(v29);
        v31 = (MessageListViewController *)objc_claimAutoreleasedReturnValue(v30);
        *(_DWORD *)buf = 138412802;
        v41 = v31;
        v42 = 2048;
        v43 = self;
        v44 = 2112;
        v45 = v8;
        _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "<%@: %p> Looks like collection view tried to display a cell that is no longer valid. Ignoring interaction log for indexPath: %@", buf, 0x20u);

      }
    }

  }
}

- (void)messageListDataSource:(id)a3 didUpdateWithChange:(id)a4 section:(id)a5 animated:(BOOL)a6
{
  uint64_t v6;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  id v17;
  NSObject *v18;
  objc_class *v19;
  NSString *v20;
  NSMutableSet *indexPathsForConfiguredCollectionViewCells;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  NSString *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  objc_class *v36;
  NSString *v37;
  objc_class *v38;
  NSString *v39;
  id v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  objc_class *v47;
  NSString *v48;
  void *v49;
  void *v50;
  MessageListViewController *v51;
  NSObject *v52;
  objc_class *v53;
  NSString *v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  unsigned __int8 v59;
  unsigned int v60;
  MessageListViewController *v61;
  uint64_t v62;
  objc_class *v63;
  NSString *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  _BOOL4 v69;
  id v70;
  id v71;
  NSMutableSet *v72;
  id obj;
  MessageListViewController *v74;
  NSObject *log;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  size_t v80;
  _BYTE v81[128];
  uint8_t buf[648];
  int v83[2];
  int v84;
  pid_t v85;

  v69 = a6;
  v71 = a4;
  v70 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
  objc_msgSend(v9, "setPerformingDataSourceUpdates:", 0);

  if (+[MessageListSectionDataSource isValidChange:](MessageListSectionDataSource, "isValidChange:", v71)&& (-[MessageListViewController firstBatchCellConfigurationCompleted](self, "firstBatchCellConfigurationCompleted") & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "indexPathsForVisibleItems"));
    v11 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v6);
    sub_10003EC58((uint64_t)self, v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "messageList"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectID"));
    -[MessageListViewController _checkMessageListLoadingCompleted:](self, "_checkMessageListLoadingCompleted:", v13);

  }
  v74 = self;
  if (+[MessageListSectionDataSource isFirstChange:](MessageListSectionDataSource, "isFirstChange:", v71))
  {
    if ((-[MessageListViewController isInitialCellConfigurationCompleted](self, "isInitialCellConfigurationCompleted") & 1) != 0)
    {
      log = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (objc_class *)objc_opt_class(self);
        v15 = NSStringFromClass(v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = self;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> [Launch] Skip track initial visible items, configuration has already been completed", buf, 0x16u);

      }
      goto LABEL_31;
    }
    log = objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject indexPathsForVisibleItems](log, "indexPathsForVisibleItems"));
    v17 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v68);
    sub_10003EC58((uint64_t)self, v17);

    v18 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class(self);
      v20 = NSStringFromClass(v19);
      v6 = objc_claimAutoreleasedReturnValue(v20);
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = objc_msgSend(v68, "count");
      *(_WORD *)&buf[32] = 2114;
      *(_QWORD *)&buf[34] = v68;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "<%@: %p> [Launch] Index paths for visible cells after first batch (%lu): %{public}@", buf, 0x2Au);

    }
    if (self)
      indexPathsForConfiguredCollectionViewCells = self->_indexPathsForConfiguredCollectionViewCells;
    else
      indexPathsForConfiguredCollectionViewCells = 0;
    v72 = indexPathsForConfiguredCollectionViewCells;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    obj = v68;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
    if (!v22)
    {
LABEL_30:

LABEL_31:
      self = v74;
      goto LABEL_32;
    }
    v23 = *(_QWORD *)v77;
LABEL_14:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v77 != v23)
        objc_enumerationMutation(obj);
      v25 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject cellForItemAtIndexPath:](log, "cellForItemAtIndexPath:", v25));
      v27 = objc_opt_class(MessageListCollectionViewCell);
      if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
      {
        v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "cellHelper"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v6, "messageListItem"));

        if (v28)
        {
          v29 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = (objc_class *)objc_opt_class(v74);
            v31 = NSStringFromClass(v30);
            v6 = (uint64_t)(id)objc_claimAutoreleasedReturnValue(v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "cellHelper"));
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "messageListItem"));
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "itemID"));
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)&buf[4] = v6;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v74;
            *(_WORD *)&buf[22] = 2114;
            *(_QWORD *)&buf[24] = v34;
            *(_WORD *)&buf[32] = 2114;
            *(_QWORD *)&buf[34] = v25;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> [Launch] Item (id: %{public}@) at index path: %{public}@ is already configured", buf, 0x2Au);

          }
          -[NSMutableSet addObject:](v72, "addObject:", v25);
          goto LABEL_25;
        }
        v35 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = (objc_class *)objc_opt_class(v74);
          v37 = NSStringFromClass(v36);
          v6 = objc_claimAutoreleasedReturnValue(v37);
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v6;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v74;
          *(_WORD *)&buf[22] = 2114;
          *(_QWORD *)&buf[24] = v25;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> [Launch] Waiting for item at indexPath: %{public}@ to be configured", buf, 0x20u);

        }
      }
      else
      {
        v35 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          v38 = (objc_class *)objc_opt_class(v74);
          v39 = NSStringFromClass(v38);
          v6 = objc_claimAutoreleasedReturnValue(v39);
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v6;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v74;
          *(_WORD *)&buf[22] = 2114;
          *(_QWORD *)&buf[24] = v25;
          _os_log_fault_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_FAULT, "<%@: %p> [Launch] Collection view cell is not of type MessageListCollectionViewCell at indexPath: %{public}@", buf, 0x20u);

        }
      }

LABEL_25:
      if (v22 == (id)++v24)
      {
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
        v22 = v40;
        if (!v40)
          goto LABEL_30;
        goto LABEL_14;
      }
    }
  }
LABEL_32:
  if ((-[MessageListViewController isEditing](self, "isEditing") & 1) != 0)
    goto LABEL_59;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageToDisplayOnReload](self, "messageToDisplayOnReload"));
  if (v41 && !-[MessageListViewController _canDisplayMessage:](self, "_canDisplayMessage:", v41))
  {
    v42 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v63 = (objc_class *)objc_opt_class(v74);
      v64 = NSStringFromClass(v63);
      v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](v74, "mailboxes"));
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v65;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v74;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v41;
      *(_WORD *)&buf[32] = 2112;
      *(_QWORD *)&buf[34] = v66;
      _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "<%@: %p> Failed to display message:%@ on reload. Message does not exist not in displayed mailboxes:%@", buf, 0x2Au);

    }
    self = v74;
    -[MessageListViewController setMessageToDisplayOnReload:](v74, "setMessageToDisplayOnReload:", 0);
    memset(buf, 170, sizeof(buf));
    *(_DWORD *)&buf[32] = 0;
    *(_QWORD *)v83 = 0xE00000001;
    v84 = 1;
    v85 = getpid();
    v80 = 648;
    v41 = 0;
    if (!sysctl(v83, 4u, buf, &v80, 0, 0) && (*(_WORD *)&buf[32] & 0x800) != 0)
    {
      v41 = 0;
      __debugbreak();
    }
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController lastSelectedItemID](self, "lastSelectedItemID"));
  if (!-[MessageListViewController numberOfItemsInDataSourceExcludingTips]_0(self))
    goto LABEL_53;
  if (v41)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "messageList"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "itemIDOfMessageListItemWithDisplayMessage:", v41));

    v46 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = (objc_class *)objc_opt_class(v74);
      v48 = NSStringFromClass(v47);
      v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "messageList"));
      *(_DWORD *)buf = 138413570;
      *(_QWORD *)&buf[4] = v49;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v74;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v41;
      *(_WORD *)&buf[32] = 1024;
      *(_DWORD *)&buf[34] = v45 != 0;
      *(_WORD *)&buf[38] = 2112;
      *(_QWORD *)&buf[40] = v50;
      *(_WORD *)&buf[48] = 2112;
      *(_QWORD *)&buf[50] = v70;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "<%@: %p> messageToDisplayOnReload:%@ exist:%i in message list: %@ for section: %@", buf, 0x3Au);

    }
    v6 = v45 != 0;
    if (v45)
    {
      v51 = v74;
      -[MessageListViewController _handleDidSelectItemID:referenceItem:scrollToVisible:userInitiated:animated:](v74, "_handleDidSelectItemID:referenceItem:scrollToVisible:userInitiated:animated:", v45, v41, 1, 1, v69);
    }
    else
    {
      BYTE2(v67) = 1;
      BYTE1(v67) = v69;
      LOBYTE(v67) = 1;
      v51 = v74;
      -[MessageListViewController _showConversationViewWithMessageListItem:itemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:indexPath:](v74, "_showConversationViewWithMessageListItem:itemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:indexPath:", 0, 0, 0, v41, 0, 1, v67, 0);
    }
    -[MessageListViewController setMessageToDisplayOnReload:](v51, "setMessageToDisplayOnReload:", 0);
    goto LABEL_50;
  }
  if (!-[MessageListViewController shouldSelectInitialMessage](self, "shouldSelectInitialMessage"))
  {
    if (v43 && !-[MessageListViewController _inMultiSelectionMode](self, "_inMultiSelectionMode"))
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController lastSelectedItemID](self, "lastSelectedItemID"));
      v6 = (uint64_t)-[MessageListViewController selectRowOfItemID:scrollToVisible:animated:](self, "selectRowOfItemID:scrollToVisible:animated:", v45, 0, 0);
LABEL_50:

      goto LABEL_54;
    }
LABEL_53:
    v6 = 0;
    goto LABEL_54;
  }
  v6 = -[MessageListViewController _selectAndDisplayInitialMessageIfNecessary](self, "_selectAndDisplayInitialMessageIfNecessary");
LABEL_54:
  if (((+[MessageListSectionDataSource isFirstChange:](MessageListSectionDataSource, "isFirstChange:", v71) ^ 1 | v69 | v6) & 1) == 0)
  {
    v52 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = (objc_class *)objc_opt_class(v74);
      v54 = NSStringFromClass(v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v55;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v74;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 0;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 0;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "<%@: %p> Couldn't select a message, scroll to top (animated=%{BOOL}d, selected=%{BOOL}d)", buf, 0x22u);

    }
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](v74, "collectionView"));
    v6 = objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](v74, "collectionView"));
    objc_msgSend((id)v6, "adjustedContentInset");
    objc_msgSend(v56, "setContentOffset:animated:", 0, 0.0, -v57);

  }
  self = v74;
LABEL_59:
  -[MessageListViewController updateBarButtons](self, "updateBarButtons");
  -[MessageListViewController _updateTitle](self, "_updateTitle");
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "section"));
  v59 = objc_msgSend(v58, "isEqualToString:", MessageListSectionRecent);
  if ((v59 & 1) == 0)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "section"));
    if ((objc_msgSend((id)v6, "isEqualToString:", MessageListSectionIndexedSearch) & 1) == 0)
    {

      v61 = v74;
      goto LABEL_71;
    }
  }
  v60 = +[MessageListSectionDataSource isValidChange:](MessageListSectionDataSource, "isValidChange:", v71);
  if ((v59 & 1) != 0)
  {

    v61 = v74;
    if (!v60)
      goto LABEL_71;
  }
  else
  {

    v61 = v74;
    if ((v60 & 1) == 0)
      goto LABEL_71;
  }
  if (-[MessageListViewController numberOfItemsInDataSourceExcludingTips]_0(v61)
    && -[MessageListViewController suppressNoContentView](v61, "suppressNoContentView"))
  {
    -[MessageListViewController setSuppressNoContentView:](v61, "setSuppressNoContentView:", 0);
    v62 = 1;
  }
  else
  {
    v62 = 0;
  }
  -[MessageListViewController _updateNoContentViewAnimated:suppressNoContentView:](v61, "_updateNoContentViewAnimated:suppressNoContentView:", v69, v62);
LABEL_71:
  if (!-[MessageListViewController numberOfItemsInDataSourceExcludingTips]_0(v61))
  {
    -[MessageListViewController _setEditing:animated:preserveSelection:](v61, "_setEditing:animated:preserveSelection:", 0, v69, 0);
    -[MessageListViewController _exitMultiSelectionForce:](v61, "_exitMultiSelectionForce:", 1);
  }

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C20C;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9FE0 != -1)
    dispatch_once(&qword_1005A9FE0, block);
  return (OS_os_log *)(id)qword_1005A9FD8;
}

- (BOOL)shouldShowSubtitle
{
  void *v4;
  unsigned __int8 v5;

  if (-[MessageListViewController _isFlaggedMailbox](self, "_isFlaggedMailbox"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
  v5 = objc_msgSend(v4, "containsDraftsMailbox");

  return v5 ^ 1;
}

- (BOOL)_isFlaggedMailbox
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  BOOL v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
  v4 = objc_msgSend(v3, "count");

  if (v4 != (id)1)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v7 = objc_opt_class(EMSmartMailbox);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) == 0)
    return 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

  v11 = objc_msgSend(v10, "smartMailboxType") == (id)1;
  return v11;
}

- (BOOL)_shouldDisplaySearchButtons
{
  if (-[MessageListViewController isSearchViewController](self, "isSearchViewController"))
    return 1;
  else
    return -[MessageListViewController _isInSearch](self, "_isInSearch");
}

- (BOOL)isSearchViewController
{
  return 0;
}

- (id)createChangeFilterStateInteraction
{
  MessageListViewController *v3;
  id v6;

  swift_getObjectType(self);
  v3 = self;
  v6 = (id)sub_100007298();

  return v6;
}

- (id)createSearchMessagesInteraction
{
  MessageListViewController *v3;
  id v6;

  swift_getObjectType(self);
  v3 = self;
  v6 = (id)sub_100006DC8();

  return v6;
}

- (void)changeTipShouldDisplayTo:(BOOL)a3
{
  MessageListViewController *v4;
  char v5;

  swift_getObjectType(self);
  v4 = self;
  v5 = _convertObjCBoolToBool(_:)(a3);
  sub_10003CCBC(v5 & 1);

}

- (void)viewLayoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MessageListViewController;
  -[MessageListViewController viewLayoutMarginsDidChange](&v3, "viewLayoutMarginsDidChange");
  -[MessageListViewController _updateLayoutMargins](self, "_updateLayoutMargins");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MessageListViewController;
  -[MessageListViewController viewDidAppear:](&v8, "viewDidAppear:", a3);
  if (!-[MessageListViewController isSearchViewController](self, "isSearchViewController")
    && !-[MessageListViewController _isInSearch](self, "_isInSearch"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
    objc_msgSend(v4, "setDelegate:", self);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController presentedViewController](self, "presentedViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchController](self, "searchController"));

  if (v5 == v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSearchViewController](self, "messageListSearchViewController"));
    objc_msgSend(v7, "updateBarButtons");

  }
  else
  {
    -[MessageListViewController changeTipShouldDisplayTo:](self, "changeTipShouldDisplayTo:", 1);
  }
}

- (void)updateUserActivityState:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxBrowseActivityPayload](self, "mailboxBrowseActivityPayload"));
  objc_msgSend(v5, "setUserInfo:", v4);

}

- (void)updateBarButtons
{
  -[MessageListViewController _updateToolbarButtons](self, "_updateToolbarButtons");
  -[MessageListViewController _updateNavigationBarButtons](self, "_updateNavigationBarButtons");
}

- (BOOL)suppressNoContentView
{
  return self->_suppressNoContentView;
}

- (BOOL)shouldSelectInitialMessage
{
  return self->_shouldSelectInitialMessage;
}

- (void)setUpdateScrollableHintBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setSwipeActionVisible:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MessageListViewController;
  if (-[MessageListViewController swipeActionVisible](&v6, "swipeActionVisible") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MessageListViewController;
    -[MessageListViewController setSwipeActionVisible:](&v5, "setSwipeActionVisible:", v3);
    if (!v3)
      sub_10012059C(self);
  }
}

- (void)setSuppressNoContentView:(BOOL)a3
{
  self->_suppressNoContentView = a3;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (void)setScrollableHintBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setPreviousMessageListSelectionModel:(id)a3
{
  objc_storeStrong((id *)&self->_previousMessageListSelectionModel, a3);
}

- (void)setMultiEditButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_multiEditButtonItem, a3);
}

- (void)setMessageListType:(id)a3
{
  objc_storeStrong((id *)&self->_messageListType, a3);
}

- (void)setMessageListSearchViewController:(id)a3
{
  objc_storeStrong((id *)&self->_messageListSearchViewController, a3);
}

- (void)setMailboxes:(id)a3 forceReload:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  unsigned __int8 v8;
  NSObject *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  MessageListViewController *v17;
  __int16 v18;
  void *v19;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
  v8 = objc_msgSend(v7, "isEqualToArray:", v6);

  if ((v8 & 1) != 0)
  {
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    -[MessageListViewController _setMailboxes:](self, "_setMailboxes:", v6);
    -[MessageListViewController setPreviousMessageListSelectionModel:](self, "setPreviousMessageListSelectionModel:", 0);
    -[MessageListViewController setLastSelectedMessageListItems:](self, "setLastSelectedMessageListItems:", 0);
  }
  v9 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (objc_class *)objc_opt_class(self);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v14 = 138412802;
    v15 = v12;
    v16 = 2048;
    v17 = self;
    v18 = 2112;
    v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<%@: %p> Setting message list view to new mailboxes (first mailbox = %@)", (uint8_t *)&v14, 0x20u);

  }
  -[MessageListViewController reloadFromMailboxes](self, "reloadFromMailboxes");
LABEL_8:

}

- (void)setMailboxPickerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mailboxPickerDelegate, a3);
}

- (void)setMailboxBrowseActivityPayload:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxBrowseActivityPayload, a3);
}

- (void)setFlattenedMailboxesFuture:(id)a3
{
  objc_storeStrong((id *)&self->_flattenedMailboxesFuture, a3);
}

- (void)setCurrentUnreadCount:(unint64_t)a3
{
  self->_currentUnreadCount = a3;
}

- (id)scrollableHintBlock
{
  return self->_scrollableHintBlock;
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  unsigned int v10;
  double y;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  void *v17;
  void *v18;
  double v19;
  id v20;

  v20 = a3;
  -[MessageListViewController _adjustNoContentMessageAlpha:](self, "_adjustNoContentMessageAlpha:");
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController oldestItemsIDsByMailboxObjectID](self, "oldestItemsIDsByMailboxObjectID"));

    if (v4)
    {
      v5 = v20;
      objc_msgSend(v5, "contentOffset");
      v7 = v6;
      v9 = v8;
      if ((objc_msgSend(v5, "isTracking") & 1) != 0)
        v10 = 1;
      else
        v10 = objc_msgSend(v5, "isDecelerating");
      y = self->_lastScrolledContentOffset.y;
      objc_msgSend(v5, "contentInset");
      v13 = v12;
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      if (v10)
      {
        v15 = v9 <= y || v9 <= -v13;
        if (!v15 && v14 >= self->_nextAvailableLoadMoreInterval)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathsForVisibleItems"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastObject"));

          if (v18)
          {
            -[MessageListViewController _loadMoreMessagesWithMaxVisibleIndexPath:](self, "_loadMoreMessagesWithMaxVisibleIndexPath:", v18);
            +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
            self->_nextAvailableLoadMoreInterval = v19 + 0.5;
          }

        }
      }
      self->_lastScrolledContentOffset.x = v7;
      self->_lastScrolledContentOffset.y = v9;

    }
  }

}

- (void)resumeRefreshAnimationIfNecessary
{
  void *v2;
  uint64_t v3;
  id v4;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_copyWeak(&v4, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_100009F7C, &unk_10051B1B8));
  objc_msgSend(v2, "performBlock:", &v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)requiredUserInfoKeysFromUserActivityPayload:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v3));

  objc_msgSend(v4, "removeObject:", MSMailActivityHandoffBrowseMailboxKeyFocusedMessageID);
  return v4;
}

- (UIRefreshControl)refreshControl
{
  UIRefreshControl *refreshControl;
  UIRefreshControl *v4;
  UIRefreshControl *v5;

  refreshControl = self->_refreshControl;
  if (!refreshControl)
  {
    v4 = (UIRefreshControl *)objc_alloc_init((Class)UIRefreshControl);
    v5 = self->_refreshControl;
    self->_refreshControl = v4;

    -[UIRefreshControl addTarget:action:forControlEvents:](self->_refreshControl, "addTarget:action:forControlEvents:", self, "_refresh:", 4096);
    refreshControl = self->_refreshControl;
  }
  return refreshControl;
}

- (BOOL)preferUnreadCountInsteadOfTotalCount:(id)a3
{
  return 1;
}

- (UIContentUnavailableView)noContentView
{
  return self->_noContentView;
}

- (UIBarButtonItem)multiEditButtonItem
{
  return self->_multiEditButtonItem;
}

- (UIBarButtonItem)moveButtonItem
{
  unsigned int v3;
  id v4;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *moveButtonItem;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;

  if (!self->_moveButtonItem)
  {
    v3 = -[MessageListViewController _shouldShowButtonImages](self, "_shouldShowButtonImages");
    v4 = objc_alloc((Class)UIBarButtonItem);
    if (v3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphMove));
      v6 = (UIBarButtonItem *)objc_msgSend(v4, "initWithImage:style:target:action:", v5, 0, self, "_bulkTransferButtonPressed:");
      moveButtonItem = self->_moveButtonItem;
      self->_moveButtonItem = v6;
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      moveButtonItem = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MOVE_BUTTON"), &stru_100531B00, CFSTR("Main")));
      v8 = (UIBarButtonItem *)objc_msgSend(v4, "initWithTitle:style:target:action:", moveButtonItem, 0, self, "_bulkTransferButtonPressed:");
      v9 = self->_moveButtonItem;
      self->_moveButtonItem = v8;

    }
  }
  return self->_moveButtonItem;
}

- (NSDirectionalEdgeInsets)mf_extraNavigationBarMargins
{
  void *v3;
  unsigned __int8 v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSDirectionalEdgeInsets result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
  v4 = objc_msgSend(v3, "useSplitViewStyling");

  v5 = 8.0;
  if ((v4 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController layoutValuesHelper](self, "layoutValuesHelper"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "defaultLayoutValues"));
    objc_msgSend(v7, "leadingPadding");
    v9 = v8;
    -[MessageListViewController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
    v5 = v9 - v10;

  }
  v11 = 0.0;
  v12 = 0.0;
  v13 = 0.0;
  v14 = v5;
  result.trailing = v13;
  result.bottom = v12;
  result.leading = v14;
  result.top = v11;
  return result;
}

- (MessageListDragDropHelper)messageListDragDropHelper
{
  return self->_messageListDragDropHelper;
}

- (void)mailboxStatusUpdated:(id)a3 statusInfo:(id)a4 forMailboxObjectID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v7, "state") == (id)1)
  {
    -[MessageListViewController _finishRefreshingWaitForDraggingToEnd:](self, "_finishRefreshingWaitForDraggingToEnd:", 1);
    if (objc_msgSend(v7, "hasAccountError"))
    {
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100139234;
      v11[3] = &unk_10051B9A0;
      objc_copyWeak(&v13, &location);
      v12 = v8;
      v10 = objc_msgSend(v9, "afterDelay:performBlock:", v11, 30.0);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }

}

- (NSMutableDictionary)mailboxBrowseActivityPayload
{
  return self->_mailboxBrowseActivityPayload;
}

- (MailStatusViewController)mailStatusViewController
{
  return self->_mailStatusViewController;
}

- (MailStatusObserver)mailStatusObserver
{
  return self->_mailStatusObserver;
}

- (id)lastSelectedItemID
{
  EMCollectionItemID **p_lastSelectedItemID;
  EMCollectionItemID *lastSelectedItemID;
  EMCollectionItemID *v4;
  void *v5;
  void *v6;
  void *v7;

  p_lastSelectedItemID = &self->_lastSelectedItemID;
  lastSelectedItemID = self->_lastSelectedItemID;
  if (lastSelectedItemID)
  {
    v4 = lastSelectedItemID;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "referenceMessageListItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemID"));

    if (v7)
      objc_storeStrong((id *)p_lastSelectedItemID, v7);
    v4 = *p_lastSelectedItemID;

  }
  return v4;
}

- (BOOL)isSearching
{
  return 0;
}

- (BOOL)isSearchSuggestionsVisible
{
  return 0;
}

- (EFLocked)isRefreshing
{
  return self->_isRefreshing;
}

- (EFFuture)flattenedMailboxesFuture
{
  return self->_flattenedMailboxesFuture;
}

- (MFMailboxFilterPickerControl)filterPickerControl
{
  MFMailboxFilterPickerControl *filterPickerControl;
  MFMailboxFilterPickerControl *v4;
  void *v5;
  void *v6;
  MFMailboxFilterPickerControl *v7;
  MFMailboxFilterPickerControl *v8;

  filterPickerControl = self->_filterPickerControl;
  if (!filterPickerControl)
  {
    v4 = [MFMailboxFilterPickerControl alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController navigationController](self, "navigationController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "toolbar"));
    objc_msgSend(v6, "bounds");
    v7 = -[MFMailboxFilterPickerControl initWithFrame:](v4, "initWithFrame:");

    -[MFMailboxFilterPickerControl addTarget:action:forEvents:](v7, "addTarget:action:forEvents:", self, "filterPickerButtonPressed", 64);
    v8 = self->_filterPickerControl;
    self->_filterPickerControl = v7;

    filterPickerControl = self->_filterPickerControl;
  }
  return filterPickerControl;
}

- (MFMailboxFilterBarButtonItem)filterButtonItem
{
  MFMailboxFilterBarButtonItem *filterButtonItem;
  MFMailboxFilterBarButtonItem *v4;
  MFMailboxFilterBarButtonItem *v5;

  filterButtonItem = self->_filterButtonItem;
  if (!filterButtonItem)
  {
    v4 = -[MFMailboxFilterBarButtonItem initWithTarget:action:]([MFMailboxFilterBarButtonItem alloc], "initWithTarget:action:", self, "filterButtonPressed:");
    v5 = self->_filterButtonItem;
    self->_filterButtonItem = v4;

    filterButtonItem = self->_filterButtonItem;
  }
  return filterButtonItem;
}

- (LongPressableButtonItem)deleteButtonItem
{
  LongPressableButtonItem *deleteButtonItem;
  LongPressableButtonItem *v4;
  void *v5;
  LongPressableButtonItem *v6;
  LongPressableButtonItem *v7;
  void *v8;
  LongPressableButtonItem *v9;

  deleteButtonItem = self->_deleteButtonItem;
  if (!deleteButtonItem)
  {
    if (-[MessageListViewController _shouldShowButtonImages](self, "_shouldShowButtonImages"))
    {
      v4 = [LongPressableButtonItem alloc];
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphTrash));
      v6 = -[LongPressableButtonItem initWithImage:style:target:action:](v4, "initWithImage:style:target:action:", v5, 7, self, "_bulkDeleteButtonPressed:");
    }
    else
    {
      v7 = [LongPressableButtonItem alloc];
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DELETE_BUTTON"), &stru_100531B00, CFSTR("Main")));
      v6 = -[LongPressableButtonItem initWithTitle:style:target:action:](v7, "initWithTitle:style:target:action:", v8, 7, self, "_bulkDeleteButtonPressed:");

    }
    -[LongPressableButtonItem setLongPressTarget:action:](v6, "setLongPressTarget:action:", self, "_bulkDeleteButtonLongPressed:");
    v9 = self->_deleteButtonItem;
    self->_deleteButtonItem = v6;

    deleteButtonItem = self->_deleteButtonItem;
  }
  return deleteButtonItem;
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (void)badgeCountUpdated:(id)a3 badgeCount:(int64_t)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", a3, _NSConcreteStackBlock, 3221225472, sub_10003ADF0, &unk_10051ABD8, self, a4));
  objc_msgSend(v4, "performBlock:", &v5);

}

- (MFAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (void)_updateNoContentViewAnimated:(BOOL)a3 suppressNoContentView:(BOOL)a4
{
  void *v4;
  _QWORD v5[6];
  BOOL v6;
  BOOL v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003A34C;
  v5[3] = &unk_10051FC60;
  v5[4] = self;
  v5[5] = a2;
  v6 = a3;
  v7 = a4;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  objc_msgSend(v4, "performBlock:", v5);

}

- (void)_updateBackButtonImage
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailStatusObserver](self, "mailStatusObserver"));
  -[MessageListViewController _updateBackButtonImageWithCount:](self, "_updateBackButtonImageWithCount:", objc_msgSend(v3, "badgeCount"));

}

- (BOOL)_shouldProcessButtonUpdates
{
  _BOOL4 v3;

  if (!-[MessageListViewController _shouldDisplaySearchButtons](self, "_shouldDisplaySearchButtons")
    || (v3 = -[MessageListViewController isSearchViewController](self, "isSearchViewController")))
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)_setContentUnavailableTitle:(id)a3 animated:(BOOL)a4
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _QWORD v53[4];
  _BYTE buf[12];
  __int16 v55;
  MessageListViewController *v56;

  v43 = a4;
  v44 = a3;
  if (objc_msgSend(v44, "length"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController noContentView](self, "noContentView"));
    if (v5)
    {
LABEL_19:

      goto LABEL_20;
    }
    v6 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class(self);
      v8 = NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v9;
      v55 = 2048;
      v56 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<%@: %p> Make no content view visible", buf, 0x16u);

    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration emptyConfiguration](UIContentUnavailableConfiguration, "emptyConfiguration"));
    objc_msgSend(v42, "setText:", v44);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailMessageListBackgroundColor](UIColor, "mailMessageListBackgroundColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "background"));
    objc_msgSend(v11, "setBackgroundColor:", v10);

    v5 = objc_msgSend(objc_alloc((Class)UIContentUnavailableView), "initWithConfiguration:", v42);
    -[MessageListViewController setNoContentView:](self, "setNoContentView:", v5);
    objc_msgSend(v5, "setUserInteractionEnabled:", 0);
    v12 = 1.0;
    if (v43)
      v12 = 0.0;
    objc_msgSend(v5, "setAlpha:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
    objc_msgSend(v13, "addSubview:", v5);

    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:"));
    v53[0] = v38;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:"));
    v53[1] = v32;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v14));
    v53[2] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
    v53[3] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v53, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

    if (v43)
    {
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_10012ACC0;
      v50[3] = &unk_10051FC88;
      v5 = v5;
      v51 = v5;
      objc_copyWeak(&v52, (id *)buf);
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v50, 0.25);
      objc_destroyWeak(&v52);

      objc_destroyWeak((id *)buf);
    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
      objc_msgSend(v31, "setNeedsUpdateContentUnavailableConfiguration");

    }
    v30 = v42;
LABEL_18:

    goto LABEL_19;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController noContentView](self, "noContentView"));

  if (v21)
  {
    v22 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (objc_class *)objc_opt_class(self);
      v24 = NSStringFromClass(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v25;
      v55 = 2048;
      v56 = self;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "<%@: %p> Hide no content view", buf, 0x16u);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController noContentView](self, "noContentView"));
    -[MessageListViewController setNoContentView:](self, "setNoContentView:", 0);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10012AD38;
    v48[3] = &unk_10051AA98;
    v27 = v26;
    v49 = v27;
    v28 = objc_retainBlock(v48);
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10012AD44;
    v45[3] = &unk_10051FCB0;
    v5 = v27;
    v46 = v5;
    objc_copyWeak(&v47, (id *)buf);
    v29 = objc_retainBlock(v45);
    if (v43)
    {
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v28, v29, 0.25);
    }
    else
    {
      ((void (*)(_QWORD *))v28[2])(v28);
      ((void (*)(_QWORD *, uint64_t))v29[2])(v29, 1);
    }

    objc_destroyWeak(&v47);
    objc_destroyWeak((id *)buf);

    v30 = v49;
    goto LABEL_18;
  }
LABEL_20:

}

- (void)_doInitialMessageSelection
{
  void *v2;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;

  if ((objc_msgSend(UIApp, "launchedToTest") & 1) == 0
    && !+[EMInternalPreferences preferenceEnabled:](EMInternalPreferences, "preferenceEnabled:", 15))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "referenceMessageListItem"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
    if (v13 || !objc_msgSend(v7, "isInExpandedEnvironment"))
      goto LABEL_18;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "splitViewController"));
    v9 = objc_msgSend(v8, "displayMode");
    if (v9 != (id)2)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "splitViewController"));
      if (objc_msgSend(v2, "displayMode") != (id)3)
        goto LABEL_12;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
    if ((objc_msgSend(v10, "containsDraftsOrOutbox") & 1) == 0)
    {
      v11 = -[MessageListViewController numberOfItemsInDataSourceExcludingTips]_0(self);

      if (v9 != (id)2)
      if (!v11)
      {
        -[MessageListViewController setShouldSelectInitialMessage:](self, "setShouldSelectInitialMessage:", -[MessageListViewController _allowsAutoSelectionOfInitialMessage](self, "_allowsAutoSelectionOfInitialMessage"));
        goto LABEL_18;
      }
LABEL_17:
      -[MessageListViewController _selectInitialMessageNow](self, "_selectInitialMessageNow");
LABEL_18:

      return;
    }

    if (v9 != (id)2)
LABEL_12:

    goto LABEL_17;
  }
  v12 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class(self);
    v5 = NSStringFromClass(v4);
    objc_claimAutoreleasedReturnValue(v5);
    sub_100040108();
  }

}

- (void)selectMessageAtIndex:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v5 = objc_msgSend(v8, "sectionIndexForSection:", MessageListSectionRecent);

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a3, v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
  objc_msgSend(v6, "selectItemAtIndexPath:animated:scrollPosition:", v9, 0, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
  -[MessageListViewController collectionView:didSelectItemAtIndexPath:](self, "collectionView:didSelectItemAtIndexPath:", v7, v9);

}

- (id)referenceMessageListItemForFirstConversationWithSingleMessage:(BOOL)a3 markAsRead:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  _BYTE v20[128];

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIdentifiers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (!v8)
  {
LABEL_12:
    v12 = 0;
    goto LABEL_17;
  }
  v9 = *(_QWORD *)v16;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v16 != v9)
      objc_enumerationMutation(v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageListItemForItemID:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10)));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "result"));

    if (!v5)
      break;
    if (objc_msgSend(v12, "count") == (id)1)
      goto LABEL_13;
LABEL_10:

    if (v8 == (id)++v10)
    {
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v8)
        goto LABEL_3;
      goto LABEL_12;
    }
  }
  if ((unint64_t)objc_msgSend(v12, "count") <= 1)
    goto LABEL_10;
LABEL_13:

  if (!v12)
    goto LABEL_18;
  v19 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MFFlagChangeTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:reason:](MFReadTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:reason:", v13, 0, 2, 2, 4));

  if (v4 && (objc_msgSend(v7, "flagState") & 1) == 0)
    objc_msgSend(v7, "performInteraction");
LABEL_17:

LABEL_18:
  return v12;
}

+ (id)signpostLog
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011F238;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9FF0 != -1)
    dispatch_once(&qword_1005A9FF0, block);
  return (id)qword_1005A9FE8;
}

- (unint64_t)signpostID
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_signpost_id_make_with_pointer(v4, self);

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  EFUnregisterContentProtectionObserver(self, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MessageListViewController;
  -[MessageListViewController dealloc](&v4, "dealloc");
}

- (void)updateState:(id)a3 withMailboxes:(id)a4
{
  void *v4;
  id v7;
  id v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MessageListViewController;
  -[MessageListViewController updateState:withMailboxes:](&v15, "updateState:withMailboxes:", v7, v8);
  v9 = objc_msgSend(v7, "isOutgoingMailbox");
  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
    v10 = objc_msgSend(v4, "BOOLForKey:", DisableThreadingKey) ^ 1;
  }
  -[MessageListViewController setThreaded:](self, "setThreaded:", v10);
  if ((v9 & 1) == 0)

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "daemonInterface"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "interactionLogger"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "messageListTypeForMailboxes:", v8));
  -[MessageListViewController setMessageListType:](self, "setMessageListType:", v14);

}

- (id)_noContentTitleForMailboxTypeString
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NO_MAIL"), &stru_100531B00, CFSTR("Main")));

  if (-[MessageListViewController isSearchViewController](self, "isSearchViewController"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("NO_SEARCH_RESULTS"), &stru_100531B00, CFSTR("Main")));
LABEL_3:
    v7 = (void *)v6;
LABEL_19:

    v4 = v7;
LABEL_20:

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
    v9 = objc_msgSend(v8, "containsSmartMailbox");

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ef_firstObjectPassingTest:", &stru_10051F868));

      v11 = objc_msgSend(v5, "smartMailboxType");
      v12 = CFSTR("No Messages to Send Later");
      switch((unint64_t)v11)
      {
        case 0uLL:
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NO_VIP_MAIL"), &stru_100531B00, CFSTR("Main")));
          goto LABEL_18;
        case 1uLL:
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NO_FLAGGED_MAIL"), &stru_100531B00, CFSTR("Main")));
          goto LABEL_18;
        case 2uLL:
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NO_UNREAD_MAIL"), &stru_100531B00, CFSTR("Main")));
          goto LABEL_18;
        case 3uLL:
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NO_MESSAGES_TO_ME"), &stru_100531B00, CFSTR("Main")));
          goto LABEL_18;
        case 4uLL:
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NO_MESSAGES_WITH_ATTACHMENTS"), &stru_100531B00, CFSTR("Main")));
          goto LABEL_18;
        case 5uLL:
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NO_IMPORTANT_MAIL"), &stru_100531B00, CFSTR("Main")));
          goto LABEL_18;
        case 6uLL:
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NO_MESSAGES_TODAY"), &stru_100531B00, CFSTR("Main")));
          goto LABEL_18;
        case 7uLL:
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NO_MUTED_MAIL"), &stru_100531B00, CFSTR("Main")));
          goto LABEL_18;
        case 9uLL:
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NO_MESSAGES_READ_LATER"), &stru_100531B00, CFSTR("Main")));
          goto LABEL_18;
        case 0xAuLL:
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NO_MESSAGES_FOLLOW_UP"), &stru_100531B00, CFSTR("Main")));
LABEL_18:
          v7 = (void *)v14;

          v4 = v13;
          goto LABEL_19;
        case 0xBuLL:
          goto LABEL_16;
        case 0xCuLL:
          v12 = CFSTR("No Messages for Unsubscribing");
LABEL_16:
          v15 = sub_10011F928((uint64_t)v12);
          v6 = objc_claimAutoreleasedReturnValue(v15);
          goto LABEL_3;
        default:
          goto LABEL_20;
      }
    }
  }
  return v4;
}

- (id)ef_publicDescription
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageRepository](self, "messageRepository"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> Repository:%@ Mailboxes:%@"), v3, self, v4, v5));

  return v6;
}

- (int64_t)preferredMessageListLayout
{
  return -[MessageListViewController isSearchViewController](self, "isSearchViewController");
}

- (id)_layoutSectionAtSection:(int64_t)a3 layoutEnvironment:(id)a4 layout:(int64_t)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  _QWORD v19[4];
  id v20[2];
  id location;

  v8 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[MessageListViewController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10011FB54;
  v19[3] = &unk_10051F890;
  objc_copyWeak(v20, &location);
  v20[1] = (id)a3;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MessageListLayoutFactory layoutSectionAtSection:layoutEnvironment:layoutMargins:layout:configuration:](MessageListLayoutFactory, "layoutSectionAtSection:layoutEnvironment:layoutMargins:layout:configuration:", a3, v8, a5, v19, v10, v12, v14, v16));
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  return v17;
}

- (void)_configureLayoutListConfiguration:(id)a3 atSection:(int64_t)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  _QWORD v11[6];
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  v6 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10011FE88;
  v18[3] = &unk_10051F8B8;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v6, "setLeadingSwipeActionsConfigurationProvider:", v18);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10011FEF0;
  v16[3] = &unk_10051F8B8;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v6, "setTrailingSwipeActionsConfigurationProvider:", v16);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10011FF58;
  v14[3] = &unk_10051B1B8;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v6, "_setWillBeginSwipingHandler:", v14);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10011FFA4;
  v12[3] = &unk_10051B1B8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v6, "_setDidEndSwipingHandler:", v12);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10011FFF0;
  v11[3] = &unk_10051F8E0;
  v11[4] = self;
  v11[5] = a4;
  objc_msgSend(v6, "setItemSeparatorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v8 = objc_msgSend(v7, "shouldDisplaySupplementaryKind:forSectionAtIndex:", UICollectionElementKindSectionHeader, a4);

  if (_os_feature_enabled_impl("Mail", "CatchUpHighlights"))
  {
    if (EMIsGreymatterSupportedWithOverride())
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
      v10 = objc_msgSend(v9, "isSection:atIndex:", MessageListSectionRecent, a4);

      if (v10)
      {
        if (-[MessageListViewController _shouldShowHighlights](self, "_shouldShowHighlights"))
        {
          objc_msgSend(v6, "setHeaderTopPadding:", 4.0);
          v8 = 1;
        }
        else
        {
          v8 = 0;
        }
      }
    }
  }
  objc_msgSend(v6, "setHeaderMode:", v8);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MessageListViewController;
  -[MessageListViewController traitCollectionDidChange:](&v13, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController layoutValuesHelper](self, "layoutValuesHelper"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
    objc_msgSend(v6, "updateTintColorFromView:", v7);

    -[MessageListViewController _updateHighlightsBorderColorIfNecessary](self, "_updateHighlightsBorderColorIfNecessary");
  }
  if (objc_msgSend(v5, "mf_traitDifferenceAffectsTextLayout:", v4))
  {
    v8 = objc_msgSend(v5, "mf_useSplitViewStyling");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
    objc_msgSend(v9, "setUseSplitViewStyling:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController layoutValuesHelper](self, "layoutValuesHelper"));
    objc_msgSend(v10, "setTraitCollection:", v5);

    -[MessageListViewController _updateToolbarButtons](self, "_updateToolbarButtons");
    -[MessageListViewController _updateListForChange:](self, "_updateListForChange:", 0);
    -[MessageListViewController _updateLayoutMargins](self, "_updateLayoutMargins");
    -[MessageListViewController _updateStackViewController](self, "_updateStackViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "collectionViewLayout"));
    objc_msgSend(v12, "invalidateLayout");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MessageListViewController;
  -[MessageListViewController viewWillDisappear:](&v11, "viewWillDisappear:", a3);
  *((_BYTE *)self + 8) &= ~1u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
  v5 = objc_msgSend(v4, "containsOutbox");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "daemonInterface"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "outgoingMessageRepository"));
    objc_msgSend(v8, "resumeDeliveryQueue");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController userActivity](self, "userActivity"));
  objc_msgSend(v9, "resignCurrent");

  sub_10012059C(self);
  -[MessageListViewController _deregisterViewInteractions](self, "_deregisterViewInteractions");
  if (!-[MessageListViewController isSearchViewController](self, "isSearchViewController")
    && !-[MessageListViewController _isInSearch](self, "_isInSearch"))
  {
    -[MessageListViewController dismissTip](self, "dismissTip");
    -[MessageListViewController changeTipShouldDisplayTo:](self, "changeTipShouldDisplayTo:", 0);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
  objc_msgSend(v10, "setNeedsUpdateContentUnavailableConfiguration");

}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  MessageListViewController *v20;

  v16.receiver = self;
  v16.super_class = (Class)MessageListViewController;
  -[MessageListViewController viewDidDisappear:](&v16, "viewDidDisappear:", a3);
  v4 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 138543618;
    v18 = v7;
    v19 = 2048;
    v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> viewDidDisappear", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dockContainer"));
  objc_msgSend(v9, "removePresentationControllerDelegateObserver:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "daemonInterface"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interactionLogger"));
  objc_msgSend(v11, "messageListDisplayEndedForAllListItems");

  -[MessageListViewController _clearVisibleSwipeActions](self, "_clearVisibleSwipeActions");
  if (_os_feature_enabled_impl("Mail", "CatchUpHighlights"))
  {
    if (EMIsGreymatterSupportedWithOverride())
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController highlightedMessagesController](self, "highlightedMessagesController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "messageList"));
      v14 = v13 == 0;

      if (!v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController highlightedMessagesViewController](self, "highlightedMessagesViewController"));
        +[MUIHighlightedMessagesViewControllerFactory resetSelectionForViewController:](MUIHighlightedMessagesViewControllerFactory, "resetSelectionForViewController:", v15);

      }
    }
  }
  -[MessageListViewController setInitialCellConfigurationCompleted:](self, "setInitialCellConfigurationCompleted:", 1);

}

- (void)_deregisterViewInteractions
{
  void *v3;
  void *v4;
  UIInteraction *changeFilterStateInteraction;
  void *v6;

  if (self && self->_changeFilterStateInteraction)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
    v4 = v3;
    if (self)
      changeFilterStateInteraction = self->_changeFilterStateInteraction;
    else
      changeFilterStateInteraction = 0;
    objc_msgSend(v3, "removeInteraction:", changeFilterStateInteraction);

    sub_10003EC94((uint64_t)self, 0);
  }
  if (self)
  {
    if (self->_searchMessagesInteraction)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchBar](self, "searchBar"));
      objc_msgSend(v6, "removeInteraction:", self->_searchMessagesInteraction);

      sub_10003EA04((uint64_t)self, 0);
    }
  }
}

- (void)didFinishLoadViewController
{
  NSObject *v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD block[5];
  uint8_t buf[16];

  if (-[MessageListViewController isInitialCellConfigurationCompleted](self, "isInitialCellConfigurationCompleted")&& (-[MessageListViewController didNotifyExtendedLaunchTracker](self, "didNotifyExtendedLaunchTracker") & 1) == 0&& !-[MessageListViewController isSearchViewController](self, "isSearchViewController"))
  {
    v3 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Launch] Did finish load view controller", buf, 2u);
    }

    -[MessageListViewController setDidNotifyExtendedLaunchTracker:](self, "setDidNotifyExtendedLaunchTracker:", 1);
    -[MessageListViewController cancelQueueSuspensionTimeout](self, "cancelQueueSuspensionTimeout");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "extendedLaunchTracker"));
    objc_msgSend(v5, "didFinishLoadViewController:scene:", self, v4);

    v6 = dispatch_time(0, 250000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100120BAC;
    block[3] = &unk_10051AA98;
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (BOOL)showingPopoverViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController presentedViewController](self, "presentedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "popoverPresentationController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "barButtonItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController filterPickerButtonItem](self, "filterPickerButtonItem"));

  if (v5 == v6
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "barButtonItem")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController deleteButtonItem](self, "deleteButtonItem")),
        v8,
        v7,
        v7 == v8))
  {
    v11 = 1;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sourceView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
    v11 = objc_msgSend(v9, "isDescendantOfView:", v10);

  }
  return v11;
}

- (void)updateForSplitViewControllerHidingMessageList
{
  if (-[MessageListViewController isEditing](self, "isEditing"))
  {
    -[MessageListViewController _setEditing:animated:preserveSelection:](self, "_setEditing:animated:preserveSelection:", 0, 1, 1);
    -[MessageListViewController _updateTitle](self, "_updateTitle");
  }
}

- (void)_sceneDidEnterBackground:(id)a3
{
  -[MessageListViewController _sceneDidEnterBackground](self, "_sceneDidEnterBackground", a3);
}

- (void)_sceneDidEnterBackground
{
  id v3;

  if ((-[MessageListViewController isEditing](self, "isEditing") & 1) == 0)
    -[MessageListViewController setPreviousMessageListSelectionModel:](self, "setPreviousMessageListSelectionModel:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController cellsController](self, "cellsController"));
  objc_msgSend(v3, "reportMessageListCellMetrics");

}

- (id)undoManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "undoManager"));

  return v3;
}

- (void)setMailboxes:(id)a3
{
  -[MessageListViewController setMailboxes:forceReload:](self, "setMailboxes:forceReload:", a3, 0);
}

- (id)_currentScrollableHint
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  __n128 v9;
  NSNumber *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController navigationController](self, "navigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "toolbar"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
  objc_msgSend(v5, "frame");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
  v9.n128_u64[0] = v7;
  v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", UIRoundToViewScale(v8, v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));
  v16 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "_hintFromCurrentAppearance")));
  v17 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));

  return v14;
}

- (void)_callUpdateScrollableHintBlock
{
  void *v3;
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(-[MessageListViewController updateScrollableHintBlock](self, "updateScrollableHintBlock"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scrollableHintBlock](self, "scrollableHintBlock"));
  if (v5 && v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _currentScrollableHint](self, "_currentScrollableHint"));
    v5[2](v5, v4);

  }
}

- (id)_observedMailboxes
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ef_filter:", &stru_10051F940));

  if (!objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
    v6 = objc_msgSend(v5, "containsSmartMailbox");

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController accountsProvider](self, "accountsProvider"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayedAccounts"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ef_compactMap:", &stru_10051F960));

      v4 = (void *)v10;
    }
  }
  return v4;
}

- (BOOL)hasSuggestions
{
  return 0;
}

- (double)editingSeparatorInset
{
  void *v2;
  double v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
  if (objc_msgSend(v2, "useSplitViewStyling"))
    v3 = 36.0;
  else
    v3 = 41.0;

  return v3;
}

- (BOOL)isSearchViewControllerEditing
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController presentedViewController](self, "presentedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchController](self, "searchController"));

  if (v3 != v4)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSearchViewController](self, "messageListSearchViewController"));
  v5 = objc_msgSend(v6, "isEditing");

  return v5;
}

- (BOOL)isPresentingSearchViewController
{
  MessageListViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController presentedViewController](self, "presentedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchController](v2, "searchController"));
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (BOOL)isInExpandedEnvironment
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v3 = objc_msgSend(v2, "isInExpandedEnvironment");

  return v3;
}

- (BOOL)isSearchControllerActive
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchController](self, "searchController"));
  v3 = objc_msgSend(v2, "isActive");

  return v3;
}

- (void)setSplitViewControllerNeedsFocusUpdate
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "splitViewController"));
  objc_msgSend(v2, "setNeedsFocusUpdate");

}

- (id)captureRestorationState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  MessageListRestorationState *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  MessageListRestorationState *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v24;
  NSString *v25;
  void *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  MessageListViewController *v32;
  __int16 v33;
  void *v34;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListPositionHelper](self, "messageListPositionHelper"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actuallyVisibleItemIDs"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageListItemsForItemIDs:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture join:](EFFuture, "join:", v6));

  v28 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resultWithTimeout:error:", &v28, 0.1));
  v9 = v28;
  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v24 = (objc_class *)objc_opt_class(self);
      v25 = NSStringFromClass(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ef_publicDescription"));
      *(_DWORD *)buf = 138412802;
      v30 = v26;
      v31 = 2048;
      v32 = self;
      v33 = 2112;
      v34 = v27;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "<%@: %p> Fetching visible items for the restoration state failed with error: %@", buf, 0x20u);

    }
    v11 = 0;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
    objc_msgSend(v12, "contentOffset");
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController layoutValuesHelper](self, "layoutValuesHelper"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "defaultLayoutValues"));
    objc_msgSend(v16, "compactRowHeight");
    v18 = v17;

    v19 = [MessageListRestorationState alloc];
    v10 = objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject messageListForSection:](v10, "messageListForSection:", MessageListSectionRecent));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController lastSelectedItemID](self, "lastSelectedItemID"));
    v11 = -[MessageListRestorationState initWithMessageList:mailboxes:visibleItems:scrolledToTop:lastSelectedItemID:](v19, "initWithMessageList:mailboxes:visibleItems:scrolledToTop:lastSelectedItemID:", v20, v21, v8, v14 < v18, v22);

  }
  return v11;
}

- (void)restoreState:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _BYTE buf[12];
  __int16 v19;
  MessageListViewController *v20;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v8;
    v19 = 2048;
    v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<%@: %p> State Restoration: Received restoration state future. Will restore state when it's loaded.", buf, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController stateRestorationFuture](self, "stateRestorationFuture"));
  objc_msgSend(v9, "cancel");

  -[MessageListViewController setShouldSelectInitialMessage:](self, "setShouldSelectInitialMessage:", 0);
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100121C18;
  v16[3] = &unk_10051F9D8;
  objc_copyWeak(&v17, (id *)buf);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "onScheduler:then:", v10, v16));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10012252C;
  v14[3] = &unk_10051B1B8;
  objc_copyWeak(&v15, (id *)buf);
  objc_msgSend(v11, "always:", v14);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100122574;
  v13[3] = &unk_10051FA00;
  v13[4] = self;
  objc_msgSend(v11, "addSuccessBlock:", v13);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100122664;
  v12[3] = &unk_10051B140;
  v12[4] = self;
  objc_msgSend(v11, "addFailureBlock:", v12);
  -[MessageListViewController setStateRestorationFuture:](self, "setStateRestorationFuture:", v11);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (void)_cancelOrCleanupStateRestoration
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  MessageListViewController *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController stateRestorationFuture](self, "stateRestorationFuture"));

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class(self);
      v6 = NSStringFromClass(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v10 = 138412546;
      v11 = v7;
      v12 = 2048;
      v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<%@: %p> State Restoration: Cleaning up...", (uint8_t *)&v10, 0x16u);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController stateRestorationFuture](self, "stateRestorationFuture"));
    objc_msgSend(v8, "cancel");

    -[MessageListViewController setStateRestorationFuture:](self, "setStateRestorationFuture:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scrollItemIndexPathPromise](self, "scrollItemIndexPathPromise"));
    objc_msgSend(v9, "cancel");

    -[MessageListViewController setScrollItemIndexPathPromise:](self, "setScrollItemIndexPathPromise:", 0);
    -[MessageListViewController setInitialScrollItemID:](self, "setInitialScrollItemID:", 0);
  }
}

- (void)reloadDataSource
{
  NSMutableSet *indexPathsForConfiguredCollectionViewCells;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  uint8_t v16[16];

  -[MessageListViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[MessageListViewController setCurrentUnreadCount:](self, "setCurrentUnreadCount:", 0x8000000000000000);
  if (self)
    indexPathsForConfiguredCollectionViewCells = self->_indexPathsForConfiguredCollectionViewCells;
  else
    indexPathsForConfiguredCollectionViewCells = 0;
  -[NSMutableSet removeAllObjects](indexPathsForConfiguredCollectionViewCells, "removeAllObjects");
  -[MessageListViewController setFirstBatchCellConfigurationCompleted:](self, "setFirstBatchCellConfigurationCompleted:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController createMessageListForReload](self, "createMessageListForReload"));
  v6 = MFMessageListLoadingSignpostLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectID"));
  v9 = os_signpost_id_make_with_pointer(v7, v8);

  v10 = MFMessageListLoadingSignpostLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "MessageListLoading", "Begin loading message list enableTelemetry=YES ", v16, 2u);
  }

  if (v5)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController currentFilterPredicate](self, "currentFilterPredicate"));
    v14 = sub_100121094(self, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    sub_100011278(self, v4, v15);

  }
  if (-[MessageListViewController _isInSearch](self, "_isInSearch"))
    -[MessageListViewController dismissSearchResultsAnimated:](self, "dismissSearchResultsAnimated:", 1);
  -[MessageListViewController setSuppressNoContentView:](self, "setSuppressNoContentView:", 1);
  -[MessageListViewController _setContentUnavailableTitle:animated:](self, "_setContentUnavailableTitle:animated:", 0, 0);
  -[MessageListViewController reloadDataSourceWithMessageList:](self, "reloadDataSourceWithMessageList:", v5);

}

- (BOOL)_canDisplayMessage:(id)a3
{
  void *v4;
  id v5;
  unsigned __int8 v6;
  _QWORD v8[4];
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mailboxObjectIDs"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100122DF0;
  v8[3] = &unk_10051FA48;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController resolvedMailboxObjectIDs](self, "resolvedMailboxObjectIDs"));
  v5 = v9;
  v6 = objc_msgSend(v4, "ef_any:", v8);

  return v6;
}

- (void)_doOnInitialLoadCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController initialLoadCompletedPromise](self, "initialLoadCompletedPromise"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "future"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100122F04;
  v9[3] = &unk_10051FA70;
  v8 = v4;
  v10 = v8;
  objc_msgSend(v6, "onScheduler:addSuccessBlock:", v7, v9);

}

- (EFFuture)initialLoadCompletedFuture
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController initialLoadCompletedPromise](self, "initialLoadCompletedPromise"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "future"));

  return (EFFuture *)v3;
}

- (void)waitForLocalAndRemoteSearchCompletion:(id)a3
{
  id v5;

  v5 = a3;
  -[MessageListViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MessageListViewController waitForLocalAndRemoteSearchCompletion:]", "MessageListViewController.m", 1491, "0");
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unsigned __int8 v11;
  char v12;
  NSObject *v13;
  objc_class *v14;
  NSString *v15;
  id v16;
  void *v17;
  unsigned int v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  MessageListViewController *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  unsigned int v38;
  __int16 v39;
  void *v40;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIdentifierForIndexPath:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _draftOrOutboxMessageAtIndexPath:](self, "_draftOrOutboxMessageAtIndexPath:", v5));
  if (v9)
    -[MessageListViewController _restoreDraftOrOutboxItem:](self, "_restoreDraftOrOutboxItem:", v9);
  v10 = objc_msgSend(v24, "isInExpandedEnvironment");
  if ((v10 & 1) != 0
    || (objc_msgSend(v8, "containsOutbox") & 1) != 0
    || ((v11 = objc_msgSend(v8, "containsDraftsMailbox"), v9) ? (v12 = 1) : (v12 = v11), (v12 & 1) != 0))
  {
    v13 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v7;
      v23 = v8;
      v14 = (objc_class *)objc_opt_class(self);
      v15 = NSStringFromClass(v14);
      v16 = (id)objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ef_publicDescription"));
      v18 = objc_msgSend(v8, "containsOutbox");
      v19 = objc_msgSend(v23, "containsDraftsMailbox");
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ef_publicDescription"));
      *(_DWORD *)buf = 138545154;
      v26 = v16;
      v27 = 2048;
      v28 = self;
      v29 = 2114;
      v30 = v17;
      v31 = 2114;
      v32 = v22;
      v33 = 1024;
      v34 = v10;
      v35 = 1024;
      v36 = v18;
      v37 = 1024;
      v38 = v19;
      v7 = v22;
      v39 = 2114;
      v40 = v20;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Skip showing conversation view - indexPath=%{public}@, messageID=%{public}@, isInExpandedEnvironment=%{BOOL}d, containsOutbox=%{BOOL}d, containsDraftsMailbox=%{BOOL}d, draftOrOutboxMessage=%{public}@", buf, 0x46u);

      v8 = v23;
    }

  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "splitViewController"));
    objc_msgSend(v21, "showConversationViewControllerAnimated:completion:", 1, 0);

  }
  -[MessageListViewController _hideMailboxPickerOrMessageListAfterSelectionIfNeeded](self, "_hideMailboxPickerOrMessageListAfterSelectionIfNeeded");
  -[MessageListViewController reportEngagementAction:onItemID:](self, "reportEngagementAction:onItemID:", 0, v7);

}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_100123320((uint64_t)self, a4);
}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  id v5;
  char v6;

  v5 = a4;
  if ((-[MessageListViewController isEditing](self, "isEditing") & 1) != 0)
    v6 = 0;
  else
    v6 = sub_100123320((uint64_t)self, v5);

  return v6;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  os_signpost_id_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  MessageListViewController *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  _BOOL4 v38;

  v5 = a4;
  v6 = _os_activity_create((void *)&_mh_execute_header, "-[MessageListViewController collectionView:didSelectItemAtIndexPath:]", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v6, &state);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemIdentifierForIndexPath:", v5));

  v9 = -[MessageListViewController isEditing](self, "isEditing");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));

  v11 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (objc_class *)objc_opt_class(self);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 138413570;
    v28 = v14;
    v29 = 2048;
    v30 = self;
    v31 = 2114;
    v32 = v8;
    v33 = 2112;
    v34 = v5;
    v35 = 1024;
    v36 = v9;
    v37 = 1024;
    v38 = v10 != 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<%@: %p> collectionView:didSelectItem: %{public}@, atIndexPath: %@, isEditing: %{BOOL}d, hasSelectionModel: %{BOOL}d", buf, 0x36u);

  }
  if (v10)
  {
    -[MessageListViewController _updateSelectionModelDidSelectItemID:](self, "_updateSelectionModelDidSelectItemID:", v8);
    -[MessageListViewController reportEngagementAction:onItemID:](self, "reportEngagementAction:onItemID:", 4, v8);
  }
  else
  {
    v15 = MFMessageSelectionLifecycleSignpostLog();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = os_signpost_id_make_with_pointer(v16, v8);

    v18 = MFMessageSelectionLifecycleSignpostLog();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = v19;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v8;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, v17, "Message selection lifecycle", "User selected message with itemID: %{public}@", buf, 0xCu);
    }

    LOBYTE(v25) = 0;
    -[MessageListViewController _handleDidSelectItemID:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:](self, "_handleDidSelectItemID:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:", v8, 0, 0, 1, 0, 1, v25);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "splitViewController"));
  objc_msgSend(v22, "setFocusedViewController:", 0);

  -[MessageListViewController _cancelOrCleanupStateRestoration](self, "_cancelOrCleanupStateRestoration");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
  if (objc_msgSend(v23, "useSplitViewStyling"))
  {
    v24 = -[MessageListViewController _inMultiSelectionMode](self, "_inMultiSelectionMode");

    if (v24)
      sub_1001229A0(self, v8, v5);
  }
  else
  {

  }
  os_activity_scope_leave(&state);

}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  id v5;
  BOOL v6;
  void *v7;

  v5 = a3;
  if ((-[MessageListViewController isEditing](self, "isEditing") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathsForSelectedItems"));
    v6 = (unint64_t)objc_msgSend(v7, "count") > 1;

  }
  return v6;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  id v10;

  v10 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemIdentifierForIndexPath:", v10));

  v7 = -[MessageListViewController _inMultiSelectionMode](self, "_inMultiSelectionMode");
  if (-[MessageListViewController _inMultiSelectionMode](self, "_inMultiSelectionMode"))
    -[MessageListViewController _updateSelectionModelDidDeselectItemID:](self, "_updateSelectionModelDidDeselectItemID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
  v9 = objc_msgSend(v8, "useSplitViewStyling") & v7;

  if (v9 == 1)
    sub_1001229A0(self, v6, v10);

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  MessageListViewController *v24;
  __int16 v25;
  id v26;

  v7 = a4;
  v8 = a5;
  v9 = objc_opt_class(MessageListCollectionViewCell);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellHelper"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messageListItem"));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "daemonInterface"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "interactionLogger"));

      v15 = sub_100123B54((uint64_t)objc_msgSend(v10, "style"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      objc_msgSend(v14, "messageListDisplayEndedForListItem:cellStyle:", v11, v16);

    }
    else
    {
      v17 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v18 = (objc_class *)objc_opt_class(self);
        v19 = NSStringFromClass(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        v21 = 138412802;
        v22 = v20;
        v23 = 2048;
        v24 = self;
        v25 = 2112;
        v26 = v8;
        _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "<%@: %p> Looks like collection view tried to end displaying a cell that is no longer valid. Ignoring interaction log for indexPath: %@", (uint8_t *)&v21, 0x20u);

      }
    }

  }
}

- (BOOL)_inMultiSelectionMode
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
    if ((uint64_t)objc_msgSend(v4, "count") <= 1)
      v5 = -[MessageListViewController isEditing](self, "isEditing");
    else
      v5 = 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_exitMultiSelectionForce:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  MessageListViewController *v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  _BOOL4 v34;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathsForSelectedItems"));

  v7 = objc_msgSend(v6, "count");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
  v9 = v8;
  v10 = v8 != 0;
  if (v8 && v7 != (id)1)
    v10 = (uint64_t)objc_msgSend(v8, "count") < 2;
  if ((-[MessageListViewController isEditing](self, "isEditing") & 1) != 0 || !v3 && !v10)
  {
    v18 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class(self);
      v20 = NSStringFromClass(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      *(_DWORD *)buf = 138544642;
      v24 = v21;
      v25 = 2048;
      v26 = self;
      v27 = 1024;
      v28 = v10;
      v29 = 1024;
      v30 = v9 != 0;
      v31 = 1024;
      v32 = v3;
      v33 = 1024;
      v34 = v10;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Don't modify selection mode (hasMultiSelection: %{BOOL}d, hasSelectionModel: %{BOOL}d, editing: %{BOOL}d, force: %{BOOL}d)", buf, 0x2Eu);

    }
    goto LABEL_14;
  }
  v11 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (objc_class *)objc_opt_class(self);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 138544130;
    v24 = v14;
    v25 = 2048;
    v26 = self;
    v27 = 1024;
    v28 = v3;
    v29 = 1024;
    v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Exit multi-selection (force: %{BOOL}d, hasMultiSelection: %{BOOL}d)", buf, 0x22u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController layoutValuesHelper](self, "layoutValuesHelper"));
  objc_msgSend(v15, "setInMultiSelectionMode:", 0);

  -[MessageListViewController setMessageListSelectionModel:](self, "setMessageListSelectionModel:", 0);
  -[MessageListViewController _setRowDeletionEnabled:animated:](self, "_setRowDeletionEnabled:animated:", 0, 1);
  -[MessageListViewController _updateTitle](self, "_updateTitle");
  if (v7 == (id)1)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "itemIdentifierForIndexPath:", v17));

    if (-[MessageListViewController isPresentingSearchViewController](self, "isPresentingSearchViewController"))
    {
      -[MessageListViewController selectRowOfItemID:scrollToVisible:animated:](self, "selectRowOfItemID:scrollToVisible:animated:", v18, 0, 0);
    }
    else
    {
      LOBYTE(v22) = 0;
      -[MessageListViewController _handleDidSelectItemID:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:](self, "_handleDidSelectItemID:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:", v18, 0, 0, 0, 0, 0, v22);
    }
LABEL_14:

  }
}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  MessageListViewController *v33;
  __int16 v34;
  id v35;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class(self);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138543874;
    v31 = v11;
    v32 = 2048;
    v33 = self;
    v34 = 2114;
    v35 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> didBeginMultipleSelectionInteractionAtIndexPath: %{public}@", buf, 0x20u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController layoutValuesHelper](self, "layoutValuesHelper"));
  objc_msgSend(v12, "setInMultiSelectionMode:", 1);

  LODWORD(v12) = -[MessageListViewController isEditing](self, "isEditing");
  if ((_DWORD)v12 != objc_msgSend(v6, "isEditing"))
  {
    -[MessageListViewController changeTipShouldDisplayTo:](self, "changeTipShouldDisplayTo:", 0);
    -[MessageListViewController setEditing:animated:](self, "setEditing:animated:", objc_msgSend(v6, "isEditing"), 1);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "indexPathsForSelectedItems"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
  LODWORD(v14) = v16 == 0;

  if ((_DWORD)v14)
  {
    v17 = objc_msgSend(objc_alloc((Class)MessageListSelectionModel), "initWithDataSource:delegate:", self, self);
    -[MessageListViewController setMessageListSelectionModel:](self, "setMessageListSelectionModel:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
    objc_msgSend(v18, "setSelectionDataSource:", self);

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = v15;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v26;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "itemIdentifierForIndexPath:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v22), (_QWORD)v25));
          -[MessageListViewController _updateSelectionModelDidSelectItemID:](self, "_updateSelectionModelDidSelectItemID:", v23);

          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v20);
    }

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel", (_QWORD)v25));
  objc_msgSend(v24, "setMultipleSelectionActive:", 1);

}

- (void)collectionViewDidEndMultipleSelectionInteraction:(id)a3
{
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  MessageListViewController *v14;
  __int16 v15;
  void *v16;

  v5 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log", a3));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = 138543874;
    v12 = v8;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> %{public}@", (uint8_t *)&v11, 0x20u);

  }
  -[MessageListViewController _finalizeMultipleSelection](self, "_finalizeMultipleSelection");
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (-[MessageListViewController isEditing](self, "isEditing"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextFocusedIndexPath"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextFocusedIndexPath"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemIdentifierForIndexPath:", v8));
      sub_1001247FC((uint64_t)self, v9);

    }
  }

}

- (id)collectionView:(id)a3 sceneActivationConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  id v26;
  void *v27;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "messageListAtSectionIndex:", objc_msgSend(v6, "section")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "messageListItemAtIndexPath:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "result"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
  if (objc_msgSend(v10, "containsDraftsOrOutbox"))
  {
    v26 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ef_compactMapSelector:", "objectID"));

    v25 = (void *)v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mailboxObjectIDs"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObjectCommonWithArray:", v12));

    if (objc_msgSend(v10, "containsDraftsMailbox"))
      v14 = 2;
    else
      v14 = 3;
    v15 = objc_alloc((Class)_MFMailCompositionContext);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayMessageObjectID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageRepository](self, "messageRepository"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mailboxProvider"));
    v20 = objc_msgSend(v15, "initWithComposeType:objectID:mailboxID:subject:autosaveID:messageRepository:mailboxProvider:", v14, v16, v24, 0, 0, v17, v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MFBayAdoption composeWindowSceneActivationConfigurationWithContext:presentationSource:requestingScene:](MFBayAdoption, "composeWindowSceneActivationConfigurationWithContext:presentationSource:requestingScene:", v20, 0, v21));

    v6 = v26;
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MFBayAdoption openMessageInNewWindowConfigurationWithMessageListItem:messageList:](MFBayAdoption, "openMessageInNewWindowConfigurationWithMessageListItem:messageList:", v9, v27));
  }

  return v22;
}

- (id)preferredFocusEnvironments
{
  void *v3;
  unsigned __int8 v4;
  EMCollectionItemID *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  EMCollectionItemID *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchController](self, "searchController"));
  v4 = objc_msgSend(v3, "isActive");

  if ((v4 & 1) != 0)
  {
    v5 = (EMCollectionItemID *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchController](self, "searchController"));
    v12 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  }
  else
  {
    if (!self || (v5 = self->_keyboardFocusedItemID) == 0)
    {
      v5 = (EMCollectionItemID *)objc_claimAutoreleasedReturnValue(-[MessageListViewController lastSelectedItemID](self, "lastSelectedItemID"));
      if (!v5)
        return 0;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForItemIdentifier:", v5));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cellForItemAtIndexPath:", v8));

      if (v10)
      {
        v13 = v10;
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  id v4;
  EMCollectionItemID *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (self && (v5 = self->_keyboardFocusedItemID) != 0
    || (v5 = (EMCollectionItemID *)objc_claimAutoreleasedReturnValue(-[MessageListViewController lastSelectedItemID](self, "lastSelectedItemID"))) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForItemIdentifier:", v5));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_finalizeMultipleSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemsToDeselectAfterMultipleSelection"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathForItemIdentifier:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9)));
        objc_msgSend(v4, "deselectItemAtIndexPath:animated:", v10, 0);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
  objc_msgSend(v11, "setMultipleSelectionActive:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "itemIDs"));
  objc_msgSend(v12, "reloadItemsWithItemIDs:", v14);

}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListPositionHelper](self, "messageListPositionHelper"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListPositionHelper](self, "messageListPositionHelper"));
    objc_msgSend(v9, "targetContentOffsetForProposedContentOffset:", x, y);
    v11 = v10;
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
    if ((objc_msgSend(v14, "isInExpandedEnvironment") & 1) != 0)
    {

    }
    else
    {

      if (v11 != x || v13 != y)
        objc_msgSend(v7, "flashScrollIndicators");
    }
  }
  else
  {
    v11 = x;
    v13 = y;
  }

  v15 = v11;
  v16 = v13;
  result.y = v16;
  result.x = v15;
  return result;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListPositionHelper](self, "messageListPositionHelper", a3));
  objc_msgSend(v3, "setUserIsScrolling:", 1);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "splitViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController parentViewController](self, "parentViewController"));
  objc_msgSend(v6, "setFocusedViewController:", v7);

  -[MessageListViewController _cancelOrCleanupStateRestoration](self, "_cancelOrCleanupStateRestoration");
  if (!a4)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListPositionHelper](self, "messageListPositionHelper"));
    objc_msgSend(v9, "setUserIsScrolling:", 0);

  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListPositionHelper](self, "messageListPositionHelper", a3));
  objc_msgSend(v3, "setUserIsScrolling:", 0);

}

- (void)scrollViewDidScrollToTop:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListPositionHelper](self, "messageListPositionHelper", a3));
  objc_msgSend(v3, "recalculateFirstVisibleIndex");

}

- (void)_adjustNoContentMessageAlpha:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  unsigned __int8 v7;
  char v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController noContentView](self, "noContentView"));
  if (v4
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListPositionHelper](self, "messageListPositionHelper")),
        v6 = objc_msgSend(v5, "userIsScrolling"),
        v5,
        v6))
  {
    if ((-[UIRefreshControl isHidden](self->_refreshControl, "isHidden") & 1) == 0
      && objc_msgSend(v9, "isDragging"))
    {
      -[MessageListViewController supressNoContentViewAnimated:](self, "supressNoContentViewAnimated:", 0);
      -[MessageListViewController setSuppressNoContentView:](self, "setSuppressNoContentView:", 0);
    }
  }
  else
  {
    v7 = -[MessageListViewController suppressNoContentView](self, "suppressNoContentView");
    if (v4)
      v8 = 1;
    else
      v8 = v7;
    if ((v8 & 1) == 0
      && -[UIRefreshControl isHidden](self->_refreshControl, "isHidden")
      && -[MessageListViewController isInitialCellConfigurationCompleted](self, "isInitialCellConfigurationCompleted"))
    {
      -[MessageListViewController updateNoContentViewAnimated:](self, "updateNoContentViewAnimated:", 1);
    }
  }

}

- (void)_loadMoreMessagesWithMaxVisibleIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  objc_class *v11;
  NSString *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSIndexPath *v19;
  id v20;
  NSObject *v21;
  objc_class *v22;
  NSString *v23;
  id v24;
  void *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  objc_class *v31;
  NSString *v32;
  void *v33;
  void *v34;
  id v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  MessageListViewController *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];

  v35 = a3;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController resolvedMailboxObjectIDs](self, "resolvedMailboxObjectIDs"));
  if (objc_msgSend(v33, "count"))
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v33;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (!v4)
      goto LABEL_23;
    v5 = *(_QWORD *)v38;
    while (1)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v38 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxesPendingOldestItemsUpdates](self, "mailboxesPendingOldestItemsUpdates"));
        v9 = objc_msgSend(v8, "containsObject:", v7);

        if (v9)
        {
          v10 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v11 = (objc_class *)objc_opt_class(self);
            v12 = NSStringFromClass(v11);
            v13 = (id)objc_claimAutoreleasedReturnValue(v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_publicDescription"));
            *(_DWORD *)buf = 138412802;
            v42 = v13;
            v43 = 2048;
            v44 = self;
            v45 = 2114;
            v46 = v14;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<%@: %p> Mailbox object id (%{public}@) is already pending oldest item update", buf, 0x20u);

          }
          goto LABEL_21;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController oldestItemsIDsByMailboxObjectID](self, "oldestItemsIDsByMailboxObjectID"));
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v7));

        if (!v10)
          goto LABEL_15;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "indexPathForItemIdentifier:", v10));

        if (!v17)
        {
          v18 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            v26 = (objc_class *)objc_opt_class(self);
            v27 = NSStringFromClass(v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
            *(_DWORD *)buf = 138412546;
            v42 = v28;
            v43 = 2048;
            v44 = self;
            _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "<%@: %p> cannot find the index of a tracked oldest item", buf, 0x16u);

          }
LABEL_15:
          v19 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", -[MessageListViewController numberOfItemsInDataSourceExcludingTips]_0(self), 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v19);
        }
        v20 = objc_msgSend(v35, "row");
        if ((double)(uint64_t)objc_msgSend(v17, "row") * 0.75 < (double)(uint64_t)v20)
        {
          objc_msgSend(v34, "addObject:", v7);
          v21 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = (objc_class *)objc_opt_class(self);
            v23 = NSStringFromClass(v22);
            v24 = (id)objc_claimAutoreleasedReturnValue(v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_publicDescription"));
            *(_DWORD *)buf = 138412802;
            v42 = v24;
            v43 = 2048;
            v44 = self;
            v45 = 2114;
            v46 = v25;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "<%@: %p> Need to load older messages for mailbox %{public}@", buf, 0x20u);

          }
        }

LABEL_21:
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      if (!v4)
      {
LABEL_23:

        if (objc_msgSend(v34, "count"))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxesPendingOldestItemsUpdates](self, "mailboxesPendingOldestItemsUpdates"));
          objc_msgSend(v29, "addObjectsFromArray:", v34);

          v30 = objc_claimAutoreleasedReturnValue(-[MessageListViewController messageRepository](self, "messageRepository"));
          -[NSObject loadOlderMessagesForMailboxes:](v30, "loadOlderMessagesForMailboxes:", v34);
          goto LABEL_27;
        }
        goto LABEL_28;
      }
    }
  }
  v30 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v31 = (objc_class *)objc_opt_class(self);
    v32 = NSStringFromClass(v31);
    objc_claimAutoreleasedReturnValue(v32);
    sub_100393370();
  }
LABEL_27:

LABEL_28:
}

- (BOOL)_isExpandedIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemIdentifierForIndexPath:", v4));
  LOBYTE(self) = -[MessageListViewController _isExpandedItemID:](self, "_isExpandedItemID:", v6);

  return (char)self;
}

- (BOOL)_isExpandedItemID:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  if ((-[MessageListViewController isThreaded](self, "isThreaded") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
    v6 = objc_msgSend(v5, "anyExpandedThreadContainsItemID:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_applySelectionModel:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  MessageListViewController *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138413058;
    v22 = v9;
    v23 = 2048;
    v24 = self;
    v25 = 2114;
    v26 = v11;
    v27 = 2114;
    v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<%@: %p> %{public}@ model: %{public}@", buf, 0x2Au);

  }
  if (v5)
  {
    -[MessageListViewController setMessageListSelectionModel:](self, "setMessageListSelectionModel:", v5);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemIDs", 0));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v12);
          -[MessageListViewController _updateSelectionModelDidSelectItemID:](self, "_updateSelectionModelDidSelectItemID:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15));
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v13);
    }

  }
}

- (void)_updateSelectionModelDidSelectItemID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  NSString *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  MessageListViewController *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;

  v4 = a3;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "selectItemWithItemID:", v4));
    v7 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class(self);
      v9 = NSStringFromClass(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138413314;
      v31 = v10;
      v32 = 2048;
      v33 = self;
      v34 = 2114;
      v35 = v4;
      v36 = 2048;
      v37 = objc_msgSend(v24, "count");
      v38 = 2114;
      v39 = v23;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<%@: %p> Select Item: %{public}@ (Total: %ld). Including: %{public}@", buf, 0x34u);

    }
    if ((objc_msgSend(v24, "isMultipleSelectionActive") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "itemsToDeselectAfterMultipleSelection"));
      objc_msgSend(v11, "removeObject:", v4);

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "itemsToDeselectAfterMultipleSelection"));
      objc_msgSend(v12, "ef_removeObjectsInArray:", v23);
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject indexPathForItemIdentifier:](v5, "indexPathForItemIdentifier:", v4));
      objc_msgSend(v6, "selectItemAtIndexPath:animated:scrollPosition:", v12, 0, 0);
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v15 = v23;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(_QWORD *)v26 != v17)
              objc_enumerationMutation(v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject indexPathForItemIdentifier:](v5, "indexPathForItemIdentifier:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i)));
            objc_msgSend(v6, "selectItemAtIndexPath:animated:scrollPosition:", v19, 0, 0);

          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v16);
      }

    }
    -[MessageListViewController _updateTitle](self, "_updateTitle");
    -[MessageListViewController updateBarButtons](self, "updateBarButtons");
    -[MessageListViewController _updateStackViewController](self, "_updateStackViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "cascadedItemIDsForItemID:isSelecting:", v4, 1));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "arrayByAddingObject:", v4));
    -[MessageListViewController _addMessagesToStackWithItemIDs:](self, "_addMessagesToStackWithItemIDs:", v21);

    -[MessageListViewController isEditing](self, "isEditing");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
    objc_msgSend(v22, "_updateBarButtonsAnimated:force:isShowingTitle:", 1, 1, 0);

  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class(self);
      v14 = NSStringFromClass(v13);
      objc_claimAutoreleasedReturnValue(v14);
      sub_1003933AC();
    }
  }

}

- (void)_updateSelectionModelDidDeselectItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  id v19;
  _BOOL4 v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  MessageListViewController *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deselectItemWithItemID:", v4));
  v8 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class(self);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138413314;
    v37 = v11;
    v38 = 2048;
    v39 = self;
    v40 = 2114;
    v41 = v4;
    v42 = 2048;
    v43 = objc_msgSend(v7, "count");
    v44 = 2114;
    v45 = v30;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%@: %p> Deselect Item: %{public}@ (Total: %ld). Including: %{public}@", buf, 0x34u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
  v13 = objc_msgSend(v12, "isSelectAll");

  if (v13)
  {
    v14 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class(self);
      v16 = NSStringFromClass(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      *(_DWORD *)buf = 138412546;
      v37 = v17;
      v38 = 2048;
      v39 = self;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<%@: %p> Leaving Select All mode. All items have been deselected manually", buf, 0x16u);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemIDs"));
    v19 = objc_msgSend(v18, "count");
    v20 = v19 == -[MessageListViewController numberOfItemsInDataSourceExcludingTips]_0(self);

    if (v20)
      objc_msgSend(v7, "disableSelectAll");
  }
  if ((objc_msgSend(v7, "isMultipleSelectionActive") & 1) != 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemsToDeselectAfterMultipleSelection"));
    objc_msgSend(v21, "addObject:", v4);

    v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemsToDeselectAfterMultipleSelection"));
    objc_msgSend(v22, "addObjectsFromArray:", v30);
  }
  else
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v22 = v30;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v32;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForItemIdentifier:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v25)));
          objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v26, 0);

          v25 = (char *)v25 + 1;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v23);
    }
  }

  -[MessageListViewController _updateTitle](self, "_updateTitle");
  -[MessageListViewController updateBarButtons](self, "updateBarButtons");
  -[MessageListViewController _updateStackViewController](self, "_updateStackViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cascadedItemIDsForItemID:isSelecting:", v4, 0));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "arrayByAddingObject:", v4));
  -[MessageListViewController _removeMessagesFromStackWithItemIDs:](self, "_removeMessagesFromStackWithItemIDs:", v28);

  -[MessageListViewController _exitMultiSelectionForce:](self, "_exitMultiSelectionForce:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
  objc_msgSend(v29, "_updateBarButtonsAnimated:force:", 1, 1);

}

- (void)didSelectTopHitWithItemID:(id)a3 messageList:(id)a4 animated:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v8 = a4;
  BYTE1(v14) = 1;
  LOBYTE(v14) = a5;
  -[MessageListViewController _handleDidSelectItemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:](self, "_handleDidSelectItemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:", v15, v8, 0, 0, 1, 1, v14);
  if (_os_feature_enabled_impl("Mail", "AppStoreReviewPrompt"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appStoreReviewManager"));
    objc_msgSend(v10, "notifyCriterionMet:", 6);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "appStoreReviewManager"));
      objc_msgSend(v13, "attemptToShowPromptIn:reason:", v11, 6);

    }
  }

}

- (void)selectItemID:(id)a3 userInitiated:(BOOL)a4 animated:(BOOL)a5
{
  -[MessageListViewController _handleDidSelectItemID:referenceItem:scrollToVisible:userInitiated:animated:](self, "_handleDidSelectItemID:referenceItem:scrollToVisible:userInitiated:animated:", a3, 0, 0, a4, a5);
}

- (void)_handleDidSelectItemID:(id)a3 referenceItem:(id)a4 scrollToVisible:(BOOL)a5 userInitiated:(BOOL)a6 animated:(BOOL)a7
{
  uint64_t v7;

  LOBYTE(v7) = 1;
  -[MessageListViewController _handleDidSelectItemID:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:](self, "_handleDidSelectItemID:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:", a3, a4, a5, a6, 1, a7, v7);
}

- (void)_handleDidSelectItemID:(id)a3 referenceItem:(id)a4 scrollToVisible:(BOOL)a5 userInitiated:(BOOL)a6 canRestoreDraft:(BOOL)a7 animated:(BOOL)a8 showConversationView:(BOOL)a9
{
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v10 = a7;
  v11 = a6;
  v12 = a5;
  v19 = a3;
  v15 = a4;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "messageListForMessageListItemWithIdentifier:", v19));

  BYTE1(v18) = a9;
  LOBYTE(v18) = a8;
  -[MessageListViewController _handleDidSelectItemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:](self, "_handleDidSelectItemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:", v19, v17, v15, v12, v11, v10, v18);

}

- (void)_handleDidSelectItemID:(id)a3 messageList:(id)a4 referenceItem:(id)a5 scrollToVisible:(BOOL)a6 userInitiated:(BOOL)a7 canRestoreDraft:(BOOL)a8 animated:(BOOL)a9 showConversationView:(BOOL)a10
{
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  NSString *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  BOOL v27;
  NSObject *v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  _BOOL8 v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  objc_class *v42;
  NSString *v43;
  uint64_t v44;
  objc_class *v45;
  NSString *v46;
  void *v47;
  objc_class *v48;
  NSString *v49;
  void *v50;
  objc_class *v51;
  NSString *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  BOOL v56;
  _BOOL4 v57;
  _BOOL4 v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  MessageListViewController *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  _BYTE v70[10];
  __int128 v71;
  _BYTE v72[6];
  _BOOL4 v73;
  __int16 v74;
  _BOOL4 v75;

  v57 = a6;
  v58 = a7;
  v14 = a3;
  v61 = a4;
  v59 = a5;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "indexPathForItemIdentifier:", v14));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "cellForItemAtIndexPath:", v16));
  v56 = a8;

  v18 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (objc_class *)objc_opt_class(self);
    v20 = NSStringFromClass(v19);
    v21 = (id)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "ef_publicDescription"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "ef_publicDescription"));
    *(_DWORD *)buf = 138414338;
    v64 = (uint64_t)v21;
    v65 = 2048;
    v66 = self;
    v67 = 2114;
    v68 = v14;
    v69 = 2114;
    *(_QWORD *)v70 = v22;
    *(_WORD *)&v70[8] = 2114;
    *(_QWORD *)&v71 = v23;
    WORD4(v71) = 1024;
    *(_DWORD *)((char *)&v71 + 10) = v57;
    HIWORD(v71) = 1024;
    *(_DWORD *)v72 = v58;
    *(_WORD *)&v72[4] = 1024;
    v73 = a9;
    v74 = 1024;
    v75 = a10;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "<%@: %p> handleDidSelectItemID: %{public}@, messageList: %{public}@, referenceItem: %{public}@, scrollToVisible: %{BOOL}d, userInitiated: %{BOOL}d, animated: %{BOOL}d, showConversationView: %{BOOL}d", buf, 0x4Cu);

  }
  v24 = objc_opt_class(MessageListCollectionViewCell);
  if ((objc_opt_isKindOfClass(v60, v24) & 1) == 0)
    goto LABEL_10;
  v25 = v60;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "messageListItemFuture"));
  v27 = v26 == 0;

  if (v27)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "cellHelper"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "messageListItem"));
    v34 = v33 == 0;

    if (v34)
    {
      v37 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      {
        v51 = (objc_class *)objc_opt_class(self);
        v52 = NSStringFromClass(v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
        *(_DWORD *)buf = 138413826;
        v64 = (uint64_t)v53;
        v65 = 2048;
        v66 = self;
        v67 = 2114;
        v68 = v14;
        v69 = 1024;
        *(_DWORD *)v70 = v57;
        *(_WORD *)&v70[4] = 1024;
        *(_DWORD *)&v70[6] = v58;
        LOWORD(v71) = 1024;
        *(_DWORD *)((char *)&v71 + 2) = a9;
        WORD3(v71) = 1024;
        DWORD2(v71) = a10;
        _os_log_fault_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_FAULT, "<%@: %p> handleDidSelectItemID: Trying to select a message list cell that has no message list item. %{public}@, scrollToVisible: %{BOOL}d, userInitiated: %{BOOL}d, animated: %{BOOL}d, showConversationView: %{BOOL}d", buf, 0x38u);

      }
      goto LABEL_25;
    }

LABEL_10:
    v35 = -[MessageListViewController _shouldShowItemIDAsConversation:](self, "_shouldShowItemIDAsConversation:", v14);
    if (v14)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "messageListItemForItemID:", v14));
      v62 = 0;
      v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "resultWithTimeout:error:", &v62, 0.2));
      v37 = v62;
      if (v37)
      {
        v38 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v42 = (objc_class *)objc_opt_class(self);
          v43 = NSStringFromClass(v42);
          v44 = objc_claimAutoreleasedReturnValue(v43);
          *(_DWORD *)buf = 138414082;
          v64 = v44;
          v65 = 2048;
          v66 = self;
          v67 = 2114;
          v68 = v14;
          v69 = 2114;
          *(_QWORD *)v70 = v37;
          *(_WORD *)&v70[8] = 1024;
          LODWORD(v71) = v57;
          WORD2(v71) = 1024;
          *(_DWORD *)((char *)&v71 + 6) = v58;
          WORD5(v71) = 1024;
          HIDWORD(v71) = a9;
          *(_WORD *)v72 = 1024;
          *(_DWORD *)&v72[2] = a10;
          v55 = (void *)v44;
          _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "<%@: %p> handleDidSelectItemID: Error loading message with item ID: %{public}@, error: %{public}@, scrollToVisible: %{BOOL}d, userInitiated: %{BOOL}d, animated: %{BOOL}d, showConversationView: %{BOOL}d", buf, 0x42u);

        }
      }
      if (v25)
      {

        BYTE2(v54) = a10;
        BYTE1(v54) = a9;
        LOBYTE(v54) = v56;
        -[MessageListViewController _handleSelectedItem:itemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:indexPath:](self, "_handleSelectedItem:itemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:indexPath:", v25, v14, v61, v59, v57, v58, v54, v16);
        goto LABEL_26;
      }
      v40 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v48 = (objc_class *)objc_opt_class(self);
        v49 = NSStringFromClass(v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
        *(_DWORD *)buf = 138413826;
        v64 = (uint64_t)v50;
        v65 = 2048;
        v66 = self;
        v67 = 2114;
        v68 = v14;
        v69 = 1024;
        *(_DWORD *)v70 = v57;
        *(_WORD *)&v70[4] = 1024;
        *(_DWORD *)&v70[6] = v58;
        LOWORD(v71) = 1024;
        *(_DWORD *)((char *)&v71 + 2) = a9;
        WORD3(v71) = 1024;
        DWORD2(v71) = a10;
        _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "<%@: %p> handleDidSelectItemID: Trying to select a message list cell that has no available item. Clearing conversation view. %{public}@, scrollToVisible: %{BOOL}d, userInitiated: %{BOOL}d, animated: %{BOOL}d, showConversationView: %{BOOL}d", buf, 0x38u);

      }
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
      objc_msgSend(v41, "setReferenceMessageListItem:referenceMessageList:showAsConversation:animated:", 0, v61, v35, a9);

      BYTE1(v54) = v35;
      LOBYTE(v54) = a10;
      -[MessageListViewController _loadMessageWithItemID:messageList:messageListItem:scrollToVisible:userInitiated:animated:showConversationView:showAsConversation:](self, "_loadMessageWithItemID:messageList:messageListItem:scrollToVisible:userInitiated:animated:showConversationView:showAsConversation:", v14, v61, v36, v57, v58, a9, v54);

      v25 = 0;
    }
    else
    {
      v39 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v45 = (objc_class *)objc_opt_class(self);
        v46 = NSStringFromClass(v45);
        v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
        *(_DWORD *)buf = 138413826;
        v64 = (uint64_t)v47;
        v65 = 2048;
        v66 = self;
        v67 = 2114;
        v68 = 0;
        v69 = 1024;
        *(_DWORD *)v70 = v57;
        *(_WORD *)&v70[4] = 1024;
        *(_DWORD *)&v70[6] = v58;
        LOWORD(v71) = 1024;
        *(_DWORD *)((char *)&v71 + 2) = a9;
        WORD3(v71) = 1024;
        DWORD2(v71) = a10;
        _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "<%@: %p> handleDidSelectItemID: Selected a message list cell with no item ID: %{public}@, scrollToVisible: %{BOOL}d, userInitiated: %{BOOL}d, animated: %{BOOL}d, showConversationView: %{BOOL}d", buf, 0x38u);

      }
      v37 = objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
      v25 = 0;
      -[NSObject setReferenceMessageListItem:referenceMessageList:showAsConversation:animated:](v37, "setReferenceMessageListItem:referenceMessageList:showAsConversation:animated:", 0, v61, v35, a9);
    }
LABEL_25:

    goto LABEL_26;
  }
  v28 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = (objc_class *)objc_opt_class(self);
    v30 = NSStringFromClass(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    *(_DWORD *)buf = 138413826;
    v64 = (uint64_t)v31;
    v65 = 2048;
    v66 = self;
    v67 = 2114;
    v68 = v14;
    v69 = 1024;
    *(_DWORD *)v70 = v57;
    *(_WORD *)&v70[4] = 1024;
    *(_DWORD *)&v70[6] = v58;
    LOWORD(v71) = 1024;
    *(_DWORD *)((char *)&v71 + 2) = a9;
    WORD3(v71) = 1024;
    DWORD2(v71) = a10;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "<%@: %p> handleDidSelectItemID: Message hasn't finished loading, updating selection promise %{public}@, scrollToVisible: %{BOOL}d, userInitiated: %{BOOL}d, animated: %{BOOL}d, showConversationView: %{BOOL}d", buf, 0x38u);

  }
  BYTE2(v54) = a10;
  BYTE1(v54) = a9;
  LOBYTE(v54) = v56;
  -[MessageListViewController _updateSelectionPromiseForItemID:messageList:messageListCell:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:indexPath:](self, "_updateSelectionPromiseForItemID:messageList:messageListCell:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:indexPath:", v14, v61, v25, v59, v57, v58, v54, v16);
LABEL_26:

}

- (void)_handleSelectedItem:(id)a3 itemID:(id)a4 messageList:(id)a5 referenceItem:(id)a6 scrollToVisible:(BOOL)a7 userInitiated:(BOOL)a8 canRestoreDraft:(BOOL)a9 animated:(BOOL)a10 showConversationView:(BOOL)a11 indexPath:(id)a12
{
  _BOOL8 v12;
  _BOOL8 v13;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v12 = a8;
  v13 = a7;
  v26 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a12;
  -[MessageListViewController setLoadingMessageItemID:](self, "setLoadingMessageItemID:", 0);
  if (!v12)
    -[MessageListViewController setShouldSelectInitialMessage:](self, "setShouldSelectInitialMessage:", 0);
  BYTE2(v25) = a11;
  LOWORD(v25) = __PAIR16__(a10, a9);
  -[MessageListViewController _showConversationViewWithMessageListItem:itemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:indexPath:](self, "_showConversationViewWithMessageListItem:itemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:indexPath:", v26, v18, v19, v20, v13, v12, v25, v21);
  if ((-[MessageListViewController isEditing](self, "isEditing") & 1) == 0)
  {
    v22 = objc_msgSend(v21, "item");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController previouslySelectedIndexPath](self, "previouslySelectedIndexPath"));
    if ((uint64_t)v22 < (uint64_t)objc_msgSend(v23, "item"))
      v24 = 0xFFFFFFFFLL;
    else
      v24 = 1;
    -[MessageListViewController setUserBrowseDirection:](self, "setUserBrowseDirection:", v24);

    -[MessageListViewController setPreviouslySelectedIndexPath:](self, "setPreviouslySelectedIndexPath:", v21);
  }
  if (v12)
    -[MessageListViewController _hideMailboxPickerOrMessageListAfterSelectionIfNeeded](self, "_hideMailboxPickerOrMessageListAfterSelectionIfNeeded");

}

- (void)_showConversationViewWithMessageListItem:(id)a3 itemID:(id)a4 messageList:(id)a5 referenceItem:(id)a6 scrollToVisible:(BOOL)a7 userInitiated:(BOOL)a8 canRestoreDraft:(BOOL)a9 animated:(BOOL)a10 showConversationView:(BOOL)a11 indexPath:(id)a12
{
  _BOOL4 v12;
  id v17;
  id v18;
  id v19;
  unsigned int v20;
  void *v21;
  id v22;
  void *v23;
  unsigned int v24;
  _BOOL8 v25;
  NSObject *v26;
  objc_class *v27;
  NSString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  MessageListViewController *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  _BOOL4 v49;
  __int16 v50;
  _BOOL4 v51;
  __int16 v52;
  _BOOL4 v53;
  __int16 v54;
  _BOOL4 v55;
  __int16 v56;
  unsigned int v57;
  __int16 v58;
  unsigned int v59;
  __int16 v60;
  _BOOL4 v61;
  __int16 v62;
  void *v63;

  v12 = a8;
  v37 = a7;
  v17 = a3;
  v18 = a4;
  v41 = a5;
  v19 = a6;
  v39 = v17;
  v40 = a12;
  v20 = 0;
  if (v18 && v17 && a9 && v12)
    v20 = -[MessageListViewController _restoreDraftOrOutboxItemAtIndexPath:](self, "_restoreDraftOrOutboxItemAtIndexPath:", v40);
  if (_os_feature_enabled_impl("Mail", "CatchUpHighlights"))
  {
    if (EMIsGreymatterSupportedWithOverride())
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController highlightedMessagesController](self, "highlightedMessagesController"));
      v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "messageList"));

      if (v22 != v41)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController highlightedMessagesViewController](self, "highlightedMessagesViewController"));
        +[MUIHighlightedMessagesViewControllerFactory resetSelectionForViewController:](MUIHighlightedMessagesViewControllerFactory, "resetSelectionForViewController:", v23);

      }
    }
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v24 = objc_msgSend(v38, "isInExpandedEnvironment");
  v25 = -[MessageListViewController _shouldShowItemIDAsConversation:](self, "_shouldShowItemIDAsConversation:", v18);
  v26 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v36 = v19;
    v27 = (objc_class *)objc_opt_class(self);
    v28 = NSStringFromClass(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "ef_publicDescription"));
    *(_DWORD *)buf = 138414850;
    v43 = v29;
    v44 = 2048;
    v45 = self;
    v46 = 2114;
    v47 = v18;
    v48 = 1024;
    v49 = v37;
    v50 = 1024;
    v51 = v12;
    v52 = 1024;
    v53 = a10;
    v54 = 1024;
    v55 = v25;
    v56 = 1024;
    v57 = v24;
    v58 = 1024;
    v59 = v20;
    v60 = 1024;
    v61 = a11;
    v62 = 2114;
    v63 = v30;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "<%@: %p> handleSelectedItem: %{public}@, scrollToVisible: %{BOOL}d, userInitiated: %{BOOL}d, animated: %{BOOL}d, showAsConversation: %{BOOL}d, isInExpandedEnvironment: %{BOOL}d, restoreDraft: %{BOOL}d, showConversationView: %{BOOL}d referenceItem:%{public}@", buf, 0x54u);

    v19 = v36;
  }

  if (((v19 == 0) & ~(v18 != 0)) != 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
    objc_msgSend(v31, "setReferenceMessageListItem:referenceMessageList:showAsConversation:animated:", 0, v41, v25, a10);
LABEL_20:

    goto LABEL_21;
  }
  if ((v20 ^ 1 | v24) == 1)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchController](self, "searchController"));
    objc_msgSend(v31, "setMessagesShowSourceMailbox:", objc_msgSend(v32, "isActive"));

    v33 = v39;
    if (v19)
      v33 = v19;
    v34 = v33;
    objc_msgSend(v31, "setReferenceMessageListItem:referenceMessageList:showAsConversation:animated:", v34, v41, v25, a10);
    if (((!a11 | v24) & 1) == 0)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "splitViewController"));
      objc_msgSend(v35, "showConversationViewControllerAnimated:completion:", a10, 0);

    }
    -[MessageListViewController selectRowOfItemID:scrollToVisible:animated:](self, "selectRowOfItemID:scrollToVisible:animated:", v18, v37, a10, v36);

    goto LABEL_20;
  }
LABEL_21:

}

- (void)_updateSelectionPromiseForItemID:(id)a3 messageList:(id)a4 messageListCell:(id)a5 referenceItem:(id)a6 scrollToVisible:(BOOL)a7 userInitiated:(BOOL)a8 canRestoreDraft:(BOOL)a9 animated:(BOOL)a10 showConversationView:(BOOL)a11 indexPath:(id)a12
{
  id v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  BOOL v45;
  BOOL v46;
  BOOL v47;
  BOOL v48;
  BOOL v49;
  _BYTE buf[12];
  __int16 v51;
  MessageListViewController *v52;

  v33 = a3;
  v34 = a4;
  v18 = a5;
  v35 = a6;
  v36 = a12;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController selectionPromise](self, "selectionPromise"));

  if (v19)
  {
    v20 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class(self);
      v22 = NSStringFromClass(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v23;
      v51 = 2048;
      v52 = self;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "<%@: %p> New item selected, cancelling existing selection promise.", buf, 0x16u);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController selectionPromise](self, "selectionPromise"));
    objc_msgSend(v24, "cancel");

  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "future"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100127AC8;
  v38[3] = &unk_10051FA98;
  objc_copyWeak(&v44, (id *)buf);
  v27 = v37;
  v39 = v27;
  v31 = v33;
  v40 = v31;
  v32 = v34;
  v41 = v32;
  v28 = v35;
  v42 = v28;
  v45 = a7;
  v46 = a8;
  v47 = a9;
  v48 = a10;
  v49 = a11;
  v29 = v36;
  v43 = v29;
  objc_msgSend(v25, "onScheduler:addSuccessBlock:", v26, v38);

  -[MessageListViewController setSelectionPromise:](self, "setSelectionPromise:", v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "messageListItemFuture"));
  objc_msgSend(v27, "finishWithFuture:", v30);

  objc_destroyWeak(&v44);
  objc_destroyWeak((id *)buf);

}

- (void)_loadMessageWithItemID:(id)a3 messageList:(id)a4 messageListItem:(id)a5 scrollToVisible:(BOOL)a6 userInitiated:(BOOL)a7 animated:(BOOL)a8 showConversationView:(BOOL)a9 showAsConversation:(BOOL)a10
{
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28[2];
  BOOL v29;
  BOOL v30;
  BOOL v31;
  BOOL v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36[2];
  BOOL v37;
  BOOL v38;
  BOOL v39;
  BOOL v40;
  BOOL v41;
  id location[2];

  v16 = a3;
  v24 = a4;
  v25 = a5;
  v17 = MFMessageSelectionLifecycleSignpostLog(-[MessageListViewController setLoadingMessageItemID:](self, "setLoadingMessageItemID:", v16));
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)os_signpost_id_make_with_pointer(v18, v16);

  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100127E20;
  v33[3] = &unk_10051FAC0;
  objc_copyWeak(v36, location);
  v21 = v16;
  v34 = v21;
  v37 = a6;
  v38 = a7;
  v39 = a8;
  v40 = a9;
  v22 = v24;
  v41 = a10;
  v35 = v22;
  v36[1] = v19;
  objc_msgSend(v25, "onScheduler:addSuccessBlock:", v20, v33);

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100128144;
  v26[3] = &unk_10051FAE8;
  objc_copyWeak(v28, location);
  v23 = v21;
  v29 = a6;
  v30 = a7;
  v31 = a8;
  v32 = a9;
  v27 = v23;
  v28[1] = v19;
  objc_msgSend(v25, "addFailureBlock:", v26);

  objc_destroyWeak(v28);
  objc_destroyWeak(v36);
  objc_destroyWeak(location);

}

- (void)_hideMailboxPickerOrMessageListAfterSelectionIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  if ((objc_msgSend(v3, "isInExpandedEnvironment") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "splitViewController"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100128438;
    v6[3] = &unk_10051CF70;
    v8 = objc_msgSend(v4, "displayMode");
    v6[4] = self;
    v5 = v4;
    v7 = v5;
    +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v6, 0.25);

  }
}

- (void)deselectAllItemsInCollectionView:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if ((-[MessageListViewController isEditing](self, "isEditing") & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController transitionCoordinator](self, "transitionCoordinator"));
    objc_msgSend(v7, "mf_interactiveDeselectAllSelectedIndexPathsUsingTransitionCoordinator:animated:", v6, v4);

  }
}

- (BOOL)_allowsAutoSelectionOfInitialMessage
{
  if (-[MessageListViewController isSearchViewController](self, "isSearchViewController"))
    return 0;
  else
    return !-[MessageListViewController disableAutoSelectionOfInitialMessage](self, "disableAutoSelectionOfInitialMessage");
}

- (void)_selectInitialMessageNow
{
  -[MessageListViewController setShouldSelectInitialMessage:](self, "setShouldSelectInitialMessage:", -[MessageListViewController _allowsAutoSelectionOfInitialMessage](self, "_allowsAutoSelectionOfInitialMessage"));
  -[MessageListViewController _selectAndDisplayInitialMessageIfNecessary](self, "_selectAndDisplayInitialMessageIfNecessary");
}

- (BOOL)_selectAndDisplayInitialMessageIfNecessary
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  int v12;
  BOOL v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  NSString *v20;
  id v21;
  NSString *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  objc_class *v27;
  NSString *v28;
  void *v29;
  int v30;
  id v31;
  __int16 v32;
  MessageListViewController *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;

  if (!-[MessageListViewController shouldSelectInitialMessage](self, "shouldSelectInitialMessage")
    || !-[MessageListViewController numberOfItemsInDataSourceExcludingTips]_0(self))
  {
    return 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController lastSelectedItemID](self, "lastSelectedItemID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageListForSection:", MessageListSectionRecent));

  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageListItemForItemID:", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "result"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flags"));
    v10 = objc_msgSend(v9, "deleted");

    if (!v10)
    {

      goto LABEL_10;
    }

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForReadMessages](EMMessageListItemPredicates, "predicateForReadMessages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIDOfFirstMessageListItemMatchingPredicate:", v11));

  if (!v4)
  {
    v12 = 1;
    goto LABEL_11;
  }
LABEL_10:
  -[MessageListViewController setShouldSelectInitialMessage:](self, "setShouldSelectInitialMessage:", 0);
  v12 = 0;
  -[MessageListViewController setDisableAutoSelectionOfInitialMessage:](self, "setDisableAutoSelectionOfInitialMessage:", 0);
LABEL_11:
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController lastAutoSelectedItemID](self, "lastAutoSelectedItemID"));
  v15 = objc_msgSend(v4, "isEqual:", v14);

  if (((v12 | v15 ^ 1) & 1) != 0
    || (v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController")),
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "referenceMessageListItem")),
        v17,
        v16,
        v17))
  {
    -[MessageListViewController setLastAutoSelectedItemID:](self, "setLastAutoSelectedItemID:", v4);
    if (v4)
    {
      v18 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (objc_class *)objc_opt_class(self);
        v20 = NSStringFromClass(v19);
        v21 = (id)objc_claimAutoreleasedReturnValue(v20);
        v22 = NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController lastAutoSelectedItemID](self, "lastAutoSelectedItemID"));
        v30 = 138413314;
        v31 = v21;
        v32 = 2048;
        v33 = self;
        v34 = 2112;
        v35 = v23;
        v36 = 2112;
        v37 = v4;
        v38 = 2112;
        v39 = v24;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "<%@: %p> %@ - Select initial itemID:%@, lastAutoSelectedItemID:%@", (uint8_t *)&v30, 0x34u);

      }
      v13 = 1;
      -[MessageListViewController _handleDidSelectItemID:referenceItem:scrollToVisible:userInitiated:animated:](self, "_handleDidSelectItemID:referenceItem:scrollToVisible:userInitiated:animated:", v4, 0, 1, 0, 0);
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v25 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v27 = (objc_class *)objc_opt_class(self);
      v28 = NSStringFromClass(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v30 = 138412802;
      v31 = v29;
      v32 = 2048;
      v33 = self;
      v34 = 2112;
      v35 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "<%@: %p> Autoselection cancelled for message %@", (uint8_t *)&v30, 0x20u);

    }
    v13 = 0;
    v4 = 0;
  }

  return v13;
}

- (void)setLastSelectedItemID:(id)a3
{
  EMCollectionItemID **p_lastSelectedItemID;
  id v5;

  p_lastSelectedItemID = &self->_lastSelectedItemID;
  v5 = a3;
  if ((-[EMCollectionItemID isEqual:](*p_lastSelectedItemID, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)p_lastSelectedItemID, a3);

}

- (BOOL)_shouldShowItemIDAsConversation:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;

  v4 = a3;
  if (-[MessageListViewController isThreaded](self, "isThreaded"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
    v6 = objc_msgSend(v5, "anyExpandedThreadContainsItemID:", v4) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)_draftOrOutboxMessageAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  id v15;
  NSObject *v16;
  objc_class *v18;
  NSString *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  MessageListViewController *v24;
  __int16 v25;
  id v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
  if ((objc_msgSend(v5, "containsDraftsOrOutbox") & 1) != 0)
  {

  }
  else
  {
    v6 = -[MessageListViewController isSearchViewController](self, "isSearchViewController");

    if ((v6 & 1) == 0)
    {
      v15 = 0;
      goto LABEL_14;
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "messageListItemAtIndexPath:", v4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resultWithTimeout:error:", 0, 0.2));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayMessage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resultWithTimeout:error:", 0, 0.2));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mailboxes"));
    v13 = objc_msgSend(v12, "ef_any:", &stru_10051FB08);

    if (v13)
      v14 = v11;
    else
      v14 = 0;
    v15 = v14;
  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = (objc_class *)objc_opt_class(self);
      v19 = NSStringFromClass(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = 138412802;
      v22 = v20;
      v23 = 2048;
      v24 = self;
      v25 = 2114;
      v26 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "<%@: %p> Unable to restore message at index path: %{public}@", (uint8_t *)&v21, 0x20u);

    }
    v15 = 0;
  }

LABEL_14:
  return v15;
}

- (void)_restoreDraftOrOutboxItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mailboxProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mailboxObjectIDs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "legacyMailboxForObjectID:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MFComposeMailMessage legacyMessageWithMessage:mailboxUid:](MFComposeMailMessage, "legacyMessageWithMessage:mailboxUid:", v4, v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
  LODWORD(v6) = objc_msgSend(v11, "containsDraftsMailbox");

  if ((_DWORD)v6)
    v12 = objc_msgSend(objc_alloc((Class)_MFMailCompositionContext), "initDraftRestoreOfMessage:legacyMessage:", v4, v10);
  else
    v12 = objc_msgSend(objc_alloc((Class)_MFMailCompositionContext), "initOutboxRestoreOfMessage:legacyMessage:", v4, v10);
  v13 = v12;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100129148;
  v15[3] = &unk_10051B1B8;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v14, "showComposeWithContext:animated:initialTitle:presentationSource:completionBlock:", v13, 1, 0, 0, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (BOOL)_restoreDraftOrOutboxItemAtIndexPath:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _draftOrOutboxMessageAtIndexPath:](self, "_draftOrOutboxMessageAtIndexPath:", a3));
  if (v4)
    -[MessageListViewController _restoreDraftOrOutboxItem:](self, "_restoreDraftOrOutboxItem:", v4);

  return v4 != 0;
}

- (id)messageDragDropHelper:(id)a3 itemContextForIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageListAtSectionIndex:", objc_msgSend(v5, "section")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageListItemAtIndexPath:", v5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "result"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MessageListItemDragContext withItem:messageList:](MessageListItemDragContext, "withItem:messageList:", v9, v7));
  return v10;
}

- (id)dropMailboxesForMessageListDragDropHelper:(id)a3
{
  void *v4;

  if (-[MessageListViewController isSearchViewController](self, "isSearchViewController", a3))
    v4 = 0;
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
  return v4;
}

- (id)undoManagerForMessageListDragDropHelper:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController undoManager](self, "undoManager", a3));
}

- (void)willBeginDragForMessageListDragDropHelper:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "splitViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController parentViewController](self, "parentViewController"));
  objc_msgSend(v5, "setFocusedViewController:", v6);

  -[MessageListViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  -[MessageListViewController _cancelOrCleanupStateRestoration](self, "_cancelOrCleanupStateRestoration");
}

- (double)dragItemCornerRadius:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController layoutValuesHelper](self, "layoutValuesHelper", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "defaultLayoutValues"));
  objc_msgSend(v4, "backgroundCornerRadius");
  v6 = v5;

  return v6;
}

- (void)beginSearchWithQueryString:(id)a3 scope:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[MessageListViewController focusSearchBarAnimated:](self, "focusSearchBarAnimated:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSearchViewController](self, "messageListSearchViewController"));
  objc_msgSend(v7, "beginSearchWithQueryString:scope:", v8, v6);

}

- (void)beginSearchWithSuggestion:(id)a3 scope:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[MessageListViewController focusSearchBarAnimated:](self, "focusSearchBarAnimated:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSearchViewController](self, "messageListSearchViewController"));
  objc_msgSend(v7, "beginSearchWithSuggestion:scope:", v8, v6);

}

- (id)inputLanguages
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init((Class)NSMutableOrderedSet);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchBar](self, "searchBar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textInputMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primaryLanguage"));

  if (v6)
    goto LABEL_4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

  if (v6
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "preferredLocalizations")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject")),
        v9,
        v8,
        v6))
  {
LABEL_4:
    objc_msgSend(v3, "addObject:", v6);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UITextInputMode activeInputModes](UITextInputMode, "activeInputModes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ef_map:", &stru_10051FB48));
  objc_msgSend(v3, "addObjectsFromArray:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "array"));
  return v12;
}

- (void)presentSearchController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "willPresentSearchController:") & 1) != 0)
    objc_msgSend(v5, "willPresentSearchController:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController delegate](self, "delegate"));
  objc_msgSend(v6, "messageListViewControllerRequiresPaletteUpdate:enableSearchPreparing:", self, 1);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100129A44;
  v17[3] = &unk_10051A960;
  v17[4] = self;
  v7 = v5;
  v18 = v7;
  v8 = v4;
  v19 = v8;
  -[MessageListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, v17);
  if (objc_msgSend(v8, "modalPresentationStyle") == (id)7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "popoverPresentationController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchBar"));
    objc_msgSend(v9, "setSourceView:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchBar"));
    objc_msgSend(v11, "bounds");
    objc_msgSend(v9, "setSourceRect:");

    objc_msgSend(v9, "setPermittedArrowDirections:", 15);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchBar"));
    v20 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    objc_msgSend(v9, "setPassthroughViews:", v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "splitViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController parentViewController](self, "parentViewController"));
  objc_msgSend(v15, "setFocusedViewController:", v16);

}

- (void)willPresentSearchController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[MessageListViewController _inMultiSelectionMode](self, "_inMultiSelectionMode"))
    sub_100129BD4(self, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSearchViewController](self, "messageListSearchViewController"));
  objc_msgSend(v5, "setMailboxes:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSearchViewController](self, "messageListSearchViewController"));
  objc_msgSend(v6, "willPresentSearchController:", v11);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "referenceMessageListItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemID"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSearchViewController](self, "messageListSearchViewController"));
    objc_msgSend(v10, "setLastSelectedItemID:", v9);

  }
}

- (void)willDismissSearchController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
  objc_msgSend(v5, "setDelegate:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSearchViewController](self, "messageListSearchViewController"));
  objc_msgSend(v6, "willDismissSearchController:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController delegate](self, "delegate"));
  objc_msgSend(v7, "messageListViewControllerRequiresPaletteUpdate:enableSearchPreparing:", self, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchBar](self, "searchBar"));
  objc_msgSend(v8, "setRepresentedObjects:", 0);

  if ((-[UIRefreshControl isHidden](self->_refreshControl, "isHidden") & 1) == 0
    && !-[UIRefreshControl isRefreshing](self->_refreshControl, "isRefreshing"))
  {
    -[UIRefreshControl beginRefreshing](self->_refreshControl, "beginRefreshing");
    -[UIRefreshControl endRefreshing](self->_refreshControl, "endRefreshing");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
    objc_msgSend(v9, "setContentOffset:", CGPointZero.x, CGPointZero.y);

    v10 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class(self);
      v12 = NSStringFromClass(v11);
      objc_claimAutoreleasedReturnValue(v12);
      sub_1003933E8();
    }

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "referenceMessageListItem"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v14, "itemID"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController lastSelectedItemID](self, "lastSelectedItemID"));
  LOBYTE(v14) = objc_msgSend(v15, "isEqual:", v16);

  if ((v14 & 1) == 0)
  {
    -[MessageListViewController deselectSelectedItemsInCollectionView](self, "deselectSelectedItemsInCollectionView");
    -[MessageListViewController _updateSelectionModelDidSelectItemID:](self, "_updateSelectionModelDidSelectItemID:", v15);
  }
  -[MessageListViewController changeTipShouldDisplayTo:](self, "changeTipShouldDisplayTo:", 1);

}

- (void)didDismissSearchController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  objc_msgSend(v4, "removeMessageListSection:animated:", MessageListSectionIndexedSearch, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSearchViewController](self, "messageListSearchViewController"));
  objc_msgSend(v5, "didDismissSearchController:", v6);

  -[MessageListViewController updateBarButtons](self, "updateBarButtons");
}

- (void)_dismissSearchResults
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchController](self, "searchController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchBar"));
  objc_msgSend(v2, "setRepresentedObjects:", 0);
  objc_msgSend(v3, "setActive:", 0);
  objc_msgSend(v2, "resignFirstResponder");

}

- (void)dismissSearchResultsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;

  v3 = a3;
  v5 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v3);
  -[MessageListViewController _dismissSearchResults](self, "_dismissSearchResults");
  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v5);
}

- (void)focusSearchBarAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double x;
  double y;
  double width;
  double height;
  _BOOL4 v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id location;
  CGRect v28;
  CGRect v29;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchBar](self, "searchBar"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
    objc_msgSend(v5, "bounds");
    objc_msgSend(v6, "convertRect:fromView:", v5);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v6, "mui_safeVisibleBounds");
    x = v28.origin.x;
    y = v28.origin.y;
    width = v28.size.width;
    height = v28.size.height;
    v29.origin.x = v8;
    v29.origin.y = v10;
    v29.size.width = v12;
    v29.size.height = v14;
    v19 = CGRectContainsRect(v28, v29);
    v20 = 0.3;
    if (v19)
      v20 = 0.0;
    if (v3)
      v21 = v20;
    else
      v21 = 0.0;
    if (!v19)
      objc_msgSend(v6, "scrollRectToVisible:animated:", v3, x, y, width, height);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v23 = v21 * UIAnimationDragCoefficient();
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10012A3EC;
    v25[3] = &unk_10051B1B8;
    objc_copyWeak(&v26, &location);
    v24 = objc_msgSend(v22, "afterDelay:performBlock:", v25, v23);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

  }
}

- (void)suspendRefreshAnimationIfNecessary
{
  void *v2;
  uint64_t v3;
  id v4;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_copyWeak(&v4, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_10012A524, &unk_10051B1B8));
  objc_msgSend(v2, "performBlock:", &v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (UIBarButtonItem)filterPickerButtonItem
{
  UIBarButtonItem *filterPickerButtonItem;
  id v4;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *v7;

  filterPickerButtonItem = self->_filterPickerButtonItem;
  if (!filterPickerButtonItem)
  {
    v4 = objc_alloc((Class)UIBarButtonItem);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController filterPickerControl](self, "filterPickerControl"));
    v6 = (UIBarButtonItem *)objc_msgSend(v4, "initWithCustomView:", v5);
    v7 = self->_filterPickerButtonItem;
    self->_filterPickerButtonItem = v6;

    -[UIBarButtonItem _setFlexible:](self->_filterPickerButtonItem, "_setFlexible:", 1);
    -[MessageListViewController _updateFiltersPickerAccessibilityHUD](self, "_updateFiltersPickerAccessibilityHUD");
    filterPickerButtonItem = self->_filterPickerButtonItem;
  }
  return filterPickerButtonItem;
}

- (void)_updateFiltersPickerAccessibilityHUD
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FILTERS_CHOOSE"), &stru_100531B00, CFSTR("Main")));
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController filterPickerControl](self, "filterPickerControl"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filterDescription"));

  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v7, "appendString:", CFSTR("\n"));
    objc_msgSend(v7, "appendString:", v6);
  }
  if (objc_msgSend(v7, "length"))
    -[UIBarButtonItem setTitle:](self->_filterPickerButtonItem, "setTitle:", v7);

}

- (void)updateNoContentViewAnimated:(BOOL)a3
{
  -[MessageListViewController _updateNoContentViewAnimated:suppressNoContentView:](self, "_updateNoContentViewAnimated:suppressNoContentView:", a3, 0);
}

- (void)supressNoContentViewAnimated:(BOOL)a3
{
  -[MessageListViewController _updateNoContentViewAnimated:suppressNoContentView:](self, "_updateNoContentViewAnimated:suppressNoContentView:", a3, 1);
}

- (void)_filterCommand:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[MessageListViewController isEditing](self, "isEditing") & 1) == 0)
    -[MessageListViewController filterButtonPressed:](self, "filterButtonPressed:", v4);

}

- (BOOL)isFilterButtonEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController filterButtonItem](self, "filterButtonItem"));
  v3 = objc_msgSend(v2, "isFilterEnabled");

  return v3;
}

- (void)setFilterButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController filterButtonItem](self, "filterButtonItem"));
  objc_msgSend(v4, "setFilterEnabled:", v3);

}

- (void)setFiltersEnabled:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MessageListViewController;
  -[MessageListViewController setFiltersEnabled:](&v5, "setFiltersEnabled:", a3);
  -[MessageListViewController updateBarButtons](self, "updateBarButtons");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MailTipsHelper shared](_TtC10MobileMail14MailTipsHelper, "shared"));
  objc_msgSend(v4, "filterByUnreadUsed");

}

- (void)filterPickerButtonPressed
{
  MFMailboxFilterPickerViewModel *v3;
  void *v4;
  MFMailboxFilterPickerViewController *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  MFMailboxFilterPickerViewModel *v10;

  v3 = [MFMailboxFilterPickerViewModel alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController filterViewModel](self, "filterViewModel"));
  v10 = -[MFMailboxFilterPickerViewModel initWithFilterViewModel:delegate:](v3, "initWithFilterViewModel:delegate:", v4, self);

  v5 = -[MFMailboxFilterPickerViewController initWithViewModel:delegate:]([MFMailboxFilterPickerViewController alloc], "initWithViewModel:delegate:", v10, self);
  v6 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v5);
  objc_msgSend(v6, "setModalPresentationStyle:", 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "popoverPresentationController"));
  objc_msgSend(v7, "setDelegate:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController filterPickerButtonItem](self, "filterPickerButtonItem"));
  objc_msgSend(v7, "setBarButtonItem:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "popoverPresentationController"));
  objc_msgSend(v9, "setDelegate:", self);

  -[MessageListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

- (void)applyFilterPredicate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MessageListViewController;
  -[MessageListViewController applyFilterPredicate:](&v8, "applyFilterPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
  v6 = sub_100121094(self, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_100011278(self, v5, v7);

}

- (void)updateFilterControlWithFilterViewModel:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController filterPickerControl](self, "filterPickerControl"));
  v5 = objc_msgSend(v7, "isFilterEnabled");
  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedFiltersDescription"));
  else
    v6 = 0;
  objc_msgSend(v4, "setFilterDescription:", v6);
  if (v5)

}

- (id)createMailboxFilterController
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = objc_alloc((Class)MUIMailboxFilterController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController currentFocus](self, "currentFocus"));
  v7 = MFMailDirectory(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_opt_class(MFMailboxFilter);
  v10 = objc_msgSend(v3, "initWithMailboxes:focus:baseStoragePath:defaultsRepresentationProvider:filterRepresentationProvider:mailboxFilterClass:filterProviderClass:", v4, v5, v8, &stru_10051FCD0, &stru_10051FD50, v9, objc_opt_class(MFMailboxFilterProvider));

  return v10;
}

- (void)_testing_enableMessageListFilter
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  MessageListViewController *v13;
  __int16 v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController filterButtonItem](self, "filterButtonItem"));
  -[MessageListViewController filterButtonPressed:](self, "filterButtonPressed:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListItems](self, "messageListItems"));
  v5 = objc_msgSend(v4, "count");

  v6 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = 138412802;
    v11 = v9;
    v12 = 2048;
    v13 = self;
    v14 = 2048;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<%@: %p> Enabling mailbox filter: preChangeCount=%lu", (uint8_t *)&v10, 0x20u);

  }
}

- (void)_testing_disableMessageListFilter
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  MessageListViewController *v13;
  __int16 v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController filterButtonItem](self, "filterButtonItem"));
  -[MessageListViewController filterButtonPressed:](self, "filterButtonPressed:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListItems](self, "messageListItems"));
  v5 = objc_msgSend(v4, "count");

  v6 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = 138412802;
    v11 = v9;
    v12 = 2048;
    v13 = self;
    v14 = 2048;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<%@: %p> Disable mailbox filter: preChangeCount=%lu", (uint8_t *)&v10, 0x20u);

  }
}

- (UIBarButtonItem)shelfButtonItem
{
  UIBarButtonItem *shelfButtonItem;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *v6;

  shelfButtonItem = self->_shelfButtonItem;
  if (!shelfButtonItem)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphShelf));
    v5 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithImage:style:target:action:", v4, 0, self, "_shelfButtonTapped:");
    v6 = self->_shelfButtonItem;
    self->_shelfButtonItem = v5;

    shelfButtonItem = self->_shelfButtonItem;
  }
  return shelfButtonItem;
}

- (void)_shelfButtonTapped:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_sceneIdentifier"));
  +[MFBayAdoption requestShelfPresentationForSceneWithIdentifier:](MFBayAdoption, "requestShelfPresentationForSceneWithIdentifier:", v3);

}

- (void)deselectSelectedItemsInCollectionView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MessageListViewController;
  -[MessageListViewController deselectSelectedItemsInCollectionView](&v3, "deselectSelectedItemsInCollectionView");
  -[MessageListViewController _exitMultiSelectionForce:](self, "_exitMultiSelectionForce:", 1);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  -[MessageListViewController _setEditing:animated:preserveSelection:](self, "_setEditing:animated:preserveSelection:", a3, a4, 0);
}

- (void)_setEditing:(BOOL)a3 animated:(BOOL)a4 preserveSelection:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  unsigned int v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  void *v17;
  unsigned int v18;
  NSObject *v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  id v23;
  _QWORD *v24;
  id v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  BOOL v35;
  BOOL v36;
  char v37;
  char v38;
  objc_super v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  MessageListViewController *v43;
  __int16 v44;
  _BOOL4 v45;
  __int16 v46;
  unsigned int v47;
  __int16 v48;
  unsigned int v49;
  __int16 v50;
  void *v51;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v9 = -[MessageListViewController isEditing](self, "isEditing");
  if (v9 != v7)
  {
    v10 = v9;
    v39.receiver = self;
    v39.super_class = (Class)MessageListViewController;
    -[MessageListViewController setEditing:animated:](&v39, "setEditing:animated:", v7, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
    objc_msgSend(v11, "setIsEditing:", v7);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxPickerDelegate](self, "mailboxPickerDelegate"));
    objc_msgSend(v12, "messageListViewController:setEditing:animated:", self, v7, v6);

    v13 = objc_claimAutoreleasedReturnValue(-[MessageListViewController previousMessageListSelectionModel](self, "previousMessageListSelectionModel"));
    v14 = -[MessageListViewController _inMultiSelectionMode](self, "_inMultiSelectionMode");
    v15 = v14;
    v16 = !v7;
    if (v13)
      v16 = 1;
    if (v16)
      v17 = (void *)v13;
    else
      v17 = 0;
    if ((v16 & 1) == 0 && ((v14 ^ 1) & 1) == 0)
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
    if ((v15 & 1) != 0)
      v18 = 1;
    else
      v18 = objc_msgSend(v17, "shouldRestoreSelection");
    v19 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (objc_class *)objc_opt_class(self);
      v21 = NSStringFromClass(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 138544642;
      v41 = v22;
      v42 = 2048;
      v43 = self;
      v44 = 1024;
      v45 = v7;
      v46 = 1024;
      v47 = v15;
      v48 = 1024;
      v49 = v18;
      v50 = 2114;
      v51 = v17;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> setEditing: %{BOOL}d, inMultiSelection: %{BOOL}d, shouldRestoreSelection: %{BOOL}d, previousSelectionModel: %{public}@", buf, 0x32u);

    }
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10012BD04;
    v33[3] = &unk_10051FDC8;
    v33[4] = self;
    v35 = v7;
    v36 = v6;
    v37 = v10;
    v38 = v18;
    v23 = v17;
    v34 = v23;
    v24 = objc_retainBlock(v33);
    if (v7)
    {
      v25 = v23;
      if ((v18 & 1) == 0)
        v25 = objc_msgSend(objc_alloc((Class)MessageListSelectionModel), "initWithDataSource:delegate:", self, self);
      -[MessageListViewController setMessageListSelectionModel:](self, "setMessageListSelectionModel:", v25);
      if ((v18 & 1) == 0)

      -[MessageListViewController setPreviousMessageListSelectionModel:](self, "setPreviousMessageListSelectionModel:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
      objc_msgSend(v26, "setSelectionDataSource:", self);
    }
    else
    {
      if (v5)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
        objc_msgSend(v27, "preserveSelection");
        -[MessageListViewController setPreviousMessageListSelectionModel:](self, "setPreviousMessageListSelectionModel:", v27);

      }
      else
      {
        -[MessageListViewController setPreviousMessageListSelectionModel:](self, "setPreviousMessageListSelectionModel:", 0);
      }
      -[MessageListViewController setMessageListSelectionModel:](self, "setMessageListSelectionModel:", 0);
      sub_1001247FC((uint64_t)self, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
      objc_msgSend(v26, "setSelectionDataSource:", 0);
    }

    v28 = -[MessageListViewController _inMultiSelectionMode](self, "_inMultiSelectionMode");
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController layoutValuesHelper](self, "layoutValuesHelper"));
    objc_msgSend(v29, "setInMultiSelectionMode:", v28);

    if (v6)
      ((void (*)(_QWORD *))v24[2])(v24);
    else
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v24);
    -[MessageListViewController _updateTitle](self, "_updateTitle");
    -[MessageListViewController updateBarButtons](self, "updateBarButtons");
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchBar](self, "searchBar"));
    objc_msgSend(v30, "_setEnabled:animated:", v7 ^ 1, v6);

    -[MessageListViewController _setRowDeletionEnabled:animated:](self, "_setRowDeletionEnabled:animated:", v7, v6);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
    objc_msgSend(v31, "isEditing");

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
    objc_msgSend(v32, "_updateBarButtonsAnimated:force:isShowingTitle:", 1, 1, 0);

  }
}

- (void)_editButtonTapped:(id)a3
{
  -[MessageListViewController setEditing:animated:](self, "setEditing:animated:", -[MessageListViewController isEditing](self, "isEditing", a3) ^ 1, 1);
  if (!-[MessageListViewController isSearchViewController](self, "isSearchViewController"))
    -[MessageListViewController changeTipShouldDisplayTo:](self, "changeTipShouldDisplayTo:", -[MessageListViewController isEditing](self, "isEditing") ^ 1);
}

- (void)enterEditMode
{
  if ((-[MessageListViewController isEditing](self, "isEditing") & 1) == 0)
    -[MessageListViewController _editButtonTapped:](self, "_editButtonTapped:", 0);
}

- (id)_currentBulkSelectionWithDebugLabel:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  MessageListViewController *v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  void *v21;

  v4 = CFSTR("unknown operation");
  if (a3)
    v4 = (__CFString *)a3;
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentMessageListItemSelection"));
  if (!v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v10 = (objc_class *)objc_opt_class(self);
      v11 = NSStringFromClass(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_publicDescription"));
      v14 = 138413058;
      v15 = v12;
      v16 = 2048;
      v17 = self;
      v18 = 2112;
      v19 = v5;
      v20 = 2114;
      v21 = v13;
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "<%@: %p> Bulk message selection for %@ is nil: %{public}@", (uint8_t *)&v14, 0x2Au);

    }
  }

  return v7;
}

- (id)currentConfigureMenuButtonItem
{
  UIBarButtonItem *configureButtonItem;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  UIBarButtonItem *v11;
  UIBarButtonItem *v12;
  void *v13;
  _QWORD v15[2];

  configureButtonItem = self->_configureButtonItem;
  if (!configureButtonItem)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphMoreActionsFill));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    v15[0] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor"));
    v15[1] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageWithConfiguration:", v8));

    v10 = objc_msgSend(v9, "imageWithRenderingMode:", 2);
    v11 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:image:target:action:menu:", 0, v9, 0, 0, 0);
    v12 = self->_configureButtonItem;
    self->_configureButtonItem = v11;

    configureButtonItem = self->_configureButtonItem;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _configureMenuForBarButtonItem:](self, "_configureMenuForBarButtonItem:", configureButtonItem));
  -[UIBarButtonItem setMenu:](self->_configureButtonItem, "setMenu:", v13);

  return self->_configureButtonItem;
}

- (id)selectMessageListViewButtonItem
{
  uint64_t v3;
  void *v4;
  void *v5;
  UIBarButtonItem *v6;
  uint64_t v7;
  void *v8;
  UIBarButtonItem *selectButtonItem;

  if (!self->_selectButtonItem || (-[MessageListViewController isEditing](self, "isEditing") & 1) == 0)
  {
    v7 = _EFLocalizedString(CFSTR("Select"), &unk_10059D2A0, &unk_10059D2A8);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _configureSelectButtonWithTitle:](self, "_configureSelectButtonWithTitle:", v8));

    v6 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v5);
    goto LABEL_6;
  }
  if (-[MessageListViewController isEditing](self, "isEditing"))
  {
    v3 = _EFLocalizedString(CFSTR("Cancel"), &unk_10059D2A0, &unk_10059D2A8);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _configureSelectButtonWithTitle:](self, "_configureSelectButtonWithTitle:", v4));

    v6 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v5);
LABEL_6:
    selectButtonItem = self->_selectButtonItem;
    self->_selectButtonItem = v6;

  }
  return self->_selectButtonItem;
}

- (id)_configureSelectButtonWithTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration filledButtonConfiguration](UIButtonConfiguration, "filledButtonConfiguration"));
  objc_msgSend(v5, "setCornerStyle:", 4);
  objc_msgSend(v5, "setTitle:", v4);
  objc_msgSend(v5, "setTitleTextAttributesTransformer:", &stru_10051FE08);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  objc_msgSend(v5, "setBaseForegroundColor:", v6);

  objc_msgSend(v5, "setContentInsets:", 5.0, 12.0, 5.0, 12.0);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10012CA64;
  v14 = &unk_10051D178;
  objc_copyWeak(&v15, &location);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &v11));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v5, v7, v11, v12, v13, v14));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor"));
  objc_msgSend(v8, "setTintColor:", v9);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v8;
}

- (id)_configureMenuForBarButtonItem:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  char v15;
  id location;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", a3));
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if (_os_feature_enabled_impl("Mail", "CatchUpHighlights")
    && EMIsGreymatterAvailableWithOverride())
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
    v6 = objc_msgSend(v5, "BOOLForKey:", EMUserDefaultShouldHideHighlights);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", MFImageGlyphCatchUpHighlights));
    v8 = _EFLocalizedString(CFSTR("Show Priority"), &unk_10059D2A0, &unk_10059D2A8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10012CCC8;
    v13[3] = &unk_10051FE30;
    objc_copyWeak(&v14, &location);
    v15 = v6 ^ 1;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v9, v7, 0, v13));

    objc_msgSend(v10, "setState:", v6 ^ 1);
    objc_msgSend(v4, "addObject:", v10);

    objc_destroyWeak(&v14);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_100531B00, v4));
  objc_destroyWeak(&location);

  return v11;
}

- (UIBarButtonItem)selectAllButtonItem
{
  UIBarButtonItem *selectAllButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  selectAllButtonItem = self->_selectAllButtonItem;
  if (!selectAllButtonItem)
  {
    v4 = +[UIBarButtonItem mf_newSelectionBarButtonItemWithTarget:action:](UIBarButtonItem, "mf_newSelectionBarButtonItemWithTarget:action:", self, "_selectAllButtonPressed:");
    v5 = self->_selectAllButtonItem;
    self->_selectAllButtonItem = v4;

    selectAllButtonItem = self->_selectAllButtonItem;
  }
  return selectAllButtonItem;
}

- (void)_deleteMessageCommandInvoked:(id)a3
{
  if (-[MessageListViewController isEditing](self, "isEditing", a3))
    -[MessageListViewController _deleteMessagesWithPreference:](self, "_deleteMessagesWithPreference:", 1);
  else
    -[MessageListViewController _deleteOrArchiveConversationReferenceItemWithPreference:](self, "_deleteOrArchiveConversationReferenceItemWithPreference:", 1);
}

- (id)_messageListItemSelectionCreateIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentMessageListItemSelection"));

  if (!v6 && v3)
  {
    v7 = objc_alloc((Class)MSMessageListItemSelection);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "referenceMessageListItem"));
    v12 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    v6 = objc_msgSend(v7, "initWithMessageListItems:", v10);

  }
  return v6;
}

- (void)_archiveShortcutInvoked:(id)a3
{
  if (-[MessageListViewController isEditing](self, "isEditing", a3))
    -[MessageListViewController _deleteMessagesWithPreference:](self, "_deleteMessagesWithPreference:", 2);
  else
    -[MessageListViewController _deleteOrArchiveConversationReferenceItemWithPreference:](self, "_deleteOrArchiveConversationReferenceItemWithPreference:", 2);
}

- (void)_deleteOrArchiveConversationReferenceItemWithPreference:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController lastSelectedItemID](self, "lastSelectedItemID"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _messageListItemSelectionCreateIfNeeded:](self, "_messageListItemSelectionCreateIfNeeded:", 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController undoManager](self, "undoManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MFDestructiveTriageInteractionFactory interactionWithMessageListItemSelection:undoManager:origin:actor:deleteOrArchive:](MFDestructiveTriageInteractionFactory, "interactionWithMessageListItemSelection:undoManager:origin:actor:deleteOrArchive:", v6, v7, 2, 2, a3));

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10012D0B8;
    v10[3] = &unk_10051B310;
    v10[4] = self;
    v11 = v8;
    v9 = v8;
    objc_msgSend(v9, "performInteractionWithCompletion:", v10);

  }
}

- (void)deleteMessagesWithItemIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageListItemsForItemIDs:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture combine:](EFFuture, "combine:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "result"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ef_filter:", EFIsNotNull));

  if (objc_msgSend(v9, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController undoManager](self, "undoManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MFDestructiveTriageInteractionFactory interactionWithMessageListItems:undoManager:origin:actor:deleteOrArchive:](MFDestructiveTriageInteractionFactory, "interactionWithMessageListItems:undoManager:origin:actor:deleteOrArchive:", v9, v10, 2, 2, 1));

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10012D36C;
    v13[3] = &unk_10051B310;
    v13[4] = self;
    v14 = v11;
    v12 = v11;
    objc_msgSend(v12, "performInteractionWithCompletion:", v13);

  }
}

- (void)_bulkDeleteButtonPressed:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = MFLogGeneral(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "User Tap on Delete button", v7, 2u);
  }

  -[MessageListViewController deleteAction:showChoices:](self, "deleteAction:showChoices:", v4, 0);
}

- (void)_bulkDeleteButtonLongPressed:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = MFLogGeneral(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "User Tap on Delete (with long press) button", v7, 2u);
  }

  -[MessageListViewController deleteAction:showChoices:](self, "deleteAction:showChoices:", v4, 1);
}

- (void)deleteAction:(id)a3 showChoices:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  _QWORD *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  _QWORD *v47;
  _QWORD v48[5];

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel", a3));
  v7 = objc_msgSend(v6, "isSelectAll");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  v9 = objc_msgSend(v8, "BOOLForKey:", ShowMessageDeleteConfirmationKey);

  if ((v9 | v4 | v7) == 1)
  {
    if (v7)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
      v11 = +[EMMailbox deleteMovesToTrashForMailboxes:](EMMailbox, "deleteMovesToTrashForMailboxes:", v10);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
      LODWORD(v13) = +[EMMailbox supportsArchivingForMailboxes:](EMMailbox, "supportsArchivingForMailboxes:", v12);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
      LODWORD(v15) = +[EMMailbox shouldArchiveByDefaultForMailboxes:](EMMailbox, "shouldArchiveByDefaultForMailboxes:", v14);

    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
      v20 = (unint64_t)objc_msgSend(v19, "deleteSelectionState");

      v11 = v20 & 1;
      v13 = (v20 >> 2) & 1;
      v15 = (v20 >> 1) & 1;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
    v22 = (uint64_t)objc_msgSend(v21, "count");

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v24 = v23;
    v25 = CFSTR("TRASH_EMAIL");
    if (v22 > 1)
      v25 = CFSTR("TRASH_SELECTED_EMAILS");
    if (v11)
    {
      if (v7)
        v26 = CFSTR("TRASH_ALL_CONFIRMATION");
      else
        v26 = v25;
    }
    else if (v7)
    {
      v26 = CFSTR("DELETE_ALL_CONFIRMATION");
    }
    else
    {
      v26 = v25;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", v26, &stru_100531B00, CFSTR("Main")));

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v29 = v28;
    v30 = CFSTR("ARCHIVE_EMAIL");
    if (v22 > 1)
      v30 = CFSTR("ARCHIVE_SELECTED_EMAILS");
    if (v7)
      v31 = CFSTR("ARCHIVE_ALL_CONFIRMATION");
    else
      v31 = v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", v31, &stru_100531B00, CFSTR("Main")));

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100531B00, CFSTR("Main")));

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0));
    objc_msgSend(v35, "setModalPresentationStyle:", 7);
    v36 = v4 & v13;
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10012DB38;
    v48[3] = &unk_10051FEC0;
    v48[4] = self;
    v37 = objc_retainBlock(v48);
    v38 = v37;
    if ((v36 | v15 ^ 1) == 1)
    {
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_10012DC1C;
      v46[3] = &unk_10051E438;
      v47 = v37;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v27, 2, v46));
      objc_msgSend(v35, "addAction:", v39);

    }
    if ((_DWORD)v15)
    {
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10012DC2C;
      v44[3] = &unk_10051E438;
      v45 = v38;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v32, 0, v44));
      objc_msgSend(v35, "addAction:", v40);

    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v34, 1, 0));
    objc_msgSend(v35, "addAction:", v41);

    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "popoverPresentationController"));
    objc_msgSend(v42, "setDelegate:", self);
    objc_msgSend(v42, "setPermittedArrowDirections:", 3);
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController deleteButtonItem](self, "deleteButtonItem"));
    objc_msgSend(v42, "setBarButtonItem:", v43);

    -[MessageListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v35, 1, 0);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
    v17 = objc_msgSend(v16, "deleteSelectionState");

    if ((v17 & 2) != 0)
      v18 = 2;
    else
      v18 = 1;
    -[MessageListViewController _deleteMessagesWithPreference:](self, "_deleteMessagesWithPreference:", v18);
  }
}

- (void)_deleteMessagesWithPreference:(unint64_t)a3
{
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));

  if (!v6)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageListViewController.m"), 3870, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.messageListSelectionModel != nil"));

  }
  v7 = -[MessageListViewController isEditing](self, "isEditing");
  if ((_DWORD)v7)
  {
    v8 = MFLogGeneral(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
      v11 = NSStringFromMessageListSelectionType(objc_msgSend(v10, "type"));
      v12 = (id)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
      *(_DWORD *)buf = 138412546;
      v29 = v12;
      v30 = 2048;
      v31 = objc_msgSend(v13, "count");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Delete/Archive messages with type: %@ (count: %ld)", buf, 0x16u);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _currentBulkSelectionWithDebugLabel:](self, "_currentBulkSelectionWithDebugLabel:", CFSTR("delete")));
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController undoManager](self, "undoManager"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MFDestructiveTriageInteractionFactory interactionWithMessageListItemSelection:undoManager:origin:actor:deleteOrArchive:](MFDestructiveTriageInteractionFactory, "interactionWithMessageListItemSelection:undoManager:origin:actor:deleteOrArchive:", v14, v15, 2, 2, a3));

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "messageListItems"));
      if (objc_msgSend(v14, "isSelectAll"))
      {
        objc_msgSend(v16, "setDelegate:", self);
      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "messageListItems"));
        v19 = objc_msgSend(v18, "count");

        if (v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageSelectionStrategy](self, "messageSelectionStrategy"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "itemID"));
          v27 = v22;
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "itemIDToSelectAfterDeletedMessageItemIDs:", v23));
          -[MessageListViewController setItemIDToSelectAfterMoveID:](self, "setItemIDToSelectAfterMoveID:", v24);

        }
      }
      objc_msgSend(v16, "performInteraction");
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
      -[MessageListViewController setEditing:animated:](self, "setEditing:animated:", 0, objc_msgSend(v25, "isInExpandedEnvironment"));

    }
  }
}

- (void)_bulkTransferButtonPressed:(id)a3
{
  id v4;

  if (-[MessageListViewController isEditing](self, "isEditing", a3))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController moveButtonItem](self, "moveButtonItem"));
    sub_10012E064(self, v4);

  }
}

- (void)_showTransferPickerForNonPredictiveMoveOfMessages:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  MessageListViewController *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  char v25;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
    v6 = objc_msgSend(v5, "isSelectAll", v5);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10012E730;
    v22[3] = &unk_10051FEE8;
    v25 = v6;
    v22[4] = self;
    v7 = v4;
    v23 = v7;
    v8 = v5;
    v24 = v8;
    v9 = objc_retainBlock(v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController transferStackViewController](self, "transferStackViewController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationController"));

    if (v6)
      v11 = 258;
    else
      v11 = 2;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _transferControllerWithMessages:options:interaction:didDismissHandler:](self, "_transferControllerWithMessages:options:interaction:didDismissHandler:", v7, v11, 0, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "transferNavigationController"));
    objc_msgSend(v13, "setDidFinish:", v9);
    -[MessageListViewController setTransferController:](self, "setTransferController:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mf_rootViewController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController transferController](self, "transferController"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10012EB7C;
    v19[3] = &unk_10051A910;
    v17 = v18;
    v20 = v17;
    v21 = self;
    objc_msgSend(v15, "presentViewController:animated:completion:", v16, 1, v19);

  }
}

- (id)_previewMessagesForSelectAllMode:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[4];
  id v22;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
  if (objc_msgSend(v5, "isSelectAll"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
    v8 = v7;
    if (v3)
    {
      v9 = (uint64_t)objc_msgSend(v7, "numberOfItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemIdentifiers"));
      v11 = v10;
      if (v9 >= 5)
        v12 = 5;
      else
        v12 = v9;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subarrayWithRange:", 0, v12));
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathsForSelectedItems"));
      v15 = (uint64_t)objc_msgSend(v14, "count");

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathsForSelectedItems"));
      v17 = v16;
      if (v15 >= 5)
        v18 = 5;
      else
        v18 = v15;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "subarrayWithRange:", 0, v18));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10012ED80;
      v21[3] = &unk_10051F790;
      v22 = v8;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "ef_map:", v21));

      v11 = v22;
    }

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemIDs"));
  }

  return v13;
}

- (id)_transferControllerWithMessages:(id)a3 options:(unint64_t)a4 interaction:(id)a5 didDismissHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  MFTransferSplitViewController *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v15 = -[MFTransferSplitViewController initWithItems:scene:options:didDismissHandler:]([MFTransferSplitViewController alloc], "initWithItems:scene:options:didDismissHandler:", v11, v14, a4, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController transferStackViewController](self, "transferStackViewController"));
  -[MFTransferSplitViewController setStackViewController:](v15, "setStackViewController:", v16);
  if (-[MessageListViewController _inMultiSelectionMode](self, "_inMultiSelectionMode"))
  {
    -[MFTransferSplitViewController setModalPresentationStyle:](v15, "setModalPresentationStyle:", 0);
    -[MFTransferSplitViewController setUsePushFromLeftPresentation:](v15, "setUsePushFromLeftPresentation:", objc_msgSend(v14, "isInExpandedEnvironment"));
  }
  else
  {
    -[MFTransferSplitViewController setModalPresentationStyle:](v15, "setModalPresentationStyle:", 7);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentationSource"));
    v18 = objc_opt_class(UIBarButtonItem);
    if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
    {
      v19 = (id)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController popoverPresentationController](v15, "popoverPresentationController"));
      objc_msgSend(v19, "setBarButtonItem:", v17);
    }
    else
    {
      v20 = objc_opt_class(UIView);
      if ((objc_opt_isKindOfClass(v17, v20) & 1) != 0)
      {
        v19 = v17;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController popoverPresentationController](v15, "popoverPresentationController"));
        objc_msgSend(v19, "mui_setAsSourceWithExtendedRectForPopoverPresentationController:", v21);

      }
      else
      {
        v19 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageListViewController.m"), 4015, CFSTR("presentation source %@ needs to be a UIBarButtonItem or UIView."), v17);
      }
    }

  }
  return v15;
}

- (void)_setRowDeletionEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MFUserInteractionAssertion interactionAssertionWithReason:timeout:](MFUserInteractionAssertion, "interactionAssertionWithReason:timeout:", CFSTR("setRowDeletionEnabled : [currentTableView setEditing:enabled animated:animated] "), 1.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mf_navigationItem](self, "mf_navigationItem"));
  objc_msgSend(v8, "setHidesBackButton:animated:", v5, v4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "splitViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "traitCollection"));
  v11 = objc_msgSend(v10, "horizontalSizeClass");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController transferController](self, "transferController"));
  if (v12)
  {
    v29 = v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mf_rootViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "presentedViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController transferController](self, "transferController"));
    v16 = v14 == v15;

    v9 = v29;
  }
  else
  {
    v16 = 0;
  }

  v17 = v11 != (id)2 && (*((_BYTE *)self + 8) & 1) == 0;
  if (v17 || v16)
  {
    v18 = v31;
  }
  else
  {
    v18 = v31;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MFUserInteractionAssertion interactionAssertionWithReason:timeout:](MFUserInteractionAssertion, "interactionAssertionWithReason:timeout:", CFSTR("Performing Stack View Animations"), 1.0));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController transferStackViewController](self, "transferStackViewController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "messageDetailNavController"));
    v22 = -[MessageListViewController isTransferStackVisible](self, "isTransferStackVisible");
    if (v5)
    {
      if ((v22 & 1) == 0)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _previewMessagesForSelectAllMode:](self, "_previewMessagesForSelectAllMode:", objc_msgSend(v23, "isSelectAll")));

        v25 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v20);
        objc_msgSend(v25, "setModalPresentationStyle:", 6);
        objc_msgSend(v21, "presentViewController:animated:completion:", v25, 0, 0);
        objc_msgSend(v20, "displayStackedViewsForItemsWithIDs:", v24);
        objc_msgSend(v19, "invalidate");

      }
    }
    else if (v22)
    {
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10012F564;
      v32[3] = &unk_10051A910;
      v33 = v21;
      v34 = v19;
      objc_msgSend(v20, "removeStackedViewsAnimated:completion:", 1, v32);

    }
    if (v4)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      if ((objc_msgSend(v26, "isRunningTest:", CFSTR("ExitEditMode")) & 1) != 0
        || objc_msgSend(v26, "isRunningTest:", CFSTR("ExitEditModeLandscape")))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification notificationWithName:object:](NSNotification, "notificationWithName:object:", CFSTR("DidFinishExitEditModeTest"), 0, v9));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v28, "performSelector:withObject:afterDelay:", "postNotification:", v27, UIAnimationDragCoefficient() * 0.35);

        v9 = v30;
      }

    }
    v7 = v19;
  }
  objc_msgSend(v7, "invalidate");

}

- (void)_addMessagesToStackWithItemIDs:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController transferStackViewController](self, "transferStackViewController"));
  objc_msgSend(v4, "addStackedItemsWithItemIDs:", v5);

}

- (void)_removeMessagesFromStackWithItemIDs:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController transferStackViewController](self, "transferStackViewController"));
  objc_msgSend(v4, "removeStackedItemsWithItemIDs:", v5);

}

- (id)_bulkMarkMenuForCurrentSelection
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  MessageListViewController *v28;
  id v29;
  char v30;
  _QWORD v31[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _currentBulkSelectionWithDebugLabel:](self, "_currentBulkSelectionWithDebugLabel:", CFSTR("mark")));
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "isSelectAll");
    v6 = objc_alloc_init((Class)NSMutableArray);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10012F988;
    v31[3] = &unk_10051FF10;
    v31[4] = self;
    v7 = objc_retainBlock(v31);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10012F998;
    v26[3] = &unk_10051FF38;
    v27 = v4;
    v28 = self;
    v8 = v7;
    v29 = v8;
    v30 = v5;
    v9 = objc_retainBlock(v26);
    v10 = ((uint64_t (*)(_QWORD *, uint64_t))v9[2])(v9, 6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v6, "ef_addOptionalObject:", v11);

    v12 = ((uint64_t (*)(_QWORD *, uint64_t))v9[2])(v9, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v6, "ef_addOptionalObject:", v13);

    v14 = ((uint64_t (*)(_QWORD *, uint64_t))v9[2])(v9, 15);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v6, "ef_addOptionalObject:", v15);

    v16 = ((uint64_t (*)(_QWORD *, uint64_t))v9[2])(v9, 20);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    objc_msgSend(v6, "ef_addOptionalObject:", v17);

    if (v5)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "itemIDs"));
      v20 = objc_msgSend(v19, "count");

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (v20)
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("INDETERMINATE_MESSAGE_SELECTION"), &stru_100531B00, CFSTR("Main")));
      else
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("ALL_MESSAGES"), &stru_100531B00, CFSTR("Main")));
      v24 = (void *)v22;

    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _menuTitleForSelection](self, "_menuTitleForSelection"));
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", v24, v6));

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)_menuTitleForSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MESSAGE_COUNT_FORMAT%1$lu"), &stru_100531B00, CFSTR("Main")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, objc_msgSend(v5, "count")));

  return v6;
}

- (void)_selectAllButtonPressed:(id)a3
{
  _BOOL4 v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  MessageListViewController *v20;
  __int16 v21;
  _BOOL4 v22;

  v4 = sub_10012FF0C(self);
  v5 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v17 = 138412802;
    v18 = v8;
    v19 = 2048;
    v20 = self;
    v21 = 1024;
    v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<%@: %p> Select All Button Pressed. Is select all: %d", (uint8_t *)&v17, 0x1Cu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
  v10 = v9;
  if (v4)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController flattenedMailboxesFuture](self, "flattenedMailboxesFuture"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "result"));
    objc_msgSend(v10, "enableSelectAllWithMailboxes:", v12);

  }
  else
  {
    objc_msgSend(v9, "disableSelectAll");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  objc_msgSend(v13, "reloadVisibleCellsInvalidatingCache:", 0);

  if (v4)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _previewMessagesForSelectAllMode:](self, "_previewMessagesForSelectAllMode:", 1));
    -[MessageListViewController _addMessagesToStackWithItemIDs:](self, "_addMessagesToStackWithItemIDs:", v14);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController transferStackViewController](self, "transferStackViewController"));
    objc_msgSend(v14, "removeStackedViewsAnimated:completion:", 1, 0);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController selectAllButtonItem](self, "selectAllButtonItem"));
  +[UIBarButtonItem mf_configureSelectionBarButtonItem:usingStyle:](UIBarButtonItem, "mf_configureSelectionBarButtonItem:usingStyle:", v15, !v4);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
  objc_msgSend(v16, "_updateBarButtonsAnimated:force:", 1, 1);

}

- (void)updateToolbarButtonTitles
{
  void *v3;
  unsigned int v4;
  id v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  unsigned int v40;
  uint64_t v41;
  unsigned int v42;
  id v43;

  v43 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
  v4 = objc_msgSend(v3, "isSelectAll");

  v5 = objc_msgSend(v43, "count");
  v42 = -[MessageListViewController _shouldDisplaySearchButtons](self, "_shouldDisplaySearchButtons");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
  v7 = v5 != 0;
  v8 = v7 & ~objc_msgSend(v6, "containsDraftsOrOutbox");

  v9 = v7 & ~v4;
  if ((_DWORD)v9 == 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter ef_formatUnsignedInteger:withGrouping:](NSNumberFormatter, "ef_formatUnsignedInteger:withGrouping:", v5, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
    v12 = (unint64_t)objc_msgSend(v11, "deleteSelectionState");

    v40 = v12 & 1;
    v41 = (v12 >> 1) & 1;
    if (v42)
    {
      if ((v12 & 2) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ARCHIVE_BUTTON_COUNT_FORMAT_SHORT"), &stru_100531B00, CFSTR("Main")));
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        if ((v12 & 1) != 0)
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("TRASH_BUTTON_COUNT_FORMAT_SHORT"), &stru_100531B00, CFSTR("Main")));
        else
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DELETE_BUTTON_COUNT_FORMAT_SHORT"), &stru_100531B00, CFSTR("Main")));
      }
      v23 = (void *)v14;

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v10));
      if ((_DWORD)v8)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("MOVE_BUTTON_COUNT_FORMAT_SHORT"), &stru_100531B00, CFSTR("Main")));

        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v10));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("MARK_BUTTON_COUNT_FORMAT_SHORT"), &stru_100531B00, CFSTR("Main")));

        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v10));
        goto LABEL_23;
      }
    }
    else
    {
      v19 = 0;
    }
    v20 = 0;
    v21 = 0;
LABEL_23:

    if (v19)
      goto LABEL_36;
    goto LABEL_24;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
  LODWORD(v41) = +[EMMailbox shouldArchiveByDefaultForMailboxes:](EMMailbox, "shouldArchiveByDefaultForMailboxes:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
  v40 = +[EMMailbox deleteMovesToTrashForMailboxes:](EMMailbox, "deleteMovesToTrashForMailboxes:", v16);

  if (v5)
  {
    if ((_DWORD)v41)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ARCHIVE_BUTTON"), &stru_100531B00, CFSTR("Main")));
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (v40)
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("TRASH_BUTTON"), &stru_100531B00, CFSTR("Main")));
      else
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DELETE_BUTTON"), &stru_100531B00, CFSTR("Main")));
    }
    v19 = (void *)v18;

    if ((_DWORD)v8)
      goto LABEL_18;
  }
  else
  {
    v19 = 0;
    if ((_DWORD)v8)
    {
LABEL_18:
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("MOVE_BUTTON"), &stru_100531B00, CFSTR("Main")));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("MARK_BUTTON"), &stru_100531B00, CFSTR("Main")));
      goto LABEL_23;
    }
  }
  v20 = 0;
  v21 = 0;
  if (v19)
    goto LABEL_36;
LABEL_24:
  if ((_DWORD)v41)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v29 = v28;
    if (v42)
      v30 = CFSTR("ARCHIVE_BUTTON_SHORT");
    else
      v30 = CFSTR("ARCHIVE_BUTTON");
  }
  else if (v40)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v29 = v28;
    if (v42)
      v30 = CFSTR("TRASH_BUTTON_SHORT");
    else
      v30 = CFSTR("TRASH_BUTTON");
  }
  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v29 = v28;
    if (v42)
      v30 = CFSTR("DELETE_BUTTON_SHORT");
    else
      v30 = CFSTR("DELETE_BUTTON");
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", v30, &stru_100531B00, CFSTR("Main")));

LABEL_36:
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController deleteButtonItem](self, "deleteButtonItem"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController moveButtonItem](self, "moveButtonItem"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController markButtonItem](self, "markButtonItem"));
  objc_msgSend(v31, "setEnabled:", v5 != 0);
  objc_msgSend(v32, "setEnabled:", v8);
  objc_msgSend(v33, "setEnabled:", v8);
  objc_msgSend(v31, "setTitle:", v19);
  v34 = v20;
  if (!v20)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v35;
    if (v42)
      v36 = CFSTR("MOVE_BUTTON_SHORT");
    else
      v36 = CFSTR("MOVE_BUTTON");
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", v36, &stru_100531B00, CFSTR("Main")));
  }
  objc_msgSend(v32, "setTitle:", v34);
  if (!v20)
  {

  }
  v37 = v21;
  if (!v21)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v38;
    if (v42)
      v39 = CFSTR("MARK_BUTTON_SHORT");
    else
      v39 = CFSTR("MARK_BUTTON");
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", v39, &stru_100531B00, CFSTR("Main")));
  }
  objc_msgSend(v33, "setTitle:", v37);
  if (!v21)
  {

  }
  objc_msgSend(v31, "setLongPressEnabled:", v9);

}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  MessageListViewController *v7;
  id v8;
  MessageListViewController *v9;
  objc_super v11;

  v6 = a4;
  if (sub_1000F98A0((uint64_t)MailSplitViewController, (char *)a3))
  {
    v7 = (MessageListViewController *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
  }
  else if (sub_100130B3C((_BOOL8)self, (char *)a3))
  {
    v7 = self;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MessageListViewController;
    v8 = -[MessageListViewController targetForAction:withSender:](&v11, "targetForAction:withSender:", a3, v6);
    v7 = (MessageListViewController *)objc_claimAutoreleasedReturnValue(v8);
  }
  v9 = v7;

  return v9;
}

- (void)_mailboxSearchKeyCommandInvoked:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;

  if ((-[MessageListViewController isEditing](self, "isEditing", a3) & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "splitViewController"));
    v6 = (unint64_t)objc_msgSend(v5, "displayMode");

    if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      if (-[MessageListViewController isSearchViewController](self, "isSearchViewController"))
      {
        -[MessageListViewController dismissSearchResultsAnimated:](self, "dismissSearchResultsAnimated:", 1);
        return;
      }
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController splitViewController](self, "splitViewController"));
      objc_msgSend(v7, "showMessageListViewController:animated:completion:", 1, 1, 0);

    }
    -[MessageListViewController focusSearchBarAnimated:](self, "focusSearchBarAnimated:", 0);
  }
}

- (int64_t)_expandOpFromPlist:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  int64_t v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MailKBIsLeftArrowPlistKey")));
  v5 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
    v7 = objc_msgSend(v6, "effectiveUserInterfaceLayoutDirection");

    if ((v7 != (id)1) != objc_msgSend(v4, "BOOLValue"))
      v8 = 1;
    else
      v8 = 2;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_canPerformExpandOp:(int64_t)a3
{
  id v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v10;
  id v11;

  if (!-[MessageListViewController isThreaded](self, "isThreaded"))
    return 0;
  v10 = 0;
  v11 = 0;
  sub_100130D48((id *)self, &v11, &v10);
  v5 = v11;
  v6 = v10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  if ((objc_msgSend(v7, "isExpandedThread:", v5) & 1) != 0)
    v8 = 1;
  else
    v8 = objc_msgSend(v7, "anyExpandedThreadContainsItemID:", v5);
  if (a3 != 2)
    v8 = a3 == 1 && (v8 & 1) == 0 && (unint64_t)objc_msgSend(v6, "count") > 1;

  return v8;
}

- (id)_plistDictionaryFromSender:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a3;
  v4 = objc_opt_class(UICommand);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "propertyList"));
    v6 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      v7 = v5;
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)shouldRouteActionToConversation:(SEL)a3 withCommand:(id)a4
{
  BOOL v5;
  void *v6;
  void *v7;

  if ((-[MessageListViewController isEditing](self, "isEditing", a3, a4) & 1) != 0)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathsForSelectedItems"));
  v5 = objc_msgSend(v7, "count") == 0;

  return v5;
}

- (BOOL)canHandleAction:(SEL)a3 withMailMenuCommand:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  unsigned __int8 v20;

  v6 = a4;
  if (sub_100130B3C((_BOOL8)self, (char *)a3))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));

    v9 = objc_opt_class(MFWindow);
    v10 = (objc_opt_isKindOfClass(v8, v9) & 1) != 0 && sub_1001CA354((_BOOL8)v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController presentedViewController](self, "presentedViewController"));
    if (v11)
      v10 = 1;

    if (v10)
      goto LABEL_9;
    if ("_refresh:" == a3)
    {
      LOBYTE(self) = 1;
      goto LABEL_35;
    }
    if ("_favoriteMailboxShortcutInvoked:" == a3)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _plistDictionaryFromSender:](self, "_plistDictionaryFromSender:", v6));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MailKBIsFavoritePlistKey")));
      v15 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v13, v15) & 1) == 0)
      {
        LOBYTE(self) = 0;
LABEL_33:

        goto LABEL_34;
      }
      v16 = objc_msgSend(v13, "integerValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController favoritesShortcutsProvider](self, "favoritesShortcutsProvider"));
      LOBYTE(self) = sub_1000A3A24(v14, (unint64_t)v16);
LABEL_32:

      goto LABEL_33;
    }
    if ((*((_BYTE *)self + 8) & 1) == 0)
    {
LABEL_9:
      LOBYTE(self) = 0;
LABEL_35:

      goto LABEL_36;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _plistDictionaryFromSender:](self, "_plistDictionaryFromSender:", v6));
    if (sub_1000F93F8((uint64_t)MailSplitViewController, (char *)a3))
    {
LABEL_14:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "indexPathsForSelectedItems"));
      LOBYTE(self) = objc_msgSend(v14, "count") != 0;
      goto LABEL_32;
    }
    if ("_mailboxSearchKeyCommandInvoked:" == a3)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController navigationController](self, "navigationController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topViewController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController parentViewController](self, "parentViewController"));
      if (v14 == v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchBar](self, "searchBar"));
        LOBYTE(self) = objc_msgSend(v18, "_isEnabled");

      }
      else
      {
        LOBYTE(self) = 0;
      }

      goto LABEL_32;
    }
    if ("_scrollMessageListToTop:" != a3)
    {
      if ("_scrollToCurrentMessage:" == a3)
        goto LABEL_14;
      if ("_expandCollapseThreadCommand:" == a3)
      {
        v20 = -[MessageListViewController _canPerformExpandOp:](self, "_canPerformExpandOp:", -[MessageListViewController _expandOpFromPlist:](self, "_expandOpFromPlist:", v12));
      }
      else
      {
        if ("_filterCommand:" == a3)
        {
          LODWORD(self) = -[MessageListViewController isEditing](self, "isEditing") ^ 1;
          goto LABEL_34;
        }
        if ("selectAll:" != a3)
        {
          LOBYTE(self) = 1;
LABEL_34:

          goto LABEL_35;
        }
        v20 = sub_1000403B8(self);
      }
      LOBYTE(self) = v20;
      goto LABEL_34;
    }
    LOBYTE(self) = -[MessageListViewController numberOfItemsInDataSourceExcludingTips]_0(self) != 0;
    goto LABEL_34;
  }
  LOBYTE(self) = 0;
LABEL_36:

  return (char)self;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v11;

  v6 = a4;
  if ("_escapeShortcutInvoked:" == a3)
  {
    if ((*((_BYTE *)self + 8) & 1) != 0
      && (-[MessageListViewController isEditing](self, "isEditing") & 1) != 0)
    {
      v9 = 1;
      goto LABEL_4;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchController](self, "searchController"));
    if (objc_msgSend(v8, "isActive"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchBar"));
      v9 = objc_msgSend(v11, "isFirstResponder");

    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "splitViewController"));

    v9 = objc_msgSend(v8, "messageListCanPerformAction:withSender:", a3, v6);
  }

LABEL_4:
  return v9;
}

- (BOOL)_shouldUsePluralPrompt
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  unsigned __int8 v10;

  if (-[MessageListViewController isEditing](self, "isEditing"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
    v4 = (uint64_t)objc_msgSend(v3, "count") > 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "referenceMessageListItem"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
    if ((objc_msgSend(v7, "isExpandedThread:", v6) & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
      v10 = objc_msgSend(v9, "anyExpandedThreadContainsItemID:", v6);

      v8 = v10 ^ 1;
    }

    if ((unint64_t)objc_msgSend(v3, "count") > 1)
      v4 = v8;
    else
      v4 = 0;

  }
  return v4;
}

- (void)validateCommand:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  int64_t v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  objc_class *v27;
  NSString *v28;
  void *v29;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  MessageListViewController *v34;
  __int16 v35;
  int64_t v36;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MessageListViewController;
  -[MessageListViewController validateCommand:](&v30, "validateCommand:", v4);
  v5 = (char *)objc_msgSend(v4, "action");
  if (v5 == "_deleteMessageCommandInvoked:")
  {
    if (-[MessageListViewController _shouldUsePluralPrompt](self, "_shouldUsePluralPrompt"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DELETE_EMAIL_PLURAL"), &stru_100531B00, CFSTR("Main")));
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DELETE_EMAIL"), &stru_100531B00, CFSTR("Main")));
    }
    goto LABEL_36;
  }
  if (v5 == "_archiveShortcutInvoked:")
  {
    if (-[MessageListViewController _shouldUsePluralPrompt](self, "_shouldUsePluralPrompt"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ARCHIVE_EMAIL_PLURAL"), &stru_100531B00, CFSTR("Main")));
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ARCHIVE_EMAIL"), &stru_100531B00, CFSTR("Main")));
    }
    goto LABEL_36;
  }
  if (v5 == "_expandCollapseThreadCommand:")
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "propertyList"));
    v14 = -[MessageListViewController _expandOpFromPlist:](self, "_expandOpFromPlist:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MailKBIsSimulatorPlistKey")));
    v16 = objc_msgSend(v15, "BOOLValue");

    if ((v16 & 1) != 0)
    {
      v13 = 0;
      goto LABEL_36;
    }
    if (v14 == 2)
    {
      v18 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = objc_claimAutoreleasedReturnValue(-[NSObject localizedStringForKey:value:table:](v18, "localizedStringForKey:value:table:", CFSTR("COLLAPSE_THREAD"), &stru_100531B00, CFSTR("Main")));
    }
    else
    {
      if (v14 != 1)
      {
        v18 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v27 = (objc_class *)objc_opt_class(self);
          v28 = NSStringFromClass(v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
          *(_DWORD *)buf = 138412802;
          v32 = v29;
          v33 = 2048;
          v34 = self;
          v35 = 2048;
          v36 = v14;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "<%@: %p> Unexpected expand op: %ld", buf, 0x20u);

        }
        v13 = 0;
        goto LABEL_35;
      }
      v18 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = objc_claimAutoreleasedReturnValue(-[NSObject localizedStringForKey:value:table:](v18, "localizedStringForKey:value:table:", CFSTR("EXPAND_THREAD"), &stru_100531B00, CFSTR("Main")));
    }
    v13 = (void *)v19;
LABEL_35:

    goto LABEL_36;
  }
  if (v5 == "_filterCommand:")
  {
    if (-[MessageListViewController isFilterButtonEnabled](self, "isFilterButtonEnabled"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DISABLE_FILTER"), &stru_100531B00, CFSTR("Main")));
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ENABLE_FILTER"), &stru_100531B00, CFSTR("Main")));
    }
    v22 = (void *)v17;
    objc_msgSend(v4, "setDiscoverabilityTitle:", v17);
    v13 = v22;
    goto LABEL_37;
  }
  if (v5 == "selectAll:")
  {
    if (sub_10012FF0C(self))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SELECT_ALL_BUTTON"), &stru_100531B00, CFSTR("Main")));
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("DESELECT_ALL_BUTTON"), &stru_100531B00, CFSTR("Main")));
    }
    v6 = (void *)v21;

    objc_msgSend(v4, "setDiscoverabilityTitle:", v6);
    goto LABEL_38;
  }
  if (v5 == "_favoriteMailboxShortcutInvoked:")
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "propertyList"));
    v7 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MailKBIsFavoritePlistKey")));
      v9 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        v10 = objc_msgSend(v8, "integerValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController favoritesShortcutsProvider](self, "favoritesShortcutsProvider"));
        v12 = sub_1000A3A8C(v11, (unint64_t)v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

        if (!v13)
          goto LABEL_41;
LABEL_36:
        objc_msgSend(v4, "setDiscoverabilityTitle:", v13);
LABEL_37:

LABEL_38:
        goto LABEL_39;
      }

    }
LABEL_41:
    v23 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = (objc_class *)objc_opt_class(self);
      v25 = NSStringFromClass(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      *(_DWORD *)buf = 138412802;
      v32 = v26;
      v33 = 2048;
      v34 = self;
      v35 = 2114;
      v36 = (int64_t)v6;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "<%@: %p> Unexpected request to validate favorite shortcut. plist = %{public}@", buf, 0x20u);

    }
    v13 = 0;
    goto LABEL_36;
  }
LABEL_39:

}

- (void)_refresh:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource", a3));
  objc_msgSend(v6, "refresh");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListFetchHelper](self, "messageListFetchHelper"));
  v4 = objc_msgSend(v7, "fetchMailboxesIsUserInitiated:", 1);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController isRefreshing](self, "isRefreshing"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  objc_msgSend(v8, "setObject:", v5);

  if ((v4 & 1) == 0)
    -[MessageListViewController _finishRefreshingWaitForDraggingToEnd:](self, "_finishRefreshingWaitForDraggingToEnd:", 1);
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController delegate](self, "delegate"));
  objc_msgSend(v9, "messageListViewControllerDidRefresh:", self);

}

- (void)_finishRefreshingWaitForDraggingToEnd:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;
  NSRunLoopMode v16;

  v3 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100132188;
  v13[3] = &unk_10051B1B8;
  objc_copyWeak(&v14, &location);
  v4 = objc_retainBlock(v13);
  v5 = v4;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    v16 = NSDefaultRunLoopMode;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100132218;
    v11[3] = &unk_10051A870;
    v12 = v5;
    objc_msgSend(v6, "performInModes:block:", v7, v11);

    v8 = &v12;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_100132224, &unk_10051A870, v4));
    objc_msgSend(v6, "performBlock:", &v9);
    v8 = (id *)&v10;
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_favoriteMailboxShortcutInvoked:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  MessageListViewController *v21;
  __int16 v22;
  void *v23;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v18 = 138412802;
    v19 = v9;
    v20 = 2048;
    v21 = self;
    v22 = 2112;
    v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<%@: %p> %@", (uint8_t *)&v18, 0x20u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "input"));
  v13 = objc_msgSend(v12, "integerValue");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController favoritesShortcutsProvider](self, "favoritesShortcutsProvider"));
  v15 = sub_1000A3B2C(v14, (unint64_t)v13 - 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxPickerDelegate](self, "mailboxPickerDelegate"));
    objc_msgSend(v17, "messageListViewController:didSelectFavorite:", self, v16);

  }
}

- (void)_expandCollapseThreadCommand:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  NSObject *v8;
  objc_class *v9;
  NSString *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  MessageListViewController *v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  const char *v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _plistDictionaryFromSender:](self, "_plistDictionaryFromSender:", v4));
  if (!v5)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class(self);
      v10 = NSStringFromClass(v9);
      objc_claimAutoreleasedReturnValue(v10);
      sub_100393460();
    }
    goto LABEL_10;
  }
  v6 = -[MessageListViewController _expandOpFromPlist:](self, "_expandOpFromPlist:", v5);
  v7 = v6;
  if (v6 == 2)
  {
    -[MessageListViewController _collapseThreadKeyCommandInvoked:](self, "_collapseThreadKeyCommandInvoked:", v4);
    goto LABEL_11;
  }
  if (v6 != 1)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class(self);
      v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = 138413058;
      v15 = v13;
      v16 = 2048;
      v17 = self;
      v18 = 2048;
      v19 = v7;
      v20 = 2080;
      v21 = "-[MessageListViewController _expandCollapseThreadCommand:]";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "<%@: %p> Unexpected op %ld in %s", (uint8_t *)&v14, 0x2Au);

    }
LABEL_10:

    goto LABEL_11;
  }
  -[MessageListViewController _expandThreadKeyCommandInvoked:](self, "_expandThreadKeyCommandInvoked:", v4);
LABEL_11:

}

- (void)_collapseThreadKeyCommandInvoked:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v12 = 0;
  v13 = 0;
  sub_100130D48((id *)self, &v13, &v12);
  v4 = v13;
  v5 = v12;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v7 = objc_msgSend(v6, "isExpandedThread:", v4);
  v8 = objc_msgSend(v6, "anyExpandedThreadContainsItemID:", v4);
  if (v7)
  {
    v9 = v5;
    if (!v9)
      goto LABEL_15;
LABEL_7:
    objc_msgSend(v6, "didSelectDisclosureButtonForMessageListItem:disclosureEnabled:", v9, 1);
    if (-[MessageListViewController isEditing](self, "isEditing"))
    {
      if (self && self->_keyboardFocusedItemID)
        sub_1001247FC((uint64_t)self, v4);
    }
    else if (v4)
    {
      -[MessageListViewController setLastSelectedItemID:](self, "setLastSelectedItemID:", v4);
    }
    goto LABEL_15;
  }
  if (!v8)
  {
    v9 = 0;
    goto LABEL_15;
  }
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "threadItemIDForItemInExpandedThread:", v4));

  if (!v10)
  {
    v9 = 0;
    v4 = 0;
    goto LABEL_15;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageListItemForItemID:", v10));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "result"));

  v4 = (id)v10;
  if (v9)
    goto LABEL_7;
LABEL_15:

}

- (void)_expandThreadKeyCommandInvoked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  id v9;

  v9 = 0;
  sub_100130D48((id *)self, 0, &v9);
  v4 = v9;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemID"));
    v7 = objc_msgSend(v5, "isExpandedThread:", v6);

    if ((v7 & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
      objc_msgSend(v8, "didSelectDisclosureButtonForMessageListItem:disclosureEnabled:", v4, 0);

    }
  }

}

- (void)selectAll:(id)a3
{
  -[MessageListViewController _selectAllButtonPressed:](self, "_selectAllButtonPressed:", 0);
}

- (void)_escapeShortcutInvoked:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;

  v7 = a3;
  if ((*((_BYTE *)self + 8) & 1) != 0 && -[MessageListViewController isEditing](self, "isEditing"))
  {
    -[MessageListViewController _editButtonTapped:](self, "_editButtonTapped:", 0);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchController](self, "searchController"));
    if ((objc_msgSend(v4, "isActive") & 1) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchBar](self, "searchBar"));
      v6 = objc_msgSend(v5, "isFirstResponder");

      if (v6)
        -[MessageListViewController dismissSearchResultsAnimated:](self, "dismissSearchResultsAnimated:", 1);
    }
    else
    {

    }
  }

}

- (void)_scrollMessageListToTop:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource", a3));
  v4 = (uint64_t)objc_msgSend(v7, "numberOfSections");
  if (v4 >= 1)
  {
    v5 = 0;
    while (!objc_msgSend(v7, "numberOfItemsAtSectionIndex:", v5))
    {
      if (v4 == ++v5)
        goto LABEL_7;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, v5));
    sub_100132974(self, v6, 1);

  }
LABEL_7:

}

- (void)_scrollToCurrentMessage:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathsForSelectedItems"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  if (v6)
    sub_100132974(self, v6, 0);

}

- (id)_focusedMessageAtNormalizedFocalPoint:(CGPoint)a3
{
  return 0;
}

- (void)_updateMailboxPositionUserActivity
{
  void *v3;
  NSMutableDictionary *mailboxBrowseActivityPayload;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController userActivity](self, "userActivity"));
  if (v3)
  {
    mailboxBrowseActivityPayload = self->_mailboxBrowseActivityPayload;

    if (mailboxBrowseActivityPayload)
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController userActivity](self, "userActivity"));
      objc_msgSend(v5, "becomeCurrent");

    }
  }
}

- (BOOL)_isActivityEligibleForPredictionWithPayload:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", MSMailActivityHandoffBrowseMailboxKeySpecialMailboxType));
  v4 = v3 != (void *)MSMailActivityHandoffBrowseMailboxSpecialMailboxTypeAllInboxes;

  return v4;
}

- (id)presentingViewControllerForTriageInteraction:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dockContainer"));

  return v4;
}

- (id)messageRepositoryForTriageInteraction:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageRepository](self, "messageRepository", a3));
}

- (void)presentTransferUIWithMoveInteraction:(id)a3 prediction:(id)a4 fromViewController:(id)a5 didDismissHandler:(id)a6
{
  id v9;
  void *v10;
  id v11;
  _QWORD *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  MessageListViewController *v29;
  _QWORD v30[5];
  id v31;
  id v32;

  v9 = a3;
  v26 = a4;
  v25 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel", v9));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100133094;
  v30[3] = &unk_10051FF60;
  v30[4] = self;
  v11 = v9;
  v31 = v11;
  v24 = v10;
  v32 = v24;
  v12 = objc_retainBlock(v30);
  v13 = -[MessageListViewController _stackViewTransferOptions](self, "_stackViewTransferOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "messageListItemSelection"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "messageListItems"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _transferControllerWithMessages:options:interaction:didDismissHandler:](self, "_transferControllerWithMessages:options:interaction:didDismissHandler:", v15, v13 | 2, v11, v25));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "transferNavigationController"));
  objc_msgSend(v17, "setMailboxPrediction:", v26);
  objc_msgSend(v17, "setDidFinish:", v12);
  -[MessageListViewController setTransferController:](self, "setTransferController:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController transferStackViewController](self, "transferStackViewController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "navigationController"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "mf_rootViewController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController transferController](self, "transferController"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1001331A4;
  v27[3] = &unk_10051A910;
  v23 = v19;
  v28 = v23;
  v29 = self;
  objc_msgSend(v21, "presentViewController:animated:completion:", v22, 1, v27);

}

- (unint64_t)_stackViewTransferOptions
{
  unint64_t v3;
  void *v4;
  unsigned int v5;
  void *v7;
  unsigned int v8;

  if (-[MessageListViewController isThreaded](self, "isThreaded"))
    v3 = 68;
  else
    v3 = 76;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
  v5 = +[EMMailbox shouldArchiveByDefaultForMailboxes:](EMMailbox, "shouldArchiveByDefaultForMailboxes:", v4);

  if (v5)
    return v3 | 0x10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
  v8 = +[EMMailbox deleteMovesToTrashForMailboxes:](EMMailbox, "deleteMovesToTrashForMailboxes:", v7);

  if (v8)
    return v3 | 0x20;
  else
    return v3;
}

- (MFTransferStackViewController)transferStackViewController
{
  MFTransferStackViewController *v3;
  void *v4;
  MFTransferStackViewController *v5;
  MFTransferStackViewController *transferStackViewController;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  if (!self->_transferStackViewController)
  {
    v3 = [MFTransferStackViewController alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
    v5 = -[MFTransferStackViewController initWithScene:](v3, "initWithScene:", v4);
    transferStackViewController = self->_transferStackViewController;
    self->_transferStackViewController = v5;

    -[MFTransferStackViewController setDataSource:](self->_transferStackViewController, "setDataSource:", self);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionView"));
  objc_msgSend(v8, "layoutMargins");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController view](self->_transferStackViewController, "view"));
  objc_msgSend(v17, "setLayoutMargins:", v10, v12, v14, v16);

  return self->_transferStackViewController;
}

- (void)_updateStackViewController
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController splitViewController](self, "splitViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollection"));
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  if (v5 == (id)2)
  {
    if (-[MessageListViewController _inMultiSelectionMode](self, "_inMultiSelectionMode"))
      -[MessageListViewController _setRowDeletionEnabled:animated:](self, "_setRowDeletionEnabled:animated:", 1, 0);
  }
}

- (BOOL)isTransferStackVisible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "splitViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "messageDetailNavController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));

  v7 = objc_opt_class(UINavigationController);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController transferStackViewController](self, "transferStackViewController"));
    v10 = v8 == v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)transferStackViewController:(id)a3 displayMessageForMessageListItemWithItemID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageListItemForItemID:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler globalAsyncSchedulerWithQualityOfService:](EFScheduler, "globalAsyncSchedulerWithQualityOfService:", 33));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "onScheduler:then:", v8, &stru_10051FF80));

  return v9;
}

- (id)transferStackViewController:(id)a3 itemIDsToDisplayFromItemIDs:(id)a4
{
  void *v4;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _BYTE v25[128];

  v18 = a3;
  v19 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v19, "count")));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v19;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource", v18));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "itemIDsInExpandedThread:", v12));

        v15 = objc_msgSend(v14, "count");
        v16 = v14;
        if (!v15)
        {
          v24 = v12;
          v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
          v16 = v4;
        }
        objc_msgSend(v7, "addObjectsFromArray:", v16);
        if (!v15)

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v9);
  }

  return v7;
}

- (void)_updateThreadingPreference:(id)a3
{
  unsigned __int8 v4;
  id v5;
  id v6;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state", a3));
  v4 = objc_msgSend(v5, "containsDraftsOrOutbox");

  if ((v4 & 1) == 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
    -[MessageListViewController setThreaded:](self, "setThreaded:", objc_msgSend(v6, "BOOLForKey:", DisableThreadingKey) ^ 1);

  }
}

- (void)_updateListForChange:(id)a3
{
  id v4;
  id v5;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController layoutValuesHelper](self, "layoutValuesHelper", a3));
  objc_msgSend(v4, "invalidate");

  -[MessageListViewController _invalidateCachedUseCompactRows](self, "_invalidateCachedUseCompactRows");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  objc_msgSend(v5, "reloadVisibleCellsInvalidatingCache:", 0);

}

- (id)leadingSwipeActionsConfigurationAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  objc_class *v14;
  NSString *v15;
  id v16;
  NSString *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  unsigned int v25;
  void *v26;
  id v27;
  void *v28;
  int64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  objc_class *v37;
  NSString *v38;
  void *v39;
  NSString *v40;
  void *v41;
  objc_class *v42;
  NSString *v43;
  void *v44;
  NSString *v45;
  void *v46;
  void *v47;
  void *v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  MessageListViewController *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;

  v5 = a3;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForItemAtIndexPath:", v5));

  v8 = objc_opt_class(MessageListCollectionViewCell);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellHelper"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "messageListItem"));

    if (!v10)
    {
      v12 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        v42 = (objc_class *)objc_opt_class(self);
        v43 = NSStringFromClass(v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
        v45 = NSStringFromSelector(a2);
        v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
        *(_DWORD *)buf = 138413058;
        v50 = v44;
        v51 = 2048;
        v52 = self;
        v53 = 2114;
        v54 = v46;
        v55 = 2114;
        v56 = v5;
        _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "<%@: %p> %{public}@: No message list item at index path: %{public}@", buf, 0x2Au);

      }
      goto LABEL_26;
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "messageListItemAtIndexPath:", v5));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "result"));

  if (!v12)
  {
    v35 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v37 = (objc_class *)objc_opt_class(self);
      v38 = NSStringFromClass(v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      v40 = NSStringFromSelector(a2);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      *(_DWORD *)buf = 138413058;
      v50 = v39;
      v51 = 2048;
      v52 = self;
      v53 = 2114;
      v54 = v41;
      v55 = 2114;
      v56 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "<%@: %p> %{public}@: Message list returned nil for index path: %{public}@", buf, 0x2Au);

    }
LABEL_26:
    v34 = 0;
    goto LABEL_27;
  }
  v13 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class(self);
    v15 = NSStringFromClass(v14);
    v16 = (id)objc_claimAutoreleasedReturnValue(v15);
    v17 = NSStringFromSelector(a2);
    v18 = (id)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject ef_publicDescription](v12, "ef_publicDescription"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "ef_mapSelector:", "ef_publicDescription"));
    *(_DWORD *)buf = 138413570;
    v50 = v16;
    v51 = 2048;
    v52 = self;
    v53 = 2112;
    v54 = v18;
    v55 = 2112;
    v56 = v5;
    v57 = 2112;
    v58 = v19;
    v59 = 2112;
    v60 = v21;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "<%@: %p> %@ %@, item: %@\nmailboxes: %@", buf, 0x3Eu);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
  v23 = objc_msgSend(v22, "isOutgoingMailbox");

  if ((v23 & 1) != 0)
    goto LABEL_18;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  v25 = objc_msgSend(v24, "BOOLForKey:", CFSTR("ShowSecondRightAction"));

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _swipeActionForTriageAction:indexPath:](self, "_swipeActionForTriageAction:indexPath:", 7, v5));
    objc_msgSend(v48, "ef_addOptionalObject:", v26);

  }
  v27 = sub_1001D6D14(0);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v29 = +[MFTriageActionUtilities triageActionForActionKey:](MFTriageActionUtilities, "triageActionForActionKey:", v28);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
  v31 = v30;
  if (v29)
  {
    if (v29 == 16)
    {
      if ((objc_msgSend(v30, "containsArchiveMailbox") & 1) != 0
        || (objc_msgSend(v31, "containsTrashMailbox") & 1) != 0)
      {
        goto LABEL_17;
      }
      if (-[NSObject shouldArchiveByDefault](v12, "shouldArchiveByDefault"))
        v29 = 8;
      else
        v29 = 9;
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _swipeActionForTriageAction:indexPath:](self, "_swipeActionForTriageAction:indexPath:", v29, v5));
    objc_msgSend(v48, "ef_addOptionalObject:", v32);

  }
LABEL_17:

LABEL_18:
  if (-[MessageListViewController _allowSettingReadLaterAction](self, "_allowSettingReadLaterAction"))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _swipeActionForTriageAction:indexPath:](self, "_swipeActionForTriageAction:indexPath:", 3, v5));
    objc_msgSend(v48, "ef_addOptionalObject:", v33);

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v48));
LABEL_27:

  return v34;
}

- (id)trailingSwipeActionsConfigurationAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  NSString *v21;
  id v22;
  NSString *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  int64_t v43;
  void *v44;
  objc_class *v45;
  NSString *v46;
  void *v47;
  NSString *v48;
  void *v49;
  objc_class *v50;
  NSString *v51;
  void *v52;
  NSString *v53;
  void *v54;
  unsigned int v55;
  void *v56;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  MessageListViewController *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  void *v69;

  v5 = a3;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "messageListItemAtIndexPath:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "result"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cellForItemAtIndexPath:", v5));

    v10 = objc_opt_class(MessageListCollectionViewCell);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      v11 = v9;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject cellHelper](v11, "cellHelper"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "messageListItem"));

      if (!v13)
      {
        v28 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          v50 = (objc_class *)objc_opt_class(self);
          v51 = NSStringFromClass(v50);
          v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
          v53 = NSStringFromSelector(a2);
          v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
          *(_DWORD *)buf = 138413058;
          v58 = v52;
          v59 = 2048;
          v60 = self;
          v61 = 2114;
          v62 = v54;
          v63 = 2114;
          v64 = v5;
          _os_log_fault_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "<%@: %p> %{public}@: No message list item at index path: %{public}@", buf, 0x2Au);

        }
        v34 = 0;
        goto LABEL_21;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject cellHelper](v11, "cellHelper"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "predictedMailbox"));

      if (!v15)
      {
        v69 = v7;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v69, 1));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[MFMoveToPredictionTriageInteraction predictMailboxForMovingMessages:](MFMoveToPredictionTriageInteraction, "predictMailboxForMovingMessages:", v16));

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject cellHelper](v11, "cellHelper"));
        objc_msgSend(v18, "setPredictedMailbox:", v17);

      }
    }
    v55 = objc_msgSend(v7, "shouldArchiveByDefault");
    v19 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (objc_class *)objc_opt_class(self);
      v21 = NSStringFromClass(v20);
      v22 = (id)objc_claimAutoreleasedReturnValue(v21);
      v23 = NSStringFromSelector(a2);
      v24 = (id)objc_claimAutoreleasedReturnValue(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_publicDescription"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailboxes](self, "mailboxes"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "ef_mapSelector:", "ef_publicDescription"));
      *(_DWORD *)buf = 138413570;
      v58 = v22;
      v59 = 2048;
      v60 = self;
      v61 = 2112;
      v62 = v24;
      v63 = 2112;
      v64 = v5;
      v65 = 2112;
      v66 = v25;
      v67 = 2112;
      v68 = v27;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "<%@: %p> %@ %@, item: %@\nmailboxes: %@", buf, 0x3Eu);

    }
    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v28 = objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
    if (!-[MessageListViewController _allowReadLaterActions](self, "_allowReadLaterActions")
      || (v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "readLater")),
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "date")),
          v31 = v30 == 0,
          v30,
          v29,
          v31))
    {
      if ((-[NSObject containsFollowUpMailbox](v28, "containsFollowUpMailbox") & 1) != 0
        || -[NSObject containsInbox](v28, "containsInbox")
        && (v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "followUp")),
            v36 = v35 == 0,
            v35,
            !v36))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _swipeActionForTriageAction:indexPath:](self, "_swipeActionForTriageAction:indexPath:", 5, v5));
        -[NSObject ef_addOptionalObject:](v11, "ef_addOptionalObject:", v37);

        v33 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _swipeActionForTriageAction:indexPath:](self, "_swipeActionForTriageAction:indexPath:", 1, v5));
        -[NSObject ef_addOptionalObject:](v11, "ef_addOptionalObject:", v33);
      }
      else
      {
        if (v55)
          v39 = 9;
        else
          v39 = 8;
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _swipeActionForTriageAction:indexPath:](self, "_swipeActionForTriageAction:indexPath:", v39, v5));
        -[NSObject ef_addOptionalObject:](v11, "ef_addOptionalObject:", v40);

        if ((-[NSObject containsDraftsOrOutbox](v28, "containsDraftsOrOutbox") & 1) != 0
          || (-[NSObject containsSendLaterMailbox](v28, "containsSendLaterMailbox") & 1) != 0)
        {
          goto LABEL_20;
        }
        v41 = sub_1001D6DCC(0);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        v43 = +[MFTriageActionUtilities triageActionForActionKey:](MFTriageActionUtilities, "triageActionForActionKey:", v42);

        if (v43)
        {
          if (v43 == 16)
          {
            if (v55)
              v43 = 8;
            else
              v43 = 9;
          }
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _swipeActionForTriageAction:indexPath:](self, "_swipeActionForTriageAction:indexPath:", v43, v5));
          -[NSObject ef_addOptionalObject:](v11, "ef_addOptionalObject:", v44);

        }
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _swipeActionForTriageAction:indexPath:](self, "_swipeActionForTriageAction:indexPath:", 1, v5));
        -[NSObject ef_addOptionalObject:](v11, "ef_addOptionalObject:", v33);
      }
    }
    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _swipeActionForTriageAction:indexPath:](self, "_swipeActionForTriageAction:indexPath:", 4, v5));
      -[NSObject ef_addOptionalObject:](v11, "ef_addOptionalObject:", v32);

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _swipeActionForTriageAction:indexPath:](self, "_swipeActionForTriageAction:indexPath:", 1, v5));
      -[NSObject ef_addOptionalObject:](v11, "ef_addOptionalObject:", v33);
    }

LABEL_20:
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v11));
LABEL_21:

    goto LABEL_22;
  }
  v9 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v45 = (objc_class *)objc_opt_class(self);
    v46 = NSStringFromClass(v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    v48 = NSStringFromSelector(a2);
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    *(_DWORD *)buf = 138413058;
    v58 = v47;
    v59 = 2048;
    v60 = self;
    v61 = 2114;
    v62 = v49;
    v63 = 2114;
    v64 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "<%@: %p> %{public}@: Message list returned nil for index path: %{public}@", buf, 0x2Au);

  }
  v34 = 0;
LABEL_22:

  return v34;
}

- (void)_clearVisibleSwipeActions
{
  id v3;
  _QWORD v4[4];
  id v5;

  if (-[MessageListViewController swipeActionVisible](self, "swipeActionVisible"))
  {
    if ((-[MessageListViewController isEditing](self, "isEditing") & 1) == 0)
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_1001348B8;
      v4[3] = &unk_10051AA98;
      v3 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
      v5 = v3;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v4);
      -[MessageListViewController setSwipeActionVisible:](self, "setSwipeActionVisible:", 0);

    }
  }
}

- (void)_prepareForMoveOrDestructiveInteraction:(id)a3 completion:(id)a4
{
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
  id v17;
  _QWORD v18[5];

  v17 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "messageListItemSelection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageListItems"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_map:", &stru_10051FFA0));
  -[MessageListViewController setSwipeActionVisible:](self, "setSwipeActionVisible:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageSelectionStrategy](self, "messageSelectionStrategy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "indexPathsForSelectedItems"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100134B3C;
  v18[3] = &unk_10051F790;
  v18[4] = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ef_map:", v18));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v12));

  if (objc_msgSend(v9, "shouldChangeSelectionAfterDeletedMessageItemIDs:selectedItemIDs:", v8, v13))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageSelectionStrategy](self, "messageSelectionStrategy"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "itemIDToSelectAfterDeletedMessageItemIDs:", v8));
    -[MessageListViewController setItemIDToSelectAfterMoveID:](self, "setItemIDToSelectAfterMoveID:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  objc_msgSend(v16, "deleteItemsWithIDs:animated:immediateCompletion:completion:", v8, 1, 1, v17);

}

- (void)_didPerformMoveOrDestructiveInteraction:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v5 = objc_msgSend(v4, "isInExpandedEnvironment");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "messageListItemSelection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageListItems"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_map:", &stru_10051FFC0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "referenceMessageListItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemID"));
    v12 = objc_msgSend(v8, "containsObject:", v11);

    if (v12)
      -[MessageListViewController _selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:showConversationView:](self, "_selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:showConversationView:", v8, 1);

  }
}

- (id)_swipeActionForTriageAction:(int64_t)a3 indexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD *v47;
  _QWORD *v48;
  void *v49;
  _QWORD v50[5];
  _QWORD v51[5];
  NSObject *v52;
  _QWORD v53[5];
  id v54;
  BOOL v55;
  _QWORD v56[5];
  NSObject *v57;
  _QWORD v58[5];
  id v59;
  int64_t v60;
  _QWORD v61[5];
  _QWORD v62[5];
  void *v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  MessageListViewController *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  id v71;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemIdentifierForIndexPath:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "messageListItemAtIndexPath:", v6));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "result"));

  if (v11)
  {
    v63 = v11;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v63, 1));
    -[MessageListViewController reportEngagementAction:onItemID:](self, "reportEngagementAction:onItemID:", 3, v8);
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_100135798;
    v62[3] = &unk_10051FF10;
    v62[4] = self;
    v48 = objc_retainBlock(v62);
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_100135844;
    v61[3] = &unk_10051B9C8;
    v61[4] = self;
    v47 = objc_retainBlock(v61);
    v12 = a3 == 4;
    if (!a3)
    {
      v16 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_10013589C;
    v58[3] = &unk_10051FFE8;
    v60 = a3;
    v58[4] = self;
    v59 = v6;
    v13 = objc_retainBlock(v58);
    v46 = v13;
    if (a3 == 2)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController undoManager](self, "undoManager"));
      a3 = objc_claimAutoreleasedReturnValue(+[MFFlagChangeTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:reason:](MFReadTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:reason:", v49, v17, 2, 2, 4));

      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_100135A84;
      v56[3] = &unk_10051B720;
      v56[4] = self;
      v57 = v46;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)a3, "swipeActionWithPreparation:completion:", 0, v56));
      v18 = v57;
    }
    else
    {
      switch(a3)
      {
        case 3:
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController undoManager](self, "undoManager"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[MFReadLaterTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:](MFReadLaterTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:", v49, v19, 2, 2));
          break;
        case 6:
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController undoManager](self, "undoManager"));
          a3 = objc_claimAutoreleasedReturnValue(+[MFFlagChangeTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:reason:](MFFlagTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:reason:", v49, v14, 2, 2, 4));

          objc_msgSend((id)a3, "setDelegate:", self);
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)a3, "swipeActionWithPreparation:completion:", 0, v46));
LABEL_7:
          v16 = (void *)v15;
          goto LABEL_19;
        case 4:
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController undoManager](self, "undoManager"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[MFReadLaterTriageInteractionState removeDateState](_TtC10MobileMail33MFReadLaterTriageInteractionState, "removeDateState"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[MFReadLaterTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:state:](MFReadLaterTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:state:", v49, v19, 2, 2, v21));

          break;
        default:
          switch(a3)
          {
            case 1:
              v24 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController undoManager](self, "undoManager"));
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[MFMoreTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:](MFMoreTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:", v49, v24, 2, 2));

              objc_msgSend(v25, "setDelegate:", self);
              v18 = v25;
              v50[0] = _NSConcreteStackBlock;
              v50[1] = 3221225472;
              v50[2] = sub_100135D7C;
              v50[3] = &unk_10051B9C8;
              v50[4] = self;
              v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject swipeActionWithPreparation:completion:](v18, "swipeActionWithPreparation:completion:", 0, v50));
              goto LABEL_17;
            case 5:
              v36 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController undoManager](self, "undoManager"));
              a3 = objc_claimAutoreleasedReturnValue(+[MFDestructiveTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:](MFRemoveFollowUpTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:", v49, v36, 2, 2));

              v15 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)a3, "swipeActionWithPreparation:completion:", v48, v47));
              goto LABEL_7;
            case 7:
              v42 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController undoManager](self, "undoManager"));
              v43 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
              a3 = objc_claimAutoreleasedReturnValue(+[MFMoveToPredictionTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:presentationSource:delegate:presentingViewController:predictedMailbox:](MFMoveToPredictionTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:presentationSource:delegate:presentingViewController:predictedMailbox:", v49, v42, 2, 2, v43, self, self, 0));

              v51[0] = _NSConcreteStackBlock;
              v51[1] = 3221225472;
              v51[2] = sub_100135C38;
              v51[3] = &unk_10051B720;
              v51[4] = self;
              v52 = v46;
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)a3, "swipeActionWithPreparation:completion:", 0, v51));
              v18 = v52;
              goto LABEL_18;
            case 8:
              v44 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController undoManager](self, "undoManager"));
              a3 = objc_claimAutoreleasedReturnValue(+[MFDestructiveTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:](MFDeleteTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:", v49, v44, 2, 2));

              v15 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)a3, "swipeActionWithPreparation:completion:", v48, v47));
              goto LABEL_7;
            case 9:
              v45 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController undoManager](self, "undoManager"));
              a3 = objc_claimAutoreleasedReturnValue(+[MFDestructiveTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:](MFArchiveTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:", v49, v45, 2, 2));

              v15 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)a3, "swipeActionWithPreparation:completion:", v48, v47));
              goto LABEL_7;
            case 10:
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController undoManager](self, "undoManager"));
              a3 = objc_claimAutoreleasedReturnValue(+[MFConversationFlagTriageInteraction interactionWithReferenceMessage:undoManager:origin:actor:](MFNotifyTriageInteraction, "interactionWithReferenceMessage:undoManager:origin:actor:", v11, v37, 2, 2));

              v38 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
              objc_msgSend((id)a3, "setPresentationSource:", v38);

              v15 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)a3, "swipeAction"));
              goto LABEL_7;
            case 11:
              v39 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController undoManager](self, "undoManager"));
              a3 = objc_claimAutoreleasedReturnValue(+[MFConversationFlagTriageInteraction interactionWithReferenceMessage:undoManager:origin:actor:](MFMuteTriageInteraction, "interactionWithReferenceMessage:undoManager:origin:actor:", v11, v39, 2, 2));

              v40 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
              objc_msgSend((id)a3, "setPresentationSource:", v40);

              v15 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)a3, "swipeAction"));
              goto LABEL_7;
            case 15:
              v41 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController undoManager](self, "undoManager"));
              a3 = objc_claimAutoreleasedReturnValue(+[MFFlagChangeTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:reason:](MFJunkTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:reason:", v49, v41, 2, 2, 4));

              v15 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)a3, "swipeAction"));
              goto LABEL_7;
            default:
              v29 = MFLogGeneral(v13);
              v18 = objc_claimAutoreleasedReturnValue(v29);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                sub_1003934BC(a3, v18, v30, v31, v32, v33, v34, v35);
              a3 = 0;
              v16 = 0;
              goto LABEL_18;
          }
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
      objc_msgSend(v20, "setPresentationSource:", v22);

      v18 = v20;
      -[NSObject setDelegate:](v18, "setDelegate:", self);
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_100135AF0;
      v53[3] = &unk_100520010;
      v55 = v12;
      v53[4] = self;
      v54 = v46;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject swipeActionWithPreparation:completion:](v18, "swipeActionWithPreparation:completion:", 0, v53));

LABEL_17:
      a3 = (int64_t)v18;
    }
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  a3 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
  {
    v26 = (objc_class *)objc_opt_class(self);
    v27 = NSStringFromClass(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    *(_DWORD *)buf = 138413058;
    v65 = v28;
    v66 = 2048;
    v67 = self;
    v68 = 2112;
    v69 = v8;
    v70 = 2112;
    v71 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)a3, OS_LOG_TYPE_ERROR, "<%@: %p> Failed to obtain messageListItem for itemID:%@ at indexPath:%@", buf, 0x2Au);

  }
  v16 = 0;
LABEL_21:

  return v16;
}

- (void)_reportReadTriageInteraction:(id)a3 didPerform:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    v14 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageListItemSelection"));
    v8 = objc_msgSend(v7, "isSelectAll");

    v6 = v14;
    if ((v8 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "messageListItemSelection"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "messageListItems"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemID"));

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
        objc_msgSend(v13, "didScheduleReadInteractionForItemID:", v12);

      }
      v6 = v14;
    }
  }

}

- (void)mailboxFilterPickerViewController:(id)a3 didFinishPickingWithSelectedFilters:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController filterViewModel](self, "filterViewModel"));
  objc_msgSend(v5, "setSelectedFilters:", v6);

  -[MessageListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[MessageListViewController setFiltersEnabled:](self, "setFiltersEnabled:", 1);
  if (_os_feature_enabled_impl("Mail", "AppStoreReviewPrompt"))
    -[MessageListViewController _appStoreReviewNotifyFilterCriterionIfNecessaryFor:](self, "_appStoreReviewNotifyFilterCriterionIfNecessaryFor:", v6);

}

- (void)didDismissMailboxFilterPickerViewController:(id)a3
{
  -[MessageListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_appStoreReviewNotifyFilterCriterionIfNecessaryFor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController filterViewModel](self, "filterViewModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "provider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultFilters"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));

  if ((objc_msgSend(v13, "isEqualToSet:", v7) & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appStoreReviewManager"));
    objc_msgSend(v9, "notifyCriterionMet:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appStoreReviewManager"));
      objc_msgSend(v12, "attemptToShowPromptIn:reason:", v10, 4);

    }
  }

}

- (id)referenceMessageListItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "referenceMessageListItem"));

  return v3;
}

- (void)setReferenceMessageListItem:(id)a3 referenceMessageList:(id)a4 showAsConversation:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  id v12;

  v6 = a6;
  v7 = a5;
  v12 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
  objc_msgSend(v11, "setReferenceMessageListItem:referenceMessageList:showAsConversation:animated:", v12, v10, v7, v6);

}

- (BOOL)conversationViewController:(id)a3 canAdvanceToNextConversationWithDirection:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = *(_QWORD *)&a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "referenceMessageListItem"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageSelectionStrategy](self, "messageSelectionStrategy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemIDToSelectFromItemID:withDirection:", v9, v4));

  return v10 != 0;
}

- (void)conversationViewController:(id)a3 advanceToNextConversationWithDirection:(int)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  NSString *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  MessageListViewController *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;

  v4 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "referenceMessageListItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageSelectionStrategy](self, "messageSelectionStrategy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "itemIDToSelectFromItemID:withDirection:", v10, v4));

  v12 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (objc_class *)objc_opt_class(self);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = 138413058;
    v19 = v15;
    v20 = 2048;
    v21 = self;
    v22 = 2112;
    v23 = v17;
    v24 = 2112;
    v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<%@: %p> %@ - next itemID:%@", (uint8_t *)&v18, 0x2Au);

  }
  -[MessageListViewController deselectSelectedItemsInCollectionView](self, "deselectSelectedItemsInCollectionView");
  -[MessageListViewController _handleDidSelectItemID:referenceItem:scrollToVisible:userInitiated:animated:](self, "_handleDidSelectItemID:referenceItem:scrollToVisible:userInitiated:animated:", v11, 0, 1, 1, 1);

}

- (BOOL)_shouldPopToMessageListViewControllerFromConversationViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  if ((objc_msgSend(v5, "isInExpandedEnvironment") & 1) != 0
    || !objc_msgSend(v4, "isFullyVisible"))
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "referenceMessageListItem"));
    v7 = v6 == 0;

  }
  return v7;
}

- (void)conversationViewController:(id)a3 willRemoveAllVisibleMessagesWithItemIDs:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  -[MessageListViewController _selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:showConversationView:](self, "_selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:showConversationView:", v6, objc_msgSend(v5, "isInExpandedEnvironment"));

}

- (void)conversationViewController:(id)a3 didRemoveAllVisibleMessagesWithItemIDs:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "referenceMessageListItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemID"));

  if (!v8 || objc_msgSend(v6, "containsObject:", v8))
    -[MessageListViewController _selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:conversationViewController:](self, "_selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:conversationViewController:", v6, v9);

}

- (void)selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
  -[MessageListViewController _selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:conversationViewController:](self, "_selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:conversationViewController:", v5, v4);

}

- (void)_selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:(id)a3 conversationViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  NSString *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  MessageListViewController *v21;
  __int16 v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  -[MessageListViewController _selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:showConversationView:](self, "_selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:showConversationView:", v6, objc_msgSend(v8, "isInExpandedEnvironment"));
  if (-[MessageListViewController _shouldPopToMessageListViewControllerFromConversationViewController:](self, "_shouldPopToMessageListViewControllerFromConversationViewController:", v7))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "isMessageListViewControllerVisible:", self);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "splitViewController"));
      objc_msgSend(v11, "showMessageListViewController:animated:completion:", 1, 1, 0);

    }
    else
    {
      v12 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class(self);
        v14 = NSStringFromClass(v13);
        v15 = (id)objc_claimAutoreleasedReturnValue(v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController navigationController](self, "navigationController"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "viewControllers"));
        v18 = 138412802;
        v19 = v15;
        v20 = 2048;
        v21 = self;
        v22 = 2112;
        v23 = v17;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<%@: %p>: didRemoveAllVisibleMessagesWithItemIDs navigationController.viewControllers:%@", (uint8_t *)&v18, 0x20u);

      }
    }
  }

}

- (void)_selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:(id)a3 showConversationView:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  MessageListViewController *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  void *v28;

  v4 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageSelectionStrategy](self, "messageSelectionStrategy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemIDToSelectAfterDeletedMessageItemIDs:", v7));

  v10 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (objc_class *)objc_opt_class(self);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138413570;
    v18 = v13;
    v19 = 2048;
    v20 = self;
    v21 = 2112;
    v22 = v15;
    v23 = 2112;
    v24 = v7;
    v25 = 1024;
    v26 = v4;
    v27 = 2112;
    v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<%@: %p> %@ - itemIDs:%@ showConversationView:%{BOOL}d nextItemID:%@", buf, 0x3Au);

  }
  LOBYTE(v16) = v4;
  -[MessageListViewController _handleDidSelectItemID:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:](self, "_handleDidSelectItemID:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:", v9, 0, 0, 0, 1, 0, v16);

}

- (id)conversationViewController:(id)a3 messagesToActOnForReferenceMessage:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messagesInMessageListItem:", v5));

  return v7;
}

- (id)conversationViewController:(id)a3 messageListItemWithItemID:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageListItemForItemID:", v5));

  return v7;
}

- (BOOL)conversationViewControllerShouldDismissOnDestructiveAction:(id)a3
{
  return 0;
}

- (BOOL)conversationViewControllerCanShowNoMessageSelectedView:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController noContentView](self, "noContentView", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  if (v5)
    v6 = (*((_BYTE *)self + 8) & 1) == 0;
  else
    v6 = 1;

  return v6;
}

- (void)conversationViewController:(id)a3 beginSearchWithSuggestion:(id)a4 scope:(id)a5
{
  -[MessageListViewController beginSearchWithSuggestion:scope:](self, "beginSearchWithSuggestion:scope:", a4, a5);
}

- (BOOL)shouldUseSelectionDataSourceForConversationViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel", a3));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mf_rootViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traitCollection"));
    v8 = +[UINavigationBar mf_shouldUseDesktopClassNavigationBarForTraitCollection:](UINavigationBar, "mf_shouldUseDesktopClassNavigationBarForTraitCollection:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)messageListItemSelectionForConversationViewController:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController _messageListItemSelectionCreateIfNeeded:](self, "_messageListItemSelectionCreateIfNeeded:", 0));
}

- (void)conversationViewController:(id)a3 performTriageAction:(int64_t)a4 presentationSource:(id)a5
{
  id v7;
  NSObject *v8;

  v7 = a5;
  if (a4 == 7)
  {
    sub_10012E064(self, v7);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      sub_100393570(a4, v8);

  }
}

- (void)conversationViewController:(id)a3 didPerform:(BOOL)a4 triageInteraction:(id)a5
{
  id v6;

  v6 = a5;
  if (-[MessageListViewController isEditing](self, "isEditing"))
  {
    -[MessageListViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  }
  else if (-[MessageListViewController _inMultiSelectionMode](self, "_inMultiSelectionMode")
         && objc_msgSend(v6, "isDestructive"))
  {
    sub_100129BD4(self, 1);
  }

}

- (id)messageTriageInteractionHelperForConversationViewController:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageTriageInteractionHelper](self, "messageTriageInteractionHelper", a3));
}

- (void)selectionModel:(id)a3 selectItemID:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForItemIdentifier:", v8));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
  objc_msgSend(v7, "selectItemAtIndexPath:animated:scrollPosition:", v6, 0, 0);

}

- (void)selectionModel:(id)a3 deselectItemID:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForItemIdentifier:", v8));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
  objc_msgSend(v7, "deselectItemAtIndexPath:animated:", v6, 0);

}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  objc_class *v16;
  NSString *v17;
  objc_class *v18;
  NSString *v19;
  id v20;
  NSString *v21;
  void *v22;
  int v23;
  id v24;
  __int16 v25;
  MessageListViewController *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  CGPoint v33;

  y = a5.y;
  x = a5.x;
  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v10, "count") == (id)1)
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  else
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "indexPathForItemAtPoint:", x, y));
  v12 = v11;
  if (v11)
    goto LABEL_8;
  v13 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v18 = (objc_class *)objc_opt_class(self);
    v19 = NSStringFromClass(v18);
    v20 = (id)objc_claimAutoreleasedReturnValue(v19);
    v33.x = x;
    v33.y = y;
    v21 = NSStringFromCGPoint(v33);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = 138413314;
    v24 = v20;
    v25 = 2048;
    v26 = self;
    v27 = 2112;
    v28 = v22;
    v29 = 2048;
    v30 = objc_msgSend(v10, "count");
    v31 = 2112;
    v32 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "<%@: %p> Failed to get orbed index path for point: %@, picking the first one from indexPaths (%lu): %@", (uint8_t *)&v23, 0x34u);

  }
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  if (v12)
  {
LABEL_8:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _contextMenuConfigurationForIndexPaths:orbedIndexPath:](self, "_contextMenuConfigurationForIndexPaths:orbedIndexPath:", v10, v12));
  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = (objc_class *)objc_opt_class(self);
      v17 = NSStringFromClass(v16);
      objc_claimAutoreleasedReturnValue(v17);
      sub_1003935E0();
    }
    v14 = 0;
  }

  return v14;
}

- (id)_contextMenuConfigurationForIndexPaths:(id)a3 orbedIndexPath:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  _BOOL8 v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  ConversationViewController *v17;
  NSObject *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id location;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[5];
  _BYTE v53[128];
  _BYTE buf[12];
  __int16 v55;
  ConversationViewController *v56;
  __int16 v57;
  void *v58;

  v7 = a3;
  v39 = a4;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1001378FC;
  v52[3] = &unk_10051FDA0;
  v52[4] = self;
  v37 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_compactMap:", v52));
  if (!objc_msgSend(v8, "count"))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageListViewController.m"), 5669, CFSTR("Failed to have itemIDs for provided indexPaths:%@"), v7);

  }
  if (objc_msgSend(v8, "count") == (id)1
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel")),
        v10 = objc_msgSend(v9, "isSelectAll"),
        v9,
        v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v12 = -[MessageListViewController _shouldShowItemIDAsConversation:](self, "_shouldShowItemIDAsConversation:", v11);

    v13 = 1;
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "messageListItemAtIndexPath:", v39));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "result"));

  if (v13)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
    v17 = -[ConversationViewController initWithScene:]([ConversationViewController alloc], "initWithScene:", v16);
    -[ConversationViewControllerBase setDelegate:](v17, "setDelegate:", self);
    -[ConversationViewControllerBase setIsPrimary:](v17, "setIsPrimary:", 1);
    -[ConversationViewController setBeingPreviewed:](v17, "setBeingPreviewed:", 1);
    v18 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v20;
      v55 = 2112;
      v56 = v17;
      v57 = 2112;
      v58 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ - %@ - %@", buf, 0x20u);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController searchController](self, "searchController"));
    -[ConversationViewControllerBase setMessagesShowSourceMailbox:](v17, "setMessagesShowSourceMailbox:", objc_msgSend(v22, "isActive"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "messageListAtSectionIndex:", objc_msgSend(v39, "section")));
    -[ConversationViewController setReferenceMessageListItem:referenceMessageList:showAsConversation:animated:](v17, "setReferenceMessageListItem:referenceMessageList:showAsConversation:animated:", v38, v24, v12, 1);

    -[MessageListViewController setPreviewConversationViewController:](self, "setPreviewConversationViewController:", v17);
  }
  else
  {
    v17 = 0;
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v25 = v8;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v27)
          objc_enumerationMutation(v25);
        -[MessageListViewController reportEngagementAction:onItemID:](self, "reportEngagementAction:onItemID:", 1, *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i));
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v26);
  }

  v29 = v25;
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v17);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "itemID"));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100137970;
  v45[3] = &unk_100520038;
  objc_copyWeak(&v46, &location);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100137A3C;
  v40[3] = &unk_100520060;
  objc_copyWeak(&v44, (id *)buf);
  v41 = v29;
  v31 = v41;
  v42 = v31;
  v32 = v38;
  v43 = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", v30, v45, v40));

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
  objc_msgSend(v33, "setBadgeCount:", objc_msgSend(v34, "count"));

  objc_destroyWeak(&v44);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return v33;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSString *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _BYTE buf[12];
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v11 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController previewConversationViewController](self, "previewConversationViewController"));
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v13;
    v19 = 2112;
    v20 = v14;
    v21 = 2112;
    v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ - %@ - %@", buf, 0x20u);

  }
  if (v10)
  {
    -[MessageListViewController setPreviewConversationViewController:](self, "setPreviewConversationViewController:", 0);
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100137D2C;
    v15[3] = &unk_10051B9A0;
    objc_copyWeak(&v17, (id *)buf);
    v16 = v10;
    objc_msgSend(v9, "addAnimations:", v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }

}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  NSObject *v8;
  NSString *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;

  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    v10 = (id)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController previewConversationViewController](self, "previewConversationViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v13 = 138412802;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ - %@ - %@", (uint8_t *)&v13, 0x20u);

  }
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  NSObject *v8;
  NSString *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;

  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    v10 = (id)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController previewConversationViewController](self, "previewConversationViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v13 = 138412802;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ - %@ - %@", (uint8_t *)&v13, 0x20u);

  }
  -[MessageListViewController setPreviewConversationViewController:](self, "setPreviewConversationViewController:", 0);

}

- (id)_previewActionsForItemIDs:(id)a3 orbedItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  unsigned __int8 v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  unsigned __int8 v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v65;
  void *v66;
  void *v67;
  _QWORD *v68;
  unsigned int v69;
  _QWORD *v70;
  _QWORD *v71;
  unsigned int v72;
  _QWORD v73[5];
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  MessageListViewController *v84;
  id v85;
  id v86;
  _QWORD v87[5];
  _QWORD v88[5];
  uint64_t v89;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController messageListSelectionModel](self, "messageListSelectionModel"));
  if ((objc_msgSend(v8, "isSelectAll") & 1) == 0)
  {
    v9 = objc_msgSend(v6, "count");

    if (!v9)
      goto LABEL_32;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messageListItemsForItemIDs:", v6));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture combine:](EFFuture, "combine:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "result"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ef_filter:", EFIsNotNull));

    if (!objc_msgSend(v14, "count"))
    {
      v9 = 0;
LABEL_31:

      goto LABEL_32;
    }
    v72 = objc_msgSend(v7, "isEditable");
    v69 = objc_msgSend(v7, "shouldArchiveByDefault");
    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472;
    v88[2] = sub_100138B4C;
    v88[3] = &unk_100520088;
    v88[4] = self;
    v15 = objc_retainBlock(v88);
    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472;
    v87[2] = sub_100138C00;
    v87[3] = &unk_1005200B0;
    v87[4] = self;
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_100138CB8;
    v82[3] = &unk_100520100;
    v68 = objc_retainBlock(v87);
    v85 = v68;
    v16 = v6;
    v83 = v16;
    v71 = v15;
    v86 = v71;
    v84 = self;
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_100138F7C;
    v80[3] = &unk_100520128;
    v70 = objc_retainBlock(v82);
    v81 = v70;
    v17 = objc_retainBlock(v80);
    v74 = 0;
    v75 = &v74;
    v76 = 0x3032000000;
    v77 = sub_10012AB90;
    v78 = sub_10012ABA0;
    v79 = (id)0xAAAAAAAAAAAAAAAALL;
    v79 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_100138FA0;
    v73[3] = &unk_100520150;
    v73[4] = &v74;
    v18 = objc_retainBlock(v73);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemID"));
    v20 = ((uint64_t (*)(_QWORD *, void *))v71[2])(v71, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    if ((v72 & 1) != 0)
    {
LABEL_19:
      if ((v69 & (v72 ^ 1)) != 0)
        v52 = 9;
      else
        v52 = 8;
      v53 = ((uint64_t (*)(_QWORD *, uint64_t, void *, void *))v17[2])(v17, v52, v14, v21);
      v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
      ((void (*)(_QWORD *, void *))v18[2])(v18, v54);

      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "senderList"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "firstObject"));

      if (v56)
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
        v58 = objc_msgSend(v57, "containsDraftsMailbox");

        if ((v58 & 1) == 0)
        {
          if (objc_msgSend(v7, "isBlocked"))
            v59 = 19;
          else
            v59 = 18;
          v60 = ((uint64_t (*)(_QWORD *, uint64_t, void *, void *))v17[2])(v17, v59, v14, v21);
          v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
          ((void (*)(_QWORD *, void *))v18[2])(v18, v61);

        }
      }
      if (sub_10012FDD4(self, v14))
      {
        v62 = ((uint64_t (*)(_QWORD *, uint64_t, void *, void *))v17[2])(v17, 20, v14, v21);
        v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
        ((void (*)(_QWORD *, void *))v18[2])(v18, v63);

      }
      v9 = (id)v75[5];

      _Block_object_dispose(&v74, 8);
      goto LABEL_31;
    }
    if (objc_msgSend(v16, "count") == (id)1)
    {
      v22 = ((uint64_t (*)(_QWORD *, uint64_t, void *, void *, _QWORD))v70[2])(v70, 12, v14, v21, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      ((void (*)(_QWORD *, void *))v18[2])(v18, v23);

      v24 = ((uint64_t (*)(_QWORD *, uint64_t, void *, void *, _QWORD))v70[2])(v70, 13, v14, v21, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      ((void (*)(_QWORD *, void *))v18[2])(v18, v25);

      v26 = ((uint64_t (*)(_QWORD *, uint64_t, void *, void *, _QWORD))v70[2])(v70, 14, v14, v21, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      ((void (*)(_QWORD *, void *))v18[2])(v18, v27);

      v66 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_100531B00, 0, 0, 1, v75[5]));
      objc_msgSend(v66, "setPreferredElementSize:", 1);
      v28 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v29 = (void *)v75[5];
      v75[5] = v28;

      ((void (*)(_QWORD *, void *))v18[2])(v18, v66);
      v30 = ((uint64_t (*)(_QWORD *, uint64_t, void *, void *))v17[2])(v17, 17, v14, v21);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      v32 = (void *)v31;
      if (v31)
      {
        v89 = v31;
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v89, 1));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_100531B00, 0, 0, 1, v33));
        ((void (*)(_QWORD *, void *))v18[2])(v18, v34);

      }
    }
    v35 = objc_alloc_init((Class)NSMutableArray);
    v36 = ((uint64_t (*)(_QWORD *, uint64_t, void *, void *))v17[2])(v17, 6, v14, v21);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    objc_msgSend(v35, "ef_addOptionalObject:", v37);

    v38 = ((uint64_t (*)(_QWORD *, uint64_t, void *, void *))v17[2])(v17, 2, v14, v21);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    objc_msgSend(v35, "ef_addOptionalObject:", v39);

    v40 = ((uint64_t (*)(_QWORD *, uint64_t, void *, void *))v17[2])(v17, 15, v14, v21);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    objc_msgSend(v35, "ef_addOptionalObject:", v41);

    if (objc_msgSend(v35, "count") == (id)1)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "firstObject"));
      ((void (*)(_QWORD *, void *))v18[2])(v18, v42);
    }
    else
    {
      if ((unint64_t)objc_msgSend(v35, "count") < 2)
      {
LABEL_16:
        v44 = ((uint64_t (*)(_QWORD *, uint64_t, void *, void *))v17[2])(v17, 10, v14, v21);
        v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
        ((void (*)(_QWORD *, void *))v18[2])(v18, v45);

        v46 = ((uint64_t (*)(_QWORD *, uint64_t, void *, void *))v17[2])(v17, 11, v14, v21);
        v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
        ((void (*)(_QWORD *, void *))v18[2])(v18, v47);

        v48 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
        v49 = objc_msgSend(v48, "containsSendLaterMailbox");

        if ((v49 & 1) == 0)
        {
          v50 = ((uint64_t (*)(_QWORD *, uint64_t, void *, void *))v17[2])(v17, 7, v14, v21);
          v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
          ((void (*)(_QWORD *, void *))v18[2])(v18, v51);

        }
        goto LABEL_19;
      }
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("MARK_SUBMENU_TITLE"), &stru_100531B00, CFSTR("Main")));
      v67 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphMarkElipsis));
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", v65, v67, 0, 0, v35));
      ((void (*)(_QWORD *, void *))v18[2])(v18, v43);

    }
    goto LABEL_16;
  }

  v9 = 0;
LABEL_32:

  return v9;
}

- (void)mailStatusViewControllerUndoButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "daemonInterface"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "outgoingMessageRepository"));

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001390E8;
  v7[3] = &unk_10051A848;
  v7[4] = self;
  objc_msgSend(v6, "cancelLastDelayedMessage:", v7);

}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (a4 && EFProtectedDataAvailable(self, a2))
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
    objc_msgSend(v13, "reloadVisibleCellsInvalidatingCache:", 1);

  }
  else if ((unint64_t)(a3 - 1) <= 1)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "preparedCells"));

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v11, "messageListItemFetchTimeoutCancelable") & 1) != 0)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "messageListItemFetchTimeoutCancelable"));
            objc_msgSend(v12, "cancel");

          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
}

- (id)_mailActionsViewDataSourceForMailActionsViewController:(id)a3 messageListItem:(id)a4 predictedMailbox:(id)a5 indexPath:(id)a6 cell:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  MailActionsViewDataSource *v15;
  id v16;
  _QWORD *v17;
  id v18;
  MailActionsViewDataSource *v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a7;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v10);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001396A0;
  v25[3] = &unk_10051B338;
  objc_copyWeak(&v27, &location);
  v25[4] = self;
  v13 = v12;
  v26 = v13;
  v14 = objc_retainBlock(v25);
  v15 = [MailActionsViewDataSource alloc];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001398D8;
  v21[3] = &unk_100520198;
  v21[4] = self;
  v16 = v10;
  v22 = v16;
  v17 = v14;
  v24 = v17;
  v18 = v11;
  v23 = v18;
  v19 = -[MailActionsViewDataSource initWithBuilderBlock:](v15, "initWithBuilderBlock:", v21);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v19;
}

- (void)mailActionsViewController:(id)a3 didSelectAction:(id)a4
{
  _objc_msgSend(a4, "executeHandlerIfEnabled", a3);
}

- (id)_displayMetrics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayMetrics"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayMetrics"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController traitCollection](self, "traitCollection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
    objc_msgSend(v7, "layoutMargins");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
    objc_msgSend(v16, "safeAreaInsets");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:](MFMessageDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:", v5, objc_msgSend(v25, "interfaceOrientation"), v9, v11, v13, v15, v18, v20, v22, v24));

  }
  return v6;
}

- (id)messageContentRepresentationRequestForMessageTriageInteractionHelper:(id)a3 message:(id)a4
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a4;
  v5 = objc_opt_class(EMMessage);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCompositionTriageInteraction compositionRepresentationRequestForMessage:](MFMessageCompositionTriageInteraction, "compositionRepresentationRequestForMessage:", v4));
  else
    v6 = 0;

  return v6;
}

- (id)messageListForMessageTriageInteractionHelper:(id)a3 messageListItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageListForMessageListItemWithIdentifier:", v7));

  return v8;
}

- (id)messageTriageInteractionHelper:(id)a3 senderRepositoryForMessageListItems:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "daemonInterface"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "senderRepository"));

  return v6;
}

- (int64_t)unreadBadgeCountForMessageTriageInteractionHelper:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController mailStatusObserver](self, "mailStatusObserver", a3));
  v4 = objc_msgSend(v3, "badgeCount");

  return (int64_t)v4;
}

- (id)moreTriageInteraction:(id)a3 actionsViewControllerWithInteractionTarget:(id)a4 didDismissHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double Width;
  MailActionViewHeader *v21;
  void *v22;
  void *v23;
  ConversationCellViewModel *v24;
  id v25;
  ConversationCellViewModel *v26;
  MailActionsViewController *v27;
  id v28;
  MailActionsViewController *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSString *v35;
  _BOOL4 IsAccessibilityCategory;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id location;
  _QWORD v49[4];
  id v50;
  MessageListViewController *v51;
  CGRect v52;

  v43 = a3;
  v8 = a4;
  v9 = a5;
  -[MessageListViewController setTriageInteractionTarget:](self, "setTriageInteractionTarget:", v8, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "messageListItem"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemID"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "indexPathForItemIdentifier:", v12));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cellForItemAtIndexPath:", v44));

  v42 = v14;
  v15 = objc_opt_class(MessageListCollectionViewCell);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cellHelper"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "predictedMailbox"));

  }
  else
  {
    v40 = 0;
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _displayMetrics](self, "_displayMetrics"));
  +[MailActionViewHeader defaultHeightWithDisplayMetrics:](MailActionViewHeader, "defaultHeightWithDisplayMetrics:", v41);
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
  objc_msgSend(v19, "frame");
  Width = CGRectGetWidth(v52);

  v21 = -[MailActionViewHeader initWithFrame:]([MailActionViewHeader alloc], "initWithFrame:", 0.0, 0.0, Width, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController contactStore](self, "contactStore"));
  -[MFMessageConversationViewCell setContactStore:](v21, "setContactStore:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageDisplayMetrics mf_actionCardMetricsFromDisplayMetrics:](MFMessageDisplayMetrics, "mf_actionCardMetricsFromDisplayMetrics:", v41));
  -[MFConversationViewCell setDisplayMetrics:](v21, "setDisplayMetrics:", v23);

  v24 = [ConversationCellViewModel alloc];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10013A364;
  v49[3] = &unk_10051B0F0;
  v25 = v8;
  v50 = v25;
  v51 = self;
  v26 = -[ConversationCellViewModel initWithBuilder:](v24, "initWithBuilder:", v49);
  -[MFCollapsedMessageCell setViewModel:](v21, "setViewModel:", v26);

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v27 = [MailActionsViewController alloc];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10013A530;
  v45[3] = &unk_10051B270;
  objc_copyWeak(&v47, &location);
  v28 = v9;
  v46 = v28;
  v29 = -[MailActionsViewController initWithDelegate:messageHeaderView:didDismissHandler:](v27, "initWithDelegate:messageHeaderView:didDismissHandler:", self, v21, v45);
  v30 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v29);
  objc_msgSend(v30, "setModalPresentationStyle:", 7);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "presentationController"));
  objc_msgSend(v31, "setDelegate:", self);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "presentationSource"));
  if ((objc_opt_respondsToSelector(v32, "mui_setAsSourceWithExtendedRectForPopoverPresentationController:") & 1) != 0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "popoverPresentationController"));
    objc_msgSend(v32, "mui_setAsSourceWithExtendedRectForPopoverPresentationController:", v33);

  }
  if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
  {
    objc_msgSend(v41, "mailActionCardPreferredHeightForPad");
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController traitCollection](self, "traitCollection"));
    v35 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "preferredContentSizeCategory"));
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v35);

    if (IsAccessibilityCategory)
      -[MailActionsViewController approximateHeightNeededForAccessibilityContentSizeCategory](v29, "approximateHeightNeededForAccessibilityContentSizeCategory");
    -[MailActionsViewController preferredContentSize](v29, "preferredContentSize");
    objc_msgSend(v30, "setPreferredContentSize:");
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "primaryMessage"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _mailActionsViewDataSourceForMailActionsViewController:messageListItem:predictedMailbox:indexPath:cell:](self, "_mailActionsViewDataSourceForMailActionsViewController:messageListItem:predictedMailbox:indexPath:cell:", v29, v37, v40, v44, v42));
  -[MailActionsViewController setDataSource:](v29, "setDataSource:", v38);

  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);

  return v30;
}

- (void)presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[2];

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(UISheetPresentationController);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentedViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _mailActionsViewControllerFromPresentedViewController:](self, "_mailActionsViewControllerFromPresentedViewController:", v9));

    if (v10)
    {
      v11 = v7;
      objc_msgSend(v11, "_setShouldDismissWhenTappedOutside:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController _displayMetrics](self, "_displayMetrics"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10013A7C8;
      v17[3] = &unk_1005201C0;
      v18 = v10;
      v13 = v12;
      v19 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UISheetPresentationControllerDetent _detentWithIdentifier:resolutionContextBlock:](UISheetPresentationControllerDetent, "_detentWithIdentifier:resolutionContextBlock:", CFSTR("MessageListViewControllerCustomMediumDetent"), v17));
      v20[0] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UISheetPresentationControllerDetent largeDetent](UISheetPresentationControllerDetent, "largeDetent"));
      v20[1] = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
      objc_msgSend(v11, "setDetents:", v16);

    }
  }

}

- (void)presentationControllerWillDismiss:(id)a3
{
  void *v4;
  id v5;

  if (!-[MessageListViewController showingPopoverViewController](self, "showingPopoverViewController", a3))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController transitionCoordinator](self, "transitionCoordinator"));
    objc_msgSend(v5, "mf_interactiveDeselectAllSelectedIndexPathsUsingTransitionCoordinator:animated:", v4, 1);

  }
}

- (id)_mailActionsViewControllerFromPresentedViewController:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  v4 = objc_opt_class(UINavigationController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topViewController"));
    v6 = objc_opt_class(MailActionsViewController);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
    {

LABEL_6:
      v5 = 0;
    }
  }
  else
  {
    v7 = objc_opt_class(MailActionsViewController);
    if ((objc_opt_isKindOfClass(v3, v7) & 1) == 0)
      goto LABEL_6;
    v5 = v3;
  }

  return v5;
}

- (id)labelForStateCapture
{
  void *v2;
  id v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10012AB90;
  v10 = sub_10012ABA0;
  v11 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_10013ACEC, &unk_10051ACE8, self, &v6));
  objc_msgSend(v2, "performSyncBlock:", &v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)itemIDsForStateCaptureWithErrorString:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_10012AB90;
  v13 = sub_10012ABA0;
  v14 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_10013AE50, &unk_10051D620, self, &v9));
  objc_msgSend(v4, "performSyncBlock:", &v8);

  v5 = (void *)v10[5];
  if (v5)
  {
    if (a3)
    {
      *a3 = 0;
      v5 = (void *)v10[5];
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemIdentifiers"));
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)parsecEventQueuePerformBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController session](self, "session"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController parsecEventQueue](self, "parsecEventQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10013AF88;
  v9[3] = &unk_10051B3B0;
  v7 = v4;
  v11 = v7;
  v8 = v5;
  v10 = v8;
  objc_msgSend(v6, "performBlock:", v9);

}

- (void)reportEngagementAction:(int64_t)a3 onItemID:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;
  int64_t v9;

  v6 = a4;
  if (-[MessageListViewController isSearchViewController](self, "isSearchViewController"))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10013B048;
    v7[3] = &unk_1005201E8;
    v8 = v6;
    v9 = a3;
    -[MessageListViewController parsecEventQueuePerformBlock:](self, "parsecEventQueuePerformBlock:", v7);

  }
}

- (void)currentFocusChanged:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  MessageListViewController *v8;
  id v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MessageListViewController;
  -[MessageListViewController currentFocusChanged:](&v10, "currentFocusChanged:", v4);
  v8 = self;
  v5 = v4;
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_10013B1E8, &unk_10051A910, v8));
  objc_msgSend(v6, "performSyncBlock:", &v7);

}

- (BOOL)_allowSettingReadLaterAction
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  if (_os_feature_enabled_impl("Mail", "RemindMeEverywhere"))
    return -[MessageListViewController _allowReadLaterActions](self, "_allowReadLaterActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
  if ((objc_msgSend(v4, "isOutgoingMailbox") & 1) != 0
    || !-[MessageListViewController _allowReadLaterActions](self, "_allowReadLaterActions"))
  {
    v6 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
    v6 = objc_msgSend(v5, "containsOnlyInboxScope");

  }
  return v6;
}

- (BOOL)_allowReadLaterActions
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController state](self, "state"));
  v3 = objc_msgSend(v2, "canShowReadLaterDate");

  return v3;
}

- (void)_configureHighlightsView:(id)a3 withinView:(id)a4
{
  id v6;
  id v7;
  UIVisualEffectView *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  id v18;
  double v19;
  UIVisualEffectView *v20;
  id v21;
  UIVisualEffectView *v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  _QWORD v39[4];
  UIVisualEffectView *v40;
  double v41;
  id v42;
  _QWORD v43[4];
  UIVisualEffectView *v44;
  id v45;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = objc_opt_new(UIVisualEffectView);
  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0, v8);
  v9 = +[MUIIntelligenceLightDefaults preferredMessageListLightEffect](MUIIntelligenceLightDefaults, "preferredMessageListLightEffect");
  +[MUIIntelligenceLightDefaults preferredMessageListAnimationDuration](MUIIntelligenceLightDefaults, "preferredMessageListAnimationDuration");
  v11 = v10;
  +[MUIIntelligenceLightDefaults preferredMessageListAnimationDelay](MUIIntelligenceLightDefaults, "preferredMessageListAnimationDelay");
  v13 = v12;
  +[MUIIntelligenceLightDefaults preferredMessageListEndingAnimationDelayFactor](MUIIntelligenceLightDefaults, "preferredMessageListEndingAnimationDelayFactor");
  v15 = v14;
  v16 = +[MUIIntelligenceLightDefaults preferredMessageListBeginningAnimationCurve](MUIIntelligenceLightDefaults, "preferredMessageListBeginningAnimationCurve");
  v17 = +[MUIIntelligenceLightDefaults preferredMessageListEndingAnimationCurve](MUIIntelligenceLightDefaults, "preferredMessageListEndingAnimationCurve");
  v18 = objc_alloc((Class)UIViewPropertyAnimator);
  v19 = v11 * v15;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10013B7FC;
  v43[3] = &unk_10051ABD8;
  v45 = v9;
  v20 = v8;
  v44 = v20;
  v21 = objc_msgSend(v18, "initWithDuration:curve:animations:", v16, v43, v19);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10013BA08;
  v39[3] = &unk_100520210;
  v41 = v11 - v19;
  v42 = v17;
  v22 = v20;
  v40 = v22;
  objc_msgSend(v21, "addCompletion:", v39);
  objc_msgSend(v21, "startAnimationAfterDelay:", v13);
  +[MUIIntelligenceLightDefaults preferredMessageListBackgroundCornerRadius](MUIIntelligenceLightDefaults, "preferredMessageListBackgroundCornerRadius");
  v24 = v23;
  -[UIVisualEffectView _setCornerRadius:](v22, "_setCornerRadius:");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](v22, "layer"));
  objc_msgSend(v25, "setCornerRadius:", v24);

  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor")));
  v27 = objc_msgSend(v26, "CGColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](v22, "layer"));
  objc_msgSend(v28, "setBorderColor:", v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v29, "scale");
  v31 = v30;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](v22, "layer"));
  objc_msgSend(v32, "setBorderWidth:", 1.0 / v31);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](v22, "layer"));
  objc_msgSend(v33, "setCornerCurve:", kCACornerCurveContinuous);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
  objc_msgSend(v34, "layoutMargins");
  v36 = v35;
  v38 = v37;

  objc_msgSend(v7, "setLayoutMargins:", 0.0, v36, 6.0, v38);
  objc_msgSend(v7, "addSubview:", v22);
  -[UIVisualEffectView mf_pinToView:usingLayoutMargins:](v22, "mf_pinToView:usingLayoutMargins:", v7, 1);
  objc_msgSend(v7, "insertSubview:aboveSubview:", v6, v22);
  objc_msgSend(v6, "mf_pinToView:usingLayoutMargins:", v7, 1);
  -[MessageListViewController setHighlightsVisualEffectView:](self, "setHighlightsVisualEffectView:", v22);

}

- (void)_updateHighlightsBorderColorIfNecessary
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  if (_os_feature_enabled_impl("Mail", "CatchUpHighlights"))
  {
    if (EMIsGreymatterAvailableWithOverride())
    {
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor")));
      v3 = objc_msgSend(v6, "CGColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController highlightsVisualEffectView](self, "highlightsVisualEffectView"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
      objc_msgSend(v5, "setBorderColor:", v3);

    }
  }
}

- (void)messageListDataSource:(id)a3 didConfigureSupplementaryView:(id)a4 elementKind:(id)a5 section:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;

  v32 = a4;
  v9 = a5;
  v10 = a6;
  if (_os_feature_enabled_impl("Mail", "CatchUpHighlights"))
  {
    if (EMIsGreymatterAvailableWithOverride())
    {
      if (objc_msgSend(v9, "isEqualToString:", UICollectionElementKindSectionHeader))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "section"));
        v12 = (void *)MessageListSectionRecent;

        if (v11 == v12)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController highlightedMessagesViewController](self, "highlightedMessagesViewController"));
          v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));

          if (v15)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "subviews"));
            v19 = objc_msgSend(v18, "containsObject:", v15);

            if ((v19 & 1) == 0)
              -[MessageListViewController _configureHighlightsView:withinView:](self, "_configureHighlightsView:withinView:", v15, v32);
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController view](self, "view"));
          v21 = objc_msgSend(v20, "effectiveUserInterfaceLayoutDirection");

          objc_msgSend(v32, "layoutMargins");
          v23 = v22;
          objc_msgSend(v32, "layoutMargins");
          if (v21 == (id)1)
            v26 = v24;
          else
            v26 = v25;
          objc_msgSend(v32, "layoutMargins");
          v28 = v27;
          objc_msgSend(v32, "layoutMargins");
          if (v21 == (id)1)
            v31 = v30;
          else
            v31 = v29;
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController highlightedMessagesViewController](self, "highlightedMessagesViewController"));
          +[MUIHighlightedMessagesViewControllerFactory updateContainerInsets:forViewController:](MUIHighlightedMessagesViewControllerFactory, "updateContainerInsets:forViewController:", v16, v23, v26, v28, v31);
          goto LABEL_19;
        }
      }
    }
  }
  if (_os_feature_enabled_impl("Mail", "SearchIndexing"))
  {
    if (objc_msgSend(v9, "isEqualToString:", UICollectionElementKindSectionFooter))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "section"));
      v14 = (void *)MessageListSectionIndexedSearch;

      if (v13 == v14)
      {
        v15 = v32;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController indexStatus](self, "indexStatus"));
        objc_msgSend(v15, "updateWith:", v16);
LABEL_19:

      }
    }
  }

}

- (BOOL)isIndexingMessagesForMessageListDataSource:(id)a3
{
  void *v4;
  unsigned __int8 v5;

  if (!_os_feature_enabled_impl("Mail", "SearchIndexing"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController indexStatus](self, "indexStatus"));
  v5 = objc_msgSend(v4, "isVisible");

  return v5;
}

- (void)messageListSectionDataSource:(id)a3 handleRowSelectionAfterMovingMessagesWithItemIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[4];
  id v22;
  MessageListViewController *v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController itemIDToSelectAfterMoveID](self, "itemIDToSelectAfterMoveID"));
  -[MessageListViewController setItemIDToSelectAfterMoveID:](self, "setItemIDToSelectAfterMoveID:", 0);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10013C16C;
  v21[3] = &unk_100520238;
  v9 = v8;
  v22 = v9;
  v23 = self;
  v10 = objc_retainBlock(v21);
  if (v9 && (objc_msgSend(v7, "containsObject:", v9) & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "section"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "messageListItemForItemID:section:", v9, v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10013C268;
    v18[3] = &unk_100520260;
    v15 = v9;
    v19 = v15;
    v20 = v10;
    objc_msgSend(v13, "onScheduler:addSuccessBlock:", v14, v18);

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10013C2E4;
    v16[3] = &unk_10051B140;
    v17 = v15;
    objc_msgSend(v13, "addFailureBlock:", v16);

  }
}

- (void)messageListSectionDataSource:(id)a3 deletedMessagesWithItemIdentifiers:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)MessageListViewController;
  -[MessageListViewController messageListSectionDataSource:deletedMessagesWithItemIdentifiers:](&v8, "messageListSectionDataSource:deletedMessagesWithItemIdentifiers:", v6, v7);
  -[MessageListViewController _removeMessagesFromStackWithItemIDs:](self, "_removeMessagesFromStackWithItemIDs:", v7);
  -[MessageListViewController _exitMultiSelectionForce:](self, "_exitMultiSelectionForce:", 0);

}

- (void)messageListSectionDataSource:(id)a3 didConfigureCell:(id)a4 atIndexPath:(id)a5 item:(id)a6 itemWasCached:(BOOL)a7 duration:(double)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSMutableSet *v18;
  void *v19;
  unsigned int v20;
  NSObject *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  NSMutableSet *indexPathsForConfiguredCollectionViewCells;
  NSObject *v27;
  objc_class *v28;
  NSString *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  objc_class *v36;
  NSString *v37;
  id v38;
  id v39;
  id v40;
  objc_class *v41;
  NSString *v42;
  id v43;
  id v44;
  id v45;
  int v46;
  id v47;
  __int16 v48;
  MessageListViewController *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  NSMutableSet *v55;
  __int16 v56;
  double v57;
  __int16 v58;
  int v59;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  objc_msgSend(v15, "associateViewWithEntityFromMessageItem:", v17);
  if (!-[MessageListViewController firstBatchCellConfigurationCompleted](self, "firstBatchCellConfigurationCompleted"))
  {
    if (self)
      indexPathsForConfiguredCollectionViewCells = self->_indexPathsForConfiguredCollectionViewCells;
    else
      indexPathsForConfiguredCollectionViewCells = 0;
    v18 = indexPathsForConfiguredCollectionViewCells;
    v27 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (objc_class *)objc_opt_class(self);
      v29 = NSStringFromClass(v28);
      v30 = (id)objc_claimAutoreleasedReturnValue(v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "itemID"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ef_publicDescription"));
      v46 = 138544130;
      v47 = v30;
      v48 = 2048;
      v49 = self;
      v50 = 2114;
      v51 = v31;
      v52 = 2114;
      v53 = v32;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Mark item (id: %{public}@) at index path: %{public}@ as configured", (uint8_t *)&v46, 0x2Au);

    }
    -[NSMutableSet addObject:](v18, "addObject:", v16);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "messageList"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectID"));
    -[MessageListViewController _checkMessageListLoadingCompleted:](self, "_checkMessageListLoadingCompleted:", v34);

    goto LABEL_22;
  }
  v18 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "itemID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController lastSelectedItemID](self, "lastSelectedItemID"));
  if (!-[NSMutableSet isEqual:](v18, "isEqual:", v19))
  {

    if (a7)
      goto LABEL_23;
    goto LABEL_15;
  }
  v20 = +[UIDevice mf_isPad](UIDevice, "mf_isPad");

  if (v20)
  {
    v21 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (objc_class *)objc_opt_class(self);
      v23 = NSStringFromClass(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v46 = 138543618;
      v47 = v24;
      v48 = 2048;
      v49 = self;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Selected message changed - update conversation bar button items", (uint8_t *)&v46, 0x16u);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController"));
    objc_msgSend(v25, "_updateBarButtonsEnabled");

  }
  if (!a7)
  {
LABEL_15:
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController cellsController](self, "cellsController"));
    if (objc_msgSend(v33, "wasItemRecentlyVisible:", v18))
    {
      if (a8 < 0.005)
      {
        v35 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          v41 = (objc_class *)objc_opt_class(self);
          v42 = NSStringFromClass(v41);
          v43 = (id)objc_claimAutoreleasedReturnValue(v42);
          v44 = objc_msgSend(v16, "section");
          v45 = objc_msgSend(v16, "item");
          v46 = 138544898;
          v47 = v43;
          v48 = 2048;
          v49 = self;
          v50 = 2048;
          v51 = v44;
          v52 = 2048;
          v53 = v45;
          v54 = 2114;
          v55 = v18;
          v56 = 2048;
          v57 = a8;
          v58 = 1024;
          v59 = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "<%{public}@: %p> Cell probably did not flicker at indexPath: (%ld-%ld), itemID: %{public}@, duration: %.3f, cached: %{BOOL}d", (uint8_t *)&v46, 0x44u);

        }
      }
      else
      {
        v35 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = (objc_class *)objc_opt_class(self);
          v37 = NSStringFromClass(v36);
          v38 = (id)objc_claimAutoreleasedReturnValue(v37);
          v39 = objc_msgSend(v16, "section");
          v40 = objc_msgSend(v16, "item");
          v46 = 138544898;
          v47 = v38;
          v48 = 2048;
          v49 = self;
          v50 = 2048;
          v51 = v39;
          v52 = 2048;
          v53 = v40;
          v54 = 2114;
          v55 = v18;
          v56 = 2048;
          v57 = a8;
          v58 = 1024;
          v59 = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "<%{public}@: %p> Cell may have flickered at indexPath: (%ld-%ld), itemID: %{public}@, duration: %.3f, cached: %{BOOL}d", (uint8_t *)&v46, 0x44u);

        }
      }

      objc_msgSend(v33, "reportFlickeringCell:duration:", a8 >= 0.005, a8);
    }
LABEL_22:

    v18 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[MessageListViewController cellsController](self, "cellsController"));
    -[NSMutableSet reportCellDidLoad:error:](v18, "reportCellDidLoad:error:", 1, 0);
  }
LABEL_23:

}

- (void)_checkMessageListLoadingCompleted:(id)a3
{
  id v4;
  NSSet *v5;
  NSMutableSet *indexPathsForConfiguredCollectionViewCells;
  NSMutableSet *v7;
  NSObject *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  NSMutableSet *v12;
  uint64_t v13;
  NSObject *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  void *v21;
  __int16 v22;
  MessageListViewController *v23;
  __int16 v24;
  id v25;

  v4 = a3;
  if (self)
  {
    v5 = self->_indexPathsForVisibleCellsAfterFirstBatch;
    indexPathsForConfiguredCollectionViewCells = self->_indexPathsForConfiguredCollectionViewCells;
  }
  else
  {
    v5 = 0;
    indexPathsForConfiguredCollectionViewCells = 0;
  }
  v7 = indexPathsForConfiguredCollectionViewCells;
  if (-[NSSet isSubsetOfSet:](v5, "isSubsetOfSet:", v7))
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class(self);
      v10 = NSStringFromClass(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v20 = 138543874;
      v21 = v11;
      v22 = 2048;
      v23 = self;
      v24 = 2048;
      v25 = -[NSMutableSet count](v7, "count");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> All initial visible items (%lu) have been configured!", (uint8_t *)&v20, 0x20u);

    }
    -[MessageListViewController setFirstBatchCellConfigurationCompleted:](self, "setFirstBatchCellConfigurationCompleted:", 1);
    -[MessageListViewController setInitialCellConfigurationCompleted:](self, "setInitialCellConfigurationCompleted:", 1);
    sub_10003EC58((uint64_t)self, 0);
    if (self)
      v12 = self->_indexPathsForConfiguredCollectionViewCells;
    else
      v12 = 0;
    v13 = MFMessageListLoadingSignpostLog(-[NSMutableSet removeAllObjects](v12, "removeAllObjects"));
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = os_signpost_id_make_with_pointer(v14, v4);

    v17 = MFMessageListLoadingSignpostLog(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = v18;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      LOWORD(v20) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, v15, "MessageListLoading", "Finished loading message list enableTelemetry=YES ", (uint8_t *)&v20, 2u);
    }

  }
}

- (void)messageListSectionDataSource:(id)a3 addMessagesToStackWithItemIDs:(id)a4
{
  -[MessageListViewController _addMessagesToStackWithItemIDs:](self, "_addMessagesToStackWithItemIDs:", a4);
}

- (void)showBlankCellAlertForMessageListSectionDataSource:(id)a3 itemID:(id)a4 indexPath:(id)a5 reason:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n\nitemID: %@\nindexPath: (%ld, %ld)"), v11, v9, objc_msgSend(v10, "section"), objc_msgSend(v10, "item")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Blank Cell Detected"), v13, 1));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Continue"), 1, 0));
  objc_msgSend(v14, "addAction:", v15);

  if (+[MSRadarURLBuilder canOpenRadar](MSRadarURLBuilder, "canOpenRadar"))
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10013CED4;
    v17[3] = &unk_1005202D0;
    v18 = v11;
    v19 = v12;
    v20 = v9;
    v21 = v10;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("TTR"), 0, v17));
    objc_msgSend(v14, "addAction:", v16);

  }
  -[MessageListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);

}

- (Class)sectionListCellClassForMessageListSectionDataSource:(id)a3
{
  uint64_t v3;

  v3 = objc_opt_class(MessageListCollectionViewCell);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v3);
}

- (int64_t)selectionModel:(id)a3 countDeleteMovesToTrashForItemIDs:(id)a4
{
  return sub_10013D20C(self, a4, &stru_100520310);
}

- (int64_t)selectionModel:(id)a3 countForItemIDs:(id)a4
{
  return sub_10013D20C(self, a4, &stru_100520330);
}

- (int64_t)selectionModel:(id)a3 countShouldArchiveByDefaultForItemIDs:(id)a4
{
  return sub_10013D20C(self, a4, &stru_100520350);
}

- (int64_t)selectionModel:(id)a3 countSupportsArchivingForItemIDs:(id)a4
{
  return sub_10013D20C(self, a4, &stru_100520370);
}

- (BOOL)selectionModel:(id)a3 isItemIDExpandedThread:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v7 = objc_msgSend(v6, "isExpandedThread:", v5);

  return v7;
}

- (BOOL)selectionModel:(id)a3 isThreadedItemID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageListItemForItemID:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "result"));
  v9 = (unint64_t)objc_msgSend(v8, "count") > 1;

  return v9;
}

- (id)selectionModel:(id)a3 itemIDsInExpandedThread:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIDsInExpandedThread:", v5));

  return v7;
}

- (id)selectionModel:(id)a3 messageListItemsForItemIDs:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageListItemsForItemIDs:", v5));

  return v7;
}

- (id)selectionModel:(id)a3 objectIDsForItemIDs:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[5];

  v5 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10013D820;
  v16[3] = &unk_100520398;
  v16[4] = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ef_compactMap:", v16));
  v7 = objc_msgSend(v5, "count");
  if (v7 != objc_msgSend(v6, "count"))
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100393768((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);

  }
  return v6;
}

- (id)selectionModel:(id)a3 threadItemIDForItemInExpandedThread:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "threadItemIDForItemInExpandedThread:", v5));

  return v7;
}

- (id)selectionModel:(id)a3 predictMailboxForMovingMessagesWithIDs:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue(+[MFMoveToPredictionTriageInteraction predictMailboxForMovingMessagesWithIDs:](MFMoveToPredictionTriageInteraction, "predictMailboxForMovingMessagesWithIDs:", a4));
}

- (void)updateFilterByUnreadRules
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MailTipsHelper shared](_TtC10MobileMail14MailTipsHelper, "shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController dataSource](self, "dataSource"));
  objc_msgSend(v4, "updateFilterByUnreadRulesWithAmountOfEmails:amountOfUnreads:", objc_msgSend(v3, "numberOfItems"), -[MessageListViewController currentUnreadCount](self, "currentUnreadCount"));

}

- (void)filterPickerViewModelDidChangeSelectedAccounts:(id)a3
{
  id v4;

  if (-[MessageListViewController isFocusFilterEnabled](self, "isFocusFilterEnabled", a3))
  {
    -[MessageListViewController setPrimitiveFocusFilterEnabled:](self, "setPrimitiveFocusFilterEnabled:", 0);
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController delegate](self, "delegate"));
    objc_msgSend(v4, "messageListViewControllerRequiresPaletteUpdate:disableFocusFilter:", self, 1);

  }
}

- (void)setToolbarItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController parentViewController](self, "parentViewController"));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setToolbarItems:animated:", v6, v4);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MessageListViewController;
    -[MessageListViewController setToolbarItems:animated:](&v9, "setToolbarItems:animated:", v6, v4);
  }

}

- (UINavigationItem)mf_navigationItem
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController navigationItemToConfigure](self, "navigationItemToConfigure"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController navigationItem](self, "navigationItem"));
  v6 = v5;

  return (UINavigationItem *)v6;
}

- (void)configureNavigationItem:(id)a3 forViewController:(id)a4
{
  id v5;

  v5 = a3;
  -[MessageListViewController setNavigationItemToConfigure:](self, "setNavigationItemToConfigure:");
  -[MessageListViewController _updateTitle](self, "_updateTitle");
  -[MessageListViewController _configureSearch](self, "_configureSearch");
  -[MessageListViewController updateBarButtons](self, "updateBarButtons");

}

- (void)invalidateNavigationItem:(id)a3 forViewController:(id)a4
{
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setTitle:", 0);
  objc_msgSend(v5, "setSearchController:", 0);
  objc_msgSend(v5, "setRightBarButtonItems:", 0);
  objc_msgSend(v5, "setLeftBarButtonItems:", 0);
  objc_msgSend(v5, "setBackBarButtonItem:", 0);
  objc_msgSend(v5, "setBackButtonTitle:", 0);
  -[MessageListViewController setNavigationItemToConfigure:](self, "setNavigationItemToConfigure:", 0);

}

- (void)highlightedMessagesController:(id)a3 didFindMessages:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController highlightedMessages](self, "highlightedMessages"));
  if ((EFObjectsAreEqual(v8, v7) & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController highlightedMessagesViewController](self, "highlightedMessagesViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "superview"));
    v9 = v12 != 0;

  }
  v13.receiver = self;
  v13.super_class = (Class)MessageListViewController;
  -[MessageListViewController highlightedMessagesController:didFindMessages:](&v13, "highlightedMessagesController:didFindMessages:", v6, v7);
  if (v9)
    -[MessageListViewController _invalidateCollectionLayoutForHighlights](self, "_invalidateCollectionLayoutForHighlights");

}

- (void)highlightedMessagesViewDidSelectMessage:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "messageListItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController highlightedMessagesController](self, "highlightedMessagesController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "messageList"));
  BYTE2(v6) = 1;
  LOWORD(v6) = 256;
  -[MessageListViewController _showConversationViewWithMessageListItem:itemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:indexPath:](self, "_showConversationViewWithMessageListItem:itemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:indexPath:", v7, 0, v5, v7, 0, 1, v6, 0);

}

- (void)highlightedMessagesViewDidProvideFeedbackForMessage:(id)a3 feedbackType:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "messageListItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayMessage"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "result"));

  +[MUICatchUpFeedbackController provideHighlightsFeedbackWithType:message:sourceViewController:](MUICatchUpFeedbackController, "provideHighlightsFeedbackWithType:message:sourceViewController:", a4, v8, self);
}

- (void)_invalidateCollectionLayoutForHighlights
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionViewLayout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController highlightedMessagesViewController](self, "highlightedMessagesViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));

  v8 = objc_opt_class(MUIHighlightedMessagesReusableView);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathForSupplementaryView:", v7))) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](NSIndexPath, "indexPathWithIndex:", 0));
  }
  v10 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(v4), "invalidationContextClass"));
  v12 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  objc_msgSend(v10, "invalidateSupplementaryElementsOfKind:atIndexPaths:", UICollectionElementKindSectionHeader, v11);

  objc_msgSend(v4, "invalidateLayoutWithContext:", v10);
}

- (BOOL)_shouldShowHighlights
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!_os_feature_enabled_impl("Mail", "CatchUpHighlights")
    || !EMIsGreymatterAvailableWithOverride())
  {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController showHighlights](self, "showHighlights"));
  if (objc_msgSend(v3, "isEnabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController highlightedMessages](self, "highlightedMessages"));
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_generativeModelsAvailabilityDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MessageListViewController;
  -[MessageListViewController _generativeModelsAvailabilityDidChange:](&v5, "_generativeModelsAvailabilityDidChange:", v4);
  -[MessageListViewController updateBarButtons](self, "updateBarButtons");
  -[MessageListViewController reloadDataSource](self, "reloadDataSource");

}

- (EMCollectionItemID)lastAutoSelectedItemID
{
  return self->_lastAutoSelectedItemID;
}

- (void)setLastAutoSelectedItemID:(id)a3
{
  objc_storeStrong((id *)&self->_lastAutoSelectedItemID, a3);
}

- (MessageListViewControllerDelegate)delegate
{
  return (MessageListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setConversationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_conversationViewController, a3);
}

- (MailboxPickerDelegate)mailboxPickerDelegate
{
  return (MailboxPickerDelegate *)objc_loadWeakRetained((id *)&self->_mailboxPickerDelegate);
}

- (FavoritesShortcutsProvider)favoritesShortcutsProvider
{
  return self->_favoritesShortcutsProvider;
}

- (void)setFavoritesShortcutsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_favoritesShortcutsProvider, a3);
}

- (id)updateScrollableHintBlock
{
  return self->_updateScrollableHintBlock;
}

- (UIViewController)tipPopoverController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_tipPopoverController);
}

- (void)setTipPopoverController:(id)a3
{
  objc_storeWeak((id *)&self->_tipPopoverController, a3);
}

- (void)setFilterButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_filterButtonItem, a3);
}

- (EMCollectionItemID)loadingMessageItemID
{
  return self->_loadingMessageItemID;
}

- (void)setLoadingMessageItemID:(id)a3
{
  objc_storeStrong((id *)&self->_loadingMessageItemID, a3);
}

- (MessageListSelectionModel)previousMessageListSelectionModel
{
  return self->_previousMessageListSelectionModel;
}

- (void)setMessageListDragDropHelper:(id)a3
{
  objc_storeStrong((id *)&self->_messageListDragDropHelper, a3);
}

- (NSArray)messageListItems
{
  return self->_messageListItems;
}

- (void)setMessageListItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (UIButton)composeAccessoryButton
{
  return self->_composeAccessoryButton;
}

- (void)setComposeAccessoryButton:(id)a3
{
  objc_storeStrong((id *)&self->_composeAccessoryButton, a3);
}

- (UIButton)moreAccessoryButton
{
  return self->_moreAccessoryButton;
}

- (void)setMoreAccessoryButton:(id)a3
{
  objc_storeStrong((id *)&self->_moreAccessoryButton, a3);
}

- (void)setFilterPickerButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_filterPickerButtonItem, a3);
}

- (void)setFilterPickerControl:(id)a3
{
  objc_storeStrong((id *)&self->_filterPickerControl, a3);
}

- (UINavigationItem)navigationItemToConfigure
{
  return self->_navigationItemToConfigure;
}

- (void)setNavigationItemToConfigure:(id)a3
{
  objc_storeStrong((id *)&self->_navigationItemToConfigure, a3);
}

- (void)setComposeButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_composeButtonItem, a3);
}

- (UIBarButtonItem)searchEditButtonItem
{
  return self->_searchEditButtonItem;
}

- (void)setSearchEditButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_searchEditButtonItem, a3);
}

- (NSArray)searchToolbarItems
{
  return self->_searchToolbarItems;
}

- (void)setSearchToolbarItems:(id)a3
{
  objc_storeStrong((id *)&self->_searchToolbarItems, a3);
}

- (NSArray)multiEditToolbarButtonItems
{
  return self->_multiEditToolbarButtonItems;
}

- (void)setMultiEditToolbarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_multiEditToolbarButtonItems, a3);
}

- (NSArray)searchMultiEditToolbarButtonItems
{
  return self->_searchMultiEditToolbarButtonItems;
}

- (void)setSearchMultiEditToolbarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_searchMultiEditToolbarButtonItems, a3);
}

- (void)setDeleteButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_deleteButtonItem, a3);
}

- (void)setMoveButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_moveButtonItem, a3);
}

- (void)setMarkButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_markButtonItem, a3);
}

- (void)setSelectAllButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_selectAllButtonItem, a3);
}

- (void)setShelfButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_shelfButtonItem, a3);
}

- (UIBarButtonItem)configureButtonItem
{
  return self->_configureButtonItem;
}

- (void)setConfigureButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_configureButtonItem, a3);
}

- (UIBarButtonItem)selectButtonItem
{
  return self->_selectButtonItem;
}

- (void)setSelectButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_selectButtonItem, a3);
}

- (void)setShouldSelectInitialMessage:(BOOL)a3
{
  self->_shouldSelectInitialMessage = a3;
}

- (void)setNoContentView:(id)a3
{
  objc_storeStrong((id *)&self->_noContentView, a3);
}

- (ConversationViewController)previewConversationViewController
{
  return self->_previewConversationViewController;
}

- (void)setPreviewConversationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_previewConversationViewController, a3);
}

- (void)setTransferStackViewController:(id)a3
{
  objc_storeStrong((id *)&self->_transferStackViewController, a3);
}

- (MFTransferSplitViewController)transferController
{
  return self->_transferController;
}

- (void)setTransferController:(id)a3
{
  objc_storeStrong((id *)&self->_transferController, a3);
}

- (NSString)messageListType
{
  return self->_messageListType;
}

- (void)setMailStatusViewController:(id)a3
{
  objc_storeStrong((id *)&self->_mailStatusViewController, a3);
}

- (void)setMailStatusObserver:(id)a3
{
  objc_storeStrong((id *)&self->_mailStatusObserver, a3);
}

- (unint64_t)currentUnreadCount
{
  return self->_currentUnreadCount;
}

- (CGPoint)lastScrolledContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastScrolledContentOffset.x;
  y = self->_lastScrolledContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastScrolledContentOffset:(CGPoint)a3
{
  self->_lastScrolledContentOffset = a3;
}

- (double)nextAvailableLoadMoreInterval
{
  return self->_nextAvailableLoadMoreInterval;
}

- (void)setNextAvailableLoadMoreInterval:(double)a3
{
  self->_nextAvailableLoadMoreInterval = a3;
}

- (NSMutableSet)resolvedMailboxObjectIDs
{
  return self->_resolvedMailboxObjectIDs;
}

- (EFFuture)stateRestorationFuture
{
  return self->_stateRestorationFuture;
}

- (void)setStateRestorationFuture:(id)a3
{
  objc_storeStrong((id *)&self->_stateRestorationFuture, a3);
}

- (EFPromise)scrollItemIndexPathPromise
{
  return self->_scrollItemIndexPathPromise;
}

- (void)setScrollItemIndexPathPromise:(id)a3
{
  objc_storeStrong((id *)&self->_scrollItemIndexPathPromise, a3);
}

- (void)setMessageTriageInteractionHelper:(id)a3
{
  objc_storeStrong((id *)&self->_messageTriageInteractionHelper, a3);
}

- (MFTriageInteractionTarget)triageInteractionTarget
{
  return self->_triageInteractionTarget;
}

- (void)setTriageInteractionTarget:(id)a3
{
  objc_storeStrong((id *)&self->_triageInteractionTarget, a3);
}

- (EMCollectionItemIDStateCapturer)stateCapturer
{
  return self->_stateCapturer;
}

- (EFPromise)selectionPromise
{
  return self->_selectionPromise;
}

- (void)setSelectionPromise:(id)a3
{
  objc_storeStrong((id *)&self->_selectionPromise, a3);
}

- (void)setIsRefreshing:(id)a3
{
  objc_storeStrong((id *)&self->_isRefreshing, a3);
}

- (UIVisualEffectView)highlightsVisualEffectView
{
  return self->_highlightsVisualEffectView;
}

- (void)setHighlightsVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightsVisualEffectView, a3);
}

- (NSString)currentUserTypedPhrase
{
  return self->_currentUserTypedPhrase;
}

- (void)setCurrentUserTypedPhrase:(id)a3
{
  objc_storeStrong((id *)&self->_currentUserTypedPhrase, a3);
}

- (BOOL)disableAutoSelectionOfInitialMessage
{
  return self->_disableAutoSelectionOfInitialMessage;
}

- (void)setDisableAutoSelectionOfInitialMessage:(BOOL)a3
{
  self->_disableAutoSelectionOfInitialMessage = a3;
}

- (MSParsecSearchSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (EFScheduler)parsecEventQueue
{
  return self->_parsecEventQueue;
}

- (void)setParsecEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_parsecEventQueue, a3);
}

- (MUISearchIndexStatus)indexStatus
{
  return self->_indexStatus;
}

- (void)setIndexStatus:(id)a3
{
  objc_storeStrong((id *)&self->_indexStatus, a3);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_indexStatus, 0);
  objc_storeStrong((id *)&self->_parsecEventQueue, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_currentUserTypedPhrase, 0);
  objc_storeStrong((id *)&self->_highlightsVisualEffectView, 0);
  objc_storeStrong((id *)&self->_isRefreshing, 0);
  objc_storeStrong((id *)&self->_selectionPromise, 0);
  objc_storeStrong((id *)&self->_searchMessagesInteraction, 0);
  objc_storeStrong((id *)&self->_changeFilterStateInteraction, 0);
  objc_storeStrong((id *)&self->_keyboardFocusedItemID, 0);
  objc_storeStrong((id *)&self->_indexPathsForVisibleCellsAfterFirstBatch, 0);
  objc_storeStrong((id *)&self->_indexPathsForConfiguredCollectionViewCells, 0);
  objc_storeStrong((id *)&self->_stateCapturer, 0);
  objc_storeStrong((id *)&self->_triageInteractionTarget, 0);
  objc_storeStrong((id *)&self->_messageTriageInteractionHelper, 0);
  objc_storeStrong((id *)&self->_scrollItemIndexPathPromise, 0);
  objc_storeStrong((id *)&self->_stateRestorationFuture, 0);
  objc_storeStrong((id *)&self->_mailboxBrowseActivityPayload, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_resolvedMailboxObjectIDs, 0);
  objc_storeStrong((id *)&self->_mailStatusObserver, 0);
  objc_storeStrong((id *)&self->_mailStatusViewController, 0);
  objc_storeStrong((id *)&self->_messageListType, 0);
  objc_storeStrong((id *)&self->_transferController, 0);
  objc_storeStrong((id *)&self->_transferStackViewController, 0);
  objc_storeStrong((id *)&self->_previewConversationViewController, 0);
  objc_storeStrong((id *)&self->_messageListSearchViewController, 0);
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_selectButtonItem, 0);
  objc_storeStrong((id *)&self->_configureButtonItem, 0);
  objc_storeStrong((id *)&self->_shelfButtonItem, 0);
  objc_storeStrong((id *)&self->_selectAllButtonItem, 0);
  objc_storeStrong((id *)&self->_markButtonItem, 0);
  objc_storeStrong((id *)&self->_moveButtonItem, 0);
  objc_storeStrong((id *)&self->_deleteButtonItem, 0);
  objc_storeStrong((id *)&self->_searchMultiEditToolbarButtonItems, 0);
  objc_storeStrong((id *)&self->_multiEditToolbarButtonItems, 0);
  objc_storeStrong((id *)&self->_searchToolbarItems, 0);
  objc_storeStrong((id *)&self->_searchEditButtonItem, 0);
  objc_storeStrong((id *)&self->_multiEditButtonItem, 0);
  objc_storeStrong((id *)&self->_composeButtonItem, 0);
  objc_storeStrong((id *)&self->_navigationItemToConfigure, 0);
  objc_storeStrong((id *)&self->_filterPickerControl, 0);
  objc_storeStrong((id *)&self->_filterPickerButtonItem, 0);
  objc_storeStrong((id *)&self->_moreAccessoryButton, 0);
  objc_storeStrong((id *)&self->_composeAccessoryButton, 0);
  objc_storeStrong((id *)&self->_flattenedMailboxesFuture, 0);
  objc_storeStrong((id *)&self->_messageListItems, 0);
  objc_storeStrong((id *)&self->_messageListDragDropHelper, 0);
  objc_storeStrong((id *)&self->_previousMessageListSelectionModel, 0);
  objc_storeStrong((id *)&self->_loadingMessageItemID, 0);
  objc_storeStrong((id *)&self->_filterButtonItem, 0);
  objc_destroyWeak((id *)&self->_tipPopoverController);
  objc_storeStrong(&self->_updateScrollableHintBlock, 0);
  objc_storeStrong(&self->_scrollableHintBlock, 0);
  objc_storeStrong((id *)&self->_favoritesShortcutsProvider, 0);
  objc_destroyWeak((id *)&self->_mailboxPickerDelegate);
  objc_storeStrong((id *)&self->_conversationViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastAutoSelectedItemID, 0);
  objc_storeStrong((id *)&self->_lastSelectedItemID, 0);
  objc_storeStrong((id *)&self->_refreshControl, 0);
}

- (void)setupTipsObserver
{
  MessageListViewController *v3;

  swift_getObjectType();
  v3 = self;
  sub_1002F52C0();

}

- (void)dismissTip
{
  MessageListViewController *v3;

  swift_getObjectType();
  v3 = self;
  MessageListViewController.dismissTip()();

}

@end
