@implementation RemindersListAddPersonController

- (RemindersListAddPersonController)initWithAllowsPhoneNumbers:(BOOL)a3
{
  RemindersListAddPersonController *v4;
  RemindersListAddPersonController *v5;
  id v6;
  void *v7;
  void *v8;
  CNComposeRecipientTextView *v9;
  CNComposeRecipientTextView *composeView;
  void *v11;
  CNAutocompleteResultsTableViewController *v12;
  CNAutocompleteResultsTableViewController *searchResultsViewController;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)RemindersListAddPersonController;
  v4 = -[RemindersListAddPersonController init](&v15, "init");
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend((id)objc_opt_class(v4), "titleString");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RemindersListAddPersonController navigationItem](v5, "navigationItem"));
    objc_msgSend(v8, "setTitle:", v7);

    v9 = (CNComposeRecipientTextView *)objc_msgSend(objc_alloc((Class)CNComposeRecipientTextView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    composeView = v5->_composeView;
    v5->_composeView = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    -[CNComposeRecipientTextView setAddresses:](v5->_composeView, "setAddresses:", v11);

    v12 = (CNAutocompleteResultsTableViewController *)objc_alloc_init((Class)CNAutocompleteResultsTableViewController);
    searchResultsViewController = v5->_searchResultsViewController;
    v5->_searchResultsViewController = v12;

    -[CNAutocompleteResultsTableViewController setDelegate:](v5->_searchResultsViewController, "setDelegate:", v5);
    v5->_allowsPhoneNumbers = a3;
  }
  return v5;
}

+ (id)titleString
{
  return 0;
}

+ (id)composeLabel
{
  return 0;
}

- (void)loadView
{
  void *v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  UIScrollView *v8;
  UIScrollView *composeScrollView;
  id v10;

  v10 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v10, "setAutoresizingMask:", 18);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  objc_msgSend(v10, "setBackgroundColor:", v3);

  +[CNComposeRecipientTextView preferredHeight](CNComposeRecipientTextView, "preferredHeight");
  v5 = v4;
  -[CNComposeRecipientTextView setFrame:](self->_composeView, "setFrame:", 0.0, 0.0, 0.0, v4);
  -[CNComposeRecipientTextView setAutoresizingMask:](self->_composeView, "setAutoresizingMask:", 2);
  v6 = objc_msgSend((id)objc_opt_class(self), "composeLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[CNComposeRecipientTextView setLabel:](self->_composeView, "setLabel:", v7);

  -[CNComposeRecipientTextView setDelegate:](self->_composeView, "setDelegate:", self);
  v8 = (UIScrollView *)objc_msgSend(objc_alloc((Class)UIScrollView), "initWithFrame:", 0.0, 0.0, 0.0, v5);
  composeScrollView = self->_composeScrollView;
  self->_composeScrollView = v8;

  -[UIScrollView setAutoresizingMask:](self->_composeScrollView, "setAutoresizingMask:", 2);
  -[UIScrollView addSubview:](self->_composeScrollView, "addSubview:", self->_composeView);
  objc_msgSend(v10, "addSubview:", self->_composeScrollView);
  -[RemindersListAddPersonController setView:](self, "setView:", v10);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RemindersListAddPersonController;
  -[RemindersListAddPersonController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[CNComposeRecipientTextView becomeFirstResponder](self->_composeView, "becomeFirstResponder");
}

- (void)viewSafeAreaInsetsDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RemindersListAddPersonController;
  -[RemindersListAddPersonController viewSafeAreaInsetsDidChange](&v12, "viewSafeAreaInsetsDidChange");
  -[UIScrollView frame](self->_composeScrollView, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RemindersListAddPersonController view](self, "view"));
  objc_msgSend(v9, "safeAreaInsets");
  v11 = v10;

  -[UIScrollView setFrame:](self->_composeScrollView, "setFrame:", v4, v11, v6, v8);
}

- (int64_t)_interfaceIdiomToUse
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  int64_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RemindersListAddPersonController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollection"));

  v5 = objc_msgSend(v4, "horizontalSizeClass");
  v6 = objc_msgSend(v4, "verticalSizeClass");
  v7 = 1;
  if (v5 != (id)2)
    v7 = -1;
  if (v6 == (id)2 && v5 == (id)1)
    v9 = 0;
  else
    v9 = v7;

  return v9;
}

- (id)_shadowView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  MFSearchShadowView *shadowView;
  MFSearchShadowView *v11;
  MFSearchShadowView *v12;
  MFSearchShadowView *v13;
  void *v14;
  CGRect v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RemindersListAddPersonController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[UIScrollView frame](self->_composeScrollView, "frame");
  v8 = CGRectGetMaxY(v16) + -1.0;
  +[MFSearchShadowView defaultHeight](MFSearchShadowView, "defaultHeight");
  shadowView = self->_shadowView;
  if (shadowView)
  {
    -[MFSearchShadowView setFrame:](shadowView, "setFrame:", v5, v8, v7, v9);
  }
  else
  {
    v11 = (MFSearchShadowView *)objc_msgSend(objc_alloc((Class)MFSearchShadowView), "initWithFrame:", v5, v8, v7, v9);
    v12 = self->_shadowView;
    self->_shadowView = v11;

    -[MFSearchShadowView setAutoresizingMask:](self->_shadowView, "setAutoresizingMask:", 2);
    v13 = self->_shadowView;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MFSearchShadowView setBackgroundColor:](v13, "setBackgroundColor:", v14);

  }
  return self->_shadowView;
}

- (id)_searchResultsView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UITableView *v12;
  UITableView *searchResultsView;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double MaxY;
  double MinY;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  UITableView *v50;
  double v52;
  double v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RemindersListAddPersonController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (!self->_searchResultsView)
  {
    v12 = (UITableView *)objc_claimAutoreleasedReturnValue(-[CNAutocompleteResultsTableViewController tableView](self->_searchResultsViewController, "tableView"));
    searchResultsView = self->_searchResultsView;
    self->_searchResultsView = v12;

    -[UITableView setAutoresizingMask:](self->_searchResultsView, "setAutoresizingMask:", 34);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RemindersListAddPersonController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RemindersListAddPersonController view](self, "view"));
  v52 = v5;
  v53 = v9;
  objc_msgSend(v15, "convertRect:fromView:", v16, v5, v7, v9, v11);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RemindersListAddPersonController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "window"));
  -[UIScrollView bounds](self->_composeScrollView, "bounds");
  objc_msgSend(v26, "convertRect:fromView:", self->_composeScrollView);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  v54.origin.x = v28;
  v54.origin.y = v30;
  v54.size.width = v32;
  v54.size.height = v34;
  MaxY = CGRectGetMaxY(v54);
  v55.origin.x = v18;
  v55.origin.y = v20;
  v55.size.width = v22;
  v55.size.height = v24;
  MinY = CGRectGetMaxY(v55);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard"));
  v38 = v37;
  if (v37)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "window"));
    objc_msgSend(v38, "bounds");
    objc_msgSend(v39, "convertRect:fromView:", v38);
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;

    v56.origin.x = v41;
    v56.origin.y = v43;
    v56.size.width = v45;
    v56.size.height = v47;
    MinY = CGRectGetMinY(v56);
  }
  -[UIScrollView frame](self->_composeScrollView, "frame");
  v48 = CGRectGetMaxY(v57);
  if (MinY - MaxY >= 0.0)
    v49 = MinY - MaxY;
  else
    v49 = 0.0;
  -[UITableView setFrame:](self->_searchResultsView, "setFrame:", v52, v48, v53, v49);
  v50 = self->_searchResultsView;

  return v50;
}

- (void)_showSearchField
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  self->_showingSearchField = 1;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RemindersListAddPersonController _searchResultsView](self, "_searchResultsView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "superview"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RemindersListAddPersonController view](self, "view"));
    objc_msgSend(v4, "addSubview:", self->_searchResultsView);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RemindersListAddPersonController _shadowView](self, "_shadowView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RemindersListAddPersonController view](self, "view"));
    objc_msgSend(v7, "addSubview:", self->_shadowView);

  }
  -[CNComposeRecipientTextView setSeparatorHidden:](self->_composeView, "setSeparatorHidden:", 1);

}

- (void)_hideSearchFieldAndCancelOutstandingSearches:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableArray *searchResults;
  NSMutableArray *displayedResults;
  void *v7;
  NSNumber *lastSearchId;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[9];

  v3 = a3;
  self->_showingSearchField = 0;
  searchResults = self->_searchResults;
  self->_searchResults = 0;

  displayedResults = self->_displayedResults;
  self->_displayedResults = 0;

  -[CNAutocompleteResultsTableViewController setRecipients:](self->_searchResultsViewController, "setRecipients:", self->_displayedResults);
  if (v3 && self->_lastSearchId)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RemindersListAddPersonController _searchManager](self, "_searchManager"));
    objc_msgSend(v7, "cancelTaskWithID:", self->_lastSearchId);

    lastSearchId = self->_lastSearchId;
    self->_lastSearchId = 0;

  }
  -[UIScrollView frame](self->_composeScrollView, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = (int)-v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RemindersListAddPersonController view](self, "view"));
  objc_msgSend(v17, "safeAreaInsets");
  v19 = v18;

  if (v16)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100031894;
    v20[3] = &unk_1005E9FA8;
    v20[4] = self;
    v20[5] = v10;
    v20[6] = v19;
    v20[7] = v12;
    v20[8] = v14;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v20, 0.2);
  }
  -[UITableView removeFromSuperview](self->_searchResultsView, "removeFromSuperview");
  -[MFSearchShadowView removeFromSuperview](self->_shadowView, "removeFromSuperview");
  -[CNComposeRecipientTextView setSeparatorHidden:](self->_composeView, "setSeparatorHidden:", 0);
}

- (double)_maxScrollerHeight
{
  int64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  v3 = -[RemindersListAddPersonController _interfaceIdiomToUse](self, "_interfaceIdiomToUse");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RemindersListAddPersonController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  if (v3 != 1)
  {
    +[UIKeyboard defaultSize](UIKeyboard, "defaultSize");
    v6 = v6 - v7;
  }

  return v6;
}

- (id)_searchManager
{
  CNAutocompleteSearchManager *v3;
  CNAutocompleteSearchManager *searchManager;
  CNAutocompleteSearchManager *v5;
  CNAutocompleteSearchManager *v6;
  void *v7;

  if (!self->_searchManager)
  {
    v3 = (CNAutocompleteSearchManager *)objc_msgSend(objc_alloc((Class)CNAutocompleteSearchManager), "initWithAutocompleteSearchType:", -[RemindersListAddPersonController allowPhoneNumbers](self, "allowPhoneNumbers"));
    searchManager = self->_searchManager;
    self->_searchManager = v3;

    v5 = self->_searchManager;
    if (self->_searchAccountID)
    {
      -[CNAutocompleteSearchManager setSearchTypes:](v5, "setSearchTypes:", 10);
      v6 = self->_searchManager;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", self->_searchAccountID));
      -[CNAutocompleteSearchManager setSearchAccountIDs:](v6, "setSearchAccountIDs:", v7);

    }
    else
    {
      -[CNAutocompleteSearchManager setSearchTypes:](v5, "setSearchTypes:", 2);
    }
  }
  return self->_searchManager;
}

- (BOOL)allowPhoneNumbers
{
  return self->_allowsPhoneNumbers;
}

- (void)searchWithText:(id)a3
{
  void *v4;
  void *v5;
  NSNumber *v6;
  NSNumber *lastSearchId;
  id v8;

  v8 = a3;
  if (self->_lastSearchId)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RemindersListAddPersonController _searchManager](self, "_searchManager"));
    objc_msgSend(v4, "cancelTaskWithID:", self->_lastSearchId);

  }
  -[NSMutableArray removeAllObjects](self->_searchResults, "removeAllObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RemindersListAddPersonController _searchManager](self, "_searchManager"));
  v6 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchForText:withAutocompleteFetchContext:consumer:", v8, 0, self));
  lastSearchId = self->_lastSearchId;
  self->_lastSearchId = v6;

}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  NSMutableArray *searchResults;
  NSMutableArray *v7;
  NSMutableArray *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(a4, "isEqual:", self->_lastSearchId) && objc_msgSend(v9, "count"))
  {
    searchResults = self->_searchResults;
    if (!searchResults)
    {
      v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v8 = self->_searchResults;
      self->_searchResults = v7;

      searchResults = self->_searchResults;
    }
    -[NSMutableArray addObjectsFromArray:](searchResults, "addObjectsFromArray:", v9);
    if (!self->_showingSearchField)
      -[RemindersListAddPersonController _showSearchField](self, "_showSearchField");
  }

}

- (void)finishedSearchingForAutocompleteResults
{
  NSMutableArray *v3;
  NSMutableArray *displayedResults;

  if (self->_showingSearchField)
  {
    v3 = (NSMutableArray *)-[NSMutableArray copy](self->_searchResults, "copy");
    displayedResults = self->_displayedResults;
    self->_displayedResults = v3;

    -[CNAutocompleteResultsTableViewController setRecipients:](self->_searchResultsViewController, "setRecipients:", self->_displayedResults);
  }
}

- (void)finishedTaskWithID:(id)a3
{
  NSNumber *lastSearchId;

  if (objc_msgSend(a3, "isEqual:", self->_lastSearchId))
  {
    lastSearchId = self->_lastSearchId;
    self->_lastSearchId = 0;

  }
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;

  v4 = (void *)objc_opt_new(CNContactPickerViewController, a2, a3);
  v14 = CNContactEmailAddressesKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  if (-[RemindersListAddPersonController allowPhoneNumbers](self, "allowPhoneNumbers"))
  {
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("emailAddresses.@count > 0"), "stringByAppendingString:", CFSTR(" || phoneNumbers.@count > 0")));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("(key == 'emailAddresses')"), "stringByAppendingString:", CFSTR(" || (key == 'phoneNumbers')")));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObject:", CNContactPhoneNumbersKey));

    v9 = CFSTR("(emailAddresses.@count + phoneNumbers.@count) == 1");
    v5 = (void *)v8;
  }
  else
  {
    v7 = CFSTR("(key == 'emailAddresses')");
    v9 = CFSTR("(emailAddresses.@count) == 1");
    v6 = CFSTR("emailAddresses.@count > 0");
  }
  objc_msgSend(v4, "setDelegate:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v6));
  objc_msgSend(v4, "setPredicateForEnablingContact:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v9));
  objc_msgSend(v4, "setPredicateForSelectionOfContact:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v7));
  objc_msgSend(v4, "setPredicateForSelectionOfProperty:", v12);

  objc_msgSend(v4, "setDisplayedPropertyKeys:", v5);
  objc_msgSend(v4, "setModalPresentationStyle:", 18);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RemindersListAddPersonController navigationController](self, "navigationController"));
  objc_msgSend(v13, "presentModalViewController:withTransition:", v4, 8);

}

- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RemindersListAddPersonController navigationController](self, "navigationController", a3));
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  -[CNComposeRecipientTextView becomeFirstResponder](self->_composeView, "becomeFirstResponder");
}

- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a4;
  if (-[RemindersListAddPersonController allowPhoneNumbers](self, "allowPhoneNumbers"))
    v6 = objc_msgSend(v5, "cal_isPhoneNumber");
  else
    v6 = 0;
  v7 = objc_msgSend(objc_alloc((Class)CNComposeRecipient), "initWithContact:address:kind:", 0, v5, v6);

  return v7;
}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(a3, "removeRecipient:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RemindersListAddPersonController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CNComposeRecipientTextView recipients](self->_composeView, "recipients"));
  objc_msgSend(v6, "controller:didUpdateRecipients:", self, v5);

}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((-[UITableView isDragging](self->_searchResultsView, "isDragging") & 1) == 0)
  {
    objc_msgSend(v7, "clearText");
    -[RemindersListAddPersonController _hideSearchFieldAndCancelOutstandingSearches:](self, "_hideSearchFieldAndCancelOutstandingSearches:", 1);
    objc_msgSend(v7, "addAddress:", v6);
  }

}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(a3, "invalidateAtomPresentationOptionsForRecipient:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RemindersListAddPersonController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CNComposeRecipientTextView recipients](self->_composeView, "recipients"));
  objc_msgSend(v6, "controller:didUpdateRecipients:", self, v5);

}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id v5;

  v5 = a4;
  if (objc_msgSend(v5, "length"))
    -[RemindersListAddPersonController searchWithText:](self, "searchWithText:", v5);
  else
    -[RemindersListAddPersonController _hideSearchFieldAndCancelOutstandingSearches:](self, "_hideSearchFieldAndCancelOutstandingSearches:", 1);

}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  double height;
  CGFloat width;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[11];

  if (!self->_showingSearchField)
  {
    height = a4.height;
    width = a4.width;
    -[CNComposeRecipientTextView frame](self->_composeView, "frame", a3);
    if (v10 != height)
    {
      v11 = v7;
      v12 = v8;
      v13 = v9;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CNComposeRecipientTextView addButton](self->_composeView, "addButton"));
      objc_msgSend(v14, "setAlpha:", 0.0);

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100032140;
      v16[3] = &unk_1005E9FD0;
      v16[4] = self;
      v16[5] = v11;
      v16[6] = v12;
      v16[7] = v13;
      *(double *)&v16[8] = height;
      *(CGFloat *)&v16[9] = width;
      *(double *)&v16[10] = height;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10003221C;
      v15[3] = &unk_1005EA020;
      v15[4] = self;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v16, v15, 0.2);
    }
  }
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  CNComposeRecipientTextView *composeView;
  id v7;

  if (a4)
  {
    composeView = self->_composeView;
    v7 = a4;
    -[CNComposeRecipientTextView clearText](composeView, "clearText");
    -[RemindersListAddPersonController _hideSearchFieldAndCancelOutstandingSearches:](self, "_hideSearchFieldAndCancelOutstandingSearches:", 1);
    -[CNComposeRecipientTextView addRecipient:](self->_composeView, "addRecipient:", v7);

  }
}

- (id)recipientFromContact:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "emailAddresses"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "emailAddresses"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));

LABEL_5:
    goto LABEL_6;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "phoneNumbers"));
  v8 = objc_msgSend(v9, "count");

  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "phoneNumbers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "value"));

    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));
    goto LABEL_5;
  }
LABEL_6:
  v12 = objc_msgSend(objc_alloc((Class)CNComposeRecipient), "initWithContact:address:kind:", v3, v8, v5 == 0);

  return v12;
}

- (void)addContact:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RemindersListAddPersonController recipientFromContact:](self, "recipientFromContact:", a3));
  -[CNComposeRecipientTextView addRecipient:](self->_composeView, "addRecipient:", v4);

}

- (void)contactPickerDidCancel:(id)a3
{
  -[RemindersListAddPersonController composeRecipientViewDidFinishPickingRecipient:](self, "composeRecipientViewDidFinishPickingRecipient:", self->_composeView);
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  -[RemindersListAddPersonController addContact:](self, "addContact:", a4);
  -[RemindersListAddPersonController composeRecipientViewDidFinishPickingRecipient:](self, "composeRecipientViewDidFinishPickingRecipient:", self->_composeView);
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v13 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "key"));
  v6 = objc_msgSend(v5, "isEqualToString:", CNContactEmailAddressesKey);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));
  v8 = v7;
  if ((v6 & 1) == 0)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));

    v8 = (void *)v9;
  }
  v10 = objc_alloc((Class)CNComposeRecipient);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contact"));
  v12 = objc_msgSend(v10, "initWithContact:address:kind:", v11, v8, v6 ^ 1);

  -[CNComposeRecipientTextView addRecipient:](self->_composeView, "addRecipient:", v12);
  -[RemindersListAddPersonController composeRecipientViewDidFinishPickingRecipient:](self, "composeRecipientViewDidFinishPickingRecipient:", self->_composeView);

}

- (void)commit
{
  CNComposeRecipientTextView *composeView;
  CNComposeRecipientTextView *v3;

  composeView = self->_composeView;
  if (composeView)
    composeView = (CNComposeRecipientTextView *)objc_claimAutoreleasedReturnValue(-[CNComposeRecipientTextView textView](composeView, "textView"));
  v3 = composeView;
  if (-[CNComposeRecipientTextView isFirstResponder](composeView, "isFirstResponder"))
    -[CNComposeRecipientTextView resignFirstResponder](v3, "resignFirstResponder");

}

- (id)recipients
{
  return -[CNComposeRecipientTextView recipients](self->_composeView, "recipients");
}

- (NSString)searchAccountID
{
  return self->_searchAccountID;
}

- (void)setSearchAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (RemindersContactEditorDelegate)delegate
{
  return (RemindersContactEditorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchAccountID, 0);
  objc_storeStrong((id *)&self->_lastSearchId, 0);
  objc_storeStrong((id *)&self->_displayedResults, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_searchResultsView, 0);
  objc_storeStrong((id *)&self->_searchResultsViewController, 0);
  objc_storeStrong((id *)&self->_composeScrollView, 0);
  objc_storeStrong((id *)&self->_composeView, 0);
}

@end
